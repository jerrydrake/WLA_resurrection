
private ["_start","_d","_st","_start2","_a","_moveP","_ff","_pP","_aika","_nul","_cur","_N","_towerr","_mar","_marker","_someId","_actor1","_ran","_group","_animal","_Lna","_header"];
CurTaskS set [count CurTaskS, "VillageTasks\TaskFindRes2.sqf"];
"MetResContact" CALL SAOKADDPROG;
_d = 2000;
sleep 0.1;
_start = [vehicle player, 2000,1000,"(1 - sea)* (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
while {surfaceisWater _start || {!([_start,40] CALL SAOKISFLAT)} || {!(_start CALL SAOKINMAP)} || {count (_start nearRoads 40) > 0} || {(nearestbuilding _start) distance _start < 50}} do {
sleep 0.1;
if (_d < 8000) then {_d = _d + 300;};
sleep 0.1;
_start = [vehicle player, _d,1000,"(1 - sea)* (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
};
_nul = ["task2","SUCCEEDED"] call SAOKCOTASK;
_N = [_start, 40] SPAWN CreatePrison; 
waitUntil {sleep 1; !isNil{missionnamespace getvariable "PowLoc"} && {!isNil{missionnamespace getvariable "Pris"}}};
_pLoc = + (missionnamespace getvariable "PowLoc");
_towerr = (missionnamespace getvariable "Pris");
_towerr setvariable ["DontRemove",1];
missionnamespace setvariable ["PowLoc",nil];
//_walls = _start CALL POWcell;
_mar = format ["TaskM%1",NUMM];
NUMM=NUMM+1;
_start = _pLoc call RETURNRANDOM;
_marker = [_mar,_start, "hd_flag", [0.5,0.5], "ColorPink", "Meet Resistance Contact"] CALL FUNKTIO_CREATEMARKER;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D [MISSION_ROOT + "pics\Res.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Rescue Resistance Contact: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _start] call BIS_fnc_addStackedEventHandler;
_start2 = [_start, 80,60,"(1 - sea) * (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
_d = 80;
while {_start2 distance _start < 60 || {!([_start2,20] CALL SAOKISFLAT)}} do {
_d = _d + 10;
_start2 = [_start, _d,60,"(1 - sea) * (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
sleep 0.1;
};
_nul = [_start2,"",(15+random 25)] SPAWN CreateRoadBlock;
[
WEST, // Task owner(s)
"taskRR", // Task ID (used when setting task state, destination or description later)
["We were told there is one man held in nearby CSAT outpost that is connected to resistance activity. If we save him, that could lead us work with resistance troops.", "Rescue POW", "Rescue POW"], // Task description
objNull, // Task destination
true 
] call SAOKCRTASK;

sleep 20;
SAOKCHOSEN = [];
_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
SAOKanswer1 = {
switch _this do {
case 0: {"Not far from here, I show you it on a map"};
case 1: {"Suit yourself, stupid lowlife"};
}; 
};
SAOKanswer2 = {
switch _this do {
case 0: {"Thank you, villager"};
case 1: {"Walk away!"};
}; 
};
_n = [
[getposATL player, player, _actor1],
[],
[
[[[_actor1], "Hey, I heard you are heading to help one of our friends?",6]]
,[[[_actor1], ["There is two armed locals planning to do the exact same. Maybe you guys could team up?"],7]]
,[[[player], "",6,["Sounds interesting, where could I find them?","Get lost, I dont fall for you traps"]]]
,[[[_actor1], {(SAOKCHOSEN SELECT 0) CALL SAOKanswer1},6]]
,[[[player], {(SAOKCHOSEN SELECT 0) CALL SAOKanswer2},5]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
SAOKanswer1 = nil;
SAOKanswer2 = nil;
_nul = [_actor1,""] SPAWN FHideAndDelete;

if (!isNil"SAOKCHOSEN" && {count SAOKCHOSEN > 0} && {(SAOKCHOSEN SELECT 0) == 0}) then {
_start SPAWN {
private ["_d","_st","_start2","_actor1","_n","_actor2","_marS","_mar5","_obj","_obj2","_nul"];
_start2 = [getposATL player, 2300,300,"(1 - sea) * (1 + trees) * (1 + forest)",""] CALL SAOKSEEKPOS;
_d = 2300;
while {_start2 distance player < 300 || {surfaceiswater _start2}} do {
sleep 0.1;
_d = _d + 10;
_start2 = [getposATL player, _d,300,"(1 - sea) * (1 + trees) * (1 + forest)",""] CALL SAOKSEEKPOS;
};
_marS = format ["Hmar%1",NUMM];
NUMM=NUMM+1;
_mar5 = [_marS,_start2,"mil_join",[0.7,0.7],"ColorBlack","Join with Locals"] CALL FUNKTIO_CREATEMARKER;
_obj = createVehicle ["FirePlace_burning_F", _start2, [], 0, "NONE"]; 
_tT = "Land_TentDome_F";
if (!isNil"IFENABLED") then {_tT = "Land_TentA_F";};
_obj2 = createVehicle [_tT,[(_start2 select 0) - 4, (_start2 select 1) + 4, 0], [], 0, "NONE"];
waitUntil {sleep 5; player distance _start2 < 20 || {vehicle player distance _this < 250}};
if (player distance _start2 < 20) then {
_actor1 = [WEST,(FRIENDC4 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_n = [
[getposATL player, player, _actor1],
[],
[
[[[player], "Hello there, planning to help your friend to escape from cell?",6]]
,[[[_actor1], ["How did you know? Who are you?"],5]]
,[[[player], ["We are here to help and kick some CSAT ass, would you care to follow my lead?"],9]]
,[[[_actor1], ["Of course Stranger, but we better hurry. CSAT may move our man away at any time"],9]]
,[[[player], ["I agree, lets go"],4]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_start2 = [getposATL player, 100,0,"(1 - sea) * (1 + trees) * (1 + forest)",""] CALL SAOKSEEKPOS;
_actor2 = [WEST,(FRIENDC4 call RETURNRANDOM),150,_start2,objNull] CALL FUNKTIO_SPAWNACTOR;
{_x setcaptive false;_x setbehaviour "AWARE";_x enableAI "AUTOTARGET";_x enableAI "TARGET";[_x] join player;} foreach [_actor1,_actor2];
};
_nul = [[_obj,_obj2],120] SPAWN FUNKTIO_WAD;
deletemarker _mar5;
};
} else {
[] SPAWN SAOKLOWERRELVIL;
"Local villagers remember your insulting behaviour" SPAWN HINTSAOK;
_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
_header = format ["Locals Furious in %1, After Visit of Unfriendly Unknown English Speaking Military Units",_Lna];
[_header, date] CALL SAOKEVENTLOG;
};
waitUntil {sleep 4; vehicle player distance _start < 250};
_ran = CIVS1 call RETURNRANDOM;
_group = creategroup civilian;
_animal = _group createUnit [_ran, _start, [], 0, "form"];
_animal setvariable ["CivNo",1];
_animal setbehaviour "CARELESS";
_animal allowfleeing 0;
_animal allowdamage false;
_animal setdir (random 360);
_animal setpos _start;
_animal setidentity "Acacius_Georgopoulos";
DONTDELGROUPS = DONTDELGROUPS + [_group];
_na = 0;
_ggg = [];
while {_na < 6} do {
_na = _na + 1;
_stP = _pLoc call RETURNRANDOM;
if ({leader _x distance _stP < 10} count DONTDELGROUPS == 0) then {
_ran = CIVS1 call RETURNRANDOM;
_gr = creategroup civilian;
_an = _gr createUnit [_ran, _stP, [], 0, "form"];
_an setvariable ["CivNo",1];
_an setbehaviour "CARELESS";
_an allowfleeing 0;
_an allowdamage false;
_an setdir (random 360);
_an setpos _stP;
_ggg pushback _gr;
DONTDELGROUPS pushback _gr;
};
sleep 1;
};
// || {("ResHelp" in (missionnamespace getvariable "Progress"))}
waitUntil {sleep 4; vehicle player distance _animal < 40};
if (vehicle player distance _animal < 40) then {
"You will be able to talk with the POW once there isnt any alarmed CSAT soldier inside 80m radius" SPAWN HINTSAOK;
_animal dotarget player;
_animal dowatch player;
ODOTTANUT = 0;
_ff = {
private ["_b"];
_b = false; 
if (_this distance player < 15) then {
ODOTTANUT = ODOTTANUT + 1;
};
if (ODOTTANUT > 4) then {_b = true;};
_b
};
waitUntil {sleep 4; vehicle player distance _animal < 15 && {([_animal,player] CALL FUNKTIO_LOS || {_animal CALL _ff})} && {({alive _x && {side _x == EAST} && {behaviour _x == "COMBAT"}} count ((getposATL player) nearEntities [["Man"],50]) < 3)}};
ODOTTANUT = nil;
["Contact Man #1: I guess you have some reason to save me?",4] SPAWN SAOKTITLETEXT;
sleep 5;
[((name player)+": There is, we would want to chat with local resistance if there is one"),6] SPAWN SAOKTITLETEXT;
sleep 7;
["Contact Man #1: Lets get away from here. My name is Acacius Georgopoulos by the way",6] SPAWN SAOKTITLETEXT;
_pP = getposATL player;
_animal setpos _pP;
_a = 0;
_moveP = [(_pP select 0)+(sin _a)*1000,(_pP select 1)+(cos _a)*1000,0];
_animal enableAI "MOVE";
while {surfaceisWater _moveP && {_a < 360}} do {sleep 0.1;_a = _a + 5;_moveP = [(_pP select 0)+(sin _a)*1000,(_pP select 1)+(cos _a)*1000,0];};
group _animal move _moveP;
group _animal setspeedmode "FULL";
_aika = time + 60;
sleep 7;
["Georgopoulos: They found me at weapon catche yesterday, suspected I would be part of resistance.",6] SPAWN SAOKTITLETEXT;
sleep 7;
["Georgopoulos: And they were right, good thing you let me out.",6] SPAWN SAOKTITLETEXT;
sleep 7;
titletext ["","PLAIN DOWN",7];
waitUntil {sleep 3;_animal distance _pP > 300 || {_aika < time}};
deleteMarker _marker;
_nul = ["taskRR","SUCCEEDED"] call SAOKCOTASK;
_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
_header = format ["CSAT Prison Camp Under Attack near %1. Members of Resistance Rumoured to Have Broken Free?",_Lna];
[_header, date] CALL SAOKEVENTLOG;
} else {
deleteMarker _marker;
_nul = ["taskRR","FAILED"] call SAOKCOTASK;
};
_nul = [4] SPAWN MusicT;
DONTDELGROUPS = DONTDELGROUPS - [_group];
{DONTDELGROUPS = DONTDELGROUPS - [_x];_nul = [leader _x,""] SPAWN FHideAndDelete;} foreach _ggg;
_towerr setvariable ["DontRemove",nil];
_animal disableAI "MOVE";
_n = [
[getposATL _animal, player, _animal],
[],
[
[[[_animal], "",4]]
,[[[_animal], "I will continue alone from here. Could I do anything for you in return?",7]]
,[[[player], ["To push CSAT away, there needs to be also local forces to fight against them"],6]]
,[[[_animal], ["I am afraid that is not possible with our current leader Fox Crow"],7]]
,[[[_animal], ["With CSAT connections, he would die before supporting you guys"],7]]
,[[[_animal], ["But if you take him out or take him captive, I would likely to replace him..."],7]]
,[[[player], ["...and you would support us, I see. Well we better get going"],6]]
,[[[_animal], ["I will show you where to meet me once you got rid of the target"],7]]
,[[[_animal], ["Also remembering now one weapon catce that could help you bringing him down"],7]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1;scriptdone _n};
_nul = [_animal,""] SPAWN FHideAndDelete;
//sleep 5;
_nul = [] execVM "MainTasks\Task1_ConvertResistance.sqf";
[] SPAWN SAOKCIV1;
CurTaskS = CurTaskS - ["VillageTasks\TaskFindRes2.sqf"];
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;