private ["_center","_obj","_walls","_start","_di","_l"];
_walls = [];
_center = _this;
_l = 3;
_start = [(_center select 0)+_l,(_center select 1)+_l,0];
_obj = createVehicle ["Land_Mil_WiredFence_F",_start, [], 0, "CAN_COLLIDE"]; 
_di= [_center, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
_obj setvectorup (surfaceNormal (getposATL _obj));
_walls = _walls + [_obj];

_start = [(_center select 0)-_l,(_center select 1)+_l,0];
_obj = createVehicle ["Land_Mil_WiredFence_F",_start, [], 0, "CAN_COLLIDE"]; 
_di= [_center, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
_obj setvectorup (surfaceNormal (getposATL _obj));
_walls = _walls + [_obj];

_start = [(_center select 0)-_l,(_center select 1)-_l,0];
_obj = createVehicle ["Land_Mil_WiredFence_F",_start, [], 0, "CAN_COLLIDE"]; 
_di= [_center, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
_obj setvectorup (surfaceNormal (getposATL _obj));
_walls = _walls + [_obj];

_start = [(_center select 0)+_l,(_center select 1)-_l,0];
_obj = createVehicle ["Land_Mil_WiredFence_F",_start, [], 0, "CAN_COLLIDE"]; 
_di= [_center, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
_obj setvectorup (surfaceNormal (getposATL _obj));
_walls = _walls + [_obj];

_start = [(_center select 0)+1.5,(_center select 1)-2.5,0];
_obj = createVehicle ["Land_WoodenBox_F",_start, [], 0, "CAN_COLLIDE"]; 
_di= [_center, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
[_obj,0] SPAWN VehLife;
_obj setvectorup (surfaceNormal (getposATL _obj));
_walls = _walls + [_obj];

_start = [(_center select 0)+2.5,(_center select 1)+1.5,0];
_obj = createVehicle ["Land_Bench_F",_start, [], 0, "CAN_COLLIDE"]; 
_di= [_center, getposATL _obj] call SAOKDIRT;
_obj setdir (_di+90);
[_obj,0] SPAWN VehLife;
_obj setvectorup (surfaceNormal (getposATL _obj));
_walls = _walls + [_obj];

_start = [(_center select 0)-2.5,(_center select 1)-2,0];
_obj = createVehicle ["Land_Bucket_clean_F",_start, [], 0, "CAN_COLLIDE"]; 
_di= [_center, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
[_obj,0] SPAWN VehLife;
_obj setvectorup (surfaceNormal (getposATL _obj));
_walls = _walls + [_obj];

_walls