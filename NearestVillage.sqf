private ["_places","_picked","_pp"];
//if (count AmbientCivN > 0) then {_places = AmbientCivN;};
_pp = getposATL (vehicle player);
if (count _this > 0) then {
_pp = _this select 0;
if (typeName _pp == "ARRAY") then {
_pp = [_pp select 0, _pp select 1, 0];
};
if (typeName _pp == "OBJECT") then {
_pp = getposATL _pp;
};
if (typeName _pp == "STRING") then {
_pp = getmarkerpos _pp;
};
};
_places = _pp call SAOKVILAR;
if (count _places == 0) then {_places = ["InsertionM"];};
_picked = (_places select 0);
if (count _this > 1) then {
while {_picked in (_this select 1)} do {_picked = _places call RETURNRANDOM;};
{if (((getmarkerpos _picked) distance _pp) > ((getmarkerpos _x) distance _pp) && {!(_x in (_this select 1))}) then {_picked = _x;};} foreach _places;
} else {
{if (((getmarkerpos _picked) distance _pp) > ((getmarkerpos _x) distance _pp)) then {_picked = _x;};} foreach _places;
};
_picked