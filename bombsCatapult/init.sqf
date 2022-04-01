/*
	Bomb's custom catapult launcher
	Used Vehicle Service Point by Axe Cop for examples of adding action near object
*/
diag_log "Bomb's Catapult: loading config...";

// general settings
local _catapultPlatformClasses = ["Land_LHD_6"];
local _maxDistance = 20;
local _cycleTime = 5; 
local _lastVehicle = objNull;

catapult_action = -1;

local _fnc_removeActions = {
	if (isNull _lastVehicle) exitWith {};
	_lastVehicle removeAction catapult_action;
	catapult_action = -1;
	_lastVehicle = objNull;
};

while {true} do {
	local _vehicle = vehicle player;
	if ((_vehicle isKindOf "Plane") && (assignedDriver _vehicle == player)) then {
		local _catapults = (nearestObjects [getPos _vehicle,_catapultPlatformClasses,_maxDistance]) - [_vehicle];
		if (count _catapults > 0) then {
			if ((_vehicle != _lastVehicle) || !(isEngineOn _vehicle) || (speed _vehicle > 2)) then {
				call _fnc_removeActions;
			};
			
			if (catapult_action < 0) then {
				catapult_action = _vehicle addAction ["Engage Catapult","scripts\bombsCatapult\catapult.sqf",[],-1,false,true,"","(isEngineOn vehicle player) && (speed vehicle player < 2)"];
			};
			_lastVehicle = _vehicle;
		} else {
			call _fnc_removeActions;
		};
	} else {
		call _fnc_removeActions;
	};
	uiSleep _cycleTime;
};
