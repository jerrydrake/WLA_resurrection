private ["_LL","_mL","_dd","_f","_forEachIndex","_y","_maxCiv","_d"];
_f = {
private ["_bLar","_ff","_dd","_pos","_ran","_group","_array","_c","_waypoints","_building","_sHou","_pO","_hP"];
_bLar = ["Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Pier_F","Land_nav_pier_m_F","Land_Cargo_HQ_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_House_V1_F"];
_pO = getposATL player;
_dd = (["C"] CALL DIS);
_sHou = [(_pO select 0)+_dd-(random _dd)*2, (_pO select 1)+_dd-(random _dd)*2, 0];
_building = nearestBuilding _sHou;
_waypoints = _building call SAOKBUILDINGPOS;
_hP = (getposATL _building);
sleep 0.1;
_ff = {
private ["_bol","_pos","_nG","_nCb","_nCr"];
_bol = true;
_pos = getposATL _this;
_nG = [_pos] CALL RETURNGUARDPOST;
_nCb = locationposition (["ColorBlue",_pos] CALL NEARESTCAMP);
_nCr = locationposition (["ColorRed",_pos] CALL NEARESTCAMP);
if (_nG distance _pos < 50 || {_nCr distance _pos < 120} || {_nCb distance _pos < 120}) then {_bol = false;};
_bol
};
sleep 0.1;
if (count _waypoints > 0 && {player distance _hP > 30} && {_building CALL _ff} && {count (_hP nearEntities [["Civilian"], 10]) < 3} &&  {!(typeOf _building in _bLar)}) then {
sleep 0.1;
_pos = _building buildingPos (_waypoints call RETURNRANDOM);
if (_pos CALL IGPOS && {count (_pos nearEntities [["Civilian"], 2]) == 0}) then {
_ran = CIVS1 call RETURNRANDOM;
_group = [[1000,1000,0], CIVILIAN, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
leader _group setpos _pos;
_group setbehaviour "SAFE";
leader _group setdir (random 360);
rCiv pushBack (leader _group);
};
};
};


rCiv = [];
while {true} do {
sleep 3;
_mL = MULTLIFE+1;
_LL = 16*_mL;
if (count rCiv > _LL) then {
{if (count rCiv > _LL) then {rCiv = rCiv - [_x]; _x spawn SAOKDELETE;};sleep 0.1;} foreach rCiv;
};
{if (isNull _x) exitWith {rCiv = rCiv - [_x];};sleep 0.1;} foreach rCiv;
{if (isNil"_x") exitWith {_deAT = rCiv deleteAt _forEachIndex;};sleep 0.1;} foreach rCiv;
_dd = (["C"] CALL DIS)*1.5;
{_y = _x; if ({_y distance vehicle _x < _dd} count [player] == 0) then {_x removeAllEventHandlers "Killed";rCiv = rCiv - [_x];_x spawn SAOKDELETE;};sleep 0.1;} foreach rCiv;
_maxCiv = _LL;
if (!([] CALL FPSGOOD) || {{vehicle _x != _x} count [player] == 0}) then {_maxCiv = 7;};

if ({typeof _x iskindof "CIVILIAN"} count allUnits < _maxCiv) then {
_d = [] SPAWN _f;
waitUntil {sleep 1; scriptdone _d};
};
sleep 4;
};




