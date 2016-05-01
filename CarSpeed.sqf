//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////


private ["_c","_pos2","_i","_gu","_dr","_group","_car","_pos","_num","_boo"];
_group = _this select 0;
_car = _this select 1;
_pos = _this select 2;
_num = _this select 3;
_boo = _this select 4;
_dr= driver _car;
_gu= gunner _car;
_i = 0;
_pos2 = getposATL _car;
while {!(isnull _car) && {!(player in _car)} &&{(alive _car)} && {isNil{_car getvariable "EndS"}}} do {
//car stucked?
if (_i > 45 && {(_car distance _pos2 < 5)}) then {
	_c = count units _group;
	if (_c > 0) then {
		{unassignvehicle _x;_x action ["GetOut",vehicle _x]; [_x] join _group;} foreach [_dr,_gu];
		} else {
		{unassignvehicle _x;_x action ["GetOut",vehicle _x];} foreach [_dr,_gu];	
	};		
} else {_pos2 = getposATL _car; _i = 0;};	
//speed change to keep car and infantry together	
if (((leader _group distance _pos) - (_car distance _pos)) < -10) then {_car forcespeed 5;} else {_car forcespeed 2;};
//additional behaviour
if (_boo) then {
if (alive _gu) then {} else {
	_c = count units _group;
	if (alive _car && {alive _dr} && {_c > 2}) then {_gu = (units _group) select (_c - 1);[_gu] join group _dr;_gu assignasgunner _car; _gu setspeedmode "FULL";};
	if (!(alive _car) && {alive _dr}) then {[_dr] join _group;};
	if (alive _car && {alive _dr} && {_c == 1}) then {unassignvehicle _dr; [_dr] join _group; _car setvariable ["EndS",1];};
	if (alive _car && {alive _dr} && {_c == 0}) then {unassignvehicle _dr; _dr assignasgunner _car; _dr setspeedmode "FULL"; sleep 120;unassignvehicle _dr; _dr setspeedmode "NORMAL";  _car setvariable ["EndS",1];};
};
if (alive _dr) then {} else {
	_c = count units _group;
	if (alive _car && {alive _gu} && {_c > 2}) then {_dr = (units _group) select (_c - 1);[_dr] join group _gu;_dr assignasdriver _car; _dr setspeedmode "FULL";};
	if (!(alive _car) && {alive _gu}) then {[_gu] join _group;};
	if (alive _car && {alive _gu} && {_c == 1}) then {unassignvehicle _gu; [_gu] join _group; _car setvariable ["EndS",1];};
	if (alive _car && {alive _gu} && {_c == 0}) then {sleep 120;unassignvehicle _gu; _car setvariable ["EndS",1];};	
};
};
sleep 1;
_i = _i + 1;
};
_car forcespeed -1;