@echo off
setlocal enabledelayedexpansion

:: Remove NoRemove from HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /v "NoRemove" /f

:: Get UninstallString from HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge and set it in variable
for /f "tokens=2*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /v "UninstallString" 2^>nul ^| find "UninstallString"') do (
  set uninstallstring=%%i
)

if defined uninstallstring (
  set uninstallstring=!uninstallstring! "--force-uninstall"
  start /wait "y" cmd /c !uninstallstring! /min
) else (
  for /f "tokens=2*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /v "UninstallString" 2^>nul ^| find "UninstallString"') do (
    set "uninstallstring=%%j"
    set uninstallstring=!uninstallstring! "--force-uninstall"
    start /wait "y" !uninstallstring! /min
  )
)

cls

:: Install vcredist and DirectX
start /wait %windir%\Setup\Scripts\VisualCppRedist_AIO_x86_x64.exe /ai /gm2 >NUL
start /wait %windir%\Setup\Scripts\DirectX.exe /S >NUL

:: Clean up
del %windir%\Setup\Scripts\VisualCppRedist_AIO_x86_x64.exe /s /q >NUL
del %windir%\Setup\Scripts\DirectX.exe /s /q >NUL

endlocal
exit
