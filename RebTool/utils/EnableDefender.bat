@echo off
setlocal EnableDelayedExpansion

whoami | findstr system >NUL

if "%errorlevel%"=="0" (
    set "services=HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services"

    if exist "%AllUsersProfile%\Microsoft\Windows Defender\Platform" (
       for /r "%AllUsersProfile%\Microsoft\Windows Defender\Platform" %%i in ("MsMpEng.exe1") do ren "%%i" "MsMpEng.exe" >nul 2>&1
    )

    if exist "%SystemDrive%\Program Files\Windows Defender" (
      ren "%SystemDrive%\Program Files\Windows Defender\MsMpEng.exe1" "MsMpEng.exe" >nul 2>&1
    )

    reg add "!services!\MsSecCore" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg add "!services!\MsSecFlt" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg add "!services!\MsSecWfp" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    reg add "!services!\SecurityHealthService" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    reg add "!services!\Sense" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul 
    reg add "!services!\WdBoot" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg add "!services!\WdFilter" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg add "!services!\WdNisDrv" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    reg add "!services!\WdNisSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    reg add "!services!\WinDefend" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    reg add "!services!\MDCoreSvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f >NUL 2>nul
    
    reg add "!services!\SgrmAgent" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg add "!services!\SgrmBroker" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    
    reg add "!services!\webthreatdefsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    reg add "!services!\webthreatdefusersvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    
     for /f %%i in ('reg query "!services!" /s /k "webthreatdefusersvc" /f 2^>nul ^| find /i "webthreatdefusersvc" ') do (
      reg add "%%i" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    )
    
    taskkill /f /im smartscreen.exe >NUL 2>nul
    
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "On" /f >NUL 2>nul
    :: reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "NoRun" /t REG_SZ /d on /f >NUL 2>nul
    reg delete "HKLM\SOFTWARE\Policies\Microsoft\CurrentVersion\Explorer" /v "NoRun" /f >NUL 2>nul
    reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 1 /f >NUL 2>nul
    reg add "HKCU\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 1 /f >NUL 2>nul
    :: reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 1 /f >NUL 2>nul
    reg delete "HKLM\Software\Policies\Microsoft\System" /v "EnableSmartScreen" /f >NUL 2>nul

    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0 /f >NUL 2>nul
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControl" /t REG_SZ /d Anywhere /f >NUL 2>nul
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d 1 /f >NUL 2>nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d 3 /f >NUL 2>nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d 2 /f >NUL 2>nul
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 1 /f >NUL 2>nul
    
    :: reg add "HKLM\SYSTEM\ControlSet001\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg delete "HKLM\SYSTEM\ControlSet001\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /f >NUL 2>nul
    
    reg add "HKLM\Software\Microsoft\Windows Defender" /v "PUAProtection" /t REG_DWORD /d "1" /f >NUL 2>nul
    
    :: reg add "HKLM\SYSTEM\ControlSet001\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg delete "HKLM\SYSTEM\ControlSet001\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /f >NUL 2>nul
    :: reg add "HKLM\SYSTEM\ControlSet001\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>nul
    reg delete "HKLM\SYSTEM\ControlSet001\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /f >NUL 2>nul

    net start windefend
    
    echo All done. Press any key to reboot system
    pause >NUL
    shutdown /r /t 0 
) else (
   "%~dp0\Utils\RunAsTI.cmd" cmd /c "%~dp0\EnableDefender.bat"
)
