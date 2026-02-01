# 💧 喝水打卡应用

一个简单、实用、美观的 Cordova 喝水打卡应用，帮助你养成良好的饮水习惯。

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Platform](https://img.shields.io/badge/platform-Android-green)
![License](https://img.shields.io/badge/license-MIT-orange)

## ✨ 功能特性

- 💧 **一键打卡** - 简单快速记录喝水时间
- 📊 **统计展示** - 今日次数、总计次数、进度环
- 📝 **记录列表** - 完整的打卡历史记录
- 🎯 **目标管理** - 默认每日8杯水目标
- 📳 **振动反馈** - 打卡成功的触觉反馈
- 🎨 **精美UI** - 渐变色设计，流畅动画
- 💾 **本地存储** - 数据安全保存在本地
- 🔄 **实时更新** - 数据即时同步显示

## 📱 截图预览

*（可以添加应用截图）*

## 🚀 快速开始

### 1. 浏览器测试（推荐）

最简单的方式，无需任何配置：

```bash
# 直接在浏览器中打开
open test.html
```

或使用快速启动脚本：

```bash
chmod +x start.sh
./start.sh
# 选择选项 1
```

### 2. 构建 Android APK

#### 环境要求
- Node.js (v14+)
- Cordova CLI
- Android Studio 和 Android SDK
- JDK 8+

#### 安装依赖

```bash
# 安装 Cordova
npm install -g cordova

# 检查环境
cordova requirements
```

#### 构建应用

```bash
# 使用构建脚本
./build.sh

# 或手动构建
cordova build android

# 发布版
cordova build android --release
```

#### 安装到设备

```bash
# USB 连接设备并运行
cordova run android
```

## 📚 文档导航

项目包含完整的中文文档：

- **[使用指南.md](使用指南.md)** - 详细的使用说明和开发指南
- **[签名指南.md](签名指南.md)** - APK 签名和发布流程
- **[图标指南.md](图标指南.md)** - 应用图标制作指南
- **[README_APP.md](README_APP.md)** - 应用技术文档

## 📁 项目结构

```
drinkwater/
├── www/                        # Web 资源
│   ├── index.html             # 主页面
│   ├── css/
│   │   └── index.css          # 样式
│   ├── js/
│   │   └── index.js           # 逻辑
│   └── img/                   # 图片资源
├── platforms/                  # 平台代码（自动生成）
├── config.xml                 # Cordova 配置
├── test.html                  # 浏览器测试版
├── start.sh                   # 快速启动脚本
├── build.sh                   # 构建脚本
└── 文档/                       # 完整中文文档
```

## 🎯 核心功能说明

### 打卡功能
```javascript
// 点击按钮记录当前时间
handleCheckIn() {
    const record = {
        date: getTodayString(),
        time: getCurrentTime(),
        timestamp: Date.now()
    };
    saveRecord(record);
}
```

### 数据存储
```javascript
// 使用 localStorage 保存数据
localStorage.setItem('drinkWaterRecords', JSON.stringify(records));
```

### 进度显示
```javascript
// SVG 圆环展示进度
const progress = Math.min(todayRecords.length, DAILY_GOAL);
const percentage = progress / DAILY_GOAL;
```

## 🛠️ 技术栈

- **框架**: Apache Cordova 14.0+
- **前端**: HTML5 + CSS3 + JavaScript (ES6+)
- **存储**: LocalStorage API
- **平台**: Android (API 24+)
- **构建**: Gradle

## 📋 待办功能

- [ ] 📊 历史数据图表
- [ ] ⏰ 定时提醒功能
- [ ] 🎨 主题切换（深色模式）
- [ ] ☁️ 云端数据同步
- [ ] 📤 数据导出（CSV/JSON）
- [ ] 🏆 成就系统
- [ ] 📅 周/月统计报告
- [ ] 💧 自定义水量记录

## 🔧 自定义配置

### 修改每日目标

编辑 `www/js/index.js`：

```javascript
const DAILY_GOAL = 8;  // 改成你想要的目标
```

### 修改主题颜色

编辑 `www/css/index.css`：

```css
/* 主背景 */
background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);

/* 按钮颜色 */
background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
```

### 修改应用名称

编辑 `config.xml`：

```xml
<name>喝水打卡</name>
<description>你的应用描述</description>
```

## 🐛 故障排除

### 构建失败

1. **ANDROID_HOME 未设置**
   ```bash
   # Windows
   setx ANDROID_HOME "C:\Users\你的用户名\AppData\Local\Android\Sdk"

   # Mac/Linux
   export ANDROID_HOME=$HOME/Library/Android/sdk
   ```

2. **Gradle 构建失败**
   - 清除 Gradle 缓存: `./gradlew clean`
   - 删除 platforms 文件夹重新添加

3. **设备未识别**
   - 启用 USB 调试
   - 安装设备驱动
   - 使用 `adb devices` 检查连接

### 运行问题

1. **数据丢失**
   - 清除缓存会丢失数据
   - 卸载应用会清除数据
   - 建议添加数据导出功能

2. **图标不显示**
   - 检查 www/img/ 目录中的图标文件
   - 确保文件名和 config.xml 中配置一致

## 📄 许可证

MIT License - 可自由使用和修改

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

### 如何贡献

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 提交 Pull Request

## 📞 联系方式

- 项目地址: [GitHub](https://github.com/RUthirsty/drinkwater)
- 问题反馈: [Issues](https://github.com/RUthirsty/drinkwater/issues)

## 🙏 致谢

- Apache Cordova 团队
- 所有贡献者

## 📈 版本历史

### v1.0.0 (2024-02-01)
- ✅ 初始版本发布
- ✅ 基础打卡功能
- ✅ 统计和记录功能
- ✅ 进度环显示
- ✅ 完整中文文档

---

**记得多喝水，保持健康！** 💧✨
