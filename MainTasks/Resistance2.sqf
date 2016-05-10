// This task is called from SAOKRESREQ in TaskEvents.sqf. It is the request to capture any currently enemy-controlled camp. At the end two main tasks are available:
//	1) "Cutscenes\MeetRes.sqf" : to meet the head of local resistance;
//	2) "Cutscenes\USSitRep.sqf" : to make a SitRep with NATO.
private ["_now","_nul","_start"];
CurTaskS set [count CurTaskS, "MainTasks\Resistance2.sqf"];
[] SPAWN SAOKFREEMORTAR;
_start = (locationposition (["ColorRed"] CALL NEARESTCAMP));
[
	WEST, // Task owner(s)
	"taskResC", // Task ID (used when setting task state, destination or description later)
	["In order to get resistance groups to work with us, we need to prove our lojalty and strenght by capturing any current enemy camp for them. Retaking back old lost friendly camps dosent count.", "Capture any enemy Camp", "Capture any enemy Camp"], // Task description
	_start,		// Task destination
	true,			// true to set task as current upon creation
	-1,				// priority
	true,			// Notification?
	"Attack",		// 3d marker type
	false			// Shared?
] call BIS_fnc_taskCreate;

sleep 5;
_p = SAOKMAPSIZE*0.5;
_now = (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]);
_nC = count _now;
waitUntil {sleep 25; count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]) > _nC};
pisteet = pisteet + 300;_nul = [300, "From Task"] SPAWN PRESTIGECHANGE;
["CSATBASE1"] SPAWN SAOKADDRANDOMEVENTS;
_nul = ["taskResC","SUCCEEDED",true] call BIS_fnc_taskSetState;
_nul = [4] SPAWN MusicT;
sleep 5;
_nul  = [] SPAWN FSideTasks;
SA_CUTMR = compile preprocessfileLineNumbers "Cutscenes\MeetRes.sqf";
_nul = [] SPAWN SA_CUTMR;
CurTaskS = CurTaskS - ["MainTasks\Resistance2.sqf"];
SA_CUTUSSR = compile preprocessfileLineNumbers "Cutscenes\USSitRep.sqf";
_nul = [] SPAWN SA_CUTUSSR;
sleep 70;
[] SPAWN TASK_GreenZonesArrive;
