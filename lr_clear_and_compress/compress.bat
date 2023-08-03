@echo off

rem Usage: script.bat <directory>

set "S_NAME=%cd%"
set "D_NAME=%1"

cd /d "%D_NAME%"
set "ZZ=%programfiles%\7-Zip\7z.exe"

echo Compress "%D_NAME%"
"%ZZ%" a -tzip -mx=9 "%D_NAME%.zip" "%D_NAME%"

cd /d "%S_NAME%"
