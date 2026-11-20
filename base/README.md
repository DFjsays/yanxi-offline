# base/ 基线包说明

本目录放置构建所需的**基线 APK**，不入 Git。

| 项 | 值 |
|---|---|
| 文件名 | `upload_109.apk` |
| 包名 | `com.muta.yanxi` |
| versionCode / versionName | 10066 / 1.0.6 |
| minSdk / targetSdk | 19 / 25 |
| 大小 | 23,304,885 字节 |
| SHA-256 | `084AD23E6AA2053F6E057D30F0ACFFAD159E460801E3C56C573976D03B731C81` |

## 来源与作用

这是官方“精简版”安装包（已去除广告与下载限制），也是本工程历轮改造的基线：

- 它已包含 `assets/offline_chat.txt`、`smali/com/muta/yanxi/offline/` 早期版本与离线 Activity 的清单注册；
- `overlay/` 会覆盖其中的离线模块、手改 smali、剧本与素材，因此**基线包里的离线代码只作为占位**，构建后会被 `src/` 重新生成的内容整体替换。

## 换用别的基线包

理论上可换用其他同版本包，但需确认：

1. `apktool d` 能正常反编译（无框架缺失）；
2. 包内存在 `smali/com/muta/yanxi/view/activity/MainActivity.smali` 等同名类，且方法签名与 `overlay/` 中补丁一致；
3. `assets/live2d/yanxi1/sources/` 下的语音目录完整（`1..10`、`burden`、`sign_on`、`unburden`）。

签名不同会导致无法覆盖安装旧版本，需先卸载。
