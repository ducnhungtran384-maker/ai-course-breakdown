#!/bin/bash

# GitHub 部署脚本
# 使用方法：bash deploy.sh

echo "🚀 开始部署到 GitHub..."

# 检查是否已经添加了远程仓库
if git remote | grep -q "origin"; then
    echo "✅ 远程仓库已存在"
else
    echo "❌ 请先在 GitHub 创建仓库: https://github.com/new"
    echo "   仓库名: ai-course-breakdown"
    echo "   类型: Public"
    echo ""
    read -p "创建完成后，按回车继续..."

    read -p "请输入你的 GitHub 用户名: " username
    git remote add origin https://github.com/$username/ai-course-breakdown.git
    echo "✅ 已添加远程仓库"
fi

# 推送代码
echo "📤 推送代码到 GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 部署成功！"
    echo ""
    echo "📋 下一步："
    echo "1. 访问你的仓库 Settings → Pages"
    echo "2. Source 选择 'Deploy from a branch'"
    echo "3. Branch 选择 'main'，目录选择 '/ (root)'"
    echo "4. 点击 Save"
    echo ""
    echo "🌐 几分钟后访问: https://$username.github.io/ai-course-breakdown/"
else
    echo ""
    echo "❌ 推送失败"
    echo "请检查："
    echo "1. 是否已在 GitHub 创建仓库"
    echo "2. 是否有推送权限"
    echo "3. 网络连接是否正常"
fi
