/*
	Author: Karel Moricky (minor tweaks by SaOk)

	Description:
	Spawns flock of crows circling the area.

	Parameter(s):
	_this select 0: ARRAY - Position of flock
	_this select 1 (Optional): NUMBER - area size
	_this select 2 (Optional): NUMBER - number of crows

	Returns:
	ARRAY - list of all spawned crows
*/
private ["_flockPos","_flockArea","_flockCount","_crowList","_crow"];

_flockPos = _this select 0;
_flockArea = if (count _this > 1) then {_this select 1} else {50};
_flockCount = if (count _this > 2) then {_this select 2} else {_flockArea / 5};
_flockHeight = 30 + random 10;
_Hlong = _this select 3;
_flyFar = if (count _this > 4) then {_this select 4} else {300};







_crowList = [];
_type = ["Kestrel_Random_F","SeaGull","Kestrel_Random_F","SeaGull","Kestrel_Random_F","SeaGull"]call RETURNRANDOM; 
_type = "SeaGull";
for "_i" from 1 to _flockCount do {


	_crow = _type camcreate [
		(getposATL _flockPos select 0) - _flockArea + (random _flockArea)*2 + _flyFar,
		(getposATL _flockPos select 1) - _flockArea + (random _flockArea)*2,
		_flockHeight
	];
	[_crow,_flockArea,_flockPos] execfsm "CrowsM2.fsm";
	_crowList pushBack _crow;
};


sleep _Hlong;
{if (!isnull _x) then {_x spawn SAOKDELETE;};} foreach _crowList;
