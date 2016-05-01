private ["_tasks"];
_tasks = ["PowInfo\InfoNothing.sqf","PowInfo\InfoCrate.sqf","PowInfo\InfoDepot.sqf"];
if (count _this > 0) then {_tasks = _tasks - [_this select 0];};
_tasks