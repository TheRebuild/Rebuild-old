@echo off 

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

title RebOS - Programs ^| Version 1.0.2.1

winget settings --enable InstallerHashOverride >NUL 2>&1

echo Main Menu
echo ========================================
echo 1. Browsers
echo 2. Game Launchers
echo 3. Media and Audio
echo 4. Messengers
echo 5. Text and IDE
echo 6. Virtual Machines
echo 7. Video Records Software
echo 8. Screenshoters
echo 9. Torrent Clients
echo ========================================

set /p choice="Enter your choice: "

cls

if "%choice%"=="1" (
   call "%~dp0\Programs\browsers.bat"
) else if "%choice%"=="2" (
   call "%~dp0\Programs\game_launcher.bat"
) else if "%choice%"=="3" (
   call "%~dp0\Programs\media.bat"
) else if "%choice%"=="4" (
   call "%~dp0\Programs\messengers.bat"
) else if "%choice%"=="5" (
   call "%~dp0\Programs\text.bat"
) else if "%choice%"=="6" (
   call "%~dp0\Programs\virtual_machines.bat"
) else if "%choice%"=="7" (
   call "%~dp0\Programs\videorecords.bat"
) else if "%choice%"=="8" (
   call "%~dp0\Programs\screenshoters.bat"
) else if "%choice%"=="9" (
   call "%~dp0\Programs\torrent.bat"
)
