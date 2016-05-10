// This seems to be one of the random tasks.

private ["_start","_nul","_type","_veh","_dest"];

_start = [getposATL player, 2500,1000,"(1 - trees) *(1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
while {surfaceiswater _start || {!(_start CALL SAOKINMAP)}} do {
	sleep 2;
	_start = [getposATL player, 2500,1000,"(1 - trees) *(1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
};
BaseR globalchat localize "STR_Sp2s1r1";
sleep 10;
player sidechat localize "STR_Sp2s1r2";
[player,player, "PlaV","V37"]SPAWN SAOKKBTELL;

[
	WEST, // Task owner(s)
	"taskBT", // Task ID (used when setting task state, destination or description later)
	["AAF support truck have broken down and need to be fixed and returned to friendly camp.", "Fix and Return Supply Truck", "Fix and Return Supply Truck"], // Task description
	objnull,			// Task destination
	true,			// true to set task as current upon creation
	-1,				// priority
	true,			// Notification?
	"Defend",		// 3d marker type
	false			// Shared?
] call BIS_fnc_taskCreate;

[
	WEST, // Task owner(s)
	["taskBT1","taskBT"], // Task ID (used when setting task state, destination or description later)
	["Fix the broken truck located here.", "Fix Supply Truck", "Fix Supply Truck"], // Task description
	_start,			// Task destination
	true,			// true to set task as current upon creation
	-1,				// priority
	true,			// Notification?
	"Interact",		// 3d marker type
	false			// Shared?
] call BIS_fnc_taskCreate;

// Now I'm waiting to arrive to the location of the broken supply truck
waitUntil {sleep 6; vehicle player distance _start < 800};
_type = ((ARMEDSUPPORT select 2) call RETURNRANDOM);
_veh = createVehicle [_type, _start, [], 0, "NONE"];
_veh setdir (random 360);
_veh setvariable ["AmCrate",1];
_veh setHit [getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> "HitLFWheel" >> "name"), 1];
_veh setHit [getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> "HitEngine" >> "name"), 1];
waitUntil {sleep 6; isNull _veh || {!alive _veh} || {canMove _veh}};

if !(isNull _veh || {!alive _veh}) then {
	player sidechat localize "STR_Sp2s1r3";
	_dest = (locationposition (["ColorBlue"] CALL NEARESTCAMP));
	[
		WEST, // Task owner(s)
		["taskBT2","taskBT"], // Task ID (used when setting task state, destination or description later)
		["Return the truck here.", "Return Supply Truck", "Return Supply Truck"], // Task description
		_dest,			// Task destination
		true,			// true to set task as current upon creation
		-1,				// priority
		true,			// Notification?
		"Move",			// 3d marker type
		false			// Shared?
	] call BIS_fnc_taskCreate;

	"You can return the truck to any current friendly camp or capture an enemy camp and bring the truck there" SPAWN HINTSAOK;
	waitUntil {sleep 6; isNull _veh || !alive _veh || vehicle player distance (locationposition (["ColorBlue"] CALL NEARESTCAMP)) < 50};

	if !(isNull _veh || !alive _veh) then {
		pisteet = pisteet + 200;
		_nul = [200, "Supply Truck Returned"] SPAWN PRESTIGECHANGE;
		_nul = ["taskBT","SUCCEEDED",true] call BIS_fnc_taskSetState;
		BaseR globalchat localize "STR_Sp2s1r4";
	} else {
		_nul = ["taskBT","FAILED",true] call BIS_fnc_taskSetState;
	};

} else {
	_nul = ["taskBT","FAILED",true] call BIS_fnc_taskSetState;
};
CARS = CARS + [_veh];
_veh setvariable ["AmCrate",nil];
