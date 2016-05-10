// This task is called from SAOKUSREQ in "TaskEvents.sqf" (at the end of it). It requires to capture two more piers or passages for NATO.
// This task unlocks tasks:
//	1) TERE1 : 
//	2) TEUS1 :
//	3) SA_EVEUZA : 

private ["_nul","_cur"];
CurTaskS set [count CurTaskS, "MainTasks\US1.sqf"];
_dat = (worldname CALL SAOKMAPDATA); 
_isWater = (_dat select 6);
_us = ["To get NATO support, we need to capture at least two piers for our use.<br/><br/><img image='arma3pier.jpg' width='360' height='202.5'/>", "Secure 2 Piers for NATO Support", "Secure 2 Piers for NATO Support"];
if !(_isWater) then {
	_us = ["To get NATO support, we need to capture at least two passages for our use.<br/><br/><img image='arma3pier.jpg' width='360' height='202.5'/>", "Secure 2 Passages for NATO Support", "Secure 2 Passages for NATO Support"];
};
[
	WEST, // Task owner(s)
	"taskUS1", // Task ID (used when setting task state, destination or description later)
	_us, // Task description
	objnull,		// Task destination
	true,			// true to set task as current upon creation
	-1,				// priority
	true,			// Notification?
	"Attack",		// 3d marker type
	false			// Shared?
] call BIS_fnc_taskCreate;

waitUntil {sleep 3;  {getmarkercolor _x == "ColorGreen"} count PierMarkers > 1};
pisteet = pisteet + 100;_nul = [100, "From Task"] SPAWN PRESTIGECHANGE;
"NATO Arrival" SPAWN SAOKCHAPTERADD;
_nul = [4] SPAWN MusicT;

"NATO military support also available now in the support menu and many squads have arrived on island and ready to be commanded in map view - M." SPAWN HINTSAOK;
"USHelp" CALL SAOKADDPROG;
_n = ["NATO"] SPAWN SAOKSPAWNBIGCAMP;
waitUntil {sleep 0.1; scriptdone _n};
SA_EVEUZA = compile preprocessfileLineNumbers "USZonesArrive.sqf";
_nul = [] SPAWN SA_EVEUZA;
CurTaskS = CurTaskS - ["MainTasks\US1.sqf"];
_nul = ["taskUS1","SUCCEEDED",true] call BIS_fnc_taskSetState;
[] SPAWN TERE1;
[] SPAWN TEUS1;
["CSATLAND"] SPAWN SAOKADDRANDOMEVENTS;
sleep 20;
[] SPAWN TASK_BlueZonesArrive;
sleep 120;
[] SPAWN TASK_BlueZonesArrive;