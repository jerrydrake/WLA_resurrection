//MISSION WRECK LOCATION
private ["_ranP","_roads","_wreC","_c","_array","_offS","_cT","_l","_classes","_nul","_locat","_defender","_Tid","_Lna","_header","_desc","_obj","_waypoints","_Bp","_posB","_group","_offi1","_n","_TaskT","_timer","_ucc","_st2","_start3","_car","_start2","_size","_random","_locationA","_uCar","_unitrate","_wp1","_pP","_someId","_gGs"];

_pP = getposATL player;
_ranP = [(_pP select 0)+3000-(random 6000),(_pP select 1)+3000-(random 6000),0];
_roads = (_ranP nearRoads 450);
while {count _roads == 0} do {
_ranP = [(_pP select 0)+3000-(random 6000),(_pP select 1)+3000-(random 6000),0];
_roads = (_ranP nearRoads 450);
};
_locat = getposATL (_roads select 0);
//TASK (random side)
//_TaskT = ["Def","Att"] call RETURNRANDOM;
_TaskT = if (_this == 1) then {"Def"} else {"Att"};
_Tid = format ["TaskOff%1",NUMM];
NUMM=NUMM+1;
_Lna = _locat CALL NEARESTLOCATIONNAME;
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
if (_TaskT == "Def") then {
_header = format ["Save Officer near %1",_Lna];
_desc =("One of our officers have been attacked damaging his car. We need to get him alive there as soon as possible before enemy searches the area. Look him from nearby houses and other hiding places.");
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
objNull, // Task destination
"CREATED"  
] call SAOKCRTASK;
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORGREEN, _this,1.51, 1.51, 0, (format ["Find and Rescue Officer: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _locat] call BIS_fnc_addStackedEventHandler;
} else {
_header = format ["Find and Kill Officer near %1",_Lna];
_desc =("Our strike against car carrying hostile officer have failed it seems. We need some team to investigate the area and finish the job. Search for nearby houses and other hiding places.");
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
objNull, // Task destination
"CREATED"  
] call SAOKCRTASK;
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling3_CA.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Find and Kill CSAT Officer: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _locat] call BIS_fnc_addStackedEventHandler;
};
_wreC = "Land_Wreck_Hunter_F";
if !(_TaskT == "Def") then {_wreC = "Land_Wreck_Offroad_F";};
_obj = createVehicle [_wreC,_locat, [], 0, "NONE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setdir (random 360);
waitUntil {sleep 5; player distance _locat < 1000};
_waypoints = [];
_l = 60;
_offS = [(_locat select 0)+_l-(random _l)*2,(_locat select 1)+_l-(random _l)*2, 0];
_cT = nearestBuilding _offS;
while {count _waypoints == 0} do {
sleep 1;
_offS = [(_locat select 0)+_l-(random _l)*2,(_locat select 1)+_l-(random _l)*2, 0];
_cT = nearestBuilding _offS;
_c = 0;
_waypoints = _cT call SAOKBUILDINGPOS;
_l = _l + 20;
};
_classes = if (isNil"IFENABLED") then {["O_officer_F"]} else {["LIB_SOV_captain"]}; 
if (!isNil"Eridanus") then {_classes  = ["TEI_Ins_URF_Officer"];};
if (!isNil"CheConf") then {_classes = ["O_mas_cer_Soldier_off_F"];};
_defender = EAST;
if (isClass(configFile >> "cfgVehicles" >> "rhs_msv_officer")) then {_classes = ["rhs_msv_officer"];};
if (_TaskT == "Def") then {
_classes = if (isNil"IFENABLED") then {["I_officer_F"]} else {["LIB_GER_hauptmann"]}; 
if (!isNil"Eridanus") then {_classes  = ["TEI_UNSC_Marine_Officer"];};
_defender = WEST;
if (!isNil"CheConf") then {_classes = ["I_mas_cer_Soldier_off_F"];};
};
_Bp = _waypoints call RETURNRANDOM;
_posB = _cT buildingPos _Bp;
_group = [_posB, _defender, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
_offi1 = leader _group;
_offi1 setpos _posB;
_offi1 setvariable ["CantSur",1];
DONTDELGROUPS = DONTDELGROUPS + [_group];

//GUARDS
_gGs = [];
if (_TaskT != "Def") then {
_ucc = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_group = [_posB, EAST, [_ucc call RETURNRANDOM],[],[],[0.4,0.8]] call SpawnGroupCustom;
_nul = [units _group] SPAWN AICampBehaviour;
DONTDELGROUPS = DONTDELGROUPS + [_group];
_gGs set [count _gGs, _group];
_ucc = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_group = [_posB, EAST, [_ucc call RETURNRANDOM],[],[],[0.4,0.8]] call SpawnGroupCustom;
_nul = [units _group] SPAWN AICampBehaviour;
DONTDELGROUPS = DONTDELGROUPS + [_group];
_gGs set [count _gGs, _group];
_ucc = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_group = [_posB, EAST, [_ucc call RETURNRANDOM],[],[],[0.4,0.8]] call SpawnGroupCustom;
_nul = [units _group] SPAWN AICampBehaviour;
DONTDELGROUPS = DONTDELGROUPS + [_group];
_gGs set [count _gGs, _group];
_ucc = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_group = [_posB, EAST, [_ucc call RETURNRANDOM],[],[],[0.4,0.8]] call SpawnGroupCustom;
_nul = [units _group] SPAWN AICampBehaviour;
DONTDELGROUPS = DONTDELGROUPS + [_group];
_gGs set [count _gGs, _group];
};


if (_defender != WEST) then {
_start3 = [getposATL _offi1, 50,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_car = createVehicle [(CIVVEH call RETURNRANDOM),_start3, [], 0, "NONE"]; 
_car setvariable ["AmCrate",1];
_car setdir (random 360);
[_offi1,_car] SPAWN {
_t = _this select 0;_c = _this select 1;
waitUntil {sleep 10; isnull _t || {!alive _t} || {{side _x == EAST && {behaviour _x == "COMBAT"}} count ((getposATL _t) nearEntities [["Man"],100]) > 0}};
_t setbehaviour "CARELESS";
_t setspeedmode "FULL";
_c setvariable ["AmCrate",nil];
if (!isnull _t && {alive _t} && {alive _c}) then {
_t assignasdriver _c; [_t] ordergetin true;
waitUntil {sleep 10; isnull _t || {!alive _t} || {_t in (crew _c)}};
if (_t in (crew _c)) then {
_t allowfleeing 1;"Target is trying to flee with vehicle" SPAWN HINTSAOK;_t setspeedmode "NORMAL";_t setbehaviour "AWARE";
_w = (group _t) addWaypoint [(locationposition (["ColorRed"] CALL NEARESTCAMP)), 0]; 
};
};
};
};

_timer = time + 1200;
waitUntil {sleep 5; isNull _offi1 || {!alive _offi1} || {player distance _offi1 < 20}|| {vehicle _offi1 != _offi1 && {vehicle _offi1 distance player > 200}} || {_timer < time}};
if (_timer < time) exitWith {
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_n = [_Tid] CALL BIS_fnc_deleteTask;
DONTDELGROUPS = DONTDELGROUPS - [_group];
{DONTDELGROUPS = DONTDELGROUPS - [_x];} foreach _gGs;
deletevehicle _obj;
};
if (alive _offi1 && {_defender == WEST}) then {

_offi1 SPAWN {
private ["_pos"];
if (vehicle player != player || {!alive _this}) exitWith {};
sleep 5;
_actor1 = _this;
_pos = getposATL _actor1;
//_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_n = [
[getposATL player, player, _actor1],
[],
[
[[[player], "Needing a medic here?",6]]
,[[[_actor1], ["No, I am fine. Got out of the car in time, but the others didn't survive."],7]]
,[[[player], "Understood, called chopper to pick up. Should be here shortly.",6]]
,[[[_actor1], "I have a feeling that we will have visitors before that, CSAT must have seen you coming.",10]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_actor1 setpos _pos;
//_nul = [_actor1,""] SPAWN FHideAndDelete;
};
"Chopper is coming to pick up the officer" SPAWN HINTSAOK;
_offi1 SPAWN SAOKCPICK;
sleep 10;
_locationA = getposATL _offi1;
_start2 = [_locationA, 400,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = 400;
while {player distance _start2 < 300 || {surfaceiswater _start2}} do {
sleep 1;
_start2 = [_locationA, _size,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = _size + 50;
};
_uCar =[ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_unitrate = [6,8];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
_group = [_start2, EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
_wp1= _group addWaypoint [_locationA, 0]; 
};
_timer = time + 900;
waitUntil {sleep 5; isNull _offi1 || {!alive _offi1} || {!isNil{_offi1 getvariable "SaOkSurrendeRed"}} || {vehicle _offi1 distance player > 200}|| {_timer < time}};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
if (_timer < time) exitWith {
_n = [_Tid] CALL BIS_fnc_deleteTask;
DONTDELGROUPS = DONTDELGROUPS - [_group];
{DONTDELGROUPS = DONTDELGROUPS - [_x];} foreach _gGs;
deletevehicle _obj;
};

if (isNull _offi1 || {!alive _offi1}|| {!isNil{_offi1 getvariable "SaOkSurrendeRed"}}) then {
if (_TaskT == "Def") then {
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);
} else {
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
pisteet = pisteet + 350;
_nul = [350, "Enemy Officer Killed"] SPAWN PRESTIGECHANGE;
};
} else {
if (_TaskT == "Def") then {
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
pisteet = pisteet + 350;
_nul = [350, "Officer Saved"] SPAWN PRESTIGECHANGE;
} else {
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);
};
};
DONTDELGROUPS = DONTDELGROUPS - [_group];
{DONTDELGROUPS = DONTDELGROUPS - [_x];} foreach _gGs;
sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;

if (!isNull _offi1) then {deletevehicle _offi1;};
deletevehicle _obj;