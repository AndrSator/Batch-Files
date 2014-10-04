@echo off
set map=FrightYard
set players=6
set admin=admin
set adminpasswd=******
set steamcmdPath="C:\Program Files (x86)\Steam\SteamApps\SteamCMD"
set kfserverPath="C:\KillingFloorServer\"
set mutators="?Mutator=AdminPlus_v3.MutAdminPlus"
:start
set game=""
cls
Title Killing Floor Server
echo.
echo Choose and option
echo ---------------------------------------------------
echo.
echo 1. Run the server
echo 2. Update the server
echo 3. Web Admin
echo.
echo 9. Exit
echo.
set /p game=
if "%game%"=="1" goto gamemode
if "%game%"=="2" goto update
if "%game%"=="3" goto webadmin
if "%game%"=="4" goto help
if "%game%"=="9" exit
goto start
:webadmin
start http://localhost:8075
goto start
:help
start http://www.kf-wiki.com/wiki/Help:Dedicated_servers
goto start
:update
cls
cd %steamcmdPath%
echo.
echo.
echo ---------------------------------------------------
echo.
echo User
set /p user= ^> 
cls
echo.
echo.
echo ---------------------------------------------------
echo.
echo Password
set /p password= ^> 
cls
SteamCmd +login %user% %password% +force_install_dir %kfserverPath% +app_update 215350 validate
cls
goto start
:gamemode
cls
echo.
echo Selet the game mode
echo ---------------------------------------------------
echo.
echo 1. Killing Floor
echo 2. Objective Mode
echo.
echo 9. Back
echo.
set /p gamemode=
if "%gamemode%"=="1" set gametype=KFmod
if "%gamemode%"=="2" set gametype=KFOmod
if "%gamemode%"=="9" goto start
if "%gamemode%"=="" goto gamemode
if "%gametype%"=="KFmod" set gametypeecho=KF
if "%gametype%"=="KFOmod" set gametypeecho=KFO
:diff
cls
echo.
echo Choose the difficulty
echo ---------------------------------------------------
echo.
echo 1. Beginner
echo 2. Normal
echo 3. Hard
echo 4. Suicidal
echo 5. Hell on Earth
echo.
echo 9. Back
echo.
set /p difficultychoose=
if "%difficultychoose%"=="1" set difficulty=1.0
if "%difficultychoose%"=="2" set difficulty=2.0
if "%difficultychoose%"=="3" set difficulty=4.0
if "%difficultychoose%"=="4" set difficulty=5.0
if "%difficultychoose%"=="5" set difficulty=7.0
if "%difficultychoose%"=="9" goto gamemode
if "%difficultychoose%"=="" goto diff
if "%difficulty%"=="1.0" set diffname=Beginner
if "%difficulty%"=="2.0" set diffname=Normal
if "%difficulty%"=="4.0" set diffname=Hard
if "%difficulty%"=="5.0" set diffname=Suicidal
if "%difficulty%"=="7.0" set diffname=Hell on Earth
:run
cls
cd "C:\KillingFloorServer\System"
Title Killing Floor Server - Running Server
echo.
echo The server is running with the follow configuration:
echo ---------------------------------------------------
echo Map		^> %map% (%gametypeecho%)
echo Difficulty	^> %diffname%
echo Players		^> %players%
echo.
ucc server %gametypeecho%-%map%?game=%gametype%.KFGameType?Difficulty=%difficulty%?VACSecured=true?MaxPlayers=%players%%mutators%
goto start
pause