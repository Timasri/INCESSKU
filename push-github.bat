@echo off
chcp 65001 >nul
set "GIT=C:\Program Files\Git\cmd\git.exe"

if not exist "%GIT%" (
    echo Git belum terinstall. Install dulu dari: https://git-scm.com/download/win
    pause
    exit /b 1
)

cd /d "%~dp0"

echo === Status Git ===
"%GIT%" status

echo.
set /p MSG="Pesan commit (Enter = update website): "
if "%MSG%"=="" set MSG=Update website

"%GIT%" add .
"%GIT%" commit -m "%MSG%" 2>nul
if errorlevel 1 (
    echo Tidak ada perubahan baru untuk di-commit.
) else (
    echo Commit berhasil.
)

echo.
echo === Push ke GitHub ===
"%GIT%" branch -M main
"%GIT%" push -u origin main

if errorlevel 1 (
    echo.
    echo Push gagal. Pastikan sudah login GitHub.
    echo Coba jalankan: "%GIT%" login
) else (
    echo.
    echo Berhasil! Website: https://timasri.github.io/INCESSKU/
)

echo.
pause
