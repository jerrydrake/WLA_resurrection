private ["_nV","_str","_mar","_mP","_marker","_Tid","_Lna","_header","_nul","_nearest","_n","_tasks","_picked","_head","_toChoose"];
//CONVERSATION
(missionnamespace getvariable "CivC") SPAWN {
_aika = time + 4;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 3;};
_p = ["Sol12"]call RETURNRANDOM;
[_this,player, "ZafV", _p]SPAWN SAOKKBTELL;
};
_head = "We have today men sortage on our nearby roadblock and our enemies probably know it. Could you spend some time guarding it, just overwatch that CSAT dont smug weapons to local bad guys";
_toChoose = ["Sure why not, that could be pleasant time break","I am not going to sit still","Maybe something else I could do?"];
_nul = [_head, _toChoose,"S",[["V17","JinN15","JinN16"],["V18","JinN9","JinN10"],["V13","V16","V40"]],(missionnamespace getvariable "CivC")] SPAWN FConversationDialogSol;
//TASK TAKEN
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {};
if (LineSelected == 0) then {
_nearGps = [];
{if (!isNil{(_x getvariable "Post") getvariable "IsRoadBlock"}) then {_nearGps set [count _nearGps, (_x getvariable "Post")];};} foreach (nearestLocations [player, ["PostG"], 4000]);
if (count _nearGps == 0) exitWith {"Task cancelled, no nearby roadblocks" SPAWN HINTSAOK;};
_t = [] CALL SAOKSORTPLAYER;
_nearGps = [_nearGps,[_t],{_input0 distance _x},"ASCEND"] call SAOKSORTBY;
_tar = _nearGps select 0;
_tar setvariable ["Taken",1];
_tarLoc = getposATL _tar;
_mar = format ["GyTaskM%1",NUMM];
NUMM=NUMM+1;
_marker = [_mar,_tarLoc, "mil_flag", [0.8,0.8], "ColorBlue", "Guard this guarpost"] CALL FUNKTIO_CREATEMARKER;
_Tid = format ["TaskMil%1",NUMM];
NUMM=NUMM+1;
_Lna = _tarLoc CALL NEARESTLOCATIONNAME;
_header = format ["Guard Guardpost near %1",_Lna];
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["Time to take some rest and stand guarding nearby roadblock. Better still keep eyes open for suprises.", _header, _header], // Task description
objNull, // Task destination
true // true to set task as current upon creation
] call SAOKCRTASK;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\markers\nato\n_hq.paa", ICONCOLORGREEN, _this,1.51, 1.51, 0, (format ["Guard this roadblock: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _tarLoc] call BIS_fnc_addStackedEventHandler;

waitUntil {sleep 5; player distance _tar < 20 || {getmarkercolor (_tar getvariable "Gmark") == "ColorRed"}};
if (getmarkercolor (_tar getvariable "Gmark") == "ColorRed") exitWith {deletemarker _marker;_tar setvariable ["Taken",nil];_nul = [_Tid,"FAILED"] call SAOKCOTASK;[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;sleep 15;_n = [_Tid] CALL BIS_fnc_deleteTask;};
sleep 3;
_actor1 = [WEST,(FRIENDC2 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_n = [
[getposATL _tar, player, _actor1],
[],
[
[[[player], "Soldier, how is it going here?",5]]
,[[[_actor1], ["Silent before the storm, just kidding"],5]]
,[[[_actor1], ["Did they ask you to come waste your time here?"],6]]
,[[[player], "That's ok, we could have some relaxing time",7]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_nul = [[_actor1]] SPAWN AICampBehaviour;
_uCar =[ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_VarVEH = ARMEDVEHICLES select 1;
_start2 = [_tarLoc, 1200,900,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = 1300;
while {player distance _start2 < 900 || {surfaceiswater _start2}} do {
sleep 1;
_start2 = [_tarLoc, _size,900,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = _size + 100;
};
_tank = _VarVEH call BIS_fnc_selectRandom;	
_tg1 = [[(_start2 select 0)-30+(random 60),(_start2 select 1)-30+(random 60),0], 0, _tank, EAST] call SPAWNVEHICLE;
(_tg1 select 0) forcespeed 3;
_unitrate = [4,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
if (_mecOrNot == 1 && {_tank in ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"]}) then {
{_x moveincargo (_tg1 select 0);}foreach units _group;
_group SPAWN {waitUntil {sleep 3; {alive _x} count units _this == 0|| {behaviour (leader _this) == "COMBAT"}}; if !({alive _x} count units _this == 0) then {{unassignvehicle _x;_x action ["GetOut",vehicle _x];} foreach units _this;(units _this) ordergetin false;};};
};

_tg1wp1= (_tg1 select 2) addWaypoint [_tarLoc, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
_wp1 = _group addWaypoint [_tarLoc, 0];
[_group, 1] setWaypointCombatMode "Red";
[_group, 1] setWaypointType "GUARD";
_un = (units _group) + (units (_tg1 select 2));
(_tg1 select 0) SPAWN {waitUntil {sleep 4; isNull _this ||  {player distance _this < 200}}; if (!isNull _this) then {_this forcespeed 3;};};
sleep 30;
BaseR globalchat localize "STR_milT1_l1";
sleep 10;
player sidechat localize "STR_milT1_l2";
_aika = time + 400;
waitUntil {sleep 5; _aika < time || {{alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}}} count _un < 3} || {getmarkercolor (_tar getvariable "Gmark") == "ColorRed"}};
if (getmarkercolor (_tar getvariable "Gmark") == "ColorRed") exitWith {deletemarker _marker;_tar setvariable ["Taken",nil];_nul = [_Tid,"FAILED"] call SAOKCOTASK;PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;sleep 15;_n = [_Tid] CALL BIS_fnc_deleteTask;};
pisteet = pisteet + 350;
_nul = [350, "Roadblock guarded"] SPAWN PRESTIGECHANGE;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_tar setvariable ["Taken",nil];
deletemarker _marker;
BaseR globalchat localize "STR_milT1_l3";
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
} else {
//ANOTHER TASK
if (LineSelected == 2) then {
_tasks = ["MilitaryTasks\TaskGuardRoadBlock.sqf"] CALL SOLDIERSTASKS;
if (count _this > 0) then {_tasks = _tasks - [_this select 0];};
_picked = _tasks call RETURNRANDOM;
if (!isNil{missionnamespace getvariable "TaskChosen"} && {missionnamespace getvariable "TaskChosen" != "Random Task"}) then {_picked = missionnamespace getvariable "TaskChosen";};

_nul = [_picked] SPAWN SAOKSTARTTASK;
};
};

