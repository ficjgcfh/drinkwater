# 💻 本地构建 APK 完整指南

## 🎯 概述

这份指南将帮你在自己的电脑上构建 APK。

## 📋 前置要求

### 必需软件：

1. **Node.js**
   - 版本：14.x 或更高
   - 下载：https://nodejs.org/
   - 安装：选择 LTS 版本

2. **Java JDK**
   - 版本：JDK 8 或 JDK 11
   - 下载：https://adoptium.net/
   - 推荐：JDK 11

3. **Android Studio**
   - 下载：https://developer.android.com/studio
   - 包含：Android SDK

4. **Cordova CLI**
   - 安装：`npm install -g cordova`

---

## 🔧 环境配置

### Windows 系统

#### 1. 安装 Node.js
- 下载并安装
- 验证：打开 CMD 输入 `node --version`

#### 2. 安装 Java JDK
- 下载 JDK 11
- 安装到默认位置
- 配置环境变量：
  ```
  JAVA_HOME = C:\Program Files\Eclipse Adoptium\jdk-11.x.x
  ```
- 添加到 Path：`%JAVA_HOME%\bin`

#### 3. 安装 Android Studio
- 下载并安装
- 打开 Android Studio
- 安装 SDK（默认安装即可）
- 记住 SDK 安装位置（通常是 `C:\Users\你的用户名\AppData\Local\Android\Sdk`）

#### 4. 配置 Android 环境变量

添加以下环境变量：

```
ANDROID_HOME = C:\Users\你的用户名\AppData\Local\Android\Sdk
ANDROID_SDK_ROOT = C:\Users\你的用户名\AppData\Local\Android\Sdk
```

添加到 Path：
```
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\cmdline-tools\latest\bin
%ANDROID_HOME%\emulator
```

#### 5. 安装 Cordova
打开 CMD 或 PowerShell：
```bash
npm install -g cordova
```

#### 6. 验证安装
```bash
node --version
java -version
cordova --version
```

---

### macOS 系统

#### 1. 安装 Homebrew（如未安装）
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 2. 安装 Node.js
```bash
brew install node
```

#### 3. 安装 Java JDK
```bash
brew install --cask temurin11
```

#### 4. 安装 Android Studio
- 下载：https://developer.android.com/studio
- 安装并打开
- 安装 Android SDK

#### 5. 配置环境变量

编辑 `~/.bash_profile` 或 `~/.zshrc`：

```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
```

应用配置：
```bash
source ~/.bash_profile  # 或 source ~/.zshrc
```

#### 6. 安装 Cordova
```bash
sudo npm install -g cordova
```

---

### Linux (Ubuntu/Debian) 系统

#### 1. 安装 Node.js
```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

#### 2. 安装 Java JDK
```bash
sudo apt install openjdk-11-jdk
```

#### 3. 安装 Android Studio
```bash
sudo snap install android-studio --classic
```

#### 4. 配置环境变量

编辑 `~/.bashrc`：

```bash
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
```

应用：
```bash
source ~/.bashrc
```

#### 5. 安装 Cordova
```bash
sudo npm install -g cordova
```

---

## 🏗️ 构建步骤

### 1. 进入项目目录
```bash
cd drinkwater
```

### 2. 检查环境
```bash
cordova requirements
```

应该看到所有项都是 "installed"。

### 3. 构建 Debug APK
```bash
cordova build android
```

或使用脚本：
```bash
./build.sh
```
选择选项 1（调试版）

### 4. 查找 APK 文件

构建成功后，APK 位于：
```
platforms/android/app/build/outputs/apk/debug/app-debug.apk
```

### 5. 安装到手机

#### 方法一：USB 连接
```bash
# 连接手机，启用 USB 调试
cordova run android
```

#### 方法二：手动安装
1. 复制 `app-debug.apk` 到手机
2. 在手机上找到并点击安装
3. 允许"未知来源"安装

---

## 🔐 构建 Release APK（正式版）

### 1. 生成签名密钥

```bash
keytool -genkey -v -keystore drinkwater-release.keystore -alias drinkwater -keyalg RSA -keysize 2048 -validity 10000
```

按提示输入：
- 密钥库密码（记住！）
- 姓名、组织等信息

### 2. 创建 build.json

在项目根目录创建 `build.json`：

```json
{
  "android": {
    "release": {
      "keystore": "drinkwater-release.keystore",
      "storePassword": "你的密钥库密码",
      "alias": "drinkwater",
      "password": "你的密钥密码",
      "keystoreType": ""
    }
  }
}
```

⚠️ 不要将 build.json 提交到 Git！

### 3. 构建签名 APK

```bash
cordova build android --release
```

### 4. APK 位置

```
platforms/android/app/build/outputs/apk/release/app-release.apk
```

---

## 🐛 常见问题

### 问题 1：找不到 ANDROID_HOME

**错误：**
```
Failed to find 'ANDROID_HOME' environment variable
```

**解决：**
- 确认已安装 Android Studio
- 配置环境变量（见上文）
- 重启终端或电脑

### 问题 2：Gradle 构建失败

**错误：**
```
Execution failed for task ':app:processDebugResources'
```

**解决：**
```bash
cd platforms/android
./gradlew clean
cd ../..
cordova build android
```

### 问题 3：Java 版本不匹配

**错误：**
```
Unsupported Java version
```

**解决：**
- 安装 JDK 11
- 配置 JAVA_HOME 指向 JDK 11

### 问题 4：设备未授权

**错误：**
```
device unauthorized
```

**解决：**
- 手机上确认 USB 调试授权
- 运行 `adb devices` 查看设备
- 如需要，运行 `adb kill-server && adb start-server`

### 问题 5：构建速度慢

**解决：**
- 首次构建会下载依赖，比较慢
- 确保网络通畅
- 可以配置国内镜像

---

## ⚡ 优化构建

### 加速 Gradle 构建

编辑 `platforms/android/gradle.properties`：

```properties
org.gradle.daemon=true
org.gradle.parallel=true
org.gradle.configureondemand=true
org.gradle.jvmargs=-Xmx4096m -XX:MaxPermSize=512m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8
```

### 使用国内镜像（中国用户）

修改 `platforms/android/build.gradle`：

```gradle
allprojects {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        google()
        jcenter()
    }
}
```

---

## 📦 打包分发

### 减小 APK 体积

1. **启用代码压缩**

编辑 `platforms/android/app/build.gradle`：

```gradle
android {
    buildTypes {
        release {
            minifyEnabled true
            shrinkResources true
        }
    }
}
```

2. **分架构构建**

```bash
cordova build android --release -- --packageType=apk
```

### 测试 APK

1. **在模拟器测试**
```bash
cordova emulate android
```

2. **在真机测试**
```bash
cordova run android
```

---

## ✅ 完整构建流程检查清单

- [ ] 安装 Node.js
- [ ] 安装 Java JDK
- [ ] 安装 Android Studio
- [ ] 配置环境变量
- [ ] 安装 Cordova CLI
- [ ] 运行 `cordova requirements` 验证
- [ ] 执行 `cordova build android`
- [ ] 找到生成的 APK
- [ ] 测试安装

---

## 📞 获取帮助

如果遇到问题：

1. 查看错误信息
2. 检查环境变量配置
3. 确认所有软件版本正确
4. 清理并重新构建
5. 查看 Cordova 官方文档

---

## 🎓 推荐学习资源

- Cordova 官方文档：https://cordova.apache.org/docs/
- Android Studio 指南：https://developer.android.com/
- Stack Overflow：搜索具体错误信息

---

## 时间预估

- **环境配置**：1-2 小时（首次）
- **首次构建**：10-20 分钟
- **后续构建**：2-5 分钟

---

**祝构建顺利！** 🚀✨
