private ["_nd","_pos","_color","_classes","_mar2","_mar","_mT","_si"];
_pos = _this select 0;
_color = _this select 1;
_classes = _this select 2;
//NUMM=NUMM+1;
//_mar = if (!(count _this > 5) || {(_this select 5) in allMapMarkers}) then {format ["VVZoneM%1M%2",NUMM,floor random 10]} else {_this select 5};
//while {_mar in allMapMarkers} do {NUMM=NUMM+1; _mar = format ["VVZoneM%1M%2",NUMM,floor random 10];};
//_mar2 = createMarker [_mar,_pos];
_mar = createLocation ["Name", _pos, 2000, 2000];
//_mar2 setMarkerShape "ICON";
_mT = if (_color == "ColorRed") then {
if !(_classes select 0 isKindOf "Air") then {"o_armor"} else {"o_air"}
} else {
if !(_classes select 0 isKindOf "Air") then {"b_armor"} else {
if (_classes select 0 isKindOf "Helicopter") then {
"b_air"
} else {
"b_plane"
}
}
};
if (count _this > 3) then {_mT = _this select 3;};
//_mar2 setMarkerType _mT;
_mar setvariable ["Mtype",_mT];
//(size _x)
//_si = 0.65 + (0.15*(count _classes));
//_mar2 setMarkerSize [_si,_si];
//_mar2 setMarkerColor _color; missionnamespace setvariable [(_this getvariable "IDCODE"),nil];
_mar setvariable ["Mcolor",_color];
_code = format ["VEHZID%1",NUMM];
_mar setvariable ["IDCODE",_code];
missionnamespace setvariable [_code,_mar];
if ({[_x, _mT] call SAOKINSTRING} count ["_support","_med"] > 0) then {SUPRESOURT pushback _mar;};
if ({[_x, _mT] call SAOKINSTRING} count ["_art","_mor"] > 0 && {_tex == ""}) then {ARTYZONES pushback _mar;};
if ({[_x, _mT] call SAOKINSTRING} count ["_unknown"] > 0 && {_tex == " AIR"}) then {CARRYZONES pushback _mar;};
_tex = "";
if (count _this > 4 && {typename (_this select 4) == "STRING"}) then {_tex = (_this select 4);};
//_mar2 setMarkerText _tex;
_mar setvariable ["Mtext",_tex];
VEHZONES pushBack _mar;
VEHZONESA pushBack _mar;
//&& {{count (_x select 1) < 8} count (_x select 1) > 0} configfile >> "CfgMagazines" >> "200Rnd_65x39_Belt_Tracer_Yellow" >> "ammo"
if (count _this > 5 && {typename (_this select 5) == "ARRAY"}) then {
_mar setvariable ["ZONEDATA",(_this select 5)];
} else {
_da = [];
{
_nA = _x CALL SAOKRETVEHAMM;
_da pushback [_x,_nA, 1, 0];
} foreach _classes;
[_mar,_da] CALL SAOKZONED;
};
if (["_uav", _mT] call SAOKINSTRING) then {
_sss = ["F","UAV",""];
if (_color == "ColorRed") then {_sss = ["E","UAV"];};
_sss SPAWN SAOKRADIOMES;
};
if (["_armor", _mT] call SAOKINSTRING) then {
_sss = ["F","ARMOR",""];
if (_color == "ColorRed") then {_sss = ["E","ARMOR"];};
_sss SPAWN SAOKRADIOMES;
};
if (["_air", _mT] call SAOKINSTRING || (["_plane", _mT] call SAOKINSTRING)) then {
_sss = ["F","CHOPN",""];
if (_color == "ColorRed") then {_sss = ["E","CHOPN"];};
_sss SPAWN SAOKRADIOMES;
};
_mar setvariable ["VZ",1];
_mar