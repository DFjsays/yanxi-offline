# 验收清单：plus6（档位重构 + 语音归位 + 遗留项）

> 对应 `spec.md §8` 与 `tasks.md` 第五轮 T33–T40。

## 档位与存档
- [x] `OfflineStage` 提供 `toLevel/toStage/clampStage/upStage/downStage/folder/label/migrate`
- [x] 映射符合 `-3..6 ↔ 4,3,2,1,7,9,10,6,5,8`
- [x] `sync_state` 新档默认 0，`qK/qN` 均先 `OfflineStage.migrate` 再 `toLevel`
- [x] 旧存档（1..10）经一次性迁移落为档位，`sync_value` 钳 0..999
- [x] `OfflineAffinity.onTap` 按档位 ±1、满 1000 进/退档，无“跳过第 7 档”逻辑

## 语音与剧本
- [x] `def_preference` 含顶层 `"7"`，手势键与 `value` 区间沿用第 6 段
- [x] 第 7 段 `dialog.audio` 指向 `sources/7/` 现有 mp3
- [x] `OfflineGreeting` 按 `stage→level→sign_on/s-N.mp3` 播放，`s-8` 缺失有回退
- [x] 启动问候仍保持“同日一次 + 时段 Toast”

## 原版面板接管
- [x] `showDialog` 恢复 `view/c/a` 原版面板，异常时回落 `OfflineChatWindow`
- [x] `OfflineChatBridge.attach` 反射接管 `ahe/aaD` 列表并换离线适配器
- [x] 输入回调 `a$2.ch` 优先走 `OfflineChatBridge.onInput`
- [x] `sendMessage` 转 `OfflineChatBridge.onMessage`，不再调用环信 `saveMessage`
- [x] `rV` 不再注册环信监听；`rX` 去掉解绑但保留 `dismiss()`
- [x] 相册回执 `sb()` 短路，不再走环信发图

## 遗留项
- [x] 三处 `MyHomeActivity.am` 改为 `OfflineProfileActivity.a`
- [x] `MainActivity$2/$37/$38` 死入口改 Toast 并 return
- [x] 告白成功弹窗含「查看回忆」，异常回落 Toast
- [x] 首次启动弹一次 `NoviceGuideActivity`（`guide_shown` 标记）
- [x] `MemoriesActivity.qT` 本地填充，不再发 Retrofit 请求
- [x] 个人信息页档位文案统一走 `OfflineStage.label`

## 构建与产物
- [x] javac 0 error，d8 `--min-api 19` 成功
- [x] apktool 回编译成功，zipalign `-f -p 4` 成功
- [x] `apksigner verify -v`：v1/v2/v3 全 true
- [x] badging：`com.muta.yanxi` / 10066 / 1.0.6 / minSdk 19 未变
- [x] 新类 `OfflineStage/OfflineChatBridge/OfflineNGuide/OfflineMemories` 在 dex 中
- [x] 产物 `yanxi_offline_v1.0.6_plus6.apk` 落在 `<交付目录>`

---

> 对应 `spec.md §9` 与 `tasks.md` 第六轮 T47（plus13）。

## 1 档语音/字幕
- [x] `OfflineStage.LEVELS` 第 5 项 = 6（档位 1 → 等级 6，字幕/语音一一对应）
- [x] `OfflineStage.toStage(7)` 仍返回 1（旧存档从原版等级 7 迁移不偏移）
- [x] `res/raw/def_preference` 未被改写（映射改动后 `"7"` 段不可达）

## 告白/分手语音
- [x] `OfflineConfession.apply` 在 `saveState` 之后、弹窗前调用 `playResultVoice`
- [x] 表白按档位挑 `sources/unburden/u-{1,5,6,10}-{success|fail}.mp3`
      （等级 ≤4 用 u-1；5→5、6→6、7→6、8→10、9→10、10→10）
- [x] 分手播 `sources/burden/b-1.mp3`
- [x] 优先调原版 `cn.wittyneko.live2d.a.i;->aa`，抛异常时回退自建 `MediaPlayer`（仍失败静默不崩）

## 构建
- [x] javac / d8 / baksmali 成功，仅覆盖 `com/muta/yanxi/offline/*`
- [x] apktool b + zipalign + apksigner 成功，v1/v2/v3 = true，10066/1.0.6/minSdk 19 未变
- [x] 产物 `yanxi_offline_v1.0.6_plus13.apk` 落在 `<交付目录>`

---

> 对应 `tasks.md` 第七轮 T48（工程源码仓库化）。

## 仓库结构
- [x] `src/` 含 10 个离线模块 Java 源，`src-stub/` 含 6 个编译桩
- [x] `overlay/` 含清单、剧本、素材与 13 个手改 smali
- [x] `base/`、`keystore/`、`tools/` 本地必需文件齐备且 README 记录来源与哈希
- [x] `.gitignore` 排除构建产物、配置与二进制基线

## 一键构建
- [x] `build.ps1` 9 步流程可跑通（反编译→编译桩→编译源码→d8→baksmali→替换 offline→覆盖→回编译→对齐签名）
- [x] `-Clean` / `-NoSign` 参数可用，失败即中止并保留中间产物
- [x] 实跑 `.\build.ps1 -Clean` 成功并输出 `dist/yanxi_offline_v1.0.6_plus13.apk`
- [x] build-tools 35.0.0 下产物与 plus13 交付包逐条目（名称/长度/CRC32）一致
- [x] `apksigner verify` v1/v2/v3 = true；badging 10066 / 1.0.6 / minSdk 19 未变
- [x] dex 内档位映射与告白语音代码可检索

---

## 上传目录（脱敏）
- [x] 已移除基线 APK、apktool.jar、keystore、config.ps1 与构建产物
- [x] 本机路径与签名口令已脱敏
- [x] 上传副本可独立构建（补齐本地必需文件后）
