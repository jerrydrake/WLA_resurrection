private ["_g","_total","_ran","_num"];
waitUntil {sleep 1; !isNil"StartMission"};
sleep 15;
{
if (isNil{(_x getvariable "BirdNum")}) then {
_num = _x addEventHandler ["FiRed",{(_this select 0) SPAWN ScaredBirdsOnce;}];
_x setvariable ["BirdNum",_num];
};
} foreach units group player;
while {true} do {
sleep (300+(random 700));

if ("USHelp" in (missionnamespace getvariable "Progress") && {{(_x getvariable "Mcolor") == "ColorBlue"} count VEHZONES < 15} && {!(random 1.2 < 0.5*DIFLEVEL)}) then {
_rType = ["T","C","P","C","R"]call RETURNRANDOM;
["WEST",_rType,([1,2,3,4] call RETURNRANDOM)] SPAWN SAOKMOREVEHZONES;
if (random 1 < 0.1) then {
_rType = ["T","C","P","C","R"]call RETURNRANDOM;
["WEST",_rType,([1,2,3,4] call RETURNRANDOM)] SPAWN SAOKMOREVEHZONES;
};
};

[] SPAWN SAOKTRANDOMEVENT;
[] SPAWN SAOKTMSKILLUP;
if (random 1 < 0.5*DIFLEVEL) then {[] SPAWN SAOKCSATTOWARDCAMP;};
if (random 1 < 0.5*DIFLEVEL) then {[""] SPAWN SAOKCSATTOWARDCAMP;};
{
if (isNil{(_x getvariable "BirdNum")}) then {
_num = _x addEventHandler ["FiRed",{(_this select 0) SPAWN ScaredBirdsOnce;}];
_x setvariable ["BirdNum",_num];
};
} foreach units group player;



VarPG = [2,3,4] call RETURNRANDOM;
if (DIFLEVEL < 1) then {VarPG = [2,3] call RETURNRANDOM;};
if (DIFLEVEL == 2) then {VarPG = [3,4,5] call RETURNRANDOM;};
//VarArty = (random 0.7);
EVEHMAX = [1,2] call RETURNRANDOM;
if (DIFLEVEL < 1) then {EVEHMAX = [0,1] call RETURNRANDOM;};
if (DIFLEVEL == 2) then {EVEHMAX = [1,2,3] call RETURNRANDOM;};
FVEHMAX = [0,1] call RETURNRANDOM;
FINFMAX = [1,2] call RETURNRANDOM;
if (DIFLEVEL < 1) then {FINFMAX = [0,1] call RETURNRANDOM;};
VarReUnits = 3 + (random 4);
VarReEnemies = 5 + (random 10);
if (DIFLEVEL == 2) then {VarReEnemies = 8 + (random 15);};
VarTRChop = [true,true,false,false] call RETURNRANDOM;

/*
{
//"Mad of your actions"
if (random 1 < 0.1 && {(missionnamespace getvariable "CKills") > 1}) then {
if (isNil{_x getvariable "Relationship"}) exitWith {_x Setvariable ["Relationship","Mad of your actions"];};
if (_x getvariable "Relationship" == "Happy") exitWith {_x Setvariable ["Relationship",nil];};
};

if (random 1 < 0.4) then {
if (isNil{_x getvariable "TiRed"}) exitWith {_x Setvariable ["TiRed","TiRed"];};
if (_x getvariable "TiRed" == "TiRed") exitWith {_x Setvariable ["TiRed","Very TiRed"];};
if (_x getvariable "TiRed" == "Very TiRed") exitWith {_x Setvariable ["TiRed","Exhausted"];};
};
if (random 1 < 0.4) then {
if (isNil{_x getvariable "Sickness"}) exitWith {
_ran = ["Flu","Hand Injury","Knee Problem"] call RETURNRANDOM;
_x Setvariable ["Sickness",_ran];
};
};

_nV = (player CALL SAOKNEARESTVIL);
if ([_nV,"A"] CALL SAOKVILCON) then {
if (random 1 < 0.3 && {[_nV,"A"] CALL SAOKVILCON == "Hostile"}) then {
_x Setvariable ["Mental","Worried"];
};
if (random 1 < 0.3 && {[_nV,"A"] CALL SAOKVILCON == "Angry"}) then {
_x Setvariable ["Mental","Stressed"];
};
if (random 1 < 0.3 && {[_nV,"A"] CALL SAOKVILCON == "Friendly"}) then {
_x Setvariable ["Relationship","Happy"];
};
};

if (random 1 < 0.5) then {
_ran = ["Stressed","Homesick"] call RETURNRANDOM;
_x Setvariable ["Mental",_ran];
};


if (random 1 < 0.4 && {!isNil{_x getvariable "CKills"}} && {!isNil{_x getvariable "FKills"}}) then {
_total = (_x getvariable "CKills")+(_x getvariable "FKills");
if (_total == 1) exitWith {
_ran = ["Upset"] call RETURNRANDOM;
_x Setvariable ["Mental",_ran];
};
if (_total == 2) exitWith {
_ran = ["Very Upset"] call RETURNRANDOM;
_x Setvariable ["Mental",_ran];
};
if (_total > 2) exitWith {
_ran = ["Very Upset"] call RETURNRANDOM;
_x Setvariable ["Mental",_ran];
if (random 1 > 0.5) then {
hint "Team-member lost his mind of friendly kills";
_g = createGroup WEST;
[_x] join _g;
[_x] SPAWN FUNKTIO_ANTAUDU;
};
};

};
} forEach units group player;
*/
if (!isNil"PNEEDS") then {
//PLAYER CONDITION TASKS
if (random 1 < 0.1 && {!(["TaskKipea"] CALL BIS_fnc_taskExists)}) then {
TKipea = true;
[
WEST, // Task owner(s)
"TaskKipea", // Task ID (used when setting task state, destination or description later)
["You are feeling little sick, try to find medicines from houses using Y to pick up objects or stop by at any friendly camp and use wait time function (Shift+1). Finding medicine from houses gives prestige bonus.", "Find Medicine", "Find Medicine"], // Task description
objnull,		// Task destination
false,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Default",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

};
if (random 1 < 0.1 && {!(["TaskVasynyt"] CALL BIS_fnc_taskExists)}) then {
TVasynyt = true;
[
WEST, // Task owner(s)
"TaskVasynyt", // Task ID (used when setting task state, destination or description later)
["You are feeling tired. Find a safe place to take nap using wait time function in WLA menu. (Shift+1)", "Take a Rest", "Take a Rest"], // Task description
objnull,		// Task destination
false,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Default",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

};
if (random 1 < 0.25 && {!(["TaskNalka"] CALL BIS_fnc_taskExists)}) then {
TNalka = true;
[
WEST, // Task owner(s)
"TaskNalka", // Task ID (used when setting task state, destination or description later)
["You are getting hungry, try to find food from houses using Y to pick up objects or stop by at any friendly camp and use wait time function in WLA menu (Shift+1). Finding food from houses gives prestige bonus.", "Find Something to Eat", "Find Something to Eat"], // Task description
objnull,		// Task destination
false,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Default",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

};
if (random 1 < 0.4 && {!(["TaskJano"] CALL BIS_fnc_taskExists)}) then {
TJano = true;
[
WEST, // Task owner(s)
"TaskJano", // Task ID (used when setting task state, destination or description later)
["You are getting thirsty, try to find something to drink from houses using Y to pick up objects or stop by at any friendly camp and use wait time function in WLA menu (Shift+1). Finding something to drink from houses gives prestige bonus.", "Find Something to Drink", "Find Something to Drink"], // Task description
objnull,		// Task destination
false,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Default",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

};
};
};
