
private ["_cur","_civ","_list","_toChoose","_nearest","_relat","_line","_v","_head","_nul","_tasks","_picked","_Eveh","_lead","_Einf","_n","_unts"];
sleep (random 0.05);
if (isNil"PUHUMASSA" && !dialog) then {
PUHUMASSA = true;
_unts = ((getposATL player) nearEntities [["Man"],7]);
_civ = player;
_cur = cursortarget;
if (!isNull _cur && {alive _cur} && {_cur in _unts} && {!isNil{(_cur getvariable "SaOkSurrendeRed")}} && {isNil{(_x getvariable "NoTalkative")}}) then {
if (!(_cur in CIVIGNORE)) then {[_cur] SPAWN FUNKTIO_IGNORETIMED;}; 
_civ = _cur; dostop _cur;
_cur dowatch player; 
_cur dotarget player; 
_list = _cur; 
[_cur] SPAWN {(_this select 0) setvariable ["Talki",1];sleep 120;(_this select 0) dofollow (_this select 0);(_this select 0) setvariable ["Talki",nil];};
} else { 
{if (_x distance player < 7 && {alive _x} && {leader _x != player} && {!isNil{(_x getvariable "SaOkSurrendeRed")}}) exitWith {if (!(_x in CIVIGNORE)) then {[_x] SPAWN FUNKTIO_IGNORETIMED;}; _civ = _x; dostop _x;_x dowatch player; _list = _x; [_x] SPAWN {(_this select 0) setvariable ["Talki",1];sleep 120;(_this select 0) dofollow (_this select 0);(_this select 0) setvariable ["Talki",nil];};};} foreach _unts; 
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
_toChoose = ["Who do we have here? You did a vise thing to surrender"];
if (!isNil{_civ getvariable "Chatted"}) then {
[_civ, player, "ZafV", "Pow1"] SPAWN SAOKKBTELL;
_head = "Leave me alone";
_toChoose = ["..."];
};
_postOK = ([] CALL SAOKNEARESTGPWITHPOWROOM);
if (typename _postOK != "STRING") then {_toChoose pushback "Lets move you to POW cell";};
_nul = [_head, _toChoose,"",[["JinN20","JinN21","JinN22","JinN23","JinN24"],["JinN26","JinN27","JinN28","JinN29"]],player] SPAWN FConversationDialogSur;
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {PUHUMASSA = nil;};
if (LineSelected == 0) then {
if (!isNil{_civ getvariable "Chatted"}) exitWith {PUHUMASSA = nil;};
_nearest = (player CALL SAOKNEARESTVIL); 
_relat = [_nearest, "A"] CALL SAOKVILRET;
_line = ["Leave me alone","You stink","Dont kill me, I have family","Please, I was forced to fight on this side","*spits*"];
_c = floor (random (count _line - 1));
_head = _line select _c;
_pa = "Pow";
_c = _c + 1;
_pa = _pa + (format["%1",_c]);
_toChoose = ["Tell me what you know","Any last words?","Wait here"];
_nul = [_head, _toChoose,"",[["JinN30","JinN31"],["JinN34","JinN35","JinN43","JinN44","JinN45"],["JinN25"]]] SPAWN FConversationDialogSur;
[_civ, player, "ZafV", _pa] SPAWN {
sleep 3;
_this SPAWN SAOKKBTELL;
};
};
if (LineSelected == 1) exitWith {
_ar = (_postOK getvariable "PowCells");
{
if ((_x select 1) == "") exitWith {
[_postOK,(_x select 1),_civ,_ar,_foreachIndex,(_x select 0)] SPAWN {
private ["_foreachIndex","_ar","_civ","_postOK"];
_postOK = _this select 0; 
_civ = _this select 2; 
_ar = _this select 3; 
_foreachIndex = _this select 4; 
titlecut ["","black out",1];
sleep 1;
if (_postOK in activatedPost) then {
_ar set [_foreachIndex, [(_this select 5), "Taken", face _civ,_civ]];
_postOK setvariable ["PowCells",_ar];
_civ setpos (_this select 5);
_civ setvariable ["SaOkSurrendeRed",nil];
_civ disableAI "MOVE";
removeallweapons _civ;
_civ setvariable ["PowMan",1];
removeHeadgear _civ;
removeVest _civ;
removeBackPack _civ;
removeUniform _civ;
removeAllAssignedItems _civ;
if (isNil{(_postOK getvariable "Junk")}) then {_postOK setvariable ["Junk",[_civ]];} else {_postOK setvariable ["Junk",(_postOK getvariable "Junk")+[_civ]];};
} else {
_ar set [_foreachIndex, [(_this select 5), "Taken", face _civ]];_postOK setvariable ["PowCells",_ar];
deletevehicle _civ;
};
titlecut ["","black in",1];
};
};
} foreach (_postOK getvariable "PowCells");
};
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {PUHUMASSA = nil;};
if (LineSelected in [0,1]) then {
_civ setvariable ["Chatted",1];
_tasks = [] CALL POWINFO;
_picked = _tasks call RETURNRANDOM;
_nul = [_picked] SPAWN SAOKSTARTTASK;
}; 


};
PUHUMASSA = nil;