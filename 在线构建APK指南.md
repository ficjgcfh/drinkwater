# 🚀 在线构建 APK 完全指南

## 方案一：使用 Monaca（最简单，推荐）

### 步骤：

1. **访问 Monaca**
   - 网址：https://monaca.io/
   - 注册免费账号

2. **创建新项目**
   - 选择 "Import Project"
   - 上传整个 Cordova 项目

3. **配置项目**
   - 项目会自动识别 config.xml
   - 检查配置是否正确

4. **构建 APK**
   - 点击 "Build" → "Build for Android"
   - 选择 "Debug Build"
   - 等待构建完成（约 5-10 分钟）

5. **下载 APK**
   - 构建完成后点击下载
   - 传输到手机安装

---

## 方案二：使用 PhoneGap Build

### 步骤：

⚠️ 注意：PhoneGap Build 已停止服务，不推荐使用

---

## 方案三：使用 Ionic Appflow

### 步骤：

1. **访问 Ionic**
   - 网址：https://ionic.io/appflow
   - 注册账号（有免费版）

2. **上传项目**
   - 连接 GitHub 仓库
   - 或直接上传代码

3. **配置构建**
   - 选择 Android 平台
   - 配置构建参数

4. **构建并下载**
   - 点击 "Build" 构建
   - 下载生成的 APK

---

## 方案四：使用 App Builder（Cordova CLI 在线）

### 步骤：

1. **访问 Online Compiler**
   - 搜索 "Cordova online compiler"
   - 选择可用的在线服务

2. **上传文件**
   - 上传 www 文件夹
   - 上传 config.xml

3. **在线构建**
   - 选择 Android 平台
   - 点击构建

4. **下载 APK**

---

## 准备工作

### 需要上传的文件：

```
drinkwater/
├── www/              # 必需
│   ├── index.html
│   ├── css/
│   └── js/
├── config.xml        # 必需
└── package.json      # 建议包含
```

### 压缩项目：

```bash
cd drinkwater
zip -r drinkwater.zip www config.xml package.json
```

---

## 推荐方案对比

| 服务 | 难度 | 速度 | 免费额度 | 推荐度 |
|------|------|------|---------|--------|
| Monaca | 简单 | 快 | 有限制 | ⭐⭐⭐⭐⭐ |
| Ionic Appflow | 中等 | 快 | 少量 | ⭐⭐⭐⭐ |
| 自建服务器 | 困难 | 慢 | 无限 | ⭐⭐⭐ |

---

## 注意事项

1. **免费限制**
   - 大多数服务有构建次数限制
   - 通常每月 10-100 次

2. **构建时间**
   - 通常需要 5-15 分钟
   - 取决于服务器负载

3. **APK 类型**
   - 在线服务通常生成 Debug APK
   - Release APK 可能需要付费或本地构建

4. **文件大小**
   - 注意项目文件不要太大
   - 移除不必要的文件

---

## 快速开始（Monaca）

1. 访问 https://monaca.io/
2. 注册并登录
3. 新建项目 → Import
4. 上传 drinkwater.zip
5. Build → Android Debug
6. 下载 APK

**预计时间：15 分钟**

---

## 替代方案

如果在线服务不可用，查看：
- 本地构建指南.md
- Docker 构建方案.md

