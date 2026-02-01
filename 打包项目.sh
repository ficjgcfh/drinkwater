#!/bin/bash

echo "📦 打包喝水打卡项目..."
echo ""

# 创建临时目录
PACKAGE_DIR="drinkwater-package"
rm -rf $PACKAGE_DIR
mkdir -p $PACKAGE_DIR

# 复制必要文件
echo "📋 复制文件..."
cp -r www $PACKAGE_DIR/
cp config.xml $PACKAGE_DIR/
cp package.json $PACKAGE_DIR/
cp -r hooks $PACKAGE_DIR/ 2>/dev/null || true

# 创建说明文件
cat > $PACKAGE_DIR/README.txt << 'EOF'
喝水打卡 Cordova 应用
===================

这个包包含了构建 Android APK 所需的所有文件。

快速开始：
---------

方法一：在线构建（推荐，最简单）
1. 访问 https://monaca.io/
2. 注册并登录
3. 创建新项目 → Import
4. 上传这个压缩包
5. Build → Android Debug
6. 下载 APK

方法二：本地构建
1. 安装 Node.js, Java JDK, Android Studio
2. 配置 Android SDK 环境变量
3. 安装 Cordova: npm install -g cordova
4. 解压这个包
5. 进入目录: cd drinkwater-package
6. 添加平台: cordova platform add android
7. 构建: cordova build android
8. APK 位于: platforms/android/app/build/outputs/apk/debug/

详细说明：
---------
查看完整文档中的"本地构建APK指南.md"

文件说明：
---------
www/         - 应用源代码
config.xml   - Cordova 配置
package.json - 项目依赖

版本：v1.0.0
日期：2024-02-01
EOF

# 打包
echo "🗜️  压缩文件..."
cd ..
zip -r drinkwater-package.zip $PACKAGE_DIR

# 清理
rm -rf $PACKAGE_DIR

# 完成
echo ""
echo "✅ 打包完成！"
echo ""
echo "📦 文件: drinkwater-package.zip"
echo "📏 大小: $(du -h drinkwater-package.zip | cut -f1)"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "下一步："
echo ""
echo "🌐 在线构建（推荐）："
echo "   1. 访问 https://monaca.io/"
echo "   2. 上传 drinkwater-package.zip"
echo "   3. 点击构建"
echo "   4. 下载 APK"
echo ""
echo "💻 本地构建："
echo "   1. 配置 Android 开发环境"
echo "   2. 解压 drinkwater-package.zip"
echo "   3. cordova platform add android"
echo "   4. cordova build android"
echo ""
echo "📖 详细说明："
echo "   - 在线构建APK指南.md"
echo "   - 本地构建APK指南.md"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
