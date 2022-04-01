//written by bomb

local _seconds = 5;
systemchat "Clear for Take Off. Begin accelerating!";
sleep 1;
systemchat "Launching in...";
while {_seconds > 0} do {systemchat format ["%1",_seconds]; sleep 1; _seconds = _seconds - 1;};
local _vehicle = vehicle player;
if ((_vehicle == player) || !(_vehicle isKindOf "Plane")) then {
	systemchat "You got out of the aircraft... Catapult cancelled.";
} else {
	if (!isEngineOn _vehicle) then {
		systemchat "Engine needs to be on. Catapult failed.";
	} else {
		local _vel = velocity _vehicle;
		local _dir = direction _vehicle;
		local _speed = 10;
		systemchat "Catapult engaged!";
		while {speed _vehicle < 180} do {
			_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
			];
			_speed = _speed + 5;
			sleep 0.1;
		};
	};
};