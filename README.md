# A2AirplaneCatapult
A simple airplane and jet catapult launching script. Default usage is for an aircraft carrier but who's stopping you from using it anywhere else.

## Install instructions
1. Download this repo
2. Copy the bombsCatapult folder into your MPMissions\DayZ_Epoch_11.Chernarus\scripts\ folder.
3. In DayZ_Epoch_11.Chernarus\init.sqf, add `execVM "scripts\bombsCatapult\init.sqf";` under the last `if (!isDedicated) then {`. You can also search for `execVM "\z\addons\dayz_code\system\antihack.sqf";` and add it above there.
4. You're all set! If you wish to, you can edit `_catapultPlatformClasses` in the bombsCatapult\init.sqf to include more classnames to launch from.

### Don't have an aircraft carrier? It's easy!
1. Unpack your dayz_server.pbo
2. Go to init\server_functions
3. under `call compile preprocessFileLineNumbers "\z\addons\dayz_code\loot\init.sqf";` add `[] execVM "z\addons\dayz_server\mapAddons\AircraftCarrier.sqf";`
4. Create a folder named `mapAddons` in the root of dayz_server and then create a file named `AircraftCarrier.sqf`
5. Inside AircraftCarrier.sqf, add the following:
```
local _LHDdir = 180; //CHANGE ME IF YOU WISH
local _LHDspawnpoint = [7830,2400,-1]; //CHANGE ME IF YOU WISH
local _ship = 
[
	"Land_LHD_house_1",
	"Land_LHD_house_2",
	"Land_LHD_elev_R",
	"Land_LHD_1",
	"Land_LHD_2",
	"Land_LHD_3",
	"Land_LHD_4",
	"Land_LHD_5",
	"Land_LHD_6"
];
{
	local _part = _x createvehicle _LHDspawnpoint;
	_part setdir _LHDdir;
	_part setpos _LHDspawnpoint;
} foreach _ship;
```
6. Make any changes to the position and direction that you may want.
7. Pack the pbo and it should be good to go.