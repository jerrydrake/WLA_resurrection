
private ["_nV","_str","_nul","_nearest","_mar","_mP","_marker","_Tid","_Lna","_header","_n","_tasks","_picked","_head","_toChoose","_rewardT","_someId","_p"];
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
[_this,player, "PlaV", "CivT5"]SPAWN SAOKKBTELL;
};
_head = "Our village would need more protection, could you establish a guardpost, with static gun, here for our safety?";
_toChoose = ["Yes, that could be good solution","Sorry, that would only turn your village into battle arena","Anything else I could do?"];
_nul = [_head, _toChoose,"S",[["V7","V42"],["V8","V18","V41"],["V40"]]] SPAWN FConversationDialog;
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
_mP = locationposition _nV;
_mP = [(_mP select 0),(_mP select 1)+5,0];
_marker = [_mar,_mP, "c_unknown", [0.8,0.8], "ColorPink", "Create guarpost in the village with at least one static weapon"] CALL FUNKTIO_CREATEMARKER;
_Tid = format ["TaskCIV%1",NUMM];
NUMM=NUMM+1;
_Lna = _mP CALL NEARESTLOCATIONNAME;
_header = format ["Create Guardpost in %1",_Lna];
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["Villagers are worried of their safety and want you to establish a guardpost in their village. Need to be created inside 500 radius from the village center.<br/><br/><img image='rela.jpg' width='347' height='233'/>", _header, _header], // Task description
objNull, // Task destination
true // true to set task as current upon creation
] call SAOKCRTASK;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Create Guardpost in the Village: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, (_mP)] call BIS_fnc_addStackedEventHandler;
//TASK SUCCESSFULL

_p = (_mP);
waitUntil {sleep 8; _p distance (getposATL ([_p] CALL RETURNGUARDPOST)) < 500 && {count (([_p] CALL RETURNGUARDPOST) getvariable "StaticW") > 0}};

_nV CALL SAOKVILDATREM;
deleteMarker _marker;
if (true) then {
_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
_header = format ["NATO Guardpost Established in %1. Locals Not Sure What to Come. Peace or More Blood",_Lna];
[_header, date] CALL SAOKEVENTLOG;
_n = [_rewardT,_mP,150] SPAWN CTreward;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
[] SPAWN {
private ["_actor1","_n","_nul"];
if (vehicle player != player) exitWith {};
sleep 5;
_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_n = [
[getposATL player, player, _actor1],
[],
[
[[[_actor1], ["Hey you guys, I appreciate you being here, but avoid using your weapons here"],7]]
,[[[_actor1], "We dont want any more civilian casulties to deal with here",6]]
,[[[player], "I understand your consern, the guards will do their best",7]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_nul = [_actor1,""] SPAWN FHideAndDelete;
};
_nul = [4] SPAWN MusicT;
//FRIENDLIER VILLAGE
_nearest = (player CALL SAOKNEARESTVIL); 
_nearest CALL SAOKIMPREL;
/////////////////////////////////////
} else {
//FAILED TASK

};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
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
