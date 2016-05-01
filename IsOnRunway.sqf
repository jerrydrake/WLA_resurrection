private ["_bol","_run"];
_bol = false;
_run = "";
{if (_this distance (getmarkerpos _x) < 2000) exitWith {_run = _x;};} foreach AIRFIELDLOCATIONS;
if (_run != "") then {
switch _run do {
case "AirC": {_run = runway0;};
case "AirC_1": {_run = runway1;};
case "AirC_2": {_run = runway2;};
case "AirC_3": {_run = runway3;};
case "AirC_4": {_run = runway4;};
case "AirC_5": {_run = runway5;};
case "": {_run = runwayNul;};
};
if (([_run, _this] call BIS_fnc_inTrigger)) then {_bol = true;};
};
_bol