private ["_Ppos","_ran","_HowL","_wanted","_ARE","_ti"];
_wanted = _this select 0;
_Ppos = _this select 1;
_ARE = _this select 2;
_HowL = _this select 3;
_ran = _this select 4;
_ti = if (count _this > 5) then {_this select 5} else {0.1};
while {_wanted > 0} do {
_wanted = _wanted - 1;
[_ti,_HowL,_ran,_ARE,_Ppos] SPAWN {
private ["_ran","_ARE","_Ppos","_units","_start"];
_ran = _this select 2;
_ARE = _this select 3;
_Ppos = _this select 4;
_units = [];
sleep (random (_this select 0));
_start = [(_Ppos select 0) - (_ARE*0.5)  + random _ARE, (_Ppos select 1) - (_ARE*0.5) + random _ARE, 0];
while {surfaceIsWater _start} do {sleep 0.1;_start = [(_Ppos select 0) - (_ARE*0.5)  + random _ARE, (_Ppos select 1) - (_ARE*0.5) + random _ARE, 0];}; 
_animal = createAgent [_ran, _start, [], 0, "NONE"]; 
_animal setpos _start;
_animal setdir (random 360);
_units set [count _units,_animal];
sleep (_this select 1);
{_x spawn SAOKDELETE;} foreach _units;
};
};


