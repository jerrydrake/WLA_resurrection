CurTaskS = CurTaskS + ["Cutscenes\MeetResContact.sqf"];



_start2 = [player,800,300,"(1 + meadow)  * (1 - sea) * (1 - hills)",""] CALL SAOKSEEKPOS;
_d = 800;
while {surfaceiswater _start2} do {
sleep 0.5;
_d = _d + 10;
_start2 = [player,_d,300,"(1 + meadow)  * (1 - sea) * (1 - hills)",""] CALL SAOKSEEKPOS;
};

_obj = createVehicle ["FirePlace_burning_F", _start2, [], 0, "NONE"]; 
_obj2 = createVehicle ["Land_TentA_F",[(_start2 select 0) - 4, (_start2 select 1) + 4, 0], [], 0, "NONE"]; 

[
WEST, // Task owner(s)
"taskMEET1", // Task ID (used when setting task state, destination or description later)
["Our target is dead, we should head to meet Georgopoulos to get current sitrep from him.", "Meet Georgopoulos", "Meet Georgopoulos"], // Task description
objNull, // Task destination
true
] call SAOKCRTASK;
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Meet Georgopoulos: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _start2] call BIS_fnc_addStackedEventHandler;
_mar = format ["MainTaskM%1",NUMM];
NUMM=NUMM+1;
_marker = [_mar,_start2, "mil_flag", [0.8,0.8], "ColorBlue", "Meet Georgopoulos"] CALL FUNKTIO_CREATEMARKER;
waitUntil {sleep 5; vehicle player distance _start2 < 60};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
deletemarker _marker;

_nul = ["taskMEET1","SUCCEEDED"] call SAOKCOTASK;
_nul = [4] SPAWN MusicT;

_actor1 = [WEST,"I_G_Soldier_GL_F",100,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_actor1 setidentity "Acacius_Georgopoulos";
_n = [
[_start2, player, _actor1],
[],
[
[[[player], "",4]]
,[[[player], "How things are going for you? Any support from locals yet?",7]]
,[[[_actor1], ["Got a good start, at least, getting already some small groups behind me"],8]]
,[[[_actor1], ["But I badly need more men and gear. There is a village nearby with armed local presence"],9]]
,[[[_actor1], ["If you would help them to beat some CSAT patrols, they probably would be more interested to join behind me"],11]]
,[[[player], "I will do it, shouldn't be a challenging task",5]]
,[[[_actor1], ["Great to hear, good luck"],4]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
CurTaskS = CurTaskS - ["Cutscenes\MeetResContact.sqf"];
[] SPAWN SAOKRESREQ;
sleep 5;
_nul = [_actor1,""] SPAWN FHideAndDelete;
_nul = [[_obj,_obj2],120] SPAWN FUNKTIO_WAD;
