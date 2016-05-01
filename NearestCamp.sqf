private ["_picked","_cen","_n","_n2","_copy"];
_picked = locationNull;
_cen = vehicle player;
//_bList = [];
//if (count _this > 2) then {_bList = _this select 2;};
if (count _this > 1) then {_cen = _this select 1;};
if (count _this > 0) then {
if ((_this select 0) != "ColorRed") then {_picked = nearestLocation [_cen, "CampB"];} else {_picked = nearestLocation [_cen, "CampR"];};
} else {
_n = nearestLocation [_cen, "CampB"];
_n2 = nearestLocation [_cen, "CampR"];
_picked = if (locationposition _n distance _cen < locationposition  _n2 distance _cen) then {_n} else {_n2};
};
_picked
