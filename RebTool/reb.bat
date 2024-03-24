@echo off 
setlocal EnableDelayedExpansion

set "CURRENT_DIR=%~dp0"
set "CURRENT_VERSION=0.0.2" 
:: 0 - no connection ; 1 - have connection 
set "Internet=0"

title RebTool ^| version: %CURRENT_VERSION%

:main_menu 
echo ===========================
echo ^| 1. Windows Defender     ^| 
echo ^| 2. exit                 ^| 
echo ===========================  

rem set /p choice="Enter your choice: "
choice /C:12 /N /M "Enter your choice: "
if errorlevel 2 goto :EOF
if errorlevel 1 goto defender_menu


:defender_menu 
cls
:: check if service windefend is running in services.msc 
for /f "tokens=2*" %%i in ('reg query "HKLM\SYSTEM\ControlSet001\Services\WinDefend" /v "Start" 2^>nul') do (
    echo %%j | findstr /C:"0x4" >nul
    if !errorlevel! equ 0 (
        set "DEFENDER_CURRENT_STATUS=Disabled"
    )
    echo %%j | findstr /C:"0x3" >nul
    if !errorlevel! equ 0 (
        set "DEFENDER_CURRENT_STATUS=Disabled"
    )
    echo %%j | findstr /C:"0x2" >nul
    if !errorlevel! equ 0 (
        set "DEFENDER_CURRENT_STATUS=Enabled"
    )
)

   
echo Current status: %DEFENDER_CURRENT_STATUS% 
echo ================================= 
if "%DEFENDER_CURRENT_STATUS%"=="Enabled" (
   echo ^| 1. Disable Windows Defender   ^|  
) else if "%DEFENDER_CURRENT_STATUS%"=="Disabled" (
   echo ^| 1. Enable Windows Defender    ^|  
) 
echo ^| 2. Go to main menu            ^| 
echo =================================  

rem set /p defender_choice="Enter your choice: "  
choice /C:12 /N /M "Enter your choice: "

if errorlevel 2 goto :main_menu
if errorlevel 1 goto switch_defender

:switch_defender 
if "%DEFENDER_CURRENT_STATUS%"=="Enabled" (
   start /b /wait "disable defender" "%CURRENT_DIR%\utils\DisableDefender.bat >NUL 2>NUL"
) else if "%DEFENDER_CURRENT_STATUS%"=="Disabled" (
   start /b /wait "enable defender" "%CURRENT_DIR%\utils\EnableDefender.bat >NUL 2>NUL"
)

echo Press any key to exit...
pause >NUL 2>NUL