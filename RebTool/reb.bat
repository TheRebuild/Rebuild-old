@echo off 
setlocal EnableDelayedExpansion

set "CURRENT_DIR=%~dp0"
set "CURRENT_VERSION=0.0.1" 
:: 0 - no connection ; 1 - have connection 
set "Internet=0"

:main_menu 
echo ===========================
echo ^| 1. Windows Defender     ^| 
echo ^| 2. exit                 ^| 
echo ===========================  

set /p choice="Enter your choice: "
if %choice%==1 ( goto defender_menu ) else ( exit )


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

set /p defender_choice="Enter your choice: "  

if !defender_choice!==1 ( goto switch_defender ) else if !defender_choice!==2 ( goto :main_menu )   

:switch_defender 
if "%DEFENDER_CURRENT_STATUS%"=="Enabled" (
   call %CURRENT_DIR%\utils\DisableDefender.bat
) else if "%DEFENDER_CURRENT_STATUS%"=="Disabled" (
   call %CURRENT_DIR%\utils\EnableDefender.bat
)

pause