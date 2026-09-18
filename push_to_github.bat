@echo off
echo ========================================================
echo TABAQA MEDIA AGENCY — GITHUB LINK & PUSH SCRIPT
echo ========================================================
echo.

cd /d d:\tabaqa

echo [+] Checking Git...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Git command was not found in your system PATH.
    echo Please install Git for Windows from: https://git-scm.com/download/win
    echo After installing Git, re-run this script to automatically push to GitHub!
    echo.
    echo Commands to run manually after installing Git:
    echo   git init
    echo   git add .
    echo   git commit -m "Tabaqa Agency - Final Release"
    echo   git branch -M main
    echo   git remote add origin YOUR_GITHUB_REPOSITORY_URL
    echo   git push -u origin main
    echo.
    pause
    exit /b
)

echo [+] Initializing Git Repository...
git init
git add .
git commit -m "Tabaqa Agency - Slow-Motion Floating 3D Track + PDF Logo + Subframe ReactBits"

echo.
set /p REPO_URL="Enter your GitHub Repository URL (e.g. https://github.com/username/tabaqa.git): "

if "%REPO_URL%"=="" (
    echo [!] No GitHub repository URL entered. You can push anytime later using:
    echo     git remote add origin YOUR_URL
    echo     git push -u origin main
) else (
    git branch -M main
    git remote add origin %REPO_URL%
    git push -u origin main
    echo.
    echo [✓] Successfully linked and pushed to GitHub!
)

echo.
echo ========================================================
echo Next Step: Deploy on Vercel at https://vercel.com/new
echo ========================================================
pause
