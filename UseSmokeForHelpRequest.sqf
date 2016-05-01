
private ["_units"];
_units = _this select 0;
while {{behaviour _x == "COMBAT"} count _units == 0 && {(count _units > 0)}} do {
sleep 4;
{if (alive _x) then {} else {_units = _units - [_x];};} foreach _units;
};
{
if (alive _x && {(group _x != group player)}) exitWith {
if (!(daytime < 3.5 || {daytime > 21})) then {
_x addmagazine "SmokeShellYellow";
sleep 1;
_x fire ["SmokeShellMuzzle","SmokeShellMuzzle","SmokeShellYellow"];
} else {
_x addmagazine "Chemlight_Blue";
sleep 1;
_x fire ["ChemlightBlueMuzzle","ChemlightBlueMuzzle","Chemlight_Blue"];
};
};
} foreach _units;
