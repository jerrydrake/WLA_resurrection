while {true} do {
_v = + vehicles;
_c = count _v - 1;
_vP = vehicle player;
_tx = "";
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _v select _i;
if (alive _xx && {count crew _xx > 0} && {side ((crew _xx) call RETURNRANDOM) == EAST} && {!(typeof _xx iskindof "StaticWeapon")}) then {
_d = _vP distance _xx;
_s = "km";
_jaa = 0.01;
_dN = "NW";
_dir = round ([player, _xx] call SAOKDIRT);
if (_dir < 0) then {_dir = _dir + 360;};
if (_dir > 360) then {_dir = _dir - 360;};
if (_dir < 22.5 || {_dir > 337.5}) then {_dN = "N";};
if (_dir >= 22.5 && {_dir < 67.5}) then {_dN = "NE";};
if (_dir >= 67.5 && {_dir < 112.5}) then {_dN = "E";};
if (_dir >= 112.5 && {_dir < 157.5}) then {_dN = "SE";};
if (_dir >= 157.5 && {_dir < 202.5}) then {_dN = "S";};
if (_dir >= 202.5 && {_dir < 247.5}) then {_dN = "SW";};
if (_dir >= 247.5 && {_dir < 292.5}) then {_dN = "W";};
//if (_dir >= 155 && {_dir < 195}) then {_dN = "NW";};

if (_d >= 1000) then {_val = (round ((_vP distance _xx) * _jaa)) * 0.1;};
if (_d < 1000) then {_s = "m";_jaa = 1;_val = round ((_vP distance _xx) * _jaa);};
if (_d < 100) then {_s = "m";_jaa = 1;_val = round ((_vP distance _xx) * _jaa);};
if (_d < 10) then {_s = "m";_jaa = 1;_val = round ((_vP distance _xx) * _jaa);};
_tx = _tx + _dN +" "+(getText (configfile >> "CfgVehicles" >> typeof _xx >> "displayName")) + format [" %1%3 away, speed %2km/h",_val, round (speed _xx),_s]+"<br/>";
};
sleep 0.1;
};
hint parseText _tx;
sleep 8;
};