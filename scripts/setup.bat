@echo off
setlocal

:: Get the root directory of the Git project
for /f "delims=" %%i in ('git rev-parse --show-toplevel') do set "PROJECT_DIR=%%i"

:: Initialize/Update conda environment
conda env create -f "%PROJECT_DIR%\environment.yml" || conda env update -f "%PROJECT_DIR%\environment.yml"

endlocal
