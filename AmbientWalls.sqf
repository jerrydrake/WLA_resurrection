private ["_cW","_c","_forEachIndex","_n","_wlF"];
LWalls = [];
SAOKfuncWall = {
private ["_dd","_wl","_posses","_end","_lenght","_start","_bBox","_p1","_p2","_maxWidth","_walls","_bol","_y","_dir"];
_wl = _this select 0;
LWalls = LWalls - [_wl];
_posses = _this select 1;
_end = _wl getvariable "EndP"; 
_lenght = _end distance _wl;
_start = getposATL _wl;
_dir = [_start, _end] call SAOKDIRT;
_bBox = boundingBoxReal _wl;
_p1 = _bBox select 0;
_p2 = _bBox select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_start = [(_start select 0)+((sin _dir)*_maxWidth*0.5),(_start select 1)+((cos _dir)*_maxWidth*0.5),0];
_n = [_start,_end,typeof _wl,0,"RBlocks"] execFSM "DrawFence.fsm";
waitUntil {sleep 1;count (_n getFSMVariable "_ww") > 0};
_walls = + (_n getFSMVariable "_ww");
_n setFSMVariable ["_ww", []];
_bol = true;
_dd = (["W"] CALL DIS);
while {_bol} do {
sleep 10; 
_bol = false;
{_y = _x; if ({vehicle _y distance _x < _dd} count _posses > 0) exitWith {_bol = true;};} foreach [player];
};
{_x spawn SAOKDELETE;} foreach (_walls select 0);
LWalls pushBack _wl;
};

_wlF = {
private ["_dd","_Ps","_posses","_tot","_bol","_dir","_lenght","_end","_y"];
_Ps = [player];
_y = (_this select 0);
if (isNil{_y}) exitWith {};
if (isNil{_y getvariable "EndP"}) exitWith {};
_end = _y getvariable "EndP"; 
_lenght = _end distance _y; 
if ({_y distance vehicle _x < _lenght} count _Ps > 0 || {{_end distance vehicle _x < _lenght} count _Ps > 0}) then {
_dir = [_y, _end] call SAOKDIRT;
_start = getposATL _y;
_tot = 0;
_bol = false;
_posses = [];
_dd = (["W"] CALL DIS);
while {_tot < _lenght && {!_bol} && {_tot < 5000}} do {
sleep 0.01;
_start = [(_start select 0)+((sin _dir)*400),(_start select 1)+((cos _dir)*400),0];
_posses pushBack _start;
_tot = _tot + 400;
if ({vehicle _x distance _start < _dd} count _Ps > 0) then {_bol = true;};
};
if (_bol) then {[_y,_posses] SPAWN SAOKfuncWall;};
};
};


waitUntil {sleep 1; !isNil"StartMission"};
if (!isNil"Bwalll") exitWith {};
//LOOP
while {true} do {
sleep 4;
sleep 5;
{if (_x distance [0,0,0] < 2000) then {LWalls = LWalls - [_x]; _x spawn SAOKDELETE;};sleep 0.01;} foreach LWalls;
sleep 1;
{if (isNull _x || {!alive _x}) then {LWalls = LWalls - [_x];};sleep 0.01;} foreach LWalls;
sleep 1;
// || {typeName _x != "OBJECT"}
{if (isNil"_x" || {typeName _x != "OBJECT"}) exitWith {_deAT = LWalls deleteAt _forEachIndex;};sleep 0.01;} foreach LWalls;
sleep 1;
_cW = + LWalls;
_c = count _cW - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _cW select _i;
if (!isNil"_xx" && {typename _xx == "OBJECT"}) then {
_n = [_xx] SPAWN _wlF;
};
sleep 0.1;
};

};