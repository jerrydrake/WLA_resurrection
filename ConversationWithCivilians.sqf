
private ["_cur","_civ","_list","_toChoose","_nearest","_relat","_line","_v","_head","_nul","_tasks","_picked","_Eveh","_lead","_Einf","_n","_unts"];
sleep (random 0.05);
if (isNil"PUHUMASSA" && !dialog) then {
PUHUMASSA = true;

_unts = ((getposATL player) nearEntities [["Civilian"],7]);
_civ = player;
_cur = cursortarget;
if (!isNull _cur && {alive _cur} && {_cur in _unts}) then {
if (!(_cur in CIVIGNORE)) then {[_cur] SPAWN FUNKTIO_IGNORETIMED;}; 
_civ = _cur; dostop _cur;
_cur dowatch player; 
_cur dotarget player; 
_list = _cur; 
[_cur] SPAWN {(_this select 0) setvariable ["Talki",1];sleep 120;(_this select 0) dofollow (_this select 0);(_this select 0) setvariable ["Talki",nil];};
} else { 
{if (_x distance player < 7 && {alive _x}) then {if (!(_x in CIVIGNORE)) then {[_x] SPAWN FUNKTIO_IGNORETIMED;}; _civ = _x; dostop _x;_x dowatch player; _x dotarget player; _list = _x; [_x] SPAWN {(_this select 0) setvariable ["Talki",1];sleep 120;(_this select 0) dofollow (_this select 0);(_this select 0) setvariable ["Talki",nil];};};} foreach _unts; 
};
if (!isPlayer _civ) then {
if !("ItemRadio" in assignedItems _civ) then {_civ linkItem "ItemRadio";};
//[a1,"PlaV", "JinVoices\sounds.bikb", ""] CALL SAOKKBTOPIC; [a1,player, "PlaV", "Civ10"]SPAWN SAOKKBTELL;
[_civ,"PlaV", "JinVoices\sounds.bikb", ""] CALL SAOKKBTOPIC;
missionnamespace setvariable ["CivC",_civ];
if (isNil{_civ getvariable "CivNo"}) then {_civ switchmove "";};
_civ disableAI "Move";
_civ SPAWN {
waitUntil {sleep 5; isNull _this || {missionnamespace getvariable "CivC" != _this}};
if !(isNull _this) then {_this enableAI "Move";};
};
};
_u = [];
{if ([_x, player] CALL FUNKTIO_LOS) then {_u pushback _x;};} foreach _unts;
if (count _u > 0) then {
_ppp = _u call RETURNRANDOM;
{if (_x distance player < _ppp distance player) then {_ppp = _x;};} foreach _u;
_unts = + [_ppp];
};
_line = ["*Staring at you*"] call RETURNRANDOM;
_head = _line;
_toChoose = ["Hello there, civilian. May I chat with you quickly?"];
if !("MetResContact" in (missionnamespace getvariable "Progress")) then {
_toChoose = ["Hello there, civilian. May I chat with you quickly?","Hello there, I would need to find local resistance group"];
};
_nul = [_head, _toChoose,"",[["V28","V29","V30","V31","V32","V33"],["V26","V27"]],_civ] SPAWN FConversationDialog;

waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {PUHUMASSA = nil;};
if (LineSelected == 0) then {
_nearest = (player CALL SAOKNEARESTVIL); 
_relat = [_nearest, "A"] CALL SAOKVILRET;

_line = 
switch (_relat) do {
case "Friendly" : {["Hi friend, sure","Of course, anything for you guys","You dont need to even ask, friend","Yes, anyday","Sure","What? Yes. Friend"]};
case "Angry" : {["Yes, just dont steal my car","Yes, thank you for bringing war to our village","I dont like to see you here","Cant you play soldiers elsewhere?","Cant I walk in peace?","Okay, but be carefull there is folks arming against you in this village","I dont know, I guess that is ok"]};
case "Hostile" : {["Yes, just dont shoot me","This one time, but I hate you","Fine, but not too long. I dont want to get shot","Please, I dont want to die","Ok, if you leave us alone after this"]};
default {["Sure, what do you have in mind?","Oh, hello soldier","Hey dude, sure","Go ahead and shoot"]};
};

_v = 
switch (_relat) do {
case "Friendly" : {["Civ1","Civ2","Civ3","Civ4","Civ5","Civ6","Civ8","CivT16","CivT17"]};
case "Angry" : {["Civ7","Civ9","Civ10","Civ11","CivT10","CivT11","CivT12","CivT13","CivT14","CivT15"]};
case "Hostile" : {["Civ7","Civ10","Civ11","CivT10","CivT11","CivT12","CivT13","CivT14"]};
default {["Civ1","Civ2","Civ3","Civ4","Civ5","Civ6","Civ9","CivT14","CivT15","CivT17"]};
};
[_civ,_v] SPAWN {
_civ = _this select 0;
_v = _this select 1;
_aika = time + 6;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_civ, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 6;};
//[player,"PlaV", "JinVoices\sounds.bikb", ""] CALL SAOKKBTOPIC;[player,player, "PlaV", "Civ1"]SPAWN SAOKKBTELL;
[_civ,player, "PlaV", (_v call RETURNRANDOM)]SPAWN SAOKKBTELL;
};
_head = _line call RETURNRANDOM;
_toChoose = ["Anything I can do for your village?"];
if (!(isPlayer _civ) && {isNil{_civ getvariable "GaveIntel"}}) then {
_toChoose = ["Anything I can do for your village?","Have you seen any enemy movement recently?"];
};
_nul = [_head, _toChoose,"",[["V25"],["V19","V20","V21","V22","V23","V24"]]] SPAWN FConversationDialog;
};
if (LineSelected == 1) exitWith {_nul = ["VillageTasks\TaskFindRes.sqf"] SPAWN SAOKSTARTTASK;PUHUMASSA = nil;};
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {PUHUMASSA = nil;};
if (LineSelected == 0) then {
_tasks = ["VillageTasks\TaskCrate.sqf","VillageTasks\TaskWater.sqf","VillageTasks\TaskCivPOW.sqf","VillageTasks\TaskEscort.sqf"];
if (count ((getposATL  player) nearEntities [["C_Offroad_01_F","C_Quadbike_01_F"], 50]) > 0) then {_tasks = _tasks + ["VillageTasks\TaskRepair.sqf"];};
if ({getmarkercolor _x == "ColorRed" && {getmarkerpos _x distance vehicle player < 300} && {{alive _x && {side _x == EAST}} count (getmarkerpos _x nearEntities [["Man"],80]) > 0}} count FORTRESSESMM > 0) then {_tasks = ["VillageTasks\TaskFortress.sqf"];};
if !((locationposition (player CALL SAOKNEARESTVIL)) distance (getposATL ([locationposition (player CALL SAOKNEARESTVIL)] CALL RETURNGUARDPOST)) < 700) then {_tasks = _tasks + ["VillageTasks\TaskGuardPost.sqf"];};

_picked = _tasks call RETURNRANDOM;
_nul = [_picked] SPAWN SAOKSTARTTASK;
}; 
if (LineSelected == 1) then {
_civ SPAWN {
_aika = time + 6;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 6;};
_rr = ["CivI1","CivT18","CivT19","CivT20","CivT21"]call RETURNRANDOM;
[_this, player, "PlaV", _rr]SPAWN SAOKKBTELL;
};
_line = ["Not more than usually","Tanks passed by a day ago","There was bodies near the gas station","I saw a dog eating pigeon","They come and go","They sneak here all the time","Get out of here!"] call RETURNRANDOM;
_Eveh = player;
{_lead = leader _x;if (side _lead == EAST && {vehicle _lead != _lead} && {alive _lead}) exitWith {_Eveh = vehicle leader _x;};} foreach allGroups;
_Einf = player;
{_lead = leader _x;if (side _lead == EAST && {vehicle _lead == _lead} && {alive _lead}) exitWith {_Einf = leader _x;};} foreach allGroups;
if ({!isPlayer _x} count [_Einf,_Eveh] > 0) then {
_line = "Yes, I have seen some persians lurking not far from here. I mark those on your map";
if !(isPlayer _Eveh) then {_n = [getposATL _Eveh,"o_armor"] SPAWN IntelMarker;};
if !(isPlayer _Einf) then {_n = [getposATL _Einf,"o_inf"] SPAWN IntelMarker;};
};
_head = _line;
_toChoose = ["Okay, good bye"];
_nul = [_head, _toChoose,"",[["JinN53"]]] SPAWN FConversationDialog;
waitUntil {sleep 0.5; scriptdone _nul};
};

};
PUHUMASSA = nil;