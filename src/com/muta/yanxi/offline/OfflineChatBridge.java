package com.muta.yanxi.offline;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * 把原版 AI 面板（com.muta.yanxi.view.c.a）的收发链路接管为离线实现。
 * 原面板的 AIMessageList.a(...) 依赖环信会话，离线必失败，故这里反射取内部 ListView，
 * 用自带的 BaseAdapter 覆盖，并复用原版行布局与气泡底图。
 */
public final class OfflineChatBridge {

    private static final String PREFS = "yanxi_offline";
    private static final String KEY_BASE = "api_base";
    private static final String KEY_APIKEY = "api_key";
    private static final String KEY_MODEL = "api_model";
    /** 简易记忆插件：最近对话与用户主动要求记住的要点。 */
    private static final String KEY_LOG = "memory_log";
    private static final String KEY_NOTES = "memory_notes";
    private static final int MAX_LOG = 80;
    private static final int MAX_NOTES = 20;

    private static final String DEFAULT_BASE = "https://api.deepseek.com";
    private static final String DEFAULT_MODEL = "deepseek-chat";

    private static final String SYSTEM_PROMPT =
            "你是虚拟歌姬“嫣汐”（YanXi），MUTA 的第一位歌姬。用户是你的经纪人。" +
            "说话温柔、略带俏皮，会撒娇也会小小地闹脾气；称呼对方为“经纪人”。" +
            "回复简短自然，1 到 3 句，80 字以内；不要提及自己是 AI、语言模型或程序。" +
            "如果被问到停服、无法联网之类的问题，就当作不知道，继续以角色身份聊天。";

    private static final Random RANDOM = new Random();
    private static final ArrayList<String[]> HISTORY = new ArrayList<String[]>();
    private static final Map<String, List<String>> KEYWORDS = new HashMap<String, List<String>>();
    private static final List<String> GENERIC = new ArrayList<String>();

    private static Object sPanel;
    private static Activity sAct;
    private static ListView sList;
    private static ChatAdapter sAdapter;
    private static Handler sUi;
    private static SharedPreferences sPrefs;
    private static ArrayList<String[]> sMessages;
    private static boolean sCorpusLoaded = false;
    private static String sLastError = "";

    private OfflineChatBridge() {
    }

    public static boolean attach(java.lang.Object panel) {
        try {
            if (panel == null) {
                return false;
            }
            Activity act = (Activity) field(panel, "asf");
            Object msgList = field(panel, "ahe");
            ListView lv = null;
            try {
                lv = (ListView) field(msgList, "aaD");
            } catch (Throwable ignored) {
            }
            if ((lv == null || msgList == null) && panel != null) {
                View root = (View) field(panel, "ash");
                lv = findListView(root);
            }
            if (act == null || lv == null) {
                return false;
            }
            sPanel = panel;
            sAct = act;
            sUi = new Handler(Looper.getMainLooper());
            sPrefs = act.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            if (!sCorpusLoaded) {
                loadCorpus(act);
                sCorpusLoaded = true;
            }
            sMessages = new ArrayList<String[]>();
            HISTORY.clear();
            loadMemory(act);
            ChatAdapter adapter = new ChatAdapter(act, sMessages);
            lv.setAdapter(adapter);
            if (adapter.getCount() > 0) {
                lv.setSelection(adapter.getCount() - 1);
            }
            sAdapter = adapter;
            sList = lv;
            installConfession(panel, act);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean onInput(java.lang.Object panel, java.lang.String text) {
        try {
            if (sAdapter == null || sList == null || sMessages == null) {
                return false;
            }
            final String userText = text == null ? "" : text.trim();
            if (userText.length() == 0) {
                return true;
            }
            clearInput(panel);
            push("me", userText);
            remember("user", userText);
            catchMemory(userText);

            final Handler ui = sUi;
            if (ui == null) {
                return true;
            }
            if (isApiReady()) {
                final String[] slot = push("her", "……");
                final String question = userText;
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        final String reply = requestApi();
                        ui.post(new Runnable() {
                            @Override
                            public void run() {
                                if (reply != null && reply.length() > 0) {
                                    slot[1] = reply;
                                    react(reply);
                                } else {
                                    String local = pickLocal(question);
                                    slot[1] = local;
                                    react(local);
                                    if (sAct != null) {
                                        Toast.makeText(sAct, "API 请求失败，已使用本地台词",
                                                Toast.LENGTH_LONG).show();
                                    }
                                }
                                remember("assistant", slot[1]);
                                notifyChanged();
                            }
                        });
                    }
                }).start();
            } else {
                final String local = pickLocal(userText);
                ui.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        push("her", local);
                        remember("assistant", local);
                        react(local);
                    }
                }, 350 + RANDOM.nextInt(250));
            }
            return true;
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static void onMessage(java.lang.Object panel, java.lang.Object message) {
        try {
            if (panel == null || message == null) {
                return;
            }
            Object body = call(message, "getBody");
            if (body == null) {
                body = call(message, "body");
            }
            if (body == null) {
                return;
            }
            Object text = call(body, "getText");
            if (!(text instanceof String)) {
                return;
            }
            final String content = ((String) text).trim();
            if (content.length() == 0) {
                return;
            }
            final Object target = panel;
            Handler ui = sUi;
            if (ui == null) {
                ui = new Handler(Looper.getMainLooper());
                sUi = ui;
            }
            ui.post(new Runnable() {
                @Override
                public void run() {
                    if (sAdapter == null && !attach(target)) {
                        return;
                    }
                    onInput(target, content);
                }
            });
        } catch (Throwable ignored) {
        }
    }

    public static void fallback(android.app.Activity act) {
        try {
            new OfflineChatWindow(act).show();
        } catch (Throwable ignored) {
        }
    }

    // ---------------------------------------------------------------- 告白入口

    private static ListView findListView(View v) {
        try {
            if (v instanceof ListView) {
                return (ListView) v;
            }
            if (v instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) v;
                for (int i = 0; i < g.getChildCount(); i++) {
                    ListView found = findListView(g.getChildAt(i));
                    if (found != null) {
                        return found;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /** 在原版面板标题栏挂「告白 / 分手」入口；标题栏异常时退化为面板左上方悬浮按钮。 */
    private static void installConfession(Object panel, Activity act) {
        try {
            View root = (View) field(panel, "ash");
            if (root == null) {
                return;
            }
            View title = (View) field(panel, "ask");
            if (title == null || !(title instanceof ViewGroup)) {
                int titleId = act.getResources().getIdentifier("ll_title", "id", act.getPackageName());
                title = titleId == 0 ? null : root.findViewById(titleId);
            }
            LinearLayout entry = makeEntryBar(act);
            if (title != null && title instanceof ViewGroup && addToTitle((ViewGroup) title, entry, act)) {
                return;
            }
            // 标题栏不可用时，贴在面板左上角（标题栏高度 96 以下）
            if (root instanceof RelativeLayout) {
                RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                lp.addRule(RelativeLayout.ALIGN_PARENT_LEFT);
                lp.addRule(RelativeLayout.ALIGN_PARENT_TOP);
                lp.leftMargin = dp(act, 16);
                lp.topMargin = dp(act, 104);
                ((ViewGroup) root).addView(entry, lp);
            }
        } catch (Throwable ignored) {
        }
    }

    private static LinearLayout makeEntryBar(Activity act) {
        LinearLayout bar = new LinearLayout(act);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setTag("offline_entry");
        bar.addView(makeEntryButton(act, "告白", 0, 0xFFFF6A00));
        TextView breakup = makeEntryButton(act, "分手", 1, 0xFFB05050);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = dp(act, 6);
        bar.addView(breakup, lp);
        return bar;
    }

    private static TextView makeEntryButton(Activity act, String label, final int type, int color) {
        TextView btn = new TextView(act);
        btn.setText(label);
        btn.setTextSize(14);
        btn.setTextColor(color);
        btn.setPadding(dp(act, 12), dp(act, 5), dp(act, 12), dp(act, 5));
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openEntry(v.getContext(), type);
            }
        });
        return btn;
    }

    private static boolean addToTitle(ViewGroup bar, View entry, Activity act) {
        try {
            if (bar.findViewWithTag("offline_entry") != null) {
                return true;
            }
            if (bar instanceof RelativeLayout) {
                RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                lp.addRule(RelativeLayout.ALIGN_PARENT_LEFT);
                lp.addRule(RelativeLayout.CENTER_VERTICAL);
                lp.leftMargin = dp(act, 16);
                bar.addView(entry, lp);
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /** type=0 表白、type=1 分手（对应原版输入框 mType），提交后走离线结算。 */
    private static void openEntry(Context ctx, int type) {
        try {
            java.lang.reflect.Method m = ctx.getClass().getDeclaredMethod("dv", int.class);
            m.setAccessible(true);
            m.invoke(ctx, type);
        } catch (Throwable t) {
            Toast.makeText(ctx, type == 0 ? "告白入口暂不可用" : "分手入口暂不可用",
                    Toast.LENGTH_SHORT).show();
        }
    }

    private static int dp(Context ctx, int v) {
        return (int) (v * ctx.getResources().getDisplayMetrics().density + 0.5f);
    }

    // ---------------------------------------------------------------- 记忆插件

    private static void remember(String role, String text) {
        HISTORY.add(new String[]{role, text == null ? "" : text});
        saveMemory();
    }

    /** 用户说“记住/我叫…”时，把这句话存成长期记忆，供后续对话与记忆页使用。 */
    private static void catchMemory(String text) {
        try {
            if (sPrefs == null || text == null) {
                return;
            }
            if (!text.contains("记住") && !text.contains("我叫") && !text.contains("我的名字")) {
                return;
            }
            String notes = sPrefs.getString(KEY_NOTES, "");
            notes = notes == null ? "" : notes;
            if (notes.contains(text)) {
                return;
            }
            ArrayList<String> lines = new ArrayList<String>();
            if (notes.length() > 0) {
                for (String s : notes.split("\n")) {
                    if (s.length() > 0) {
                        lines.add(s);
                    }
                }
            }
            lines.add(text);
            while (lines.size() > MAX_NOTES) {
                lines.remove(0);
            }
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < lines.size(); i++) {
                if (i > 0) {
                    sb.append('\n');
                }
                sb.append(lines.get(i));
            }
            sPrefs.edit().putString(KEY_NOTES, sb.toString()).apply();
        } catch (Throwable ignored) {
        }
    }

    /** 回灌历史：既进模型上下文（HISTORY），也直接显示到聊天列表（sMessages）。 */
    private static void loadMemory(Context ctx) {
        try {
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String log = p.getString(KEY_LOG, "");
            if (TextUtils.isEmpty(log)) {
                return;
            }
            String[] lines = log.split("\n");
            int start = Math.max(0, lines.length - MAX_LOG);
            for (int i = start; i < lines.length; i++) {
                int tab = lines[i].indexOf('\t');
                if (tab <= 0) {
                    continue;
                }
                String role = lines[i].substring(0, tab);
                String text = lines[i].substring(tab + 1);
                HISTORY.add(new String[]{role, text});
                if (sMessages != null) {
                    sMessages.add(new String[]{"user".equals(role) ? "me" : "her", text});
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static void saveMemory() {
        try {
            if (sPrefs == null) {
                return;
            }
            int start = Math.max(0, HISTORY.size() - MAX_LOG);
            StringBuilder sb = new StringBuilder();
            for (int i = start; i < HISTORY.size(); i++) {
                String[] item = HISTORY.get(i);
                if (i > start) {
                    sb.append('\n');
                }
                sb.append(item[0]).append('\t').append(item[1].replace('\n', ' '));
            }
            sPrefs.edit().putString(KEY_LOG, sb.toString()).apply();
        } catch (Throwable ignored) {
        }
    }

    /** 供自绘聊天窗复用：把已保存的对话读进目标列表（role = user / assistant）。 */
    public static void restoreHistory(Context ctx, ArrayList<String[]> out) {
        if (out == null) {
            return;
        }
        try {
            String log = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getString(KEY_LOG, "");
            if (TextUtils.isEmpty(log)) {
                return;
            }
            String[] lines = log.split("\n");
            int start = Math.max(0, lines.length - MAX_LOG);
            for (int i = start; i < lines.length; i++) {
                int tab = lines[i].indexOf('\t');
                if (tab <= 0) {
                    continue;
                }
                out.add(new String[]{lines[i].substring(0, tab), lines[i].substring(tab + 1)});
            }
        } catch (Throwable ignored) {
        }
    }

    /** 供自绘聊天窗复用：把目标列表写回记忆存档（只保留最近 MAX_LOG 条）。 */
    public static void persistHistory(Context ctx, ArrayList<String[]> src) {
        if (src == null) {
            return;
        }
        try {
            int start = Math.max(0, src.size() - MAX_LOG);
            StringBuilder sb = new StringBuilder();
            for (int i = start; i < src.size(); i++) {
                if (i > start) {
                    sb.append('\n');
                }
                sb.append(src.get(i)[0]).append('\t').append(src.get(i)[1].replace('\n', ' '));
            }
            ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putString(KEY_LOG, sb.toString()).apply();
        } catch (Throwable ignored) {
        }
    }

    /** 供个人信息页「聊天记忆」弹窗展示：长期记忆要点 + 最近几轮对话。 */
    public static String memoryDigest(Context ctx) {
        StringBuilder sb = new StringBuilder();
        try {
            SharedPreferences p = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String notes = p.getString(KEY_NOTES, "");
            if (!TextUtils.isEmpty(notes)) {
                sb.append("【她记住的事】\n").append(notes).append("\n\n");
            }
            String log = p.getString(KEY_LOG, "");
            if (!TextUtils.isEmpty(log)) {
                String[] lines = log.split("\n");
                int start = Math.max(0, lines.length - 16);
                sb.append("【最近对话】\n");
                for (int i = start; i < lines.length; i++) {
                    int tab = lines[i].indexOf('\t');
                    if (tab <= 0) {
                        continue;
                    }
                    sb.append(lines[i].startsWith("user") ? "你：" : "嫣汐：")
                            .append(lines[i].substring(tab + 1)).append('\n');
                }
            }
            if (sb.length() == 0) {
                sb.append("还没有聊天记忆，去和她聊聊吧。");
            }
        } catch (Throwable t) {
            return "读取记忆失败";
        }
        return sb.toString().trim();
    }

    // ---------------------------------------------------------------- 列表

    private static final class ChatAdapter extends BaseAdapter {

        private final Activity act;
        private final ArrayList<String[]> data;
        private final LayoutInflater inflater;
        private final int layoutMine;
        private final int layoutHer;
        private final int idText;
        private final int idTime;
        private final int idHead;
        private final int idProgress;
        private final int idAck;
        private final int idDelivered;
        private final int idStatus;

        ChatAdapter(Activity activity, ArrayList<String[]> items) {
            this.act = activity;
            this.data = items;
            this.inflater = LayoutInflater.from(activity);
            this.layoutMine = res(activity, "ai_row_sent_message", "layout");
            this.layoutHer = res(activity, "ai_row_received_message", "layout");
            this.idText = res(activity, "tv_chatcontent", "id");
            this.idTime = res(activity, "timestamp", "id");
            this.idHead = res(activity, "ll_userhead", "id");
            this.idProgress = res(activity, "progress_bar", "id");
            this.idAck = res(activity, "tv_ack", "id");
            this.idDelivered = res(activity, "tv_delivered", "id");
            this.idStatus = res(activity, "msg_status", "id");
        }

        @Override
        public int getCount() {
            return data.size();
        }

        @Override
        public Object getItem(int position) {
            return data.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public int getViewTypeCount() {
            return 2;
        }

        @Override
        public int getItemViewType(int position) {
            return "me".equals(data.get(position)[0]) ? 0 : 1;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            String[] item = data.get(position);
            boolean mine = "me".equals(item[0]);
            View row = convertView;
            int layout = mine ? layoutMine : layoutHer;
            if (row == null && layout != 0) {
                row = inflater.inflate(layout, parent, false);
            }
            if (row == null) {
                TextView plain = new TextView(act);
                plain.setText(item[1]);
                return plain;
            }
            View text = row.findViewById(idText);
            if (text instanceof TextView) {
                ((TextView) text).setText(item[1]);
            }
            View time = row.findViewById(idTime);
            if (time instanceof TextView) {
                ((TextView) time).setText("");
            }
            hide(row, idHead);
            hide(row, idProgress);
            hide(row, idAck);
            hide(row, idDelivered);
            hide(row, idStatus);
            return row;
        }

        private static void hide(View row, int id) {
            if (id == 0) {
                return;
            }
            View v = row.findViewById(id);
            if (v != null) {
                v.setVisibility(View.GONE);
            }
        }

        private static int res(Context ctx, String name, String type) {
            return ctx.getResources().getIdentifier(name, type, ctx.getPackageName());
        }
    }

    private static String[] push(String who, String text) {
        String[] item = {who, text == null ? "" : text};
        if (sMessages != null) {
            sMessages.add(item);
        }
        notifyChanged();
        return item;
    }

    private static void notifyChanged() {
        try {
            if (sAdapter == null) {
                return;
            }
            sAdapter.notifyDataSetChanged();
            if (sList != null) {
                int n = sAdapter.getCount();
                if (n > 0) {
                    sList.setSelection(n - 1);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    // ---------------------------------------------------------------- 反射工具

    private static Object field(Object target, String name) {
        if (target == null) {
            return null;
        }
        try {
            Class<?> c = target.getClass();
            while (c != null) {
                try {
                    Field f = c.getDeclaredField(name);
                    f.setAccessible(true);
                    return f.get(target);
                } catch (NoSuchFieldException e) {
                    c = c.getSuperclass();
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Object call(Object target, String method) {
        if (target == null) {
            return null;
        }
        try {
            java.lang.reflect.Method m = target.getClass().getMethod(method);
            return m.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void clearInput(Object panel) {
        try {
            Object menu = field(panel, "ahb");
            if (menu instanceof ViewGroup) {
                EditText et = findEditText((ViewGroup) menu);
                if (et != null) {
                    et.setText("");
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static EditText findEditText(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof EditText) {
                return (EditText) child;
            }
            if (child instanceof ViewGroup) {
                EditText found = findEditText((ViewGroup) child);
                if (found != null) {
                    return found;
                }
            }
        }
        return null;
    }

    // ---------------------------------------------------------------- Live2D 反馈

    private static void react(String reply) {
        try {
            JsonObject obj = new JsonObject();
            JsonObject expression = new JsonObject();
            expression.addProperty("index", RANDOM.nextInt(14));
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

    private static Object ani() {
        try {
            if (sAct == null) {
                return null;
            }
            Field f = sAct.getClass().getField("ani");
            return f.get(sAct);
        } catch (Throwable ignored) {
            return null;
        }
    }

    // ---------------------------------------------------------------- 本地语料

    private static void loadCorpus(Activity act) {
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
                    GENERIC.add(reply);
                } else {
                    List<String> list = KEYWORDS.get(kw);
                    if (list == null) {
                        list = new ArrayList<String>();
                        KEYWORDS.put(kw, list);
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

    private static String pickLocal(String text) {
        String t = text == null ? "" : text;
        List<String> matched = new ArrayList<String>();
        for (Map.Entry<String, List<String>> e : KEYWORDS.entrySet()) {
            if (t.contains(e.getKey())) {
                matched.addAll(e.getValue());
            }
        }
        if (!matched.isEmpty()) {
            return matched.get(RANDOM.nextInt(matched.size()));
        }
        if (!GENERIC.isEmpty()) {
            return GENERIC.get(RANDOM.nextInt(GENERIC.size()));
        }
        String[] fallback = {
                "嗯……我在听哦，慢慢说就好。",
                "经纪人今天也辛苦了呢。",
                "只要你在，我就不会觉得无聊。",
                "嘿嘿，被经纪人夸了，有点开心。",
                "我一直都在这里，哪儿也不去。"
        };
        return fallback[RANDOM.nextInt(fallback.length)];
    }

    // ---------------------------------------------------------------- API

    private static boolean isApiReady() {
        try {
            return sPrefs != null && !TextUtils.isEmpty(sPrefs.getString(KEY_APIKEY, ""));
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** 系统提示词：人设 + 长期记忆要点（“记住/我叫…”累积的内容）。 */
    private static String systemPrompt() {
        String notes = sPrefs == null ? "" : sPrefs.getString(KEY_NOTES, "");
        if (TextUtils.isEmpty(notes)) {
            return SYSTEM_PROMPT;
        }
        return SYSTEM_PROMPT + "\n以下是你答应过要记住的事，请自然地体现在对话里：\n" + notes;
    }

    private static String apiBase() {
        String base = sPrefs == null ? DEFAULT_BASE : sPrefs.getString(KEY_BASE, DEFAULT_BASE);
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

    private static String apiModel() {
        String m = sPrefs == null ? DEFAULT_MODEL : sPrefs.getString(KEY_MODEL, DEFAULT_MODEL);
        return TextUtils.isEmpty(m) ? DEFAULT_MODEL : m.trim();
    }

    /** 同步请求；返回 null 表示失败，原因写入 sLastError。 */
    private static String requestApi() {
        HttpURLConnection conn = null;
        try {
            String key = sPrefs == null ? "" : sPrefs.getString(KEY_APIKEY, "");
            if (TextUtils.isEmpty(key)) {
                sLastError = "未配置 API Key";
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
            sys.put("content", systemPrompt());
            messages.put(sys);
            int start = Math.max(0, HISTORY.size() - 12);
            for (int i = start; i < HISTORY.size(); i++) {
                JSONObject m = new JSONObject();
                m.put("role", HISTORY.get(i)[0]);
                m.put("content", HISTORY.get(i)[1]);
                messages.put(m);
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
                sLastError = "HTTP " + code + " " + shorten(raw);
                return null;
            }
            JSONObject json = new JSONObject(raw);
            JSONArray choices = json.optJSONArray("choices");
            if (choices == null || choices.length() == 0) {
                sLastError = "返回内容为空";
                return null;
            }
            JSONObject choice = choices.getJSONObject(0);
            JSONObject message = choice.optJSONObject("message");
            if (message == null) {
                sLastError = "返回格式异常";
                return null;
            }
            String content = message.optString("content", "");
            if (TextUtils.isEmpty(content)) {
                sLastError = "返回内容为空";
                return null;
            }
            sLastError = "";
            return content.trim();
        } catch (Exception e) {
            sLastError = e.getClass().getSimpleName() + ": " + shorten(String.valueOf(e.getMessage()));
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

    private static String shorten(String s) {
        if (s == null) {
            return "";
        }
        s = s.replace('\n', ' ').replace('\r', ' ');
        return s.length() > 160 ? s.substring(0, 160) : s;
    }
}
