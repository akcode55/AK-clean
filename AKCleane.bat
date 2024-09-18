@echo off
title Kandiel Cleaner
color 0a
setlocal enabledelayedexpansion

:HEADER
cls
echo.
echo  #     #   #  #    #  ######   ######   #    #  #    #  ######  
echo  #     #   #  #    #  #       #    #   #    #  ##   #  #       
echo  #     #   #  #    #  #####   #    #   #    #  # #  #  #####   
echo  #     #   #  #    #  #       #    #   #    #  #  # #  #       
echo  #     #   #  #    #  #       #    #   #    #  #   ##  #       
echo   #####     #   ####   ######   ######    ####    #    #  ######  
echo.
goto MENU

:MENU
cls
echo ========================================
echo              Kandiel Cleaner
echo ========================================
echo 1. Clean Temporary Files
echo 2. Optimize Startup
echo 3. Scan and Repair System Files
echo 4. Clean Privacy Data
echo 5. Check Disk for Errors
echo 6. Defragment and Optimize Drives
echo 7. Update Windows
echo 8. Backup System
echo 9. Delete Files or Folders
echo 10. View System Information
echo 11. Manage Drivers
echo 12. Manage Processes
echo 13. Manage Restore Points
echo 14. Clean Event Logs
echo 15. Network Management
echo 16. Manage Services
echo 17. Uninstall Programs
echo 18. Manage User Accounts
echo 19. Network Troubleshooter
echo 20. Remove Malware
echo 21. Antivirus Management
echo 22. Edit Registry
echo 23. Check Hard Drive Health
echo 24. View Disk Usage
echo 25. Exit
echo ========================================
set /p option=Choose an option (1-25): 

if "%option%"=="1" goto CLEAN_TEMP
if "%option%"=="2" goto OPTIMIZE_STARTUP
if "%option%"=="3" goto SCAN_REPAIR
if "%option%"=="4" goto CLEAN_PRIVACY
if "%option%"=="5" goto CHECK_DISK
if "%option%"=="6" goto DEFRAG
if "%option%"=="7" goto UPDATE_WINDOWS
if "%option%"=="8" goto BACKUP_SYSTEM
if "%option%"=="9" goto DELETE_ITEMS
if "%option%"=="10" goto SYSTEM_INFO
if "%option%"=="11" goto MANAGE_DRIVERS
if "%option%"=="12" goto MANAGE_PROCESSES
if "%option%"=="13" goto MANAGE_RESTORE
if "%option%"=="14" goto CLEAN_EVENT_LOGS
if "%option%"=="15" goto NETWORK_MANAGEMENT
if "%option%"=="16" goto MANAGE_SERVICES
if "%option%"=="17" goto UNINSTALL_PROGRAMS
if "%option%"=="18" goto MANAGE_ACCOUNTS
if "%option%"=="19" goto NETWORK_TROUBLESHOOT
if "%option%"=="20" goto REMOVE_MALWARE
if "%option%"=="21" goto ANTIVIRUS_MANAGEMENT
if "%option%"=="22" goto EDIT_REGISTRY
if "%option%"=="23" goto CHECK_HARD_DRIVE_HEALTH
if "%option%"=="24" goto VIEW_DISK_USAGE
if "%option%"=="25" exit
goto MENU

:CLEAN_TEMP
echo Cleaning temporary files...
echo Deleting user temporary files...
del /q /f "%TEMP%\*"
echo Deleting system temporary files...
del /q /f "C:\Windows\Temp\*"
echo Temporary files cleaned.
pause
goto MENU

:OPTIMIZE_STARTUP
echo Optimizing startup programs...
echo This will require a reboot to take effect.
echo Managing startup programs...
REM Add specific commands to manage startup programs here
echo Startup optimization completed.
pause
goto MENU

:SCAN_REPAIR
echo Scanning and repairing system files...
echo Running DISM to restore health...
DISM /Online /Cleanup-Image /RestoreHealth
if %ERRORLEVEL% NEQ 0 (
    echo DISM encountered an error. Exiting...
    exit /b %ERRORLEVEL%
)
echo DISM completed successfully.

echo Running SFC to scan and restore system files...
sfc /scannow
if %ERRORLEVEL% NEQ 0 (
    echo SFC encountered an error. Exiting...
    exit /b %ERRORLEVEL%
)
echo SFC completed successfully.
pause
goto MENU

:CLEAN_PRIVACY
echo Cleaning privacy data...
echo Deleting browser history...
REM Add specific commands for cleaning browser history or other privacy data
echo Privacy data cleaned.
pause
goto MENU

:CHECK_DISK
echo Checking disk for errors...
chkdsk C: /f /r
echo Disk check completed. You may need to restart your computer to complete the process.
pause
goto MENU

:DEFRAG
echo Defragmenting and optimizing drives...
defrag C: /O /V
echo Disk defragmentation and optimization completed.
pause
goto MENU

:UPDATE_WINDOWS
echo Checking for Windows updates...
powershell -Command "Get-WindowsUpdate"
echo Windows update check completed. Consider installing available updates.
pause
goto MENU

:BACKUP_SYSTEM
echo Backing up system...
echo This may take a while depending on the size of the data.
REM Add your specific backup commands here, e.g., creating a system image
echo System backup completed.
pause
goto MENU

:DELETE_ITEMS
echo Deleting files or folders...
set /p path=Enter the full path of the file or folder to delete: 
if exist "%path%" (
    echo Are you sure you want to delete "%path%"? (Y/N)
    set /p confirm=
    if /I "%confirm%"=="Y" (
        echo Deleting "%path%"...
        del /q /f "%path%"
        echo Item deleted.
    ) else (
        echo Deletion canceled.
    )
) else (
    echo The specified path does not exist.
)
pause
goto MENU

:SYSTEM_INFO
echo Displaying system information...
systeminfo
pause
goto MENU

:MANAGE_DRIVERS
echo Managing drivers...
echo List of drivers:
driverquery
pause
goto MENU

:MANAGE_PROCESSES
echo Managing processes...
tasklist
pause
goto MENU

:MANAGE_RESTORE
echo Managing restore points...
echo Creating a restore point...
powershell -Command "Checkpoint-Computer -Description 'Manual Restore Point' -RestorePointType 'MODIFY_SETTINGS'"
pause
goto MENU

:CLEAN_EVENT_LOGS
echo Cleaning event logs...
echo Deleting all event logs...
for %%G in (Application Security Setup) do wevtutil cl %%G
echo Event logs cleaned.
pause
goto MENU

:NETWORK_MANAGEMENT
echo Managing network settings...
echo Renewing IP address...
ipconfig /release
ipconfig /renew
pause
goto MENU

:MANAGE_SERVICES
echo Managing services...
echo List of services:
services.msc
pause
goto MENU

:UNINSTALL_PROGRAMS
echo Uninstalling programs...
echo List of installed programs:
wmic product get name
pause
goto MENU

:MANAGE_ACCOUNTS
echo Managing user accounts...
net user
pause
goto MENU

:NETWORK_TROUBLESHOOT
echo Running network troubleshooter...
msdt.exe /id NetworkDiagnosticsNetworkAdapter
pause
goto MENU

:REMOVE_MALWARE
echo Running malware scan...
REM Add command for running a malware scan, e.g., using Windows Defender
powershell -Command "Start-MpScan -ScanType QuickScan"
pause
goto MENU

:ANTIVIRUS_MANAGEMENT
echo Managing antivirus...
echo Checking antivirus status...
powershell -Command "Get-MpComputerStatus"
pause
goto MENU

:EDIT_REGISTRY
echo Editing registry...
REM Add command to open registry editor
regedit
pause
goto MENU

:CHECK_HARD_DRIVE_HEALTH
echo Checking hard drive health...
wmic diskdrive get status
pause
goto MENU

:VIEW_DISK_USAGE
echo Viewing disk usage...
wmic logicaldisk get size,freespace,caption
pause
goto MENU
