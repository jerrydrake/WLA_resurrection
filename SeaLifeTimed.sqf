private ["_units","_Ppos","_start","_ran","_animal","_Ppos","_HowL","_wanted"];
sleep 3;
_units = [];
_wanted = _this select 0;
_Ppos = _this select 1;
_HowL = _this select 2;
while {count _units < _wanted} do {


_start = [(_Ppos select 0) - 15 + random 30, (_Ppos select 1) - 15 + random 30, -10+(random 9)];
while {!surfaceIsWater _start} do {sleep 0.1;_start = [(_Ppos select 0) - 15 + random 30, (_Ppos select 1) - 15 + random 30, -10+(random 9)];}; 
_ran = ["Turtle_F","Turtle_F","Tuna_F","Mullet_F","Mackerel_F","Fish_Base_F","CatShark_F"] call RETURNRANDOM; 
// "BuoyBig","BuoySmall"
_animal = createAgent [_ran, _start, [], 0, "NONE"]; 
_animal setpos _start;
_animal setdir (random 360);
_units set [count _units,_animal];

};
sleep _HowL;
{_x spawn SAOKDELETE;} foreach _units;