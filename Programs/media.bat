@echo off 

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

winget settings --enable InstallerHashOverride >NUL 2>&1

echo Media and Audio
echo ========================================
echo 1. VLC Media Player
echo 2. Media Player Classic
echo 3. Spotify
echo 4. Paint.NET
echo 5. foobar2000
echo ========================================

set /p choice="Enter your choice: "

if "%choice%"=="1" (
   winget install VideoLAN.VLC --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="2" (
   winget install clsid2.mpc-hc --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="3" (
   winget install Spotify.Spotify --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="4" (
   winget install dotPDNLLC.paintdotnet --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
)
else if "%choice%"=="5" (
   winget install PeterPawlowski.foobar2000 --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
)
:finish
echo Done. Press any key to exit...
pause >nul
