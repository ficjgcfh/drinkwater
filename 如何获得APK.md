# 🎉 获取 APK 的完整方案

## 📱 你有 3 种方式获得真正的 APK

---

## 🏆 方案一：在线构建（强烈推荐！）

**✅ 优点：**
- 不需要安装任何软件
- 5-10 分钟搞定
- 适合新手
- 完全免费

### 使用 Monaca Cloud IDE

**步骤：**

1. **访问 Monaca**
   ```
   https://monaca.io/
   ```

2. **注册账号**
   - 点击 "Sign Up"
   - 使用邮箱注册（免费）

3. **创建新项目**
   - 登录后点击 "Create Project"
   - 选择 "Import Project"
   - 上传 `drinkwater-package.zip`（已为你准备好）

4. **配置项目**
   - 项目会自动加载
   - 检查文件是否完整

5. **构建 APK**
   - 点击顶部菜单 "Build"
   - 选择 "Build App for Android"
   - 选择 "Debug Build"
   - 等待 5-10 分钟

6. **下载 APK**
   - 构建完成后会显示下载链接
   - 点击下载 APK 文件
   - 传输到手机安装

**预计时间：10-15 分钟**

---

## 💻 方案二：本地构建

**✅ 适合：**
- 想学习 Android 开发
- 需要频繁修改应用
- 想完全掌控构建过程

### 环境要求

1. **Node.js**（必需）
   - 下载：https://nodejs.org/
   - 版本：14+ 或 LTS

2. **Java JDK**（必需）
   - 下载：https://adoptium.net/
   - 推荐：JDK 11

3. **Android Studio**（必需）
   - 下载：https://developer.android.com/studio
   - 包含 Android SDK

4. **Cordova CLI**（必需）
   ```bash
   npm install -g cordova
   ```

### 构建步骤

1. **配置环境变量**（重要！）

   **Windows:**
   ```
   ANDROID_HOME = C:\Users\你的用户名\AppData\Local\Android\Sdk
   JAVA_HOME = C:\Program Files\Eclipse Adoptium\jdk-11.x.x

   Path 添加:
   %ANDROID_HOME%\platform-tools
   %ANDROID_HOME%\cmdline-tools\latest\bin
   ```

   **Mac/Linux:**
   ```bash
   export ANDROID_HOME=$HOME/Library/Android/sdk
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   ```

2. **检查环境**
   ```bash
   cd drinkwater
   cordova requirements
   ```

3. **构建 APK**
   ```bash
   cordova build android
   ```
   或使用脚本：
   ```bash
   ./build.sh
   ```

4. **获取 APK**
   ```
   platforms/android/app/build/outputs/apk/debug/app-debug.apk
   ```

**预计时间：**
- 首次配置环境：1-2 小时
- 构建 APK：5-10 分钟

**详细步骤见：** `本地构建APK指南.md`

---

## 🔧 方案三：使用 GitHub Actions（自动化）

**✅ 适合：**
- 熟悉 Git/GitHub
- 想要自动化构建
- 需要持续集成

### 步骤：

1. **上传项目到 GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/你的用户名/drinkwater.git
   git push -u origin main
   ```

2. **配置 GitHub Actions**
   - 创建 `.github/workflows/build.yml`
   - 配置自动构建流程

3. **触发构建**
   - 推送代码自动构建
   - 或手动触发

4. **下载 APK**
   - 在 Actions 页面下载生成的 APK

**详细配置见 GitHub Actions 文档**

---

## 📦 已为你准备的文件

### 1. drinkwater-package.zip
✅ 已创建
- 包含所有构建所需文件
- 可直接上传到 Monaca
- 大小：约 29 KB

### 2. 完整指南文档
- ✅ `在线构建APK指南.md` - 在线构建详细步骤
- ✅ `本地构建APK指南.md` - 本地环境配置和构建
- ✅ `签名指南.md` - 发布版 APK 签名教程

### 3. 辅助脚本
- ✅ `build.sh` - 本地构建脚本
- ✅ `打包项目.sh` - 项目打包脚本

---

## 🎯 推荐方案

### 如果你是...

**新手 / 想快速获得 APK**
→ 使用方案一（在线构建）
- 访问 Monaca.io
- 上传 drinkwater-package.zip
- 点击构建
- 下载 APK

**开发者 / 想深入学习**
→ 使用方案二（本地构建）
- 配置开发环境
- 学习 Cordova 构建流程
- 自由修改和调试

**熟悉 Git / 想自动化**
→ 使用方案三（GitHub Actions）
- 自动化构建流程
- 版本管理
- 持续集成

---

## 📝 构建后的下一步

### 1. 安装 APK

**方法一：USB 连接**
```bash
adb install app-debug.apk
```

**方法二：直接安装**
- 传输 APK 到手机
- 点击安装
- 允许"未知来源"

### 2. 测试应用

- [ ] 打卡功能正常
- [ ] 统计数据准确
- [ ] 进度环显示正确
- [ ] 记录列表完整
- [ ] 清空功能可用
- [ ] 振动反馈正常
- [ ] 绿色主题显示

### 3. 正式发布（可选）

如需发布到应用商店：
1. 生成签名密钥
2. 构建 Release APK
3. 准备应用商店资料
4. 提交审核

详见：`签名指南.md`

---

## ⚡ 快速开始（推荐流程）

### 最快方式（15 分钟）

1. **访问 Monaca**
   ```
   https://monaca.io/
   ```

2. **注册并登录**

3. **导入项目**
   - New Project → Import
   - 上传 `drinkwater-package.zip`

4. **构建**
   - Build → Android Debug
   - 等待完成

5. **下载安装**
   - 下载 APK
   - 传到手机
   - 安装使用

---

## 🆘 遇到问题？

### 在线构建问题
- 检查压缩包是否完整
- 确认 config.xml 格式正确
- 查看构建日志

### 本地构建问题
- 运行 `cordova requirements` 检查环境
- 查看 `本地构建APK指南.md` 常见问题部分
- 清理项目重新构建：`cordova clean`

### 安装问题
- 启用"未知来源"安装
- 检查 APK 是否损坏
- 确认 Android 版本兼容（最低 7.0）

---

## 📞 获取帮助

1. 查看对应的详细指南文档
2. 检查 Cordova 官方文档
3. 搜索具体错误信息
4. 查看项目 README

---

## 📊 方案对比总结

| 方案 | 难度 | 时间 | 灵活性 | 推荐度 |
|------|------|------|--------|--------|
| 在线构建 | ⭐ | 15分钟 | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| 本地构建 | ⭐⭐⭐ | 2小时+ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| GitHub Actions | ⭐⭐⭐⭐ | 1小时+ | ⭐⭐⭐⭐ | ⭐⭐⭐ |

---

## ✨ 总结

**立即开始：**
1. 使用方案一（在线构建）- 最简单快速
2. 上传 `drinkwater-package.zip` 到 Monaca
3. 等待构建完成
4. 下载 APK 安装

**文件位置：**
- 📦 项目包：`drinkwater-package.zip`
- 📖 在线指南：`在线构建APK指南.md`
- 📖 本地指南：`本地构建APK指南.md`
- 📖 签名指南：`签名指南.md`

**预计 15 分钟后，你就能在手机上使用真正的 APP 了！** 🎉

---

开始构建吧！💧✨
