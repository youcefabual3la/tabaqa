@echo off
echo ========================================================
echo TABAQA MEDIA AGENCY — GITHUB PUSH ASSISTANT
echo ========================================================
echo.

cd /d d:\tabaqa

git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Git is not found in system PATH.
    echo Please install Git for Windows from: https://git-scm.com/download/win
    echo After installing, execute:
    echo   git init
    echo   git add .
    echo   git commit -m "Integrated JellyRadio from React Bits"
    echo   git remote add origin YOUR_REPOSITORY_URL
    echo   git push -u origin main
    echo.
    pause
    exit /b
)

echo [+] Initializing Git repository...
git init
git add .
git commit -m "Integrated JellyRadio component from React Bits & Subframe"

echo.
set /p REPO_URL="Enter your GitHub repository URL (e.g. https://github.com/username/tabaqa.git): "

if "%REPO_URL%"=="" (
    echo [!] No repository URL entered. You can set it later using:
    echo     git remote add origin YOUR_URL
    echo     git push -u origin main
) else (
    git branch -M main
    git remote add origin %REPO_URL%
    git push -u origin main
    echo [+] Successfully pushed to GitHub!
)

echo.
echo ========================================================
echo Next Step: Deploy on Vercel at https://vercel.com/new
echo ========================================================
pause
