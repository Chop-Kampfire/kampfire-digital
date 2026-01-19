# Kampfire.digital - GitHub Pages Setup Guide

This guide will help you deploy your website to GitHub Pages and manage it via terminal.

## 🎯 What You'll Accomplish
- Create a GitHub repository for your website
- Deploy your site to GitHub Pages (free hosting)
- Connect your kampfire.digital domain
- Learn to update your site via terminal

## 📋 Prerequisites
- [x] Git installed (version 2.43.0 detected)
- [ ] GitHub account (create at github.com if needed)
- [ ] Your website files in this folder

## 🚀 Step-by-Step Setup

### Step 1: Create GitHub Repository

1. Go to https://github.com and sign in (or create an account)
2. Click the **+** icon (top right) → **New repository**
3. Repository settings:
   - **Name:** `kampfire-digital` (or your-username.github.io for default domain)
   - **Description:** "Personal website for Kampfire.digital"
   - **Public** (required for free GitHub Pages)
   - **Do NOT** initialize with README, .gitignore, or license
4. Click **Create repository**

### Step 2: Initialize Local Repository

Open your terminal and run these commands:

```bash
# Navigate to your project folder
cd C:\Users\tyron\kampfire-digital

# Initialize Git repository
git init

# Add all files
git add .

# Create your first commit
git commit -m "Initial commit: Kampfire.digital website"

# Add your GitHub repository as remote (replace YOUR-USERNAME)
git remote add origin https://github.com/YOUR-USERNAME/kampfire-digital.git

# Rename branch to main (GitHub's default)
git branch -M main

# Push to GitHub
git push -u origin main
```

**Note:** Replace `YOUR-USERNAME` with your actual GitHub username!

### Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** (top menu)
3. Click **Pages** (left sidebar)
4. Under "Source":
   - Select **Deploy from a branch**
   - Branch: **main**
   - Folder: **/ (root)**
5. Click **Save**
6. Wait 2-3 minutes, then your site will be live at:
   `https://YOUR-USERNAME.github.io/kampfire-digital/`

### Step 4: Connect Your Custom Domain (kampfire.digital)

#### A. In GitHub:
1. Still in Settings → Pages
2. Under "Custom domain", enter: `kampfire.digital`
3. Click **Save**
4. Check **Enforce HTTPS** (after DNS propagates)

#### B. In GoDaddy:
1. Log into GoDaddy
2. Go to **My Products** → **DNS** for kampfire.digital
3. Add these records:

**A Records** (delete existing A records first):
```
Type: A
Name: @
Value: 185.199.108.153
TTL: 600

Type: A
Name: @
Value: 185.199.109.153
TTL: 600

Type: A
Name: @
Value: 185.199.110.153
TTL: 600

Type: A
Name: @
Value: 185.199.111.153
TTL: 600
```

**CNAME Record** (for www):
```
Type: CNAME
Name: www
Value: YOUR-USERNAME.github.io
TTL: 600
```

5. Save changes
6. Wait 15 minutes - 48 hours for DNS propagation
7. Visit kampfire.digital - your site should be live!

### Step 5: Create CNAME File

Create a file called `CNAME` (no extension) in your repository:

```bash
# In your project folder
echo kampfire.digital > CNAME

# Commit and push
git add CNAME
git commit -m "Add custom domain CNAME"
git push
```

## 🔄 How to Update Your Website

Whenever you make changes to your website:

```bash
# 1. Navigate to project folder
cd C:\Users\tyron\kampfire-digital

# 2. Make your changes to files (edit HTML, CSS, images, etc.)

# 3. Stage your changes
git add .

# 4. Commit with a message
git commit -m "Description of your changes"

# 5. Push to GitHub (automatically updates your live site)
git push
```

Your changes will be live in 1-2 minutes!

## 📝 Common Commands

```bash
# Check status of your files
git status

# View commit history
git log

# Discard local changes (be careful!)
git reset --hard

# Pull latest changes from GitHub
git pull

# View remote repository URL
git remote -v
```

## 🔧 Troubleshooting

### "Permission denied (publickey)"
You need to set up SSH keys or use HTTPS with personal access token.

**Quick fix - Use HTTPS:**
```bash
git remote set-url origin https://github.com/YOUR-USERNAME/kampfire-digital.git
```
When pushing, use your GitHub username and a Personal Access Token (not password).

**Create token:** GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic) → Generate new token

### "Updates were rejected"
```bash
git pull --rebase origin main
git push
```

### Site not updating after push
- Wait 2-3 minutes for GitHub Actions to rebuild
- Check the "Actions" tab in your repository for build status
- Clear browser cache (Ctrl + Shift + R)

### Custom domain not working
- Ensure CNAME file exists in repository root
- Verify DNS records in GoDaddy
- Wait for DNS propagation (can take up to 48 hours)
- Check GitHub Pages settings

## 📁 Project Structure

```
kampfire-digital/
├── index.html              # Your main website file
├── Kampfire.png           # Campfire image
├── The_Beach__Night_.png  # Beach background
├── CNAME                  # Custom domain file
└── README.md              # This guide
```

## 🎨 Next Steps After Deployment

1. Add your real social media links
2. Create actual blog posts
3. Add portfolio project links
4. Set up Google Analytics (optional)
5. Add a favicon

## 📞 Need Help?

- GitHub Pages Docs: https://docs.github.com/en/pages
- GitHub Community: https://github.community/
- Git Documentation: https://git-scm.com/doc

---

**Your site will be live at:**
- GitHub Pages URL: `https://YOUR-USERNAME.github.io/kampfire-digital/`
- Custom domain: `https://kampfire.digital` (after DNS setup)

Good luck! 🔥🚀
