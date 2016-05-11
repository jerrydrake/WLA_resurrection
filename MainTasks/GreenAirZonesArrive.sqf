// This task is called by Resistance1.sqf during main story line.

private ["_ranZ","_mark","_locat","_Tid","_Lna","_header","_desc","_mar","_marker","_st","_star","_classs","_n","_nul","_someId"];
_ranZ = VEHZONES call RETURNRANDOM;
while {(_ranZ getvariable "Mcolor") != "ColorRed" || {surfaceisWater (locationposition _ranZ)}} do {sleep 1;_ranZ = VEHZONES call RETURNRANDOM;};
_locat = locationposition _ranZ;

_Tid = format ["TaskOff%1",NUMM];
NUMM=NUMM+1;

CurTaskS set [count CurTaskS, "MainTasks\GreenAirZonesArrive.sqf"];

_Lna = _locat CALL NEARESTLOCATIONNAME;
_header = format ["Help Green Air Forces to enter near %1",_Lna];
_desc =("Enemy forces are blocking Green Air Forces to operate. Taking out enemy forces inside 2km radius would bring some Green Air zones to this area.");
[
	WEST, // Task owner(s)
	_Tid, // Task ID (used when setting task state, destination or description later)
	[_desc, _header, _header], // Task description
	_locat,		// Task destination
	true,			// true to set task as current upon creation
	-1,				// priority
	true,			// Notification?
	"Attack",		// 3d marker type
	false			// Shared?
] call BIS_fnc_taskCreate;

//NUMM=NUMM+1;
//_someId = format ["IDSAOK%1",NUMM];
//[_someId, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\A3\Structures_F_Heli\VR\Helpers\Data\VR_Symbol_Heli_Weapons_CA.paa", ICONCOLORGREEN, _this,1.51, 1.51, 0, (format ["Clear CSAT Zones inside 2km Radius: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _locat] call BIS_fnc_addStackedEventHandler;

_mar = format ["TTmar%1",NUMM];
NUMM=NUMM+1;
_marker = createMarker [_mar,_locat];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [2000, 2000];
_marker setMarkerColor "ColorRed";
_marker setMarkerBrush "FDiagonal";
_marker setMarkerAlpha 0.5;

_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
while {!(_star CALL SAOKINMAP)} do {
	sleep 0.2;
	_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
_classs = ARMEDVEHICLES select 1;
_classs = ["O_APC_Tracked_02_AA_F"];
_n = [_star, "ColorRed",_classs] CALL AddVehicleZone;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
while {!(_star CALL SAOKINMAP)} do {
	sleep 0.2;
	_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
_classs = ARMEDVEHICLES select 1;
_classs = ["O_APC_Tracked_02_AA_F"];
_n = [_star, "ColorRed",_classs] CALL AddVehicleZone;

_mark = [];
_nearbyVZs = nearestLocations [_locat,["Name"], 2000];
{if (!isNil{_x getvariable "VZ"}) then {_mark pushback _x;};} foreach _nearbyVZs;

waitUntil {sleep 10; {!(isNull _x) && {(_x getvariable "Mcolor") == "ColorRed"} && {locationposition _x distance _locat < 2000} && {!surfaceisWater (locationposition _x)}} count _mark == 0};
["G","CAP",""] SPAWN SAOKRADIOMES;

//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_nul = [_Tid,"SUCCEEDED",true] call BIS_fnc_taskSetState;
pisteet = pisteet + 1000;
_nul = [1000, "Enemy Zone CleaRed"] SPAWN PRESTIGECHANGE;
CurTaskS = CurTaskS - ["MainTasks\GreenAirZonesArrive.sqf"];
sleep 10;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
while {!(_star CALL SAOKINMAP)} do {
	sleep 0.2;
	_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
_n = [_star, "ColorGreen",["I_Plane_Fighter_03_CAS_F"],"n_plane"] CALL AddVehicleZone;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
while {!(_star CALL SAOKINMAP)} do {
	sleep 0.2;
	_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
_n = [_star, "ColorGreen",["I_Plane_Fighter_03_CAS_F"],"n_plane"] CALL AddVehicleZone;
sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;
deletemarker _marker;