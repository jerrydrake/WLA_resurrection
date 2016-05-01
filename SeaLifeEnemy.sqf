
private ["_units","_start","_random","_Ppos","_classes","_cl","_group","_nul","_class"];
sleep 3;
_units = [];
_class = ["O_diver_TL_F","O_diver_F","O_diver_exp_F"]; 
while {surfaceIsWater (getposATL player) || {vehicle player distance (_this select 0) < 500}} do {
while {count _units > 4} do {sleep 7; {if (_x distance player > 220) then {_units = _units - [_x];_x spawn SAOKDELETE;};} foreach _units;};
_Ppos = (getposATL player);
_start = [(_Ppos select 0) - 100 + random 200, (_Ppos select 1) - 100 + random 200, -10+(random 8)];
while {!surfaceIsWater _start || {[_start CALL SAOKATLTOASL,player] CALL FUNKTIO_LOSOBJ} || {_start distance player < 60}} do {sleep 0.1;_start = [(_Ppos select 0) - 100 + random 200, (_Ppos select 1) - 100 + random 200, -10+(random 9)];}; 
_random = round(random 4);
while {_random < 1} do {_random = round(random 3);};
_classes = [];
_cl = ["O_diver_TL_F","O_diver_F","O_diver_exp_F"];
while {_random > 0} do {_classes set [count _classes,_cl select (floor(random (count _cl)))];_random = _random - 1;};
_group = [_start, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
{_x setpos _start;} foreach units _group;
_nul = [_group, _start] SPAWN {
while {count units (_this select 0) > 0} do {
_s = [((_this select 1) select 0)  - 100 + random 200, ((_this select 1) select 1)  - 100 + random 200, -30+(random 27)];
while {!surfaceIsWater _s} do {sleep 0.1;_start = [((_this select 1) select 0)  - 100 + random 200, ((_this select 1) select 1)  - 100 + random 200, -10+(random 9)];}; 
(_this select 0) move _s;
sleep 20 + (random 70);
};
};
//Pgroups pushBack _group;
_units append (units _group);
sleep (random 200);
};
{_x spawn SAOKDELETE;} foreach _units;