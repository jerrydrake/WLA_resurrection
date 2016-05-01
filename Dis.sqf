private ["_a","_b"];
_a = if (count _this > 0 && {typename (_this select 0) == "STRING"}) then {_this select 0} else {"L"}; 
//DISVAR == 1000 as default
_b = DISVAR;
switch (_a) do {
case "A": {_b = DISVAR*2;};
case "Lb": {_b = DISVAR*0.75;};
case "Lc": {_b = DISVAR*1.1;};
case "Ld": {_b = DISVAR*0.9;};
case "V": {_b = DISVAR*1.2;};
case "W": {_b = DISVAR*1.5;};
case "C": {_b = DISVAR*0.075;};
};
if (vehicle player != player && {(getposATL vehicle player) select 2 > 10}) then {_b = DISVAR*2;};
if (_b > 4500) then {_b = 4500;};
_b