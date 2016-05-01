private ["_unit","_line","_someId"];
_unit = _this select 0;
_line = _this select 1; 
NUMM = NUMM + 1;
_someId = format ["IDUSAY%1",NUMM];
[_someId, "onEachFrame", {
	_start = getposATL (_this select 0);
	_start set [2,(_start select 2)+1.9];
	drawIcon3D ["", [1,1,1,1], _start, 0, 0, 0, _this select 1, 1, SAOKFSI, "TahomaB"];
}, [_unit, _line]] call BIS_fnc_addStackedEventHandler;
_t = 3; 
if (count _this > 2) then {_t = _this select 2;};
sleep _t;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;