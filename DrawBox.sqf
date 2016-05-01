private ["_center","_radius","_objectType","_holes","_corner1","_corner2","_corner3","_corner4","_walls","_data","_n","_size","_ang","_dir"];
_center = _this select 0;
_radius = _this select 1;
_objectType = _this select 2;
_holes = 1;
_ang = if (count _this > 3 && {typename (_this select 3) == "SCALAR"}) then {_this select 3} else {random 90};
_dir = _ang;
_corner1 = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_corner2 = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_corner3 = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_corner4 = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_walls = [];
_n = 0;
if (_holes > 0) then {_n = 1; _holes = _holes - 1;};
/*
_data = [_corner1 ,_corner2,_objectType,_n] CALL FUNKTIO_DrawFence;
_walls = _walls + (_data select 0);
*/
_fsm = [_corner1 ,_corner2,_objectType,_n] execFSM "DrawFence.fsm";
waitUntil {count (_fsm getFSMVariable "_ww") > 0};
_wals = + (_fsm getFSMVariable "_ww");
_fsm setFSMVariable ["_ww", []];
_walls = _walls + (_wals select 0);
_data = [1,_wals select 1];
_n = 0;
if (_holes > 0) then {_n = 1; _holes = _holes - 1;};
if (count (_data select 1) > 0 && {(_data select 1) distance _center < (_radius*3)}) then {_corner2 = (_data select 1);};
/*
_data = [_corner2 ,_corner3,_objectType,_n] CALL FUNKTIO_DrawFence;
_walls = _walls + (_data select 0);
*/
_fsm = [_corner2 ,_corner3,_objectType,_n] execFSM "DrawFence.fsm";
waitUntil {count (_fsm getFSMVariable "_ww") > 0};
_wals = + (_fsm getFSMVariable "_ww");
_fsm setFSMVariable ["_ww", []];
_walls = _walls + (_wals select 0);
_data = [1,_wals select 1];
_n = 0;
if (count _this > 3 && {typename (_this select 3) == "STRING"}) then {_objectType = ["Land_HBarrierWall_corridor_F","Land_Cargo20_military_green_F","Land_Razorwire_F","Land_HBarrier_5_F","Land_HBarrierWall6_F","Land_BagFence_Long_F","Land_BagFence_Long_F","Land_HBarrier_3_F","Land_HBarrierBig_F","Land_HBarrierWall4_F"] call RETURNRANDOM;};
if (_holes > 0) then {_n = 1; _holes = _holes - 1;};
if (count (_data select 1) > 0 && {(_data select 1) distance _center < (_radius*3)}) then {_corner3 = (_data select 1);};
/*
_data = [_corner3 ,_corner4,_objectType,_n] CALL FUNKTIO_DrawFence;
_walls = _walls + (_data select 0);
*/
_fsm = [_corner3 ,_corner4,_objectType,_n] execFSM "DrawFence.fsm";
waitUntil {count (_fsm getFSMVariable "_ww") > 0};
_wals = + (_fsm getFSMVariable "_ww");
_fsm setFSMVariable ["_ww", []];
_walls = _walls + (_wals select 0);
_data = [1,_wals select 1];
_n = 0;
if (_holes > 0) then {_n = 1; _holes = _holes - 1;};
if (count (_data select 1) > 0 && {(_data select 1) distance _center < (_radius*3)}) then {_corner4 = (_data select 1);};
/*
_data = [_corner4 ,_corner1,_objectType,_n] CALL FUNKTIO_DrawFence;
_walls = _walls + (_data select 0);
*/
_fsm = [_corner4 ,_corner1,_objectType,_n] execFSM "DrawFence.fsm";
waitUntil {count (_fsm getFSMVariable "_ww") > 0};
_wals = + (_fsm getFSMVariable "_ww");
_fsm setFSMVariable ["_ww", []];
_walls = _walls + (_wals select 0);
_data = [1,_wals select 1];

if (count _this > 3 && {typename (_this select 3) == "STRING"}) then {
		_size = [0,1,2,3,4,5] call RETURNRANDOM;
		for "_i" from 0 to _size do {
		deletevehicle (_walls call RETURNRANDOM);
		};
};
_walls