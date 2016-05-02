private ["_start","_condNoWEST","_time","_wp1","_tg1wp1","_header","_Lna","_Tid","_marS","_start2","_timer","_locationA","_ALLunits","_VEHs","_INFgroups","_VEHgroups","_text","_group","_nul","_n","_ker","_F","_E","_G","_mP","_mar5","_desc","_rad","_mid","_wpPP","_dir","_locationAm","_someId","_max","_tim","_vP"];


_condNoWEST = {
private ["_bol"];
_bol = false; 
if ({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x != EAST && {side _x != CIVILIAN}}} count (_this nearEntities [["Man"],100]) < 2) then {_bol = true;};
_bol
};
//INIT
_VEHgroups = [];
_INFgroups = [];
_VEHs = [];
_ALLunits = [];

_vP = getposATL vehicle player;
_start = [_vP,3500] CALL SAOKSEARCHPOS; 
_rad = 3600; 
while {!surfaceiswater _start || {!(_start CALL SAOKINMAP)}} do {
sleep 0.5;
_start = [_vP,_rad] CALL SAOKSEARCHPOS; 
_rad = _rad + 100;
};
sleep 1;
_locationA = [_start,getmarkerpos "Fac4"] CALL SAOKSEEKSHORE;  
_start2 = [_start,1500,500] CALL SAOKSEARCHPOS; 

_max = 0;
while {!surfaceisWater _start2 || {_start2 distance _start < 1000} || {[_start2,_start] CALL SAOKLANDBETWEEN}} do {
sleep 0.1;
_start2 = [_start,1500,500] CALL SAOKSEARCHPOS; 
_max = _max + 1;
if (_max > 40) exitWith {};
};
if (_max > 40) exitWith {[] SPAWN FDefendBeach;};

_start = + _start2;
_dir = [_locationA, _start] call SAOKDIRT;

_timer = time + (180 + (random 500));
_marS = format ["LINEmar%1",NUMM];
NUMM=NUMM+1;
_mar5 = [_marS,_locationA,"loc_Quay",[0.9,0.9],"ColorOrange","Defend the Beach"] CALL FUNKTIO_CREATEMARKER;
if ({(_x getvariable "Mcolor") == "ColorRed" && {locationposition _x distance (getmarkerpos _mar5) < 5000}} count AAsM == 0) then {
_mid = [((_locationA select 0)+(_start select 0))*0.5,((_locationA select 1)+(_start select 1))*0.5,0];
[[_mid],"mil_arrow","ColorRed",([_start, _locationA] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
};
["E","CAPS"] SPAWN SAOKRADIOMES;
[["WLA","Battle"]] call BIS_fnc_advHint;
_Tid = format ["TaskBat%1",NUMM];
NUMM=NUMM+1;
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Defend Beach near %1",_Lna];
_desc = "CSAT is spotted moving units over ocean and heading towards this beach. We shouldnt let them enter the island. If possible, head there and build guardpost or two to defend the beach.";
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
objNull, // Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Defend",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

NUMM=NUMM+1;
_locationAm = + _locationA;
_locationAm set [2,20];

[_Tid,_locationAm] CALL BIS_fnc_taskSetDestination;	// Added for 1.58

//_someId = format ["IDSAOK%1",NUMM];
//[_someId, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\A3\ui_f\data\map\mapcontrol\Quay_CA.paa", ICONCOLORORANGE, _this,1.51, 1.51, 0, (format ["DEFEND BEACH: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _locationAm] call BIS_fnc_addStackedEventHandler;

_text = ("Wolf, CSAT is coming over the ocean trying to land near "+_Lna+". If you prevent them breaking through the beach, CSAT would be more unorganized for some time");
BaseR globalchat _text;
waitUntil {sleep 5; ((vehicle player) distance _locationA < 1400) || {_timer < time}};
if !(_timer < time) then {
_group = [_start,_locationA,50] CALL SAOKCSATBOATINF;
_INFgroups pushback _group;
_group = [_start,_locationA,50] CALL SAOKCSATBOATINF;
_INFgroups pushback _group;
_group = [_start,_locationA,50] CALL SAOKCSATBOATINF;
_INFgroups pushback _group;
{_ALLunits = _ALLunits + (units _x);} foreach _VEHgroups + _INFgroups;
sleep 30;
//AIR SUPPORT
if (random 1 < 0.7) then {
[] SPAWN SAOKCSATCHOPSUP;
};
//BEGIN ATTACK
if ({(_x getvariable "Mcolor") == "ColorRed" && {locationposition _x distance (getmarkerpos _mar5) < 5000}} count AAsM == 0) then {
_wpPP = getmarkerpos _mar5;
_mid = [((_start select 0)+(_wpPP select 0))*0.5,((_start select 1)+(_wpPP select 1))*0.5,0];
[[_mid],"mil_arrow","ColorRed",([_start, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
};
{
_tg1wp1= _x addWaypoint [_locationA, 0]; 
[_x, 1] setWaypointBehaviour "COMBAT";
} foreach _VEHgroups;
{
_wp1 = _x addWaypoint [_locationA, 0];
[_x, 1] setWaypointCombatMode "Red";
[_x, 1] setWaypointType "GUARD";
} foreach _INFgroups;


_time = time + 600;
BaseR globalchat ("All units near "+_Lna+", be aware. CSAT is heading at the beach now. Out");
_ker = (count _ALLunits)*0.2;
waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {!(fleeing _x)}} count _ALLunits < _ker || {_time < time}};
if (_time < time) then {
//END2
_locationA SPAWN SAOKADDCSATGUARDPTOPOS;
["ScoreRemoved",["CSAT Captured the Beach",30]] call SAOKNOTIFI;
_nul = [_Tid,"FAILED",true] call BIS_fnc_taskSetState;
["E","CAP"] SPAWN SAOKRADIOMES;
["F","LOS",""] SPAWN SAOKRADIOMES;
deletemarker _mar5;
} else {
//END C
{
VehicleGroups pushback _x;
} foreach _VEHgroups;
{
CARS pushback _x;
_x setvariable ["EndS",1];
} foreach _VEHs;
{
Pgroups pushback _x;
} foreach _INFgroups;
["ScoreAdded",["CSAT Assault on Beach Failed",10]] call SAOKNOTIFI;
_nul = [_Tid,"SUCCEEDED", true] call BIS_fnc_taskSetState;
_tim = (400 + (random 300)) / DIFLEVEL;
_tim SPAWN SAOKREINFCUTADD;
deletemarker _mar5;
};

} else {
//FAR W T
_time = time + 600;
BaseR globalchat ("Be aware, CSAT is heading now at the beach near "+_Lna+". Out");
waitUntil {sleep 5; _time < time || {(vehicle player) distance _locationA < 1400}};
if !(_timer < time) then {
//CLOSE
_group = [_start,_locationA,50] CALL SAOKCSATBOATINF;
_INFgroups pushback _group;
_group = [_start,_locationA,50] CALL SAOKCSATBOATINF;
_INFgroups pushback _group;
_group = [_start,_locationA,50] CALL SAOKCSATBOATINF;
_INFgroups pushback _group;
{_ALLunits = _ALLunits + (units _x);} foreach _VEHgroups + _INFgroups;
sleep 30;
//RANDOM AIR SUPPORT 
if (random 1 < 0.7) then {
[] SPAWN SAOKCSATCHOPSUP;
};
//BEGIN ATTACK
if ({(_x getvariable "Mcolor") == "ColorRed" && {locationposition _x distance (getmarkerpos _mar5) < 5000}} count AAsM == 0) then {
_wpPP = getmarkerpos _mar5;
_mid = [((_start select 0)+(_wpPP select 0))*0.5,((_start select 1)+(_wpPP select 1))*0.5,0];
[[_mid],"mil_arrow","ColorRed",([_start, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
};
{
_tg1wp1= _x addWaypoint [_locationA, 0]; 
[_x, 1] setWaypointBehaviour "COMBAT";
} foreach _VEHgroups;
{
_wp1 = _x addWaypoint [_locationA, 0];
[_x, 1] setWaypointCombatMode "Red";
[_x, 1] setWaypointType "GUARD";
} foreach _INFgroups;


_time = time + 600;
BaseR globalchat ("CSAT is getting very close the beach near "+_Lna+". All nearby units, assist if you can. Out");
_ker = (count _ALLunits)*0.2;
waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {!(fleeing _x)}} count _ALLunits < _ker || {_time < time}};
if (_time < time) then {
//END2
_locationA SPAWN SAOKADDCSATGUARDPTOPOS;
["ScoreRemoved",["CSAT Captured the Beach",30]] call SAOKNOTIFI;
_nul = [_Tid,"FAILED", true] call BIS_fnc_taskSetState;
["E","CAP"] SPAWN SAOKRADIOMES;
["F","LOS",""] SPAWN SAOKRADIOMES;
deletemarker _mar5;
} else {
//END C
{
VehicleGroups pushback _x;
} foreach _VEHgroups;
{
CARS pushback _x;
_x setvariable ["EndS",1];
} foreach _VEHs;
{
Pgroups pushback _x;
} foreach _INFgroups;
["ScoreAdded",["CSAT Assault on Beach Failed",10]] call SAOKNOTIFI;
_nul = [_Tid,"SUCCEEDED", true] call BIS_fnc_taskSetState;
_tim = (400 + (random 300)) / DIFLEVEL;
_tim SPAWN SAOKREINFCUTADD;
deletemarker _mar5;
};

} else {
//FAR W T
_F = [];
_E = [];
_G = [];
_mP = _locationA;
_nearbyLocations = nearestLocations [_mP,["Name"], 1700];
{
if (!isNil{_x getvariable "VZ"} && {isNil{_x getvariable "ACTIVE"}} && {(_x getvariable "Mcolor") != "ColorGrey"}) then {
if ((_x getvariable "Mcolor") != "ColorRed") then {_F pushback _x;} else {_E pushback _x;};
};
} foreach _nearbyLocations;
{
_p = _x getvariable "Post";
if (isNil{_p getvariable "ACTIVE"}) then {
_G pushback _p;
};
} foreach (nearestLocations [_mp, ["PostG","PostR"], 1700]);
if (count (_F + _E + _G) == 0 || {count (_F + _G) < count _E}) then {
if (random 1 < 0.5) then {_locationA SPAWN SAOKADDCSATGUARDPTOPOS;};
["ScoreRemoved",["CSAT Captured the Beach",30]] call SAOKNOTIFI;
PERSIANPRESTIGE = PERSIANPRESTIGE + (1000*DIFLEVEL);
_nul = [_Tid,"FAILED", true] call BIS_fnc_taskSetState;
["E","CAP"] SPAWN SAOKRADIOMES;
["F","LOS",""] SPAWN SAOKRADIOMES;
_start = [_locationA,100,30,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
_rC = ["C","P","T","V","AA","S"] call RETURNRANDOM;
["EAST",_rC,2,_start] SPAWN SAOKMOREVEHZONES;
} else {
["ScoreAdded",["CSAT Assault on Beach Failed",10]] call SAOKNOTIFI;
_nul = [_Tid,"SUCCEEDED", true] call BIS_fnc_taskSetState;
_tim = (200 + (random 100)) / DIFLEVEL;
_tim SPAWN SAOKREINFCUTADD;

};
deletemarker _mar5;
};
};
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;