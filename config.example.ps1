# 构建配置模板：复制为 config.ps1 后按需修改（config.ps1 不入库）
# 所有项都可省略，省略时 build.ps1 会自动探测。

# JDK 根目录（需含 bin\javac.exe）
# $JavaHome = '<JDK_HOME>'

# Android SDK 根目录（需含 platforms\*\android.jar 与 build-tools\*\d8.bat）
# $AndroidSdk = '<ANDROID_SDK>'

# 指定 android.jar / build-tools（一般不用填，脚本自动挑最高版本）
# $AndroidJar = ''
# $BuildTools = ''

# apktool.jar、基线 APK
# $ApktoolJar = '.\tools\apktool.jar'
# $BaseApk    = '.\base\upload_109.apk'

# 签名（口令不要写进仓库；也可以用环境变量 YANXI_KS_PASS）
# $Keystore = '.\keystore\yanxi-offline.keystore'
# $KsPass   = '<你的口令>'
# $KeyAlias = 'yanxi-offline'
# $KeyPass  = '<你的口令>'

# 产物文件名
# $OutName = 'yanxi_offline_v1.0.6_plus13.apk'
