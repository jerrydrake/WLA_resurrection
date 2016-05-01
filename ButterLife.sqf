sleep 3;
_units = [];
while {surfaceIsWater (getposATL player)} do {
while {count _units > 470} do {sleep 7; {if (_x distance player > 120) then {_units = _units - [_x];_x spawn SAOKDELETE;};} foreach _units;};
_Ppos = (getposATL player);
_start = [(_Ppos select 0) - 5 + random 10, (_Ppos select 1) - 5 + random 10, 0.5];
while {!surfaceIsWater _start} do {sleep 0.1;_start = [(_Ppos select 0) - 5 + random 10, (_Ppos select 1) - 5 + random 10, 0.5];}; 
_ran = ["Butterfly"] call RETURNRANDOM; 
// "BuoyBig","BuoySmall"
_animal = createAgent [_ran, _start, [], 0, "NONE"]; 
_animal setpos _start;
_animal setdir (random 360);
_units set [count _units,_animal];

};
{_x spawn SAOKDELETE;} foreach _units;