private ["_pos","_loc","_name","_seloc"];
_pos = _this;
_loc = (nearestLocations [_pos, ["NameVillage","NameCity","NameCityCapital","NameLocal"], 2000]);
_name = "Nowhere";
if (count _loc > 0) then {
_seloc = _loc call RETURNRANDOM;
{if (position _seloc distance _pos > position _x distance _pos) then {_seloc = _x;};} foreach _loc;
_name = text _seloc;
};
_name 

