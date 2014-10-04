@echo off
::Config
set version=1.0
::Script
:start
cls
title VPK Context Menu - v%version%
echo.
echo Hi %username%. What do you want to do?
echo ---------------------------------
echo 1. Add the VPK context menu
echo 2. Remove the VPK context menu
echo.
echo 9. Exit
echo.
set /p do=
if "%do%"=="1" goto add
if "%do%"=="2" goto remove
if "%do%"=="9" exit
goto start
:add
cls
REG add "HKCR\Directory\shell\Create VPK\command" /d "\"C:\Program Files (x86)\Steam\SteamApps\common\Team Fortress 2\\bin\\vpk.exe\" \"%%1\""
pause
goto start
:remove
cls
REG delete "HKCR\Directory\shell\Create VPK"
pause
goto start