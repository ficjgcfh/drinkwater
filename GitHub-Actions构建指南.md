# 🚀 使用 GitHub Actions 自动构建 APK（推荐！）

## 为什么推荐这个方案？

✅ **完全免费** - 无需付费，无需信用卡
✅ **自动构建** - 推送代码即可自动构建
✅ **稳定可靠** - GitHub 官方服务
✅ **简单易用** - 只需 3 步
✅ **无需环境配置** - 不需要安装 Android SDK

---

## 📋 前置要求

只需要：
- ✅ 一个 GitHub 账号（免费）
- ✅ 5-10 分钟时间

---

## 🎯 3 步获得 APK

### 第 1 步：上传项目到 GitHub

#### 1.1 在 GitHub 创建新仓库

1. 访问 https://github.com/
2. 点击右上角 "+" → "New repository"
3. 填写信息：
   - Repository name: `drinkwater`
   - Public 或 Private（都可以）
   - 不要勾选 "Add a README file"
4. 点击 "Create repository"

#### 1.2 上传项目代码

在项目目录中运行：

```bash
cd /workspaces/RUthirsty-cordova/drinkwater

# 初始化 Git
git init

# 添加文件
git add .

# 提交
git commit -m "喝水打卡应用 v1.0"

# 连接到 GitHub（替换成你的用户名）
git remote add origin https://github.com/你的用户名/drinkwater.git

# 推送
git branch -M main
git push -u origin main
```

**提示：** 如果是第一次使用 Git，可能需要配置：
```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"
```

---

### 第 2 步：等待自动构建

1. **推送完成后，GitHub 会自动开始构建**
2. **查看构建进度**：
   - 访问你的仓库页面
   - 点击顶部的 "Actions" 标签
   - 看到 "构建 Android APK" 正在运行
   - 等待 5-10 分钟

3. **构建完成标志**：
   - 看到绿色的 ✅ 标记

---

### 第 3 步：下载 APK

1. **在 Actions 页面**：
   - 点击最新的构建任务
   - 滚动到页面底部
   - 找到 "Artifacts" 部分
   - 点击 `drinkwater-debug-apk` 下载

2. **解压下载的 zip 文件**
   - 得到 `app-debug.apk`

3. **安装到手机**：
   - 传输到手机
   - 点击安装
   - 允许"未知来源"

---

## 🎬 完整演示（带截图说明）

### 步骤 1：创建 GitHub 仓库
```
1. 访问 github.com
2. 点击 "+" → "New repository"
3. 输入名称 "drinkwater"
4. 点击 "Create repository"
```

### 步骤 2：推送代码
```bash
cd /workspaces/RUthirsty-cordova/drinkwater
git init
git add .
git commit -m "喝水打卡应用"
git remote add origin https://github.com/你的用户名/drinkwater.git
git push -u origin main
```

### 步骤 3：查看构建
```
1. 仓库页面 → "Actions" 标签
2. 看到 "构建 Android APK" 任务
3. 等待完成（约 8-10 分钟）
```

### 步骤 4：下载 APK
```
1. 点击完成的构建任务
2. 底部 "Artifacts"
3. 下载 "drinkwater-debug-apk"
4. 解压得到 app-debug.apk
```

---

## 🔄 后续构建

**每次修改代码后：**

```bash
git add .
git commit -m "更新说明"
git push
```

GitHub 会自动重新构建新的 APK！

---

## 💡 提示和技巧

### 手动触发构建

不修改代码也可以触发构建：

1. 访问仓库的 "Actions" 页面
2. 选择 "构建 Android APK"
3. 点击右侧 "Run workflow"
4. 点击绿色的 "Run workflow" 按钮

### 查看构建日志

如果构建失败：
1. 点击失败的任务
2. 点击 "build" 查看详细日志
3. 根据错误信息排查问题

### 构建时间

- 首次构建：约 8-12 分钟（需要下载依赖）
- 后续构建：约 5-8 分钟（有缓存）

---

## 🎯 最佳实践

### 1. 版本管理

每次更新时使用有意义的提交信息：

```bash
git commit -m "修复：打卡按钮点击问题"
git commit -m "新增：深色模式支持"
git commit -m "优化：进度环动画效果"
```

### 2. 标签发布

为重要版本打标签：

```bash
git tag -a v1.0.0 -m "首次正式版本"
git push origin v1.0.0
```

### 3. 保护分支

在仓库设置中：
- Settings → Branches
- 添加分支保护规则
- 要求 Actions 通过才能合并

---

## 🐛 常见问题

### Q: 构建失败了怎么办？

**A:** 查看构建日志：
1. 点击失败的任务
2. 展开红色 ❌ 的步骤
3. 查看错误信息
4. 通常是缺少某个文件或配置问题

### Q: 下载的文件是 zip 格式？

**A:** 是的，GitHub Actions 会自动压缩：
1. 解压 zip 文件
2. 得到 app-debug.apk
3. 这就是你要的 APK

### Q: 能构建 Release 版本吗？

**A:** 可以，需要配置签名：
1. 生成签名密钥
2. 添加到 GitHub Secrets
3. 修改工作流文件
4. 详见"签名指南.md"

### Q: 构建消耗我的免费额度吗？

**A:** GitHub 提供：
- 公开仓库：无限制
- 私有仓库：每月 2000 分钟
- 通常足够使用

### Q: 可以在私有仓库使用吗？

**A:** 可以！
- 创建仓库时选择 Private
- 其他步骤完全相同
- 只有你能访问代码和 APK

---

## 📊 GitHub Actions vs 其他方案

| 特性 | GitHub Actions | Monaca | 本地构建 |
|------|---------------|--------|----------|
| 费用 | ✅ 免费 | 有限额度 | 免费 |
| 配置 | 简单 | 很简单 | 复杂 |
| 速度 | 快（8分钟） | 快（5分钟） | 快（2分钟） |
| 自动化 | ✅ 完全 | ❌ 手动 | ❌ 手动 |
| 可靠性 | ✅✅✅ | ✅✅ | ✅✅✅ |

---

## 🎉 成功案例

完成后你将拥有：

✅ 代码托管在 GitHub
✅ 每次推送自动构建
✅ 完整的构建历史
✅ 随时下载任意版本的 APK
✅ 专业的开发流程

---

## 📝 完整命令速查

```bash
# 首次设置
cd /workspaces/RUthirsty-cordova/drinkwater
git init
git add .
git commit -m "喝水打卡应用 v1.0"
git remote add origin https://github.com/你的用户名/drinkwater.git
git push -u origin main

# 后续更新
git add .
git commit -m "更新说明"
git push

# 查看状态
git status
git log --oneline

# 创建标签
git tag -a v1.0.0 -m "版本说明"
git push origin v1.0.0
```

---

## 🚀 立即开始

**只需要 3 个命令：**

```bash
# 1. 初始化并提交
git init && git add . && git commit -m "喝水打卡应用"

# 2. 连接 GitHub（替换成你的）
git remote add origin https://github.com/你的用户名/drinkwater.git

# 3. 推送
git push -u origin main
```

**然后：**
1. 访问 GitHub 仓库
2. 点击 "Actions"
3. 等待构建完成
4. 下载 APK

**10分钟后，你的 APK 就准备好了！** 🎊

---

## 📚 相关文档

- GitHub Actions 文档：https://docs.github.com/actions
- Git 基础教程：https://git-scm.com/book/zh/v2
- Cordova 文档：https://cordova.apache.org/docs/

---

**现在就开始吧！** 💪✨

有问题随时查看构建日志，或者参考本文档中的常见问题部分。
