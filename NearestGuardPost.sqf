private ["_picked","_cen","_n","_n2","_copy"];
_picked = locationNull;
_cen = vehicle player;
if (count _this > 0) then {_cen = _this select 0;};
if (count _this > 1) then {
if ((_this select 1) != "ColorRed") then {_picked = nearestLocation [_cen, "PostG"];} else {_picked = nearestLocation [_cen, "PostR"];};
} else {
_n = nearestLocation [_cen, "PostG"];
_n = if (typename _n == "LOCATION") then {_n} else {locationNull};
_n2 = nearestLocation [_cen, "PostR"];
_n2 = if (typename _n == "LOCATION") then {_n2} else {locationNull};
_picked = if (locationposition _n distance _cen < locationposition _n2 distance _cen) then {_n} else {_n2};
};
_picked = if (!isnil{_picked getvariable "Post"}) then {_picked getvariable "Post"} else {objNull};
_picked
