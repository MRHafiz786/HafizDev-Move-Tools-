@echo off
title HafizDev File Mover - Professional Edition
setlocal EnableDelayedExpansion

:: =============================================
:: HAFIZDEV FILE MOVER - PROFESSIONAL EDITION
:: =============================================
:: Version 3.0 - Fixed ASCII Characters
:: =============================================

:: Check for quick mode
set "QUICK_MODE=0"
if "%1"=="--quick" set "QUICK_MODE=1"

:: Set console - Larger for animations, smaller for quick mode
if "%QUICK_MODE%"=="1" (
    mode con: cols=80 lines=25
) else (
    mode con: cols=90 lines=30
)
color 0A

:: Make sure script runs from its own folder
cd /d "%~dp0"

:: Check if find command is available
where find >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] System 'find' command not available
    echo Please check your system PATH
    pause
    exit /b 1
)

:: =============================================
:: Load configuration
:: =============================================
set "CONFIG_FILE=EDIT PATHS.txt"

if not exist "%CONFIG_FILE%" (
    cls
    color 0C
    echo.
    echo ==================================================
    echo              CONFIGURATION FILE MISSING
    echo ==================================================
    echo.
    echo ERROR: %CONFIG_FILE% not found!
    echo.
    echo Creating default configuration file...
    echo SOURCE=C:\Users\%USERNAME%\Desktop\New folder > "%CONFIG_FILE%"
    echo DESTINATION=D:\New folder >> "%CONFIG_FILE%"
    echo.
    echo Default configuration created.
    echo Please edit %CONFIG_FILE% to set your paths.
    echo.
    pause
    exit /b 1
)

:: Read config
set "SOURCE="
set "DESTINATION="

for /f "usebackq tokens=1,* delims==" %%A in ("%CONFIG_FILE%") do (
    if /i "%%A"=="SOURCE" set "SOURCE=%%B"
    if /i "%%A"=="DESTINATION" set "DESTINATION=%%B"
)

:: Validate paths
if not defined SOURCE (
    cls
    color 0C
    echo.
    echo ==================================================
    echo                    CONFIG ERROR
    echo ==================================================
    echo.
    echo SOURCE path not defined in %CONFIG_FILE%
    echo.
    echo Please add: SOURCE=C:\Your\Path
    echo.
    pause
    exit /b 1
)

if not defined DESTINATION (
    cls
    color 0C
    echo.
    echo ==================================================
    echo                    CONFIG ERROR
    echo ==================================================
    echo.
    echo DESTINATION path not defined in %CONFIG_FILE%
    echo.
    echo Please add: DESTINATION=D:\Your\Path
    echo.
    pause
    exit /b 1
)

:: Validate source exists
if not exist "%SOURCE%" (
    cls
    color 0C
    echo.
    echo ==================================================
    echo                  SOURCE NOT FOUND
    echo ==================================================
    echo.
    echo Source folder does not exist:
    echo %SOURCE%
    echo.
    pause
    exit /b 1
)

:: Create destination if needed
if not exist "%DESTINATION%" (
    if "%QUICK_MODE%"=="1" (
        echo Creating destination folder...
        mkdir "%DESTINATION%" 2>nul
    ) else (
        cls
        color 0E
        echo.
        echo ==================================================
        echo              CREATING DESTINATION
        echo ==================================================
        echo.
        echo Destination folder not found.
        echo Creating: %DESTINATION%
        echo.
        mkdir "%DESTINATION%" 2>nul
    )
    
    if !errorlevel! neq 0 (
        color 0C
        echo ERROR: Failed to create destination folder.
        pause
        exit /b 1
    )
    
    if "%QUICK_MODE%"=="0" (
        echo Destination created successfully.
        timeout /t 2 /nobreak >nul
    )
)

:: =============================================
:: Count files
:: =============================================
if "%QUICK_MODE%"=="0" (
    cls
    color 0F
    echo.
    echo ==================================================
    echo             HAFIZDEV FILE MOVER v3.0
    echo ==================================================
    echo.
    echo [SYSTEM] Scanning folders...
    echo.
)

set "FILE_COUNT=0"
set "FOLDER_COUNT=0"

:: Count files using dir with proper error handling
for /f %%a in ('dir "%SOURCE%" /a-d /b 2^>nul ^| find /c /v ""') do set "FILE_COUNT=%%a"
for /f %%a in ('dir "%SOURCE%" /ad /b 2^>nul ^| find /c /v ""') do set "FOLDER_COUNT=%%a"

:: Count files in subfolders
if exist "%SOURCE%\*" (
    for /f %%a in ('dir "%SOURCE%" /a-d /b /s 2^>nul ^| find /c /v ""') do set "TOTAL_FILES=%%a"
) else (
    set "TOTAL_FILES=%FILE_COUNT%"
)

:: =============================================
:: Display summary
:: =============================================
if "%QUICK_MODE%"=="1" (
    echo.
    echo ================================================
    echo HAFIZDEV FILE MOVER - QUICK MODE
    echo ================================================
    echo SOURCE: %SOURCE%
    echo DEST:   %DESTINATION%
    echo FILES:  %FILE_COUNT%  |  FOLDERS: %FOLDER_COUNT%
    echo ================================================
    echo.
) else (
    cls
    color 0F
    echo.
    echo ==================================================
    echo             HAFIZDEV FILE MOVER v3.0
    echo ==================================================
    echo.
    echo [SOURCE]      : %SOURCE%
    echo [DESTINATION] : %DESTINATION%
    echo [MODE]        : %1
    echo.
    echo ==================================================
    echo                SCAN RESULTS
    echo ==================================================
    echo.
    echo  Files found     : %FILE_COUNT%
    echo  Folders found   : %FOLDER_COUNT%
    echo  Total items     : %TOTAL_FILES%
    echo.
    echo ==================================================
    echo.
)

:: Check if folder is empty
if "%FILE_COUNT%"=="0" if "%FOLDER_COUNT%"=="0" (
    if "%QUICK_MODE%"=="1" (
        echo [WARNING] Source folder is empty.
        set /p "confirm=Continue? (Y/N): "
    ) else (
        color 0E
        echo [WARNING] Source folder is empty.
        echo.
        set /p "confirm=Continue anyway? (Y/N): "
    )
    
    if /i not "!confirm!"=="Y" (
        echo.
        echo Operation cancelled.
        pause
        exit /b 0
    )
) else (
    if "%QUICK_MODE%"=="1" (
        set /p "confirm=Proceed? (Y/N): "
    ) else (
        set /p "confirm=Proceed with file movement? (Y/N): "
    )
    
    if /i not "!confirm!"=="Y" (
        echo.
        echo Operation cancelled.
        pause
        exit /b 0
    )
)

:: =============================================
:: Moving files
:: =============================================
if "%QUICK_MODE%"=="1" (
    echo.
    echo Transferring files...
    echo.
    robocopy "%SOURCE%" "%DESTINATION%" /E /MOVE /R:3 /W:5 /NP >nul 2>&1
) else (
    cls
    color 0A
    echo.
    echo ==================================================
    echo              MOVING FILES...
    echo ==================================================
    echo.

    :: Animated progress (only in full mode)
    for /l %%i in (1,1,2) do (
        cls
        echo.
        echo ==================================================
        echo              MOVING FILES...
        echo ==================================================
        echo.
        echo  [=====               ] 25%%
        timeout /t 1 /nobreak >nul
        cls
        echo.
        echo ==================================================
        echo              MOVING FILES...
        echo ==================================================
        echo.
        echo  [==========          ] 50%%
        timeout /t 1 /nobreak >nul
        cls
        echo.
        echo ==================================================
        echo              MOVING FILES...
        echo ==================================================
        echo.
        echo  [===============     ] 75%%
        timeout /t 1 /nobreak >nul
    )
    
    robocopy "%SOURCE%" "%DESTINATION%" /E /MOVE /R:3 /W:5 /NP /NDL /NFL /NJH >nul 2>&1
)

set "ROBOCOPY_LEVEL=%errorlevel%"

:: =============================================
:: Show results
:: =============================================
if "%QUICK_MODE%"=="1" (
    echo.
    echo ================================================
    echo                 TRANSFER COMPLETE
    echo ================================================
) else (
    cls
    echo.
    echo ==================================================
    echo                 OPERATION COMPLETE
    echo ==================================================
)

echo.

if %ROBOCOPY_LEVEL% geq 8 (
    color 0C
    echo [ERROR] Transfer failed with code: %ROBOCOPY_LEVEL%
    echo [ERROR] Check permissions and try again.
) else if %ROBOCOPY_LEVEL% geq 4 (
    color 0E
    echo [WARNING] Partial success - Code: %ROBOCOPY_LEVEL%
    echo [WARNING] Some files may not have moved.
) else if %ROBOCOPY_LEVEL% geq 1 (
    color 0A
    echo [SUCCESS] Files moved successfully!
    if "%QUICK_MODE%"=="0" (
        echo.
        echo Files transferred: %FILE_COUNT%
        echo Folders moved: %FOLDER_COUNT%
    )
) else (
    color 0E
    echo [INFO] No files were moved.
)

echo.
echo ==================================================
if "%QUICK_MODE%"=="0" (
    echo.
    echo Source: %SOURCE%
    echo Destination: %DESTINATION%
    echo.
    echo ==================================================
)
echo.
echo Press any key to exit...
pause >nul
exit /b 0