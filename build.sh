#!/bin/bash

# 喝水打卡应用构建脚本

echo "🚀 开始构建喝水打卡应用..."

# 检查是否在正确的目录
if [ ! -f "config.xml" ]; then
    echo "❌ 错误: 请在 drinkwater 目录中运行此脚本"
    exit 1
fi

# 检查构建要求
echo "📋 检查构建要求..."
cordova requirements

# 询问构建类型
echo ""
echo "请选择构建类型:"
echo "1) 调试版 (Debug)"
echo "2) 发布版 (Release)"
read -p "请输入选项 (1 或 2): " choice

case $choice in
    1)
        echo "🔨 构建调试版 APK..."
        cordova build android
        if [ $? -eq 0 ]; then
            echo "✅ 构建成功!"
            echo "📦 APK 位置: platforms/android/app/build/outputs/apk/debug/app-debug.apk"
        else
            echo "❌ 构建失败"
            exit 1
        fi
        ;;
    2)
        echo "🔨 构建发布版 APK..."
        cordova build android --release
        if [ $? -eq 0 ]; then
            echo "✅ 构建成功!"
            echo "📦 APK 位置: platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk"
            echo "⚠️  注意: 发布版 APK 需要签名才能安装"
        else
            echo "❌ 构建失败"
            exit 1
        fi
        ;;
    *)
        echo "❌ 无效的选项"
        exit 1
        ;;
esac

echo ""
echo "🎉 完成!"
