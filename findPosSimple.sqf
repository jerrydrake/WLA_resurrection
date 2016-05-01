

private ["_position", "_radius"];

_position = if (typeName (_this select 0) == "ARRAY") then {(_this select 0)} else {getposATL (_this select 0)};
_radius = _this select 1;
_bestplace = [(_position select 0)- _radius + random (_radius*2),(_position select 1)- _radius + random (_radius*2),0];
while {surfaceIsWater _bestplace} do {_bestplace = [(_position select 0)- _radius + random (_radius*2),(_position select 1)- _radius + random (_radius*2),0];};
_bestplace = [[_bestplace]];


_bestplace

