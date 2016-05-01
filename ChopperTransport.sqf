private ["_start","_LZ","_infwaypoint","_side","_dir","_chopclass","_unitclasses","_skill","_startC","_chop","_groupCT","_nul","_start2","_Lpos","_normal2","_obj","_h","_wp1","_random","_max","_d"];
//INIT
//Chopper or Plane spawn position and exit
_start = _this select 0;
//Position were infantry cargo eject
_LZ = _this select 1;
//Position were infantry head before guarding it
_infwaypoint = _this select 2;
//Chopper and infatry side
_side = _this select 3;
//Chopper or Plane direction when spawned
_dir = _this select 4;
//Chopper or Plane class
_chopclass = _this select 5;
//Chopper or Plane height when spawned. For Chopper must be under 100m (50 is good), because of the current buggy AI flying
_h = _this select 6;
//Array of unitclasses that form the infantry group. Size of the group is the amount of classes you enter
_unitclasses = _this select 7;
//Array skill range for infantry group e.g. [0.4,0.7]
_skill = _this select 8;
//Transport only one group (0) or bring more cloned inf until shot down (1). DISABLED!!!!!!!!  
//_num = _this select 9;

[[_start],"mil_arrow","ColorRed",([_start, _LZ] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;

_startC = [_start select 0, _start select 1, _h];
_chop = [_startC, _dir, _chopclass, _side] call SPAWNVEHICLE;
_groupCT = [_start, _side, _unitclasses,[],[],_skill] call SpawnGroupCustom;
DONTDELGROUPS pushback groupCT;
{_x moveincargo (_chop select 0);} foreach units _groupCT;
(_chop select 2) move _LZ;
(_chop select 2) setbehaviour "CARELESS";
(_chop select 2) allowfleeing 0;
_wp1= _groupCT addWaypoint [_infwaypoint, 0]; 
[_groupCT, 1] setWaypointType "GUARD";
(_chop select 0) flyinheight 80;
Pgroups pushback _groupCT;
_random = [1,1,1,1,2,2,2,2,2,2] call RETURNRANDOM; 
switch (_random) do {
//PARADROP
case 1: {
waitUntil {sleep 2; isNil"_chop" || {isNil"_groupCT"} || {isNull (_chop select 0)} || {(_chop select 0) distance _LZ < 350} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))} || {(getposATL (_chop select 0) select 2) < 1} || {{alive _x} count crew (_chop select 0) == 0}};
//CHOP DOWN
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
if !((_chop select 0) distance _LZ < 350) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};{_nul = [_x] SPAWN SAOKSHF18;} foreach (units (_chop select 2));{if (vehicle _x == (_chop select 0)) then {  _x action ["Eject",vehicle _x];unassignvehicle _x;};} foreach units _groupCT;DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
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
[[_LZ],"hd_warning","ColorRed"] SPAWN SAOKCREATEMARKER;
sleep 5;
(_chop select 2) move _start;
waitUntil {sleep 3; isNil"_chop" || {isNil"_groupCT"}  || {isNull (_chop select 0)} || {(_chop select 0) distance _start < 300} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))} || {(getposATL (_chop select 0) select 2) < 1} || {{alive _x} count crew (_chop select 0) == 0}};
//CHOP DOWN
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
if !((_chop select 0) distance _start < 300) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};{_nul = [_x] SPAWN SAOKSHF18;} foreach (units (_chop select 2));{if (vehicle _x == (_chop select 0)) then {  _x action ["Eject",vehicle _x];unassignvehicle _x;};} foreach units _groupCT;DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
//ELSE NEAR START -> DELETE
{_x spawn SAOKDELETE;} foreach (units (_chop select 2)) + [(_chop select 0)];
DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];
};
//LAND
case 2: {
waitUntil {sleep 2; isNil"_chop" || {isNil"_groupCT"} || {isNull (_chop select 0)} || {(_chop select 0) distance _LZ < 700} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))}  || {{alive _x} count crew (_chop select 0) == 0}};
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
if !((_chop select 0) distance _LZ < 700) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};{_nul = [_x] SPAWN SAOKSHF18;} foreach (units (_chop select 2));{if (vehicle _x == (_chop select 0)) then {  _x action ["Eject",vehicle _x];unassignvehicle _x;};} foreach units _groupCT;DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
//CREATE PAD
_start2 = [_LZ,500,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
_d = 600;
_max = 0; 
while {(!([_start2,10] call SAOKISFLAT) || {[_start2, _chopclass] CALL SAOKTAKENBOX}) && {_max < 10}} do {
_max = _max + 1;  
sleep 0.5;
_d = _d + 200;
_start2 = [_LZ,_d,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
};
[[_start2],"hd_warning","ColorRed"] SPAWN SAOKCREATEMARKER;
_obj = createVehicle ["Land_HelipadEmpty_F",_start2, [], 0, "NONE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
(_chop select 2) move (getposATL _obj);
waitUntil {sleep 1; isNil"_chop" || {isNil"_groupCT"} || {isNull (_chop select 0)} || {unitready leader (_chop select 2)}|| {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))}  || {{alive _x} count crew (_chop select 0) == 0}};
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
if !((_chop select 0) distance _LZ < 700) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};{_nul = [_x] SPAWN SAOKSHF18;} foreach (units (_chop select 2));{if (vehicle _x == (_chop select 0)) then {  _x action ["Eject",vehicle _x];unassignvehicle _x;};} foreach units _groupCT;DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
//LAND
(_chop select 0) land "GET IN";
waitUntil {sleep 2; isNil"_chop" || {isNil"_groupCT"}  || {isNull (_chop select 0)} || {(getposATL (_chop select 0) select 2) < 1}};
if (isNil"_chop" || {isNil"_groupCT"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];};
//LANDED 
{
if (vehicle _x == (_chop select 0)) then { 
 _x action ["Eject",vehicle _x];unassignvehicle _x;_x action ["GetOut",vehicle _x];
};
} foreach units _groupCT;

if ( typeof (_chop select 0) in ["Mi17_TK_EP1","UH1H_TK_EP1","Mi17_TK_2035"]) then {
_nul = [(_chop select 2),(60+(random 120)),1,_groupCT] SPAWN FSlowChopperSupportE;
} else {
_nul = [(_chop select 2),0,0,_groupCT] SPAWN FSlowChopperSupportE;
};
deletevehicle _obj;
DONTDELGROUPS = DONTDELGROUPS -  [_groupCT];

};
};