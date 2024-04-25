@echo off 
setlocal EnableDelayedExpansion

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

title RebuildOS - Programs ^| Version 1.0.2.2

winget settings --enable InstallerHashOverride >NUL 2>&1

echo GitHub: https://github.com/RebTeam
echo.
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
    echo Browsers
    echo ===================
    echo 1. Google Chrome
    echo 2. Mozilla Firefox
    echo 3. Microsoft Edge
    echo 4. Vivaldi
    echo 5. Librewolf
    echo 6. Brave
    echo 7. Waterfox
    echo 8. Floorp
    echo ===================
    
    set /p browser_choice=Enter your choice: 
    if !browser_choice!==1 (
       echo Installing, please wait...
       winget install Google.Chrome --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    if !browser_choice!==3 (
       echo Installing, please wait...
       winget install Microsoft.Edge --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    if !browser_choice!==4 (
       echo Installing, please wait...
       winget install Vivaldi.Vivaldi --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    if !browser_choice!==5 (
       echo Installing, please wait...
       winget install LibreWolf.LibreWolf --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    if !browser_choice!==6 (
       echo Installing, please wait...
       winget install Brave.Brave --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    if !browser_choice!==7 (
       echo Installing, please wait...
       winget install Waterfox.Waterfox --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    if !browser_choice!==8 (
       echo Installing, please wait...
       winget install Ablaze.Floorp --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    )
    if !browser_choice!==2 (
       echo =================================================
       echo 1. Mozilla Firefox ESR *Extended Support Release*
       echo 2. Mozilla Firefox *Default*
       echo =================================================
       set /p mozilla_choice="Enter your choice: "
       if !mozilla_choice!==1 (
          echo Installing, please wait...
          winget install Mozilla.Firefox.ESR --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !mozilla_choice!==2 (
          echo Installing, please wait...
          winget install Mozilla.Firefox --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       )
    )
) else if "%choice%"=="2" (
    echo Game Launchers
    echo ===================
    echo 1. Steam
    echo 2. Epic Games
    echo 3. Ubisoft Connect
    echo ===================
    
    set /p launcher_choice=Enter your choice: 
    
    if !launcher_choice!==1 (
       echo Installing, please wait...
       winget install Valve.Steam --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) else if !launcher_choice!==2 (
       echo Installing, please wait...
       winget install EpicGames.EpicGamesLauncher --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) else if !launcher_choice!==3 (
       echo Installing, please wait...
       winget install Ubisoft.Connect --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
) else if "%choice%"=="3" (
    echo Media and Audio
    echo ========================================
    echo 1. VLC Media Player
    echo 2. Media Player Classic
    echo 3. Spotify
    echo 4. Paint.NET
    echo 5. foobar2000
    echo ========================================
    
    set /p media_choice=Enter your choice: 
    
    if !media_choice!==1 (
       echo Installing, please wait...
       winget install VideoLAN.VLC --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) else if !media_choice!==2 (
       echo Installing, please wait...
       winget install clsid2.mpc-hc --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) else if !media_choice!==3 (
       echo Installing, please wait...
       winget install Spotify.Spotify --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) else if !media_choice!==4 (
       echo Installing, please wait...
       winget install dotPDNLLC.paintdotnet --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) else if !media_choice!==5 (
       echo Installing, please wait...
       winget install PeterPawlowski.foobar2000 --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    )
) else if "%choice%"=="4" (
    echo Messengers
    echo ========================================
    echo 1. Telegram Desktop (+ Forks)
    echo 2. Discord (and other channel branches)
    echo 3. Viber
    echo 4. WhatsApp
    echo 5. Zoom
    echo 6. Element
    echo ========================================
    
    set /p messenger_choice=Enter your choice: 
    
    if !messenger_choice!==3 (
       echo Installing, please wait...
       winget install Viber.Viber --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    
    if !messenger_choice!==4 (
       echo Installing, please wait...
       winget install WhatsApp.WhatsApp --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    
    if !messenger_choice!==5 (
       echo Installing, please wait...
       winget install Zoom.Zoom --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) 
    
    if !messenger_choice!==6 (
       echo Installing, please wait...
       winget install Element.Element --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    )
    
    if !messenger_choice!==1 (
       echo ================================
       echo 1. Telegram Desktop *Official*
       echo 2. 64Gram
       echo ================================
       set /P telegram_choice=Enter your choice:  
    
       if !telegram_choice!==1 (
          winget install Telegram.TelegramDesktop --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) 
       if !telegram_choice!==2 (
          winget install 64gram.64gram --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       )
    )
    if !messenger_choice!==2 (
       echo ========================
       echo 1. Discord *Official*
       echo 2. Discord PTB
       echo 3. Discord Canary
       echo 4. Discord Development
       echo 5. Vencord
       echo ========================
       set /p discord_choice=Enter your choice: 
    
       if !discord_choice!==1 (
          echo Installing, please wait...
          winget install Discord.Discord --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !discord_choice!==2 (
          echo Installing, please wait...
          winget install Discord.Discord.PTB --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !discord_choice!==3 (
          echo Installing, please wait...
          winget install Discord.Discord.Canary --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !discord_choice!==4 (
          echo Installing, please wait...
          winget install Discord.Discord.Development --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !discord_choice!==5 (
          echo Installing, please wait...
          winget install Vencord.Vencord --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       )
    ) 
) else if "%choice%"=="5" (
    echo Text and IDE
    echo ========================================
    echo 1. Visual Studio (+ Code)
    echo 2. JetBrains
    echo 3. Sublime Text
    echo 4. Vim
    echo 5. Notepad++
    echo ========================================
    
    set /p text_choice=Enter your choice: 
    
    if !text_choice!==1 (
       echo ===================================
       echo 1. Visual Studio Code
       echo 2. Visual Studio Code Insiders
       echo 3. Visual Studio Community 2022
       echo 4. Visual Studio Community 2019
       echo 5. Visual Studio Professional 2022
       echo 6. Visual Studio Professional 2019
       echo ===================================
    
       set /p vs_choice=Enter your choice: 
    
       if !vs_choice!==1 (
          echo Installing, please wait...
          winget install Microsoft.VisualStudioCode --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !vs_choice!==2 (
          echo Installing, please wait...
          winget install Microsoft.VisualStudioCode.Insiders --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !vs_choice!==3 (
          echo Installing, please wait...
          winget install Microsoft.VisualStudio.2022.Community --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !vs_choice!==4 (
          echo Installing, please wait...
          winget install Microsoft.VisualStudio.2019.Community --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !vs_choice!==5 (
          echo Installing, please wait...
          winget install Microsoft.VisualStudio.2022.Professional --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !vs_choice!==6 (
          echo Installing, please wait...
          winget install Microsoft.VisualStudio.2019.Professional --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       )
    ) else if !text_choice!==2 (
       echo ==================
       echo 1. PyCharm Community
       echo 2. PyCharm Professional
       echo 3. CLion
       echo 4. WebStorm
       echo 5. IntelliJ IDEA
       echo 6. IntelliJ IDEA Community Edition
       echo 7. PhpStorm
       echo 8. GoLand
       echo ==================
    
       set /p jetbrains_choice=Enter your choice: 
    
       if !jetbrains_choice!==1 (
          echo Installing PyCharm Community, please wait...
          winget install JetBrains.PyCharm.Community --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !jetbrains_choice!==2 (
          echo Installing PyCharm Professional, please wait...
          winget install JetBrains.PyCharm.Professional --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !jetbrains_choice!==3 (
          echo Installing CLion, please wait...
          winget install JetBrains.CLion --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !jetbrains_choice!==4 (
          echo Installing WebStorm, please wait...
          winget install Jetbrains.WebStorm --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !jetbrains_choice!==5 (
          echo Installing IntelliJ IDEA, please wait...
          winget install JetBrains.IntelliJIDEA.Ultimate --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !jetbrains_choice!==6 (
          echo Installing IntelliJ IDEA Community, please wait...
          winget install JetBrains.IntelliJIDEA.Community --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !jetbrains_choice!==7 (
          echo Installing PhpStorm, please wait...
          winget install JetBrains.WebStorm --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !jetbrains_choice!==8 (
          echo Installing GoLand, please wait...
          winget install JetBrains.GoLand --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       )
    ) else if !text_choice!==3 (
       echo ===================================
       echo 1. Sublime Text 4
       echo 2. Sublime Text 3
       echo 3. Sublime Merge
       echo ===================================
       
       set /p sublime_choice=Enter your choice: 
    
       if !sublime_choice!==1 (
          echo Installing, please wait...
          winget install SublimeHQ.SublimeText.4 --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !sublime_choice!==2 (
          echo Installing, please wait...
          winget install SublimeHQ.SublimeText.3 --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       ) else if !sublime_choice!==3 (
          echo Installing, please wait...
          winget install SublimeHQ.SublimeMerge --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
          goto finish
       )
    ) else if !text_choice!==4 (
       echo Installing, please wait...
       winget install vim.vim --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    )
    else if !text_choice!==5 (
       echo Installing, please wait...
       winget install Notepad++.Notepad++ --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    )
) else if "%choice%"=="6" (
    echo Virtual Machines
    echo ===========================
    echo 1. VMware Workstation Pro
    echo 2. Virtualbox
    echo ===========================
    
    set /p virtual_choice=Enter your choice: 
    
    if !virtual_choice!==1 (
       echo Installing, please wait...
       winget install VMware.WorkstationPro --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    ) else if !virtual_choice!==2 (
       echo Installing, please wait...
       winget install Oracle.VirtualBox --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    )
) else if "%choice%"=="7" (
    echo Video Recording Software
    echo ========================================
    echo 1. OBS Studio
    echo 2. Bandicam
    echo ========================================
    
    set /p video_choice=Enter your choice: 
    
    if !video_choice!==1 (
       echo Installing, please wait...
       winget install OBSProject.OBSStudio --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force 
       goto finish
    ) else if !video_choice!==2 (
       echo Installing, please wait...
       winget install Bandicam.Bandicam --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    )
) else if "%choice%"=="8" (
    echo Screenshoters
    echo ========================================
    echo 1. ShareX
    echo 2. Flameshot
    echo 3. Lightshot
    echo ========================================
    
    set /p screenshot_choice=Enter your choice: 
    
    if !screenshot_choice!==1 (
        echo Installing, please wait...
        winget install ShareX.ShareX --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
        goto finish
    ) else if !screenshot_choice!==2 (
        echo Installing, please wait...
        winget install flameshot.Flameshot --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
        goto finish
    ) else if !screenshot_choice!==3 (
        echo Installing, please wait...
        winget install Skillbrains.Lightshot --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
        goto finish
    )
) else if "%choice%"=="9" (
    echo Torrent Client
    echo ===========================
    echo 1. Qbittorrent
    echo ===========================
    
    set /p torrent_choice=Enter your choice: 
    
    if !torrent_choice!==1 (
       echo Installing, please wait...
       winget install qBittorrent.qBittorrent --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force
       goto finish
    )
)

:finish
echo Done. Press any key to exit...
pause >nul
