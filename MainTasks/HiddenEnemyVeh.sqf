// This task is a random task.


private ["_start","_random","_veh2","_unitrate","_classes","_cl","_group","_type","_veh","_nul","_someId"];
_start = [getposATL player,3500,1000,"(1 - houses) * (1 - sea)* (1 - hills)"] CALL SAOKSEEKPOS;
while {surfaceiswater _start || {!(_start CALL SAOKINMAP)}} do {
	sleep 2;
	_start = [getposATL player,3500,1000,"(1 - houses) * (1 - sea)* (1 - hills)"] CALL SAOKSEEKPOS;
};
BaseR globalchat localize "STR_Sp2s1r5";
sleep 10;
player sidechat localize "STR_Sp2s1r6";
[player,player, "PlaV","V37"]SPAWN SAOKKBTELL;
_location = [(_start select 0)+100-(random 200),(_start select 1)+100-(random 200),4];
[
	WEST, // Task owner(s)
	"taskHV", // Task ID (used when setting task state, destination or description later)
	["Camouflated enemy vehicle have been spotted in this area. Find and destroy the vehicle.", "Find and destroy hidden enemy vehicle", "Find and destroy hidden enemy vehicle"], // Task description
	_location,		// Task destination
	true,			// true to set task as current upon creation
	-1,				// priority
	true,			// Notification?
	"Destroy",		// 3d marker type
	false			// Shared?
] call BIS_fnc_taskCreate;
_veh2 = createVehicle ["CamoNet_OPFOR_big_F", _start, [], 0, "NONE"];
_veh2 allowdamage false;

waitUntil {sleep 6; vehicle player distance _start < 1000};
_veh2 allowdamage true;
_unitrate = [6,8];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
_cl = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_cl call RETURNRANDOM);};
_group = [_start, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
//player setpos _start;
Pgroups pushBack _group;
[_group, _start, 100] call bis_fnc_taskPatrol;

_type = ((ARMEDVEHICLES select 1)+(ARMEDTANKS select 1)+(ARMEDAA select 1)) call RETURNRANDOM;
_veh = createVehicle [_type, _start, [], 0, "NONE"];
_veh setdir (random 360);
_veh setvariable ["AmCrate",1];
_veh lock true;
waitUntil {sleep 6; isNull _veh || {!alive _veh}};
pisteet = pisteet + 200;
_nul = [200, "Enemy Vehicle Destroyed"] SPAWN PRESTIGECHANGE;
_nul = ["taskHV","SUCCEEDED",true] call BIS_fnc_taskSetState;
player sidechat localize "STR_Sp2s1r7";
sleep 7;
BaseR globalchat localize "STR_Sp2s1r8";


CARS = CARS + [_veh];
_veh setvariable ["AmCrate",nil];
waitUntil {sleep 10; player distance _start > 1000};
deletevehicle _veh2;
