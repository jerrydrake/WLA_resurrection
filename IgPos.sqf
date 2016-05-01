private ["_bol"];
_bol = true;
if (count (nearestObjects [_this, SAOKobjcB, 2]) > 0) then {_bol = false;};
_bol