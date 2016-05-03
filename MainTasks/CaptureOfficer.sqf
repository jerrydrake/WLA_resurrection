private["_c", "_r", "_roads", "_start", "_p", "_ar", "_vz", "_someId", "_wp", "_nul", "_b", "_h", "_aika", "_off", "_start2", "_n"];
_start = [];

if (count _this == 0 || {
		typename(_this select 0) == "STRING"
	}) then {
	CurTaskS set[count CurTaskS, "maintasks\CaptureOfficer.sqf"];
	if (count _this == 0) then {
		_c = "";
		_p = SAOKMAPSIZE * 0.5; {
			if (typename _c == "STRING" || {
					locationposition _x distance player > locationposition _c distance player
				}) then {
				_c = _x
			};
		}
		foreach(nearestLocations[[_p, _p, 0], ["CampR"], SAOKMAPSIZE * 0.7]);
		_start =
			if (_c != "") then {
				locationposition _c
			} else {
				[(vehicle player), 6000, 2000, "(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS
			};
		_r = 200;
		_roads = (_start nearRoads _r);
		while {
			count _roads == 0
		}
		do {
			_r = _r + 40;
			_roads = (_start nearRoads _r);
		};
		_start = getposATL(_roads select 0);
		gameLogic1 globalchat(format[localize "STR_milT3_l1", (_start CALL NEARESTLOCATIONNAME)]);
		sleep 7;
		player sidechat localize "STR_milT3_l2";
	};

	[
		WEST, // Task owner(s)
		"taskF", // Task ID (used when setting task state, destination or description later) or ["taskname","parentname"]
		["CSAT is getting weaker, we have spotted possible convoy carrying CSAT commander. We need to capture him and alive if possible.", "Track Down Fleeing CSAT Commander", "Track Down Fleeing CSAT Commander"], // Task description
		objnull, // Task destination
		true, // true to set task as current upon creation
		-1, // priority
		true, // Notification?
		"Default", // 3d marker type
		false // Shared?
	] call BIS_fnc_taskCreate;

	[
		WEST, // Task owner(s)
		["taskF1", "taskF"], // Task ID (used when setting task state, destination or description later)
		["We need to capture enemy commander alive if possible.", "Stop enemy convoy", "Stop enemy convoy"], // Task description
		objNull, // Task destination
		true, // true to set task as current upon creation
		-1, // priority
		true, // Notification?
		"Destroy", // 3d marker type
		false // Shared?
	] call BIS_fnc_taskCreate;

	_ar = [(ARMEDVEHICLES select 1) call RETURNRANDOM, (ARMEDVEHICLES select 1) call RETURNRANDOM, (ARMEDAA select 1) call RETURNRANDOM, (ARMEDTANKS select 1) call RETURNRANDOM];
	//_ar = [(ARMEDVEHICLES select 1)call RETURNRANDOM];
	_vz = "";
	_vz =
		if (count _this == 0 || {!((_this select 0) in VEHZONESA)
			}) then {
			[_start, "ColorRed", _ar] CALL AddVehicleZone
		} else {
			_this select 0
		};
	CurTaskS = CurTaskS - ["maintasks\CaptureOfficer.sqf"];
	CurTaskS set[count CurTaskS, ["maintasks\CaptureOfficer.sqf", _vz]];


	SZONES set[count SZONES, _vz];
	//NUMM = NUMM + 1;
	//_someId = format ["IDSAOK%1",NUMM];
	//[_someId, "onEachFrame", {
	//	if (isNil"IC3D") exitWith {};
	//	drawIcon3D ["\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling3_CA.paa", ICONCOLORRED, locationposition _this,1.51, 1.51, 0, (format ["Track Down Commander: %1m",round (getmarkerpos _this distance player)]), 1, SAOKFSI, "TahomaB"];
	//}, _vz] call BIS_fnc_addStackedEventHandler;
	_start = locationposition _vz;
	["taskF1", _start] call BIS_fnc_taskSetDestination;

	_p = PierMarkers call RETURNRANDOM;
	while {
		getmarkercolor _p == "ColorGreen" && {
			{
				getmarkercolor _x != "ColorGreen"
			}
			count PierMarkers > 4
		}
	}
	do {
		_p = PierMarkers call RETURNRANDOM;
	};
	_wp = [getmarkerpos _p, 100, 0, "(1 - sea)"] CALL SAOKSEEKPOS;
	[_vz, [], _wp] SPAWN SAOKFINDROUTEANDMOVE;
	while {
		_vz in VEHZONESA && {
			(_vz getvariable "Mcolor") == "ColorRed"
		}
	}
	do {
		if (locationposition _vz distance[0, 0, 0] > 100 && {!surfaceisWater(locationposition _vz)
			}) then {
			_start = locationposition _vz;
		};
		sleep 4;
	};
	_nul = ["taskF1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
	//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	SZONES = SZONES - [_vz];
	CurTaskS = CurTaskS - [
		["maintasks\CaptureOfficer.sqf", _vz]
	];
} else {
	_start = _this select 0;
};
CurTaskS set[count CurTaskS, ["maintasks\CaptureOfficer.sqf", _start]];
_eOc =
	if (isNil "IFENABLED") then {
		"O_officer_F"
	} else {
		"LIB_SOV_captain"
	};
if (!isNil "Eridanus") then {
	_eOc = "TEI_Ins_URF_Officer";
};
if (isClass(configFile >> "cfgVehicles" >> "rhs_msv_officer")) then {
	_eOc = "rhs_msv_officer";
};
if (!isNil "CheConf") then {
	_eOc = "O_mas_cer_Soldier_off_F";
};
_off = leader([_start, EAST, [_eOc],
	[],
	[],
	[0.4, 0.8]
] call SpawnGroupCustom);
_off allowdamage false;
_off setcaptive true;
_off setbehaviour "CARELESS";
_off setunitpos "UP";
_off setspeedmode "FULL";
DONTDELGROUPS set[count DONTDELGROUPS, group _off];
UNITSTOSUR set[count UNITSTOSUR, _off];
_off setvariable["NoTalkative", 1];
removeallweapons _off;
_start2 = [_start] CALL SAOKNEARVILP;
_wp = [_start2, 220, 40, "(1 - sea)"] CALL SAOKSEEKPOS;
_off domove _wp;

gameLogic1 globalchat localize "STR_milT3_l3";
sleep 7;
player sidechat localize "STR_milT3_l4";
sleep 7;
gameLogic1 globalchat localize "STR_milT3_l5";
[
	WEST, // Task owner(s)
	["taskF2", "taskF"], // Task ID (used when setting task state, destination or description later)
	["CSAT convoy is destroyed, we need to search the site to find possible CSAT commander.", "Investigate the Site", "Investigate the Site"], // Task description
	_start, // Task destination
	true, // true to set task as current upon creation
	-1, // priority
	true, // Notification?
	"Search", // 3d marker type
	false // Shared?
] call BIS_fnc_taskCreate;

//NUMM = NUMM + 1;
//_someId = format ["IDSAOK%1",NUMM];
//[_someId, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Investigate the Site: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _start] call BIS_fnc_addStackedEventHandler;
waitUntil {
	sleep 5;
	player distance _start < 30 || {
		player distance _off < 30
	}
};
//_n = ["taskF1"] CALL BIS_fnc_deleteTask;
_nul = ["taskF2", "SUCCEEDED", true] call BIS_fnc_taskSetState;
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_b = false;
if (player knowsabout _off > 1 || {
		[_off, player] CALL FUNKTIO_LOS
	}) then {
	_b = true;
};
if (_b) then { // _b == true;
	_h = ["You have spotted commander fleeing the wreck site, run after him!", "Run After the Commander", "Run After the Commander"];
	_position = getPosATL _off;
} else { // _b == false;
	_h = ["No sight of CSAT commander near the convoy wrecks, he must continue fleeing. Better check the nearby village.", "Search Nearby Village", "Search Nearby Village"];
	_position = _start;
};
_start = [_start] CALL SAOKNEARVILP;
NUMM = NUMM + 1;
_someId = format["IDSAOK%1", NUMM];
//if !(_b) then {
//[_someId, "onEachFrame", {
//if (isNil"IC3D") exitWith {};
//drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Search the Location: %1m",round (_this distance player)]), 1, SAOKFSI, //"TahomaB"];
//}, _start] call BIS_fnc_addStackedEventHandler;
//} else {
//[_someId, "onEachFrame", {
//if (isNil"IC3D") exitWith {};
//drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORRED,getposATL  _this,1.51, 1.51, 0, (format ["Chase the Commander: %1m",round (getposATL _this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _off] call BIS_fnc_addStackedEventHandler;
//};

[
	WEST, // Task owner(s)
	["taskF3", "taskF"], // Task ID (used when setting task state, destination or description later)
	_h, // Task description
	_position, // Task destination
	true, // true to set task as current upon creation
	-1, // priority
	true, // Notification?
	"Destroy", // 3d marker type
	false // Shared?
] call BIS_fnc_taskCreate;

if (!_b) then {
	_aika = time + 60;
	waitUntil {
		sleep 3;
		_aika < time || {!isNil {
				_off getvariable "SaOkSurrendeRed"
			}
		}
	};
	if (_aika < time) then {
		gameLogic1 globalchat localize "STR_milT3_l5b";
		//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		//NUMM = NUMM + 1;
		//[_someId, "onEachFrame", {
		//	if (isNil"IC3D") exitWith {};
		//	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORRED,getposATL  _this,1.51, 1.51, 0, (format ["Chase the Commander: %1m",round (getposATL _this distance player)]), 1, SAOKFSI, "TahomaB"];
		//}, _off] call BIS_fnc_addStackedEventHandler;
	};
};
waitUntil {
	sleep 3;
	isNull _off || {!isNil {
			_off getvariable "SaOkSurrendeRed"
		}
	}
};
//_n = ["taskF2"] CALL BIS_fnc_deleteTask;
_nul = ["taskF3", "SUCCEEDED", true] call BIS_fnc_taskSetState;
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
//dostop _off;
_off disableAI "move";
_n = [
	[getposATL player, player, _off],
	[],
	[
		[
			[
				[_off],
				["Okay, okay. I surrender"], 5
			]
		],
		[
			[
				[_off], "Threat me good and I spill the beans", 6
			]
		],
		[
			[
				[player], "You will be transported to interrogation in no time", 7
			]
		]
	]
] SPAWN SAOKCUTSCENE;
waitUntil {
	sleep 0.1;
	scriptdone _n
};
player sidechat localize "STR_milT3_l6";
sleep 7;
gameLogic1 globalchat localize "STR_milT3_l7";
//_off dofollow _off;
_off setvariable["NoutoSide", west];
_off spawn SAOKCPICK;

_aika = time + 300;

_position = getPosATL _off;
[
	WEST, // Task owner(s)
	"taskF4", // Task ID (used when setting task state, destination or description later)
	["We must keep eye on the commander until chopper arrives to pick him up.", "Hold Commander Until Pick Up", "Hold Commander Until Pick Up"], // Task description
	_position, // Task destination
	true, // true to set task as current upon creation
	-1, // priority
	true, // Notification?
	"Defend", // 3d marker type
	false // Shared?
] call BIS_fnc_taskCreate;

waitUntil {
	sleep 3;
	isNull _off || {
		vehicle _off != _off
	} || {
		_aika < time
	}
};
DONTDELGROUPS = DONTDELGROUPS - [_off];
if (_aika < time) then {
	_off SPAWN SAOKDELINBLACK;
};
gameLogic1 globalchat localize "STR_milT3_l8";
//_n = ["taskF3"] CALL BIS_fnc_deleteTask;
CurTaskS = CurTaskS - [
	["maintasks\CaptureOfficer.sqf", _start]
];
_nul = ["taskF4", "SUCCEEDED", true] call BIS_fnc_taskSetState;
_nul = ["taskF", "SUCCEEDED", true] call BIS_fnc_taskSetState;
CapturedAll = CapturedAll + 1;
sleep 20;
_n = ["taskF"] CALL BIS_fnc_deleteTask;