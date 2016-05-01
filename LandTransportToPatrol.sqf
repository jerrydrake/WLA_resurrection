private ["_notBoat","_start","_LZ","_infwaypoint","_side","_dir","_chopclass","_unitclasses","_skill","_num","_startC","_chop","_groupLTTP","_nul","_wrn","_wp1","_dropR","_stucked"];
//Land vehicle spawn position and exit
_start = _this select 0;
//Position were infantry disempark
_LZ = _this select 1;
//Position were infantry head before guarding it
_infwaypoint = _this select 2;
//Chopper and infatry side
_side = _this select 3;
//vehicle direction when spawned
_dir = _this select 4;
//Land vehicle class
_chopclass = _this select 5;
//Array of unitclasses that form the infantry group. Size of the group is the amount of classes you enter
_unitclasses = _this select 6;
//Array skill range for infantry group e.g. [0.4,0.7]
_skill = _this select 7;
//Transport only one group (0) or how many more until destroyed (1->).   
_num = _this select 8;

_dropR = 400;
_notBoat = true;
if (count _this > 9) then {_notBoat = false;_dropR = 10;};

_wrn = 0;

_startC = [_start select 0, _start select 1, 0];
_chop = [_startC, _dir, _chopclass, _side] call SPAWNVEHICLE;
if (!_notBoat) then {[(_chop select 0),_LZ] SPAWN SAOKBOATSPEED;};
_groupLTTP = [_start, _side, _unitclasses,[],[],_skill] call SpawnGroupCustom;
Pgroups set [count Pgroups,_groupLTTP];
if (random 1 < 0.5) then {_nul = _groupLTTP SPAWN SAOKAIGSMOKE;};
DONTDELGROUPS set [count DONTDELGROUPS, _groupLTTP];
{_x moveincargo (_chop select 0);} foreach units _groupLTTP;
(_chop select 2) move _LZ;
(_chop select 2) setbehaviour "SAFE";
_wp1= _groupLTTP addWaypoint [_infwaypoint, 0]; 
_groupLTTP setbehaviour "SAFE";
if (_notBoat) then {_nul = [(_chop select 0), _LZ] SPAWN FvehicleStucked2;};

_nul = [_groupLTTP,"ColorBlue"] SPAWN FUNKTIO_GM; 
_nul = [(_chop select 2),"ColorPink"] SPAWN FUNKTIO_GM; 

_stucked = {
private ["_bol"];
_bol = false;
if (speed _this < 1) then {
if (isNil{_this getvariable "BoatStill"}) then {_this setvariable ["BoatStill",1];} else {_this setvariable ["BoatStill",(_this getvariable "BoatStill")+1];};
};
if (_this getvariable "BoatStill" > 2) then {_bol = true;};
_bol
};

waitUntil {sleep 3; isNil"_chop" || {isNil"_groupLTTP"} || {isNull (_chop select 0)} || {((_chop select 0) distance _LZ < _dropR)}|| {!_notBoat && {(_chop select 0) CALL _stucked}}  || {!_notBoat && {!surfaceisWater getposATL (_chop select 0)}} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))} || {({alive _x} count crew (_chop select 0)) < 1} || {behaviour leader (_chop select 2) == "COMBAT" && {_notBoat}}};
if (isNil"_chop" || {isNil"_groupLTTP"}) exitWith {DONTDELGROUPS = DONTDELGROUPS - [_groupLTTP];};
if (!(alive (_chop select 0)) || {!(alive driver (_chop select 0))} || {({alive _x} count crew (_chop select 0)) < 1}) exitWith {
DONTDELGROUPS = DONTDELGROUPS - [_groupLTTP];

if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};
{
_nul = [_x] SPAWN {
private ["_unit"];
_unit = _this select 0;
sleep 60;
waituntil {sleep 10; isNull _unit || {vehicle player distance _unit > 700}};
deletevehicle _unit;
};
} foreach (units (_chop select 2));

[_groupLTTP, _infwaypoint, 900] call bis_fnc_taskPatrol;
};

{_nul = [_x,(_chop select 0)] SPAWN FJumpOffCar;sleep 0.1;} foreach units _groupLTTP;
if (_side == EAST) then {[[_LZ],"hd_warning","ColorRed"] SPAWN SAOKCREATEMARKER;} else {[_LZ,"hd_start","ColorBlue",0," DropPoint"] SPAWN SAOKCREATEMARKER;};
[_groupLTTP, _infwaypoint, 900] call bis_fnc_taskPatrol;
CARS pushback (_chop select 0);
sleep 15;
if (!_notBoat && {alive (_chop select 0)} && {(_chop select 0) distance _LZ < 20} && {{alive _x} count crew (_chop select 0) > 0}) then {_dir = [_LZ, _start] call SAOKDIRT; (_chop select 0) setdir _dir;(_chop select 0) setpos _LZ;};
(_chop select 2) move _start;(_chop select 0) forcespeed -1; 
waitUntil {sleep 3; isNil"_chop" || {isNil"_groupLTTP"} || {isNull (_chop select 0)} || {(_chop select 0) distance _start < 40} || {vehicle player distance (_chop select 0) > 2500} || {!(alive (_chop select 0))} || {!(alive driver (_chop select 0))} || {({alive _x} count crew (_chop select 0)) < 1} || {behaviour leader (_chop select 2) == "COMBAT" && {_notBoat}}};
if (isNil"_chop" || {isNil"_groupLTTP"}) exitWith {DONTDELGROUPS = DONTDELGROUPS - [_groupLTTP];};
if (!(alive (_chop select 0)) || {!(alive driver (_chop select 0))} || {({alive _x} count crew (_chop select 0)) < 1}) exitWith {
DONTDELGROUPS = DONTDELGROUPS - [_groupLTTP];
if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};
{
_nul = [_x] SPAWN {
private ["_unit"];
_unit = _this select 0;
sleep 60;
waituntil {sleep 10; isNull _unit || {vehicle player distance _unit > 700}};
if !(isNull _unit) then {deletevehicle _unit;};
};
} foreach ((units (_chop select 2)) + [_chop select 0]);

[_groupLTTP, _infwaypoint, 900] call bis_fnc_taskPatrol;
DONTDELGROUPS = DONTDELGROUPS - [_groupLTTP];
};
DONTDELGROUPS = DONTDELGROUPS - [_groupLTTP];
//{_x spawn SAOKDELETE;} foreach (units (_chop select 2)) + [(_chop select 0)];