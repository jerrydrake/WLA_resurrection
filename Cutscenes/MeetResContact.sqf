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
	_start2, // Task destination
	true, // true to set task as current upon creation
	-1,
	true,
	"Interact",
	false
] call BIS_fnc_taskCreate;

waitUntil {sleep 5; vehicle player distance _start2 < 60};

_nul = ["taskMEET1","SUCCEEDED", true] call BIS_fnc_taskSetState;
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
