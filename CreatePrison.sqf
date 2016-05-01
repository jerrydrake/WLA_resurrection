_center = _this select 0;
_range = _this select 1;
_f = {
_pos = getposATL _this;
_n = [_pos,direction _this] SPAWN FCRB2b;
deletevehicle _this;
};
_objs = [];
_d = [_center,_range,"Land_Mil_WiredFence_F",0] CALL FUNKTIO_DrawBox;
_objs append _d;
_rW = _objs call RETURNRANDOM;
_wPos = getposATL _rW;
_objs = _objs - [_rW];
_rW CALL _f;

_rW = _objs call RETURNRANDOM;
while {_wPos distance _rW < 40} do {_rW = _objs call RETURNRANDOM;};
_objs = _objs - [_rW];
_rW CALL _f;
_ranFT = "Land_Cargo_Tower_V3_F";
if (!isNil"IFENABLED") then {_ranFT = ["Land_fort_artillery_nest_EP1","land_lib_bunker_gun_l","land_lib_bunker_mg","Land_Ind_IlluminantTower","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_BagBunker_Small_F"] call RETURNRANDOM;};
_obj = createVehicle [_ranFT, _center, [], 0, "CAN_COLLIDE"]; 
_objs = _objs + [_obj];
FORBITTENCEN set [count FORBITTENCEN, _obj];
_obj setvariable ["BArea",_range];

_PowLoc = [];

_dd = 0;
_celP = [(_center select 0)+(sin _dd)*20,(_center select 1)+(cos _dd)*20,0];
_PowLoc set [count _PowLoc, _celP];
_objs =  _objs + (_celP CALL POWcell);
while {_dd < 330} do {
_dd = _dd + 30;
_celP = [(_center select 0)+(sin _dd)*20,(_center select 1)+(cos _dd)*20,0];
_PowLoc set [count _PowLoc, _celP];
_objs = _objs + (_celP CALL POWcell);
};

if (_range > 60) then {
_dd = 0;
_celP = [(_center select 0)+(sin _dd)*40,(_center select 1)+(cos _dd)*40,0];
_PowLoc set [count _PowLoc, _celP];
_objs =  _objs + (_celP CALL POWcell);
while {_dd < 330} do {
_dd = _dd + 30;
_celP = [(_center select 0)+(sin _dd)*40,(_center select 1)+(cos _dd)*40,0];
_PowLoc set [count _PowLoc, _celP];
_objs = _objs + (_celP CALL POWcell);
};
};
missionnamespace setvariable ["PowLoc",_PowLoc];
missionnamespace setvariable ["Pris",_obj];
//(getposATL _obj) SPAWN F_LightSpot;
//(getposATL _obj) SPAWN F_LightSpot;


waitUntil {sleep 10; player distance _center > 2000 && {isNil{_obj getvariable "DontRemove"}}};
FORBITTENCEN = FORBITTENCEN - [_obj];
{_x spawn SAOKDELETE;} foreach _objs;