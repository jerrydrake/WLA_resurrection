private["_start2", "_d", "_st", "_st2", "_start4", "_size", "_start3", "_n", "_n2", "_nul", "_group", "_crowKing", "_someId", "_mar", "_marker", "_mar2", "_obj", "_car"];

CurTaskS = CurTaskS + ["MainTasks\Task1_ConvertResistance.sqf"];

sleep 5;
_d = 1000;
_start2 = [vehicle player, 1500, 500, "(1 - sea)* (1 + meadow)* (1 - hills)", ""] CALL SAOKSEEKPOS;

while {
	surfaceisWater _start2 || {!([_start2, 40] CALL SAOKISFLAT)
	} || {
		vehicle player distance _start2 < 500
	} || {
		count(_start2 nearRoads 40) > 0
	} || {!(_start2 CALL SAOKINMAP)
	}
}
do {
	sleep 0.1;
	_d = _d + 300;
	_start2 = [vehicle player, _d, 500, "(1 - sea)* (1 + meadow)* (1 - hills)", ""] CALL SAOKSEEKPOS;
	sleep 0.2;
};

if (count _this > 0) then {
	_start2 = _this select 0;
};
CurTaskS = CurTaskS - ["MainTasks\Task1_ConvertResistance.sqf"];
CurTaskS = CurTaskS + [
["MainTasks\Task1_ConvertResistance.sqf", _start2]
];

[
WEST, // Task owner(s)
"taskMT1", // Task ID (used when setting task state, destination or description later)
["We will not get resistance to fight for us as long their current leader Fox Crow have the command. Most of the resistance groups are only following him to stay alive. If we manage to kill, or even better make him surrender, a new leader will be chosen who will be most likely the POW we just saved. We would get much of the local groups to our side.", "Kill Fox Crow", "Kill Fox Crow"], // Task description
objNull, // Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Destroy",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

_start3 = [_start2, 200, 0, "(1 - sea) * (1 + meadow)", 300] CALL SAOKSEEKPOS;
_eOc =
if (isNil "IFENABLED") then {
	["O_G_Offroad_01_armed_F", "O_G_Offroad_01_armed_F"]
} else {
	["Lib_SdKfz251_captuRed", "Lib_SdKfz251_captuRed"]
};
if (count _this == 0) then {
	_n = [_start3, "ColorRed", _eOc] CALL AddVehicleZone;
};
sleep 1;
_start3 = [_start2, 200, 0, "(1 - sea) * (1 + meadow)", 300] CALL SAOKSEEKPOS;
_eOc =
if (isNil "IFENABLED") then {
	["O_G_Offroad_01_armed_F", "O_G_Offroad_01_armed_F"]
} else {
	["Lib_SdKfz251_captuRed", "Lib_SdKfz251_captuRed"]
};
if (count _this == 0) then {
	_n2 = [_start3, "ColorRed", _eOc] CALL AddVehicleZone;
};
sleep 1;
if (count _this == 0) then {
	_nul = [_start2, "RES", (15 + random 25)] SPAWN CreateRoadBlock;
};
_eOc =
if (isNil "IFENABLED") then {
	"O_G_officer_F"
} else {
	"LIB_SOV_captain"
};
if (!isNil "Eridanus") then {
	_eOc = "TEI_Ins_URF_Officer";
};
if (!isNil "CheConf") then {
	_eOc = "O_mas_cer_Soldier_off_F";
};
_group = [_start2, EAST, [_eOc],
[],
[],
[0.4, 0.8]
] call SpawnGroupCustom;
_nul = [units _group] SPAWN AICampBehaviour;
_crowKing = leader _group;
_crowKing setvariable["CantSur", 1];
DONTDELGROUPS = DONTDELGROUPS + [_group];
NUMM = NUMM + 1;
//icon = "\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling3_CA.paa";

["taskMT1", _crowKing] call BIS_fnc_taskSetDestination;
[
WEST, 			// Task owner(s)
["taskMT2","taskMT1"],		// Task ID (used when setting task state, destination or description later) or ["taskname","parentname"]
["Find the crate with sniper rifle to kill Fox Crow", "Find the crate", "Find the crate"],	// Task description
objnull,		// Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Search",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;


//_someId = format["IDSAOK%1", NUMM];
//[_someId, "onEachFrame", {
//	if (isNil "IC3D") exitWith {};
//	drawIcon3D["\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling3_CA.paa", ICONCOLORRED, getposATL _this, 1.51, 1.51, 0, (format["Neutralize Fox Crow: %1m", round(_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _crowKing] call BIS_fnc_addStackedEventHandler;
//_mar = format["MainTaskM%1", NUMM];
//NUMM = NUMM + 1;
//_marker = [_mar, getposATL _crowKing, "mil_destroy", [0.8, 0.8], "ColorRed", "Find and Kill Fox Crow"] CALL FUNKTIO_CREATEMARKER;
sleep 1;
_size = 1200;
_start4 = [_start2, 1200, 300, "(1 - sea) * (1 + trees)* (1 - hills)", ""] CALL SAOKSEEKPOS;
//_mar2 = format["MainTaskM%1", NUMM];
//NUMM = NUMM + 1;
//_marker = [_mar2, _start4, "mil_flag", [0.5, 0.5], "ColorGreen", "Crate with Sniper-Rifle"] CALL FUNKTIO_CREATEMARKER;

["taskMT2", _start4] call BIS_fnc_taskSetDestination;

_obj = createVehicle[((CRATECLAS select 2) call RETURNRANDOM), _start4, [], 0, "NONE"];
_obj setvariable["AmCrate", 1];
_obj setdir(random 360);
sleep 1;
_start3 = [_start2, 100, 0, "(1 - sea) * (1 + meadow)", 300] CALL SAOKSEEKPOS;
_car = createVehicle[(CIVVEH call RETURNRANDOM), _start3, [], 0, "NONE"];
_car setvariable["AmCrate", 1];
_car setdir(random 360);
//ESCAPE
[_crowKing, _car] SPAWN {
	private["_t", "_c"];
	_t = _this select 0;
	_c = _this select 1;
	waitUntil {
		sleep 10;
		isnull _t || {!alive _t
		} || {
			{
				side _x == EAST && {
					behaviour _x == "COMBAT"
				}
			}
			count((getposATL _t) nearEntities[["Man"], 100]) > 0
		}
	};
	_t setbehaviour "CARELESS";
	_t setspeedmode "FULL";
	_c setvariable["AmCrate", nil];
	if (!isnull _t && {
				alive _t
			} && {
				alive _c
			}) then {
		_t assignasdriver _c;
		[_t] ordergetin true;
		waitUntil {
			sleep 10;
			isnull _t || {!alive _t
			} || {
				_t in (crew _c)
			} || {!isNil {
					_t getvariable "SaOkSurrendeRed"
				}
			}
		};
		if (_t in (crew _c)) then {
			_t allowfleeing 1;
			"Target is trying to flee with vehicle"
			SPAWN HINTSAOK;
			_t setspeedmode "NORMAL";
			_t setbehaviour "AWARE";
		};
	};
};
clearWeaponCargo _obj;
clearMagazineCargo _obj;
clearBackPackCargo _obj;
clearItemCargo _obj;
_obj addweaponcargo["srifle_LRR_SOS_F", 1];
_obj addmagazinecargo["7Rnd_408_Mag", 7];
_obj additemcargo["optic_SOS", 1];
sleep 5;
if ({
			alive _x
		}
		count(units(group player)) > 1) then {
	[((name player) + ": We should probably check the crate that Acacius mentioned. Got the location marked on map"), 7] SPAWN SAOKTITLETEXT;
};
waitUntil {
	sleep 10;
	isNull _crowKing || {!alive _crowKing
	} || {!isNil {
			_crowKing getvariable "SaOkSurrendeRed"
		}
	}
};

_obj setvariable["AmCrate", nil];
_car setvariable["AmCrate", nil];
//deletemarker _mar;
//deletemarker _mar2;
_nul = ["taskMT1", "SUCCEEDED", true] call BIS_fnc_taskSetState;
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 4;
//_nul = [] execvm "Cutscenes\MeetResContact.sqf";
SA_CUTMRC = compile preprocessfileLineNumbers "Cutscenes\MeetResContact.sqf";
_nul = [] SPAWN SA_CUTMRC;
CurTaskS = CurTaskS - [
["MainTasks\Task1_ConvertResistance.sqf", _start2]
];
DONTDELGROUPS = DONTDELGROUPS - [_group];