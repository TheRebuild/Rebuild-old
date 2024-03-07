@echo off

:: Batch file for completing the final stage of the installation

echo Please, wait...
timeout /t 3 >NUL

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /d 0 /t REG_DWORD /f >NUL 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /d 0 /t REG_DWORD /f >NUL 2>nul

taskkill /f /im explorer.exe >NUL 2>nul && start explorer.exe >NUL 2>nul
exit
