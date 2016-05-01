private ["_places","_picked"];
_picked = "Fac1";
if (count FacMarkers > 0) then {
_places = FacMarkers;
_picked = (_places select 0);
{if ((getmarkerpos _picked) distance vehicle player > (getmarkerpos _x) distance vehicle player) then {_picked = _x;};} foreach _places;
};
_picked