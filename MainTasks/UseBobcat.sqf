//TASK_Bobcat... This task, to remove barricades, is a random task called by random task generator

private ["_loc","_v","_vil","_vp","_ro","_dir","_veh","_mar","_marker","_max","_pRan","_pos","_start","_roads","_Tid","_Lna","_header","_desc","_mar2","_cars","_nul","_n"];
//player sidechat "I'm Starting...";
_loc = "";
_vil = (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 20000]);
while {count _vil > 0 && {typename _loc == "STRING"}} do {
	_v = _vil call RETURNRANDOM;
	_vil = _vil - [_v];
	_vp = locationposition _v;
	if ([_vp] CALL SAOKNEARVILRELA in ["Hostile","Angry"] && {{getmarkercolor _x in ["ColorGreen","ColorPink","ColorBlue"] && {getmarkerpos _x distance _vp < 3500}} count FacMarkers+PierMarkers+StoMarkers+StoMarkers > 0}) then {_loc = _v;};
	sleep 0.1;
};
player sidechat "I'm here...";
if (typename _loc == "STRING" || {{str _loc == _x select 0} count AMBbattles > 0}) exitWith {};
AMBbattles pushback [str _loc,"BOB"];
_start = locationposition _loc;
_roads = (_start nearRoads 80); 
if (count _roads == 0) exitWith {};
SUPF = SUPF * 0.75;
_Tid = format ["TaskBob%1",NUMM];
player sidechat "Can start the task...";
NUMM=NUMM+1;
_Lna = _start CALL NEARESTLOCATIONNAME;
_header = format ["Remove Blockades in %1",_Lna];
_desc = "Furious civilians have begun to block roads in this village, slowing down out supplies by one quarter. Get those erased, but avoid civilian casulties that would make things even worse. With bobcat or some other armored vehicle, this task should be easy. Keep eye on armed locals and IEDs.";
[
	WEST, // Task owner(s)
	_Tid, // Task ID (used when setting task state, destination or description later)
	[_desc, _header, _header], // Task description
	_start,			// Task destination
	true,			// true to set task as current upon creation
	-1,				// priority
	true,			// Notification?
	"Move",			// 3d marker type
	false			// Shared?
] call BIS_fnc_taskCreate;

//_mar2 = format ["SideTaskM%1",NUMM];
//NUMM=NUMM+1;
//_marker = [_mar2,_start, "mil_flag", [0.9,0.9], "ColorOrange", "Remove Blockades"] CALL FUNKTIO_CREATEMARKER;
waitUntil {sleep 5; vehicle player distance _start < 700};
_cars = [];
_max = 0;
while {count _cars < 4 && {_max < 10}} do {
	_max = _max + 1;
	_pRan = (_roads call RETURNRANDOM);
	_pos = getposATL _pRan;
	NUMM=NUMM+1;
	_SubTid = format ["%1_P%2",_Tid,NUMM];
	[
		WEST, // Task owner(s)
		[_SubTid,_Tid], // Task ID (used when setting task state, destination or description later)
		["Remove blocades on the road", "Remove blocade", "Remove Block"], // Task description
		_pos,			// Task destination
		true,			// true to set task as current upon creation
		-1,				// priority
		true,			// Notification?
		"Interact",		// 3d marker type
		false			// Shared?
	] call BIS_fnc_taskCreate;
		
	if ({_x distance _pos < 10} count _cars == 0) then {
		_veh = createVehicle [["C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"] call RETURNRANDOM, _pos, [], 0, "NONE"];
		_ro = (roadsConnectedTo _pRan); 
		_dir = random 360;
		
		if (count _ro > 0) then {_ro = _ro call RETURNRANDOM; _dir = ([getposATL _ro,getposATL _pRan] call SAOKDIRT) + ([90,270] call RETURNRANDOM);};
		_veh setdir _dir;
		_veh setpos _pos;
		_veh allowdamage false;
		_veh getvariable ["AmCrate",1];
		_veh setvariable ["Spos",_pos];
		_cars set [count _cars, _veh];
		//_mar = format ["CarM%1",NUMM];
		//NUMM=NUMM+1;
		//_marker = [_mar,getposATL _veh, "mil_flag", [0.8,0.8], "ColorRed", "Push the Car Away"] CALL FUNKTIO_CREATEMARKER;
		_veh SPAWN {waitUntil {sleep 4; {isNull _this} || {!isOnroad (getposATL _this)} || {(_this distance _pos > 15)}};_nul = [_SubTid,"SUCCEEDED",true] call BIS_fnc_taskSetState; if !(isNull _this) then {"Car Blockade Erased" SPAWN HINTSAOK;};};
	};
	sleep 0.1;
};
waitUntil {sleep 10; {isOnroad (getposATL _x) && {_x distance (_x getvariable "Spos") < 15}} count _cars == 0};
{_x getvariable ["AmCrate",nil];_x allowdamage true;} foreach _cars;
_nul = [_Tid,"SUCCEEDED",true] call BIS_fnc_taskSetState;
SUPF = SUPF / 0.75;
//deletemarker _mar2;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
{if (str _loc == _x select 0) exitWith {AMBbattles deleteAT _foreachIndex;};} foreach AMBbattles;
