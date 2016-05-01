private ["_now","_nul","_someId"];
CurTaskS set [count CurTaskS, "MainTasks\Resistance2.sqf"];
[] SPAWN SAOKFREEMORTAR;
[
WEST, // Task owner(s)
"taskResC", // Task ID (used when setting task state, destination or description later)
["In order to get resistance groups to work with us, we need to prove our lojalty and strenght by capturing any current persian camp for them. Retaking back old lost AAF camps dosent count.", "Capture any CSAT Camp", "Capture any CSAT Camp"], // Task description
objNull, // Task destination
true // true to set task as current upon creation
] call SAOKCRTASK;
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLOR, _this,1.51, 1.51, 0, (format ["Capture ANY CSAT Camp: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, (locationposition (["ColorRed"] CALL NEARESTCAMP))] call BIS_fnc_addStackedEventHandler;

sleep 5;
_p = SAOKMAPSIZE*0.5;
_now = (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]);
_nC = count _now;
waitUntil {sleep 25; count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]) > _nC};
pisteet = pisteet + 300;_nul = [300, "From Task"] SPAWN PRESTIGECHANGE;
["CSATBASE1"] SPAWN SAOKADDRANDOMEVENTS;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_nul = ["taskResC","SUCCEEDED"] call SAOKCOTASK;
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
