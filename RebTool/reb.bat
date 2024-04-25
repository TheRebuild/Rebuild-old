@echo off 
setlocal EnableDelayedExpansion

set "CURRENT_DIR=%~dp0"
set "CURRENT_VERSION=0.0.2" 
:: 0 - no connection ; 1 - have connection 
set "Internet=0"

title RebuildTool ^| version: %CURRENT_VERSION%

echo GitHub: https://github.com/TheRebuild
echo.

:main_menu 
echo ===========================
echo ^| 1. Windows Defender     ^| 
echo ^| 2. Tweaks               ^|
echo ^| 3. exit                 ^| 
echo ===========================  

rem set /p choice="Enter your choice: "
choice /C:12 /N /M "Enter your choice: "
if errorlevel 3 goto :EOF
if errorlevel 2 goto tweaks_menu
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
   start /b /wait "disable defender" "%CURRENT_DIR%\utils\DisableDefender.bat" >NUL 2>NUL
   set "DEFENDER_CURRENT_STATUS=Disabled"
) else if "%DEFENDER_CURRENT_STATUS%"=="Disabled" (
   start /b /wait "enable defender" "%CURRENT_DIR%\utils\EnableDefender.bat" >NUL 2>NUL
   set "DEFENDER_CURRENT_STATUS=Enabled"
)
cls
call :show_done %DEFENDER_CURRENT_STATUS%


:tweaks_menu
echo ================================================
echo ^| 1. Hide/Unhide Recent items in Quick Access  ^|
echo ^| 2. Show/Hide Edge tabs in alt-tab            ^|
echo ^| 3. Enable/Disable AutoRun (AutoPlay)         ^|
echo ^| 4. Go to main menu                           ^|
echo ================================================

choice /C:1234 /N /M "Enter your choice: "
 
if errorlevel 4 goto :main_menu
if errorlevel 3 goto autorun
if errorlevel 2 goto hide_edge_tabs
if errorlevel 1 goto hide_unhide_items


:hide_unhide_items
for /f "tokens=2*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" 2^>nul') do (
    echo %%j | findstr /C:"0x1" >nul
    if !errorlevel! equ 0 (
        set "QUICK_ACCESS_ITEMS=Enabled"
    ) else (
        set "QUICK_ACCESS_ITEMS=Disabled"
    )
)

if "%QUICK_ACCESS_ITEMS%"=="Enabled" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f >NUL 2>nul
    set "QUICK_ACCESS_ITEMS=Disabled"
) else if "%QUICK_ACCESS_ITEMS%"=="Disabled" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "1" /f >NUL 2>nul
    set "QUICK_ACCESS_ITEMS=Enabled"
)
call :show_done %QUICK_ACCESS_ITEMS%

:autorun
for /f "tokens=2*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" 2^>nul') do (
    echo %%j | findstr /C:"0x0" >nul
    if !errorlevel! equ 0 (
        set "AUTORUN=Enabled"
    ) else (
        set "AUTORUN=Disabled"
    )
)

if "%AUTORUN%"=="Enabled" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "1" /f >NUL 2>nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "NoAutoPlayfornonVolume" /t REG_DWORD /d "1" /f >NUL 2>nul
    set "AUTORUN=Disabled"
) else if "%AUTORUN%"=="Hidden" (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "NoAutoPlayfornonVolume" /t REG_DWORD /d "0" /f >NUL 2>nul
    set "AUTORUN=Enabled"
)
call :show_done %AUTORUN%

:hide_edge_tabs
for /f "tokens=2*" %%i in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MultiTaskingAltTabFilter" 2^>nul') do (
    echo %%j | findstr /C:"0x0" >nul
    if !errorlevel! equ 0 (
        set "EDGE_TABS=Shown"
    ) else (
        set "EDGE_TABS=Hidden"
    )
)

if "%EDGE_TABS%"=="Shown" (
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MultiTaskingAltTabFilter" /t REG_DWORD /d "3" /f >NUL 2>nul
    set "EDGE_TABS=Disabled"
) else if "%EDGE_TABS%"=="Hidden" (
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MultiTaskingAltTabFilter" /t REG_DWORD /d "0" /f >NUL 2>nul
    set "EDGE_TABS=Enabled"
)
call :show_done %EDGE_TABS%


:show_done
cls
echo Done. Current status: %~1
timeout /t 3 >NUL
goto :main_menu