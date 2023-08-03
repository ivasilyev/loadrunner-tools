@echo off

rem Usage: script.bat <directory>

set "S_NAME=%cd%"
set "D_NAME=%1"

cd /d "%~dp0"

clear.bat "%D_NAME%"
compress.bat "%D_NAME%"

cd /d "%S_NAME%"
