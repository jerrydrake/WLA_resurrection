if ("Cutscenes\USSitRep.sqf" in CurTaskS || {"MainTasks\US1.sqf" in CurTaskS} || {"SAOKUSREQ" in CurTaskS}) exitWith {};
CurTaskS = CurTaskS + ["Cutscenes\USSitRep.sqf"];
sleep (60 + (random 60));
//if ("USHelp" in (missionnamespace getvariable "Progress")) exitWith {};
_start2 = [player,2300,300,"(1 - sea) * (1 + trees) * (1 + forest)",""] CALL SAOKSEEKPOS;
_d = 2300;
while {surfaceiswater _start2} do {
sleep 0.5;
_d = _d + 10;
_start2 = [player,_d,300,"(1 - sea) * (1 + trees) * (1 + forest)",""] CALL SAOKSEEKPOS;
};
_obj = createVehicle ["FirePlace_burning_F", _start2, [], 0, "NONE"]; 
_tT = "Land_TentDome_F";
if (!isNil"IFENABLED") then {_tT = "Land_TentA_F";};
_obj2 = createVehicle [_tT,[(_start2 select 0) - 4, (_start2 select 1) + 4, 0], [], 0, "NONE"]; 

_Lna = _start2 CALL NEARESTLOCATIONNAME;
_header = format ["NATO SitRep near %1",_Lna];
[
WEST, // Task owner(s)
"taskUS0", // Task ID (used when setting task state, destination or description later)
["Its time to do SitRep-meeting with Team Owl, to prepare entry for NATO.", _header, _header], // Task description
_start2,//[21857.4,10972.3,0], // Task destination
true, // true to set task as current upon creation
-1,
true,
"Default",
false
] call BIS_fnc_taskCreate;
//NUMM=NUMM+1;
//_someId = format ["IDSAOK%1",NUMM];
//[_someId, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["NATO SitRep: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _start2] call BIS_fnc_addStackedEventHandler;
//_mar = format ["MainTaskM%1",NUMM];
//NUMM=NUMM+1;
//_marker = [_mar,_start2, "mil_flag", [0.8,0.8], "ColorBlue", "NATO SitRep"] CALL FUNKTIO_CREATEMARKER;
gameLogic1 globalchat localize "STR_milC2_l1";
sleep 7;
player sidechat localize "STR_milC2_l2";
waitUntil {sleep 5; vehicle player distance _start2 < 60};
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
//deletemarker _marker;
_nul = ["taskUS0","SUCCEEDED", true] call BIS_fnc_taskSetState;
_nul = [4] SPAWN MusicT;
_actor1 = [WEST,"B_recon_JTAC_F",150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_n = [
[_start2, player, _actor1],
[],
[
[[[player], "",4]]
,[[[player], "CSAT is holding the whole island. Green army have mostly fled but there is resistance movement taking arms.",9]]
,[[[player], "I will try to aid Green forces back to this island, but that wont still be enough to beat the enemy.",8]]
,[[[_actor1], ["Understood, I will inform HQ. But before Papa Bear sends more forces in, he have set some more objectives for you."],9]]
,[[[_actor1], ["One quarter of CSAT camps need to be captured or you need find more popularity in local resistance."],8]]
,[[[player], "Understood, I keep you updated.",5]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_n = [] SPAWN SAOKUSREQ;
CurTaskS = CurTaskS - ["Cutscenes\USSitRep.sqf"];
_nul = [[_actor1]] SPAWN AICampBehaviour;
sleep 5;
_nul = [[_actor1,_obj,_obj2],120] SPAWN FUNKTIO_WAD;



