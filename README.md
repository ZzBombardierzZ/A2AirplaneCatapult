# A2AirplaneCatapult
A simple airplane and jet catapult launching script. Default usage is for an aircraft carrier but who's stopping you from using it anywhere else.

## Video Example
[Video of the script in action](https://www.youtube.com/watch?v=Gc_7P8s7VP4)

## Install instructions
1. Clone this repo or press [ME](https://github.com/ZzBombardierzZ/A2AirplaneCatapult/archive/refs/heads/main.zip)
2. Copy the bombsCatapult folder into your MPMissions\DayZ_Epoch_11.Chernarus\scripts\ folder.
3. In DayZ_Epoch_11.Chernarus\init.sqf, add `execVM "scripts\bombsCatapult\init.sqf";` under the last `if (!isDedicated) then {`. You can also search for `execVM "\z\addons\dayz_code\system\antihack.sqf";` and add it above there.
4. You're all set!

## Config
To edit the config, open `bombsCatapult\init.sqf` and see the 3 lines below "`//General Settings`"
- `_catapultPlatformClasses` is used to change what objects you have to be near to launch.
- `_maxDistance` is the maximum distance you can be to the object to have the option to launch.
- `_cycleTime` is how frequently the script checks for the nearby object. Setting this too low will decrease performance on the client.
- Do not edit `_lastVehicle`

### Don't have an aircraft carrier? It's easy!
1. Unpack your dayz_server.pbo
2. Go to init\server_functions.sqf
3. Under `call compile preprocessFileLineNumbers "\z\addons\dayz_code\loot\init.sqf";` add `[] execVM "z\addons\dayz_server\mapAddons\AircraftCarrier.sqf";`
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

#### Notes
Feel free to edit anything to your desire. I don't remember where I got the AircraftCarrier.sqf script from, but I do not claim credit for that part.
