package com.muta.yanxi.offline;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

/**
 * 回忆页离线填充。
 * 原版 MemoriesActivity.qT() 用 Retrofit 拉 user/msg_state（picture_list + illustra_data），
 * 停服后请求必然失败，页面只剩空壳。这里用本地存档拼出同样的文案：
 * 相伴天数、聊天条数、好感档位/进度、互动次数；图片列表离线拿不到，清空轮播给占位。
 */
public final class OfflineMemories {

    private static final String PREFS = "yanxi_offline";
    private static final String KEY_FIRST = "first_open_day";
    private static final String KEY_NICK = "profile_nickname";
    private static final String KEY_CHAT = "chat_count";
    /** 累计游玩时长（毫秒），主界面 onResume/onPause 累加。 */
    private static final String KEY_PLAY = "play_millis";
    /** 所有 CG 页统一使用的内置登录背景。 */
    private static final String CG_ASSET = "cg/login_bg.webp";
    /** 每档好感进度上限（对应原版 uplimit）。 */
    private static final int LIMIT = 1000;

    /** 本次进入前台的时间戳（elapsedRealtime），0 表示不在前台。 */
    private static long sResumeAt = 0;

    private OfflineMemories() {
    }

    /** 主界面 onResume 调用：开始计这一段的游玩时长。 */
    public static void resume(Context ctx) {
        sResumeAt = android.os.SystemClock.elapsedRealtime();
    }

    /** 主界面 onPause 调用：把这一段的时长累加进存档。 */
    public static void pause(Context ctx) {
        long start = sResumeAt;
        sResumeAt = 0;
        if (start <= 0 || ctx == null) {
            return;
        }
        long delta = android.os.SystemClock.elapsedRealtime() - start;
        if (delta <= 0) {
            return;
        }
        try {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            prefs.edit().putLong(KEY_PLAY, prefs.getLong(KEY_PLAY, 0) + delta).apply();
        } catch (Throwable ignored) {
        }
    }

    /** 所有 CG 页统一替换成登录背景（assets/cg/login_bg.webp）。 */
    public static void loadCg(android.widget.ImageView view) {
        if (view == null) {
            return;
        }
        try {
            java.io.InputStream in = view.getContext().getAssets().open(CG_ASSET);
            android.graphics.Bitmap bmp = android.graphics.BitmapFactory.decodeStream(in);
            in.close();
            if (bmp != null) {
                view.setScaleType(android.widget.ImageView.ScaleType.CENTER_CROP);
                view.setImageBitmap(bmp);
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * 把本地存档写进 MemoriesActivity 的视图持有者（anA/com.muta.yanxi.a.h）。
     * 任一反射步骤失败返回 false，让调用方回落到原流程。
     */
    public static boolean fill(Activity act) {
        if (act == null) {
            return false;
        }
        try {
            Object holder = field(act, "anA");
            if (holder == null) {
                return false;
            }

            SharedPreferences game = gamePrefs(act);
            int stage = OfflineStage.clampStage(game.getInt("sync_state", 0));
            int value = clamp(game.getInt("sync_value", 0), 0, LIMIT - 1);
            int score = game.getInt("sync_score", 0);
            int tap = game.getInt("sync_tap_count", 0);

            SharedPreferences prefs = act.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            int chat = prefs.getInt(KEY_CHAT, 0);
            // 告白结果界面暂无对应控件，仅读取以保持键位约定
            prefs.getString("confess_result", "");
            String nick = prefs.getString(KEY_NICK, "");
            if (nick == null || nick.length() == 0) {
                nick = "经纪人";
            }

            int days = daysTogether(act);
            int hours = hoursTogether(act);

            setText(holder, "adC", nick + "与嫣汐的第" + days + "天");
            setText(holder, "adD", String.valueOf(chat));
            setText(holder, "adE", String.valueOf(hours));
            // 人气值来自旧服务端字段 sync_score，历史存档可能是负数，这里不展示负值
            setText(holder, "adF", String.valueOf(Math.max(0, score)));
            setText(holder, "adH", String.valueOf(value));
            setText(holder, "adJ", String.valueOf(tap));
            setText(holder, "adK", "0");

            Object list = field(act, "anC");
            int count = 0;
            if (list instanceof List) {
                count = ((List<?>) list).size();
            }
            setText(holder, "adI", String.valueOf(count));
            setText(holder, "adG", "/" + count);
            hide(holder, "adu");
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** 相处小时：累计游玩时长（前台计时），含当前这一段；玩过但不足 1 小时记 1 小时。 */
    public static int hoursTogether(Context ctx) {
        long ms = 0;
        try {
            ms = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getLong(KEY_PLAY, 0);
        } catch (Throwable ignored) {
        }
        if (sResumeAt > 0) {
            long live = android.os.SystemClock.elapsedRealtime() - sResumeAt;
            if (live > 0) {
                ms += live;
            }
        }
        int hours = (int) (ms / 3600000L);
        if (hours < 1) {
            return ms > 0 ? 1 : 0;
        }
        return hours;
    }

    /** 相伴天数：从 yanxi_offline#first_open_day 起算，至少 1 天；缺失时写入当天日期。 */
    public static int daysTogether(Context ctx) {
        try {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String first = prefs.getString(KEY_FIRST, "");
            if (first == null || first.length() == 0) {
                first = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
                prefs.edit().putString(KEY_FIRST, first).apply();
            }
            Calendar start = Calendar.getInstance();
            start.setTime(new SimpleDateFormat("yyyy-MM-dd", Locale.US).parse(first));
            long diff = dayIndex(Calendar.getInstance()) - dayIndex(start);
            if (diff < 0) {
                return 1;
            }
            return (int) diff + 1;
        } catch (Throwable t) {
            return 1;
        }
    }

    /** 用 GMT 归一到当天 0 点再取天数，避免夏令时造成 ±1 天误差。 */
    private static long dayIndex(Calendar local) {
        Calendar gmt = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        gmt.clear();
        gmt.set(local.get(Calendar.YEAR), local.get(Calendar.MONTH),
                local.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        return gmt.getTimeInMillis() / 86400000L;
    }

    /** 沿继承链按名字取字段（anA/anC 为包内可见，需要 setAccessible）。 */
    private static Object field(Object target, String name) throws Exception {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                java.lang.reflect.Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(target.getClass().getName() + "#" + name);
    }

    /** 类型确认是 TextView 才 setText，避免强转异常。 */
    private static void setText(Object holder, String name, String text) throws Exception {
        Object v = field(holder, name);
        if (v instanceof TextView) {
            ((TextView) v).setText(text);
        }
    }

    private static void hide(Object holder, String name) throws Exception {
        Object v = field(holder, name);
        if (v instanceof View) {
            ((View) v).setVisibility(View.GONE);
        }
    }

    private static int clamp(int v, int lo, int hi) {
        if (v < lo) {
            return lo;
        }
        return v > hi ? hi : v;
    }

    /** 游戏存档对象（com.muta.yanxi.c.b.b 实现 SharedPreferences）。 */
    private static SharedPreferences gamePrefs(Context ctx) {
        try {
            Class<?> cls = Class.forName("com.muta.yanxi.c.b.b");
            Object b = cls.getDeclaredMethod("Z", Context.class).invoke(null, ctx);
            if (b instanceof SharedPreferences) {
                return (SharedPreferences) b;
            }
        } catch (Throwable ignored) {
        }
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
