@echo off
title HafizDev File Mover - Professional Launcher
setlocal EnableDelayedExpansion

:: Console Settings - Optimized for all Windows versions
mode con: cols=90 lines=35
color 0B

:: =============================================
:: HAFIZDEV - PROFESSIONAL LAUNCHER
:: =============================================

:: Brand Animation (Fixed ASCII)
cls
for /l %%i in (1,1,20) do (
    cls
    set /a "c=%%i %% 7 + 1"
    color !c!
    
    echo.
    echo.
    echo                      =====================================
    echo                      =                                   =
    echo                      =     H A F I Z D E V               =
    echo                      =     FILE MOVER SYSTEM             =
    echo                      =                                   =
    echo                      =     Version 3.0                   =
    echo                      =     Professional Edition          =
    echo                      =                                   =
    echo                      =     [ LOADING ]                   =
    echo                      =                                   =
    echo                      =====================================
    echo.
    echo.
    
    :: Loading bar
    set /p "=  [" <nul
    for /l %%j in (1,1,%%i) do set /p "=#" <nul
    for /l %%j in (%%i,1,19) do set /p "=." <nul
    echo ]
    
    timeout /t 0.05 /nobreak >nul
)

:: Main Menu - Fixed ASCII (No Unicode)
:main_menu
color 0F
cls
echo.
echo ============================================================================
echo                          HAFIZDEV FILE MOVER v3.0
echo ============================================================================
echo.
echo                                 [ MAIN MENU ]
echo.
echo ----------------------------------------------------------------------------
echo.
echo   [1] START FILE MOVER - Full Experience
echo   [2] QUICK MOVE - Fast Transfer
echo   [3] EDIT CONFIGURATION
echo   [4] SYSTEM DIAGNOSTICS
echo   [5] VIEW DOCUMENTATION
echo   [6] EXIT
echo.
echo ----------------------------------------------------------------------------
echo.
echo   Developer: HafizDev
echo   Professional File Management System
echo.
echo ============================================================================
echo.

:menu_loop
set /p "choice=  ENTER YOUR CHOICE [1-6]: "

if "%choice%"=="1" (
    cls
    echo.
    echo ============================================================================
    echo                           LAUNCHING FULL SYSTEM
    echo ============================================================================
    echo.
    echo   Initializing HafizDev File Mover...
    timeout /t 2 /nobreak >nul
    if exist "SYSTEM.bat" (
        call SYSTEM.bat
    ) else (
        echo   [ERROR] SYSTEM.bat not found!
        echo   Please make sure SYSTEM.bat is in the same folder.
        pause
    )
    goto main_menu
) else if "%choice%"=="2" (
    cls
    echo.
    echo ============================================================================
    echo                           QUICK MOVE MODE
    echo ============================================================================
    echo.
    echo   Starting quick transfer...
    timeout /t 2 /nobreak >nul
    if exist "SYSTEM.bat" (
        call SYSTEM.bat --quick
    ) else (
        echo   [ERROR] SYSTEM.bat not found!
        pause
    )
    goto main_menu
) else if "%choice%"=="3" (
    cls
    echo.
    echo ============================================================================
    echo                         CONFIGURATION EDITOR
    echo ============================================================================
    echo.
    if exist "EDIT PATHS.txt" (
        echo   Opening configuration file...
        timeout /t 1 /nobreak >nul
        start notepad "EDIT PATHS.txt"
    ) else (
        echo   Creating default configuration...
        echo SOURCE=C:\Users\%USERNAME%\Desktop\New folder > "EDIT PATHS.txt"
        echo DESTINATION=D:\New folder >> "EDIT PATHS.txt"
        echo.
        echo   Default configuration created!
        timeout /t 2 /nobreak >nul
        start notepad "EDIT PATHS.txt"
    )
    echo.
    echo   Press any key to return to menu...
    pause >nul
    goto main_menu
) else if "%choice%"=="4" (
    cls
    call :SystemDiagnostics
    echo.
    echo   Press any key to return to menu...
    pause >nul
    goto main_menu
) else if "%choice%"=="5" (
    cls
    call :ShowDocumentation
    echo.
    echo   Press any key to return to menu...
    pause >nul
    goto main_menu
) else if "%choice%"=="6" (
    cls
    color 0E
    echo.
    echo ============================================================================
    echo.
    echo                     THANK YOU FOR USING HAFIZDEV
    echo.
    echo                       Developed with love by HafizDev
    echo.
    echo                         Press any key to exit...
    echo.
    echo ============================================================================
    pause >nul
    exit
) else (
    color 0C
    echo.
    echo   [ERROR] Invalid option! Please try again.
    timeout /t 2 /nobreak >nul
    color 0F
    goto menu_loop
)

:SystemDiagnostics
echo.
echo ============================================================================
echo                         SYSTEM DIAGNOSTICS
echo ============================================================================
echo.
echo   [ SYSTEM INFORMATION ]
echo   ----------------------------------------
echo.
echo   Date    : %date%
echo   Time    : %time%
echo   User    : %username%
echo   Computer: %computername%
echo   OS      : Windows %os%
echo   Processor: %processor_architecture%
echo.
echo   [ PATH VALIDATION ]
echo   ----------------------------------------
echo.
if exist "EDIT PATHS.txt" (
    echo   [OK] Configuration file found
    echo.
    for /f "usebackq tokens=1,* delims==" %%A in ("EDIT PATHS.txt") do (
        if /i "%%A"=="SOURCE" (
            if exist "%%B" (
                echo   [OK] Source path: %%B
            ) else (
                echo   [WARNING] Source path not found: %%B
            )
        )
        if /i "%%A"=="DESTINATION" (
            echo   [INFO] Destination: %%B
        )
    )
) else (
    echo   [ERROR] Configuration file not found!
    echo   [INFO] Will create default on next run
)
echo.
echo ============================================================================
goto :eof

:ShowDocumentation
echo.
echo ============================================================================
echo                         HAFIZDEV DOCUMENTATION
echo ============================================================================
echo.
echo   ========================================================================
echo   |                    FILE MOVER ULTIMATE EDITION v3.0                 |
echo   ========================================================================
echo.
echo   [ OVERVIEW ]
echo   ----------------------------------------
echo   HafizDev File Mover is a professional batch-based
echo   file management system with advanced features.
echo.
echo   [ CONFIGURATION ]
echo   ----------------------------------------
echo   * File: EDIT PATHS.txt
echo   * Format: SOURCE=C:\Your\Path
echo   * Format: DESTINATION=D:\Your\Path
echo   * Example: 
echo     SOURCE=C:\Users\%USERNAME%\Desktop\Files
echo     DESTINATION=D:\Backup\Files
echo.
echo   [ FEATURES ]
echo   ----------------------------------------
echo   * Full file/folder transfer with robocopy
echo   * Professional ASCII interface
echo   * Progress animations
echo   * Error handling and reporting
echo   * System diagnostics
echo   * Quick mode for fast transfers
echo.
echo   [ USAGE MODES ]
echo   ----------------------------------------
echo   * Full Mode  : All animations and effects
echo   * Quick Mode : Fast, minimal output
echo.
echo   [ REQUIREMENTS ]
echo   ----------------------------------------
echo   * Windows XP or later
echo   * Administrator rights (recommended)
echo   * Read/write permissions
echo.
echo   [ TIPS ]
echo   ----------------------------------------
echo   * Run as Administrator for best results
echo   * Use Quick Mode for large transfers
echo   * Check paths before running
echo   * Backup important files first
echo.
echo   [ ERROR CODES ]
echo   ----------------------------------------
echo   * 0-7  : Success/Partial Success
echo   * 8+   : Error - Check permissions
echo.
echo   ========================================================================
echo.
echo                    Developed by HafizDev - All Rights Reserved
echo                           Professional File Management
echo.
echo ============================================================================
goto :eof