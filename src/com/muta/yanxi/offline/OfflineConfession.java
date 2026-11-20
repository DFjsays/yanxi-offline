package com.muta.yanxi.offline;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.text.TextUtils;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

/**
 * 离线版表白 / 分手。
 *
 * 原版把表白文本 POST 到 user/saylove、分手 POST 到 user/saygoodbye，
 * 由服务端判定成败并返回新的好感档位。服务端已停服，这里改为：
 *  - 配置了自备大模型 API 时，让模型按嫣汐人设判定接受与否并给出回应；
 *  - 未配置或请求失败时，用本地规则兜底（好感档位 + 文本长度）；
 *  - 结算结果直接写回 live2d 存档，并刷新主界面。
 */
public final class OfflineConfession {

    private static final String PREFS = "yanxi_offline";
    private static final String KEY_BASE = "api_base";
    private static final String KEY_APIKEY = "api_key";
    private static final String KEY_MODEL = "api_model";
    private static final String DEFAULT_BASE = "https://api.deepseek.com";
    private static final String DEFAULT_MODEL = "deepseek-chat";

    /** 每档好感进度上限（对应原版 uplimit）。 */
    private static final int LIMIT = 1000;
    /** 表白成功 / 失败 / 分手的好感增减。 */
    private static final int GAIN = 400;
    private static final int LOSS = 200;

    /** 语音根目录（assets 相对路径，与 b/c 的 ajJ 拼接结果一致）。 */
    private static final String VOICE_ROOT = "live2d/yanxi1/sources/";
    /** 原版 i.aa 不可用时的回退播放器。 */
    private static MediaPlayer sVoice;

    private static final String SYSTEM_PROMPT =
            "你是《嫣汐》中的角色嫣汐：16 岁，活泼乐观、执着梦想、永不言败，说话带一点害羞和傲娇。"
                    + "现在玩家向你表白。请根据你对他的好感来判断是否接受：好感越高越容易接受，"
                    + "表白内容真诚、具体、有诚意会加分；敷衍、粗俗、复制粘贴或过短会被拒绝。"
                    + "只输出一行 JSON，不要解释，格式：{\"accept\":true,\"reply\":\"一句符合人设的回应，30字以内\"}";

    private OfflineConfession() {
    }

    public static boolean startLove(Activity act, int state, int value, int cache, int tap, String content) {
        begin(act, state, value, cache, tap, content, false);
        return true;
    }

    public static boolean startBreakup(Activity act, int state, int value, int cache, int tap, String content) {
        begin(act, state, value, cache, tap, content, true);
        return true;
    }

    private static void begin(final Activity act, final int state, final int value,
                              final int cache, final int tap, final String content,
                              final boolean breakup) {
        final ProgressDialog dlg = new ProgressDialog(act);
        dlg.setMessage(breakup ? "嫣汐正在难过……" : "嫣汐正在思考……");
        dlg.setCancelable(false);
        try {
            dlg.show();
        } catch (Throwable ignored) {
        }

        final SharedPreferences prefs = act.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

        new Thread(new Runnable() {
            @Override
            public void run() {
                Result r;
                if (breakup) {
                    r = new Result(false, "……既然你这么想，那我们就到这里吧。", -LIMIT, true, "");
                } else {
                    r = judge(act, prefs, state, value + cache, content);
                }
                final Result fr = r;
                act.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            dlg.dismiss();
                        } catch (Throwable ignored) {
                        }
                        if (act.isFinishing()) {
                            return;
                        }
                        apply(act, state, value, cache, fr, breakup);
                    }
                });
            }
        }).start();
    }

    /** 先找模型判分；没有配置或失败则本地兜底。 */
    private static Result judge(Activity act, SharedPreferences prefs, int state, int total, String content) {
        String text = content == null ? "" : content.trim();
        String key = prefs.getString(KEY_APIKEY, "");
        if (!TextUtils.isEmpty(key)) {
            String raw = requestApi(prefs, state, total, text);
            if (raw != null) {
                JSONObject o = extractJson(raw);
                if (o != null) {
                    boolean accept = o.optBoolean("accept", false);
                    String reply = o.optString("reply", "");
                    if (TextUtils.isEmpty(reply)) {
                        reply = accept ? "……这次就勉强答应你吧。" : "对不起，我还需要一点时间。";
                    }
                    return new Result(accept, reply, accept ? GAIN : -LOSS, false, "");
                }
            }
        }
        // 本地兜底：按好感档位给基础通过率（中文告白普遍很短，长度门槛只做最低限过滤）
        boolean tooShort = text.length() < 2;
        boolean repetitive = isRepetitive(text);
        int chance;
        if (state >= 4) {
            chance = 100;
        } else if (state >= 2) {
            chance = 80;
        } else if (state >= 0) {
            chance = 60;
        } else if (state >= -2) {
            chance = 40;
        } else {
            chance = 25;
        }
        boolean accept = !tooShort && !repetitive && new Random().nextInt(100) < chance;
        String reply = accept
                ? "……哼，看在你还算认真的份上，我就答应你好了。"
                : "对不起，现在说这些还太早了。";
        String note = TextUtils.isEmpty(key) ? "未配置大模型 API，本次使用本地判定" : "大模型调用失败，已回退本地判定";
        return new Result(accept, reply, accept ? GAIN : -LOSS, false, note);
    }

    private static boolean isRepetitive(String s) {
        if (s.length() < 4) {
            return false;
        }
        int same = 0;
        for (int i = 1; i < s.length(); i++) {
            if (s.charAt(i) == s.charAt(i - 1)) {
                same++;
            }
        }
        return same > s.length() / 3;
    }

    /** 结算并写回存档，同时刷新主界面和弹结果。 */
    private static void apply(Activity act, int state, int value, int cache, Result r, boolean breakup) {
        int s = OfflineStage.clampStage(state);
        int total = value + cache;
        if (total < 0) {
            total = 0;
        }
        if (total > LIMIT - 1) {
            total = LIMIT - 1;
        }

        if (breakup) {
            s = OfflineStage.downStage(s);
            total = 0;
        } else {
            total += r.delta;
            while (total >= LIMIT && s < OfflineStage.MAX) {
                s = OfflineStage.upStage(s);
                total -= LIMIT;
            }
            while (total < 0 && s > OfflineStage.MIN) {
                s = OfflineStage.downStage(s);
                total += LIMIT;
            }
            if (total < 0) {
                total = 0;
            }
            if (total >= LIMIT) {
                total = LIMIT - 1;
            }
        }

        saveState(act, s, total, breakup ? -LIMIT : r.delta);
        refreshMain(act);
        // 原版 saylove/saygoodbye 回调链已被 return-void 短路，结果语音在这里补播
        playResultVoice(act, state, r.accept, breakup);

        String title = breakup ? "分手" : (r.accept ? "表白成功" : "表白失败");
        StringBuilder body = new StringBuilder(r.reply);
        body.append("\n\n好感度 ").append(breakup ? "-" : (r.delta > 0 ? "+" : ""))
                .append(breakup ? LIMIT : Math.abs(r.delta))
                .append("　当前：第 ").append(s).append(" 档（").append(total).append("/").append(LIMIT).append("）");
        if (!TextUtils.isEmpty(r.note)) {
            body.append("\n").append(r.note);
        }

        try {
            AlertDialog.Builder builder = new AlertDialog.Builder(act)
                    .setTitle(title)
                    .setMessage(body.toString())
                    .setPositiveButton("知道了", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface d, int which) {
                            d.dismiss();
                        }
                    });
            if (r.accept && !breakup) {
                builder.setNeutralButton("查看回忆", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int which) {
                        openMemories(act);
                    }
                });
            }
            builder.show();
        } catch (Throwable t) {
            Toast.makeText(act, body.toString(), Toast.LENGTH_LONG).show();
        }
    }

    // ------------------------------------------------------------ 结果语音

    /** 表白/分手结果语音：unburden 为告白（按档位挑一套），burden 为分手。 */
    private static void playResultVoice(Activity act, int state, boolean accept, boolean breakup) {
        try {
            if (breakup) {
                playVoice(act, VOICE_ROOT + "burden/b-1.mp3");
                return;
            }
            int level = nearestUnburdenLevel(OfflineStage.toLevel(state));
            playVoice(act, VOICE_ROOT + "unburden/u-" + level + (accept ? "-success" : "-fail") + ".mp3");
        } catch (Throwable ignored) {
            // 语音失败不影响结果弹窗
        }
    }

    /** unburden 只有 1/5/6/10 四套：冷淡及以下统一 u-1，其余取最近，平局取较大。 */
    private static int nearestUnburdenLevel(int level) {
        if (level <= 4) {
            return 1;
        }
        int[] has = {1, 5, 6, 10};
        int best = has[0];
        int bestGap = Integer.MAX_VALUE;
        for (int cand : has) {
            int gap = Math.abs(cand - level);
            if (gap <= bestGap) {
                bestGap = gap;
                best = cand;
            }
        }
        return best;
    }

    /** 优先复用原版 cn.wittyneko.live2d.a.i#aa（单实例、受游戏声音开关控制），失败再自建播放器。 */
    private static void playVoice(Context ctx, String assetPath) {
        try {
            Class<?> cls = Class.forName("cn.wittyneko.live2d.a.i");
            cls.getMethod("aa", String.class).invoke(null, assetPath);
            return;
        } catch (Throwable ignored) {
            // i.aa 静态 context 未初始化时会抛 NPE，走下面的回退
        }
        AssetFileDescriptor fd = null;
        try {
            if (sVoice != null) {
                sVoice.release();
                sVoice = null;
            }
            fd = ctx.getAssets().openFd(assetPath);
            MediaPlayer player = new MediaPlayer();
            player.setDataSource(fd.getFileDescriptor(), fd.getStartOffset(), fd.getLength());
            player.prepare();
            player.start();
            sVoice = player;
        } catch (Throwable ignored) {
            // 两条路径都失败时静默：结果弹窗仍要出现
        } finally {
            if (fd != null) {
                try {
                    fd.close();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    /** 表白成功的「查看回忆」：本地拼 illustraData，启动原版回忆详情页；任何异常只提示。 */
    private static void openMemories(Activity act) {
        try {
            Class<?> cls = Class.forName("com.muta.yanxi.entity.illustraData");
            Object data = cls.getDeclaredConstructor().newInstance();

            SharedPreferences game = gamePrefs(act);
            setIfPresent(data, "setDate_days", Integer.valueOf(OfflineMemories.daysTogether(act)));
            // 相处小时改为累计游玩时长，不再用现实时钟推算
            setIfPresent(data, "setGetalong", Integer.valueOf(OfflineMemories.hoursTogether(act)));
            setIfPresent(data, "setIntimatecount", Integer.valueOf(game.getInt("sync_value", 0)));
            setIfPresent(data, "setInteractive_count", Integer.valueOf(game.getInt("sync_tap_count", 0)));
            setIfPresent(data, "setScore", Integer.valueOf(Math.max(0, game.getInt("sync_score", 0))));
            setIfPresent(data, "setLocklevel",
                    Integer.valueOf(OfflineStage.clampStage(game.getInt("sync_state", 0))));
            // CG 页统一由 OfflineMemories.loadCg 读内置登录背景，这里保持空串避免联网加载
            setIfPresent(data, "setPic2x", "");
            setIfPresent(data, "setPic3x", "");
            setIfPresent(data, "setCreate_time", "");

            act.startActivity(confessionIntent(act, data));
        } catch (Throwable t) {
            Toast.makeText(act, "回忆页面暂不可用", Toast.LENGTH_SHORT).show();
        }
    }

    /** 反射 MemoriesConfessionActivity;->a(Context,illustraData)：优先精确签名，找不到就扫 public static。 */
    private static Intent confessionIntent(Activity act, Object data) throws Exception {
        Class<?> cls = Class.forName("com.muta.yanxi.view.activity.MemoriesConfessionActivity");
        java.lang.reflect.Method target = null;
        boolean withData = false;
        try {
            target = cls.getMethod("a", Context.class, data.getClass());
            withData = true;
        } catch (NoSuchMethodException ignored) {
        }
        if (target == null) {
            for (java.lang.reflect.Method m : cls.getMethods()) {
                if (!java.lang.reflect.Modifier.isStatic(m.getModifiers())
                        || !Intent.class.equals(m.getReturnType())) {
                    continue;
                }
                Class<?>[] p = m.getParameterTypes();
                if (p.length == 1 && Context.class.equals(p[0])) {
                    target = m;
                    break;
                }
                if (p.length == 2 && Context.class.equals(p[0]) && p[1].isAssignableFrom(data.getClass())) {
                    target = m;
                    withData = true;
                    break;
                }
            }
        }
        if (target == null) {
            throw new NoSuchMethodException("MemoriesConfessionActivity#a");
        }
        target.setAccessible(true);
        Object r = withData ? target.invoke(null, act, data) : target.invoke(null, act);
        if (!(r instanceof Intent)) {
            throw new IllegalStateException("no Intent");
        }
        return (Intent) r;
    }

    /** 按名字反射单参 setter：参数类型能转换才调，没有该方法或类型不匹配就跳过。 */
    private static void setIfPresent(Object target, String name, Object value) {
        try {
            for (java.lang.reflect.Method m : target.getClass().getMethods()) {
                if (!m.getName().equals(name) || m.getParameterTypes().length != 1) {
                    continue;
                }
                Class<?> p = m.getParameterTypes()[0];
                Object arg = convert(p, value);
                if (arg == null && p.isPrimitive()) {
                    continue;
                }
                m.invoke(target, arg);
                return;
            }
        } catch (Throwable ignored) {
        }
    }

    private static Object convert(Class<?> type, Object value) {
        if (value == null) {
            return null;
        }
        if (type.isInstance(value)) {
            return value;
        }
        if (type == Integer.TYPE || type == Integer.class) {
            return value instanceof Number ? Integer.valueOf(((Number) value).intValue()) : null;
        }
        if (type == Float.TYPE || type == Float.class) {
            return value instanceof Number ? Float.valueOf(((Number) value).floatValue()) : null;
        }
        if (type == Long.TYPE || type == Long.class) {
            return value instanceof Number ? Long.valueOf(((Number) value).longValue()) : null;
        }
        if (type == String.class) {
            return String.valueOf(value);
        }
        return null;
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

    /** 写 live2d 存档：l(state,value,delta) + ab(uplimit,downlimit) + pt() + commit()。 */
    private static void saveState(Context ctx, int state, int value, int delta) {
        try {
            Class<?> clsB = Class.forName("com.muta.yanxi.c.b.b");
            Object b = method(clsB, "Z", Context.class).invoke(null, ctx);
            Object ps = method(clsB, "ps").invoke(b);
            Class<?> clsBa = ps.getClass();
            method(clsBa, "l", int.class, int.class, int.class).invoke(ps, state, value, delta);
            method(clsBa, "ab", int.class, int.class).invoke(ps, LIMIT, 0);
            Object cleared = method(clsBa, "pt").invoke(ps);
            method(clsBa, "commit").invoke(cleared);
        } catch (Throwable ignored) {
            // 存档结构异常时不阻塞结果展示
        }
    }

    /** 反射调用 MainActivity 的合成刷新方法 j(MainActivity)。 */
    private static void refreshMain(Activity act) {
        try {
            Class<?> mc = Class.forName("com.muta.yanxi.view.activity.MainActivity");
            method(mc, "j", mc).invoke(null, act);
        } catch (Throwable ignored) {
        }
    }

    /** 沿继承链查找方法（混淆后方法名仍可反射命中），并放开访问限制。 */
    private static java.lang.reflect.Method method(Class<?> cls, String name, Class<?>... params)
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

    // ---------------------------------------------------------------- API

    private static String apiBase(SharedPreferences prefs) {
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

    private static String apiModel(SharedPreferences prefs) {
        String m = prefs.getString(KEY_MODEL, DEFAULT_MODEL);
        return TextUtils.isEmpty(m) ? DEFAULT_MODEL : m.trim();
    }

    private static String requestApi(SharedPreferences prefs, int state, int total, String content) {
        HttpURLConnection conn = null;
        try {
            String key = prefs.getString(KEY_APIKEY, "").trim();
            JSONObject body = new JSONObject();
            body.put("model", apiModel(prefs));
            body.put("temperature", 0.7);
            body.put("max_tokens", 300);
            body.put("stream", false);
            JSONArray messages = new JSONArray();
            JSONObject sys = new JSONObject();
            sys.put("role", "system");
            sys.put("content", SYSTEM_PROMPT);
            messages.put(sys);
            JSONObject user = new JSONObject();
            user.put("role", "user");
            user.put("content", "我对你的好感档位是第 " + state + " 档（0-10，越高越亲近），"
                    + "档内进度 " + total + "/" + LIMIT + "。\n我写的表白：\n" + content);
            messages.put(user);
            body.put("messages", messages);

            URL url = new URL(apiBase(prefs) + "/chat/completions");
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(30000);
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            conn.setRequestProperty("Authorization", "Bearer " + key);

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
            if (code < 200 || code >= 300) {
                return null;
            }
            JSONObject json = new JSONObject(sb.toString());
            JSONArray choices = json.optJSONArray("choices");
            if (choices == null || choices.length() == 0) {
                return null;
            }
            JSONObject message = choices.getJSONObject(0).optJSONObject("message");
            if (message == null) {
                return null;
            }
            String contentText = message.optString("content", "");
            return TextUtils.isEmpty(contentText) ? null : contentText.trim();
        } catch (Exception e) {
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.disconnect();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    /** 模型可能带 ```json 包裹，取第一个 { 到最后一个 } 之间的内容。 */
    private static JSONObject extractJson(String raw) {
        try {
            int start = raw.indexOf('{');
            int end = raw.lastIndexOf('}');
            if (start < 0 || end <= start) {
                return null;
            }
            return new JSONObject(raw.substring(start, end + 1));
        } catch (Throwable t) {
            return null;
        }
    }

    private static final class Result {
        final boolean accept;
        final String reply;
        final int delta;
        final boolean unused;
        final String note;

        Result(boolean accept, String reply, int delta, boolean unused, String note) {
            this.accept = accept;
            this.reply = reply;
            this.delta = delta;
            this.unused = unused;
            this.note = note;
        }
    }
}
