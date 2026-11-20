# 上传说明

本目录是**可直接上传（如 GitHub）的工程源码**，由 `Yanxi-APK-mod\repo` 清洗而来。

## 已移除的内容

| 内容 | 原因 |
|---|---|
| `base/upload_109.apk`（基线 APK） | 原版应用安装包，体积大且版权归原开发方，不适合公开分发 |
| `tools/apktool.jar`（24 MB） | 第三方构建工具二进制，按 README 从官方发布页获取 |
| `keystore/yanxi-offline.keystore` | 签名私钥，任何情况下都不应公开 |
| `config.ps1` | 本机路径与签名口令 |
| `build/`、`dist/` | 构建中间产物与已签名 APK |
| 文本中的本机绝对路径 | 已替换为 `<JDK_HOME>` / `<ANDROID_SDK>` / `<交付目录>` 等占位符 |
| keystore 口令 | 已从脚本、README、示例配置中删除，改由 `config.ps1` 的 `$KsPass` 或环境变量 `YANXI_KS_PASS` 提供 |

## 上传前请自行准备（均不入库）

1. `base/upload_109.apk`：官方精简版 v1.0.6 / 10066（SHA-256 见 `base/README.md`）。
2. `tools/apktool.jar`：apktool 2.11.1。
3. `keystore/yanxi-offline.keystore` + 口令（或改用你自己的签名）。

## 目录内容

- `src/`、`src-stub/`：离线模块 Java 源码与编译桩
- `overlay/`：清单、剧本、素材与手改 smali
- `docs/`：设计与任务记录（路径已脱敏）
- `build.ps1`、`config.example.ps1`、`README.md`、`.gitignore`、`tools/BaksmaliRunner.java`、`base/README.md`

## 上传

```bash
git init
git add -A
git commit -m "嫣汐离线版工程源码"
git remote add origin <你的仓库地址>
git push -u origin main
```

`.gitignore` 已排除上表中的本地文件；提交前可再执行一次 `git status` 确认没有 `*.apk`、`*.keystore`、`apktool.jar`、`config.ps1`。
