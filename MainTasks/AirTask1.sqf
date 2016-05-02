private ["_Tid2","_nul","_someId","_cPos","_desTD","_Lna","_headerD","_t","_desT","_header","_n","_random","_Tid","_desc","_time","_uCar","_unitrate","_classes","_group","_dead","_camps","_Tid1"];
_desT = [];
_desTD = [];
_camps = [];
_header = "";
_headerD = "";

{if (getmarkercolor (_x select 0) == "ColorBlue") then {_camps pushback (_x select 0);};} foreach AMBbattles;
if (count _camps == 0) then {

_p = SAOKMAPSIZE * 0.5;
{
_cPos = locationposition _x;
_nearbyVZs = nearestLocations [_cPos,["Name"], 1000];
if ({!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == "ColorRed"}} count _nearbyVZs > 0) then {_camps set [count _camps,_x];};} foreach (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]);
};
if (count _camps > 0 && {random 1 < 0.7}) then {
_desTD = locationposition  (_camps call RETURNRANDOM);
_Lna = _desTD CALL NEARESTLOCATIONNAME;
_headerD = format ["Transport units to camp near %1",_Lna];
} else {
if (count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]) > 0 && {random 1 < 0.3}) then {
_t = [];
{_t set [count _t, _x];} foreach (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]);
_desTD = locationposition (_t call RETURNRANDOM);
_Lna = _desTD CALL NEARESTLOCATIONNAME;
_headerD = format ["Transport units to camp near %1",_Lna];
} else {
_p = SAOKMAPSIZE * 0.5;
_gp = (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
if (random 1 < 0.8 && {count _gp == 0}) then {
_t = [];
{_t set [count _t, _x];} foreach _gp;
_desTD = locationposition (_t call RETURNRANDOM);
_Lna = _desTD CALL NEARESTLOCATIONNAME;
_headerD = format ["Transport units to guardpost near %1",_Lna];
} else {
_t = (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 6000]);
if (count _t == 0) then {
_t = (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 30000]);
} else {
};
_desTD = locationposition _t;
_Lna = _desTD CALL NEARESTLOCATIONNAME;
_headerD = format ["Transport units to %1",_Lna];
};
};
};
sleep 0.1;
_camps = [];
{_camps set [count _camps,_x];} foreach (nearestLocations [_desTD, ["CampB"], 2000]);
if (count _camps > 0 && {random 1 < 0.5}) then {
_desT = locationposition (_camps call RETURNRANDOM);
_Lna = _desT CALL NEARESTLOCATIONNAME;
_header = format ["Pick up units from camp near %1",_Lna];
} else {
if (random 1 < 0.3) then {
_t = [];
{_t set [count _t, _x];} foreach (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 6000]);
if (count _t > 0) then {
_t = _t call RETURNRANDOM;
} else {
_t = (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 20000]) call RETURNRANDOM;
};
_desT = locationposition _t;
_Lna = _desT CALL NEARESTLOCATIONNAME;
_header = format ["Pick up units from %1",_Lna];
} else {
_p = SAOKMAPSIZE * 0.5;
_gp = (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
if (random 1 < 0.5 || {count _gp == 0}) then {
_desT = getmarkerpos (PierMarkers call RETURNRANDOM);
_Lna = _desT CALL NEARESTLOCATIONNAME;
_dat = (worldname CALL SAOKMAPDATA); 
_isWater = (_dat select 6);
_header = format ["Pick up units from pier near %1",_Lna];
if !(_isWater) then {_header = format ["Pick up units from passage near %1",_Lna];};
} else {
_t = [];
{_t set [count _t, _x];} foreach _gp;
_desT = locationposition (_t call RETURNRANDOM);
_Lna = _desT CALL NEARESTLOCATIONNAME;
_header = format ["Pick up units from guardpost near %1",_Lna];
};
};
};
sleep 0.1;
if (_desTD distance _desT < 1500) exitWith {[] SPAWN TASK_AirTask1;};


_Tid = format ["TaskAir%1",NUMM];
_Tid1 = format ["TaskAirP1_%1",NUMM];
_Tid2 = format ["TaskAirP2_%1",NUMM];
NUMM=NUMM+1;
_desc = "One of our infantry teams need quick transport to AO, pick up them and wait for more instructions. Make sure your chopper have room for 5 units.";
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
objnull,		// Task destination
false,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Move",			// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;
[
WEST, // Task owner(s)
[_Tid1,_Tid],	// Task ID (used when setting task state, destination or description later)
["Pick up units Here", "Pick up here", "Pick up here"], // Task description
_desT,			// Task destination
false,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Move",			// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

//NUMM=NUMM+1;
//_someId = format ["IDSAOK%1",NUMM];
//[_someId, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\A3\Structures_F_Heli\VR\Helpers\Data\VR_Symbol_Heli_Advanced_CA.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["PICK UP INFANTRY: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _desT] call BIS_fnc_addStackedEventHandler;
//icon = "\A3\ui_f\data\map\markers\military\pickup_CA.paa";
_time = time + 600;
//_marS = format ["Aiirmar%1",NUMM];
//NUMM=NUMM+1;
//_mar5 = [_marS,_desT,"mil_pickup",[0.9,0.9],"ColorBlue","Pick Up Infantry"] CALL FUNKTIO_CREATEMARKER;
waitUntil {sleep 3; vehicle player distance _desT < 400 || {_time < time}};
if (_time < time) exitWith {_nul = [_Tid,"FAILED", true] call BIS_fnc_taskSetState; sleep 30; _n = [_Tid] CALL BIS_fnc_deleteTask;};
//SPAWN
_uCar = [FRIENDC1,FRIENDC2,FRIENDC3] call RETURNRANDOM;
_unitrate = [4,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
_start2 = [_desT, 120,0,"(1 - sea)",""] CALL SAOKSEEKPOS;
_group = [_start2, WEST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
CantCommand set [count CantCommand,_group];
_dead = {
private ["_bol"];
_bol = false;
if (isNull _this || {{!isNull _x && {alive _x}} count units _this == 0}) then {_bol = true;};
_bol
};
_group SPAWN SAOKAISMOKEBLUE;
waitUntil {sleep 3; (vehicle player distance _desT < 300 && {(vehicle player) != player} &&  {getposATL (vehicle player) select 2 < 1}) || {_group call _dead}};
if (_group call _dead) exitWith {_nul = [_Tid,"FAILED", true] call BIS_fnc_taskSetState; sleep 30; _n = [_Tid] CALL BIS_fnc_deleteTask;};
//GET IN
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
{_x assignascargo (vehicle player);[_x] ordergetin true;} foreach units _group;
_vP = (vehicle player);
waitUntil {sleep 1; !alive _vP || {{alive _x && {!(_x in vehicle player)}} count units _group == 0}};
if (!alive _vP) exitWith {_nul = [_Tid,"FAILED", true] call BIS_fnc_taskSetState; sleep 30; _n = [_Tid] CALL BIS_fnc_deleteTask;};
//ARE IN
//deletemarker _marS;
_nul = ["Part1","SUCCEEDED", true] call BIS_fnc_taskSetState;
_Tid SPAWN {
private ["_n"];
sleep 30; _n = [_this] CALL BIS_fnc_deleteTask;
};
_desc = "Now head to this location and drop the infantry safely there.";
[
WEST, // Task owner(s)
[_Tid2,_Tid], // Task ID (used when setting task state, destination or description later)
[_desc, _headerD, _headerD], // Task description
_desTD,			// Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Move",			// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

//NUMM=NUMM+1;
//_someId = format ["IDSAOK%1",NUMM];
//[_someId, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\A3\Structures_F_Heli\VR\Helpers\Data\VR_Symbol_Heli_Basic_CA.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["DROP INFANTRY HERE: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _desTD] call BIS_fnc_addStackedEventHandler;
//icon = "\A3\ui_f\data\map\markers\military\join_CA.paa";
//AT DESTINATION - EXIT
//_marS = format ["Aiirmar%1",NUMM];
//NUMM=NUMM+1;
//_mar5 = [_marS,_desTD,"mil_join",[0.9,0.9],"ColorBlue","Drop Infantry Here"] CALL FUNKTIO_CREATEMARKER;
waitUntil {sleep 3; (vehicle player distance _desTD < 300 && {getposATL (vehicle player) select 2 < 1})  || {_group call _dead} || {!alive _vP}};
if (_group call _dead || {!alive _vP}) exitWith {_nul = [_Tid,"FAILED", true] call BIS_fnc_taskSetState; sleep 30; _n = [_Tid] CALL BIS_fnc_deleteTask;};
//deletemarker _marS;
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_nul = [_Tid2,"SUCCEEDED", true] call BIS_fnc_taskSetState;
//_nul = [_Tid,"SUCCEEDED", true] call BIS_fnc_taskSetState;
pisteet = pisteet + 550;
_nul = [550, "Transport Reward"] SPAWN PRESTIGECHANGE;
{unassignvehicle _x;[_x] ordergetin false;_x action ["GetOut",vehicle _x];} foreach units _group;
waitUntil {sleep 1; {alive _x && {(_x in vehicle player)}} count units _group == 0};
_group move _desTD;
CAMPUNITS = CAMPUNITS + (units _group);
CantCommand = CantCommand - [_group];
//_nul = ["taskBT","FAILED"] call SAOKCOTASK;

