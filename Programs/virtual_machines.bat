@echo off 

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

winget settings --enable InstallerHashOverride >NUL 2>&1

echo Virtual Machines
echo ===========================
echo 1. VMware Workstation Pro
echo 2. Virtualbox
echo ===========================

set /p choice="Enter your choice: "

if "%choice%"=="1" (
   echo Installing, please wait...
   winget install VMware.WorkstationPro --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
   goto finish
) else if "%choice%"=="2" (
   echo Installing, please wait...
   winget install Oracle.VirtualBox --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
   goto finish
)

:finish
echo Done. Press any key to exit...
pause >nul
