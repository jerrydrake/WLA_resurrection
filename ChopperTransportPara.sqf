//INIT
//Chopper or Plane spawn position and exit

private ["_nul","_start","_LZ","_side","_dir","_chopclass","_h","_groupCTP","_startC","_chop"];
_start = _this select 0;
//Position were infantry cargo eject
_LZ = _this select 1;
//Chopper and infatry side
_side = _this select 2;
//Chopper or Plane direction when spawned
_dir = _this select 3;
//Chopper or Plane class
_chopclass = _this select 4;
//Chopper or Plane height when spawned. For Chopper must be under 100m (50 is good), because of the current buggy AI flying
_h = _this select 5;
//Array of unitclasses that form the infantry group. Size of the group is the amount of classes you enter
_groupCTP = _this select 6;
if (_side == EAST) then {[[_start],"mil_arrow","ColorRed",([_start, _LZ] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;};

_startC = [_start select 0, _start select 1, _h];
_chop = [_startC, _dir, _chopclass, _side] call SPAWNVEHICLE;

DONTDELGROUPS pushback _groupCTP;
{_x moveincargo (_chop select 0);} foreach units _groupCTP;
(_chop select 2) move _LZ;
(_chop select 2) setbehaviour "CARELESS";
(_chop select 2) allowfleeing 0;
//(_chop select 0) setcaptive true;
(_chop select 0) flyinheight _h;
waitUntil {sleep 2; isNil"_chop" || {isNil"_groupCTP"} || {isNull (_chop select 0)} || {(_chop select 0) distance _LZ < 500} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))} || {(getposATL (_chop select 0) select 2) < 1} || {{alive _x} count crew (_chop select 0) == 0}};
if (isNil"_chop" || {isNil"_groupCTP"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCTP];};
if (!(alive (_chop select 0)) || {!(alive driver (_chop select 0))} || {(getposATL (_chop select 0) select 2) < 1} || {{alive _x} count crew (_chop select 0) == 0}) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};
{
_nul = [_x] SPAWN SAOKSHF20;
} foreach (units (_chop select 2));

_c = count units _groupCTP - 1;
if (_c >= 0) then {
for "_i" from 0 to _c do {
_xx = (units _groupCTP) select _i;
if (!isNil"_xx" && {vehicle _xx == (_chop select 0)}) then { 
unassignvehicle _xx; _xx action ["Eject",vehicle _xx];
};
sleep (1 + random 0.5);
};
};
DONTDELGROUPS = DONTDELGROUPS -  [_groupCTP];
};

_c = count units _groupCTP - 1;
if (_c >= 0) then {
for "_i" from 0 to _c do {
_xx = (units _groupCTP) select _i;
if (!isNil"_xx" && {vehicle _xx == (_chop select 0)}) then { 
_nul = [_xx,vehicle _xx] SPAWN SAOKEJECT;
};
sleep (1 + random 0.5);
};
};
if (_side == EAST) then {[[_LZ],"hd_warning","ColorRed"] SPAWN SAOKCREATEMARKER;} else {[_LZ,"hd_start","ColorBlue",0," DropPoint"] SPAWN SAOKCREATEMARKER;};
sleep 5;
(_chop select 2) move _start;
(_chop select 0) setcaptive false;
waitUntil {sleep 5; isNil"_chop" || {isNil"_groupCTP"} || {isNull (_chop select 0)} ||  {(_chop select 0) distance _start < 450} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))} || {(getposATL (_chop select 0) select 2) < 1} || {{alive _x} count crew (_chop select 0) == 0}};
if (isNil"_chop" || {isNil"_groupCTP"}) exitWith {DONTDELGROUPS = DONTDELGROUPS -  [_groupCTP];};
if (!(alive (_chop select 0)) || {!(alive driver (_chop select 0))} || {(getposATL (_chop select 0) select 2) < 1} || {{alive _x} count crew (_chop select 0) == 0}) exitWith {if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};
{
_nul = [_x] SPAWN SAOKSHF20;
} foreach (units (_chop select 2));

_c = count units _groupCTP - 1;
if (_c >= 0) then {
for "_i" from 0 to _c do {
_xx = (units _groupCTP) select _i;
if (!isNil"_xx" && {vehicle _xx == (_chop select 0)}) then { 
unassignvehicle _xx; _xx action ["Eject",vehicle _xx];
};
sleep (1 + random 0.5);
};
};
DONTDELGROUPS = DONTDELGROUPS -  [_groupCTP];};

{_x spawn SAOKDELETE;} foreach (units (_chop select 2));
{_x spawn SAOKDELETE;} foreach [(_chop select 0)];


DONTDELGROUPS = DONTDELGROUPS -  [_groupCTP];