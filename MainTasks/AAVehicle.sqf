
private ["_start","_d","_start3","_random","_nul","_unitrate","_classes","_cl","_group","_tg1","_mar","_marker","_someId"];
_start = [player,3500,1000,"(1 - houses) * (1 - sea)",""] CALL SAOKSEEKPOS;
while {surfaceiswater _start || {!(_start CALL SAOKINMAP)}} do {
sleep 2;
_start = [player,3500,1000,"(1 - houses) * (1 - sea)",""] CALL SAOKSEEKPOS;
};
BaseR globalchat localize "STR_Sp2s1r9";
sleep 10;
player sidechat localize "STR_Sp2s1r10";
[player,player, "PlaV","V38"]SPAWN SAOKKBTELL;
[
WEST, // Task owner(s)
"taskAA", // Task ID (used when setting task state, destination or description later)
["Iranian AA-vehicle have been spotted with light guard, could be good time to take it out.", "Find and Destroy AA-vehicle", "Find and Destroy AA-vehicle"], // Task description
objNull, // Task destination
"CREATED"  ] call SAOKCRTASK;
NUMM=NUMM+1;
_mar = format ["AAmar%1",NUMM];
_marker = [_mar,_start, "hd_flag", [0.5,0.5], "ColorPink", "Find and Destroy AA-vehicle"] CALL FUNKTIO_CREATEMARKER;
NUMM=NUMM+1;
//icon = "\A3\ui_f\data\map\markers\military\destroy_CA.paa";
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_launchers_CA.paa", ICONCOLOR, _this,1.51, 1.51, 0, (format ["Find and Destroy AA-vehicle: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, [(_start select 0)+100-(random 200),(_start select 1)+100-(random 200),4]] call BIS_fnc_addStackedEventHandler;

_start3 = [_start, 100, 40,"(1 - sea) * (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
_d = 100;
while {!([_start3,20] CALL SAOKISFLAT)} do {
_d = _d + 30;
_start3 = [_start, _d, 40,"(1 - sea) * (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
sleep 1;
};
_nul = [_start3,"",(15+random 25)] SPAWN CreateRoadBlock;

waitUntil {sleep 6; vehicle player distance _start < 800};
_unitrate = [4,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
_cl = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_cl call RETURNRANDOM);};
_group = [_start, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
//player setpos _start;
Pgroups pushBack _group;
[_group, _start, 100] call bis_fnc_taskPatrol;

_tg1 = [_start, 0, ((ARMEDAA select 1) call RETURNRANDOM), EAST] call SPAWNVEHICLE;
DONTDELGROUPS = DONTDELGROUPS + [(_tg1 select 2)];
waitUntil {sleep 6; isNull (_tg1 select 0) || {!alive (_tg1 select 0)} || {{alive _x} count crew (_tg1 select 0) == 0}};
[player,player, "PlaV","V39"]SPAWN SAOKKBTELL;
pisteet = pisteet + 200;
deletemarker _marker;
_nul = [200, "Enemy AA-vehicle Destroyed"] SPAWN PRESTIGECHANGE;
_nul = ["taskAA","SUCCEEDED"] call SAOKCOTASK;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
player sidechat localize "STR_Sp2s1r11";
sleep 7;
BaseR globalchat localize "STR_Sp2s1r12";
CARS = CARS + [(_tg1 select 0)];
DONTDELGROUPS = DONTDELGROUPS - [(_tg1 select 2)];


