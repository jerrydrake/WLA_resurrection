private ["_unit","_dir","_t","_cdir","_c","_totaltime","_unittowatch"];
_unit = _this select 0;
_unittowatch = _this select 1; 
_totaltime = _this select 2;
_unit disableAI "MOVE";

while {_totaltime > 0} do {
_t = 2;
_dir = [_unit, _unittowatch] call SAOKDIRT;
if (_dir < 0) then {_dir = _dir + 360;};
while {alive _unit && (direction _unit > _dir + 5 || direction _unit < _dir - 5) && _totaltime > 0} do {
_cdir = direction _unit; 
_c = abs (_dir - _cdir);
if (_t == 2) then {
if (_cdir < 180 && _dir < 180 && _cdir > _dir) then {_unit setdir (_cdir - 1);_t = 0;}; 
if (_cdir < 180 && _dir < 180 && _cdir < _dir) then {_unit setdir (_cdir + 1);_t = 1;}; 
if (_cdir > 180 && _dir > 180 && _cdir > _dir) then {_unit setdir (_cdir - 1); _t = 0;};
if (_cdir > 180 && _dir > 180 && _cdir < _dir) then {_unit setdir (_cdir + 1);_t = 1;}; 
if (_cdir > 180 && _dir < 180 && _c < 180) then {_unit setdir (_cdir - 1); _t = 0;};
if (_cdir > 180 && _dir < 180 && _c > 180) then {_unit setdir (_cdir + 1); _t = 1;};
if (_cdir < 180 && _dir > 180 && _c < 180) then {_unit setdir (_cdir + 1); _t = 1;};
if (_cdir < 180 && _dir > 180 && _c > 180) then {_unit setdir (_cdir - 1); _t = 0;};
};
if (_t == 0) then {_unit setdir (_cdir - 1);};
if (_t == 1) then {_unit setdir (_cdir + 1);};
sleep 0.01;
_totaltime = _totaltime - 0.01;
};
sleep 2;
_totaltime = _totaltime - 2;
};
   