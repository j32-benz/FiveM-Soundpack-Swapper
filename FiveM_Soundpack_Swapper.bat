@echo off
setlocal enabledelayedexpansion

REM Set the target path
set "TARGET_PATH=G:\SteamLibrary\steamapps\common\Grand Theft Auto V\x64\audio\sfx"

REM Initialize counter
set "COUNT=0"

REM List all directories and assign a number to each, excluding .git
for /d %%D in (*) do (
    if /I not "%%D"==".git" (
        set /a COUNT+=1
        set "DIR[!COUNT!]=%%D"
    )
)

if %COUNT%==0 (
    echo No directories found to choose from.
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b
)

echo Available directories:
for /L %%I in (1,1,%COUNT%) do (
    echo %%I - !DIR[%%I]!
)

REM Prompt the user to choose a directory
echo.
set /p "CHOICE=Please enter the number corresponding to the directory you want to copy: "

REM Validate the user input (ensure it's numeric and within range)
for /F "delims=0123456789" %%C in ("%CHOICE%") do (
    set "CHOICE="
)

if "%CHOICE%"=="" (
    echo Invalid input. Please enter a valid number.
    pause >nul
    exit /b
)

if %CHOICE% lss 1 (
    echo Invalid choice. Please run the script again and select a valid number.
    pause >nul
    exit /b
)

if %CHOICE% gtr %COUNT% (
    echo Invalid choice. Please run the script again and select a valid number.
    pause >nul
    exit /b
)

set "SELECTED_DIR=!DIR[%CHOICE%]!"

echo.
echo You have selected "%SELECTED_DIR%".
echo.

REM Check for the presence of RESIDENT.rpf and WEAPONS_PLAYER.rpf
set "missing=0"
if not exist "%SELECTED_DIR%\RESIDENT.rpf" (
    echo Error: RESIDENT.rpf not found in the selected directory.
    set "missing=1"
)

if not exist "%SELECTED_DIR%\WEAPONS_PLAYER.rpf" (
    echo Error: WEAPONS_PLAYER.rpf not found in the selected directory.
    set "missing=1"
)

if %missing%==1 (
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b
)

REM Copy the contents of the selected directory to the target path, excluding .gitkeep files
robocopy "%SELECTED_DIR%" "%TARGET_PATH%" /E /XF .gitkeep /R:0 /W:0 /NDL /NFL /NJH >nul 2>&1
if %errorlevel% lss 8 (
    echo Soundpack copied successfully!
) else (
    echo Error copying files.
)

echo.
echo Press any key to exit...
pause >nul
