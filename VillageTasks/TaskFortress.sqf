
private ["_nV","_marF","_str","_nul","_nearest","_mar","_marker","_Tid","_Lna","_header","_n","_head","_toChoose","_rewardT","_someId"];
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
[_this,player, "PlaV", "CivT2"]SPAWN SAOKKBTELL;
};
_head = "Persians are holding a building here in the village causing much fear. Drive them away and you get our support";
_toChoose = ["Dont worry, they wont be here for long","Sorry, we cant drive them away. Too risky for our operation"];
_nul = [_head, _toChoose,"S",[["V17"],["V18"],["V41"]],(missionnamespace getvariable "CivC")] SPAWN FConversationDialog;
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

_marF = getposATL player;
{if (getmarkercolor _x == "ColorRed" && {(getmarkerpos _x) distance vehicle player < 300}) exitwith {_marF = getmarkerpos _x;};} foreach FORTRESSESMM;


_marker = [_mar,_marF, "c_unknown", [0.8,0.8], "ColorPink", "Clear hostile building complex"] CALL FUNKTIO_CREATEMARKER;
_Tid = format ["TaskCIV%1",NUMM];
NUMM=NUMM+1;
_Lna = _marF CALL NEARESTLOCATIONNAME;
_header = format ["Clear Building in %1",_Lna];
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["Persians are holding house in the village. Secure the village by searching the building and nearby backyards<br/><br/><img image='rela.jpg' width='347' height='233'/>", _header, _header], // Task description
objNull, // Task destination
true // true to set task as current upon creation
] call SAOKCRTASK;

_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling2_CA.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Clear CSAT from this house: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _marF] call BIS_fnc_addStackedEventHandler;
//TASK SUCCESSFULL

waitUntil {sleep 6; {alive _x && {side _x == EAST} && {isNil{_x getvariable "SaOkSurrendeRed"}}} count (_marF  nearEntities [["Man"],80]) == 0};

_nV CALL SAOKVILDATREM;
deleteMarker _marker;
if (player distance _marF < 200) then {
_n = [_rewardT,_marF,150] SPAWN CTreward;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
[] SPAWN {
if (vehicle player != player) exitWith {};
sleep 5;
_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_n = [
[getposATL player, player, _actor1],
[],
[
[[[_actor1], ["Hey thanks for driving those CSAT men away"],6]]
,[[[_actor1], "They came few days ago and just stole that house from me",6]]
,[[[player], "Well it yours again, was glad to help",5]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_nul = [_actor1,""] SPAWN FHideAndDelete;
};
_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
_header = format ["CSAT Thrown Out of %1. NATO Soldiers Helping Locals to Capture Taken House Back",_Lna];
[_header, date] CALL SAOKEVENTLOG;
_nul = [4] SPAWN MusicT;
//FRIENDLIER VILLAGE
_nearest = (player CALL SAOKNEARESTVIL); 
_nearest CALL SAOKIMPREL;
/////////////////////////////////////
} else {
//FAILED TASK
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
} else {
//TASK ABORTED (NOT NEEDED)
};

} else {"You havent completed previous task yet for this village" SPAWN HINTSAOK;};
