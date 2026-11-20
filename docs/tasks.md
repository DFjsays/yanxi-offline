# 任务清单：嫣汐单机化

> 依赖 `spec.md`。执行前需用户确认。

## [x] T1 跳过启动联网检查
- 文件：`work/decoded/smali/com/muta/yanxi/view/fragment/LoadingFragment.smali`
- 操作：改写 `ox()V`，删除 `ck`/`nR` 调用，直接启动 `MainActivity` 并 `finish()`
- 校验：`ox()` 内无 `getverioncfg`、无 `LoadingFragment;->ck`

## [x] T2 未登录入口降级
- 文件：`work/decoded/smali/com/muta/yanxi/view/activity/MainActivity.smali`
- 操作：`qH()` 中移除 `LoginActivity.am(...)` 的 `startActivity`，改为 Toast
- 校验：`qH()` 内不再引用 `LoginActivity`

## [x] T3 环信调用防崩
- 文件：同上
- 操作：`qN()`、`qF()` 方法体首行提前返回；`showDialog()` 改为启动本地聊天页

## [x] T4 抽取离线语料
- 输入：`work/decoded/res/raw/def_preference`
- 输出：`work/decoded/assets/offline_chat.txt`（`关键词<TAB>回复`，UTF-8 无 BOM）
- 结果：241 条（动作关键词 + 通用兜底）

## [x] T5 编写本地聊天 Activity（含 API 模式）
- 新文件：`work/offline_src/com/muta/yanxi/offline/OfflineChatActivity.java`
- 编译：javac（android-36 android.jar，source/target 8）
- 转 dex：d8 `--min-api 19` → `work/dex_out/classes.dex`
- 转 smali：apktool 内置 baksmali API（BaksmaliRunner）→ `work/bak_out`
- 已拷入 `work/decoded/smali/com/muta/yanxi/offline/`（15 个 smali）

## [x] T6 替换聊天入口
- `MainActivity$35.smali`、`MainActivity$3.smali` 的 `onClick` 改为直接启动
  `OfflineChatActivity`；`MainActivity.showDialog()` 同步重定向

## [x] T7 注册 Activity
- `work/decoded/AndroidManifest.xml` 新增 `OfflineChatActivity`
  （exported=false、portrait、adjustResize、Theme.Holo.NoActionBar），
  `application` 增加 `usesCleartextTraffic="true"`

## [x] T8 兜底检查 UpdateActivity
- 结论：`UpdateActivity` 仅承载 `LoadingFragment`，自身无联网阻断，无需改动

## [x] T9 回编译与签名
- `apktool b` 成功（首次因 `screenOrientation="1"` 非法改为 `portrait` 后通过）
- zipalign `-f -p 4` 成功；keytool 生成 `work/yanxi-offline.keystore`
- apksigner 签名成功，`verify -v`：v1/v2/v3 = true
- 产物：`yanxi_offline_v1.0.6.apk`（39,116,416 字节），包名/版本/minSdk 未变
- 产物含 `classes.dex`、`assets/offline_chat.txt`、Manifest 新 Activity

## [x] T10 交付说明
- 已输出 `使用说明.txt`：可用/停用功能、安装步骤、API 配置、已知限制与合规提示

---

# 第二轮改造（plus 版）

> 用户选定方案：① 剧本热更/导入 ② API 回复驱动表情 + 原版气泡 ③ 本地好感度结算。
> 三处改动叠加使用，故 T3/T5/T6/T7 的旧实现被替换，见下。

## [x] T11 聊天页改为底部弹出窗
- 新文件：`work/offline_src/com/muta/yanxi/offline/OfflineChatWindow.java`
- 原 `OfflineChatActivity` 弃用：独立 Activity 会盖住 Live2D，看不到表情变化
- 窗口：`PopupWindow` 高 62% 屏、Gravity.BOTTOM、`AnimBottom` 动画
- 素材：`ai_window_message_bg` / `ai_window_title_bg` / `ai_window_input_bg`
  / `ai_window_input_btn_send` / `btn_icon_dismiss`，均用 `getIdentifier` 取
- 未复用原版 `com.muta.yanxi.view.c.a`：其气泡依赖环信 `EMConversation`
  与 `saveMessage`，未登录必崩
- 入口：`MainActivity.showDialog()`、`MainActivity$35`、`MainActivity$3`
  三处改为 `new OfflineChatWindow(activity).show()`

## [x] T12 剧本导入 / 热更
- 新文件：`work/offline_src/com/muta/yanxi/offline/ScriptImportActivity.java`
- 流程：`ACTION_OPEN_DOCUMENT` → 读取文本 → `JSONObject` 校验 →
  写 `files/yanxi1.json`（覆盖 `live2d/yanxi1/…` 的剧本路径推导结果）
- 设置弹窗增加「导入剧本 JSON」「恢复内置剧本」（后者删该文件）
- Manifest：`ScriptImportActivity` 注册为 Translucent、portrait、adjustResize

## [x] T13 API 回复驱动表情 + 原版气泡
- 解析回复后调 `ani.ht()` 逐个 `com.muta.yanxi.b.c.a(json, "offline_chat", 2)`，
  `json` 内含 `{"expression":{"index":0~13}}`（`c.bW(int)` 越界会安全 return）
- 同时 `cn.wittyneko.b.g.im().d("live2d_show_mini_dialog", JsonArray)`
  触发原版迷你气泡
- `ani` 通过 `act.getClass().getField("ani")` 反射获取（public 字段）

## [x] T14 本地好感度结算
- 文件：`work/decoded/smali/com/muta/yanxi/view/activity/MainActivity$14.smali`（整体重写）
- 去掉 `a.ns().nz()` 登录态判断与服务端提交
- 规则：累计 `sync_cache_value` + 增量、`sync_tap_count+1`；9 次一结算；
  正分升一级（≤10）、负分降一级（≥1）；跨档改 `sync_score`
  （+1000 / -500，不低于 0），未跨档保留累计值
- 写回：`b$a->l(state,value,0)` + `pt()` + `commit()`，
  另起一次 `d$a->o("sync_score", score).commit()`
- 结算后 `j()` 刷新 UI；跨档 Toast“好感度提升了！”/“好感度下降了……”

## [x] T15 重新构建与校验
- `apktool b` → `work/out_unsigned2.apk`
- zipalign `-f -p 4` → `work/out_aligned2.apk`
- apksigner 签名 → `yanxi_offline_v1.0.6_plus.apk`（39,120,512 字节）
- `apksigner verify -v`：v1/v2/v3 全部 true
- `aapt2 dump badging`：`com.muta.yanxi`、versionCode 10066、1.0.6、
  launchable `com.muta.yanxi.view.activity.SplashActivity`
- 方法签名核对完毕：`b.b->aS(String)`、`live2d/app/b->ht()`、
  `b/c->a(JsonObject,String,int)`、`g->im()/d(String,Object)`、
  `c->bW(int)`、`b$a->ac/l/pt`、`d$a->o/commit`、MainActivity `i()/j()`
- 仍未做：真机运行验证（本机无 adb 设备/模拟器）

## [x] T16 修复好感度两处运行时 bug（plus2）
- 现象：① 互动几次后点击立绘不再有反应 ② 好感度进度显示 -500
- 根因一：`$14` 中 `if-gez v0, :neutral` 把负分支跳过降级，反而落进
  “同档”分支，`sync_value = value + 负值` → 进度写负，界面显示 -500
  （已确认 `view/a/d.ae()` 会把 `sync_value + cache` 直接 setText）
- 根因二：降档钳制 `if-ge v1, 1, :down_ok` 语义写反，状态 1 降级后
  留在 0，而剧本只有 1~6、8~10 档，`default` 里没有 tap_* 节点
  → 点击无任何反应（另：剧本本身缺第 7 档，升到 7 同样会死）
- 修复：重写 `$14`（正/负/零三分支、升降档严格钳制 1~10、
  跳过第 7 档、跨档才 ±分数）；`qN()` 增加档位与进度纠错，
  自动修正已存下的 0 档与负进度
- 构建：`work/out_unsigned3.apk` → `work/out_aligned3.apk` →
  `yanxi_offline_v1.0.6_plus2.apk`（39,120,512 字节，v1/v2/v3 = true）

---

# 第三轮改造（plus3 版）

> 用户依据论坛 2017 帖与截图提出：还有一套泳装 Live2D、告白功能、头像处个人信息页。
> 用户选择：本地版告白+分手、离线个人信息页、继续挖泳装模型；表白成败由自备大模型 API 判分。

## [ ] T17 挖掘泳装 Live2D 资源
- 现状：1.0.6 包内 `assets/live2d/yanxi1` 仅 1 套模型，全包检索
  `swim/bikini/泳装` 均无命中；`assets/image` 仅 1 个文件
- 官网声库页 `/ai/downloadsinger/yanxi/` 302 到登录页，注册需邀请码，暂不可得
- 调研结论（agent + TapTap 官方论坛）：
  - 豌豆荚记录存在 **1.1.3 / 45MB / 2017-10-24** 的构建，但下载按钮已下架，无直链
  - 应用宝、小米商店、九游同包名页均已无包；APKPure/APKCombo/APKMirror 本机网络超时
  - GitHub/Gitee、B 站均无公开的嫣汐 `.moc/.mtn/.exp.json` 资源包
  - TapTap（app 57541 / group 42975）为官方社区，帖中确认游戏内有泳装立绘/CG，
    但未提供任何模型文件下载；官方帖《app 暂时关闭下载通知》亦无附件
- 结论：公开渠道拿不到泳装 Live2D；需一份 1.1.x 安装包（QQ 群 397807358 /
  TapTap 社区求档）才能核实 `assets/live2d/` 下是否多出第二套模型
- 侧记：TapTap 2026-02-15 有用户发帖《大模型时代，用ai和嫣汐聊聊天》，
  思路与本包一致（Live2D 壳 + 自备大模型额度），可作参考

## [x] T18 梳理告白 / 分手提交链路与 UI 落点
- `MainActivity$19.bQ(String)` 读 `sync_state/sync_value/sync_cache_value/sync_tap_count`
  + 玩家输入文本 → `MainActivity.c(IIII,String)` → `d$a->a(...)`（`@POST user/saylove`）
- 分手 `MainActivity.d(IIII,String)` → `d$a->b(...)`（`@POST user/saygoodbye`）
- 响应体 `MsgStateVO` 的 `data` 由 `MainActivity$29/$30` 解析
  （`intimatestatus/intimatecount/deltavalue/uplimit/downlimit/ltype/issuccess/illustra_data`）
- 成功时弹 `MemoriesConfessionActivity`（仅展示本地 `sync_show_value` 并截图分享）

## [x] T19 实现本地告白 + 分手
- 新文件：`work/offline_src/com/muta/yanxi/offline/OfflineConfession.java`
- 入口注入：`MainActivity.c()` / `MainActivity.d()` 开头调用
  `startLove(...)` / `startBreakup(...)`，返回 false 时才回落到原逻辑
- 判分：已配置 API → 调用 `{base}/chat/completions`，要求模型只输出
  `{"accept":true,"reply":"..."}`；未配置或失败 → 本地规则兜底
  （文本过短 / 重复度过高直接失败，否则档位≥5 或 25% 随机通过）
- 结算：表白成功 `total += 400`（每满 1000 升一档，跳过第 7 档）；
  分手 `total = 0` 且 `state -1`；均钳制 1~10
- 存档写回：反射 `com.muta.yanxi.c.b.b#Z(Context)` → `ps()` →
  `b$a#l(III)` + `ab(II)` + `pt()` + `commit()`；再反射 `MainActivity.j(MainActivity)V` 刷新 UI
- 结果用 AlertDialog 展示（标题：表白成功 / 表白失败 / 分手，附好感度变化与档位）
- 兼容性：反射方法沿继承链 `getDeclaredMethod + setAccessible`（`pt/commit` 在父类）
- 编译：javac（-source 8 -target 8 -Xlint:-options）→ d8 `--min-api 19` → baksmali 合入

## [x] T20 实现离线个人信息页
- 新文件：`work/offline_src/com/muta/yanxi/offline/OfflineProfileActivity.java`
- 入口：`MainActivity$6.onClick` 把 `MyHomeActivity.am()` 换成
  `OfflineProfileActivity.a()`；未登录分支 `:cond_0` 也 `goto :offline_profile_go`
- 内容：昵称（可改，存 `profile_nickname`）、相伴天数（首次启动时间）、
  好感档位与进度（读 `sync_state`/`sync_value`，字符进度条，API19 兼容）、
  互动次数、回忆条数、嫣羽/人气与作品/歌曲的离线不可用说明
- Manifest 注册：`Theme.DeviceDefault.Light.NoActionBar`（避开 AppCompat 主题）

## [x] T21 plus3 回编译打包与静态校验
- `apktool b` → `work/out_unsigned5.apk`；zipalign `-f -p 4` → `work/out_aligned5.apk`
- 产物：`yanxi_offline_v1.0.6_plus3.apk`（39,128,704 字节）
- `apksigner verify -v`：v1/v2/v3 = true
- `aapt2 dump badging`：`com.muta.yanxi`、versionCode 10066、1.0.6、
  minSdk 19、targetSdk 25、launchable `SplashActivity`
- `aapt2 dump xmltree`：清单含 `OfflineProfileActivity`、`ScriptImportActivity`
- dex 二进制检索：`classes.dex` 含 `OfflineProfileActivity`(5) / `OfflineConfession`(6)
- 仍未做：真机运行验证（本机无 adb 设备 / 模拟器）

---

# 第四轮：plus4 修复 + 全包功能审计

## [x] T22 修复“表白点了没反应”（plus4）
- 根因：`offline/OfflineChatWindow.openConfession()` 用
  `Class.getMethod("dv", int)` 调 private `MainActivity.dv(I)`，
  抛 `NoSuchMethodException` 后被 `catch (Throwable)` 静默吞掉
- 修复：改为 `getDeclaredMethod` + `setAccessible(true)`（`work/d109` 第 3830 行）
- 产物：`yanxi_offline_v1.0.6_plus4.apk`（23,298,366 字节，v1/v2/v3=true）

## [x] T23 审计“同类反射错误”
- 全包检索 `Class.getMethod`：offline 包内仅 `openConfession` 一处（已修）
- `OfflineProfileActivity.readInt` / `OfflineConfession.method+saveState`
  均为 `getDeclaredMethod`，正常
- 其余命中全在 okhttp/support/sharesdk/push 等第三方库
- `com/muta/yanxi/e/a/a.ac()` 的 `StorageManager.getVolumePaths` 反射有兜底，不影响游戏

## [x] T24 盘点“与告白类似的被隐藏子界面”
- `MemoriesConfessionActivity`（告白成功纪念页）：离线流程只弹 AlertDialog，未跳转
- 分手：逻辑已接通（`$19.bQ` 按 `sync_state` 分支），但聊天窗只有“表白”按钮，
  type=1 背景只在废弃的 `view/c/a -> $21.qR()` 中出现
- “我的”页替换为 `OfflineProfileActivity` 后，原 `MyHomeActivity` 内的
  回忆/我的歌/设置/广场入口全部不可达
- `MyHomeActivity.am` 残留 3 处：`ChatFragment:104`、`EaseChatRowGreet$1:56`、
  `HomePagesActivy$j:52`（当前被 `a.nz()`==false 拦住，进不去）
- 死服务入口：`$36` 消息（有 `nz()` 拦截）、`$2` 朋友圈、`$37/$38` 网页（无拦截，白屏）

## [x] T25 3 处 MyHomeActivity 调用替换为离线个人页（方案 A）—— plus6 已做（T38）
- 文件：`work/d109/smali/com/muta/yanxi/view/fragment/ChatFragment.smali`(104)、
  `.../widget/chatrow/EaseChatRowGreet$1.smali`(56)、
  `.../view/activity/HomePagesActivy$j.smali`(52)
- 改法：`Lcom/muta/yanxi/view/activity/MyHomeActivity;->am(Landroid/content/Context;)Landroid/content/Intent;`
  → `Lcom/muta/yanxi/offline/OfflineProfileActivity;->a(Landroid/content/Context;)Landroid/content/Intent;`
- 校验：三文件内不再出现 `MyHomeActivity;->am`

## [x] T26 死服务入口改为 Toast 提示（方案 B）—— plus6 已做（T38）
- 文件：`MainActivity$2.smali`（朋友圈）、`MainActivity$37.smali`、`MainActivity$38.smali`（网页）
- 改法：在 `onClick` 开头插入
  `const-string v0, "该功能已随服务器停止服务"` +
  `invoke-static {ctx, v0, 0}, Landroid/widget/Toast;->makeText(...)` + `show()`，随后 `return-void`
- 校验：三文件 `onClick` 内出现该中文字符串，不再调用 `startActivity`

## [x] T27 告白成功“查看回忆”入口（方案 C）—— plus6 已做（T38）
- 文件：`offline/OfflineConfession.smali`（`apply` 的 AlertDialog 部分）
- 改法：`accept=true` 时增加中性按钮「查看回忆」，反射构造
  `com.muta.yanxi.entity.illustraData`（档位/相伴天数/`sync_show_value`/时间），
  调 `MemoriesConfessionActivity;->a(Context, illustraData)` 并 `startActivity`
- 风险：`pic2x/pic3x` 为空时 `e/i.c` 加载失败仅留底图；无设备无法运行验证
- 若不做：保持现状（弹窗已提示档位与好感度变化）

## [x] T28 plus5：回忆入口 + 启动问候
- `OfflineProfileActivity.buildUi()` 新增 Button「我的回忆」+ `$4` 监听
  （先前误覆盖 `$2` 已从 `decoded109b` 还原，`$2` 仍是“关闭”按钮）
- 新增 `OfflineProfileActivity.openMemories(Activity)`：
  `MemoriesActivity.am(ctx)` 启动，异常回落 Toast「回忆页面暂不可用」
- 新增 `OfflineGreeting.maybeGreet(Activity)`：
  `greet_day` 同日跳过；随机取 `assets/sign_on/s-1..s-10`（排除缺失的 s-8）；
  MediaPlayer 静态持有播放；按时段 Toast（深夜/早/下午/晚）
- 语音文件 9 条拷入 `work/d109/assets/sign_on/`（约 259KB）
  `MainActivity.onCreate` 收敛点 `:goto_1` 前调用
- 产物：`yanxi_offline_v1.0.6_plus5.apk`（23,565,219 字节）
- 校验：apksigner v1/v2/v3=true；badging 包名/10066/1.0.6/minSdk19 不变；
  dexdump 确认 `maybeGreet` 调用、`$4.onClick`、`openMemories`、`$2` 原构造器均在
- 未纳入：MyHomeActivity 3 处替换（T25）、死入口 Toast（T26）、告白回忆跳转（T27）

## [x] T29 恢复原版「调教」对话面板（方案 2「原味」）—— plus6 已做（T37）
- 状态：已记待办，用户 2026-10-31 明确“暂时别改包”，等指示再动
- 现象：plus 系列的 `OfflineChatWindow` 自绘纯色圆角气泡，缺原版左侧小方头像 + 橙黄斜切气泡
- 包内现成资源（未删，只是不可达）：
  - 面板类 `view/c/a`，布局 `window_ai_session`（0x7f0400d0，约 2.5KB）
  - 气泡底图 `chat_message_bg_a`(0x7f0200af) / `chat_message_bg_b`(0x7f0200b0)；
    图片消息 `chat_img_meaage_bg_a/b`
  - 消息行/适配器同类：`view/c/{c,d,e,g,h}.smali`；输入区提示「请先发起一句对话(仅文字)」，发送键文案「调教」
- 改法：
  1. 还原 `MainActivity.showDialog()` 为原版 `view/c/a` 面板启动（撤销 T3/T6 的重定向）
  2. 面板数据源由服务端回调改为离线：关键词语料 `assets/offline_chat.txt` + 可选大模型
     `yanxi_offline` prefs（api_base/api_key/api_model）
  3. 头像用 Live2D 静止截帧或 `texture_00` 裁剪，避免依赖已停服头像接口
- 风险：原面板绑定服务器审核/计费回调，需逐处拆解（发送→回复→好感结算链路）；
  改动面大于方案 1，需实机验证输入法顶起、气泡滚动、表情联动
- 备选（未选）：方案 1 轻量版，仅把自建气泡换成 `chat_message_bg_a/b` + 头像

## [x] T30 首次启动新手教程 —— plus6 已做（T38，OfflineNGuide）
- 状态：已记待办，等指示再动
- 包内现成：`view/activity/NoviceGuideActivity`（布局 `activity_novice_guide` 0x7f040034）、
  `view/fragment/NoviceGuideFragment`（`fragment_novice_guide.xml`：5 张 `yindao1~5.webp`
  + 右下 `yindao_r` 下一页按钮）、静态入口 `NoviceGuideActivity;->g(Context,Z)` 返回 Intent
- 现状：唯一调用点 `MainActivity.smali:1470`（动作列表播完后 `cond_0` 分支），
  受服务端配置/存档标记控制，离线包从不触发 → 新装也不弹
- 改法：`yanxi_offline` 加 `guide_shown` 标记；首次进主界面（或 `LoadingFragment` 之后）
  直接 `startActivity(NoviceGuideActivity.g(ctx, true))`；播完/跳过时写标记，只弹一次
- 待确认：`NoviceGuideActivity.onCreate/oo` 是否还请求服务端开关；若有需一并短路

## [x] T31 回忆页数据离线化 —— plus6 已做（T39，OfflineMemories）
- 状态：已记待办，等指示再动
- 根因：`MemoriesActivity.qT()` 走 `presenter/a/a;->pJ()` Retrofit + `presenter/a/d$c` 接口，
  `view/b/b.show()` 先弹加载框；离线请求必失败 → 列表/徽章保持旧值或空白，
  本地好感、聊天次数、相伴天数变化都不同步
- 另：`qS()` 用 `e/a.bb(View)` 截图 + `e/a.c()` 存图分享，依赖云端图床，离线亦失效
- 改法：
  1. 新增 `OfflineMemories`：从 `c.b.b.Z(ctx)` 读 `sync_value/sync_state/…` 与
     `yanxi_offline` 统计（首启日期、聊天条数、告白结果）构造条目
  2. `qT()` 首行改为调本地构造，绕开 Retrofit 与加载框；无数据时给「暂无回忆」占位
  3. 分享按钮改本地保存（`e/a.c` 写相册）或暂时置灰
- 关联：T27（告白成功跳回忆）、T29（原版面板）同批改包时一起验证

## [x] T32 语音按“真实好感档位”重排（用户逐条听辨，2026-10-31）
- 结论：包内 `sources/1..10` 是**等级槽位**，不是档位；原 P0~P6 情感排序作废
- 用户对照表：1级=0档、2级=-1档、3级=-2档、4级=-3档、
  5级=5档、6级=4档、8级=6档、9级=2档、10级=3档；7级与6级合并
- 交叉验证：抽查 5/ 甜、10/ 羞、8/ 依恋、9/ 微好感，语气次序与该表一致
- 1档 无独立语音文件夹（剧本也无对应引用）
- 产物（不改音频、不改目录）：
  - `嫣汐语音文件/语音清单_按真实好感档位.csv`（217 行）
  - `嫣汐语音文件/语音清单_按真实好感档位.txt`
  - `嫣汐语音文件/语音播放器_按真实好感档位.html`
  - 生成脚本：`work/build_voice_real_stage.ps1`
- 分布：-3(10) / -2(30) / -1(12) / 0(12) / 2(30) / 3(30) / 4(11) / 5(31) / 6(30)，
  第7级 2 条，剧情事件 burden 2 / sign_on 9 / unburden 8
- 后续（未做）：若接 T29 原版面板或触摸语音，folder→档位 一律按此表实现

---

# 第五轮：plus6（档位重构 + 语音归位 + 遗留项）

> 依据 `spec.md §8`。权威映射：档位 -3..6 ↔ 等级/文件夹 4,3,2,1,7,9,10,6,5,8。

## [x] T33 新增 OfflineStage（映射唯一入口）
- 新文件：`work/offline_src/com/muta/yanxi/offline/OfflineStage.java`
- 方法：`toLevel/toStage/clampStage/upStage/downStage/folder/label`
- 校验：`toLevel(-3)=4`、`toLevel(0)=1`、`toLevel(1)=7`、`toLevel(6)=8`；`toStage(7)=1`

## [x] T34 好感存档改为真实档位，默认 0
- `MainActivity.qK()`：`getInt("sync_state", 0)` → `OfflineStage.toLevel` → `aS(...)`
- `MainActivity.qN()`：去掉 1..10/跳过 7 的钳制；改为 `clampStage` + 旧数据一次性迁移
  （`yanxi_offline/stage_migrated`）；`sync_value` 钳 0..999
- 重写 `OfflineAffinity`（Java 源）：`onTap` 用 -3..6 与 1000 阈值；写 `stage_total`
- 校验：反汇编 `qK` 含 `OfflineStage->toLevel`，默认值 0；`OfflineAffinity` 无 `0x7` 跳档逻辑

## [x] T35 补全剧本第 7 段（档位 1 不再无声）
- `work/d109/res/raw/def_preference` 新增顶层 `"7"`：沿用 `"6"` 的手势键与 `value` 区间，
  `dialog.audio` 指向 `sources/7/` 现有 mp3；无对应文件的键给空数组
- 校验：`ConvertFrom-Json` 通过；`"7"` 键存在；文件大小变化记录在 tasks

## [x] T36 启动问候按档位
- 重写 `OfflineGreeting`（Java 源）：stage→level→`sign_on/s-N.mp3`；
  `s-8` 缺失按 `N-1 → N+1 → 1` 回退；保留同日一次与时段 Toast
- 校验：反汇编无 `s-8` 字面量路径

## [x] T37 T29 原版面板完全接管
- 新增 `OfflineChatBridge`（send/onShow/saveHistory，反射 `view/c/a;->ce`，`getDeclaredMethod`+`setAccessible`）
- `MainActivity.showDialog()` 恢复原版 `new view/c/a(this)` + `showAtLocation`，外层 try/catch 回落 `OfflineChatWindow`
- `view/c/a.smali`：`sendMessage` 首行转 bridge；`rV/rO/rX/rZ` 首行 return；`sb()` 加 `aau` 空判断
- 不新增素材，沿用 `chat_message_bg_a/b` 与 `view/c/*` 行布局
- 校验：`showDialog` 内出现 `Lcom/muta/yanxi/view/c/a;` 且含 `OfflineChatWindow` 的 catch 回落；
  `sendMessage` 内出现 `OfflineChatBridge->send`；`rV` 仅 `return-void`

## [x] T38 T25/T26/T27/T30
- T25：`ChatFragment:104`、`EaseChatRowGreet$1:56`、`HomePagesActivy$j:52`
  `MyHomeActivity->am` → `OfflineProfileActivity->a`
- T26：`MainActivity$2/$37/$38` onClick 首行 Toast「该功能已随服务器停止服务」+ return
- T27：`OfflineConfession.apply` 成功弹窗加「查看回忆」→ 反射 `illustraData` +
  `MemoriesConfessionActivity.a`；失败 catch 回落
- T30：新增 `OfflineNGuide.maybeShow(Activity)`，`guide_shown` 标记；
  `MainActivity.onCreate` 收敛点调用；`NoviceGuideActivity.onCreate` 若有联网则短路

## [x] T39 T31 回忆页离线化
- 新增 `OfflineMemories.fill(Activity)Z`：档位/进度/相伴天数/互动次数/告白结果/最近聊天
- `MemoriesActivity.qT()` 首行 `if (OfflineMemories.fill(this)) return;`
- `qS()` 分享改本地提示（不传图床）
- `OfflineProfileActivity` 档位文案改用 `OfflineStage.label`

## [x] T40 plus6 回编译与静态校验
- javac → d8（`work/dex_plus6`）→ BaksmaliRunner → 覆盖 offline 包 smali → 手改 smali
- `apktool b` → zipalign `-f -p 4` → apksigner → `yanxi_offline_v1.0.6_plus6.apk`
- 校验：v1/v2/v3=true；包名/10066/1.0.6/minSdk19 不变；三个新类在 dex 中；
  上述 grep 项全部通过

---

# 第六轮：plus7（回归修复 + 记忆插件）

## [x] T41 修复 plus6 用户反馈的六项问题
- 告白入口：`MainActivity$19.bQ` 删除 `goto :goto_1`（不再固定走分手）；
  `OfflineChatBridge.attach` 在原版面板标题栏 `ll_title` 左侧挂「告白」按钮，
  点击反射 `MainActivity.dv(1)` 打开原版告白输入框
- 回忆入口：`OfflineProfileActivity` 重建「我的回忆 / 聊天记忆」入口卡；
  回忆页失败回落 Toast「回忆页面暂不可用」
- 回忆负数：`OfflineMemories` 修正字段映射（adE=相处小时、adF=人气值取 `max(0,score)`、
  adI/adG=回忆条数），不再把档位文案写进小时位、不再显示负人气
- 去掉好感提示：`OfflineAffinity` 删除升降档 Toast
- 高好感减扣：`OfflineAffinity.softenPenalty` 档位 ≥2 起按 50%/40%/30%/20% 衰减负向 delta
- 记忆插件：`OfflineChatBridge` 持久化 `memory_log`（最近 80 条）与 `memory_notes`
  （用户说“记住/我叫…”时累积，最多 20 条）；接入系统提示词与启动时回灌；
  个人信息页「聊天记忆」弹窗展示
- 告白结算 `OfflineConfession.apply` 改为真实档位（-3..6、upStage/downStage、1000 阈值）
- 产物：`yanxi_offline_v1.0.6_plus7.apk`（23,573,411 字节，v1/v2/v3=true）

## [x] T42 告白入口二次修复（plus8）
- 面板侧：`installConfession` 改用 `view/c/a.ask`（即 ll_title）优先，失败再按 id 兜底，
  最后退化为面板左上角悬浮按钮；`attach` 增加 `findListView` 兜底查找
- 回落侧：`OfflineChatWindow` 标题栏新增「告白」按钮（原先自绘窗完全没有入口）
- 装配侧：`showDialog` 检查 `attach` 返回值，失败即 dismiss 面板并打开自绘窗
- 产物：`yanxi_offline_v1.0.6_plus8.apk`（23,573,411 字节，v1/v2/v3=true）

## [x] T43 聊天记录回显 + 告白失败率修正（plus9）
- 聊天记录：`loadMemory` 同时回灌 `sMessages`，重开面板即显示历史（最多 80 条）并滚到底部
- 自绘窗：新增 `restoreHistory/persistHistory` 公共接口，开窗回显历史、每条消息即时落盘
- 告白概率：本地判定门槛 8 字 → 2 字；按档位给通过率 100%/80%/60%/40%/25（≥4/≥2/≥0/≥-2/<-2）
- 告白链路：`MainActivity.c/d` 调完 `startLove/startBreakup` 直接 `return-void`，
  不再继续走已停服的 Retrofit 请求，避免“服务端失败”覆盖本地结果
- 产物：`yanxi_offline_v1.0.6_plus9.apk`（23,573,411 字节，v1/v2/v3=true）

## [x] T44 分手入口（随 plus12 打包）
- 原版链路：`MainActivity.dv(int)` 建 `view/b/a`（mType 0=告白底图 `confession_input_bg`、
  1=分手底图 `confession_input_fs_bg`），提交后 `MainActivity$19.bQ` 原本按 `sync_state==8`
  分支；离线档位只有 -3..6，故分手分支永远走不到
- 面板侧：`OfflineChatBridge.installConfession` 标题栏挂「告白(0) / 分手(1)」两个按钮，
  反射 `dv(type)`；`OfflineChatWindow` 兜底窗同步加「分手」
- smali：`MainActivity` 新增字段 `oraDvType:I`，`dv(I)` 写入 type；
  `MainActivity$19.bQ` 顶部按 type 分支——type=1 跳 `:goto_1` → `MainActivity.a(...)`
  → 私有 `d(...)` → `OfflineConfession.startBreakup`；否则走 `MainActivity.b(...)`
  → 私有 `c(...)` → `startLove`（与 plus11 修复后一致）
- 结算：`startBreakup` → 降一档、`sync_value` 清零、弹「分手」结果框（好感 -1000）
- 状态：仅改源码与 smali，按要求未执行 d8/baksmali/apktool/zipalign/apksigner，未产出 APK

## [x] T45 陪伴时间改累计游玩时长 + 全 CG 页换登录背景（plus12）
- 相处小时：`OfflineMemories.hoursTogether` 不再用 `first_open_day` 到当前时钟的差值（下午打开必显示 13），
  改为读 `yanxi_offline#play_millis` 累计毫秒（含当前这一段），不足 1 小时且玩过则记 1
- 计时：`MainActivity.onResume/onPause` 各插一条 `OfflineMemories.resume/pause(Context)`，
  用 `SystemClock.elapsedRealtime()` 计前台时长，`onPause` 累加落盘
- CG：新增 `OfflineMemories.loadCg(ImageView)`，从 `assets/cg/login_bg.webp` 解码后 `CENTER_CROP` 设置；
  `MemoriesConfessionActivity.a()`（adU）、`MemoriesBigImageActivity.ov()` 两处原 `e/i;->c` 调用直接替换
- 资产：`work\d109\assets\cg\login_bg.webp`（70,492 字节，SHA-256 C7A404AD…3A330，
  与用户上传「登录背景.webp」逐字节一致；apktool.yml 的 doNotCompress 含 webp，打包后仍可 `getAssets().open`）
- 回忆数据源：`OfflineConfession.openMemories` 的 `setGetalong` 同步改用 `hoursTogether`，pic2x/pic3x 置空串
  避免离线联网加载（`MemoriesDetailsActivity` 为服务端接口驱动，离线不可达，未改）
- 构建：javac(-source/target 8) → d8(--min-api 19) → BaksmaliRunner → 覆盖 `d109\smali\com\muta\yanxi\offline`
  → apktool b → zipalign -p 4 → apksigner（keystore `yanxi-offline` / 别名 `yanxi-offline`）
- 校验：`apksigner verify` exit=0，v1/v2/v3=true；`aapt2 dump badging` 为 `com.muta.yanxi` 10066/1.0.6；
  最终 dex 反编译确认 `pause@2301`、`resume@2334`、两处 `loadCg`、`MainActivity$19.oraDvType`
- 产物：`yanxi_offline_v1.0.6_plus12.apk`（23,647,208 字节，与 plus9 同证书可覆盖安装）

## [x] T46 plus12 自查（发现并修复 2 处）
- 修复 1：`MainActivity.oraDvType` 原写成 `private`，而 `MainActivity$19` 跨类 `iget` 该字段。
  原版内部类访问私有成员时由 javac 生成 `static synthetic a/b` 桥接方法，smali 手写没有桥接，
  ART 解析字段会抛 `IllegalAccessError` → 改为包内可见（`.field oraDvType:I`）
- 修复 2：个人信息页 `daysWith()` 用 `profile_first_day`（毫秒差）算天数，回忆页 `daysTogether()`
  用 `first_open_day`（字符串 + GMT 归一日数），两处起点与算法都不同，首次进页时间不同就会显示不同天数
  → `daysWith()` 统一调 `OfflineMemories.daysTogether`，并删除已无用的 `KEY_FIRST`/写入逻辑
- 复核通过：`a()→d()→startBreakup`、`b()→c()→startLove` 链路；`$19` 类型分支；
  外部 18 个 offline 方法签名全部存在；`loadCg` 两处位点；`resume/pause` 插入点；
  APK 内 webp 与上传图 SHA-256 一致；`MainActivity$19` 与 `MainActivity` 同包可访问
- 已知非 bug 限制：`loadCg` 在主线程解码（约 70KB → 一屏 Bitmap，百毫秒级）；
  `CENTER_CROP` 会裁掉竖版图上下；进程被杀时当前一段游玩时长不落盘；
  `MemoriesDetailsActivity` 走服务端接口，离线不可达
- 最终产物：`yanxi_offline_v1.0.6_plus12.apk`（23,647,208 字节，SHA-256 00A33121…7A7A9，
  v1/v2/v3 验签 true）

---

# 第六轮：plus13（告白语音 + 1 档字幕/语音匹配）

> 依据 `spec.md §9`。用户反馈：告白语音不触发、1 档好感语音字幕不匹配。

## [x] T47 告白/分手语音触发 + 1 档改走等级 6
- 定位（已核实）：
  - 告白语音：`MainActivity.c/d` 已在 plus6 改为首行调 `OfflineConfession.startLove/startBreakup`
    后 `return-void`，原版 `user/saylove`、`user/saygoodbye` 回调链被短路；
    `OfflineConfession.apply` 只弹 `AlertDialog`，全类无音频播放
  - 1 档字幕不匹配：`OfflineStage.LEVELS` 档位 1 → 等级 7，而 `def_preference "7"` 是 T35 人工拼的，
    15 条 dialog 的 `audio` 只复用 `sources/7/7-01.mp3`、`7-02.mp3`；T32 已记录「7 级与 6 级合并」
- 改法：
  1. `OfflineStage.LEVELS`：`{4,3,2,1,7,9,10,6,5,8}` → `{4,3,2,1,6,9,10,6,5,8}`；
     `toStage(7)` 特判返回 1（旧存档迁移不偏移）；不删 `def_preference "7"`（改后不可达）
  2. `OfflineConfession`：新增 `playResultVoice`（表白按 `sources/unburden/u-{1,5,6,10}-{success|fail}.mp3`，
     等级 ≤4 用 u-1，5→5 / 6→6 / 7→6 / 8→10 / 9→10 / 10→10；分手播 `sources/burden/b-1.mp3`）；
     播放走原版 `cn.wittyneko.live2d.a.i#aa`（反射），异常回退自建 `MediaPlayer`（`openFd`，已确认 mp3 未压缩）
  3. `apply` 中在 `saveState` 之后、弹窗前触发播放
- 构建：javac(-source/target 8) → d8(--min-api 19，class 文件列表入参) → BaksmaliRunner
  → 覆盖 `work\d109\smali\com\muta\yanxi\offline`（旧目录备份 `work\offline_smali_plus12_backup`）
  → apktool b → zipalign -p 4 → apksigner（keystore `yanxi-offline`）
- 校验：
  - `OfflineStage.LEVELS` 反汇编为 `4,3,2,1,6,9,10,6,5,8`；`toStage` 首行 `const/4 0x7` + `if-ne → return 1`，
    表查询跳过索引 4（等级 6 仍落档位 4）
  - `OfflineConfession`：`VOICE_ROOT="live2d/yanxi1/sources/"`、`playResultVoice@apply`（saveState/refreshMain 之后、
    AlertDialog 之前）、`burden/b-1.mp3`、`unburden/u-` 拼接、反射 `i.aa("aa")`、`openFd` + `MediaPlayer` 回退
  - APK 内 dex 反汇编与工作 smali 一致（`playResultVoice` 同点位于第 338 行）
  - 条目数与 plus12 完全一致（1863/1863，无增删）；`unburden/*.mp3`、`burden/b-1.mp3` 仍为 stored
  - `res/raw/def_preference` 未改：APK 内与工作副本 SHA-256 均 `AF34DA2D…351A7A`（86,992 字节）
  - `apksigner verify -v`：v1/v2/v3 = true，证书 SHA-256 `6D86F90C…4863E58`（与 plus12 同证书）
  - `aapt2 dump badging`：`com.muta.yanxi` / 10066 / 1.0.6 / minSdk 19 / targetSdk 25
  - `MainActivity` 既有改动全部在包内：`oraDvType`、`startLove`@716、`startBreakup`@818、`dv→iput`@920、
    `toLevel`@1635/3561、`pause`@2301、`resume`@2334；`MainActivity$19` 仍读 `oraDvType`
- 产物：`yanxi_offline_v1.0.6_plus13.apk`（23,647,208 字节，SHA-256
  `C6FC138F9592F934C64A0185970CB480218402F70C7EBDB86A27AA4C4E395E13`）
- 已知限制：无真机，静止态无法验证出声；告白语音与结果弹窗文字不同源（包内无 unburden 字幕）；
  1 档与 4 档台词/语音、启动问候（`sign_on/s-6.mp3`）完全相同（T32 原版即如此）

---

# 第七轮：工程源码仓库化（repo/）

## [x] T48 把改造整理为可复现的工程源码仓库
- 目标：让 plus13 的成果不再依赖 `work/` 中间产物，任何人拿到 `repo/` 即可一条命令重建
- 结构（`<repo>`）：
  - `src/`：10 个离线模块 Java 源（源自 `work/offline_src`，为唯一事实来源）
  - `src-stub/`：6 个编译桩（`cn.wittyneko.b.g`、`com.google.gson.*`、`com.muta.yanxi.b.{b,c}`）
  - `overlay/`：`AndroidManifest.xml`、`res/raw/def_preference`、`assets/{cg/login_bg.webp,offline_chat.txt,sign_on/*.mp3}`、
    13 个手改 smali（MainActivity、$19、$2/$37/$38、Memories*、HomePagesActivy$j、ChatFragment、
    EaseChatRowGreet$1、view/c/a、a$2）
  - `base/upload_109.apk`（基线，23,304,885 字节，SHA-256 `084AD23E…731C81`）、`keystore/`、`tools/apktool.jar`
  - `build.ps1`、`config.example.ps1`、`README.md`、`.gitignore`、`docs/`（spec/tasks/checklist/使用说明/对照表）
- 构建脚本 9 步：反编译基线 → 编译桩类 → 编译离线模块 → d8 → baksmali → 替换 offline smali →
  覆盖 overlay → apktool b → zipalign/apksigner（含 verify）
- 实测：`.\build.ps1 -Clean` 成功，35.8 s 产出 `dist/yanxi_offline_v1.0.6_plus13.apk`
  （23,647,208 字节；build-tools 35.0.0 下与 plus13 交付包 1863 个 entry 的名称/长度/CRC32 全一致，
  仅 ZIP 时间戳不同 → SHA-256 不同；36.0.0 下 dex 有 32 字节差异，功能等价）
- 校验：`apksigner verify -v` v1/v2/v3 = true、证书 SHA-256 `6D86F90C…4863E58`；
  badging `com.muta.yanxi` / 10066 / 1.0.6 / minSdk 19 / targetSdk 25；
  dex 内 `OfflineStage.LEVELS = 4,3,2,1,6,9,10,6,5,8`、`OfflineConfession.playResultVoice` 与语音路径齐全
- 备注：本机未安装 git，仓库目录结构与 `.gitignore` 已就绪，需要时 `git init` 即可提交；
  `base/`、`keystore/`、`tools/apktool.jar`、`config.ps1`、`build/`、`dist/` 均不入库

## [x] T49 生成脱敏后的上传目录
- 产物：本目录（54 个文件，约 929 KB），由本地工程仓库清洗而来
- 移除：基线 APK、apktool.jar、keystore、config.ps1、build/、dist/
- 脱敏：本机绝对路径替换为占位符；签名口令改为 `$KsPass` / 环境变量 `YANXI_KS_PASS`
- 校验：敏感串 0 命中、无二进制/私钥、build.ps1 语法 0 错误、补齐本地文件后可完整构建
