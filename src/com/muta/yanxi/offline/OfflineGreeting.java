package com.muta.yanxi.offline;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 * 启动问候：每天首次进主界面时，按当前好感档位播放对应 sign_on 语音。
 * sign_on/s-N.mp3 与剧本等级同号；s-8 在包内缺失，用邻近等级回退。
 */
public final class OfflineGreeting {

    private static final String PREFS = "yanxi_offline";
    private static final String KEY_DAY = "greet_day";
    private static MediaPlayer player;

    private OfflineGreeting() {
    }

    public static void maybeGreet(Activity act) {
        try {
            SharedPreferences prefs = act.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String today = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
            if (today.equals(prefs.getString(KEY_DAY, ""))) {
                return;
            }
            prefs.edit().putString(KEY_DAY, today).apply();

            int stage = OfflineAffinity.readStage(act);
            int level = OfflineStage.toLevel(stage);
            String path = pick(act.getAssets(), level);
            if (path == null) {
                return;
            }
            play(act, path);
            Toast.makeText(act, greetingByHour(), Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // 播不出声不影响启动
        }
    }

    /** 按等级取问候语音，缺失时按 -1、+1、1 顺序回退（跳过包内缺失的 8）。 */
    private static String pick(AssetManager am, int level) {
        int[] candidates = {level, level - 1, level + 1, 1};
        for (int lv : candidates) {
            if (lv < 1 || lv > 10) {
                continue;
            }
            String path = "sign_on/s-" + lv + ".mp3";
            try {
                am.openFd(path).close();
                return path;
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static void play(Activity act, String path) {
        try {
            release();
            AssetFileDescriptor fd = act.getAssets().openFd(path);
            MediaPlayer mp = new MediaPlayer();
            mp.setDataSource(fd.getFileDescriptor(), fd.getStartOffset(), fd.getLength());
            fd.close();
            mp.prepare();
            mp.start();
            player = mp;
        } catch (Throwable ignored) {
        }
    }

    private static void release() {
        if (player != null) {
            try {
                player.release();
            } catch (Throwable ignored) {
            }
            player = null;
        }
    }

    private static String greetingByHour() {
        int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
        if (hour < 6) {
            return "深夜了，经纪人还不睡吗？";
        }
        if (hour < 12) {
            return "早上好，经纪人。";
        }
        if (hour < 18) {
            return "下午好，经纪人。";
        }
        return "晚上好，经纪人。";
    }
}
