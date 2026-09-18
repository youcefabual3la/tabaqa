@echo off
set PATH=C:\Program Files\Git\cmd;%PATH%
echo ========================================================
echo TABAQA MEDIA AGENCY — GITHUB LINK & PUSH ASSISTANT
echo ========================================================
echo.

cd /d d:\tabaqa

echo [+] Git Repository is initialized and committed!
echo.

git remote -v >nul 2>&1
if %errorlevel% equ 0 (
    echo [+] Existing Remote Found. Pushing updates...
    git push -u origin main
    echo.
)

set /p REPO_URL="Please enter your GitHub Repository URL (e.g. https://github.com/USERNAME/tabaqa.git): "

if "%REPO_URL%"=="" (
    echo [!] No URL provided. You can run this file anytime later after creating your repo on GitHub!
) else (
    git remote remove origin >nul 2>&1
    git remote add origin %REPO_URL%
    git branch -M main
    git push -u origin main
    echo.
    echo [✓] Successfully linked and pushed to GitHub!
)

echo.
echo ========================================================
echo Next Step: Deploy on Vercel at https://vercel.com/new
echo ========================================================
pause
