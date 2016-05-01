/*
	File: fn_moduleEffectsSmoke.sqf
	Author: Borivoj Hlava (tiny customization changes by SaOk)

	Description:
	Module function. Creates smoke on position of module.

	Parameter(s):
	_this select 0 (Object) - Module logic.
	
	Returned value:
	None.
*/

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_fnc = "BISsmoke";

[_logic,_fnc,1] call BISemitter;