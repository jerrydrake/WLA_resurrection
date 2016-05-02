private ["_time","_wp1","_tg1wp1","_random","_unitrate","_tg1","_tank","_header","_Lna","_Tid","_marS","_size","_start2","_timer","_locationA","_marrr","_uCar","_VarVEH","_RedGuardPs","_FrGuardPs","_RedCamps","_FrCamps","_tA","_text","_V","_ran","_nul","_n","_classes","_group","_C","_Zcol","_st","_star","_classs","_F","_E","_G","_mP","_ResultColor","_mar5","_mar6","_data","_desc","_startM","_wpPP","_mid","_closestG","_someId","_someId2","_Tid1","_Tid2"];

//INIT
_VarVEH = (ARMEDVEHICLES select 3);
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_VarVEH = _VarVEH + (ARMEDVEHICLES select 0);};
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {_VarVEH = _VarVEH + (ARMEDVEHICLES select 2);};
_tank = _VarVEH call BIS_fnc_selectRandom;	
_uCar =[FRIENDC2,FRIENDC3] call RETURNRANDOM;
_marrr = (_this select 0);
_type = if (getmarkercolor _marrr == "ColorRed") then {"o_hq"} else {"n_hq"};
_marrr setMarkerType _type;
_marrr setMarkerSize [1,1];
_locationA = getmarkerpos (_this select 0);
_closestG = [_locationA,"ColorGreen"] CALL NearestGuardPost;
_closestG setvariable ["ColorG","Blue"];
_timer = time + (180 + (random 500));

_start2 = [_locationA, 800,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = 800;
while {{_start2 distance _x < 500} count VarBlackListE > 0 || {{_start2 distance _x < 500} count VarBlackListF > 0} || {player distance _start2 < 500} || {_start2 distance _locationA < 500}} do {
sleep 1;
_start2 = [_locationA, _size,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = _size + 50;
};

//_marS = format ["LINEmar%1",NUMM];
//NUMM=NUMM+1;
//_mar5 = [_marS,_locationA,"Select",[0.9,0.9],"ColorBlack","Assist to Capture"] CALL FUNKTIO_CREATEMARKER;
//_marS = format ["LINEmar%1",NUMM];
//NUMM=NUMM+1;

//_mar6 = [_marS,_start2,"hd_start",[0.9,0.9],"ColorGreen","Assault Begin Here"] CALL FUNKTIO_CREATEMARKER;

_startM = _start2;
_wpPP = _locationA;
_mid = [((_startM select 0)+(_wpPP select 0))*0.5,((_startM select 1)+(_wpPP select 1))*0.5,0];
[_mid,"mil_arrow","ColorGreen",([_startM, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;

["F","CAPS",""] SPAWN SAOKRADIOMES;
[["WLA","Battle"]] call BIS_fnc_advHint;
_data = ["EXPECTED BATTLE",_locationA,[1],[["O_static_AT_F","o_unknown",1],["O_HMG_01_high_F","o_unknown",1]]] CALL BattleVirtualIntel;
_ResultColor = _data select 0;
_Tid = format ["TaskBat%1",NUMM];
_Tid1 = format ["TaskBatP1_%1",NUMM];
_Tid2 = format ["TaskBatP2_%1",NUMM];
NUMM=NUMM+1;
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Assault to Camp near %1",_Lna];
_desc =("Friendlies are about to attack on persian camp. Should we assists or stay back?"+_ResultColor);
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
_locationA, // Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Attack",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;
[
WEST, // Task owner(s)
[,_Tid1,_Tid], // Task ID (used when setting task state, destination or description later)
["Join the troops to prepare the assault", "Join to fight here", "Group here"], // Task description
_Start2, // Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Move",			// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;
[
WEST, // Task owner(s)
[,_Tid2,_Tid], // Task ID (used when setting task state, destination or description later)
["Attack  the enemy camp here", "Attack site", "Attack here"], // Task description
_locationA, // Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Attack",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

//NUMM=NUMM+1;
_locationA set [2,20];
//_someId = format ["IDSAOK%1",NUMM];
//[_someId, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\A3\ui_f\data\map\markers\nato\o_hq.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Assault enemy camp: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _locationA] call BIS_fnc_addStackedEventHandler;
//NUMM=NUMM+1;
//_someId2 = format ["IDSAOK%1",NUMM];
//[_someId2, "onEachFrame", {
//	if (isNil"IC3D") exitWith {};
//	drawIcon3D ["\A3\ui_f\data\map\markers\military\join_CA.paa", ICONCOLOR, _this,1.51, 1.51, 0, (format ["Join to Fight Together: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _start2] call BIS_fnc_addStackedEventHandler;
//_ran = ["STR_Sp8t3r1","STR_Sp8t3r1a","STR_Sp8t3r1b","STR_Sp8t3r1c"] call BIS_fnc_selectRandom;
if (count _this == 1) then {
///////////RADIO CHAT
_RedCamps = 0;
_RedGuardPs =0;
_FrCamps = 0;
_FrGuardPs =0;
{
if (getmarkercolor ((_x getvariable "Post") getvariable "Gmark") == "ColorRed") then {_RedGuardPs = _RedGuardPs + 1;} else {_FrGuardPs = _FrGuardPs + 1;};
} foreach (nearestLocations [_locationA, ["PostG","PostR"], 1700]);
{
if ((getmarkercolor (_x getvariable "Marker")) == "ColorRed") then {_RedCamps = _RedCamps + 1;} else {_FrCamps = _FrCamps + 1;};
} foreach (nearestLocations [_locationA, ["CampR","CampB"], 1700]);
_text = ("Wolf, where are preparing an attack to enemy camp near "+_Lna+" using infantry team supported by ");
[[WEST,"base"],"Radio_9"] CALL RadioF;
_text = _text + (getText (configfile >> "CfgVehicles" >> _tank >> "displayName"));
if ("o_air" in (_data select 2) || {"o_armor" in (_data select 2)} || {"o_uav" in (_data select 2)}) then {
_text = _text + ". We have reports of possible recent hostile";[[WEST,"base"],"HQ_2"] CALL RadioF; 
_tA = [];
if ("o_air" in (_data select 2)) then {_tA = _tA + ["air_support"];};
if ("o_armor" in (_data select 2)) then {_tA = _tA + ["armor"];};
if ("o_uav" in (_data select 2)) then {_tA = _tA + ["UAV"];};
{[[WEST,"base"],_x] CALL RadioF;_text = _text + " "+_x; _tA = _tA - [_x]; if (count _tA == 1) then {_text = _text + " and";[[WEST,"base"],"HQ_6"] CALL RadioF;}; if (count _tA > 1) then {_text = _text + ",";};} foreach _tA;
_text = _text + " presence in the AO"; [[WEST,"base"],"Radio_0"] CALL RadioF; 
};
if (_RedCamps > 1 || {_RedGuardPs > 0}) then {_text = _text + ". There is "; [[WEST,"base"],"HQ_8"] CALL RadioF;};
if (_RedCamps > 1) then {
//_text = _text + "another ";[[WEST,"base"],"Radio_1"] CALL RadioF; 
if ((_RedCamps-1) != 1) then {_text = _text + (format ["%1",(_RedCamps-1)]);};
_text = _text + " camp";_V = (format ["N%1",(_RedCamps-1)]);if (_V != "N1") then {[[WEST,"base"], _V] CALL RadioF;};};
if (_RedCamps == 2) then {[[WEST,"base"],"HQ_9"] CALL RadioF;};
if (_RedCamps > 2) then {_text = _text +"s";[[WEST,"base"],"HQ_10"] CALL RadioF;};
if (_RedCamps > 1 && {_RedGuardPs > 0}) then {_text = _text + " and ";[[WEST,"base"],"HQ_6"] CALL RadioF;};
if (_RedGuardPs > 0) then {if (_RedGuardPs != 1) then {_text = _text +(format ["%1",_RedGuardPs]);};
_text = _text +" guardpost";_V = (format ["N%1",_RedGuardPs]);if (_V != "N1") then {[[WEST,"base"],_V] CALL RadioF;};};
if (_RedGuardPs == 1) then {[[WEST,"base"],"HQ_11"] CALL RadioF;};
if (_RedGuardPs > 1) then {_text = _text + "s"; [[WEST,"base"],"HQ_12"] CALL RadioF;};
if (_RedCamps > 1 || {_RedGuardPs > 0}) then {_text = _text + " with hostile activity nearby that could give us trouble if get their attention";[[WEST,"base"],"Radio_10"] CALL RadioF; };
_text = _text + ". ";
BaseR globalchat _text;
sleep 6;
_text = "";
if ("b_air" in (_data select 2) || {"b_armor" in (_data select 2)} || {"b_uav" in (_data select 2)} || {"n_plane" in (_data select 2)} || {"n_air" in (_data select 2)} || {"n_armor" in (_data select 2)} || {"n_uav" in (_data select 2)}) then {
_text = _text + "There is friendly";[[WEST,"base"],"HQ_14"] CALL RadioF;
_tA = [];
if ("b_air" in (_data select 2) || {"n_plane" in (_data select 2)} || {"n_air" in (_data select 2)}) then {_tA = _tA + ["air_support"];};
if ("b_armor" in (_data select 2) || {"n_armor" in (_data select 2)}) then {_tA = _tA + ["armor"];};
if ("b_uav" in (_data select 2) || {"n_uav" in (_data select 2)}) then {_tA = _tA + ["UAV"];};
{[[WEST,"base"],_x] CALL RadioF;_text = _text + " "+_x; _tA = _tA - [_x]; if (count _tA == 1) then {_text = _text + " and";[[WEST,"base"],"HQ_6"] CALL RadioF;}; if (count _tA > 1) then {_text = _text + ",";};} foreach _tA;
_text = _text + " operating near the AO which wont leave us in trouble. ";[[WEST,"base"],"Radio_12"] CALL RadioF;
};
if (_FrCamps > 1 || {_FrGuardPs > 0}) then {_text = _text + "On our side,";[[WEST,"base"],"Radio_11"] CALL RadioF;} else {_text = _text + "We have no nearby friendly camps or any guardposts covering our back. ";[[WEST,"base"],"Radio_13"] CALL RadioF;};
if (_FrCamps > 1) then {if ((_FrCamps-1) != 1) then {_text = _text + (format [" %1",(_FrCamps-1)]);};
_text = _text + " camp";_V = (format ["N%1",(_FrCamps-1)]);if (_V != "N1") then {[[WEST,"base"],_V] CALL RadioF;};};
if (_FrCamps == 2) then {[[WEST,"base"],"HQ_9"] CALL RadioF;};
if (_FrCamps > 2) then {_text = _text +"s";[[WEST,"base"],"HQ_10"] CALL RadioF;};
if (_FrCamps > 1 && {_FrGuardPs > 0}) then {_text = _text + " and";[[WEST,"base"],"HQ_6"] CALL RadioF;};
if (_FrGuardPs > 0) then {if (_FrGuardPs != 1) then {_text = _text +(format [" %1",_FrGuardPs]);}; 
 _text = _text + " guardpost";_V = (format ["N%1",_FrGuardPs]);if (_V != "N1") then {[[WEST,"base"],_V] CALL RadioF;};};
if (_FrGuardPs == 1) then {[[WEST,"base"],"HQ_11"] CALL RadioF;};
if (_FrGuardPs > 1) then {_text = _text + "s"; [[WEST,"base"],"HQ_12"] CALL RadioF;};
if (_FrCamps > 1 || {_FrGuardPs > 0}) then {_text = _text + " will cover our rear if something goes wrong. ";[[WEST,"base"],"Radio_14"] CALL RadioF;};
_text = _text + "If you are unattached, we could always use an extra hand. Out";[[WEST,"base"],"HQ_19"] CALL RadioF;
BaseR globalchat _text;
////////////////////////////
};
//FAR OR CLOSE
waitUntil {sleep 5; _timer < time || {player distance _locationA < 1400} || {player distance _start2 < 600}};
if (player distance _locationA < 1400 || {player distance _start2 < 600}) then {
//[_someId2, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
//REAL ATTACK
//_tank = _VarVEH call BIS_fnc_selectRandom;	
_tg1 = [[(_start2 select 0),(_start2 select 1),0], 0, _tank, WEST] call SPAWNVEHICLE;
_unitrate = [4,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], WEST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
waitUntil {sleep 5; _timer < time || {player distance _locationA < 300} || {player distance _start2 < 300}  || {getmarkercolor _marrr ==  "ColorBlue"}};
_timer = time + 1200;
_tg1wp1= (_tg1 select 2) addWaypoint [_locationA, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
_wp1 = _group addWaypoint [_locationA, 0];
[_group, 1] setWaypointCombatMode "Red";
[_group, 1] setWaypointType "GUARD";

_time = time + 600;
if (getmarkercolor _marrr !=  "ColorBlue") then {
_ran = ["STR_Sp8t3r4","STR_Sp8t3r4a","STR_Sp8t3r4b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;

_startM = _start2;
_wpPP = _locationA;
_mid = [((_startM select 0)+(_wpPP select 0))*0.5,((_startM select 1)+(_wpPP select 1))*0.5,0];
[_mid,"mil_arrow","ColorGreen",([_startM, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
};
//LOSS OR END C
waitUntil {sleep 5; _timer < time || {{alive _x && {_x distance _locationA < 20}} count [(leader _group),(leader (_tg1 select 2))] > 1} || {getmarkercolor _marrr ==  "ColorBlue"} || {{alive _x && !(fleeing _x)} count (units _group)  + (units (_tg1 select 2)) < 2}};
if ({alive _x && {!(fleeing _x)}} count (units _group)  + (units (_tg1 select 2)) < 2 || {_timer < time}) then {
//END CONDITION (LOST)
FriendlyVehicles set [count FriendlyVehicles,(_tg1 select 2)];
CARS set [count CARS,(_tg1 select 0)];
(_tg1 select 0) setvariable ["EndS",1];
CantCommand = CantCommand + [(_tg1 select 2)];
FriendlyInf set [count FriendlyInf,_group];
CantCommand = CantCommand + [_group];
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Operation Against CSAT Camp near %1 Failed",_Lna];
[_header, date] CALL SAOKEVENTLOG;
["ScoreRemoved",["Friendly attack didnt succeed.",30]] call SAOKNOTIFI;
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
_ran = ["STR_Sp8t3r2","STR_Sp8t3r2a","STR_Sp8t3r2b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
//deletemarker _mar5;
//deletemarker _mar6;
} else {
//LOSS (VICTORY)
FriendlyVehicles set [count FriendlyVehicles,(_tg1 select 2)];
(_tg1 select 0) setvariable ["EndS",1];
CARS set [count CARS,(_tg1 select 0)];
CantCommand = CantCommand + [(_tg1 select 2)];
FriendlyInf set [count FriendlyInf,_group];
CantCommand = CantCommand + [_group];
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Bloody Operation Against CSAT Camp near %1 Ended With Green Victory. Locals Celebrating On Streets",_Lna];
[_header, date] CALL SAOKEVENTLOG;
["ScoreAdded",["Friendly attack succeeded. Enemy lost a camp",60]] call SAOKNOTIFI;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
_marrr setmarkercolor "ColorBlue";
_n = [getMarkerPos _marrr,"WEST"] CALL GuardPostSide;
_ran = ["STR_Sp8t3r3","STR_Sp8t3r3a","STR_Sp8t3r3b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
//deletemarker _mar5;
//deletemarker _mar6;
};
} else {
//[_someId2, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
//FAKE ATTACK
_startM = _start2;
_wpPP = _locationA;
_mid = [((_startM select 0)+(_wpPP select 0))*0.5,((_startM select 1)+(_wpPP select 1))*0.5,0];
[_mid,"mil_arrow","ColorGreen",([_startM, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;

_time = time + 600;
_ran = ["STR_Sp8t3r4","STR_Sp8t3r4a","STR_Sp8t3r4b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
waitUntil {sleep 5; (player distance _locationA < 1400)  || {player distance _start2 < 600} || {_time < time} ||  {getmarkercolor _marrr ==  "ColorBlue"}};
if (player distance _locationA < 1400 || {player distance _start2 < 600}) then {
//CLOSE
//_tank = _VarVEH call BIS_fnc_selectRandom;	
_tg1 = [[(_start2 select 0),(_start2 select 1),0], 0, _tank, WEST] call SPAWNVEHICLE;
_unitrate = [4,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], WEST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
_tg1wp1= (_tg1 select 2) addWaypoint [_locationA, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
_wp1 = _group addWaypoint [_locationA, 0];
[_group, 1] setWaypointCombatMode "Red";
[_group, 1] setWaypointType "GUARD";

_time = time + 1200;
//LOSS OR END C
waitUntil {sleep 5; ({alive _x && {_x distance _locationA < 20}} count [(leader _group),(leader (_tg1 select 2))] > 1 ||  {getmarkercolor _marrr ==  "ColorBlue"}) || {{alive _x && {!(fleeing _x)}} count (units _group)  + (units (_tg1 select 2)) < 2} || {_time < time}};
if ({alive _x && {!(fleeing _x)}} count (units _group)  + (units (_tg1 select 2)) < 2 || {_time < time}) then {
//END CONDITION (LOST)
FriendlyVehicles set [count FriendlyVehicles,(_tg1 select 2)];
CARS set [count CARS,(_tg1 select 0)];
(_tg1 select 0) setvariable ["EndS",1];
CantCommand = CantCommand + [(_tg1 select 2)];
FriendlyInf set [count FriendlyInf,_group];
CantCommand = CantCommand + [_group];
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Operation Against CSAT Camp near %1 Failed",_Lna];
[_header, date] CALL SAOKEVENTLOG;
["ScoreRemoved",["Friendly attack didnt succeed.",30]] call SAOKNOTIFI;
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
_ran = ["STR_Sp8t3r2","STR_Sp8t3r2a","STR_Sp8t3r2b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
//deletemarker _mar5;
//deletemarker _mar6;
} else {
//LOSS (VICTORY)
FriendlyVehicles set [count FriendlyVehicles,(_tg1 select 2)];
CARS set [count CARS,(_tg1 select 0)];
(_tg1 select 0) setvariable ["EndS",1];
CantCommand = CantCommand + [(_tg1 select 2)];
FriendlyInf set [count FriendlyInf,_group];
CantCommand = CantCommand + [_group];
_n = [getMarkerPos _marrr,"WEST"] CALL GuardPostSide;
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Bloody Operation Against CSAT Camp near %1 Ended With Green Victory. Locals Celebrating On Streets",_Lna];
[_header, date] CALL SAOKEVENTLOG;
["ScoreAdded",["Friendly attack succeeded. Enemy lost a camp",60]] call SAOKNOTIFI;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
_marrr setmarkercolor "ColorBlue";
_ran = ["STR_Sp8t3r3","STR_Sp8t3r3a","STR_Sp8t3r3b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
//deletemarker _mar5;
//deletemarker _mar6;
};

} else {
//FAR WHOLE TIME 
_F = [];
_E = [];
_G = [];
_C = [];
_C = _C + [["O_static_AT_F","o_unknown",1],["O_HMG_01_high_F","o_unknown",1]];
_size = [0,1,2] call RETURNRANDOM;
for "_i" from 0 to _size do {
_C = _C + ["INFI"];
_Zcol = "ColorGreen";
_star = [getmarkerpos _marrr, 400,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
_classs = if (_Zcol == "ColorRed") then {ARMEDVEHICLES select 1} else {ARMEDVEHICLES select 2};
_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
if (_Zcol == "ColorRed") then {
_n = [_star, _Zcol,_classs] CALL AddVehicleZone;
} else {
_n = [_star, "ColorGreen",_classs,"n_armor"] CALL AddVehicleZone;
};
};
_mP = getmarkerpos _marrr;
_nearbyLocations = nearestLocations [_mP,["Name"], 1700];
{
if (!isNil{_x getvariable "VZ"} && {isNil{_x getvariable "ACTIVE"}} && {(_x getvariable "Mcolor") != "ColorGrey"}) then {
if ((_x getvariable "Mcolor") != "ColorRed") then {_F pushback _x;} else {_E pushback _x;};
};
} foreach _nearbyLocations;
{
_p = _x getvariable "Post";
if (isNil{_p getvariable "ACTIVE"}) then {
_G pushback _p;
};
} foreach (nearestLocations [_mp, ["PostG","PostR"], 1700]);

{
_C pushback (_x getvariable "Marker");
} foreach (nearestLocations [_mP, ["CampR","CampB"], 1700]);
_ResultColor = [_F,_E,_G,_C,"CAMP BATTLE",_mP] CALL BattleVirtualCamp;
_marrr setmarkercolor _ResultColor;
if (_ResultColor ==  "ColorBlue") then {
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Bloody Operation Against CSAT Camp near %1 Ended With Green Victory. Locals Celebrating On Streets",_Lna];
[_header, date] CALL SAOKEVENTLOG;
//["ScoreAdded",["Friendly attack succeeded. Enemy lost a camp",60]] call SAOKNOTIFI;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
["F","CAP",""] SPAWN SAOKRADIOMES;
["E","LOS"] SPAWN SAOKRADIOMES;
_marrr setmarkercolor "ColorBlue";
_n = [getMarkerPos _marrr,"WEST"] CALL GuardPostSide;
//_nul = [] SPAWN {VarPG = VarPG + 1;sleep 900;VarPG = VarPG - 1;};
_ran = ["STR_Sp8t3r3","STR_Sp8t3r3a","STR_Sp8t3r3b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
} else {
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Operation Against CSAT Camp near %1 Failed",_Lna];
[_header, date] CALL SAOKEVENTLOG;
//["ScoreRemoved",["Friendly attack didnt succeed.",30]] call SAOKNOTIFI;
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);
//_nul = [] SPAWN {VarPG = VarPG - 1;sleep 900;VarPG = VarPG + 1;};
_ran = ["STR_Sp8t3r2","STR_Sp8t3r2a","STR_Sp8t3r2b"] call BIS_fnc_selectRandom;
BaseR globalchat localize _ran;
};
//deletemarker _mar5;
//deletemarker _mar6;
};
};
_closestG setvariable ["ColorG",nil];
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
{if (_marrr == _x select 0) exitWith {AMBbattles deleteAT _foreachIndex;};} foreach AMBbattles;
sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;

