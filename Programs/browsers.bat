@echo off 

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

winget settings --enable InstallerHashOverride >NUL 2>&1

echo Browsers
echo ===================
echo 1. Google Chrome
echo 2. Mozilla Firefox
echo 3. Microsoft Edge
echo 4. Vivaldi
echo 5. Librewolf
echo 6. Brave
echo 7. Waterfox
echo 8. Floorp
echo ===================

set /p choice="Enter your choice: "

if "%choice%"=="1" (
   winget install Google.Chrome --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="2" (
   echo =================================================
   echo 1. Mozilla Firefox ESR (Extended Support Release)
   echo 2. Mozilla Firefox (Default)
   echo =================================================
   set /p choice="Enter your choice: "
   if "%choice%"=="1" (
      winget install Mozilla.Firefox.ESR --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else (
      winget install Mozilla.Firefox --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   )
) else if "%choice%"=="3" (
   winget install Microsoft.Edge --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="4" (
   winget install Vivaldi.Vivaldi --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="5" (
   winget install LibreWolf.LibreWolf --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="6" (
   winget install Brave.Brave --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="7" (
   winget install Waterfox.Waterfox --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="8" (
   winget install Ablaze.Floorp --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
)

:finish
echo Done. Press any key to exit...
pause >nul
