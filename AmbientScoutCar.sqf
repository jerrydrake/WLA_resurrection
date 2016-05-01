
private ["_cond","_bol","_func","_car","_start","_end","_side","_dire","_unitc","_type","_tg1","_group","_nul","_tg1wp1","_way1","_carc"];
_carc = _this select 0;
_start = _this select 1;
_end = _this select 2;
_side = _this select 3;
_dire = _this select 4;
_unitc = _this select 5;
_type = _this select 6;
if (surfaceisWater _start) exitWith {};
if (_start distance ([_start] CALL NEARESTGUARDPOST) < 800) exitWith {};

_func = {sleep 3; if (!alive _this) then {{_x spawn SAOKDELETE;sleep 0.01;} foreach crew _this; deletevehicle _this;};};

_car = objNull;
_tg1 = [];
_group = [];
MAXCARS=MAXCARS-1;
if (_type == 0) then {
_cond = locationposition (["ColorRed",_start] CALL NEARESTCAMP) distance _start > 4000;
if (_cond) then {_carc = ["C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_SUV_01_F","C_Offroad_01_F","C_Hatchback_01_F"] call RETURNRANDOM;};
_car = createVehicle [_carc,_start, [], 0, "form"];
_car SPAWN _func;
_start = [(_start select 0)+25,(_start select 1)+25, 0];
_group = [_start, _side,_unitc] call SpawnGroupCustom;
if (_cond) then {{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;sleep 0.1;} foreach units _group;};
if (random 1 > 0.5) then {
_group setspeedmode "LIMITED";
};
sleep 1;
leader _group moveindriver _car;
{_x moveincargo _car;} foreach ((units _group) - [leader _group]);
{_x setskill 0.5;sleep 0.1;} foreach (units _group);
_nul = [_group,"ColorRed"] SPAWN FUNKTIO_GM;
sleep 1;
_way1= _group addWaypoint [_end, 0]; 
_car setdir _dire;
CARS pushBack _car;
};
if (_type == 1) then {
_tg1 = [_start, 0, _carc, EAST] call SPAWNVEHICLE;
if (random 1 > 0.5) then {
(_tg1 select 2) setspeedmode "LIMITED";
};
sleep 1;

_tg1wp1= (_tg1 select 2) addWaypoint [_end, 0]; 
CARS pushBack (_tg1 select 0);
sleep 1;

(_tg1 select 0) SPAWN _func;
};
_bol = true;
if (_type == 0 && {(isNil"_car" || {isNull _car})}) exitWith {MAXCARS=MAXCARS-1;};
if (_type == 1 && {(isNil"_tg1" || {isNull (_tg1 select 0)})}) exitWith {MAXCARS=MAXCARS-1;};
if (_type == 1) then {
waituntil {sleep 5;isNIl"_tg1" || {typeName _tg1 != "ARRAY"} || {isNull (_tg1 select 0)} || {!alive (_tg1 select 0)} || {{(leader (_tg1 select 2) knowsabout (vehicle _x) > 0.1)} count [player]> 0} || {(((leader (_tg1 select 2) distance (_end)) < 50) && {((vehicle _x) distance leader (_tg1 select 2) < 500)} count [player] == 0)}}; 
if ({(leader (_tg1 select 2) knowsabout (vehicle _x) > 0.1)} count [player]> 0) then {
deleteWaypoint [(_tg1 select 2),1 ];
VehicleGroups pushBack (_tg1 select 2);
//_tg1wp1= (_tg1 select 2) addWaypoint [getposATL (_tg1 select 0), 0]; 
//[(_tg1 select 2), 1] setWaypointType "GUARD";
} else {
waitUntil {sleep 10; isNIl"_tg1" || {typeName _tg1 != "ARRAY"} || {isNull (_tg1 select 0)} || {{vehicle _x distance (_tg1 select 0) < 500} count [player] == 0}};
{_x spawn SAOKDELETE;sleep 0.1;} foreach units  (_tg1 select 2);
if ({(vehicle _x == (_tg1 select 0))} count [player] >0) exitWith {MAXCARS=MAXCARS+1;_bol = false;};
deletevehicle (_tg1 select 0);
};
} else {
waituntil {sleep 5; isNIl"_car" || {typeName _tg1 != "ARRAY"}  || {isNull _group} || {(((leader _group distance (_end)) < 50) && {((vehicle _x) distance leader _group < 500)} count [player] == 0)} || {{(leader _group knowsabout (vehicle _x) > 0.1)} count [player] > 0} || {(damage _car > 0)}};
if (((leader _group distance (_end)) < 50) && {{((vehicle _x) distance leader _group < 500)} count [player] == 0}) then {
{_x spawn SAOKDELETE;sleep 0.1;} foreach units _group;
if ({(vehicle _x == _car)} count [player] >0) exitWith {MAXCARS=MAXCARS+1;_bol = false;};
deletevehicle _car;
} else {

deleteWaypoint [_group,1];
{unassignvehicle _x; [_x] ordergetin false;_x action ["GetOut",vehicle _x];sleep 0.1;} foreach units _group;
[_group, getposATL _car, 400] call bis_fnc_taskPatrol;
Pgroups pushBack _group;

};
};
if (_bol) then {MAXCARS=MAXCARS+1;};