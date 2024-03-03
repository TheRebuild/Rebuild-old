@echo off 

FLTMC >NUL 2>&1 || PowerShell Start-Process -FilePath '%0' -Verb RunAs >NUL 2>&1 && EXIT /b
FLTMC >NUL 2>&1 && GoTo OSC
echo Run this program with administrative privileges!
pause
exit
:OSC

winget settings --enable InstallerHashOverride >NUL 2>&1

echo Text and IDE
echo ========================================
echo 1. Visual Studio (+ Code)
echo 2. JetBrains
echo 3. Sublime Text
echo 4. Vim
echo 5. Notepad++
echo ========================================

set /p choice="Enter your choice: "

if "%choice%"=="1" (
   echo ===================================
   echo 1. Visual Studio Code
   echo 2. Visual Studio Code Insiders
   echo 3. Visual Studio Community 2022
   echo 4. Visual Studio Community 2019
   echo 5. Visual Studio Professional 2022
   echo 6. Visual Studio Professional 2019
   echo ===================================

   set /p choice="Enter your choice: "

   if "%choice%"=="1" (
      winget install Microsoft.VisualStudioCode --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="2" (
      winget install Microsoft.VisualStudioCode.Insiders --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="3" (
      winget install Microsoft.VisualStudio.2022.Community --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="4" (
      winget install Microsoft.VisualStudio.2019.Community --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="5" (
      winget install Microsoft.VisualStudio.2022.Professional --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="6" (
      winget install Microsoft.VisualStudio.2019.Professional --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   )
) else if "%choice%"=="2" (
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

   set /p choice="Enter your choice: "

   if "%choice%"=="1" (
      winget install JetBrains.PyCharm.Community --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="2" (
      winget install JetBrains.PyCharm.Professional --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="3" (
      winget install JetBrains.CLion --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="4" (
      winget install Jetbrains.WebStorm --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1 
      goto finish
   ) else if "%choice%"=="5" (
      winget install JetBrains.IntelliJIDEA.Ultimate --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="6" (
      winget install JetBrains.IntelliJIDEA.Community --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="7" (
      winget install JetBrains.WebStorm --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="8" (
      winget install JetBrains.GoLand --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   )
) else if "%choice%"=="3" (
   echo ===================================
   echo 1. Sublime Text 4
   echo 2. Sublime Text 3
   echo 3. Sublime Merge
   echo ===================================
   
   set /p choice ="Enter your choice: "

   if "%choice%"=="1" (
      winget install SublimeHQ.SublimeText.4 --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="2" (
      winget install SublimeHQ.SublimeText.3 --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   ) else if "%choice%"=="3" (
      winget install SublimeHQ.SublimeMerge --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
      goto finish
   )
) else if "%choice%"=="4" (
   winget install vim.vim --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
)
else if "%choice%"=="5" (
   winget install Notepad++.Notepad++ --silent --ignore-security-hash --accept-package-agreements --accept-source-agreements --force >NUL 2>&1
   goto finish
) else (
   
)


:finish
echo Done. Press any key to exit...
pause >nul
