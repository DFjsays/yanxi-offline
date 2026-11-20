# 规格说明：嫣汐（com.muta.yanxi）单机化改造

## 1. 目标

将已停服的 Android 应用《嫣汐》（`com.muta.yanxi`，v1.0.6 / versionCode 10066）改造为**可离线运行、并可用自备大模型 API 续聊**的修复版 APK。保留原有 Live2D 立绘、触摸互动（点击/拖拽/长按）、语音、表情、剧情台词等本地能力；对必须依赖原服务端的功能（登录、在线 AI 聊天、朋友圈、版本检查）做替换或降级。

交付物：
- `<交付目录>\yanxi_offline_v1.0.6.apk`（文件名带 `offline` 标识）
- `<交付目录>\使用说明.txt`

约束（用户规则）：仅供个人学习使用，不公开传播；不修改本机既有文件；全部产物写入 `<交付目录>`。

## 2. 现状结论（已核实）

| 项 | 结论 |
|---|---|
| 引擎 | 纯 Java + Live2D Java 版（`cn.wittyneko.live2d`），无 Unity/UE |
| Live2D 资源 | 完全本地：`assets/live2d/yanxi1/yanxi.model.json`、`assets/image/bg_img.jpg` |
| 互动剧本 | 完全本地：`res/raw/def_preference`（84KB JSON），由 `com.muta.yanxi.b.b.pl()` 加载 |
| 语音 | 本地 `getFilesDir()/sources/*.mp3` |
| 服务端地址 | `presenter/a/a.java`：`star-fans.com` 三个域名，均已不可用 |
| 启动链路 | `SplashActivity` → `WelcomeActivity`(本地视频) → `UpdateActivity` → `LoadingFragment` |
| 阻塞点 1 | `LoadingFragment.ox()` 请求 `user/getverioncfg`；失败弹“网络链接错误”并阻断进入 |
| 阻塞点 2 | 登录仅 QQ/微信，成功后还需 `EMClient.login()`，服务端已死，无法登录 |
| 阻塞点 3 | 未登录时 `a.nz()` 为 false，所有菜单入口走 `qH()` → `LoginActivity`（死路） |
| 阻塞点 4 | `MainActivity.onResume()` 调用 `qN()/qF()` 使用环信 `chatManager()` |
| 聊天 | 依赖环信 IM + `aichat/`，无法原样离线 |

## 3. 改造方案（决策已定）

### 3.1 跳过联网启动检查
文件：`work/decoded/smali/com/muta/yanxi/view/fragment/LoadingFragment.smali`
方法：`protected ox()V`
改法：删除 `ck(version)` 与 `b.nL().nR()` 调用，改为直接
`startActivity(MainActivity.am(getActivity()))` + `finish()`。
效果：绕过 `getverioncfg`，不再出现网络错误弹窗。

### 3.2 未登录不再跳登录页
文件：`work/decoded/smali/com/muta/yanxi/view/activity/MainActivity.smali`
方法：`public qH()V`
改法：保留清空登录态逻辑，把 `startActivity(LoginActivity.am(...))` 替换为
`Toast.makeText(this, "单机版：该功能需要联网，已不可用", LENGTH_SHORT).show()`。

### 3.3 环信调用防崩
文件：同上
方法：`private qN()V`、`private qF()V`
改法：方法体首行 `return-void`（保留签名），避免未登录调用 `chatManager()` 崩溃。

### 3.4 聊天改造：大模型 API 优先 + 本地语料兜底

新增 Activity：`com.muta.yanxi.offline.OfflineChatActivity`（纯代码构建 UI，不新增 layout 资源）。

**UI 结构**
- 顶部标题栏：左“嫣汐 · 对话”，右“设置”按钮（齿轮文字按钮）。
- 中部：`ScrollView` + 竖向 `LinearLayout`，消息气泡（用户右侧、嫣汐左侧，纯代码 `GradientDrawable` 圆角背景）。
- 底部：`EditText` + “发送”按钮。
- 标题栏右侧另设“语音/表情提示”：点击嫣汐气泡时 `Toast` 显示该句出自哪个动作（可选，低优先级）。

**聊天后端（三级降级）**
1. **API 模式**（已配置 Key 时）：
   - 协议：OpenAI 兼容 `POST {baseUrl}/chat/completions`（`HttpURLConnection`，HTTPS，超时 15s/30s）。
   - 请求体：`{"model":..., "messages":[{role:system, content:<人设>}, ...历史(最多12轮)], "temperature":0.8, "max_tokens":512}`。
   - 鉴权：`Authorization: Bearer {apiKey}`；`Content-Type: application/json`。
   - 解析：读取 `choices[0].message.content`（用 `org.json` 解析，Android 内置，无需额外依赖）。
   - 人设 system prompt（内置，基于原作设定）：
     > 你是虚拟歌姬“嫣汐”（YanXi），MUTA 第一位歌姬。你是用户的“艺人”，用户是你的经纪人。
     > 说话温柔、略带俏皮，会撒娇也会小小地闹脾气；称呼对方为“经纪人”。
     > 回复简短自然（1~3 句，80 字以内），不要提及自己是 AI 或语言模型，不要使用括号动作描写以外的格式。
     > 若被问到停服/无法联网，就当作不知道，继续以角色身份聊天。
2. **本地语料模式**（无 Key 或 API 失败）：
   - 读取 `assets/offline_chat.txt`：每行 `关键词<TAB>回复`。
   - 关键词命中优先（分词后包含匹配），同关键词多条随机；未命中走通用兜底池。
   - 回复延迟 300~600ms 显示，模拟打字。
3. **兜底**：语料也为空时用内置 5 条默认台词。

**API 设置界面**（点击“设置”弹出）
- 字段：`Base URL`（默认 `https://api.deepseek.com`）、`API Key`、`模型`（默认 `deepseek-chat`）。
- 预设快捷项：DeepSeek / OpenAI / Moonshot / 自定义（点击填充 Base URL 与默认模型）。
- 提供“测试连接”按钮：发一条 `你好` 的最小请求，回显成功/错误码。
- 提供“清除 Key”按钮，回到本地语料模式。
- 存储：`SharedPreferences("yanxi_offline")`，键 `api_base`/`api_key`/`api_model`。
- Key 仅存本机，不上传任何第三方（除用户自填的服务商）。

**入口替换**
- `MainActivity$35.smali`（聊天图标 `anf.ade`）`onClick` → 启动 `OfflineChatActivity`
- `MainActivity$3.smali`（气泡 `anf.adh`）`onClick` → 同上

**Manifest**
```xml
<activity android:name=".offline.OfflineChatActivity"
          android:exported="false"
          android:screenOrientation="1"
          android:windowSoftInputMode="adjustResize"
          android:theme="@android:style/Theme.Holo.NoActionBar"/>
```
> 注：targetSdk 25，HTTPS 请求无需 `usesCleartextTraffic`；若用户填 http 地址，需在 Manifest `application` 上加 `android:usesCleartextTraffic="true"`（本方案默认加上，兼容自建代理）。

### 3.5 编译与签名
1. `javac -source 8 -target 8 -bootclasspath <android.jar>` 编译 `OfflineChatActivity.java`。
2. `d8 --min-api 19 --lib android.jar` 生成 `classes.dex`。
3. baksmali 2.5.2 反汇编，仅保留 `com/muta/yanxi/offline/` 放入 `decoded/smali/`。
4. `java -jar tools\apktool.jar b work\decoded -o work\out_unsigned.apk`
5. `zipalign -f -p 4` → `keytool` 生成 `work/yanxi-offline.keystore` → `apksigner sign`（v1+v2）。
6. 输出 `yanxi_offline_v1.0.6.apk`。

## 4. 验收标准

- [ ] `apktool b` 成功，无 smali 语法错误。
- [ ] `aapt2 dump badging` 能解析产物，包名/版本号不变，minSdk 19。
- [ ] `apksigner verify -v --print-certs` 通过（v1/v2 均 OK）。
- [ ] 产物含 `assets/offline_chat.txt`、`com/muta/yanxi/offline/OfflineChatActivity`、Manifest 新条目。
- [ ] 静态核对：`LoadingFragment.ox()` 无 `getverioncfg`；`qH()` 无 `LoginActivity`。
- [ ] 代码审查 `OfflineChatActivity`：API 请求为 HTTPS、超时已设、异常全捕获、无主线程网络调用（用 `Thread`/`Handler`）。
- [ ] 说明文档写明未真机验证的范围与已知限制。

## 5. 已知限制 / 风险

- 本机无 adb 设备与模拟器，**无法运行时验证**，需用户自行安装实测。
- API 模式依赖用户自备服务商与 Key；无 Key 时退回本地语料，功能可用但对话不自由。
- 原在线功能（登录、朋友圈、排行榜、录音室上传、在线 AI）永久不可用。
- 若 `UpdateActivity` 另有联网阻断，需追加同类补丁（tasks T8 兜底）。
- 环信 SDK 其他路径仍可能异常，已在 3.3 防御。

## 6. 影响范围

仅改动 `work/decoded` 工程内文件与 `work/` 中间产物；原始 `game.apk`、解包副本 `work/apk` 均保持不变。

## 7. plus4 之后的功能审计（beijing 精简版 v1.0.9 / 实际 1.0.6）

审计对象：`work/d109`（用户提供的精简版完整反编译工程）。

### 7.1 反射/静默异常类问题（“和告白同类”的错误）

| 位置 | 机制 | 结论 |
|---|---|---|
| `offline/OfflineChatWindow.openConfession()` | 原 `Class.getMethod("dv", int)` 调 private → 异常被 `catch (Throwable)` 吞掉 | **plus4 已修**（`getDeclaredMethod` + `setAccessible`） |
| `offline/OfflineProfileActivity.readInt`、`OfflineConfession.method/saveState` | 已是 `getDeclaredMethod` + `setAccessible`，并沿继承链查找 | 正常 |
| 全包其余 `Class.getMethod` | 仅在 `okhttp/support/sharesdk/push/igexin` 等第三方库 | 不涉及 |
| `com/muta/yanxi/e/a/a.ac(Context)` | `StorageManager.getVolumePaths` 反射，失败仅返回空列表并有完整 catch | 不影响游戏功能，不改 |

结论：offline 包内 **不存在第二处** 告白式静默失败；其余 `catch Throwable` 均为“失败不崩、功能降级”。

### 7.2 被隐藏 / 断开的“告白类”子界面

| 子界面 | 原版入口 | 离线现状 | 判定 |
|---|---|---|---|
| 告白成功纪念页 `MemoriesConfessionActivity` | `MainActivity$29.onNext`（服务端成功回调） | 离线 `OfflineConfession.apply` 只弹 AlertDialog，**永不跳转** | 隐藏功能，可补“查看回忆”入口 |
| 分手流程 | `MainActivity$19.bQ` 按 `sync_state` 分支 → `startBreakup` | 功能可用，但聊天窗只放了“表白”按钮；type=1 背景（`0x7f0200ec`）只在已废弃的 `view/c/a` 回调 `$21.qR()` 里使用 | 功能在，UI 区分缺失 |
| 主界面 3 处热点 `$7/$8/$9` | 直接 `dv(0)`（告白弹窗） | 正常（非反射，plus4 修复后可提交） | 正常 |
| “我的”页原子入口：回忆 `MemoriesActivity`、我的歌 `MySongActivity`、设置 `SettingActivity`、广场 `HomePagesActivy` | `MyHomeActivity` 内的 `adapter/a$a$1` 与 `MyHomeActivity$5` | `MainActivity$6` 已改 `OfflineProfileActivity`，上述入口**全部不可达** | 隐藏功能（设置已在离线个人页内实现） |
| `MyHomeActivity.am` 3 处残留调用 | `ChatFragment:104`、`EaseChatRowGreet$1:56`、`HomePagesActivy$j:52` | 只在 IM / 社交页内可达；离线 `a.nz()` = 未登录 → `$36` 走 `qH()` Toast，这些页面进不去 | 隐患，建议一并改成离线个人页 |
| 消息 `IMChatMainActivity`、朋友圈 `CircleFriendsActivity`、网页 `WebActivity`（$36/$2/$37/$38） | 主界面图标 | `$36` 有 `nz()` 拦截 → Toast；`$2/$37/$38` 无拦截，进入后为空白/转圈 | 死服务入口，可不改或改提示 |

### 7.3 plus5 方案（建议，待批准）

- **A（低风险，必做）** 3 处 `MyHomeActivity.am(...)` → `OfflineProfileActivity.a(...)`
  （都是 `(Context)->Intent`，签名一致，单行替换）。
- **B（低风险，必做）** `$2/$37/$38` 三个死入口点击改为 Toast「该功能已随服务器停止服务」，
  避免白屏/空列表；`$36` 已由 `qH()` 覆盖，不动。
- **C（中风险，可选）** 告白成功弹窗增加「查看回忆」按钮：`OfflineConfession.apply`
  在 `accept=true` 时用本地存档构造 `illustraData`（档位、相伴天数、`sync_show_value`、
  当前时间），反射启动 `MemoriesConfessionActivity`；`pic2x/pic3x` 为空，
  `e/i.c` 失败时保持内置底图。不改 `dv(1)` 背景与分手入口，避免误判恋爱状态。

验收：`apktool b` 通过；`apksigner verify -v` 全 true；`aapt2 dump badging` 包名/版本/minSdk 不变；
反汇编抽查 3 处替换与 Toast 文案确实在 dex 中。

## 8. plus6：好感档位重构 + 语音归位 + tasks 遗留项

### 8.1 已核实的关键事实（本轮代码证据）

| 事实 | 证据 |
|---|---|
| 触摸语音数据源是**本地** `res/raw/def_preference`，不是服务端 | 顶层键为 `1..10` 与 `default`；节点含 `motion/expression/value/dialog`，`dialog.audio` 形如 `1/head-face-hand-tap-01.mp3` |
| 音频实际根目录为 `assets/live2d/yanxi1/sources` | `b/c` 中 `ajJ = JJ + "sources"`，播放前拼 `ajJ + "/" + audio` |
| 档位（等级槽）由 `MainActivity.qK()` 传给 Live2D | 读 `sync_state`（默认 1）→ `ani.aS(String.valueOf(v))` |
| `qN()` 把 `sync_state` 强行钳在 1..10 并跳过 7 | `MainActivity.qN()` 第 1523 行起 |
| 触摸手势名由 `b/b.n(FF)Z`（tap）/`o(FF)V`（drag）生成 | 拼 `"tap_"+部位` / `"drag_"+部位`，再调 `b/c.n(key,2)` |
| 等级 7 在剧本中缺失，故该档点击无台词无语音 | `def_preference` 无 `7` 键；`default` 只有 sound_on/off |
| 各语音文件夹条数 = 用户听辨的档位分布 | 1:12 2:12 3:30 4:10 5:31 6:11 7:2 8:30 9:30 10:30 |

**档位 ↔ 等级/文件夹（唯一权威表，与 T32 一致，且与文件条数吻合）**

| 档位 | -3 | -2 | -1 | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
|---|---|---|---|---|---|---|---|---|---|---|
| 等级/文件夹 | 4 | 3 | 2 | 1 | 7 | 9 | 10 | 6 | 5 | 8 |

> 与早期摘要里的 `-3,4/-2,3/-1,2/0,1/1,9/2,10/3,6/4,5/5,8/6,7` 不同：那份把 5/6/8 三档错位；
> 以 `语音清单_按真实好感档位.txt` 的分档条数（-3:10/-2:30/-1:12/0:12/2:30/3:30/4:11/5:31/6:30）
> 与文件夹实际条数比对，本表为正确解。

### 8.2 决策

1. **`sync_state` 改为存真实档位** `-3..6`，默认 **0**（用户明确要求“初始账号 0 档”）。
   读取时统一经 `OfflineStage.toLevel(stage)` 转成脚本等级再喂给 Live2D / UI。
2. **触摸语音不新写播放器**：只要等级正确，`def_preference[等级][手势]` 的 `audio` 就会解析到
   正确文件夹，原版播放链路（`cn/wittyneko/live2d/a/i.aa`）自动生效。
   仅补一条 `7` 剧本段（用 `sources/7` 现有 2 个 mp3），消除“档位 1 点击完全无声”。
3. **启动问候按档位**：`OfflineGreeting` 改为 stage→level→`sign_on/s-N.mp3`，
   `s-8` 缺失时回退到最近可用（s-6 → s-7 → s-1）。
4. **T29 采用“完全接管”**：恢复 `view/c/a` 原版面板入口，新增 `OfflineChatBridge`
   接管收发与历史，短路其环信/服务端方法；面板构造失败时自动回落到 `OfflineChatWindow`。
5. 其余遗留项按 tasks.md `T25/T26/T27/T30/T31` 原方案执行。

### 8.3 改动清单（精确到方法）

**A. 新增 `work/offline_src/com/muta/yanxi/offline/OfflineStage.java`**
- `public static int toLevel(int stage)`：按 8.1 表；未知值先 `clampStage`。
- `public static int toStage(int level)`：反向表（7→1）。
- `public static int clampStage(int)`：`-3..6`。
- `public static int upStage(int)` / `downStage(int)`：在 -3..6 内步进，端点原值返回。
- `public static String folder(int stage)`：返回 `String.valueOf(toLevel(stage))`。
- `public static String label(int stage)`：中文档位名（极度排斥/厌恶/冷淡/陌生/微好感/好感/亲近/喜欢/依赖/爱恋）。

**B. 重写 `OfflineAffinity`（改为 Java 源，覆盖现有 smali）**
- `onTap(Context, int delta)`：`sync_state` 默认 **0**（`OfflineStage.clampStage`）；
  `sync_value` 0..999；`value += delta * 10`；
  满 1000 且 stage<6 → `upStage`、`value -= 1000`；value<0 且 stage>-3 → `downStage`、`value += 1000`；
  端点时 value 钳 0..999。写回 `sync_state/sync_value/sync_tap_count/sync_delta_value/sync_cache_value`。
  另写 `yanxi_offline` 的 `stage_total`（累计好感）供回忆页展示。
- 升级/降档 Toast 文案随档位名。

**C. `MainActivity.smali`**
- `qK()`：`getInt("sync_state", 0)` → `OfflineStage.toLevel(v)` → `aS(String.valueOf(level))`。
- `qN()`：删“1..10 + 跳过 7”钳制，改为 `OfflineStage.clampStage` + 旧数据迁移：
  若读到 1..10 且首次迁移（`yanxi_offline/stage_migrated` 未置位）→ 按 `toStage` 写回，
  置位后不再迁移。`sync_value` 钳 0..999。
- `onCreate` 收敛点：`OfflineNGuide.maybeShow(this)`（T30）。

**D. `res/raw/def_preference`**
- 新增顶层 `"7"`：复制 `"6"` 的手势键集合，`dialog.audio` 依次替换为
  `7/<实际存在的文件>`（现只有 2 个 mp3），其余键给空数组（避免误播）；`value` 区间沿用 6。

**E. `OfflineGreeting`（改为 Java 源）**
- `maybeGreet(Activity)`：同日只播一次（保留 `greet_day`）；
  读 `sync_state`（默认 0）→ `toLevel` → `sign_on/s-<level>.mp3`；文件不存在时按
  `level-1, level+1, 1` 顺序回退（跳过 8）。Toast 时段文案保留。

**F. T29 `view/c/a` 面板完全接管（用户已确认选此项）**
- 恢复 `MainActivity.showDialog()` 为原版面板流程：`new com.muta.yanxi.view.c.a(this)` →
  `showAtLocation(...)`；整段用 `try/catch(Throwable)` 包住，失败回落 `OfflineChatWindow`（保证不白屏）。
  （原版构造代码仍留在 `MainActivity` 内另一方法，直接复用，勿重写）
- 新增 `work/offline_src/com/muta/yanxi/offline/OfflineChatBridge.java`（数据接管层）：
  - `send(Activity, Object panel, String text)`：本地语料 / 已配置的 OpenAI 兼容 API 生成回复，
    通过反射调 `view/c/a;->ce(String)` 回填嫣汐消息；同时 `live2d_show_mini_dialog` 联动表情/气泡。
  - `onShow(Object panel)`：面板展示后主动插入一条开场白（取本地语料），避免空列表。
  - `saveHistory(Context, String who, String text)`：写入 `files/offline_history.tsv`，供 T31 回忆页读取。
  - 全部反射调用 `getDeclaredMethod + setAccessible`（沿用 plus4 结论），异常只记日志不抛。
- `view/c/a.smali` 必须短路/改写的点（逐条静态确认）：
  1. `sendMessage(Lcom/hyphenate/chat/EMMessage;)V` 首行 → 取 `body.getText()` 调 `OfflineChatBridge.send` 后 `return-void`
  2. `rV()` 首行 `return-void`（不注册 `EMMessageListener`、不拉环信历史）
  3. `rO()` / `rX()` / `rZ()` 首行 `return-void`（服务端/网络逻辑）
  4. `sb()` 保持原样（只做 UI 刷新），若内部引用 `aau` 则加空判断
  5. `m(Ljava/util/ArrayList;)V` 与 `ce(Ljava/lang/String;)V` 不改（作为回填入口）
- 头像/气泡沿用原版 `chat_message_bg_a/b` 与 `view/c/*` 行布局，不新增素材。
- 已知风险：`EMMessage.createSendMessage` 可能隐式依赖 `EMClient`；若 `sendMessage` 之前面板已构造
  EMMessage 并崩溃，则在下一步改为“输入框点击直接调 bridge、不构造 EMMessage”（保留回退开关）。

**G. `OfflineProfileActivity`**
- 档位显示改用 `OfflineStage.label(stage)`；进度条分母仍 1000；旧值先 `toStage` 迁移。

**H. `OfflineConfession`（T27 + 档位适配）**
- 成功加分由 `total += 400` 改为按档位推进：`value += 400`，满 1000 升档（用 `OfflineStage.upStage`）。
- 分手：`stage = -3`、`value = 0`（原先 `state -1` 语义修正）。
- `accept=true` 时 AlertDialog 增加中性按钮「查看回忆」，反射构造 `entity.illustraData`
  并 `startActivity(MemoriesConfessionActivity.a(ctx, data))`；异常回落原弹窗。

**I. T31 `OfflineMemories`（新增）+ `MemoriesActivity.qT()`**
- `qT()` 首行 `if (OfflineMemories.fill(this)) return;`，本地构造列表：
  档位与进度、相伴天数（`yanxi_offline/first_day`）、互动次数、告白结果、最近聊天片段；
  无数据给「暂无回忆」占位。`qS()` 分享按钮改为本地保存提示（离线不传图床）。

**J. T25 / T26**
- `ChatFragment.smali:104`、`EaseChatRowGreet$1.smali:56`、`HomePagesActivy$j.smali:52`：
  `MyHomeActivity->am` → `OfflineProfileActivity->a`。
- `MainActivity$2/$37/$38` 的 `onClick` 开头插入 Toast「该功能已随服务器停止服务」+`return-void`。

**K. T30 `OfflineNGuide`（新增）**
- `maybeShow(Activity)`：`yanxi_offline/guide_shown` 未置位时 `startActivity(NoviceGuideActivity.g(ctx, true))`，
  置位后不再触发。若 `NoviceGuideActivity.onCreate` 仍请求服务端，则一并短路。

### 8.4 编译与装配（沿用既有链路）

1. `javac -source 8 -target 8 -bootclasspath <android-36 jar>` 编译 `work/offline_src`（含新增 3 个类）。
2. `d8 --min-api 19 --lib android.jar` → `work/dex_plus6/classes.dex`。
3. `BaksmaliRunner` 反汇编 → 只取 `com/muta/yanxi/offline/*` 覆盖 `work/d109/smali/...`。
4. 手改 smali：`MainActivity`、`MainActivity$2/$37/$38`、`ChatFragment`、
   `EaseChatRowGreet$1`、`HomePagesActivy$j`、`MemoriesActivity`。
5. `apktool b work/d109` → `zipalign -f -p 4` → `apksigner sign`
   → `yanxi_offline_v1.0.6_plus6.apk`。

### 8.5 验收

- [ ] `def_preference` 为合法 JSON，且含 `"7"`（PowerShell `ConvertFrom-Json` 校验）。
- [ ] 反汇编确认：`qK` 内出现 `OfflineStage->toLevel`；`getInt("sync_state",0)`（默认 0）。
- [ ] 反汇编确认：三个文件不再出现 `MyHomeActivity->am`；`$2/$37/$38` 含“该功能已随服务器停止服务”。
- [ ] `apksigner verify -v` v1/v2/v3 = true；`aapt2 dump badging` 包名 `com.muta.yanxi`、
  versionCode 10066、1.0.6、minSdk 19 不变。
- [ ] `OfflineStage`、`OfflineMemories`、`OfflineNGuide` 在 dex 中可检索到。
- [ ] 静态核对 `OfflineGreeting` 回退链不含 `s-8`。

### 8.6 风险

- 无真机/模拟器，**全部改动仅静态校验**；触摸语音是否真正出声需用户安装实测。
- `def_preference` 增加 `"7"` 后若字段结构与 `b/b.aS()` 解析预期不符，可能导致该档点击异常；
  已限定只复制 `"6"` 的键结构与 value 区间，风险可控。
- `illustraData` 反射字段名若与实体不符，T27 按钮会静默回退（有 catch 兜底，不崩）。
- 档位语义切换后，旧存档（等级 1..10）由一次性迁移处理；迁移失败按 0 档处理。

## 9. plus13：告白语音 + 1 档字幕/语音匹配（本轮）

用户反馈两条缺陷：①「告白语音不触发」②「1 档好感语音字幕不匹配」。以下结论均已用包内文件核实。

### 9.1 根因（代码证据）

| 缺陷 | 根因 |
|---|---|
| 告白语音不触发 | `MainActivity.c(IIII,String)` / `d(IIII,String)` 已在 plus6 改为首行调用 `OfflineConfession.startLove/startBreakup` 后 `return-void`，原版 `user/saylove`、`user/saygoodbye` 回调链（含语音）被整段短路；而 `OfflineConfession.apply()` 只弹 `AlertDialog`，全类无任何音频播放代码 |
| 1 档字幕不匹配 | `OfflineStage.LEVELS` 档位 1 → 等级 7；`res/raw/def_preference` 顶层 `"7"` 是 T35 按 `"6"` 的手势结构人工拼出的，8 类互动共 15 条 `dialog` 的 `audio` 只复用 `sources/7/7-01.mp3`、`7-02.mp3` 两条（该目录仅此 2 条 mp3），字幕与语音必然对不上；T32 听辨记录亦写明「7 级与 6 级合并」「1 档无独立语音素材」 |

### 9.2 语音播放机制（已核实，用于修复）

- 播放器：`cn.wittyneko.live2d.a.i;->aa(Ljava/lang/String;)V` 静态方法，入参为 **assets 相对路径**；
  内部 `AssetManager.openFd` → 静态 `MediaPlayer`（播放前 release 上一条）→ `prepare/start`；
  受静态布尔 `i.KU` 控制（`KU` 由 `com.muta.yanxi.c;->nU()` 每句同步，即游戏内“声音”开关）。
- 路径前缀：`b/c.a(GL10,String)` 里 `ajJ = JJ + "sources"`，`JJ` 为模型路径截到最后一个 `/`，即 `live2d/yanxi1/`；
  故触摸语音实际读 `live2d/yanxi1/sources/<folder>/<file>.mp3`。
- 素材（均已确认存在于 APK 内且 **stored 未压缩**，`openFd` 可用）：
  `assets/live2d/yanxi1/sources/unburden/u-{1,5,6,10}-success.mp3`、
  `u-{1,5,6,10}-fail.mp3`、`assets/live2d/yanxi1/sources/burden/b-1.mp3`、`b-2.mp3`。
- `i.aa` 内部只 `catch IOException`；静态 `context` 为 null 时会抛 NPE，**调用方必须 catch Throwable**。

### 9.3 决策

1. **1 档复用 6 级**：`OfflineStage.LEVELS[4]` 由 `7` 改为 `6`（依据 T32「7 级与 6 级合并」）。
   效果：档位 1 与档位 4 共用等级 6 剧本与语音，字幕/语音一一对应；`sources/7` 与 `def_preference "7"` 变为不可达。
2. **不删 `def_preference "7"`**：映射改动后该段不再被 `b/c.a(JsonObject,String,int)` 读取，
   保留可避免重写 87KB JSON 带来的结构风险（最小改动原则）。
3. **`toStage(7)` 仍返回 1**：旧存档里原版等级 7 对应档位 1，迁移不得偏移到 0 档。
4. **告白/分手语音改由 `OfflineConfession` 主动播放**：使用原版 `i.aa`，失败回退自建 `MediaPlayer`。

### 9.4 改动清单（精确到文件与方法）

**A. `work/offline_src/com/muta/yanxi/offline/OfflineStage.java`**
- `LEVELS` 常量：`{4, 3, 2, 1, 7, 9, 10, 6, 5, 8}` → `{4, 3, 2, 1, 6, 9, 10, 6, 5, 8}`（仅索引 4 变）。
- `toStage(int level)` 首部加 `if (level == 7) { return 1; }`（保留反向兼容）。
- 类注释改为「档位 1 与 4 共用等级 6（T32：7 级与 6 级合并）」。

**B. `work/offline_src/com/muta/yanxi/offline/OfflineConfession.java`**
- 新增常量 `VOICE_ROOT = "live2d/yanxi1/sources/"`、静态 `MediaPlayer sVoice`。
- 新增 `private static void playResultVoice(Activity act, int state, boolean accept, boolean breakup)`：
  - 分手 → `VOICE_ROOT + "burden/b-1.mp3"`
  - 表白 → `VOICE_ROOT + "unburden/u-" + nearestUnburdenLevel(OfflineStage.toLevel(state)) + (accept ? "-success" : "-fail") + ".mp3"`
  - `nearestUnburdenLevel(int level)`：可用集合 `{1,5,6,10}`；`level <= 4`（档位 0 及负档）一律 `1`；
    其余取数值最近、平局取较大（5→5、6→6、7→6、8→10、9→10、10→10）。
- 新增 `private static void playVoice(Context ctx, String assetPath)`：
  1. `Class.forName("cn.wittyneko.live2d.a.i")` → `getMethod("aa", String.class)` → `invoke(null, path)`；
  2. 捕获任何 `Throwable` 后回退：`ctx.getAssets().openFd(path)` → 自建 `MediaPlayer.setDataSource(fd, offset, length)` →
     `prepare()` → `start()`；静态持有 `sVoice`，下次播放前先 `release()`；仍失败则静默（不影响弹窗）。
- `apply(...)`：在 `saveState(act, ...)` 之后、构造 `AlertDialog` 之前调用 `playResultVoice(act, state, r.accept, breakup)`。

**C. 构建（沿用既有链路，无 smali 手改）**
- `javac -source 8 -target 8 -encoding UTF-8 -nowarn`（`-bootclasspath` android-36 `android.jar`，
  `-classpath android.jar;work\stub_classes`）→ `d8 --min-api 19 --lib android.jar`
  → `BaksmaliRunner` → 仅覆盖 `work\d109\smali\com\muta\yanxi\offline\*`。
- `apktool b work\d109` → `zipalign -p -f 4` → `apksigner sign`
  → 产物 `yanxi_offline_v1.0.6_plus13.apk`。

**D. `tasks.md`**：追加 `T47`（问题定位、决策、校验结果、产物哈希）。

### 9.5 验收

- [ ] `def_preference` 未被改写：SHA-256 与 plus12 工作副本一致（避免误伤剧本）。
- [ ] 反汇编 `OfflineStage.smali`：`LEVELS` 数组第 5 项为 `0x6`（原 `0x7`），`toStage` 含 `if level==7 → return 1`。
- [ ] 反汇编 `OfflineConfession.smali`：常量池含 `live2d/yanxi1/sources/`、`unburden/u-`、`burden/b-1.mp3`、
      `-success`、`-fail`；含 `cn/wittyneko/live2d/a/i;->aa` 调用与 `MediaPlayer` 回退。
- [ ] `apply` 中 `playResultVoice` 位于 `saveState` 之后、`AlertDialog$Builder` 之前。
- [ ] `apksigner verify -v`：v1/v2/v3 = true；`aapt2 dump badging`：`com.muta.yanxi` / 10066 / 1.0.6 / minSdk 19。
- [ ] APK 内 `assets/live2d/yanxi1/sources/unburden/*.mp3`、`burden/b-1.mp3` 存在且 stored。
- [ ] 产物落在 `<交付目录>\yanxi_offline_v1.0.6_plus13.apk`，并记录 SHA-256。

### 9.6 风险与已知限制

- **无真机**：无法验证实际出声，仅能静态确认路径/调用存在；若 `i.aa` 静态 context 意外为空，
  回退 `MediaPlayer` 仍应出声（两条路径都失败时静默，不崩）。
- **弹窗与语音不同步**：语音是包内固定台词，弹窗文字是模型/本地判定回复，二者内容本就不同（此前的行为也如此）；
  本修复只保证「有告白/分手语音」，不做字幕与语音的一一对应（包内无 unburden 文本数据）。
- **档位 1 与档位 4 台词/语音相同**：符合 T32 听辨结论，但听感上会重复。
- **档位 1 的启动问候变为 `sign_on/s-6.mp3`**（同样因映射改动），与档位 4 相同。
