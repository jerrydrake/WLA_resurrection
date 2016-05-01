private ["_datAr","_rW","_d","_center","_radius","_objectType","_holes","_walls","_start","_cu","_hh","_ff","_ang","_da","_dirO","_obj","_bBox","_p1","_p2","_maxWidth","_degrees","_hos","_funcH","_maxD","_id","_alN"];
_funcH = {
private ["_bBox","_p1","_p2","_maxWidth","_maxLength","_max","_bol"];
_bBox = boundingBoxReal (_this select 0);
_p1 = _bBox select 0;
_p2 = _bBox select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_max = if (_maxWidth > _maxLength) then {_maxWidth} else {_maxLength};
_bol = false;
if ((_this select 1) distance (_this select 0) < _max) then {_bol = true;};
_bol 
};


_rW = {
private ["_ra","_hh","_objectType"];
_ra = [0.5,0.7,0.9,1.0,1.2,1.4] call RETURNRANDOM;
_objectType = ["Land_HBarrier_5_F","Land_HBarrierWall6_F","Land_BagFence_Long_F","Land_BagFence_Long_F","Land_HBarrier_3_F","Land_HBarrierBig_F","Land_HBarrierWall4_F"] call RETURNRANDOM;
if (_objectType == "Land_BagFence_Long_F") then {_hh = -0.3;};
[_objectType,_ra]
};

_cu = 0;
_ff = 1000;
if (count _this > 3 && {typename (_this select 3) == "STRING"}) then {_cu = 1;};

_datAr = [];
_center = _this select 0;
_radius = _this select 1;
_objectType = _this select 2;
_alN = if (count _this > 4) then {_this select 4} else {0};
_hh = 0;
if (_objectType == "Land_BagFence_Long_F") then {_hh = 0;};
_holes = 1;
_walls = [];
_ang = 0;
if (count _this > 3 && {typename (_this select 3) != "STRING"}) then {_ff = (_this select 3);_ang = random 360;_d = 180;};
_d = 0;
if (_objectType in ["Land_HBarrierWall4_F","Land_HBarrierWall6_F"]) then {_d = 180;};
_start = [(_center select 0)+((sin _ang)*_radius),(_center select 1)+((cos _ang)*_radius),_hh];
while {isOnRoad _start && {_ang < 360}} do {_ang = _ang + 10;_start = [(_center select 0)+((sin _ang)*_radius),(_center select 1)+((cos _ang)*_radius),_hh];};
_dirO = ([_start, _center] call SAOKDIRT)+_d;
_obj = createVehicle [_objectType,_start, [], 0, "CAN_COLLIDE"]; 
_ff = _ff - 1;
_walls pushBack _obj;
_obj setdir _dirO;
_bBox = boundingBoxReal _obj;
_p1 = _bBox select 0;
_p2 = _bBox select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_degrees=(atan ((_maxWidth*0.5) / _radius))*2;
_maxD = _ang + 360 - _degrees;
_ang = _ang + _degrees;
while {_ang < _maxD && {_ff > 0}} do {
_ff = _ff - 1;
if (_cu == 1 && {random 1 < 0.1}) then {_da = [] CALL _rW; _objectType = _da select 0; _radius = if (10 < _radius*(_da select 1)) then {_radius*(_da select 1)} else {_radius};
if (_objectType in ["Land_HBarrierWall4_F","Land_HBarrierWall6_F"]) then {_d = 180;} else {_d = 0;};
_dirO = ([_start, _center] call SAOKDIRT)+_d;
_start = [(_center select 0)+((sin _ang)*_radius),(_center select 1)+((cos _ang)*_radius),_hh];
_obj = createVehicle [_objectType,_start, [], 0, "CAN_COLLIDE"]; 
_walls pushBack _obj;
_obj setdir _dirO;
_bBox = boundingBoxReal _obj;
_p1 = _bBox select 0;
_p2 = _bBox select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_degrees=(atan ((_maxWidth*0.5) / _radius))*2;
};

_ang = _ang + _degrees;
if (random 1 < 0.2) then {_ang = _ang + _degrees;};
_start = [(_center select 0)+((sin _ang)*_radius),(_center select 1)+((cos _ang)*_radius),_hh];
_hos = _start nearObjects ["House",20];
if !(isOnRoad _start) then {
_hos = _start nearObjects ["House",20];
if (count _hos == 0) then {
_dirO = ([_start, _center] call SAOKDIRT) +_d;
_id = "N"+(format["%1",((count _datAr) + _alN)]);
_datAr = _datAr + [[_objectType,_start, _dirO, (surfaceNormal _start),_id]];
} else {
if ({[_x,_start] CALL _funcH} count _hos == 0) then {
_dirO = ([_start, _center] call SAOKDIRT) +_d;
_obj = createVehicle [_objectType,_start, [], 0, "CAN_COLLIDE"]; 
_obj setdir _dirO;
_walls pushBack _obj;
};
};

};
};
//while {_holes > 0 && {!(count _this > 3 && {typename (_this select 3) != "STRING"})}} do {_del = _walls call RETURNRANDOM; deletevehicle _del; _holes = _holes - 1;};
[_walls,_datAr]