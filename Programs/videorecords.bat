@echo off 

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

winget settings --enable InstallerHashOverride >NUL 2>&1

echo Video Recording Software
echo ========================================
echo 1. OBS Studio
echo 2. Bandicam
echo 3. 
echo ========================================

set /p choice="Enter your choice: "

if "%choice%"=="1" (
   winget install OBSProject.OBSStudio --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1 
   goto finish
) else if "%choice%"=="2" (
   winget install Bandicam.Bandicam --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="3" (
   winget install Spotify.Spotify --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="4" (
   winget install dotPDNLLC.paintdotnet --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="5" (
   winget install PeterPawlowski.foobar2000 --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
)

:finish
echo Done. Press any key to exit...
pause >nul
