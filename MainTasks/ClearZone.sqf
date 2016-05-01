
private ["_ranZ","_mark","_nul","_locat","_Tid","_Lna","_header","_desc","_mar","_marker","_st","_star","_classs","_n","_aika","_someId"];

_ranZ = VEHZONES call RETURNRANDOM;
while {(_ranZ getvariable "Mcolor") != "ColorRed" || {surfaceisWater (locationposition _ranZ)}} do {sleep 1;_ranZ = VEHZONES call RETURNRANDOM;};
_locat = locationposition _ranZ;

_Tid = format ["TaskOff%1",NUMM];

NUMM=NUMM+1;
_Lna = _locat CALL NEARESTLOCATIONNAME;
_header = format ["Clear CSAT Movement near %1",_Lna];
_desc =("CSAT have recently more and more vehicles appearing to patrol over this marker area. I want all red zones cleared from that 2km radius area in 60 minutes.");
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
objNull, // Task destination
"CREATED" 
] call SAOKCRTASK;
_someId = format ["IDSAOK%1",NUMM];
NUMM=NUMM+1;
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\Structures_F_Heli\VR\Helpers\Data\VR_Symbol_Heli_Weapons_CA.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Clear CSAT Zones inside 2km Radius: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
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
_aika = (60*60) + time;
waitUntil {sleep 10; _aika < time || {{!(isNull _x) && {(_x getvariable "Mcolor") == "ColorRed"} && {locationposition _x distance _locat < 2000} && {!surfaceisWater (locationposition _x)}} count _mark == 0}};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
if (_aika < time) then {
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
} else {
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
pisteet = pisteet + 1000;
_nul = [1000, "Enemy Zone CleaRed"] SPAWN PRESTIGECHANGE;
};
sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;
deletemarker _marker;
