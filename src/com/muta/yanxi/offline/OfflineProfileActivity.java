package com.muta.yanxi.offline;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/**
 * 离线版个人信息页：替代原版 MyHomeActivity（原页面的昵称、作品、回忆全部来自 star-fans 服务端）。
 * 这里只展示本地能算出来的数据：好感档位与进度、陪伴天数、互动次数、解锁的回忆条数。
 */
public class OfflineProfileActivity extends Activity {

    private static final String PREFS = "yanxi_offline";
    private static final String KEY_NICK = "profile_nickname";

    private static final int LIMIT = 1000;
    private static final int BG = 0xFFF7F2EA;
    private static final int CARD = 0xFFFFFFFF;
    private static final int ORANGE = 0xFFFF6600;

    private SharedPreferences prefs;

    public static Intent a(Context ctx) {
        return new Intent(ctx, OfflineProfileActivity.class);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        setContentView(buildUi());
    }

    private View buildUi() {
        ScrollView scroller = new ScrollView(this);
        scroller.setBackgroundColor(BG);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(18), dp(18), dp(18), dp(24));
        scroller.addView(root, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // 标题栏
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = new TextView(this);
        title.setText("个人信息");
        title.setTextSize(19);
        title.setTextColor(0xFF3A2E28);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        bar.addView(title, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView close = new TextView(this);
        close.setText("关闭");
        close.setTextSize(14);
        close.setTextColor(ORANGE);
        close.setPadding(dp(10), dp(6), dp(4), dp(6));
        close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        bar.addView(close);
        root.addView(bar);

        // 头像 + 昵称
        LinearLayout head = card();
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        TextView avatar = new TextView(this);
        avatar.setText("嫣");
        avatar.setTextSize(26);
        avatar.setTextColor(Color.WHITE);
        avatar.setGravity(Gravity.CENTER);
        avatar.setBackgroundColor(ORANGE);
        row.addView(avatar, new LinearLayout.LayoutParams(dp(58), dp(58)));

        LinearLayout info = new LinearLayout(this);
        info.setOrientation(LinearLayout.VERTICAL);
        info.setPadding(dp(14), 0, 0, 0);
        String nick = prefs.getString(KEY_NICK, "玩家");
        TextView nickTv = new TextView(this);
        nickTv.setText(nick);
        nickTv.setTextSize(17);
        nickTv.setTextColor(0xFF3A2E28);
        nickTv.setTypeface(Typeface.DEFAULT_BOLD);
        info.addView(nickTv);
        TextView sub = new TextView(this);
        sub.setText("与嫣汐相伴 " + daysWith() + " 天");
        sub.setTextSize(12);
        sub.setTextColor(0xFF8A7A6D);
        info.addView(sub);
        row.addView(info, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView edit = new TextView(this);
        edit.setText("修改");
        edit.setTextSize(13);
        edit.setTextColor(ORANGE);
        edit.setPadding(dp(10), dp(6), dp(4), dp(6));
        edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                editNickname();
            }
        });
        row.addView(edit);

        head.addView(row);
        root.addView(head);


        // 好感
        int state = OfflineStage.clampStage(readInt("sync_state", 0));
        int value = readInt("sync_value", 0);
        if (value < 0) {
            value = 0;
        }
        if (value > LIMIT) {
            value = LIMIT;
        }

        LinearLayout love = card();
        love.addView(label("好感度"));
        TextView stateTv = new TextView(this);
        stateTv.setText("第 " + state + " 档 · " + OfflineStage.label(state)
                + "（" + OfflineStage.MIN + " ～ " + OfflineStage.MAX + " 档）");
        stateTv.setTextSize(15);
        stateTv.setTextColor(0xFF3A2E28);
        love.addView(stateTv);

        // 用字符条代替 ProgressBar：三参构造在 API 19 上不存在
        TextView bar2 = new TextView(this);
        int filled = value / 100;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 10; i++) {
            sb.append(i < filled ? '\u25A0' : '\u25A1');
        }
        bar2.setText(sb.toString());
        bar2.setTextSize(13);
        bar2.setTextColor(ORANGE);
        bar2.setPadding(0, dp(6), 0, 0);
        love.addView(bar2);
        TextView valueTv = new TextView(this);
        valueTv.setText(value + " / " + LIMIT);
        valueTv.setTextSize(12);
        valueTv.setTextColor(0xFF8A7A6D);
        valueTv.setGravity(Gravity.END);
        love.addView(valueTv);
        root.addView(love);

        // 其他本地统计
        LinearLayout stats = card();
        stats.addView(label("本地记录"));
        stats.addView(item("互动次数", readInt("sync_tap_count", 0) + " 次"));
        stats.addView(item("聊天句数", "以回忆页为准"));
        stats.addView(item("嫣羽 / 人气", "停服后无法统计"));
        stats.addView(item("作品 / 歌曲", "原数据在云端，离线不可用"));
        root.addView(stats);

        // 回忆 / 记忆入口
        LinearLayout entries = card();
        entries.addView(label("回忆与记忆"));
        TextView memoriesBtn = action("我的回忆", "相伴天数、亲密度与互动统计");
        memoriesBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openMemories();
            }
        });
        entries.addView(memoriesBtn);
        TextView memoryBtn = action("聊天记忆", "她记住的事与最近几轮对话");
        memoryBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showMemory();
            }
        });
        entries.addView(memoryBtn);
        root.addView(entries);

        TextView tip = new TextView(this);
        tip.setText("本页面只读取本地存档；表白与聊天内容不会上传。");
        tip.setTextSize(11);
        tip.setTextColor(0xFF9C8D80);
        tip.setPadding(dp(4), dp(10), dp(4), 0);
        root.addView(tip);

        return scroller;
    }

    private LinearLayout card() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setBackgroundColor(CARD);
        box.setPadding(dp(16), dp(14), dp(16), dp(14));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(14);
        box.setLayoutParams(lp);
        return box;
    }

    private TextView label(String text) {
        TextView tv = new TextView(this);
        tv.setText(text);
        tv.setTextSize(12);
        tv.setTextColor(0xFF9C8D80);
        return tv;
    }

    private View item(String name, String value) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(8), 0, 0);
        TextView n = new TextView(this);
        n.setText(name);
        n.setTextSize(14);
        n.setTextColor(0xFF3A2E28);
        row.addView(n, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView v = new TextView(this);
        v.setText(value);
        v.setTextSize(14);
        v.setTextColor(0xFF6B5B4F);
        row.addView(v);
        return row;
    }

    /** 可点击入口行：标题 + 灰色副标题。 */
    private TextView action(String name, String desc) {
        TextView tv = new TextView(this);
        tv.setText(name + "\n" + desc);
        tv.setTextSize(14);
        tv.setTextColor(ORANGE);
        tv.setPadding(0, dp(10), 0, dp(2));
        return tv;
    }

    /** 打开原版回忆页；离线已由 OfflineMemories 接管数据填充。 */
    private void openMemories() {
        try {
            Class<?> cls = Class.forName("com.muta.yanxi.view.activity.MemoriesActivity");
            java.lang.reflect.Method m = cls.getMethod("am", Context.class);
            Intent it = (Intent) m.invoke(null, this);
            if (it != null) {
                startActivity(it);
                return;
            }
        } catch (Throwable ignored) {
        }
        Toast.makeText(this, "回忆页面暂不可用", Toast.LENGTH_SHORT).show();
    }

    private void showMemory() {
        new AlertDialog.Builder(this)
                .setTitle("聊天记忆")
                .setMessage(OfflineChatBridge.memoryDigest(this))
                .setPositiveButton("知道了", null)
                .show();
    }

    private void editNickname() {
        final EditText et = new EditText(this);
        et.setInputType(InputType.TYPE_CLASS_TEXT);
        et.setText(prefs.getString(KEY_NICK, "玩家"));
        new AlertDialog.Builder(this)
                .setTitle("修改昵称")
                .setView(et)
                .setPositiveButton("保存", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int which) {
                        String s = et.getText().toString().trim();
                        if (s.length() > 12) {
                            s = s.substring(0, 12);
                        }
                        prefs.edit().putString(KEY_NICK, s.length() == 0 ? "玩家" : s).apply();
                        recreate();
                    }
                })
                .setNegativeButton("取消", null)
                .show();
    }

    private int daysWith() {
        // 与回忆页同一口径：都按 yanxi_offline#first_open_day 起算，避免两处天数不一致
        return OfflineMemories.daysTogether(this);
    }

    /** 反射读取 live2d 存档（com.muta.yanxi.c.b.b#getInt）。 */
    private int readInt(String key, int def) {
        try {
            Class<?> clsB = Class.forName("com.muta.yanxi.c.b.b");
            Object b = method(clsB, "Z", Context.class).invoke(null, this);
            Object v = method(clsB, "getInt", String.class, int.class).invoke(b, key, def);
            return ((Integer) v).intValue();
        } catch (Throwable t) {
            return def;
        }
    }

    private java.lang.reflect.Method method(Class<?> cls, String name, Class<?>... params)
            throws NoSuchMethodException {
        for (Class<?> c = cls; c != null; c = c.getSuperclass()) {
            try {
                java.lang.reflect.Method m = c.getDeclaredMethod(name, params);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) {
            }
        }
        throw new NoSuchMethodException(cls.getName() + "#" + name);
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    private void toast(String s) {
        Toast.makeText(this, s, Toast.LENGTH_SHORT).show();
    }
}
