:: //--------------------------------------------------------------------//
:: Those are the paths to edit.
:: Example:
:: set tf2dir="C:\Program Files (x86)\Steam\SteamApps\user\tf2 server folder"
:: Rememver remove the double colons
:: //--------------------------------------------------------------------//
set hldsdir="C:\Program Files (x86)\Valve\HLServer"
set tf2dir="C:\Program Files (x86)\Steam\SteamApps\heart_rj\TF2 Server"
::set cssdir="css server path"
::set asdir="alien swarm server path"
::set hl2mpdir="hl2mp server path"
::set dodsdir="dods server path"
::set l4d2dir="l4d2 server path"
::set gmoddir="gmod server path"
:: //--------------------------------------------------------------------//
:: Available languages 'english', and 'spanish'
set lang=english
:: //--------------------------------------------------------------------//
if not exist lang.bat goto needlang else goto call
:call
call lang.bat
:start
title HLDSManagement %version%
cd %hldsdir%
cls
if %errorlevel% == 1 (goto error) else (goto menu)
:error
cls
color 04
title HLDSManagement %version% - %lang_error%
echo 
echo %lang_error_folder%
Pause>Nul
color 08
goto call
:menu
cls
echo.
title HLDSManagement %version%
echo %lang_welcome%
echo ---------------------------------
echo 1. %lang_menu_do1%
echo 2. %lang_menu_do2%
echo 3. %lang_menu_do3%
echo.
echo 9. %lang_exit%
echo.
set /p do=
if "%do%"=="1" goto serverlaunch
if "%do%"=="2" goto serverupdate
if "%do%"=="3" goto settings
if "%do%"=="8" goto backmainmenu
if "%do%"=="9" exit
if "%do%"=="help" start %web%
if "%do%"=="^?" start %web%
goto menu
:serverlaunch
cls
echo.
title HLDSManagement %version% - %lang_serverlaunch_title%
echo %lang_serverlaunch%
echo ---------------------------------
echo 1. Team Fortress 2
echo 2. Counter-Strike: Source
echo 3. Alien Swarm
echo 4. Half-Life 2: Deathmatch
echo 5. Day of Defeat: Source
echo 6. Left 4 Dead 2
echo 7. Garry's Mod
echo.
echo 8. ^< %lang_goback%
echo 9. %lang_exit%
echo.
set /p game=
if %game%==1 set orangedir=%tf2dir% & goto orangebox
if %game%==2 goto css
if %game%==3 set launchdir=%asdir%
if %game%==4 set launchdir=%hl2mp%
if %game%==5 set launchdir=%dods%
if %game%==6 goto l4d2
if %game%==7 set orangedir=%gmoddir% & goto orangebox
if %game%==8 goto menu
if %game%==9 exit
goto serverlaunch
:serverupdate
cls
echo.
title HLDSManagement %version% - %lang_serverupdate_title%
echo %lang_serverupdate%
echo ---------------------------------
echo 1. Team Fortress 2
echo 2. Counter-Strike: Source
echo 3. Alien Swarm
echo 4. Half-Life 2: Deathmatch
echo 5. Day of Defeat: Source
echo 6. Left 4 Dead 2
echo 7. Garry's Mod
echo.
echo 8. ^< %lang_goback%
echo 9. %lang_exit%
echo.
set /p game2=
if %game2%==1 set updatedir=%tf2dir% & set mod=tf & goto globalupdate
if %game2%==2 set updatedir=%cssdir% & set mod="Counter-Strike Source" & goto globalupdate
if %game2%==3 set updatedir=%asdir% & set mod=alienswarm & goto globalupdate
if %game2%==4 set updatedir=%hl2mpdir% & set mod=hl2mp & goto globalupdate
if %game2%==5 set updatedir=%dodsdir% & set mod=dods & goto globalupdate
if %game2%==6 set updatedir=%l4d2dir% & set mod=left4dead2 & goto globalupdate
if %game2%==7 set updatedir=%gmoddir% & set mod=garrysmod & goto globalupdate
if %game2%==8 goto menu
if %game2%==9 exit
goto serverupdate
:globallaunch
cls
cd %launchdir%
if %errorlevel% == 1 (goto error) else (start srcds.exe)
exit
:orangebox
cls
cd "%orangedir%/orangebox"
if %errorlevel% == 1 (goto error) else (start srcds.exe)
exit
:css
cls
cd "%cssdir%/css"
if %errorlevel% == 1 (goto error) else (start srcds.exe)
exit
:l4d2
cls
cd "%l4d2dir%/left4dead2"
if %errorlevel% == 1 (goto error) else (start srcds.exe)
exit
:globalupdate
cls
echo.
title HLDSManagement %version% - %lang_serverupdate_updating%
echo %lang_serverupdate_path%
echo %updatedir%
echo.
echo %lang_serverupdate_updating%
echo.
hldsupdatetool -command update -game %mod% -dir %updatedir%
goto updated
:errorsettings
cls
color 04
title HLDSManagement %version% - %lang_error%
echo 
echo %lang_errorsettings%
Pause>Nul
color 08
:settings
cls
echo.
title HLDSManagement %version% - %lang_config_title%
echo %lang_config_game%
echo ---------------------------------
echo 1. Team Fortress 2
echo 2. Counter-Strike: Source
echo 3. Alien Swarm
echo 4. Half-Life 2: Deathmatch
echo 5. Day of Defeat: Source
echo 6. Left 4 Dead 2
echo 7. Garry's Mod
echo.
echo 8. ^< %lang_goback%
echo 9. %lang_exit%
echo.
set /p gamesettings=
if %gamesettings%==1 cd %tf2dir%/orangebox/tf/
if %gamesettings%==2 cd %cssdir%/css/cstrike
if %gamesettings%==3 cd %asdir%/swarm
if %gamesettings%==4 cd %hl2mpdir%/hl2mp
if %gamesettings%==5 cd %dodsdir%/dod
if %gamesettings%==6 cd %l4d2dir%/left4dead2
if %gamesettings%==7 cd %gmoddir%/orangebox/garrysmod
if %gamesettings%==8 goto menu
if %gamesettings%==9 exit
goto globalconfig
:globalconfig
cls
echo.
title HLDSManagement %version% - %lang_config_title%
echo %lang_config_do%
echo ---------------------------------
echo 1. %lang_config_settings1%
echo 2. %lang_config_settings2%
echo 3. %lang_config_settings3%
echo 4. %lang_config_settings4%
echo.
echo 8. ^< %lang_goback%
echo 9. %lang_exit%
echo.
set /p settings=
if %settings%==1 explorer .
if %settings%==2 notepad cfg\server.cfg
if %settings%==3 cd addons\sourcemod\plugins & cls & echo %lang_config_plugins% & echo. & dir /P /B & pause>nul
if %settings%==4 goto admin
if %settings%==8 goto settings
if %settings%==9 exit
goto globalconfig
:admin
cd addons\sourcemod\configs
title HLDSManagement %version% - %lang_config_settings4%
cls
echo.
echo %lang_admin_do%
echo ---------------------------------
echo 1. admins.cfg
echo 2. admins_simple.ini
echo.
echo 8. ^< %lang_goback%
set /p admin=
if %admin%==1 notepad admins.cfg
if %admin%==2 notepad admins_simple.ini
if %admin%==8 goto globalconfig
goto admin
:updated
echo --------------------------------------------------------------
echo 
echo %lang_serverupdate_end%
Pause>Nul
:updatemenu
cls
echo.
title HLDSManagement %version%
echo %lang_config_do%
echo ---------------------------------
echo 1. %lang_end1%
echo 2. %lang_end2%
echo 3. %lang_menu_do3%
echo.
echo 9. %lang_exit%
echo.
set /p end=
if "%end%"=="1" goto serverlaunch
if "%end%"=="2" goto serverupdate
if "%end%"=="3" goto settings
if "%end%"=="9" exit
goto updatemenu
:needlang
cls
color 04
title HLDSManagement v1.6 - Error
echo 
echo This script needs the file lang.bat!
Pause>Nul
color 08
exit