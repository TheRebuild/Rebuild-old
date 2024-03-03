@echo off 

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

winget settings --enable InstallerHashOverride >NUL 2>&1

echo Messengers
echo ========================================
echo 1. Telegram Desktop (+ Forks)
echo 2. Discord (and other channel branches)
echo 3. Viber
echo 4. WhatsApp
echo 5. Zoom
echo 6. Element
echo ========================================

set /p choice="Enter your choice: "

if "%choice%"=="1" (
   echo ==============
   echo 1. Telegram Desktop (Official)
   echo 2. 64Gram
   echo ==============
   set /p choice="Enter your choice: "

   if "%choice%"=="1" (
      winget install Telegram.TelegramDesktop --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&
      goto finish
   ) else if "%choice%"=="2" (
      winget install 64gram.64gram --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   )
) else if "%choice%"=="2" (
   echo ========================
   echo 1. Discord (Official)
   echo 2. Discord PTB
   echo 3. Discord Canary
   echo 4. Discord Development
   echo 5. Vencord
   echo ========================
   set /p choice="Enter your choice: "

   if "%choice%"=="1" (
      winget install Discord.Discord --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="2" (
      winget install Discord.Discord.PTB --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="3" (
      winget install Discord.Discord.Canary --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&
      goto finish
   ) else if "%choice%"=="4" (
      winget install Discord.Discord.Development --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&
      goto finish
   ) else if "%choice%"=="5" (
      winget install Vencord.Vencord --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&
      goto finish
   )
) else if "%choice%"=="3" (
   winget install Viber.Viber --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="4" (
   winget install WhatsApp.WhatsApp --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="5" (
   winget install Zoom.Zoom --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else if "%choice%"=="6" (
   winget install Element.Element --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
)

:finish
echo Done. Press any key to exit...
pause >nul
