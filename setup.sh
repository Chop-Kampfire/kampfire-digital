#!/bin/bash

# 🔥 Kampfire.digital - Quick Start Script
# This script helps you deploy to GitHub Pages

echo "🔥 Kampfire.digital GitHub Pages Setup"
echo "======================================"
echo ""

# Check if we're in the right directory
if [ ! -f "README.md" ]; then
    echo "❌ Error: Please run this script from the kampfire-digital folder"
    echo ""
    echo "To fix this, run:"
    echo "  cd C:\\Users\\tyron\\kampfire-digital"
    echo "  bash setup.sh"
    exit 1
fi

echo "✅ In correct directory"
echo ""

# Check Git
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed"
    echo "Please install from: https://git-scm.com/"
    exit 1
fi

echo "✅ Git is installed"
echo ""

# Check for website files
if [ ! -f "index.html" ]; then
    echo "❌ Website files not found!"
    echo "Please make sure index.html, Kampfire.png, and The_Beach__Night_.png are in this folder."
    exit 1
fi

echo "✅ Website files found"
echo ""

# Get GitHub username
echo "📝 Enter your GitHub username:"
read -p "> " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ Username cannot be empty!"
    exit 1
fi

echo ""
echo "📋 BEFORE CONTINUING:"
echo "   1. Go to https://github.com/new"
echo "   2. Repository name: kampfire-digital"
echo "   3. Make it PUBLIC"
echo "   4. Do NOT check any boxes (no README, no .gitignore)"
echo "   5. Click 'Create repository'"
echo ""
read -p "Press ENTER after creating the repository... "

echo ""
echo "🚀 Setting up Git repository..."

# Initialize and push
git init
git add .
git commit -m "Initial commit: Kampfire.digital website"
git branch -M main
git remote add origin "https://github.com/$GITHUB_USERNAME/kampfire-digital.git"

echo ""
echo "📤 Pushing to GitHub..."
echo "   (You may be asked for authentication)"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 SUCCESS! Your code is on GitHub!"
    echo ""
    echo "📋 Final steps to go live:"
    echo ""
    echo "1. Go to: https://github.com/$GITHUB_USERNAME/kampfire-digital/settings/pages"
    echo ""
    echo "2. Under 'Build and deployment':"
    echo "   - Source: Deploy from a branch"
    echo "   - Branch: main"
    echo "   - Folder: / (root)"
    echo "   - Click SAVE"
    echo ""
    echo "3. Wait 2-3 minutes, then visit:"
    echo "   https://$GITHUB_USERNAME.github.io/kampfire-digital/"
    echo ""
    echo "4. To use kampfire.digital domain:"
    echo "   - See 'Custom Domain Setup' in README.md"
    echo ""
else
    echo ""
    echo "❌ Push failed!"
    echo ""
    echo "Common fixes:"
    echo "1. Make sure repository exists on GitHub"
    echo "2. You may need a Personal Access Token:"
    echo "   - Go to: https://github.com/settings/tokens"
    echo "   - Generate new token (classic)"
    echo "   - Select 'repo' scope"
    echo "   - Use token as password when pushing"
    echo ""
fi
