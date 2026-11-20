package com.muta.yanxi.offline;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * 离线好感结算：存档 sync_state 存“真实档位”（-3..6，默认 0），
 * sync_value 存档内进度（0..999）。Live2D 剧本等级由 OfflineStage.toLevel 转换。
 */
public final class OfflineAffinity {

    private static final String PREFS = "yanxi_offline";
    private static final int LIMIT = 1000;

    private OfflineAffinity() {
    }

    /** 读取当前档位（已按 -3..6 钳制）。 */
    public static int readStage(Context ctx) {
        return OfflineStage.clampStage(gamePrefs(ctx).getInt("sync_state", 0));
    }

    /** 读取档内进度（0..999）。 */
    public static int readValue(Context ctx) {
        return clamp(gamePrefs(ctx).getInt("sync_value", 0), 0, LIMIT - 1);
    }

    /**
     * 一次触摸互动。delta 取剧本 value.min..max（原版即如此），按 10 倍计入档内进度。
     * 高好感时身体/腿部等敏感部位的扣分按档位衰减，避免越亲近越容易掉档。
     */
    public static void onTap(Context ctx, int delta) {
        try {
            SharedPreferences p = gamePrefs(ctx);
            int stage = OfflineStage.clampStage(p.getInt("sync_state", 0));
            int value = clamp(p.getInt("sync_value", 0), 0, LIMIT - 1);
            int tapCount = p.getInt("sync_tap_count", 0);

            int oldStage = stage;
            delta = softenPenalty(stage, delta);
            value += delta * 10;

            while (value >= LIMIT && stage < OfflineStage.MAX) {
                stage = OfflineStage.upStage(stage);
                value -= LIMIT;
            }
            while (value < 0 && stage > OfflineStage.MIN) {
                stage = OfflineStage.downStage(stage);
                value += LIMIT;
            }
            value = clamp(value, 0, LIMIT - 1);

            SharedPreferences.Editor e = p.edit();
            e.putInt("sync_state", stage);
            e.putInt("sync_value", value);
            e.putInt("sync_delta_value", 0);
            e.putInt("sync_cache_value", 0);
            e.putInt("sync_tap_count", tapCount + 1);
            e.apply();

            SharedPreferences op = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            int total = op.getInt("stage_total", 0) + Math.max(0, delta * 10);
            op.edit().putInt("stage_total", total).apply();
        } catch (Throwable ignored) {
            // 存档异常时不影响触摸反馈
        }
    }

    /**
     * 敏感部位扣分衰减：档位 >=2 开始减半，>=4 约三成，>=5 约两成。
     * 扣分最小保留 1 点，避免完全无反馈。
     */
    private static int softenPenalty(int stage, int delta) {
        if (delta >= 0 || stage < 2) {
            return delta;
        }
        int scale = 50;
        if (stage >= 5) {
            scale = 20;
        } else if (stage >= 4) {
            scale = 30;
        } else if (stage >= 3) {
            scale = 40;
        }
        int reduced = (delta * scale) / 100;
        return reduced == 0 ? -1 : reduced;
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

    private static int clamp(int v, int lo, int hi) {
        if (v < lo) {
            return lo;
        }
        return v > hi ? hi : v;
    }
}
