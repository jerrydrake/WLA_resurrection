

private ["_unit", "_group"];


_unit = _this select 0;
waituntil {sleep 4; isNil"_unit" || {behaviour _unit == "COMBAT"} || {!(alive _unit)}};
if (!isNil"_unit" && alive _unit) then {

if (!(daytime < 3.5 || {daytime > 21})) then {
if (_unit canAdd "SmokeShell") then {
_unit addmagazine "SmokeShell";
sleep 1;
_unit forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
};
} else {
if (_unit canAdd "Chemlight_Red") then {
_unit addmagazine "Chemlight_Red";
sleep 1;
_unit forceWeaponFire ["ChemlightRedMuzzle","ChemlightRedMuzzle"];
};
};

_group = (units (group _unit) - [_unit]);
if ((count _group)> 1) then {
_unit = _group call RETURNRANDOM;
if (_unit canAdd "SmokeShell") then {
_unit addmagazine "SmokeShell";
sleep 1;
_unit forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
};
};
_group = units group _unit - [_unit, leader _unit];
if ((count _group)> 1) then {
_unit = _group call RETURNRANDOM;
if (_unit canAdd "SmokeShell") then {
_unit addmagazine "SmokeShell";
sleep 1;
_unit forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
};
_group = (units group _unit) - [_unit];
if ((count _group)> 1) then {
_unit = _group call RETURNRANDOM;
_unit suppressFor (6+(random 10)); 
};
};


};