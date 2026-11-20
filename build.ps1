<#
  嫣汐离线版（yanxi offline）一键构建脚本
  流程：反编译基线包 → 编译离线模块 → 生成 smali → 覆盖补丁 → 回编译 → 对齐 → 签名

  用法：
    .\build.ps1              完整构建并签名
    .\build.ps1 -Clean       清空 build 后重建
    .\build.ps1 -NoSign      只产出对齐后的未签名包
#>
[CmdletBinding()]
param(
    [switch]$Clean,
    [switch]$NoSign
)

$ErrorActionPreference = 'Stop'

$Repo = Split-Path -Parent $MyInvocation.MyCommand.Path
Push-Location $Repo
try {

# ------------------------------------------------------------------ 配置
$ConfigFile = Join-Path $Repo 'config.ps1'
if (Test-Path $ConfigFile) { . $ConfigFile }

function Find-JavaHome {
    if ($JavaHome) { return $JavaHome }
    if ($env:JAVA_HOME -and (Test-Path (Join-Path $env:JAVA_HOME 'bin\javac.exe'))) { return $env:JAVA_HOME }
    $candidates = @(
        'C:\Program Files\Java\jdk1.8.0_202',
        'C:\Program Files\Java\jdk-17',
        'C:\Program Files\Java\jdk-21'
    )
    foreach ($c in $candidates) {
        if (Test-Path (Join-Path $c 'bin\javac.exe')) { return $c }
    }
    $javac = Get-Command javac -ErrorAction SilentlyContinue
    if ($javac) { return (Split-Path -Parent (Split-Path -Parent $javac.Source)) }
    throw '未找到 JDK：请在 config.ps1 中设置 $JavaHome'
}

function Find-AndroidSdk {
    if ($AndroidSdk) { return $AndroidSdk }
    foreach ($envName in @('ANDROID_HOME', 'ANDROID_SDK_ROOT')) {
        $v = [Environment]::GetEnvironmentVariable($envName)
        if ($v -and (Test-Path $v)) { return $v }
    }
    $candidates = @(
        (Join-Path $env:USERPROFILE '.avgplus\android-toolchain\sdk'),
        (Join-Path $env:LOCALAPPDATA 'Android\Sdk')
    )
    foreach ($c in $candidates) {
        if (Test-Path $c) { return $c }
    }
    throw '未找到 Android SDK：请在 config.ps1 中设置 $AndroidSdk'
}

$JavaHome   = Find-JavaHome
$AndroidSdk = Find-AndroidSdk
$Javac      = Join-Path $JavaHome 'bin\javac.exe'
$Java       = Join-Path $JavaHome 'bin\java.exe'

$AndroidJar = if ($AndroidJar) { $AndroidJar } else {
    $plat = Get-ChildItem (Join-Path $AndroidSdk 'platforms') -Directory -ErrorAction SilentlyContinue |
            Where-Object { Test-Path (Join-Path $_.FullName 'android.jar') } |
            Sort-Object { [int]($_.Name -replace '[^0-9]', '') } -Descending |
            Select-Object -First 1
    if (-not $plat) { throw "在 $AndroidSdk\platforms 下找不到 android.jar" }
    Join-Path $plat.FullName 'android.jar'
}

$BuildTools = if ($BuildTools) { $BuildTools } else {
    $bt = Get-ChildItem (Join-Path $AndroidSdk 'build-tools') -Directory -ErrorAction SilentlyContinue |
          Where-Object { Test-Path (Join-Path $_.FullName 'd8.bat') } |
          Sort-Object { [int]($_.Name -replace '[^0-9]', '') } -Descending |
          Select-Object -First 1
    if (-not $bt) { throw "在 $AndroidSdk\build-tools 下找不到 d8.bat" }
    $bt.FullName
}

$ApktoolJar = if ($ApktoolJar) { $ApktoolJar } else { Join-Path $Repo 'tools\apktool.jar' }
$BaseApk    = if ($BaseApk)    { $BaseApk }    else { Join-Path $Repo 'base\upload_109.apk' }
$Keystore   = if ($Keystore)   { $Keystore }   else { Join-Path $Repo 'keystore\yanxi-offline.keystore' }
if (-not $KsPass)  { $KsPass  = $env:YANXI_KS_PASS }
if (-not $KeyAlias){ $KeyAlias = 'yanxi-offline' }
if (-not $KeyPass) { $KeyPass = $KsPass }
if (-not $OutName) { $OutName = 'yanxi_offline_v1.0.6_plus13.apk' }

$Build  = Join-Path $Repo 'build'
$Dist   = Join-Path $Repo 'dist'
$Base   = Join-Path $Build 'base'
$StubCls= Join-Path $Build 'stub_classes'
$Classes= Join-Path $Build 'classes'
$DexDir = Join-Path $Build 'dex'
$GenSm  = Join-Path $Build 'gen_smali'
$ToolCls= Join-Path $Build 'tools'

foreach ($p in @($ApktoolJar, $BaseApk)) {
    if (-not (Test-Path $p)) { throw "缺少必需文件：$p（见 README「本地必需文件」）" }
}

"== 构建环境 =="
"JDK        : $JavaHome"
"SDK        : $AndroidSdk"
"android.jar: $AndroidJar"
"build-tools: $BuildTools"
"基线包     : $BaseApk"
""

# ------------------------------------------------------------------ 清理
if ($Clean -and (Test-Path $Build)) { Remove-Item $Build -Recurse -Force }
New-Item -ItemType Directory -Force $Build, $Dist, $StubCls, $Classes, $DexDir, $GenSm, $ToolCls | Out-Null

$sw = [Diagnostics.Stopwatch]::StartNew()
function Step($text) { "== $text ==" }

# ------------------------------------------------------------------ 1 反编译
Step '[1/9] 反编译基线包'
if (Test-Path $Base) { Remove-Item $Base -Recurse -Force }
& $Java -Xmx2g -jar $ApktoolJar d $BaseApk -o $Base -f | Out-Null
if ($LASTEXITCODE -ne 0 -or -not (Test-Path (Join-Path $Base 'AndroidManifest.xml'))) { throw 'apktool 反编译失败' }

# ------------------------------------------------------------------ 2 编译桩类
Step '[2/9] 编译桩类（游戏内类 / gson 的最小签名）'
$stubSources = Get-ChildItem (Join-Path $Repo 'src-stub') -Recurse -Filter *.java | ForEach-Object { $_.FullName }
& $Javac -source 8 -target 8 -encoding UTF-8 -nowarn -bootclasspath $AndroidJar -d $StubCls $stubSources
if ($LASTEXITCODE -ne 0) { throw '桩类编译失败' }

# ------------------------------------------------------------------ 3 编译离线模块
Step '[3/9] 编译离线模块 src/'
$appSources = Get-ChildItem (Join-Path $Repo 'src') -Recurse -Filter *.java | ForEach-Object { $_.FullName }
& $Javac -source 8 -target 8 -encoding UTF-8 -nowarn -bootclasspath $AndroidJar -classpath "$AndroidJar;$StubCls" -d $Classes $appSources
if ($LASTEXITCODE -ne 0) { throw '离线模块编译失败' }

# ------------------------------------------------------------------ 4 d8
Step '[4/9] d8 生成 classes.dex'
$classFiles = Get-ChildItem $Classes -Recurse -Filter *.class | ForEach-Object { $_.FullName }
& (Join-Path $BuildTools 'd8.bat') --min-api 19 --lib $AndroidJar --output $DexDir $classFiles
if ($LASTEXITCODE -ne 0 -or -not (Test-Path (Join-Path $DexDir 'classes.dex'))) { throw 'd8 生成 dex 失败' }

# ------------------------------------------------------------------ 5 baksmali
Step '[5/9] baksmali 反汇编 dex'
& $Javac -encoding UTF-8 -nowarn -cp $ApktoolJar -d $ToolCls (Join-Path $Repo 'tools\BaksmaliRunner.java')
if ($LASTEXITCODE -ne 0) { throw 'BaksmaliRunner 编译失败' }
& $Java -cp "$ApktoolJar;$ToolCls" BaksmaliRunner (Join-Path $DexDir 'classes.dex') $GenSm
if ($LASTEXITCODE -ne 0) { throw 'baksmali 失败' }

# ------------------------------------------------------------------ 6 覆盖 offline
Step '[6/9] 替换 smali/com/muta/yanxi/offline'
$OfflineDir = Join-Path $Base 'smali\com\muta\yanxi\offline'
if (Test-Path $OfflineDir) { Remove-Item $OfflineDir -Recurse -Force }
New-Item -ItemType Directory -Force $OfflineDir | Out-Null
Copy-Item (Join-Path $GenSm 'com\muta\yanxi\offline\*.smali') $OfflineDir -Force

# ------------------------------------------------------------------ 7 覆盖补丁
Step '[7/9] 覆盖 res/assets/手改 smali/清单'
function Copy-Overlay([string]$src, [string]$dst) {
    Get-ChildItem $src -Recurse -File | ForEach-Object {
        $rel = $_.FullName.Substring($src.Length + 1)
        $target = Join-Path $dst $rel
        $dir = Split-Path -Parent $target
        if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
        Copy-Item $_.FullName $target -Force
    }
}
Copy-Overlay (Join-Path $Repo 'overlay') $Base

# ------------------------------------------------------------------ 8 回编译
Step '[8/9] apktool 回编译'
$Unsigned = Join-Path $Build 'unsigned.apk'
if (Test-Path $Unsigned) { Remove-Item $Unsigned -Force }
& $Java -Xmx2g -jar $ApktoolJar b $Base -o $Unsigned
if ($LASTEXITCODE -ne 0 -or -not (Test-Path $Unsigned)) { throw 'apktool 回编译失败' }

$Aligned = Join-Path $Build 'aligned.apk'
if (Test-Path $Aligned) { Remove-Item $Aligned -Force }
& (Join-Path $BuildTools 'zipalign.exe') -p -f 4 $Unsigned $Aligned
if ($LASTEXITCODE -ne 0) { throw 'zipalign 失败' }

# ------------------------------------------------------------------ 9 签名
Step '[9/9] apksigner 签名'
if ($NoSign) {
    Copy-Item $Aligned (Join-Path $Dist $OutName) -Force
} else {
    if (-not (Test-Path $Keystore)) { throw "缺少签名文件：$Keystore" }
    if (-not $KsPass) { throw '未配置 keystore 口令：请在 config.ps1 设置 $KsPass，或设置环境变量 YANXI_KS_PASS' }
    $Final = Join-Path $Dist $OutName
    if (Test-Path $Final) { Remove-Item $Final -Force }
    & (Join-Path $BuildTools 'apksigner.bat') sign --ks $Keystore --ks-pass "pass:$KsPass" --ks-key-alias $KeyAlias --key-pass "pass:$KeyPass" --out $Final $Aligned
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path $Final)) { throw 'apksigner 签名失败' }
    & (Join-Path $BuildTools 'apksigner.bat') verify --min-sdk-version 19 $Final
    if ($LASTEXITCODE -ne 0) { throw 'apksigner 验签失败' }
}

# ------------------------------------------------------------------ 汇总
$OutFile = Join-Path $Dist $OutName
$item = Get-Item $OutFile
$hash = (Get-FileHash $OutFile -Algorithm SHA256).Hash
$sw.Stop()

""
"== 构建完成 =="
"产物   : $OutFile"
"大小   : $($item.Length) 字节"
"SHA-256: $hash"
"用时   : $([math]::Round($sw.Elapsed.TotalSeconds,1)) 秒"

$badging = & (Join-Path $BuildTools 'aapt2.exe') dump badging $OutFile 2>$null
$badging | Select-String -Pattern '^package:|^minSdkVersion|^targetSdkVersion' | ForEach-Object { $_.Line }

}
finally {
    Pop-Location
}
