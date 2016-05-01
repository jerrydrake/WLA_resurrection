private ["_good"];
_good = true;
if ({_this distance (getmarkerpos _x) < (getmarkersize _x select 0)} count Bpositions > 0) then {_good = false;};
_good