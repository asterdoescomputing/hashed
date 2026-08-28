@echo off
title Registry Hive Backup Tool

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [!] This script requires Administrator privileges.
    echo [i] Please run as Administrator.
    pause
    exit /b 1
)

:: Get the directory where this script is located
set "scriptDir=%~dp0"
cd /d "%scriptDir%"

echo [*] Starting registry hive backup...
echo.

:: Save SAM hive
echo [*] Saving HKLM\SAM...
reg save HKLM\SAM "%scriptDir%sam.save"
if %errorLevel% equ 0 (
    echo [+] SAM hive saved successfully.
) else (
    echo [!] Failed to save SAM hive.
)

:: Save SYSTEM hive
echo [*] Saving HKLM\SYSTEM...
reg save HKLM\SYSTEM "%scriptDir%system.save"
if %errorLevel% equ 0 (
    echo [+] SYSTEM hive saved successfully.
) else (
    echo [!] Failed to save SYSTEM hive.
)

echo.
echo [*] Backup complete!
echo [i] Files saved to: %scriptDir%
echo [i] - sam.save
echo [i] - system.save
echo.

:: List the files in the current directory
dir "%scriptDir%*.save" /b 2>nul

pause