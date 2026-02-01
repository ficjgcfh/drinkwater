#!/bin/bash

# 喝水打卡应用 - 快速启动脚本

echo "🌊 喝水打卡应用 - 快速启动"
echo "================================"
echo ""

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装"
    echo "请访问 https://nodejs.org/ 下载安装"
    exit 1
fi

echo "✅ Node.js $(node --version)"

# 检查 Cordova
if ! command -v cordova &> /dev/null; then
    echo "⚠️  Cordova 未安装"
    read -p "是否现在安装 Cordova? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        npm install -g cordova
    else
        exit 1
    fi
fi

echo "✅ Cordova $(cordova --version)"

# 选择操作
echo ""
echo "请选择操作:"
echo "1) 在浏览器中测试（推荐新手）"
echo "2) 启动 Cordova 开发服务器"
echo "3) 检查 Android 构建环境"
echo "4) 构建 Android APK"
echo "5) 在设备上运行"
echo "6) 查看使用指南"
echo "0) 退出"
echo ""

read -p "请输入选项 (0-6): " choice

case $choice in
    1)
        echo "📱 在默认浏览器中打开测试页面..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open test.html
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            xdg-open test.html 2>/dev/null || echo "请手动打开 test.html 文件"
        elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
            start test.html
        else
            echo "请手动在浏览器中打开 test.html 文件"
        fi
        ;;

    2)
        echo "🚀 启动开发服务器..."
        echo "访问 http://localhost:8000 查看应用"
        echo "按 Ctrl+C 停止服务器"
        cordova serve
        ;;

    3)
        echo "🔍 检查 Android 构建环境..."
        cordova requirements
        ;;

    4)
        echo "🔨 构建 Android APK..."
        ./build.sh
        ;;

    5)
        echo "📱 在设备上运行..."
        echo "请确保:"
        echo "1. 设备已启用 USB 调试"
        echo "2. 设备已通过 USB 连接"
        echo ""
        read -p "按 Enter 继续..."
        cordova run android
        ;;

    6)
        echo "📖 打开使用指南..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open 使用指南.md
        elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
            xdg-open 使用指南.md 2>/dev/null || cat 使用指南.md
        else
            cat 使用指南.md
        fi
        ;;

    0)
        echo "👋 再见！"
        exit 0
        ;;

    *)
        echo "❌ 无效的选项"
        exit 1
        ;;
esac

echo ""
echo "✨ 完成！"
