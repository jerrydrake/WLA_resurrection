private ["_time","_wp1","_tg1wp1","_posPl","_class","_random","_unitrate","_tg1","_tank","_mecOrNot","_header","_Lna","_Tid","_marS","_size","_start2","_st2","_timer","_locationA","_marrr","_uCar","_VarVEH","_ALLunits","_VEHs","_INFgroups","_VEHgroups","_classes","_group","_nul","_n","_ran","_mar5","_ker","_wpPP","_mid","_someId"];
//INIT
_VEHgroups = [];
_INFgroups = [];
_VEHs = [];
_ALLunits = [];
_VarVEH = (ARMEDVEHICLES select 1)+(ARMEDTANKS select 1);
_uCar =[ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_marrr = (_this select 0);
_locationA = getmarkerpos (_this select 0);
_timer = time + (180 + (random 500));
_start2 = [_locationA, 1200,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = 1200;
while {{_start2 distance _x < 500} count VarBlackListE > 0 || {{_start2 distance _x < 500} count VarBlackListF > 0} || {player distance _start2 < 900} || {_start2 distance _locationA < 900}} do {
sleep 1;
_start2 = [_locationA, _size,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = _size + 100;
};
_marS = format ["LINEmar%1",NUMM];
NUMM=NUMM+1;
_mar5 = [_marS,_locationA,"Select",[0.9,0.9],"ColorBlack","Assist to Defend"] CALL FUNKTIO_CREATEMARKER;


if ({(_x getvariable "Mcolor") == "ColorRed" && {locationposition _x distance vehicle player < 5000}} count AAsM == 0) then {
_wpPP = getmarkerpos _mar5;
_mid = [((_start2 select 0)+(_wpPP select 0))*0.5,((_start2 select 1)+(_wpPP select 1))*0.5,0];
[[_mid],"mil_arrow","ColorRed",([_start2, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
};

//hint "Look for map, where the help is needed. You can fast travel to the AO via Shift+1";
_Tid = format ["TaskBat%1",NUMM];
NUMM=NUMM+1;
_Lna = _locationA CALL NEARESTLOCATIONNAME;
["E","CAPS"] SPAWN SAOKRADIOMES;
_header = format ["Defend camp against counterattack near %1",_Lna];
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["CSAT is trying to take the recently captured camp back. Should we hold it or step back?", _header, _header], // Task description
objNull, // Task destination
"CREATED"  ] call SAOKCRTASK;
NUMM=NUMM+1;
_locationA set [2,20];
_someId = format ["IDCASAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\markers\nato\n_hq.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["HOLD CAMP AGAINST COUNTER-ATTACK: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _locationA] call BIS_fnc_addStackedEventHandler;
if (count _this == 1) then {
_ran = ["STR_Sp8t1r1","STR_Sp8t1r1a","STR_Sp8t1r1b","STR_Sp8t1r1c"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
};
sleep 20;
//CLOSE
_v = [EAST,_locationA,3000] CALL SAOKZONEVEHICLESNEARBY;
_size = [0,0,0,0,1,1,1,2] call RETURNRANDOM;
for "_i" from 0 to _size do {
if (count _v > 0) then {
_mecOrNot = [0,1] call RETURNRANDOM;
_pickV = _v call RETURNRANDOM;
if (count crew _pickV > 0) then {
_VEHgroups = _VEHgroups + [group (crew _pickV select 0)];
(group (crew _pickV select 0)) SPAWN SAOKREMOVEWAYPOINTS; 
};
_VEHs = _VEHs + [_pickV];
_pickV forcespeed 3;
_unitrate = [4,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
_INFgroups = _INFgroups + [_group];
if (_mecOrNot == 1 && {typeof _pickV in ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"]}) then {
{_x moveincargo _pickV;}foreach units _group;
_group SPAWN {waitUntil {sleep 3; {alive _x} count units _this == 0|| {behaviour (leader _this) == "COMBAT"}}; if !({alive _x} count units _this == 0) then {{unassignvehicle _x;_x action ["GetOut",vehicle _x];} foreach units _this;(units _this) ordergetin false;};};
};
} else {
_unitrate = [4,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
_INFgroups = _INFgroups + [_group];
};
};
{_ALLunits = _ALLunits + (units _x);} foreach _VEHgroups + _INFgroups;

//AIR SUPPORT
if (random 1 < 0.3 && {_size < 1} && {([] CALL FPSGOOD)}) then {
_class = (AIRFIGTHER select 1)+(AIRARMCHOP select 1); 
_class = _class call RETURNRANDOM;	
_tg1 = [[(getposATL vehicle player select 0)+2500,(getposATL vehicle player select 1)+2500,50], 0, _class, EAST] call SPAWNVEHICLE;
_posPl = [(getposATL (vehicle player) select 0) + 100 -(random 200), (getposATL (vehicle player) select 1)+ 100 -(random 200), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_locationA, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
[(_tg1 select 2), 1] setWaypointType "GUARD";
_nul = [(_tg1 select 2), [1541.39,5059.05,0],200] SPAWN FUNKTIO_MAD;
};
//BEGIN ATTACK
{
if (!isNil{_x getvariable "GMar"}) then {
[_x getvariable "GMar", _locationA] SPAWN ZoneMove;
} else {
_tg1wp1= _x addWaypoint [_locationA, 0]; 
[_x, 1] setWaypointBehaviour "COMBAT";
};
} foreach _VEHgroups;
{
_wp1 = _x addWaypoint [_locationA, 0];
[_x, 1] setWaypointCombatMode "Red";
[_x, 1] setWaypointType "GUARD";
} foreach _INFgroups;


_time = time + 600;
_ran = ["STR_Sp8t1r4","STR_Sp8t1r4a","STR_Sp8t1r4b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
_ker = (count _ALLunits)*0.2;
waitUntil {sleep 9; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {!(fleeing _x)}} count _ALLunits < _ker || {_time < time}  ||  {getmarkercolor _marrr ==  "ColorRed"}};
if (getmarkercolor _marrr ==  "ColorRed") then {
//END2
/*
{
VehicleGroups pushback _x;
} foreach _VEHgroups;
*/
{
CARS pushback _x;
_x setvariable ["EndS",1];
} foreach _VEHs;
{
Pgroups pushback _x;
} foreach _INFgroups;
_n = [getMarkerPos _marrr,"EAST"] CALL GuardPostSide;
["ScoreRemoved",["Enemy attack succeeded. You lost camp",30]] call SAOKNOTIFI;
PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
_marrr setmarkercolor "ColorRed";
/*
if (([_locationA] CALL RETURNGUARDPOST) distance _locationA < 400) then {
_post = ([_locationA] CALL RETURNGUARDPOST); 
deletemarker (_post getvariable "Gmark");
deletevehicle _post;
};
*/
_ran = ["STR_Sp8t1r3","STR_Sp8t1r3a","STR_Sp8t1r3b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;

deletemarker _mar5;
} else {
//END C
/*
{
VehicleGroups pushback _x;
} foreach _VEHgroups;
*/
{
CARS pushback _x;
_x setvariable ["EndS",1];
} foreach _VEHs;
{
Pgroups pushback _x;
} foreach _INFgroups;
["ScoreAdded",["Enemy attack didnt succeed",10]] call SAOKNOTIFI;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
//_nul = [] SPAWN {VarPG = VarPG - 1;sleep 900;VarPG = VarPG + 1;};
_ran = ["STR_Sp8t1r2","STR_Sp8t1r2a","STR_Sp8t1r2b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
deletemarker _mar5;
};

{if (_marrr == _x select 0) exitWith {AMBbattles deleteAT _foreachIndex;};} foreach AMBbattles;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;
