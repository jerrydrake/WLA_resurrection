
private ["_nV","_str","_nul","_nearest","_mar","_car","_marker","_Tid","_Lna","_header","_type","_n","_tasks","_picked","_head","_toChoose","_rewardT","_someId"];
_nV = (player CALL SAOKNEARESTVIL);
_mP = locationposition _nV;
_mP set [2,0];
if !([(player CALL SAOKNEARESTVIL),"Task"] CALL SAOKVILCON) then {
//CONVERSATION
(missionnamespace getvariable "CivC") SPAWN {

private ["_aika"];
_aika = time + 6;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 6;};
[_this,player, "PlaV", "CivT7"]SPAWN SAOKKBTELL;
};
_head = "I cant go any where, I am totally lost! My car have broken wheel but there is no mechanic in this doomed village. I cant drive to meet my relatives and even my cat is missing or just ignoring me";
_toChoose = ["I see what can I do","Pull yourself together, man","Anything else I could do?"];
_nul = [_head, _toChoose,"S",[["V17"],["V6"],["V13","V14","V16","V40"]],(missionnamespace getvariable "CivC")] SPAWN FConversationDialog;
//TASK TAKEN
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {};
if (LineSelected == 0) then {
_rewardT = RewardSelected;
RewardSelected = nil;
_str = "Task"; 
[_nV,_str,1] CALL SAOKVILSET;
_mar = format ["VilTaskM%1",NUMM];
NUMM=NUMM+1;

waitUntil {sleep 3; {(missionnamespace getvariable "LastVeh") != _x} count ((getposATL player) nearEntities [["C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"], 200]) > 0};
_car = (((getposATL player) nearEntities [["C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"],200]) - [(missionnamespace getvariable "LastVeh")]) call RETURNRANDOM;

_marker = [_mar,getposATL _car, "c_unknown", [0.8,0.8], "ColorPink", "Fix this car, using mechanic"] CALL FUNKTIO_CREATEMARKER;
_Tid = format ["TaskCIV%1",NUMM];
NUMM=NUMM+1;
_Lna = _car CALL NEARESTLOCATIONNAME;
_header = format ["Repair Car in %1",_Lna];
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["One of the villagers have trouble with his car. Check and try fix it with an engineer.<br/><br/><img image='rela.jpg' width='347' height='233'/>", _header, _header], // Task description
objNull, // Task destination
true // true to set task as current upon creation
] call SAOKCRTASK;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Repair Car with Engineer: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, (getposATL _car)] call BIS_fnc_addStackedEventHandler;

_car setvariable ["TaskCar",1];
_type = typeOf _car;
_car setHit [getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> "HitLFWheel" >> "name"), 1];
_car setHit [getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> "HitEngine" >> "name"), 1];
//TASK SUCCESSFULL
sleep 3;
waitUntil {sleep 6; isNull _car || {!alive _car} || {canMove _car}};
deleteMarker _marker;
if (!alive _car) then {_car setvariable ["TaskCar",nil];};
if (canMove _car) then {
_car setvariable ["TaskCar",nil];
_nV CALL SAOKVILDATREM;
_n = [_rewardT,_mP,50] SPAWN CTreward;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
(missionnamespace getvariable "CivC") SPAWN {
private ["_actor1","_n","_nul"];
if (vehicle player != player || {isNil"_this"}) exitWith {};
sleep 5;
_actor1 = _this;
_actor1 switchmove "";
//_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_n = [
[getposATL player, player, _actor1],
[],
[
[[[player], ["Your car should be working now again, my team took look of it"],7]]
,[[[_actor1], "Thank you so much, will head to buy some cat food right away",7]]
,[[[player], "Okay, I wish you luck finding that cat",6]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_nul = [_actor1,""] SPAWN FHideAndDelete;
};
_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
_header = format ["Missing Cat Found in %1, Not Cooperating with Rescuers. Will Tunafish Save the Day?",_Lna];
[_header, date] CALL SAOKEVENTLOG;
//FRIENDLIER VILLAGE
_nearest = (player CALL SAOKNEARESTVIL); 
_nearest CALL SAOKIMPREL;
} else {_nV CALL SAOKVILDATREM;};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
/////////////////////////////////////
} else {
//ANOTHER TASK
if (LineSelected == 2) then {
_tasks = ["VillageTasks\TaskCrate.sqf","VillageTasks\TaskCivPOW.sqf","VillageTasks\TaskEscort.sqf"];
if ({isNil{_x getvariable "Ghost"}} count (nearestObjects [_mP, ["Land_BarrelWater_F"], 50]) == 0) then {_tasks = _tasks + ["VillageTasks\TaskWater.sqf"];};
if (count ((getposATL  player) nearEntities [["C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"], 50]) > 0) then {_tasks = _tasks + ["VillageTasks\TaskRepair.sqf"];};
if ({getmarkercolor _x == "ColorRed" && getmarkerpos _x distance vehicle player < 300 && {alive _x && {side _x == EAST}} count (getmarkerpos _x nearEntities [["Man"],80]) > 0} count FORTRESSESMM > 0) then {_tasks = ["VillageTasks\TaskFortress.sqf"];};
if !((_mP) distance (getposATL ([_mP] CALL RETURNGUARDPOST)) < 500) then {_tasks = _tasks + ["VillageTasks\TaskGuardPost.sqf"];};

if (count _this > 0) then {_tasks = _tasks - [_this select 0];};
_picked = _tasks call RETURNRANDOM;
if (!isNil{missionnamespace getvariable "TaskChosen"} && {missionnamespace getvariable "TaskChosen" != "Random Task"}) then {_picked = missionnamespace getvariable "TaskChosen";};

_nul = [_picked] SPAWN SAOKSTARTTASK;
};
};

} else {"You havent completed previous task yet for this village" SPAWN HINTSAOK;};
