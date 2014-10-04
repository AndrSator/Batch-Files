@echo off
color 08
set version=v1.10
set autor=RedPill
set web=http://onlinesdk.webege.com/foros
if (%lang%)==() (goto runcmd) else (goto langstart)
:langstart
cls
title HLDSManagement %version% - Language
echo.
echo Choose Language
echo ------------------
echo 1. English
echo 2. Spanish
echo.
echo.
echo Downloads
echo ------------------
echo 3. HLDSUpdateTool
echo 4. Sourcemod
echo 5. Metamod
echo.
echo 6. About
echo.
echo 9. Exit
echo.
set /p lang=
if "%lang%"=="1" goto english
if "%lang%"=="2" goto spanish
if "%lang%"=="3" start http://storefront.steampowered.com/download/hldsupdatetool.exe
if "%lang%"=="4" start http://www.sourcemod.net
if "%lang%"=="5" start http://www.sourcemm.net
if "%lang%"=="6" goto about
if "%lang%"=="9" exit
goto langstart
:about
cls
title HLDSManagement %version% - About
echo.
echo About HLDSManagement
echo.
echo Autor			%autor%
echo Current version		%version%
echo Web site		%web%
echo License			GNU GENERAL PUBLIC LICENSE - Version 3, 29 June 2007
pause>nul
goto langstart
:: //--------English-------------//
:english
set lang_error_folder=It seems that you have not properly configured the path
set lang_goback=Go back
set lang_exit=Exit
set lang_error=Error

set lang_welcome=Hi %username%, What do you want to do?
set lang_menu_do1=Launch a server
set lang_menu_do2=Update a server
set lang_menu_do3=Set up a server

set lang_serverlaunch_title=Launch a server
set lang_serverlaunch=Choose a server to launch

set lang_serverupdate_title=Update a server
set lang_serverupdate=Choose a server to update
set lang_serverupdate_updating=Updating...
set lang_serverupdate_path=Current path:
set lang_serverupdate_end=The server has been updated
set lang_errorsettings=There's not find a path to the server

set lang_notinstalled=is not installed
set lang_notinstalled2=The server is not installed
set lang_sm_notinstalled=Sourcemod is not installed

set lang_config_title=Set up a server
set lang_config_game=Choose a server to set up
set lang_config_do=Choose what do you want to do
set lang_config_settings1=Open directory
set lang_config_settings2=Edit Server.cfg
set lang_config_settings3=See the plugin list
set lang_config_settings4=Edit admins
set lang_config_plugins=Plugin list
set lang_admin_do=Choose a file to edit

set lang_end1=Launch another server
set lang_end2=Update another server
goto start

:: //--------Spanish-------------//
:spanish
set lang_error_folder=Parece que no has configurado correctamente las rutas
set lang_goback=Volver
set lang_exit=Salir
set lang_error=Error

set lang_welcome=Hola %username%, ¨Qu‚ deseas hacer?
set lang_menu_do1=Arrancar un servidor
set lang_menu_do2=Actualizar un servidor
set lang_menu_do3=Configurar servidor

set lang_serverlaunch_title=Arrancar servidor
set lang_serverlaunch=Selecciona el servidor de a arrancar

set lang_serverupdate_title=Actualizar servidor
set lang_serverupdate=Selecciona el servidor de juego a actualizar
set lang_serverupdate_updating=Actualizando...
set lang_serverupdate_path=Ruta actual:
set lang_serverupdate_end=El servidor se ha actualizado
set lang_errorsettings=No se encuentra la ruta al servidor

set lang_notinstalled=no est  instalado
set lang_notinstalled2=El servidor no est  instalado
set lang_sm_notinstalled=Sourcemod no est  instalado

set lang_config_title=Configurar servidor
set lang_config_game=Selecciona el servidor de juego a configurar
set lang_config_do=Selecciona que deseas hacer
set lang_config_settings1=Abrir directorio
set lang_config_settings2=Editar Server.cfg
set lang_config_settings3=Ver plugins
set lang_config_settings4=Editar administradores
set lang_config_plugins=Lista de plugins
set lang_admin_do=Selecciona el archivo a editar

set lang_end1=Arrancar un servidor
set lang_end2=Actualizar otro servidor
goto start

:runcmd
call HLDSManagement.bat
exit