@echo off 

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

winget settings --enable InstallerHashOverride >NUL 2>&1

echo Torrent Client
echo ===========================
echo 1. Qbittorrent
echo 2. 
echo ===========================

set /p choice="Enter your choice: "

if "%choice%"=="1" (
   winget install qBittorrent.qBittorrent --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="2" (
   ...
)

:finish
echo Done. Press any key to exit...
pause >nul
