

private ["_mark","_ranZ","_locat","_Tid","_Lna","_header","_desc","_mar","_marker","_st","_star","_classs","_n","_nul","_someId"];
_ranZ = PierMarkers call RETURNRANDOM;
_locat = getmarkerpos _ranZ;

_Tid = format ["TaskOff%1",NUMM];

NUMM=NUMM+1;
_Lna = _locat CALL NEARESTLOCATIONNAME;
_header = format ["Help Green Forces to enter near %1",_Lna];
_desc =("CSAT are blocking Green Army vehicles to go ashore at this pier. Taking out CSAT zones inside 2km radius would bring some green armored vehicle zones to this area");
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
objNull, // Task destination
"CREATED"
] call SAOKCRTASK;
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\Structures_F_Heli\VR\Helpers\Data\VR_Symbol_Heli_Weapons_CA.paa", ICONCOLORGREEN, _this,1.51, 1.51, 0, (format ["Clear CSAT Zones inside 2km Radius: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _locat] call BIS_fnc_addStackedEventHandler;

_mar = format ["TTmar%1",NUMM];
NUMM=NUMM+1;
_marker = createMarker [_mar,_locat];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [2000, 2000];
_marker setMarkerColor "ColorRed";
_marker setMarkerBrush "BORDER";
_marker setMarkerAlpha 0.5;

_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
while {!(_star CALL SAOKINMAP)} do {
sleep 0.2;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
_classs = ARMEDVEHICLES select 1;
_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
_n = [_star, "ColorRed",_classs] CALL AddVehicleZone;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
while {!(_star CALL SAOKINMAP)} do {
sleep 0.2;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
_classs = ARMEDVEHICLES select 1;
_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
_n = [_star, "ColorRed",_classs] CALL AddVehicleZone;

_mark = [];
_nearbyVZs = nearestLocations [_locat,["Name"], 2000];
{if (!isNil{_x getvariable "VZ"}) then {_mark pushback _x;};} foreach _nearbyVZs;

waitUntil {sleep 10; {!(isNull _x) && {(_x getvariable "Mcolor") == "ColorRed"} && {locationposition _x distance _locat < 2000} && {!surfaceisWater (locationposition _x)}} count _mark == 0};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
["G","CAP",""] SPAWN SAOKRADIOMES;
pisteet = pisteet + 1000;
_nul = [1000, "Enemy Zone CleaRed"] SPAWN PRESTIGECHANGE;
CurTaskS = CurTaskS - ["MainTasks\GreenZonesArrive.sqf"];
sleep 10;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
while {!(_star CALL SAOKINMAP)} do {
sleep 0.2;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
_classs = ARMEDVEHICLES select 2;
_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
_n = [_star, "ColorGreen",_classs] CALL AddVehicleZone;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
while {!(_star CALL SAOKINMAP)} do {
sleep 0.2;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
_classs = ARMEDVEHICLES select 2;
_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
_n = [_star, "ColorGreen",_classs] CALL AddVehicleZone;
sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;
deletemarker _marker;