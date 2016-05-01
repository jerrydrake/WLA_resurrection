private ["_gua","_marker","_mar","_col","_typ"];
_gua = _this select 0;
if (isNil"_gua" || {typename _gua != "OBJECT"}) exitWith {};
if (count (nearestLocations [_gua, ["PostG","PostR"],30]) == 0) then {
NUMM=NUMM+1;
_mar = format ["Guard%2PMM%1",NUMM,floor (random 10)];
_col = "ColorGreen";
_typ = "n_installation";
if (!isNil{_gua getvariable "supplyDepot"} && {count _this == 1}) then {_typ = "n_service";};
if (count _this > 1) then {_col = "ColorRed";_typ = "o_installation";};
if (!isNil{_gua getvariable "supplyDepot"} && {count _this > 1}) then {_typ = "o_service";};
_marker = createMarker [_mar,getposATL _gua];
_marker setMarkerShape "ICON";
_marker setMarkerType _typ;
_marker setMarkerSize [0,0];
_marker setMarkerColor _col;
_marker setMarkerText "";
_gua setvariable ["Gmark",_mar];
if (_col == "ColorGreen") then {
_c = createLocation ["PostG", getposATL _gua, 100, 100];
_c setvariable ["Marker",_marker];
_c setvariable ["Post",_gua];
} else {
_c = createLocation ["PostR", getposATL _gua, 100, 100];
_c setvariable ["Marker",_marker];
_c setvariable ["Post",_gua];
};
};
[] SPAWN SAOKLINES;