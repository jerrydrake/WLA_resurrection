_center = _this select 0;
_range = _this select 1;
_f = {
_pos = getposATL _this;
_n = [_pos,direction _this] SPAWN FCRB2b;
deletevehicle _this;
};
_objs = [];
_obAr = ["Land_Mil_WiredFence_F","Land_Shoot_House_Wall_Long_F","Land_Mil_WallBig_4m_F","Land_CncWall4_F"]call RETURNRANDOM;
_d = [_center,_range,_obAr,0] CALL FUNKTIO_DrawBox;
_objs append _d;
_rW = _objs call RETURNRANDOM;
_wPos = getposATL _rW;
_objs = _objs - [_rW];
_rW CALL _f;

_rW = _objs call RETURNRANDOM;
while {_wPos distance _rW < 40} do {_rW = _objs call RETURNRANDOM;};
_objs = _objs - [_rW];
_rW CALL _f;

_obj = createVehicle ["Land_Cargo_House_V1_F", _center, [], 0, "CAN_COLLIDE"]; 
_obj setvariable ["supplyDepot",1];

_vehAr = [];
if (random 1 < 0.5) then {
//ARMED VEH DEPOT
_vehAr = (["VEH",1] CALL VEHARRAY)+(["TANK",1] CALL VEHARRAY);
} else {
//SUPPLY VEH DEPOT
_vehAr = (["SUP",1] CALL VEHARRAY);
};

_f2 = {
private ["_objc","_parkc","_st","_start","_obj"];
_parkc = _this select 2;
_objc = _parkc call RETURNRANDOM;
_start = _this select 0;
if (typename _start != "ARRAY" || {surfaceiswater _start}) then {_start = _this select 0;};
_obj = createVehicle [_objc,_start, [], 0, "NONE"]; 
_obj setpos _start;
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setdir (_this select 1);
AddIdVeh pushback _obj;
};
{
_pos = [(_center select 0) + (sin _x)*20,(_center select 1) + (cos _x)*20,0];
if (true) then {
_n = [_pos,random 360,_vehAr] SPAWN _f2;
};
} foreach [0,90,180,270];


[_obj,""] CALL GUARDPOST;
_obj allowdamage false;
_obj setvariable ["StaticW",[]];
//SET TRUE LATER "Land_Cargo_Tower_V3_F" createVehicle ["Land_Cargo_Tower_V3_F", getposATL player, [], 0, "CAN_COLLIDE"];
_obj setvariable ["StaticO",[]];
_obj setvariable ["StaticOS",[]];
_obj setvariable ["NotReady",1];
_post = _obj;
{
_class = typeof _x;
_earlier = _post getvariable "StaticO";
_id = "N"+(format["%1",count _earlier]);
_p = getposATL _x;
_wTm = _x worldToModel _p;
_wTm set [2,0];
_p = [(_p select 0)+(_wTm select 0),(_p select 1)+(_wTm select 1),0];
_post setvariable ["StaticO",_earlier + [[_class,_p, direction _x, (surfaceNormal (getposATL _x)),_id]]];
_x spawn SAOKDELETE;
} foreach _objs;

_ran = ["AA-Guard","AT-Guard"] call RETURNRANDOM;
{
_post setvariable [_x,1];
} foreach ["MG-Guard",_ran,"Sniper-Guard","Medic-Guard"];
_post setvariable ["NotReady",nil];
if (player distance _post < (["Lb"] CALL DIS)) then {sleep 0.1;_post CALL SAOKCONSRESETOBJ;};

/*
waitUntil {sleep 10; player distance _center > 2000 && {isNil{_obj getvariable "DontRemove"}}};
{_x spawn SAOKDELETE;} foreach _objs;
*/