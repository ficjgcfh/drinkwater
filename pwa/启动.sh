#!/bin/bash

echo "🚀 启动喝水打卡 PWA 应用..."
echo ""

# 检查端口是否被占用
PORT=8080
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null 2>&1 ; then
    echo "⚠️  端口 $PORT 已被占用"
    PORT=8081
    echo "📌 使用端口 $PORT"
fi

echo "🌐 启动本地服务器..."
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  访问地址: http://localhost:$PORT"
echo ""
echo "  电脑测试: 在浏览器中打开上面的地址"
echo "  手机测试: 确保手机和电脑在同一WiFi网络"
echo "           然后访问: http://你的电脑IP:$PORT"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "💡 提示:"
echo "   - 按 Ctrl+C 停止服务器"
echo "   - 第一次访问后可离线使用"
echo "   - 在浏览器中可点击'安装'按钮"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 尝试使用不同的服务器
if command -v python3 &> /dev/null; then
    echo "✅ 使用 Python3 服务器"
    echo ""
    python3 -m http.server $PORT
elif command -v python &> /dev/null; then
    echo "✅ 使用 Python 服务器"
    echo ""
    python -m SimpleHTTPServer $PORT
elif command -v node &> /dev/null; then
    echo "✅ 使用 Node.js 服务器"
    echo ""
    npx http-server -p $PORT
elif command -v php &> /dev/null; then
    echo "✅ 使用 PHP 服务器"
    echo ""
    php -S localhost:$PORT
else
    echo "❌ 未找到可用的服务器"
    echo ""
    echo "请安装以下任意一个:"
    echo "  - Python 3"
    echo "  - Node.js"
    echo "  - PHP"
    echo ""
    echo "或者使用在线托管服务（推荐）:"
    echo "  - Netlify: https://app.netlify.com/drop"
    echo "  - Vercel: https://vercel.com/"
    echo "  - GitHub Pages"
    exit 1
fi
