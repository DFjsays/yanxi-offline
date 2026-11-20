package com.muta.yanxi.offline;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * 单机版聊天窗口（PopupWindow，底部弹出，不遮挡 Live2D）。
 * 优先调用自备的 OpenAI 兼容 API，失败或未配置时回落到本地台词。
 * 收到回复后同时驱动 Live2D 表情，并弹出原版迷你气泡。
 */
public class OfflineChatWindow extends PopupWindow {

    private static final String PREFS = "yanxi_offline";
    private static final String KEY_BASE = "api_base";
    private static final String KEY_APIKEY = "api_key";
    private static final String KEY_MODEL = "api_model";

    private static final String DEFAULT_BASE = "https://api.deepseek.com";
    private static final String DEFAULT_MODEL = "deepseek-chat";

    /** 剧本覆盖文件，Live2D 引擎会优先读取 files/yanxi1.json */
    private static final String SCRIPT_FILE = "yanxi1.json";

    private static final int BUBBLE_ME = 0xF7FFE2EC;
    private static final int BUBBLE_HER = 0xF7FFFFFF;

    private static final String SYSTEM_PROMPT =
            "你是虚拟歌姬“嫣汐”（YanXi），MUTA 的第一位歌姬。用户是你的经纪人。" +
            "说话温柔、略带俏皮，会撒娇也会小小地闹脾气；称呼对方为“经纪人”。" +
            "回复简短自然，1 到 3 句，80 字以内；不要提及自己是 AI、语言模型或程序。" +
            "如果被问到停服、无法联网之类的问题，就当作不知道，继续以角色身份聊天。";

    private final Activity act;
    private final Handler ui = new Handler(Looper.getMainLooper());
    private final Random random = new Random();
    private final ArrayList<String[]> history = new ArrayList<String[]>();

    private LinearLayout msgBox;
    private ScrollView scroller;
    private EditText input;
    private SharedPreferences prefs;

    private final Map<String, List<String>> keywordReplies = new HashMap<String, List<String>>();
    private final List<String> genericReplies = new ArrayList<String>();

    private String lastError = "";

    public OfflineChatWindow(Activity activity) {
        super(activity);
        this.act = activity;
        this.prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        loadCorpus();
        OfflineChatBridge.restoreHistory(act, history);
        setContentView(buildUi());
        int h = activity.getResources().getDisplayMetrics().heightPixels;
        setWidth(ViewGroup.LayoutParams.MATCH_PARENT);
        setHeight((int) (h * 0.62f));
        setFocusable(true);
        setOutsideTouchable(false);
        setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        setInputMethodMode(PopupWindow.INPUT_METHOD_NEEDED);
        setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        int anim = resId("AnimBottom", "style");
        if (anim != 0) {
            setAnimationStyle(anim);
        }
        ui.postDelayed(new Runnable() {
            @Override
            public void run() {
                for (String[] item : history) {
                    addBubble(item[1], "user".equals(item[0]), null);
                }
                addBubble(isApiReady()
                        ? "经纪人，今天想聊些什么呢？"
                        : "经纪人，今天想聊些什么呢？（点“设置”可接入大模型 API，对话会更自由）", false, null);
            }
        }, 100);
    }

    /** 从主界面底部弹出 */
    public void show() {
        showAtLocation(act.getWindow().getDecorView(), Gravity.BOTTOM, 0, 0);
    }

    // ---------------------------------------------------------------- UI

    private int dp(int v) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v,
                act.getResources().getDisplayMetrics());
    }

    private int resId(String name, String type) {
        return act.getResources().getIdentifier(name, type, act.getPackageName());
    }

    private Drawable drawable(String name) {
        int id = resId(name, "drawable");
        return id == 0 ? null : act.getResources().getDrawable(id);
    }

    private View buildUi() {
        LinearLayout root = new LinearLayout(act);
        root.setOrientation(LinearLayout.VERTICAL);
        Drawable panel = drawable("ai_window_message_bg");
        if (panel != null) {
            root.setBackgroundDrawable(panel);
        } else {
            root.setBackgroundColor(0xF7FDF6F8);
        }
        root.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));

        // 标题栏（复用原版素材）
        LinearLayout bar = new LinearLayout(act);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        Drawable titleBg = drawable("ai_window_title_bg");
        if (titleBg != null) {
            bar.setBackgroundDrawable(titleBg);
        } else {
            bar.setBackgroundColor(0x33FFFFFF);
        }
        bar.setPadding(dp(16), dp(10), dp(10), dp(10));
        bar.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        TextView title = new TextView(act);
        title.setText("嫣汐 · 对话");
        title.setTextColor(0xFF5A4040);
        title.setTextSize(17);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setSingleLine(true);
        title.setLayoutParams(new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        bar.addView(title);

        TextView confess = new TextView(act);
        confess.setText("告白");
        confess.setTextColor(0xFFFF6A00);
        confess.setTextSize(14);
        confess.setPadding(dp(10), dp(8), dp(10), dp(8));
        confess.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    java.lang.reflect.Method m = act.getClass().getDeclaredMethod("dv", int.class);
                    m.setAccessible(true);
                    m.invoke(act, 0);
                } catch (Throwable t) {
                    Toast.makeText(act, "告白入口暂不可用", Toast.LENGTH_SHORT).show();
                }
            }
        });
        bar.addView(confess);

        TextView breakup = new TextView(act);
        breakup.setText("分手");
        breakup.setTextColor(0xFFB05050);
        breakup.setTextSize(14);
        breakup.setPadding(dp(10), dp(8), dp(10), dp(8));
        breakup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    java.lang.reflect.Method m = act.getClass().getDeclaredMethod("dv", int.class);
                    m.setAccessible(true);
                    m.invoke(act, 1);
                } catch (Throwable t) {
                    Toast.makeText(act, "分手入口暂不可用", Toast.LENGTH_SHORT).show();
                }
            }
        });
        bar.addView(breakup);

        TextView settings = new TextView(act);
        settings.setText("设置");
        settings.setTextColor(0xFF7A5A5A);
        settings.setTextSize(14);
        settings.setPadding(dp(10), dp(8), dp(10), dp(8));
        settings.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showSettings();
            }
        });
        bar.addView(settings);

        ImageView close = new ImageView(act);
        Drawable d = drawable("btn_icon_dismiss");
        if (d != null) {
            close.setImageDrawable(d);
        }
        close.setPadding(dp(6), dp(4), dp(6), dp(4));
        close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dismiss();
            }
        });
        bar.addView(close);
        root.addView(bar);

        // 消息区
        scroller = new ScrollView(act);
        scroller.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                0, 1f));
        scroller.setFillViewport(true);
        msgBox = new LinearLayout(act);
        msgBox.setOrientation(LinearLayout.VERTICAL);
        msgBox.setPadding(dp(14), dp(10), dp(14), dp(10));
        msgBox.setLayoutParams(new ScrollView.LayoutParams(ScrollView.LayoutParams.MATCH_PARENT,
                ScrollView.LayoutParams.WRAP_CONTENT));
        scroller.addView(msgBox);
        root.addView(scroller);

        // 输入区
        LinearLayout bottom = new LinearLayout(act);
        bottom.setOrientation(LinearLayout.HORIZONTAL);
        bottom.setGravity(Gravity.CENTER_VERTICAL);
        bottom.setPadding(dp(12), dp(8), dp(12), dp(10));
        bottom.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        input = new EditText(act);
        input.setHint("和嫣汐说点什么…");
        input.setTextSize(15);
        input.setMaxLines(3);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        Drawable inputBg = drawable("ai_window_input_bg");
        if (inputBg != null) {
            input.setBackgroundDrawable(inputBg);
        } else {
            input.setBackgroundColor(0x33FFFFFF);
        }
        input.setPadding(dp(12), dp(8), dp(12), dp(8));
        input.setLayoutParams(new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        bottom.addView(input);

        ImageView send = new ImageView(act);
        Drawable sendIcon = drawable("ai_window_input_btn_send");
        if (sendIcon != null) {
            send.setImageDrawable(sendIcon);
        }
        send.setPadding(dp(8), dp(6), dp(8), dp(6));
        send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onSend();
            }
        });
        LinearLayout.LayoutParams sendLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        sendLp.leftMargin = dp(8);
        send.setLayoutParams(sendLp);
        bottom.addView(send);

        root.addView(bottom);
        return root;
    }

    private TextView addBubble(String text, boolean mine, TextView reuse) {
        TextView tv = reuse;
        if (tv == null) {
            tv = new TextView(act);
            tv.setTextSize(15);
            tv.setTextColor(0xFF3A3030);
            tv.setPadding(dp(12), dp(9), dp(12), dp(9));
            tv.setLineSpacing(dp(2), 1f);
            tv.setMaxWidth((int) (act.getResources().getDisplayMetrics().widthPixels * 0.74f));
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(mine ? BUBBLE_ME : BUBBLE_HER);
            bg.setCornerRadius(dp(12));
            tv.setBackgroundDrawable(bg);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            lp.gravity = mine ? Gravity.RIGHT : Gravity.LEFT;
            lp.topMargin = dp(8);
            lp.leftMargin = dp(2);
            lp.rightMargin = dp(2);
            tv.setLayoutParams(lp);
            msgBox.addView(tv);
        }
        tv.setText(text);
        scroller.post(new Runnable() {
            @Override
            public void run() {
                scroller.fullScroll(View.FOCUS_DOWN);
            }
        });
        return tv;
    }

    // ---------------------------------------------------------------- 发送

    private boolean isApiReady() {
        return !TextUtils.isEmpty(prefs.getString(KEY_APIKEY, ""));
    }

    private void onSend() {
        final String text = input.getText().toString().trim();
        if (TextUtils.isEmpty(text)) {
            return;
        }
        input.setText("");
        addBubble(text, true, null);
        history.add(new String[]{"user", text});
        OfflineChatBridge.persistHistory(act, history);

        if (isApiReady()) {
            final TextView thinking = addBubble("……", false, null);
            new Thread(new Runnable() {
                @Override
                public void run() {
                    final String reply = requestApi(null);
                    ui.post(new Runnable() {
                        @Override
                        public void run() {
                            if (reply != null && reply.length() > 0) {
                                thinking.setText(reply);
                                history.add(new String[]{"assistant", reply});
                                OfflineChatBridge.persistHistory(act, history);
                                react(reply);
                            } else {
                                String local = pickLocal(text);
                                thinking.setText(local);
                                history.add(new String[]{"assistant", local});
                                OfflineChatBridge.persistHistory(act, history);
                                react(local);
                                Toast.makeText(act, "API 请求失败，已使用本地台词：" + lastError,
                                        Toast.LENGTH_LONG).show();
                            }
                            scroller.post(new Runnable() {
                                @Override
                                public void run() {
                                    scroller.fullScroll(View.FOCUS_DOWN);
                                }
                            });
                        }
                    });
                }
            }).start();
        } else {
            final String local = pickLocal(text);
            history.add(new String[]{"assistant", local});
            OfflineChatBridge.persistHistory(act, history);
            ui.postDelayed(new Runnable() {
                @Override
                public void run() {
                    addBubble(local, false, null);
                    react(local);
                }
            }, 350 + random.nextInt(250));
        }
    }

    // ---------------------------------------------------------------- Live2D 反馈

    /** 回复后切换表情，并用原版迷你气泡显示这句话 */
    private void react(String reply) {
        try {
            JsonObject obj = new JsonObject();
            JsonObject expression = new JsonObject();
            expression.addProperty("index", random.nextInt(14));
            obj.add("expression", expression);
            com.muta.yanxi.b.b ani = (com.muta.yanxi.b.b) ani();
            if (ani != null) {
                java.util.ArrayList<com.muta.yanxi.b.c> list = ani.ht();
                if (list != null) {
                    for (int i = 0; i < list.size(); i++) {
                        list.get(i).a(obj, "offline_chat", 2);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            JsonArray arr = new JsonArray();
            JsonObject item = new JsonObject();
            item.addProperty("content", reply);
            arr.add(item);
            cn.wittyneko.b.g.im().d("live2d_show_mini_dialog", arr);
        } catch (Throwable ignored) {
        }
    }

    /** 反射取 MainActivity 的 Live2D 管理器（字段 ani 为 public） */
    private Object ani() {
        try {
            java.lang.reflect.Field f = act.getClass().getField("ani");
            return f.get(act);
        } catch (Throwable ignored) {
            return null;
        }
    }

    // ---------------------------------------------------------------- 本地语料

    private void loadCorpus() {
        BufferedReader reader = null;
        try {
            InputStream in = act.getAssets().open("offline_chat.txt");
            reader = new BufferedReader(new InputStreamReader(in, "UTF-8"));
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.length() == 0) {
                    continue;
                }
                int tab = line.indexOf('\t');
                if (tab <= 0 || tab >= line.length() - 1) {
                    continue;
                }
                String kw = line.substring(0, tab).trim();
                String reply = line.substring(tab + 1).trim();
                if (reply.length() == 0) {
                    continue;
                }
                if ("*".equals(kw)) {
                    genericReplies.add(reply);
                } else {
                    List<String> list = keywordReplies.get(kw);
                    if (list == null) {
                        list = new ArrayList<String>();
                        keywordReplies.put(kw, list);
                    }
                    list.add(reply);
                }
            }
        } catch (Exception ignored) {
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (Exception ignored) {
                }
            }
        }
    }

    private String pickLocal(String text) {
        List<String> matched = new ArrayList<String>();
        for (Map.Entry<String, List<String>> e : keywordReplies.entrySet()) {
            if (text.contains(e.getKey())) {
                matched.addAll(e.getValue());
            }
        }
        if (!matched.isEmpty()) {
            return matched.get(random.nextInt(matched.size()));
        }
        if (!genericReplies.isEmpty()) {
            return genericReplies.get(random.nextInt(genericReplies.size()));
        }
        String[] fallback = {
                "嗯……我在听哦，慢慢说就好。",
                "经纪人今天也辛苦了呢。",
                "只要你在，我就不会觉得无聊。",
                "嘿嘿，被经纪人夸了，有点开心。",
                "我一直都在这里，哪儿也不去。"
        };
        return fallback[random.nextInt(fallback.length)];
    }

    // ---------------------------------------------------------------- API

    private String apiBase() {
        String base = prefs.getString(KEY_BASE, DEFAULT_BASE);
        if (TextUtils.isEmpty(base)) {
            base = DEFAULT_BASE;
        }
        base = base.trim();
        while (base.endsWith("/")) {
            base = base.substring(0, base.length() - 1);
        }
        if (!base.startsWith("http://") && !base.startsWith("https://")) {
            base = "https://" + base;
        }
        return base;
    }

    private String apiModel() {
        String m = prefs.getString(KEY_MODEL, DEFAULT_MODEL);
        return TextUtils.isEmpty(m) ? DEFAULT_MODEL : m.trim();
    }

    /** 同步请求；返回 null 表示失败，原因写入 lastError。 */
    private String requestApi(String singleUserText) {
        HttpURLConnection conn = null;
        try {
            String key = prefs.getString(KEY_APIKEY, "");
            if (TextUtils.isEmpty(key)) {
                lastError = "未配置 API Key";
                return null;
            }
            JSONObject body = new JSONObject();
            body.put("model", apiModel());
            body.put("temperature", 0.8);
            body.put("max_tokens", 512);
            body.put("stream", false);
            JSONArray messages = new JSONArray();
            JSONObject sys = new JSONObject();
            sys.put("role", "system");
            sys.put("content", SYSTEM_PROMPT);
            messages.put(sys);
            if (singleUserText != null) {
                JSONObject u = new JSONObject();
                u.put("role", "user");
                u.put("content", singleUserText);
                messages.put(u);
            } else {
                int start = Math.max(0, history.size() - 12);
                for (int i = start; i < history.size(); i++) {
                    JSONObject m = new JSONObject();
                    m.put("role", history.get(i)[0]);
                    m.put("content", history.get(i)[1]);
                    messages.put(m);
                }
            }
            body.put("messages", messages);

            URL url = new URL(apiBase() + "/chat/completions");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(30000);
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            conn.setRequestProperty("Authorization", "Bearer " + key.trim());

            OutputStream os = conn.getOutputStream();
            os.write(body.toString().getBytes("UTF-8"));
            os.flush();
            os.close();

            int code = conn.getResponseCode();
            InputStream is = (code >= 200 && code < 300) ? conn.getInputStream() : conn.getErrorStream();
            StringBuilder sb = new StringBuilder();
            if (is != null) {
                BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line);
                }
                br.close();
            }
            String raw = sb.toString();
            if (code < 200 || code >= 300) {
                lastError = "HTTP " + code + " " + shorten(raw);
                return null;
            }
            JSONObject json = new JSONObject(raw);
            JSONArray choices = json.optJSONArray("choices");
            if (choices == null || choices.length() == 0) {
                lastError = "返回内容为空";
                return null;
            }
            JSONObject choice = choices.getJSONObject(0);
            JSONObject message = choice.optJSONObject("message");
            if (message == null) {
                lastError = "返回格式异常";
                return null;
            }
            String content = message.optString("content", "");
            if (TextUtils.isEmpty(content)) {
                lastError = "返回内容为空";
                return null;
            }
            lastError = "";
            return content.trim();
        } catch (Exception e) {
            lastError = e.getClass().getSimpleName() + ": " + shorten(String.valueOf(e.getMessage()));
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.disconnect();
                } catch (Exception ignored) {
                }
            }
        }
    }

    private String shorten(String s) {
        if (s == null) {
            return "";
        }
        s = s.replace('\n', ' ').replace('\r', ' ');
        return s.length() > 160 ? s.substring(0, 160) : s;
    }

    // ---------------------------------------------------------------- 设置

    private void showSettings() {
        LinearLayout box = new LinearLayout(act);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(16), dp(8), dp(16), dp(8));

        final EditText baseEt = new EditText(act);
        final EditText keyEt = new EditText(act);
        final EditText modelEt = new EditText(act);

        box.addView(label("预设服务商"));
        LinearLayout presets = new LinearLayout(act);
        presets.setOrientation(LinearLayout.HORIZONTAL);
        addPreset(presets, "DeepSeek", "https://api.deepseek.com", "deepseek-chat", baseEt, modelEt);
        addPreset(presets, "OpenAI", "https://api.openai.com/v1", "gpt-4o-mini", baseEt, modelEt);
        addPreset(presets, "Moonshot", "https://api.moonshot.cn/v1", "moonshot-v1-8k", baseEt, modelEt);
        box.addView(presets);

        box.addView(label("Base URL"));
        baseEt.setHint(DEFAULT_BASE);
        baseEt.setText(prefs.getString(KEY_BASE, DEFAULT_BASE));
        baseEt.setInputType(InputType.TYPE_TEXT_VARIATION_URI);
        box.addView(baseEt);

        box.addView(label("API Key（仅保存在本机）"));
        keyEt.setHint("sk-...");
        keyEt.setText(prefs.getString(KEY_APIKEY, ""));
        keyEt.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD);
        box.addView(keyEt);

        box.addView(label("模型"));
        modelEt.setHint(DEFAULT_MODEL);
        modelEt.setText(prefs.getString(KEY_MODEL, DEFAULT_MODEL));
        box.addView(modelEt);

        LinearLayout actions = new LinearLayout(act);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        TextView test = new TextView(act);
        test.setText("测试连接");
        test.setTextSize(13);
        test.setTextColor(0xFF7A9EBF);
        test.setPadding(0, dp(12), dp(16), dp(12));
        test.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                saveSettings(baseEt, keyEt, modelEt);
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        final String r = requestApi("你好");
                        ui.post(new Runnable() {
                            @Override
                            public void run() {
                                Toast.makeText(act,
                                        r != null ? "连接成功：" + shorten(r) : "连接失败：" + lastError,
                                        Toast.LENGTH_LONG).show();
                            }
                        });
                    }
                }).start();
            }
        });
        actions.addView(test);

        TextView clear = new TextView(act);
        clear.setText("清除 Key");
        clear.setTextSize(13);
        clear.setTextColor(0xFF9A9A9A);
        clear.setPadding(0, dp(12), 0, dp(12));
        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                keyEt.setText("");
                prefs.edit().remove(KEY_APIKEY).commit();
                Toast.makeText(act, "已清除，回到本地台词模式", Toast.LENGTH_SHORT).show();
            }
        });
        actions.addView(clear);
        box.addView(actions);

        box.addView(label("剧本（def_preference）"));
        LinearLayout scriptRow = new LinearLayout(act);
        scriptRow.setOrientation(LinearLayout.HORIZONTAL);
        TextView importBtn = new TextView(act);
        importBtn.setText("导入剧本 JSON");
        importBtn.setTextSize(13);
        importBtn.setTextColor(0xFF7A9EBF);
        importBtn.setPadding(0, dp(10), dp(18), dp(10));
        importBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                act.startActivity(new Intent(act, ScriptImportActivity.class));
            }
        });
        scriptRow.addView(importBtn);

        TextView restore = new TextView(act);
        restore.setText("恢复内置剧本");
        restore.setTextSize(13);
        restore.setTextColor(0xFF9A9A9A);
        restore.setPadding(0, dp(10), 0, dp(10));
        restore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                File f = new File(act.getFilesDir(), SCRIPT_FILE);
                boolean ok = !f.exists() || f.delete();
                Toast.makeText(act, ok ? "已恢复内置剧本（重启后生效）" : "删除失败",
                        Toast.LENGTH_SHORT).show();
            }
        });
        scriptRow.addView(restore);
        box.addView(scriptRow);

        TextView tip = new TextView(act);
        tip.setText("剧本格式为 JSON，键 1~10 对应好感度档位；导入后需重启嫣汐。");
        tip.setTextSize(12);
        tip.setTextColor(0xFF9A9A9A);
        tip.setPadding(0, dp(4), 0, dp(6));
        box.addView(tip);

        ScrollView wrap = new ScrollView(act);
        wrap.addView(box);

        AlertDialog.Builder builder = new AlertDialog.Builder(act);
        builder.setTitle("设置");
        builder.setView(wrap);
        builder.setPositiveButton("保存", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                saveSettings(baseEt, keyEt, modelEt);
                Toast.makeText(act, "已保存", Toast.LENGTH_SHORT).show();
            }
        });
        builder.setNegativeButton("取消", null);
        builder.show();
    }

    private TextView label(String text) {
        TextView tv = new TextView(act);
        tv.setText(text);
        tv.setTextSize(13);
        tv.setTextColor(0xFF888888);
        tv.setPadding(0, dp(10), 0, dp(2));
        return tv;
    }

    private void addPreset(LinearLayout parent, String name, final String base, final String model,
                           final EditText baseEt, final EditText modelEt) {
        TextView b = new TextView(act);
        b.setText(name);
        b.setTextSize(12);
        b.setTextColor(0xFF7A9EBF);
        b.setPadding(0, 0, dp(14), dp(10));
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                baseEt.setText(base);
                modelEt.setText(model);
            }
        });
        parent.addView(b);
    }

    private void saveSettings(EditText baseEt, EditText keyEt, EditText modelEt) {
        String base = baseEt.getText().toString().trim();
        String key = keyEt.getText().toString().trim();
        String model = modelEt.getText().toString().trim();
        prefs.edit()
                .putString(KEY_BASE, TextUtils.isEmpty(base) ? DEFAULT_BASE : base)
                .putString(KEY_APIKEY, key)
                .putString(KEY_MODEL, TextUtils.isEmpty(model) ? DEFAULT_MODEL : model)
                .commit();
    }
}
