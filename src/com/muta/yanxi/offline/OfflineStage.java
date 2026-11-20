package com.muta.yanxi.offline;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * 好感档位 <-> 剧本等级 的唯一映射入口。
 * 档位（用户可见、存档 sync_state）：-3..6，初始 0。
 * 等级（包内剧本 def_preference 的键、语音文件夹名）：1..10。
 * 依据 T32 听辨表：档位 -3/-2/-1/0/1/2/3/4/5/6 <-> 等级 4/3/2/1/6/9/10/6/5/8。
 *
 * 注：档位 1 与档位 4 共用等级 6。T32 已确认原版「7 级与 6 级合并、1 档无独立语音素材」，
 * 而 T35 人工拼出的 def_preference "7" 段只有 sources/7/ 两条 mp3、与 15 条台词对不上，
 * 因此档位 1 改走等级 6，保证字幕与语音一一对应（详见 spec.md §9）。
 */
public final class OfflineStage {

    public static final int MIN = -3;
    public static final int MAX = 6;

    private static final int[] STAGES = {-3, -2, -1, 0, 1, 2, 3, 4, 5, 6};
    private static final int[] LEVELS = {4, 3, 2, 1, 6, 9, 10, 6, 5, 8};
    private static final String[] LABELS = {
            "极度排斥", "厌恶", "冷淡", "陌生", "微好感",
            "好感", "亲近", "喜欢", "依赖", "爱恋"
    };

    private OfflineStage() {
    }

    public static int clampStage(int stage) {
        if (stage < MIN) {
            return MIN;
        }
        if (stage > MAX) {
            return MAX;
        }
        return stage;
    }

    public static int toLevel(int stage) {
        int s = clampStage(stage);
        for (int i = 0; i < STAGES.length; i++) {
            if (STAGES[i] == s) {
                return LEVELS[i];
            }
        }
        return 1;
    }

    /** 旧存档（1..10 等级）迁移用；非法值回落到 0 档。 */
    public static int toStage(int level) {
        // 原版等级 7 对应档位 1，但等级 6 也映射到档位 1（7 级与 6 级合并），
        // 需在表查询前单独处理，避免旧存档从 1 档偏移到 0 档。
        if (level == 7) {
            return 1;
        }
        for (int i = 0; i < LEVELS.length; i++) {
            if (i != 4 && LEVELS[i] == level) {
                return STAGES[i];
            }
        }
        return 0;
    }

    public static int upStage(int stage) {
        int s = clampStage(stage);
        return s >= MAX ? MAX : s + 1;
    }

    public static int downStage(int stage) {
        int s = clampStage(stage);
        return s <= MIN ? MIN : s - 1;
    }

    /** 语音文件夹名（与等级同号）。 */
    public static String folder(int stage) {
        return String.valueOf(toLevel(stage));
    }

    public static String label(int stage) {
        int s = clampStage(stage);
        return LABELS[s - MIN];
    }

    /** 一次性把旧存档里的“等级 1..10”迁移成“档位 -3..6”，并返回迁移后的档位。 */
    public static int migrate(Context ctx) {
        try {
            SharedPreferences game = gamePrefs(ctx);
            SharedPreferences offline = ctx.getSharedPreferences("yanxi_offline", Context.MODE_PRIVATE);
            if (!offline.getBoolean("stage_migrated", false)) {
                int raw = game.getInt("sync_state", 0);
                int stage = (raw >= 1 && raw <= 10) ? toStage(raw) : clampStage(raw);
                int value = game.getInt("sync_value", 0);
                if (value < 0) {
                    value = 0;
                }
                if (value > 999) {
                    value = 999;
                }
                game.edit().putInt("sync_state", stage).putInt("sync_value", value)
                        .putInt("sync_delta_value", 0).commit();
                offline.edit().putBoolean("stage_migrated", true).apply();
                return stage;
            }
            return clampStage(game.getInt("sync_state", 0));
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static SharedPreferences gamePrefs(Context ctx) {
        try {
            Class<?> cls = Class.forName("com.muta.yanxi.c.b.b");
            Object b = cls.getDeclaredMethod("Z", Context.class).invoke(null, ctx);
            if (b instanceof SharedPreferences) {
                return (SharedPreferences) b;
            }
        } catch (Throwable ignored) {
        }
        return ctx.getSharedPreferences("yanxi_offline", Context.MODE_PRIVATE);
    }
}
