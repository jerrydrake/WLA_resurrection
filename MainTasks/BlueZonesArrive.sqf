// This task requests to clear an area around a pier or passage. Can be called multiple times. Actually in campaign is called twice.

private ["_mark","_ranZ","_locat","_Tid","_Lna","_header","_desc","_mar","_marker","_st","_star","_classs","_n","_nul","_someId"];
_ranZ = PierMarkers call RETURNRANDOM;
_locat = getmarkerpos _ranZ;

_Tid = format ["TaskOff%1",NUMM];

NUMM=NUMM+1;
_Lna = _locat CALL NEARESTLOCATIONNAME;
_header = format ["Help NATO Forces to enter near %1",_Lna];
_dat = (worldname CALL SAOKMAPDATA); 
_isWater = (_dat select 6);
_desc = "Enemy forces are blocking NATO Army vehicles to go ashore at this pier. Taking out enemy forces inside 2km radius would bring some NATO armored vehicles to this area.";
if !(_isWater) then {_desc = "Enemy forces are blocking NATO Army vehicles to enter the AO through this passage. Taking out enemy forces inside 2km radius would bring some NATO armored vehicles to this area.";};
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
_locat, 		// Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Attack",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

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
["B","CAP",""] SPAWN SAOKRADIOMES;
_nul = [_Tid,"SUCCEEDED",true] call BIS_fnc_taskSetState;
pisteet = pisteet + 1000;
_nul = [1000, "Enemy Zone CleaRed"] SPAWN PRESTIGECHANGE;

sleep 10;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;

while {!(_star CALL SAOKINMAP)} do {
sleep 0.2;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;

};
_classs = ARMEDVEHICLES select 0;
_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
_n = [_star, "ColorBlue",_classs] CALL AddVehicleZone;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;

while {!(_star CALL SAOKINMAP)} do {
sleep 0.2;
_star = [_locat, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;

};
_classs = ARMEDVEHICLES select 0;
_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
_n = [_star, "ColorBlue",_classs] CALL AddVehicleZone;

sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;
deletemarker _marker;