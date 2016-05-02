

private ["_ARcopy","_mark","_d","_st","_start3","_start","_random","_ranAir","_cent","_mar","_marker","_obj","_obj2","_start2","_nul","_cur","_di","_classes","_ran","_tank","_class","_pPosi","_tg1","_posPl","_tg1wp1","_someId","_mar2","_marker2"];
CurTaskS set [count CurTaskS, "MainTasks\Resistance1.sqf"];
sleep 10;
_ARcopy = + AIRFIELDLOCATIONS;
if ({getmarkercolor _x != "ColorGreen" || {(getmarkercolor (([getmarkerpos _x] CALL RETURNGUARDPOST) getvariable "Gmark")) != "ColorGreen"}} count _ARcopy > 0) then {
{
if (getmarkercolor _x == "ColorGreen" || {(getmarkercolor (([getmarkerpos _x] CALL RETURNGUARDPOST) getvariable "Gmark")) == "ColorGreen"}) then {
if (count _ARcopy > 2) then {
_ARcopy = _ARcopy - [_x];
};
};
} foreach _ARcopy;
};
_t = [] CALL SAOKSORTPLAYER;
_ARcopy = [_ARcopy,[_t],{_input0 distance (getmarkerpos _x)},"ASCEND"] call SAOKSORTBY;
_ranAir = _ARcopy select 0;	
if ((getmarkerpos _ranAir) distance player < 2000) then {_ranAir = _ARcopy select 1;};


_cent = if (count _this > 0 && {{(_this select 0) distance getmarkerpos _x < 100} count AIRFIELDLOCATIONS > 0}) then {_this select 0} else {getmarkerpos _ranAir};
[
WEST, // Task owner(s)
"task3", // Task ID (used when setting task state, destination or description later)
["AAF will not be able to re-enter the AO until you have cleared this marked airfield. We need to find and disable two enemy anti-air vehicles, disabled all marked vehicles zones in the AO and deal with possible reinforcements. Creating guardpost, or two with AT-launchers, to cut nearby roads could be good thing to do.<br/><br/><img image='airfield.jpg' width='360' height='202.5'/>", "Secure Pointed Airfield", "Secure Pointed Airfield"], // Task description
_cent, // Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Defend",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;
//NUMM=NUMM+1;
//icon = "\A3\ui_f\data\map\markers\military\flag_CA.paa";
//_someId = format ["IDSAOK%1",NUMM];
//[_someId, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling1_CA.paa", ICONCOLOR, _this,1.51, 1.51, 0, (format ["Secure This Airfield: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _cent] call BIS_fnc_addStackedEventHandler;


CurTaskS = CurTaskS - ["MainTasks\Resistance1.sqf"];
CurTaskS = CurTaskS + [["MainTasks\Resistance1.sqf",_cent]];

_mark = [];
_nearbyVZs = nearestLocations [_cent,["Name"], 2000];
{if (!isNil{_x getvariable "VZ"}) then {_mark pushback _x;};} foreach _nearbyVZs;



_mar = format ["TTmar%1",NUMM];
NUMM=NUMM+1;
_marker = createMarker [_mar,_cent];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [2000, 2000];
_marker setMarkerColor "ColorRed";
_marker setMarkerBrush "FDiagonal";

//_mar2 = format ["TTmar%1",NUMM];
//NUMM=NUMM+1;
//_marker2 = [_mar2,_cent, "mil_flag", [0.8,0.8], "ColorRed", "Secure This Airfield"] CALL FUNKTIO_CREATEMARKER;

sleep 1;
_start = [_cent, 500,0,"(1 - trees) *(1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
sleep 1;
_obj = [_start,1,"O_APC_Tracked_02_AA_F",EAST] call SPAWNVEHICLE;
DONTDELGROUPS = DONTDELGROUPS + [(_obj select 2)];
(_obj select 0) setfuel 0;
sleep 1;
_start = [_cent, 500,0,"(1 - trees) *(1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
sleep 1;
_obj2= [_start,1,"O_APC_Tracked_02_AA_F",EAST] call SPAWNVEHICLE;
DONTDELGROUPS = DONTDELGROUPS + [(_obj2 select 2)];
(_obj2 select 0) setfuel 0;


if (count (nearestLocations [_cent, ["PostG","PostR"], 700]) < 2) then {
_start2 = [_cent, 300,0,"(1 - sea) * (1 + meadow)* (1 - hills)"] CALL SAOKSEEKPOS;
_d = 300;
while {!([_start2,20] CALL SAOKISFLAT) || {_start2 call SAOKONRUNWAY} || {surfaceiswater _start2}} do {
_d = _d + 30;
_start2 = [_cent, _d,0,"(1 - sea) * (1 + meadow)* (1 - hills)"] CALL SAOKSEEKPOS;
sleep 1;
};
_nul = [_start2,"",(15+random 25)] SPAWN CreateRoadBlock;

_start3 = [_cent, 300,0,"(1 - sea) * (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
_d = 300;
while {_start2 distance _start3 < 40 || {!([_start3,20] CALL SAOKISFLAT)} || {_start3 call SAOKONRUNWAY} || {surfaceiswater _start3}} do {
_d = _d + 30;
_start3 = [_cent, _d,0,"(1 - sea) * (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
sleep 1;
};
_nul = [_start3,"",(15+random 25)] SPAWN CreateRoadBlock;
};


waitUntil {sleep 3; ({alive _x} count (crew (_obj select 0))+(crew (_obj2 select 0)) == 0 || {{alive _x} count [(_obj select 0),(_obj2 select 0)] == 0}) && {{!isnull _x && {(_x getvariable "Mcolor") == "ColorRed"} && {locationposition _x distance _cent < 2000} && {!surfaceisWater (locationposition _x)}} count _mark == 0}};
pisteet = pisteet + 400;_nul = [400, "From Task"] SPAWN PRESTIGECHANGE;
deleteMarker _marker;
//deleteMarker _marker2;
"GREEN Arrival" SPAWN SAOKCHAPTERADD;
DONTDELGROUPS = DONTDELGROUPS - [(_obj select 2)];
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_nul = [4] SPAWN MusicT;
"GreenHelp" CALL SAOKADDPROG;
"AAF support also available now in the support menu. Dont forget that you can get choppers and planes to fly by visiting purchase menu near any airfield" SPAWN HINTSAOK;
_n = ["Green"] SPAWN SAOKSPAWNBIGCAMP;
waitUntil {sleep 0.1; scriptdone _n};
[] SPAWN TEGR1;
CurTaskS set [count CurTaskS, "MainTasks\GreenAirZonesArrive.sqf"];
CurTaskS set [count CurTaskS, "MainTasks\GreenZonesArrive.sqf"];
_nul = ["task3","SUCCEEDED", true] call BIS_fnc_taskSetState;
[] SPAWN TERES1;
["CSATAIR"] SPAWN SAOKADDRANDOMEVENTS;
CurTaskS = CurTaskS - [["MainTasks\Resistance1.sqf",_cent]];
sleep 3;
_start = [(getposATL (vehicle player) select 0) + 1700 - (random 3400),(getposATL (vehicle player) select 1) + 1700 - (random 3400),50];
while  {_start distance vehicle player < 1500} do {
sleep 1;
_start = [(getposATL (vehicle player) select 0) + 1700 - (random 3400),(getposATL (vehicle player) select 1) + 1700 - (random 3400),50];
};
_di= [_start, player] call SAOKDIRT;
_random = 3 + floor (random 3);
_classes = [];
_ran = [FRIENDC2] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_ran call RETURNRANDOM);};
_tank = ["I_Heli_Transport_02_F"]; 
_tank = _tank call RETURNRANDOM;	
_nul = [_start, _cent, _cent, WEST, _di, _tank, 50,_classes,[0.6,0.7],0,1] SPAWN FUNKTIO_ChopperTransportF;


sleep 10;
_start = [(getposATL (vehicle player) select 0) + 1700 - (random 3400),(getposATL (vehicle player) select 1) + 1700 - (random 3400),100];
while  {_start distance vehicle player < 1500} do {
sleep 1;
_start = [(getposATL (vehicle player) select 0) + 1700 - (random 3400),(getposATL (vehicle player) select 1) + 1700 - (random 3400),100];
};
_class = ["I_Plane_Fighter_03_CAS_F"];
_pPosi = _cent;
_class = _class call RETURNRANDOM;	
_tg1 = [_start, _di, _class, WEST] call SPAWNVEHICLE;
_posPl = [(_pPosi select 0) + (random 200)-(random 200), (_pPosi select 1)+ (random 200)-(random 200), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
[(_tg1 select 2), 1] setWaypointType "GUARD";
_nul = [(_tg1 select 2), [10048.6,25343.7,0],500] SPAWN FUNKTIO_MAD;
sleep 20;
[] SPAWN TASK_GreenZonesArrive;
sleep 120;
[] SPAWN TASK_GreenAirZonesArrive;