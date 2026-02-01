# 喝水打卡应用

一个简单实用的 Cordova 喝水提醒打卡应用。

## 功能特性

- 💧 一键打卡喝水
- 📊 显示今日喝水次数
- 📝 完整的喝水记录列表（显示时间和次数）
- 💾 本地存储数据（使用 localStorage）
- 📱 适配安卓设备
- 🎨 美观的渐变色界面

## 项目结构

```
drinkwater/
├── www/
│   ├── index.html          # 主页面
│   ├── css/
│   │   └── index.css       # 样式文件
│   └── js/
│       └── index.js        # 主要逻辑
├── platforms/
│   └── android/            # Android 平台代码
└── config.xml              # Cordova 配置文件
```

## 在本地环境构建

### 前置要求

1. 安装 Node.js 和 npm
2. 安装 Cordova: `npm install -g cordova`
3. 安装 Android Studio 和 Android SDK
4. 设置环境变量 `ANDROID_HOME` 指向 Android SDK 目录

### 构建步骤

1. 进入项目目录:
```bash
cd drinkwater
```

2. 检查构建要求:
```bash
cordova requirements
```

3. 构建调试版 APK:
```bash
cordova build android
```

4. 构建发布版 APK:
```bash
cordova build android --release
```

### 在设备上运行

1. 连接 Android 设备并启用 USB 调试
2. 运行命令:
```bash
cordova run android
```

### 在浏览器中测试

```bash
cordova serve
```

然后在浏览器中访问 `http://localhost:8000`

## 应用使用说明

1. **打卡喝水**: 点击中间的大按钮进行打卡
2. **查看统计**: 顶部显示今日喝水次数
3. **查看记录**: 底部列表显示所有今日的喝水记录，包括时间和次数

## 数据存储

应用使用浏览器的 localStorage 存储数据，所有记录保存在本地，不会上传到服务器。

## 技术栈

- Apache Cordova
- HTML5
- CSS3
- JavaScript (原生)
- LocalStorage API

## APK 文件位置

构建成功后，APK 文件位于:
- 调试版: `platforms/android/app/build/outputs/apk/debug/app-debug.apk`
- 发布版: `platforms/android/app/build/outputs/apk/release/app-release.apk`

## 注意事项

- 首次构建可能需要较长时间下载依赖
- 确保 Android SDK 版本兼容
- 发布版 APK 需要签名才能安装到设备
