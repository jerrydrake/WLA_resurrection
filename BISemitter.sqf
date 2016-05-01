/*
	File: fn_moduleEffectsEmitterCreator.sqf
	Author: Borivoj Hlava (tiny customization changes by SaOk)

	Description:
	Module function. Creates particle emitters and calls effect function.

	Parameter(s):
	_this select 0 (Object) - Module logic.
	_this select 1 (String) - Function name.
	_this select 2 (Number) - Optional - Number of emitters.
	
	Returned value:
	None.
*/

_logic = [_this,0,objnull,[objnull]] call bis_fnc_param;
_fnc = [_this,1,"",[""]] call bis_fnc_param;
_nr = [_this,2,1,[1]] call bis_fnc_param;
if (_nr < 1) then {_nr = 1};

if ((_fnc != "") && !(isNull _logic)) then {
	_emitterArray = [];
	while {_nr > 0} do {
		_source = "#particlesource" createVehicle (getPos _logic);
		_emitterArray = _emitterArray + [_source];
		_nr = _nr - 1;
	};
	_logic setVariable ["effectEmitter",_emitterArray];
	
	if (isMultiplayer) then {
		[_logic,_fnc,nil,true] call BIS_fnc_MP;
	} else {
		_logic call (missionnamespace getvariable _fnc);
	};
} else {
	["No particle emitter created! Missing module logic or function name."] call BIS_fnc_log;
};