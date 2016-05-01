private ["_masterFunc","_cars","_roads","_pRan","_dir","_pos","_veh","_forEachIndex","_ro","_ad","_p","_od","_p1","_p2"];
_masterFunc = {
private ["_unit"];
sleep (random 1);
_unit = _this select 0;
waituntil {sleep 5; isNull _unit || {(!([_unit, player] CALL FUNKTIO_LOS) && {_unit distance (vehicle player) > 150})}};
if (!(isNull _unit) && {count crew _unit == 0}) then {_unit getvariable ["AmCrate",nil];deletevehicle _unit;};
if (count crew _unit > 0) then {CARS pushBack _unit;};
};

while {true} do {
waituntil {sleep 10; vehicle player distance ([getposATL player] CALL SAOKNEARVILP) < 500 && {speed (vehicle player) < 4}};
_cars = [];
while {vehicle player distance ([getposATL player] CALL SAOKNEARVILP) < 500} do {
{if (isNull _x) then {_cars = _cars - [_x];};sleep 0.1;} foreach _cars;
{if (isNil"_x") exitWith {_deAT = _cars deleteAt _forEachIndex;};sleep 0.1;} foreach _cars;
sleep 0.1;
{if (isNil{_x getvariable "TaskCar"} && {_x distance vehicle player > 150} && {!([_x, player] CALL FUNKTIO_LOS)}) then {_cars = _cars - [_x];_x spawn SAOKDELETE;};sleep 0.1;} foreach _cars;
sleep 0.1;
if (count _cars < 3 && {count vehicles < 60} && {!((getposATL vehicle player) CALL IORW)}) then {
_roads = ((getposATL vehicle player) nearRoads 150); 
if (count _roads > 0) then {
_pRan = _roads call RETURNRANDOM;
sleep 0.1;
while {{_x distance _pRan < 10} count _cars > 0|| {([(getposASL _pRan), player] CALL FUNKTIO_LOSOBJ)} || {player distance _pRan < 90} || {_pRan distance ([_pRan] CALL RETURNGUARDPOST) < 50} || {_pRan distance ([_pRan] CALL RETURNGUARDPOST) < 50} || {_pRan distance (locationposition (["ColorBlue",_pRan] CALL NEARESTCAMP)) < 50}} do {
sleep 2;
_roads = ((getposATL vehicle player) nearRoads 150);
sleep 1;
if (count _roads > 0) then {_pRan = _roads call RETURNRANDOM;};
};
_ro = (roadsConnectedTo _pRan); 
_dir = random 360;
sleep 0.1;
if (count _ro > 0) then {_ro = _ro call RETURNRANDOM; _dir = [getposATL _ro,getposATL _pRan] call SAOKDIRT;};
_p = [[5,0.2],[-5,-0.2]]call RETURNRANDOM;
_ad = (_p select 1);
_pos = _pRan modelToWorld [(_p select 0)+_ad,0,0];
_od =((_p select 1)*7);
sleep 0.1;
_p1 = ATLTOASL (_pRan modelToWorld [((_p select 0)+_ad),0,0.3]);
_p2 = ATLTOASL (_pRan modelToWorld [((_p select 0)+_ad+_od),0,0.3]);
sleep 0.1;
while {abs _ad < 6 && {isOnRoad _pos} && {!(lineIntersects [_p1, _p2])}} do {
sleep 0.1;
_p1 = (_pRan modelToWorld [((_p select 0)+_ad),0,0.3]);
sleep 0.1;
_p2 = (_pRan modelToWorld [((_p select 0)+_ad+_od),0,0.3]);
sleep 0.1;
_ad = _ad + (_p select 1);
_pos = _pRan modelToWorld [(_p select 0)+_ad,0,0];
sleep 0.2;
};

sleep 0.1;
if (_ad < 6 && {{_x distance _pos < 20} count _cars == 0} && {!(isOnRoad _pos)} && {_pos distance vehicle player > 25}) then {
if (IEDNUM < 2 && {isNil"VarDisableArty"} && {player CALL SAOKNEARVILRELA == "Hostile"}) then {
_pos SPAWN F_IED;
} else {
_cls = if (isNil"IFENABLED") then {["C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"]} else {["LIB_US_GMC_Tent","LIB_US_GMC_Open","LIB_opelblitz_open_y_camo","LIB_opelblitz_tent_y_camo","LIB_kfz1"]};
_veh = createVehicle [_cls call RETURNRANDOM, [(getposATL player select 0)+1000-(random 2000),(getposATL player select 1)+1000-(random 2000),0], [], 0, "NONE"];
_veh setdir _dir;
_veh setpos _pos;
_veh getvariable ["AmCrate",1];
[_veh,0] SPAWN VehLife;
sleep 0.1;
if !("CivHelp" in (missionnamespace getvariable "Progress")) then {_veh lock true;};
_cars pushBack _veh;
sleep 1;
_veh setpos _pos;
};
};
};
sleep 3;
};
};

{
[_x] SPAWN _masterFunc;
sleep 0.1;
} foreach _cars;

};

