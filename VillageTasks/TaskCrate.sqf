
private ["_tarV","_bl","_str","_nearest","_nul","_curV","_size","_mar","_tarVn","_crate1","_marker","_Tid","_Lna","_header","_tarP","_n","_tasks","_picked","_head","_toChoose","_rewardT","_someId"];
if !([(player CALL SAOKNEARESTVIL),"Task"] CALL SAOKVILCON) then {
//CONVERSATION
(missionnamespace getvariable "CivC") SPAWN {

private ["_aika","_p"];
_aika = time + 6;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 3;};
_p = ["CivT8","CivT9"]call RETURNRANDOM;
[_this,player, "PlaV", _p]SPAWN SAOKKBTELL;
};
_head = "I have a crate that should be delivered to nearby village, but cant find nobody to deliver it";
_toChoose = ["I see what can I do","We are not delivery boys","Eh, anything else I could do?"];
_nul = [_head, _toChoose,"S",[["V17"],["V10","V11","V12","JinN7","JinN8"],["V13","V14","V15","V16","V40"]],(missionnamespace getvariable "CivC")] SPAWN FConversationDialog;
//TASK TAKEN
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {};
if (LineSelected == 0) then {
_rewardT = RewardSelected;
RewardSelected = nil;

_curV = (player CALL SAOKNEARESTVIL);

_r = 3000;
_tarV = (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital","NameLocal"], _r]) - [_curV];
while {count _tarV == 0} do {
sleep 1;
_tarV = (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital","NameLocal"], _r])- [_curV];
_r = _r + 1000;
};
_tarV = _tarV call RETURNRANDOM;
_mP = locationposition _tarV;
_mP set [2,0];
_str = "Task"; 
[_curV,_str,1] CALL SAOKVILSET;
_mar = format ["VilTaskM%1",NUMM];
NUMM=NUMM+1;

_tarVn = name _tarV;
_crate1 = createVehicle ["C_supplyCrate_F", [(getposATL player select 0)+10-(random 20),(getposATL player select 1)+10-(random 20),0], [], 0, "NONE"];
_crate1 setdir (random 360);


_marker = [_mar,getposATL _crate1, "c_unknown", [0.8,0.8], "ColorPink", ("Deliver this crate to "+_tarVn)] CALL FUNKTIO_CREATEMARKER;
_Tid = format ["TaskCIV%1",NUMM];
NUMM=NUMM+1;
_Lna = name _curV;
_header = format ["Deliver crate in %1 to %2",_Lna,_tarVn];
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["Deliver the crate to the pointed village by using a small truck. Press shift+9 when near the crate with the truck nearby.<br/><br/><img image='rela.jpg' width='347' height='233'/>", _header, _header], // Task description
objNull, // Task destination
true // true to set task as current upon creation
] call SAOKCRTASK;

_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\markers\nato\c_unknown.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Load Crate to Truck: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, getposATL _crate1] call BIS_fnc_addStackedEventHandler;

waitUntil {sleep 3; isNull _crate1 || {!alive _crate1} || {!isNil{_crate1 getvariable "AUTOSSA"}}};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Transport the Crate Here: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _mP] call BIS_fnc_addStackedEventHandler;
//[_Tid,(getmarkerpos _tarV)] call BIS_fnc_taskSetDestination;
//TASK SUCCESSFULL
waitUntil {sleep 6; isNull _crate1 || {!alive _crate1} || {(_mP distance _crate1 < 200 && {isNil{_crate1 getvariable "AUTOSSA"}})}};
deleteMarker _marker;

if (!isNull _crate1 && {_mP distance _crate1 < 200} && {isNil{_crate1 getvariable "AUTOSSA"}}) then {
_Lna = _mP CALL NEARESTLOCATIONNAME;
_header = format ["NATO Sent Delivery Boys? Military Seen Transporting Crates for Villagers in %1",_Lna];
[_header, date] CALL SAOKEVENTLOG;
_tarV CALL SAOKVILDATREM;
_n = [_rewardT,(locationposition _curV),150] SPAWN CTreward;
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
[[[_actor1], ["Hey, did you bring that crate for me? Had been waiting for delivery for days"],8]]
,[[[player], "Yes, we got special task to deliver this through the dangerous land",6]]
,[[[_actor1], "Nice, well big thank you",4]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_nul = [_actor1,""] SPAWN FHideAndDelete;
};
{
//FRIENDLIER VILLAGE
_x CALL SAOKIMPREL;
} foreach [_curV,_tarV];
};
_curV CALL SAOKVILDATREM;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
sleep 300;
if !(isNull _crate1) then {deletevehicle _crate1;};
/////////////////////////////////////
} else {
//ANOTHER TASK
if (LineSelected == 2) then {
_tasks = ["VillageTasks\TaskCrate.sqf","VillageTasks\TaskCivPOW.sqf","VillageTasks\TaskEscort.sqf"];
if ({isNil{_x getvariable "Ghost"}} count (nearestObjects [locationposition (player CALL SAOKNEARESTVIL), ["Land_BarrelWater_F"], 350]) == 0) then {_tasks = _tasks + ["VillageTasks\TaskWater.sqf"];};
if (count ((getposATL  player) nearEntities [["C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"], 50]) > 0) then {_tasks = _tasks + ["VillageTasks\TaskRepair.sqf"];};
if ({getmarkercolor _x == "ColorRed" && getmarkerpos _x distance vehicle player < 300 && {alive _x && {side _x == EAST}} count (getmarkerpos _x nearEntities [["Man"],80]) > 0} count FORTRESSESMM > 0) then {_tasks = ["VillageTasks\TaskFortress.sqf"];};
if !((locationposition (player CALL SAOKNEARESTVIL)) distance (getposATL ([locationposition (player CALL SAOKNEARESTVIL)] CALL RETURNGUARDPOST)) < 700) then {_tasks = _tasks + ["VillageTasks\TaskGuardPost.sqf"];};

if (count _this > 0) then {_tasks = _tasks - [_this select 0];};
_picked = _tasks call RETURNRANDOM;
if (!isNil{missionnamespace getvariable "TaskChosen"} && {missionnamespace getvariable "TaskChosen" != "Random Task"}) then {_picked = missionnamespace getvariable "TaskChosen";};

_nul = [_picked] SPAWN SAOKSTARTTASK;
};
};

} else {"You havent completed previous task yet for this village" SPAWN HINTSAOK;};
