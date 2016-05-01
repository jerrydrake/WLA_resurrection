
private ["_xx","_yy","_chopclass","_LZ","_accu","_st2","_start2","_Lpos","_ok","_obj","_rad","_CHOPDOWN","_EXIT","_CONDCHOPDOWN","_CONDPLAYERLEFT","_CONDPLAYEROUT","_Ppos","_start","_side","_dir","_h","_startC","_chop","_timeT","_MAPCLICK"];
_CHOPDOWN = {
private ["_chop","_nul"];
_chop = _this;
CantCommand = CantCommand - [_chop select 2];
if (isNil("CARS")) then {} else {CARS pushback (_chop select 0);};
{
_nul = [_x] SPAWN {
private ["_unit"];
_unit = _this select 0;
sleep 60;
waituntil {sleep 10; vehicle player distance _unit > 700 || {isNull _unit}};
deletevehicle _unit;
};
} foreach (units (_chop select 2));
["CHOPclick1","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
CHOPAVAIL = true;
"Chopper pick up can be called again"  SPAWN HINTSAOK;
{_x allowdamage true;} foreach units group player;
missionnamespace setvariable ["Chopped",nil];
};
_EXIT = {
private ["_chop","_nul"];
_chop = _this;
(_chop select 0) lock true;
sleep 7;
if (typeOf (_chop select 0) !="MH6J_EP1") then {_nul = [(_chop select 2),1,1,group (_this select 0)] SPAWN FSlowChopperSupportF;};
CHOPAVAIL = true;
"Chopper pick up can be called again" SPAWN HINTSAOK;
{_x allowdamage true;} foreach units group player;
missionnamespace setvariable ["Chopped",nil];
};

F_CHOPWP = {
private ["_v"];
_this move _pos;
_v = ["JinN3","JinN4","JinN5"]call RETURNRANDOM;
[player,player, "PlaV", _v]SPAWN SAOKKBTELL;
};

//CONDITIONS
_CONDCHOPDOWN = {private ["_bool"];_bool = false;if (!(alive (_this select 0)) || {!(alive driver (_this select 0))} || {{alive _x} count crew (_this select 0) == 0}) then {_bool = true;};_bool};
_CONDPLAYERLEFT = {private ["_bool"];_bool = false;if(_this distance vehicle player > 600) then {_bool = true;};_bool};
_CONDPLAYEROUT = {private ["_bool"];_bool = false;if (!(player in (_this select 0))) then {_bool = true;};_bool};
////INIT
//Chopper or Plane spawn position and exit
_xx = random 2500;
_yy = 2500 - _xx;
if (random 1 > 0.5) then {_xx = -1*_xx};
if (random 1 > 0.5) then {_yy = -1*_yy};
_Ppos = getposATL (vehicle player);
_start = [(_Ppos select 0) + _xx,(_Ppos select 1) + _yy,50];
//Position where to pick player
_LZ = getposATL (_this select 0);
 (_this select 0) setvariable ["Chopped",1];
//Chopper and infatry side
_side = WEST;
//Chopper or Plane direction when spawned
_dir= [_start, player] call SAOKDIRT;
//Chopper or Plane class
_chopclass = ["I_Heli_Transport_02_F"];
if ("USHelp" in (missionnamespace getvariable "Progress")) then {
_chopclass = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F"];
};
if (!isNil"RHSENABLED" || {!isNil"Eridanus"}) then {_chopclass = AIRCARRIERCHOP select 0;};
if (!isNil"CheConf") then {_chopclass = AIRCARRIERCHOP select 0;};
_chopclass = _chopclass call RETURNRANDOM;
//Chopper or Plane height when spawned. For Chopper must be under 100m (50 is good), because of the current buggy AI flying
_h = 50;
_startC = [_start select 0, _start select 1, _h];
_chop = [_startC, _dir, _chopclass, _side] call SPAWNVEHICLE;
CantCommand pushback (_chop select 2);
(_chop select 0) flyinheight 50;
(_chop select 2) setbehaviour "CARELESS";
(_chop select 2) move _LZ;
(_chop select 2) setgroupid ["Eagle"];
(_this select 0) sidechat "Wolf to Eagle, my team would need transport. I am sending my position. Out";
_timeT = time + 6;
{_x allowdamage false;} foreach units (_chop select 2) + [(_chop select 0)];
sleep 6;
leader (_chop select 2) sidechat "Eagle to Wolf, roger that I am there in few moments. Throw smoke when you can hear us. Out";
waitUntil {sleep 3; (_chop select 0) distance _LZ < 200 || {_chop CALL _CONDCHOPDOWN} || {((_this select 0) in (_chop select 0))}};
if (_chop CALL _CONDCHOPDOWN) exitWith {
//CHOPPER DOWN
_chop SPAWN _CHOPDOWN;
};
_LZ = vehicle (_this select 0);
_accu = 200;
if (!isNil{player getvariable "SmokeTime"}) then {_LZ = vehicle (_this select 0);_accu = 50;leader (_chop select 2) sidechat "Eagle to Wolf, I think I see you guys with the smoke. Landing in notime. Out";}
else {leader (_chop select 2) sidechat "Eagle to Wolf, I cant see you guys but I am landing now. I hope you are close. I dont want to wait long. Out";};
_ok = true;
_obj = objNull;
while {_ok} do {
_start2 = [getposATL vehicle (_this select 0), _accu,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
_d = 600;
_max = 0; 
while {(!([_start2,10] call SAOKISFLAT) || {[_start2, _chopclass] CALL SAOKTAKENBOX}) && {_max < 40}} do {
_max = _max + 1;  
_accu = _accu + 50;
sleep 0.1;
_d = _d + 200;
_start2 = [getposATL vehicle (_this select 0), _accu,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
};


_obj = createVehicle ["Land_HelipadEmpty_F",_start2, [], 0, "NONE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
(_chop select 2) move (getposATL _obj);
//READY TO LAND
waitUntil {sleep 3; unitready leader (_chop select 2) || {_LZ CALL _CONDPLAYERLEFT} || {_chop CALL _CONDCHOPDOWN} || {((_this select 0) in (_chop select 0))}};
if (_chop CALL _CONDCHOPDOWN) exitWith {
//CHOPPER DOWN
_chop SPAWN _CHOPDOWN;
};
if (_LZ CALL _CONDPLAYERLEFT) exitWith {
//PLAYER LEFT
_chop SPAWN _EXIT;
};
(_chop select 0) land "GET IN";
waitUntil {sleep 2; getposATL (_chop select 0) select 2 < 4  || {isNull (_chop select 0)} || {((_this select 0) in (_chop select 0))} || {_LZ CALL _CONDPLAYERLEFT}};

waitUntil {sleep 3; getposATL (_chop select 0) select 2 > 5  || {isNull (_chop select 0)} || {(((_this select 0) in (_chop select 0)) && {{alive _x && {vehicle _x == _x} && {_x distance (_this select 0) < 100}} count units group (_this select 0) == 0})} || {_LZ CALL _CONDPLAYERLEFT}};
if (getposATL (_chop select 0) select 2 > 5) then {deletevehicle _obj;} else {_ok = false;};
};
if (_chop CALL _CONDCHOPDOWN) exitWith {deletevehicle _obj;};
if (_LZ CALL _CONDPLAYERLEFT) exitWith {deletevehicle _obj;};
//LEAVE
deletevehicle _obj;
"Click on map for LZ-point - changeable until landing" SPAWN HINTSAOK;
//onMapSingleClick "CHOP move _pos;";
_MAPCLICK = ["CHOPclick1","onMapSingleClick","F_CHOPWP",(_chop select 2)] call BIS_fnc_addStackedEventHandler;
{_x allowdamage false;} foreach units group player;
waitUntil {sleep 2; getposATL (_chop select 0) select 2 > 10 || {isNull (_chop select 0)} || {_chop CALL _CONDCHOPDOWN} || {_chop CALL _CONDPLAYEROUT}};
if (_chop CALL _CONDCHOPDOWN) exitWith {
//CHOPPER DOWN
_chop SPAWN _CHOPDOWN;
};
if (_chop CALL _CONDCHOPDOWN) exitWith {
//PLAYER LEFT
{
if (vehicle _x == (_chop select 0)) then { 
 _x action ["Eject",vehicle _x];unassignvehicle _x;_x action ["GetOut",vehicle _x];
};
} foreach units group  (_this select 0);
_chop SPAWN _EXIT;
};
//TAKING OFF
waitUntil {sleep 2; unitready leader (_chop select 2) || {isNull (_chop select 0)} || {_chop CALL _CONDCHOPDOWN} || {_chop CALL _CONDPLAYEROUT}};
if (_chop CALL _CONDCHOPDOWN) exitWith {
//CHOPPER DOWN
_chop SPAWN _CHOPDOWN;
};
if (_chop CALL _CONDCHOPDOWN) exitWith {
//PLAYER LEFT
{
if (vehicle _x == (_chop select 0)) then { 
 _x action ["Eject",vehicle _x];unassignvehicle _x;_x action ["GetOut",vehicle _x];
};
} foreach units group  (_this select 0);
_chop SPAWN _EXIT;
};
//SEEK LAND SITE
["CHOPclick1","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
_start2 = [getposATL (_chop select 0),150,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
/*
_Lpos = _start2 findEmptyPosition[1,100, _chopclass];
_rad = 150;
while {str(_Lpos) == "[0,0,0]" || {{side _x == EAST} count (_Lpos nearEntities [["Man"],120]) > 2}} do {
sleep 0.1;
_start2 = [getposATL (_chop select 0),_rad,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_Lpos = _start2 findEmptyPosition[1, 100,_chopclass];
_rad = _rad + 50;
};
*/
_obj = createVehicle ["Land_HelipadEmpty_F",_start2, [], 0, "NONE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
(_chop select 2) move (getposATL _obj);
waitUntil {sleep 2; unitready leader (_chop select 2) || {isNull (_chop select 0)} || {_chop CALL _CONDCHOPDOWN} || {_chop CALL _CONDPLAYEROUT}};
if (_chop CALL _CONDCHOPDOWN) exitWith {
deletevehicle _obj;
//CHOPPER DOWN
_chop SPAWN _CHOPDOWN;
};
if (_chop CALL _CONDCHOPDOWN) exitWith {
deletevehicle _obj;
//PLAYER LEFT
{
if (vehicle _x == (_chop select 0)) then { 
 _x action ["Eject",vehicle _x];unassignvehicle _x;_x action ["GetOut",vehicle _x];
};
} foreach units group (_this select 0);
_chop SPAWN _EXIT;
};
//LAND
(_chop select 0) land "GET IN";
leader (_chop select 2) sidechat "We are at the LZ. Get ready to get out, Wolf. Out";
waitUntil {sleep 2; (getposATL (_chop select 0) select 2) < 1.5 || {isNull (_chop select 0)} || {_chop CALL _CONDCHOPDOWN} || {_chop CALL _CONDPLAYEROUT}};
if ((getposATL (_chop select 0) select 2) < 1.5) then {
[player,player, "PlaV", "JinN6"]SPAWN SAOKKBTELL;
};
if (_chop CALL _CONDCHOPDOWN) exitWith {
deletevehicle _obj;
//CHOPPER DOWN
_chop SPAWN _CHOPDOWN;
};
if (_chop CALL _CONDCHOPDOWN) exitWith {
deletevehicle _obj;
//PLAYER LEFT
{
if (vehicle _x == (_chop select 0)) then { 
 _x action ["Eject",vehicle _x];unassignvehicle _x;_x action ["GetOut",vehicle _x];
};
} foreach units group (_this select 0);
_chop SPAWN _EXIT;
};
//LEAVE
deletevehicle _obj;
{
if (vehicle _x == (_chop select 0)) then { 
 _x action ["Eject",vehicle _x];unassignvehicle _x;
};
} foreach units group  (_this select 0);

waitUntil {sleep 2; {alive _x && {_x in (_chop select 0)}} count units group (_this select 0) == 0 || {_chop CALL _CONDCHOPDOWN}};
if (_chop CALL _CONDCHOPDOWN) exitWith {
//CHOPPER DOWN
_chop SPAWN _CHOPDOWN;
};
_chop SPAWN _EXIT;

