@echo off

REM Start in the folder containing Ost-RAVEN.bat
cd /d "%~dp0"

REM Copy the OSTRICH-generated RVP into the Raven model folder
copy /Y "GrandRiver_BM_HBV.rvp" "Model\GrandRiver_BM_HBV.rvp"

REM Stop if the copy failed
if errorlevel 1 (
    echo ERROR: Could not copy GrandRiver_BM_HBV.rvp into Model folder.
    exit /b 1
)

REM Enter the active Raven model folder
cd Model

REM Run Raven using the files inside Model
Raven.exe GrandRiver_BM_HBV -o output

REM Stop if Raven failed
if errorlevel 1 (
    echo ERROR: Raven simulation failed.
    exit /b 1
)

REM Return to the main OSTRICH folder
cd ..

REM Create the absolute PBIAS file
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0CreateAbsPBIAS.ps1"

REM Stop if the PowerShell script failed
if errorlevel 1 (
    echo ERROR: Absolute PBIAS calculation failed.
    exit /b 1
)

exit /b 0