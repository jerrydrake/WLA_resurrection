private ["_list","_civs","_ene","_n","_fPmove","_fPscareA","_fPscareC","_fEspotD","_fCspotD","_fCspotH"];
FUnitSay2 = {
private ["_unit","_line","_someId","_t","_ar","_k"];
_unit = _this select 0;
_line = _this select 1; 
if (_line in (_unit CALL SAOKAICLOGR) && {count _this == 2}) exitWith {};
[_unit,_line] SPAWN SAOKAICLOG;
NUMM = NUMM + 1;
_someId = format ["IDUSAY%1",NUMM];
_k = 1;
if (player distance _unit > 10) then {_k = 100/((player distance _unit)*10);};
[_someId, "onEachFrame", {
	_start = getposATL (_this select 0);
	_start set [2,(_start select 2)+1.9];
	drawIcon3D ["", [1,1,1,1], _start, 0, 0, 0, _this select 1, 1, _this select 2, "TahomaB"];
}, [_unit, _line,(SAOKFSI+0.01)*_k]] call BIS_fnc_addStackedEventHandler;
_t = 3; 
if (count _this > 2) then {_t = _this select 2;};
sleep _t;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 18;
if (isNull _unit || {!alive _unit}) exitWith {};
_ar = _unit CALL SAOKAICLOGR;
_ar = _ar - [_line];
_unit setvariable ["Clog",_ar];
};

SAOKAICLOG = {
private ["_u","_c"];
_u = _this select 0;
_c = _this select 1;
if (isnil{_u getvariable "Clog"}) then {_u setvariable ["Clog",[_c]];} else {
if !(_c in (_u getvariable "Clog")) then {
_u setvariable ["Clog",(_u getvariable "Clog")+[_c]];
};
};
};
SAOKAICLOGR = {
private ["_r"];
_r = if (isnil{_this getvariable "Clog"}) then {[]} else {_this getvariable "Clog"};
_r
};


//Enemy Hear Player?
_fPmove = {
private ["_a","_false","_nul","_voice"];
_false = true;
{
if (!isNull _x && {_x knowsabout player == 0}) then {
_false = true;
if (abs(speed player) > 23 && {player distance _x < 40} && {_false}) then {
_false = false;
//hint "Hey, who is running there?!";
if (random 1 < 0.3) then {
if (alive player) then {[_x,"Hey, who is running there?!"] SPAWN FUnitSay2;};
};
_a = if (isNil {_x getVariable "Moves"}) then {0} else {_x getVariable "Moves"};
_x setvariable ["Moves", 2 + _a];
_x setvariable ["Point", getposATL player];
_nul = [_x, getposATL player] SPAWN Einvestigate;
};
if (abs(speed player) > 17 && {player distance _x < 35} && {_false}) then {
_false = false;
//hint "Hey, is there someone?!";
if (random 1 < 0.3) then {
_voice = ["whatsthat3","whogoes","whogoes1","whogoes3"] call RETURNRANDOM;
if (alive player) then {[_x,"Hey, is there someone?!"] SPAWN FUnitSay2;};
};
_a = 0;
if (isNil {_x getVariable "Moves"}) then {_a = 0;} else {_a = _x getVariable "Moves";};
_x setvariable ["Moves", 1 + _a];
_x setvariable ["Point", getposATL player];
_nul = [_x, getposATL player] SPAWN Einvestigate;
};
if (abs(speed player) > 12 && {player distance _x < 25} && {_false}) then {
_false = false;
//hint "Hey, whats that sound?!";
if (random 1 < 0.3) then {
if (alive player) then {[_x,"Hey, whats that sound?!"] SPAWN FUnitSay2;};

};
_a = if (isNil {_x getVariable "Moves"}) then {0} else {_x getVariable "Moves"};
_x setvariable ["Moves", 1 + _a];
_x setvariable ["Point", getposATL player];
_nul = [_x, getposATL player] SPAWN Einvestigate;
};
if (abs(speed player) > 5 && {player distance _x < 15} && {_false}) then {
_false = false;
//hint "Hey, I still hear something?!";
if (random 1 < 0.3) then {
if (alive player) then {[_x,"Hey, I still hear something?!"] SPAWN FUnitSay2;};

};
_a = if (isNil {_x getVariable "Moves"}) then {0} else {_x getVariable "Moves"};
_x setvariable ["Moves", 1 + _a];
if (random 1 < 0.3) then {
_x setvariable ["Point", getposATL player];
_nul = [_x, getposATL player] SPAWN Einvestigate;};
};
};
sleep 0.1;
} foreach _this;
};
//Player scare animal
ListIgnore = [];
_fPscareA = {
private ["_voice","_list","_a","_nul","_y","_listA"];
_listA = (getposATL player) nearEntities [["Fin_random_F","Alsatian_Random_F","Sheep_random_F","Cock_random_F","Goat_random_F","Hen_random_F"],15];
_list = [];
{
if (player distance _x < 10 && {random 1 < 0.2}) then {
_voice = ["*Wuff*","*Bark bark*","*Bark*","*Mrrrr*"] call RETURNRANDOM;
//if (typeof _x iskindof "WildBoar") then {_voice = ["boar1","boar1","boar2","boar3","boar4"] call RETURNRANDOM;};
if (typeof _x iskindof "Cock_random_F") then {_voice = ["*O Ooooo OOo!*"] call RETURNRANDOM;};
if (typeof _x iskindof "Hen_random_F") then {_voice = ["*Bod Bodbod Bod*","*Booood*","*Bobod*"] call RETURNRANDOM;};
if (typeof _x iskindof "Sheep_random_F" || {typeof _x iskindof "Goat_random_F"} || {typeof _x iskindof "Sheep"} || {typeof _x iskindof "Goat"}) then {_voice = ["*Baehh*","*Beahhhh*"] call RETURNRANDOM;};
if (alive player) then {[_x,_voice,1] SPAWN FUnitSay2;};
_list = (getposATL player) nearEntities [["Man"],120];
{_list = _list - [_x];} foreach ListIgnore;
{if (!alive _x || {vehicle _x != _x} || {side _x != EAST} || {behaviour _x == "COMBAT"}) then {_list = _list - [_x];};} foreach _list;
_y = _x;
{
_a = 0;
if (isNil {_x getVariable "Moves"}) then {_a = 0;} else {_a = _x getVariable "Moves";};
_x setvariable ["Moves", 2 + _a];
_x setvariable ["Point", getposATL _y];
_nul = [_x, getposATL _y] SPAWN Einvestigate;
sleep 3;
if (random 1 < 0.5) then {
if !([_y,_x] CALL FUNKTIO_LOS) then {
_voice = ["What was that?","What is going there?","Someone going there?","Who is there?","What was there?","Why that animal is making noise?"] call RETURNRANDOM;
if (alive player) then {[_x,_voice] SPAWN FUnitSay2;};
};
};
} foreach _list;
}; 
sleep 0.1;
} foreach _listA;
};
//Player scare civilian
CIVIGNORE = [];
_fPscareC = {
private ["_list","_a","_voice","_nul","_y","_listC"];
if (player CALL SAOKNEARVILRELA != "Hostile") exitWith {};
_listC = + _this;
{_listC = _listC - [_x];} foreach CIVIGNORE;
{
if (player distance _x < 10 && {random 1 < 0.3}) then {
if ([player,_x] CALL FUNKTIO_LOS) then {
_voice = ["Leave me alone!","Who are you, go away!","Let me be, stranger!","Help!"] call RETURNRANDOM;
//if (typeof _x iskindof "Woman_EP1") then {_voice = ["female1","female1","female2","female2","female3","female3"] call RETURNRANDOM;};
if (alive player) then {[_x,_voice] SPAWN FUnitSay2;};
[_x] SPAWN FUNKTIO_IGNORETIMED;
_list = (getposATL _x) nearEntities [["Man"],25];
{_list = _list - [_x];} foreach ListIgnore;
{if (!alive _x || {vehicle _x != _x} || {side _x != EAST} || {behaviour _x == "COMBAT"}) then {_list = _list - [_x];};sleep 0.01;} foreach _list;
if (count _list == 0) then {_x spawn ECivRunFHelp;};
_y = _x;
{
_a = if (isNil {_x getVariable "Moves"}) then {0} else {_x getVariable "Moves"};
_x setvariable ["Moves", 2 + _a];
_x setvariable ["Point", getposATL _y];
_nul = [_x, getposATL _y] SPAWN Einvestigate;
sleep 3;
if (random 1 < 0.5) then {
if !([_y,_x] CALL FUNKTIO_LOS) then {
_voice = ["What was that?","What is going there?","Someone in trouble?","Hey!"] call RETURNRANDOM;
if (alive player) then {[_x,_voice] SPAWN FUnitSay2;};
};
};
} foreach _list;
}; 
};
sleep 0.01;
} foreach _listC;
};
//Civilian spot player in his house
_fCspotH = {
private ["_list","_a","_voice","_nul","_y","_listC","_ps","_p1","_p2"];
_ps = getposASL player;
_p1 = [_ps select 0,_ps select 1,(_ps select 2) + 0.6];
_p2 = [_ps select 0,_ps select 1,(_ps select 2) + 6.6];
if (nearestbuilding player distance player > 10 || {!(lineIntersects [_p1,_p2])}) exitwith {};
if ((player CALL SAOKNEARVILRELA) in ["Friendly","Neutral"]) exitWith {};
_listC = + _this;
{_listC = _listC - [_x];} foreach CIVIGNORE;
{
if (player distance _x < 10 && {random 1 < 0.3}) then {
if ([player,_x] CALL FUNKTIO_LOS) then {
_voice = ["Get away, your are in my house!","Hey, back off! Back off!","Get out of my house! Go!","This is my home, out! Now!","Go away!"] call RETURNRANDOM;
if (alive player) then {[_x,_voice] SPAWN FUnitSay2;};
[_x] SPAWN FUNKTIO_IGNORETIMED;
_list = (getposATL _x) nearEntities [["Man"],25];
{_list = _list - [_x];} foreach ListIgnore;
{if (!alive _x || {vehicle _x != _x} || {side _x != EAST} || {behaviour _x == "COMBAT"}) then {_list = _list - [_x];};sleep 0.01;} foreach _list;
if (count _list == 0) then {_x spawn ECivRunFHelp;};
_y = _x;
{
_a = 0;
if (isNil {_x getVariable "Moves"}) then {_a = 0;} else {_a = _x getVariable "Moves";};
_x setvariable ["Moves", 2 + _a];
_x setvariable ["Point", getposATL _y];
_nul = [_x, getposATL _y] SPAWN Einvestigate;
sleep 3;
if (random 1 < 0.5) then {
if !([_y,_x] CALL FUNKTIO_LOS) then {
_voice = ["What was that?","What is going there?","Is someone in trouble, there?","Hey!"] call RETURNRANDOM;
if (alive player) then {[_x,_voice] SPAWN FUnitSay2;};
};
};
} foreach _list;
}; 
};
sleep 0.1;
} foreach _listC;
};

Einvestigate = {
private ["_unit","_pos","_a","_b","_chat","_rand"];
_unit = _this select 0;
if (isNull _unit || {behaviour _unit == "COMBAT"} || {!isNil{_unit getvariable "Busy"}}) exitWith {};
_unit setvariable ["Busy",1];
_pos = _this select 1;
_rand = if (count _this > 2) then {_this select 2} else {5};
_pos = [(_pos select 0)+9-(random 18),(_pos select 1)+9-(random 18),0];
_b = if (isNil {_unit getVariable "Moving"}) then {false} else {_b = _unit getVariable "Moving"};
if (_b) then {} else {
_unit setvariable ["Moving", true];
_unit forcespeed 1;
if (count (units (group _unit)) == 1) then {_unit domove _pos;} else {(group _unit) move _pos;};
waituntil {sleep 1; isNull _unit || {!(alive _unit)} || {_unit distance _pos < 10} || {speed _unit == 0}};
if (isNull _unit) exitWith {};
if (isNil{(_unit getVariable "Moves")}) exitWith {
_unit setvariable ["Busy",nil];
_unit setvariable ["Moving", false];
_unit forcespeed -1;
_unit dofollow _unit;
};
_a = if (!isNil{_unit getVariable "Moves"}) then {(_unit getVariable "Moves") - 1} else {0};
if (!isNull _unit) then {_unit setvariable ["Moves", _a];};
while {_a > 0 && {!isNull _unit} && {alive _unit} && {((isnil"CIVMODE" && {captive player}) || {_unit knowsabout player == 0})}} do {
_pos = _unit getVariable "Point";
_pos = [(_pos select 0) + _rand - (random _rand)*2,(_pos select 1) + _rand - (random _rand)*2,0];
if (count (units (group _unit)) == 1) then {_unit domove _pos;} else {(group _unit) move _pos;};
sleep 1;
waituntil {sleep 1; isNull _unit || {!(alive _unit)} || {_unit distance _pos < 10} || {speed _unit == 0}};
if (isNull _unit) exitWith {};
_a = if (!isNil{_unit getVariable "Moves"}) then {(_unit getVariable "Moves") - 1} else {0};
if (!isNull _unit) then {_unit setvariable ["Moves", _a];};
};
if (behaviour _unit != "COMBAT" && {((isnil"CIVMODE" && {captive player}) || {_unit knowsabout player == 0})}) then {
sleep (random 5);
if (random 1 < 0.7) then {
_chat = ["I must have hearing wrong","Nothing here","What it was, isnt here anymore","If its you squirel again, I wont bring you nuts anymore","Noone here it seems","Did I heard right? Nothing here"] call RETURNRANDOM;
if ({[_x,_unit] CALL FUNKTIO_LOS} count ((getposATL _unit) nearEntities [["Fin_random_F","Alsatian_Random_F"],30]) > 0) then {_chat = ["Oh, was it you little doggie? Boogie buggy doggie","Why are you barking here alone?"] call RETURNRANDOM;};
sleep 0.5;
if ({[_x,_unit] CALL FUNKTIO_LOS} count ((getposATL _unit) nearEntities [["Civilian"],30]) > 0) then {_chat = ["Move to your home","Dont sneak here, villager","You will get shot if continueing that sneaky behaviour"] call RETURNRANDOM;};
if (alive player) then {[_unit,_chat] SPAWN FUnitSay2;};
};
sleep 10 + (random 10);
};
sleep 3;
_unit forcespeed -1;
_unit dofollow _unit;
if (!isNull _unit) then {_unit setvariable ["Moving", false];};
};
if (!isNull _unit) then {_unit setvariable ["Busy",nil];};
};

Ebackup = {

private ["_icls","_center","_side","_wp","_classes","_unitrate","_random","_group","_n"];
if !([] CALL FPSGOOD) exitWith {};
if ({side _x == EAST} count allunits > 50) exitWith {};
_icls = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_center = _this;
_side = EAST;
_wp = [(_center select 0) + 20 - random 40,(_center select 1) + 20 - random 40,0];
_classes = [];
_unitrate = [3,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
for "_i" from 0 to _random do {_classes pushback (_icls call RETURNRANDOM);};
_group = [_center, _side, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
_n = [[_group], _side, _wp,[],_wp,""] SPAWN VehicleArrival;
CampGroups pushBack _group;
};

ECivRunFHelp = {
private ["_list","_cp","_nul","_p","_voice"];
_list = (getposATL _this) nearEntities [["Man"],120];
_p = getposATL player;
{if (!alive _x || {vehicle _x != _x} || {side _x != EAST}) then {_list = _list - [_x];};sleep 0.01;} foreach _list;
if (count _list > 0) then {
if (!isNull _this) then {_this setvariable ["Busy",1];};
if (!isNil{_this getvariable "CivNo"}) then {
_this switchmove "";
_this enableAI "AUTOTARGET";
_this enableAI "TARGET";
_this enableAI "MOVE";
_cp = getposatl _this;
_cp set [0,(_cp select 0) + 0.5];
_this setpos _cp;
if (!isNull _this) then {_this setvariable ["CivNo",nil];};
rCiv pushBack _this;
};
_this forcespeed -1;
_this setspeedmode "FULL";
_this domove (getposATL (_list select 0));
while {{!isNull _x && {alive _x}} count [_this,(_list select 0)] == 2 && {_this distance (_list select 0) > 15}} do {sleep 7;_this domove (getposATL (_list select 0));};
if ({!isNull _x && {alive _x}} count [_this,(_list select 0)] == 2) then {
if (isNil{_this getvariable "FBody"}) then {
_voice = ["Help me, there is some armed guy!!","There is some weird man sneaking around","Some unknown man is armed there, help!"] call RETURNRANDOM;
[_this,_voice] SPAWN FUnitSay2;
} else {
_voice = ["I found dead body over there!!","There is a dead man there on ground!","Help, someone got killed there!"] call RETURNRANDOM;
[_this,_voice] SPAWN FUnitSay2;
if (!isNull _this) then {_this setvariable ["FBody",nil];};
[(_list select 0),"HQ, send back up"] SPAWN {sleep 4;_this SPAWN FUnitSay2;};
(getposATL _this) spawn Ebackup;
};
_list = (getposATL _this) nearEntities [["Man"],25];
{if (!alive _x || {vehicle _x != _x} || {side _x != EAST}) then {_list = _list - [_x];};sleep 0.01;} foreach _list;
{_nul = [_x, _p] SPAWN Einvestigate;sleep 0.1;} foreach _list;
};
if (!isNull _this) then {_this setvariable ["Busy",nil];};
_this forcespeed 1;
_this setspeedmode "NORMAL";
};
};

//Enemy spot dead
_fEspotD = {
private ["_u","_b","_y","_list","_a","_nul"];
_b = true;
{
_u = _x; if ({_x distance _u < 20 && {isNil{_x getvariable "Found"}} && {[_x,_u] CALL FUNKTIO_LOS}} count alldeadmen > 0) then {
_y = _x;
{if (!isnull _x && {_x distance _u < 20} && {[_x,_u] CALL FUNKTIO_LOS}) then {_y = _x;_x setvariable ["Found",1];};} foreach alldeadmen;
_list = (getposATL _x) nearEntities [["Man"],25];
{_list = _list - [_x];} foreach ListIgnore;
{if (!alive _x || {vehicle _x != _x} || {side _x != EAST} || {behaviour _x == "COMBAT"}) then {_list = _list - [_x];};sleep 0.01;} foreach _list;
{
_a = 0;
if (isNil {_x getVariable "Moves"}) then {_a = 0;} else {_a = _x getVariable "Moves";};
if (!isNull _x) then {_x setvariable ["Moves", 2 + _a];
_x setvariable ["Point", getposATL _y];};
_nul = [_x, getposATL _y] SPAWN Einvestigate;
if (_b) then {(getposATL _y) spawn Ebackup;_b = false;[_y,"HQ, send back up"] SPAWN {sleep 4;_this SPAWN FUnitSay2;};};
sleep 3;
} foreach _list;
};
} foreach _this;
};
//Civilian spot dead
_fCspotD = {
private ["_list","_a","_voice","_nul","_y","_u"];
{
_u = _x; 
if ({_x distance _u < 20 && {isNil{_x getvariable "Found"}} && {[_x,_u] CALL FUNKTIO_LOS}} count alldeadmen > 0) then {
{if (!isnull _x && {_x distance _u < 20} && {[_x,_u] CALL FUNKTIO_LOS}) then {_x setvariable ["Found",1];};} foreach alldeadmen;
if (!isNull _x) then {_x setvariable ["FBody",1];};
_voice = ["Help, I found a dead body here!","Someone is dead here!","Terrible, a body!","Help, found a dead man!"] call RETURNRANDOM;
if (alive player) then {[_x,_voice] SPAWN FUnitSay2;};
[_x] SPAWN FUNKTIO_IGNORETIMED;
_list = (getposATL _x) nearEntities [["Man"],25];
{_list = _list - [_x];} foreach ListIgnore;
{if (!alive _x || {vehicle _x != _x} || {side _x != EAST} || {behaviour _x == "COMBAT"}) then {_list = _list - [_x];};sleep 0.01;} foreach _list;
if (count _list == 0) then {_x spawn ECivRunFHelp;};
_y = _x;
{
_a = 0;
if (isNil {_x getVariable "Moves"}) then {_a = 0;} else {_a = _x getVariable "Moves";};
if (!isNull _x) then {_x setvariable ["Moves", 2 + _a];
_x setvariable ["Point", getposATL _y];};
_nul = [_x, getposATL _y] SPAWN Einvestigate;
sleep 3;
if (random 1 < 0.5) then {
if !([_y,_x] CALL FUNKTIO_LOS) then {
_voice = ["What was that?","What is going there?","Someone in trouble?","Hey!"] call RETURNRANDOM;
if (alive player) then {[_x,_voice] SPAWN FUnitSay2;};
};
};
} foreach _list;
};
} foreach _this;
};

//MAIN LOOP
while {true} do {
sleep 1;
waitUntil {sleep 1; vehicle player == player};
_list = (getposATL player) nearEntities [["Man"],130];
_civs = [];
_ene = [];
{if (side _x == CIVILIAN && {!captive _x} && {!(typeof _x iskindof "Animal")}) then {_civs pushback _x;};} foreach _list;
{if (side _x == EAST) then {_ene pushback _x;};} foreach _list;
if (count _ene > 0 && {vehicle player == player}) then {
_n = _ene spawn _fPmove;
waitUntil {sleep 0.5; scriptdone _n};
if (vehicle player == player) then {
_n = _ene spawn _fEspotD;
waitUntil {sleep 0.5; scriptdone _n};
};
};
if (count _civs > 0 && {vehicle player == player}) then {
_m = _civs spawn _fCspotD;
waitUntil {sleep 0.5; scriptdone _m};
if (vehicle player == player) then {
_n = _civs spawn _fCspotH;
waitUntil {sleep 0.5; scriptdone _n};
};
if (vehicle player == player) then {
_h = _civs spawn _fPscareC;
waitUntil {sleep 0.5; scriptdone _h};
};
};
_j = [] spawn _fPscareA;
waitUntil {sleep 0.5; scriptdone _j};
};