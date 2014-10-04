The Half-Life Dedicated Server Update Tool or HLDSUpdateTool was a tool to update GoldSrc and Source dedicated servers.
Use SteamCMD instead.

With this script in batch you can easily update any dedicated Valve server that use HldsUpdatetool.

### Installing
- First of all, you must be installed HldsUpdateTool.
- You can get it from here
	http://storefront.steampowered.com/download/hldsupdatetool.exe
- Save the path of the installation (no installer) of the file hldsupdatetool.exe
- Example: C:\Program Files (x86)\Valve\HldsUpdateTool

### Set up
- Unzip
- Make a folder for the server files
- Open with Notepad o another text editor the file HldsManagement.cmd
- Edit each path of each game 'hldsdir' is the path of the HldsUpdateTool.exe file
- The other directories are path to the server folder
- Example: set tf2dir="C:\Program Files (x86)\Steam\SteamApps\user\tf2 server"

### Usage
- Open HldsManagement.cmd
- Type a number of the menu and press Enter
- For cancel an update press Ctrl + C