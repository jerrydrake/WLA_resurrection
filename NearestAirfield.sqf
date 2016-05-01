private ["_places","_picked","_tar"];
_places = ["InsertionM"];
if (count AIRFIELDLOCATIONS > 0) then {_places = AIRFIELDLOCATIONS;};
_picked = (_places select 0);
_tar = if (count _this > 0) then {_this select 0} else {vehicle player};
if (count _this > 1) then {
{if ((getmarkercolor _picked == (_this select 1)) && {(getmarkerpos _picked) distance _tar > (getmarkerpos _x) distance _tar}) then {_picked = _x;};} foreach _places;
} else { 
{if ((getmarkerpos _picked) distance _tar > (getmarkerpos _x) distance _tar) then {_picked = _x;};} foreach _places;
};
_picked