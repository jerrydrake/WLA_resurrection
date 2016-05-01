
private ["_cur","_civ","_list","_toChoose","_nearest","_relat","_line","_v","_head","_nul","_tasks","_picked","_Eveh","_lead","_Einf","_n","_unts"];
sleep (random 0.05);
if (isNil"PUHUMASSA" && !dialog) then {
PUHUMASSA = true;
_unts = ((getposATL player) nearEntities [["Man"],7]);
_civ = player;
_cur = cursortarget;
if (!isNull _cur && {alive _cur} && {_cur in _unts} && {!(side _cur in [EAST,CIVILIAN])} && {leader _cur != player}) then {
if (!(_cur in CIVIGNORE)) then {[_cur] SPAWN FUNKTIO_IGNORETIMED;}; 
_civ = _cur; dostop _cur;
_cur dowatch player; 
_cur dotarget player; 
_list = _cur; 
[_cur] SPAWN {(_this select 0) setvariable ["Talki",1];sleep 120;(_this select 0) dofollow (_this select 0);(_this select 0) setvariable ["Talki",nil];};
} else { 
{if (_x distance player < 7 && {!(side _x in [EAST,CIVILIAN])}  && {alive _x} && {leader _x != player}) then {if (!(_x in CIVIGNORE)) then {[_x] SPAWN FUNKTIO_IGNORETIMED;}; _civ = _x; dostop _x;_x dowatch player; _x dotarget player; _list = _x; [_x] SPAWN {(_this select 0) setvariable ["Talki",1];sleep 120;(_this select 0) dofollow (_this select 0);(_this select 0) setvariable ["Talki",nil];};};} foreach _unts; 
};
if (!isPlayer _civ) then {
[_civ, "ZafV", "ZafVoices\sounds.bikb", ""]CALL SAOKKBTOPIC;
missionnamespace setvariable ["CivC",_civ];
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
_toChoose = ["Soldier, how is it going?"];
/*
if !("MetResContact" in (missionnamespace getvariable "Progress")) then {
_toChoose = ["Hello there, civilian. May I chat with you quickly?","Hello there, I would need to find local resistance group"];
};
*/
_nul = [_head, _toChoose,"",[["JinN54"]],player] SPAWN FConversationDialogSol;

waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {PUHUMASSA = nil;};
if (LineSelected == 0) then {
_nearest = (player CALL SAOKNEARESTVIL); 
_relat = [_nearest, "A"] CALL SAOKVILRET;

_line = ["Quite good, still alive","I dont remember the last day without firefight","Enjoying the weather","Waiting for cantine hour","I will crack at any moment, just kidding"];
_c = floor (random (count _line - 1));
_head = _line select _c;
_pa = "Sol";
_c = _c + 1;
_pa = _pa + (format["%1",_c]);
_nameA = toArray (typeof _civ);
_f = [_nameA select 0];
_f = toString _f;
if (_f == "I") then {"d"} else {_pa = _pa + (["","b","c"]call RETURNRANDOM);};
[_civ, player, "ZafV", _pa] SPAWN {
sleep 3;
_this SPAWN SAOKKBTELL;
};


_toChoose = ["Any troubles that I could try to solve for you?"];
/*
if (!(isPlayer _civ) && {isNil{_civ getvariable "GaveIntel"}}) then {
_toChoose = ["Any troubles that I could try to solve for you?","Have you seen any enemy movement recently?"];
};
*/
_nul = [_head, _toChoose,"",[["JinN50"]]] SPAWN FConversationDialogSol;
};
//if (LineSelected == 1) exitWith {_nul = [] execVM "VillageTasks\TaskFindRes.sqf";PUHUMASSA = nil;};
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {PUHUMASSA = nil;};
if (LineSelected == 0) then {
_tasks = [] CALL SOLDIERSTASKS;
_picked = _tasks call RETURNRANDOM;
_nul = [_picked] SPAWN SAOKSTARTTASK;
}; 
if (LineSelected == 1) then {
_civ SPAWN {
_aika = time + 6;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 6;};
//_rr = ["CivI1","CivT18","CivT19","CivT20","CivT21"]call RETURNRANDOM;
//_this kbTell [player, "PlaV", _rr];
};
_line = ["Not more than usually","Tanks passed by a day ago","There was bodies near the gas station","I saw dog eating pigeon","They come and go","They sneak here all the time","Get out of here!"] call RETURNRANDOM;
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
_nul = [_head, _toChoose,"",[["JinN6","JinN53"]]] SPAWN FConversationDialogSol;
waitUntil {sleep 0.5; scriptdone _nul};
};

};
PUHUMASSA = nil;