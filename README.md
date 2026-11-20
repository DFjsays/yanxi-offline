# 嫣汐离线版（yanxi offline）

《嫣汐》（`com.muta.yanxi`，v1.0.6 / versionCode 10066）已停服，本仓库是它的**单机化改造工程源码**：
在保留原版 Live2D 立绘、触摸互动、语音、剧情台词的前提下，把必须联网的功能替换为本地实现，
并可用自备 OpenAI 兼容大模型 API 续聊。

> 仅供个人学习研究，不公开传播、不用于商业用途；原作版权归原开发方所有。
> 本工程不提供原版安装包，`base/` 下的基线包需自行准备（见「本地必需文件」）。

当前版本：**plus13**（对应 `dist/yanxi_offline_v1.0.6_plus13.apk`）

## 目录结构

```
repo/
├─ build.ps1                  一键构建脚本（Windows PowerShell 5+）
├─ config.example.ps1         本机配置模板，复制为 config.ps1 使用
├─ src/                       离线模块 Java 源码（工程主体，10 个类）
│  └─ com/muta/yanxi/offline/
├─ src-stub/                  编译桩：游戏内类 / gson 的最小签名，仅用于 javac
│  ├─ cn/wittyneko/b/g.java
│  ├─ com/google/gson/*.java
│  └─ com/muta/yanxi/b/{b,c}.java
├─ overlay/                   相对基线包的覆盖层（回编译前整体覆盖）
│  ├─ AndroidManifest.xml     注册离线 Activity
│  ├─ res/raw/def_preference  补全/修正触摸剧本 JSON
│  ├─ assets/cg/login_bg.webp 回忆页与 CG 页统一背景
│  ├─ assets/offline_chat.txt 离线聊天语料
│  ├─ assets/sign_on/*.mp3    启动问候语音
│  └─ smali/…                 13 个手改 smali（见「覆盖补丁清单」）
├─ base/upload_109.apk        基线包（本地必需，不入库）
├─ keystore/                  签名文件（本地必需，不入库）
├─ tools/                     apktool.jar（本地必需）+ BaksmaliRunner.java
├─ docs/                      spec / tasks / checklist / 使用说明 / 语音对照表
├─ build/                     构建中间产物（自动生成）
└─ dist/                      最终 APK（自动生成）
```

## 快速构建

依赖：Windows PowerShell 5.1+、JDK 8+（实测 21）、Android SDK（`platforms/android-34+`、`build-tools` 含 `d8` / `zipalign` / `apksigner`）、Python 不需要。

```powershell
cd repo
Copy-Item config.example.ps1 config.ps1   # 可选：改 JDK / SDK / 签名路径
.\build.ps1                               # 首次建议 .\build.ps1 -Clean
```

产物：`dist/yanxi_offline_v1.0.6_plus13.apk`，脚本结束会打印大小、SHA-256 与 `aapt2 badging` 摘要。

签名口令不入库：在 `config.ps1` 里设置 `$KsPass`，或设置环境变量 `YANXI_KS_PASS`；未提供时脚本会在签名步骤明确报错。

**复现性**：使用 `build-tools/35.0.0` 构建时，产物与已交付的 plus13 包**逐条目一致**（1863 个 entry 的名称、长度、CRC32 全部相同，仅 ZIP 时间戳不同，故整体 SHA-256 不同）。`build-tools/36.0.0` 也能构建成功，但 d8 生成的 dex 略有差异（功能等价）。需要严格复现时，在 `config.ps1` 固定：

```powershell
$BuildTools = '<ANDROID_SDK>\build-tools\35.0.0'
```

可选参数：

| 参数 | 作用 |
|---|---|
| `-Clean` | 清空 `build/` 后完整重建 |
| `-NoSign` | 只产出对齐后的未签名包（用于自行签名） |

构建失败会抛异常并打印当前步骤，中间产物保留在 `build/` 便于排查。

## 构建原理

`build.ps1` 严格按以下顺序执行，任一步失败即中止：

1. `apktool d base/upload_109.apk -o build/base -f`：反编译基线包，得到完整 smali / res / assets。
2. `javac` 编译 `src-stub`：给 `gson` 与游戏内 `b.b` / `b.c` / `wittyneko.b.g` 打最小签名桩，仅参与编译、不进包。
3. `javac` 编译 `src/`（离线模块，`-source 8 -target 8`，bootclasspath 指向 `android.jar`）。
4. `d8 --min-api 19` 生成 `classes.dex`。
5. `BaksmaliRunner` 把 dex 反汇编成 smali。
6. 删除 `build/base/smali/com/muta/yanxi/offline/` 并放入新生成的 smali —— 离线模块**以 Java 源码为唯一事实来源**。
7. 把 `overlay/` 整体覆盖到 `build/base/`：清单、剧本、素材、13 个手改 smali。
8. `apktool b` 回编译。
9. `zipalign -p -f 4` 对齐 → `apksigner` 签名（v1/v2/v3）→ `apksigner verify`。

## 源码结构（src/com/muta/yanxi/offline）

| 类 | 职责 |
|---|---|
| `OfflineStage` | 好感档位（-3..6）↔ 剧本等级（1..10）的唯一映射；`LEVELS={4,3,2,1,6,9,10,6,5,8}`；旧存档迁移 |
| `OfflineAffinity` | 触摸互动的好感结算：按部位加权、高好感衰减扣分、满 1000 升档 / 见底降档 |
| `OfflineChatBridge` | 接管原版 `view/c/a` 对话面板：收发消息、历史持久化、记忆插件、告白/分手入口 |
| `OfflineChatWindow` | 原版面板不可用时的自绘兜底窗（PopupWindow） |
| `OfflineConfession` | 本地表白/分手：大模型判定或本地概率兜底、结算写档、结果弹窗、`unburden` / `burden` 结果语音 |
| `OfflineMemories` | 回忆页数据：陪伴天数、累计游玩时长、档位进度、CG 统一背景、前台计时 `resume/pause` |
| `OfflineProfileActivity` | 离线个人信息页（昵称、天数、档位、互动次数、回忆入口、聊天记忆） |
| `OfflineGreeting` | 启动问候：按档位播 `sign_on/s-N.mp3`，同日一次 |
| `OfflineNGuide` | 首次启动只弹一次新手引导 |
| `ScriptImportActivity` | 剧本 JSON 导入 / 恢复内置（`ACTION_OPEN_DOCUMENT`） |

## 覆盖补丁清单（overlay/smali）

| 文件 | 改动 |
|---|---|
| `view/activity/MainActivity` | `qK` 档位→等级喂 Live2D；`qN` 档位迁移；`c/d` 转本地告白/分手；`dv` 记录 type；`onResume/onPause` 计时；`showDialog` 原版面板 + 兜底 |
| `view/activity/MainActivity$19` | 告白/分手提交按 `oraDvType` 分支 |
| `view/activity/MainActivity$2/$37/$38` | 已停服入口改 Toast |
| `view/activity/MemoriesActivity` | 回忆列表改本地数据 |
| `view/activity/MemoriesConfessionActivity` | 告白纪念页 CG 用内置背景 |
| `view/activity/MemoriesBigImageActivity` | 同上 |
| `view/activity/HomePagesActivy$j` | 「我的」页入口改离线个人页 |
| `view/fragment/ChatFragment` | 同上 |
| `widget/chatrow/EaseChatRowGreet$1` | 同上 |
| `view/c/a`、`view/c/a$2` | 原版对话面板短路环信、输入转 `OfflineChatBridge` |

`overlay/res/raw/def_preference`：在原版剧本上补全触摸台词（含第 7 段），保证档位 1 有声可播。
`overlay/assets/`：新增登录背景、启动问候语音、离线语料。

## 行为要点

- **好感档位**：`sync_state` 存 -3..6，初始 0；只有跨档才改档，档内进度 0..999。
- **触摸语音**：档位经 `OfflineStage.toLevel` 转等级后，由原版 `def_preference[等级][手势]` 驱动，播放 `assets/live2d/yanxi1/sources/<等级>/*.mp3`。
- **表白/分手**：配置了 API Key 时由大模型判定，否则本地按档位概率；结果写回存档、刷新界面、播 `sources/unburden/u-{1,5,6,10}-{success|fail}.mp3`（分手播 `sources/burden/b-1.mp3`）。
- **启动问候**：按档位播放 `assets/sign_on/s-N.mp3`，每天一次。
- **回忆页 / CG**：统一使用内置 `assets/cg/login_bg.webp`；相处时长按累计前台游玩时间统计。

## 本地必需文件（不入库）

| 路径 | 说明 |
|---|---|
| `base/upload_109.apk` | 基线包（官方精简版，v1.0.6 / 10066，23,304,885 字节，SHA-256 `084AD23E6AA2053F6E057D30F0ACFFAD159E460801E3C56C573976D03B731C81`） |
| `tools/apktool.jar` | apktool 2.11.1（<https://github.com/iBotPeaches/Apktool/releases>） |
| `keystore/yanxi-offline.keystore` | 自签名 keystore，别名 `yanxi-offline`；口令在 `config.ps1` 的 `$KsPass` 或环境变量 `YANXI_KS_PASS` 中提供，**不要写进仓库**（换签名会无法覆盖安装旧版本） |

缺文件时 `build.ps1` 会明确报错。

## 已知限制

- 本工程**无真机自动化验证**，构建只做静态校验（签名、badging、dex 内容）。
- 登录、环信 IM、朋友圈、排行榜、云相册、在线 AI 等依赖原服务端的功能永久不可用，入口已改提示。
- 表白结果弹窗文字来自大模型/本地判定，与包内固定结果语音不同源（原包无对应字幕数据）。
- 档位 1 与档位 4 共用剧本等级 6（原版「7 级与 6 级合并」），台词与语音会重复。
- 未改动 `lib/` 与 ABI 组成，安装包的可运行架构与原版一致；内存/性能取决于原版 Live2D 实现。

## 文档

- `docs/spec.md`：需求与逐轮改造方案（含代码证据）
- `docs/tasks.md`：任务流水（T1–T48，含每轮构建与校验记录）
- `docs/checklist.md`：验收清单
- `docs/使用说明.txt`：面向使用者的功能与限制说明
- `docs/真实好感情况对照表.txt`：语音素材听辨对照
