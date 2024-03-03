@echo off

:: Remove NoRemove from HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /v NoRemove /f

:: Get UninstallString from HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge and set it in variable
for /f "tokens=3" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge" /v "UninstallString" 2^>nul') do (
  set uninstallstring=%%i
)

if defined uninstallstring (
  set uninstallstring=%uninstallstring% + "--force-uninstall"
  start /wait "y" cmd /c %uninstallstring% /min
) else (
  echo UninstallString not found
)

:: Install vcredist
cd "%%~dp0" >NUL
start /wait VisualCppRedist_AIO_x86_x64.exe /ai /gm2 >NUL

:: Install DirectX
start /wait DirectX.exe /S >NUL

del VisualCppRedist_AIO_x86_x64.exe /s /q >NUL
del DirectX.exe /s /q >NUL
