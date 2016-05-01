private ["_class","_tg1","_wp","_Ppos","_posPl","_tg1wp1","_nul","_ty","_t","_xx","_c","_inf","_tank","_LZ","_isWpos","_params","_nC","_rrr"];
if (getmarkercolor (_this select 1) != "ColorRed") exitWith {};
if (vehicle player != player && {typeof (vehicle player) iskindof "Air"}) exitWith {};
{
_n = _x SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp = _x addWaypoint [[((_this select 0) select 0) + 300 - random 600,((_this select 0) select 1) + 300 - random 600,0], 0];
sleep 0.1;
} foreach VehicleGroups;
_nC = (["ColorRed",(_this select 0)] CALL NEARESTCAMP);
{
_n = _x SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
if ((_this select 0) distance locationposition _nC < 200 && {leader _x distance locationposition _nC < 300}) then {
CAMPREINFAR pushBack [_nC getvariable "Marker",(units _x)];
_wp = _x addWaypoint [[((_this select 0) select 0) + 30 - random 60,((_this select 0) select 1) + 30 - random 60,0], 0];
_wp setWaypointType "GUARD";
} else {
_wp = _x addWaypoint [[((_this select 0) select 0) + 300 - random 600,((_this select 0) select 1) + 300 - random 600,0], 0];
};
sleep 0.1;
} foreach Pgroups;

_t = 0;
_rrr = [2,3,4] call RETURNRANDOM;
if ([(_this select 0),"ColorRed"] CALL SAOKNEARVZNUM < 3) then {
_nearbyVZs = nearestLocations [(_this select 0),["Name"], 7000];
_c = count _nearbyVZs - 1;
for "_i" from 0 to _c do {
if !(count _nearbyVZs > _i) exitWith {};
_xx = _nearbyVZs select _i;
if (!isNil"_xx" && {!isNil{_xx getvariable "VZ"}} && {!((_xx getvariable "Mtype") in ["o_art","o_support","o_mortar","o_med"])}) then {
if ((_xx getvariable "Mcolor") == "ColorRed" && {!(_xx CALL SAOKVZMOVING)}) then {
sleep 0.1;
if (!([locationposition _xx,(_this select 0)] CALL SAOKWATERBETWEEN) || {(_xx getvariable "Mtype") in ["o_air","o_uav","o_plane"]}) then {
_wp = [(_this select 0),100,0,"(1 - sea)"] CALL SAOKSEEKPOS;  
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
if ((_xx getvariable "Mcolor") != "ColorRed") then {_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];};
[_xx,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
[_xx,"Alarmed to Camp"] SPAWN SAOKADDVEHZCON;
_t = _t + 1;
};
};
};
if (_t >= _rrr) exitWith {};
sleep 0.1;
};
};
[(_this select 0)] SPAWN SAOKSHF2;
[(_this select 0),"SolidBorder","ColorRed",300] SPAWN SAOKCREATEMARKERA;
sleep 30; 

if (random 1 < 0.1) then {
_class = (["AIRF",1] CALL VEHARRAY)+(["AIRARMC",1] CALL VEHARRAY); 
_class = _class call RETURNRANDOM;	
_Ppos = getposATL vehicle player;
_tg1 = [[(_Ppos select 0)+2500,(_Ppos select 1)+2500,50], 0, _class, EAST] call SPAWNVEHICLE;
_posPl = [(_Ppos select 0) + 100 -(random 200), (_Ppos select 1)+ 100 -(random 200), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
[(_tg1 select 2), 1] setWaypointType "GUARD";
_nul = [(_tg1 select 2), [1541.39,5059.05,0],200] SPAWN FUNKTIO_MAD;
_ty = (getText (configfile >> "CfgVehicles" >> _class >> "displayName"));
_nul = [(_tg1 select 0),_ty] SPAWN SAOKSHF3; 
sleep 30;
{
if (side _x == EAST && {{alive _x} count units _x > 1}) then {
_x SPAWN SAOKAISMOKEGREEN;
};
sleep 0.1;
} foreach allGroups;
};

