SAOKSHF1 = {
private ["_nul"];
sleep (10+random 20);
if (!surfaceiswater _this && {([_this] CALL RETURNGUARDPOST) distance _this > 500} && {[_this,20] CALL SAOKISFLAT} && {!(_this call SAOKONRUNWAY)}) then {_nul = [_this,"",(15+random 25)] SPAWN CreateRoadBlock;};
};

SAOKSHF2 = {
private ["_r"];
_r = ["Alarm","Alarm_OPFOR"] call RETURNRANDOM;
for "_i" from 0 to 6 do {
(nearestBuilding (_this select 0)) say3d _r;
sleep 10;
};
};

SAOKSHF3 = {
private ["_ty","_tex","_nul"];
_ty = _this select 1;
waitUntil {sleep 5; isNull (_this select 0) || {((getposATL (_this select 0)) select 2) < 3}};
if (!(isNull (_this select 0))) then {
_tex = "Alarmed CSAT "+ _ty +" was disabled";
["ScoreAdded",[_tex,30]] call SAOKNOTIFI;
pisteet = pisteet + 100;
_tex = "CSAT "+ _ty +" was disabled";
_nul = [100, _tex] SPAWN PRESTIGECHANGE;
};
}; 

SAOKSHF4 = {
private ["_unit"];
_unit = _this select 0;
waituntil {sleep 5; vehicle player distance _unit > 150 && {!([_unit,player] CALL FUNKTIO_LOS)}};
deletevehicle _unit;
};

SAOKSHF7 = {
	if (isNil"_this") exitWith {};
	while {!isNull _this} do {  
	waitUntil {sleep 1; isNull _this || {{player in crew _x || {(count crew _x > 0 && {side (driver _x) in [CIVILIAN, WEST]})}} count ((getposATL _this) nearEntities [["Car"],30]) > 0}};  
	_this animate ["Door_1_rot", 1];  
	waitUntil {sleep 1; isNull _this || {{player in crew _x  ||{(count crew _x > 0 && {side (driver _x) in [CIVILIAN, WEST]})}} count ((getposATL _this) nearEntities [["Car"],30]) == 0}}; 
	_this animate ["Door_1_rot", 0];  
	};    
};

SAOKSHF8 = {
private ["_ar"];
if (isNil"_this") exitWith {};
	_ar = _this getvariable "PassSide";
	while {!isNull _this} do {  
	waitUntil {sleep 1; isNull _this || {{(count crew _x > 0 && {side (driver _x) in _ar})} count ((getposATL _this) nearEntities [["Car"],30]) > 0}};  
	_this animate ["Door_1_rot", 1];  
	waitUntil {sleep 1; isNull _this || {{(count crew _x > 0 && {side (driver _x) in _ar})} count ((getposATL _this) nearEntities [["Car"],30]) == 0}}; 
	_this animate ["Door_1_rot", 0];  
};  
};

SAOKSHF9 = {
private ["_g","_s","_p","_u"];
_u = _this select 0;
_s = "";
{if (alive leader _x) exitWith {_s = leader _x;};} foreach _u;
if (typename _s == "STRING") exitWith {};
_g = group leader ((_this select 0) select 0);
while {{alive _x} count _u > 0} do {
_p = getposATL vehicle _s;
_p set [2,0];
if (_p distance [0,0,0] > 100) then {
(_this select 1) setposition _p;
};
sleep 0.3;
_s = "";
{if (alive leader _x) exitWith {_s = leader _x;};} foreach _u;
if (typename _s == "STRING") exitWith {};
};
};

SAOKSHF10 = { 
if ({_x in (crew _this)} count (units (group player)) == 0) then {
deletevehicle _this;
} else {CARS pushBack _this;};
};

SAOKSHF11 = {if (vehicle player distance _this < 600) then {waitUntil {sleep 10; vehicle player distance _this > 600};}; deletevehicle _this;};

SAOKSHF12 = {
sleep 120; 
if (_this in AAsM) then {
AAsM = AAsM - [_this];
}; 
VEHZONESA = VEHZONESA - [_this]; VEHZONES = VEHZONES - [_this];missionnamespace setvariable [(_this getvariable "IDCODE"),nil];_this call resFexit;deletelocation _this;
};

SAOKSHF13 = {
while {{(_this select 0) == _x select 1} count RESERVEAMARKS > 0} do {
((_this select 0)+"a") setmarkerpos (locationposition (_this select 1));
(_this select 0) setmarkerpos (locationposition (_this select 1));
sleep 1;
};
};

SAOKSHF14 = {
private ["_aika"];
_aika = time + 15;
if (isNil{_this getvariable "VZ"}) exitWith {};
waitUntil {sleep 0.1; _aika < time || {locationposition _this distance [0,0,0] > 40}};
if (_aika < time) then {
_this CALL SAOKZONED;
_this CALL SAOKZONEG;
VEHZONES = VEHZONES - [_this];
VEHZONESA = VEHZONESA - [_this];
if (typename (_this getvariable "IDCODE") == "STRING") then {
missionnamespace setvariable [(_this getvariable "IDCODE"),nil];
};
_this call resFexit;deletelocation _this;
};
};

SAOKSHF15 = {
private ["_ra","_pos","_roads","_Rpos","_n","_mP","_mC"];
_m = _this getvariable "Marker";
_mP = getmarkerpos _m;
_mC = getmarkercolor _m;
if (_mC == "ColorBlue") then {
if ({!isNil{(_x getvariable "Post") getvariable "IsRoadBlock"}} count (nearestLocations [_mp, ["PostG"], 4000]) == 0) then {
_ra = 800;
_pos = [(_mP select 0)+_ra-(random _ra)*2,(_mP select 1)+_ra-(random _ra)*2,0];
_roads = (_pos nearroads 100); 
while {count _roads == 0} do {
sleep 0.1;
_ra = _ra + 40;
_pos = [(_mP select 0)+_ra-(random _ra)*2,(_mP select 1)+_ra-(random _ra)*2,0];
_roads = (_pos nearroads 100); 
};
_Rpos = getposATL (_roads call RETURNRANDOM);
_n = [_Rpos] SPAWN F_GREENROADBLOCK;
};
};
};

SAOKSHF16 = {sleep 10;[_this,0] SPAWN VehLife;waitUntil {sleep 2; isNull _this || {count crew _this > 0}};if (!isNull _this) then {[_this,1] SPAWN VehLife;};};

SAOKSHF17 = {
private ["_unit"];
_unit = _this select 0;
if (vehicle _unit != _unit) then {_unit action ["Eject", vehicle _unit];unassignvehicle _unit;_unit action ["GetOut",vehicle _unit];};
sleep 3;
deletevehicle _unit;
};

SAOKSHF18 = {
private ["_unit"];
_unit = _this select 0;
sleep 60;
waituntil {sleep 10; isNull _unit || {vehicle player distance _unit > 700}};
deletevehicle _unit;
};

SAOKSHF19 = {
private ["_chop","_groupCT","_LZ","_start","_chopclass","_nul","_max","_d","_start2","_obj","_random","_xx","_c"];
_chop = _this select 0;
_groupCT = _this select 1;
_LZ = _this select 2;
_start = _this select 3;
[_start,"mil_arrow","ColorBlue",([_start, _LZ] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
_chopclass = _this select 4;
_random = [1,1,1,1,2,2,2,2,2,2] call RETURNRANDOM; 
switch (_random) do {
//PARADROP
case 1: {
[_LZ,"hd_start","ColorBlue",0," DropPoint"] SPAWN SAOKCREATEMARKER;
waitUntil {sleep 2; isNil"_chop" || {isNil"_groupCT"} || {isNull (_chop select 0)} || {(_chop select 0) distance _LZ < 350} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))} || {(getposATL (_chop select 0) select 2) < 1} || {{alive _x} count crew (_chop select 0) == 0}};
//CHOP DOWN
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
if !((_chop select 0) distance _LZ < 350) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};{_nul = [_x] SPAWN SAOKSHF18;} foreach (units (_chop select 2));{if (vehicle _x == (_chop select 0)) then {  _x action ["Eject",vehicle _x];unassignvehicle _x;};} foreach units _groupCT;DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];CantCommand = CantCommand - [_chop select 2];if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};FriendlyInf set [count FriendlyInf,_groupCT];};
//ELSE NEAR LZ -> JUMP
_c = count units _groupCT - 1;
if (_c >= 0) then {
for "_i" from 0 to _c do {
_xx = (units _groupCT) select _i;
if (!isNil"_xx" && {vehicle _xx == (_chop select 0)}) then { 
_nul = [_xx,vehicle _xx] SPAWN SAOKEJECT;
};
sleep (1 + random 0.5);
};
};
FriendlyInf set [count FriendlyInf,_groupCT];
sleep 5;
(_chop select 2) move _start;
waitUntil {sleep 3; isNil"_chop" || {isNil"_groupCT"} || {isNull (_chop select 0)} || {(_chop select 0) distance _start < 300} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))} || {(getposATL (_chop select 0) select 2) < 1} || {{alive _x} count crew (_chop select 0) == 0}};
//CHOP DOWN
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
if !((_chop select 0) distance _start < 300) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};{_nul = [_x] SPAWN SAOKSHF18;} foreach (units (_chop select 2));{if (vehicle _x == (_chop select 0)) then {  _x action ["Eject",vehicle _x];unassignvehicle _x;};} foreach units _groupCT;DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];CantCommand = CantCommand - [_chop select 2];if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};FriendlyInf set [count FriendlyInf,_groupCT];};
//ELSE NEAR START -> DELETE
{_x spawn SAOKDELETE;} foreach (units (_chop select 2)) + [(_chop select 0)];
DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];
};
//LAND
case 2: {
[_LZ,"hd_start","ColorBlue",0," LZ"] SPAWN SAOKCREATEMARKER;
waitUntil {sleep 2; isNil"_chop" || {isNil"_groupCT"} || {isNull (_chop select 0)} || {(_chop select 0) distance _LZ < 700} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))}  || {{alive _x} count crew (_chop select 0) == 0}};
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
if !((_chop select 0) distance _LZ < 700) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};{_nul = [_x] SPAWN SAOKSHF18;} foreach (units (_chop select 2));{if (vehicle _x == (_chop select 0)) then {  _x action ["Eject",vehicle _x];unassignvehicle _x;};} foreach units _groupCT;DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];CantCommand = CantCommand - [_chop select 2];if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};FriendlyInf set [count FriendlyInf,_groupCT];};
//CREATE PAD
_start2 = [_LZ,500,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
_d = 600;
_max = 0; 
while {(!([_start2,10] call SAOKISFLAT) || {[_start2, _chopclass] CALL SAOKTAKENBOX}) && {_max < 20}} do {
_max = _max + 1;  
sleep 2;
_d = _d + 200;
_start2 = [_LZ,_d,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
};
_obj = createVehicle ["Land_HelipadEmpty_F",_start2, [], 0, "NONE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
(_chop select 2) move (getposATL _obj);
waitUntil {sleep 1; isNil"_chop" || {isNil"_groupCT"} || {isNull (_chop select 0)} || {unitready leader (_chop select 2)}|| {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))}  || {{alive _x} count crew (_chop select 0) == 0}};
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];_nul = [(_chop select 2),0,0,(_chop select 2)] SPAWN FSlowChopperSupportF;};
if !((_chop select 0) distance _LZ < 700) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};{_nul = [_x] SPAWN SAOKSHF18;} foreach (units (_chop select 2));{if (vehicle _x == (_chop select 0)) then { _x action ["Eject",vehicle _x];unassignvehicle _x;};} foreach units _groupCT;DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];CantCommand = CantCommand - [_chop select 2];if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};FriendlyInf set [count FriendlyInf,_groupCT];};
//LAND
(_chop select 0) land "GET IN";
waitUntil {sleep 2; isNil"_chop" || {isNil"_groupCT"} || {isNull (_chop select 0)} || {(getposATL (_chop select 0) select 2) < 1}};
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];_nul = [(_chop select 2),0,0,(_chop select 2)] SPAWN FSlowChopperSupportF;};
//LANDED 
{
if (vehicle _x == (_chop select 0)) then { 
 _x action ["Eject",vehicle _x];unassignvehicle _x;_x action ["GetOut",vehicle _x];
};
} foreach units _groupCT;
deletevehicle _obj;
FriendlyInf set [count FriendlyInf,_groupCT];
if ( typeof (_chop select 0) in ["MH60S","UH1Y","UH60M_EP1"]) then {
_nul = [(_chop select 2),(60+(random 120)),1,_groupCT] SPAWN FSlowChopperSupportF;
} else {
_nul = [(_chop select 2),0,0,_groupCT] SPAWN FSlowChopperSupportF;
};
DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];
};
};
};

SAOKSHF20 = {
private ["_unit"];
_unit = _this select 0;
sleep 60;
waituntil {sleep 10; isNull _unit || {vehicle player distance _unit > 700}};
deletevehicle _unit;
};

SAOKSHF21 = {
private ["_group","_carg"];
_group = _this select 0;
_carg = _this select 1;
waituntil {sleep 1; isNull _group || {isNull _carg} || {behaviour leader _carg == "COMBAT"} || {behaviour leader _group  == "COMBAT"}}; 
if (!isNull _group && !isNull _carg) then {
vehicle (leader _carg) forcespeed 0;
{unassignvehicle _x; [_x] ordergetin false;_x action ["GetOut",vehicle _x];} foreach units _group;
sleep 4;
vehicle (leader _carg) forcespeed -1;
};
};

SAOKSHF22 = {
private ["_group","_carg","_nul"];
_group = _this select 0;
_carg = _this select 1;
waituntil {sleep 1; behaviour leader _carg == "COMBAT" || {isNull _group} || {isNull _carg}}; 
{unassignvehicle _x; [_x] ordergetin false;_x action ["GetOut",vehicle _x];} foreach units _group;
if (!isNull _carg) then {
_nul = [_carg, getmarkerpos "Zone11",0] SPAWN FUNKTIO_MAD;
};
};

SAOKSHF23 = {
		private ["_unit","_pos","_b","_num","_bis_crows","_forEachIndex"];
		_unit = (_this select 0);
		_pos = getposATL _unit;
		_num = 2 + floor(random 2);
		_b = {_pos distance _x < 0.20} count CROWCOUNT; 
		if (_b == 0) then {
		CROWCOUNT pushBack _pos;
		_bis_crows = [_unit,20,_num,20] CALL FUNKTIO_CROW;
		while {((vehicle player) distance _pos < 400) && {{isnull _x} count _bis_crows == 0}} do {sleep 5;};
		{if (!isnull _x) then {_x spawn SAOKDELETE;};sleep 0.01;} foreach _bis_crows;
			{if (isNil"_x" || {typename _x != "ARRAY"} || {_x distance _pos < 10}) exitWith {_deAT = CROWCOUNT deleteAt _forEachIndex;};sleep 0.01;} foreach CROWCOUNT;
		};
	};
	
SAOKSHF24 = {
		private ["_unit","_pos","_b","_num","_bis_crows","_forEachIndex"];
		_unit = _this select 0;
		_pos = getposATL _unit;
		_num = 3 + floor(random 3);
		_b = {_pos distance _x < 0.5} count FLYCOUNT; 
		if (_b == 0) then {
		FLYCOUNT pushBack _pos;
		_bis_crows = [_unit,(1+random 1.4),_num] CALL FUNKTIO_FLIES;
		while {((vehicle player) distance _pos < 100) && {{isnull _x} count _bis_crows == 0}} do {sleep 5;};
		{if (!isnull _x) then {_x spawn SAOKDELETE;};sleep 0.01;} foreach _bis_crows;
			{if (isNil"_x" || {typename _x != "ARRAY"} || {_x distance _pos < 10}) exitWith {_deAT = FLYCOUNT deleteAt _forEachIndex;};sleep 0.01;} foreach FLYCOUNT;
		};
};

SAOKSHF25 = {
	sleep 30; waituntil {sleep 15; isNull (_this select 0) || {vehicle player distance (_this select 0) > 500}}; if (!isNull (_this select 0)) then {[(_this select 0)] SPAWN FUNKTIO_DELUNIT;};
};


