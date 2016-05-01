private ["_units","_Ppos","_start","_ran","_animal"];
sleep 3;
_units = [];
while {((getposASL player) select 2) >= -1} do {
while {count _units > 80} do {sleep 7; {if (_x distance (vehicle player) > 120) then {_units = _units - [_x];_x spawn SAOKDELETE;};} foreach _units;};
_Ppos = (getposATL (vehicle player));
_start = [(_Ppos select 0) - 50 + random 100, (_Ppos select 1) - 50 + random 100, -10+(random 9)];
while {!surfaceIsWater _start || {[_start CALL SAOKATLTOASL,(vehicle player)] CALL FUNKTIO_LOSOBJ}} do {sleep 0.1;_start = [(_Ppos select 0) - 50 + random 100, (_Ppos select 1) - 50 + random 100, -10+(random 9)];}; 
_ran = ["Turtle_F","Turtle_F","Tuna_F","Mullet_F","Mackerel_F","Fish_Base_F","CatShark_F"] call RETURNRANDOM; 
// "BuoyBig","BuoySmall"
_animal = createAgent [_ran, _start, [], 0, "NONE"]; 
_animal setpos _start;
_animal setdir (random 360);
_units set [count _units,_animal];

};
{_x spawn SAOKDELETE;} foreach _units;