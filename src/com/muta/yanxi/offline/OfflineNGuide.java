package com.muta.yanxi.offline;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.widget.Toast;

/**
 * 首次启动的新手教程。
 * 原版只在动作列表播完后、由服务端配置驱动弹 NoviceGuideActivity，离线包从不触发；
 * 这里用一个本地标记保证新装用户能看到一次教程。
 */
public final class OfflineNGuide {

    private static final String PREFS = "yanxi_offline";
    private static final String KEY_SHOWN = "guide_shown";

    private OfflineNGuide() {
    }

    public static void maybeShow(Activity act) {
        if (act == null) {
            return;
        }
        try {
            SharedPreferences prefs = act.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            if (prefs.getBoolean(KEY_SHOWN, false)) {
                return;
            }
            prefs.edit().putBoolean(KEY_SHOWN, true).apply();

            // NoviceGuideActivity 不在编译 classpath 里，走反射拿静态入口 g(Context,boolean)
            Class<?> cls = Class.forName("com.muta.yanxi.view.activity.NoviceGuideActivity");
            java.lang.reflect.Method m = cls.getMethod("g", Context.class, Boolean.TYPE);
            Object result = m.invoke(null, act, Boolean.FALSE);
            if (result instanceof Intent) {
                act.startActivity((Intent) result);
            }
        } catch (Throwable t) {
            Toast.makeText(act, "教程页面启动失败", Toast.LENGTH_SHORT).show();
        }
    }
}
