//TEXT

private ["_m","_nr","_NotYourLine","_YourLines","_ok","_myDisplay"];
_nr = {
private ["_m"];
_m = _this select 0;
{if (getmarkerpos _x distance player < getmarkerpos _m distance player) then {_m = _x;};} foreach _this;
_m 
};
_NotYourLine = _this select 0;
//ARRAY 
_YourLines = _this select 1;
LineSelected = nil;
disableserialization;
_ok = createDialog "ConversationDialog"; 
_myDisplay = findDisplay 1232;
{
lbAdd [1500, _x];
} foreach _YourLines;
lbSetCurSel [1500, 0];

(_myDisplay displayCtrl 1100) ctrlSetStructuredText (parseText _NotYourLine);
sleep 0.1;
while {dialog && {isNil"Spoke"}} do {
LineSelected = (lbCurSel 1500);

sleep 0.1;
};
if (isNil"Spoke") then {LineSelected = nil;};

if (!isNil"LineSelected" && {count _this > 3} && {count (_this select 3) > 0}) then {
_vs = _this select 3;
if (count _vs > LineSelected) then {
_p = _vs select LineSelected;
if (typename _p == "ARRAY") then {_p = _p call RETURNRANDOM;};
_civ = if (count _this > 4 && {!isNil{_this select 4}}) then {_this select 4} else {player};
[player, _civ, "PlaV", _p] SPAWN SAOKKBTELL;
missionnamespace setvariable ["LastW", _p];
};
};

Spoke = nil;
closeDialog 0;
