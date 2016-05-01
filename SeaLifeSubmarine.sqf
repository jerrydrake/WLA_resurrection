private ["_units","_class","_Ppos","_start","_random","_classes","_cl","_group","_obj","_nul"];
sleep 3;
_units = [];
_class = ["O_diver_TL_F","O_diver_F","O_diver_exp_F"]; 
while {true} do {
sleep (random 200);
while {surfaceIsWater (getposATL player)} do {
while {count _units > 4} do {sleep 7; {if (_x distance player > 420) then {_units = _units - [_x];_x spawn SAOKDELETE;};} foreach _units;};
_Ppos = (getposATL player);
_start = [(_Ppos select 0) - 180 + random 360, (_Ppos select 1) - 180 + random 360, -10+(random 8)];
while {!surfaceIsWater _start || {_start distance player < 120}} do {sleep 0.1;_start = [(_Ppos select 0) - 180 + random 360, (_Ppos select 1) - 180 + random 360, -10+(random 9)];}; 
_random = round(random 4);
while {_random < 2} do {_random = round(random 4);};
_classes = [];
_cl = ["O_diver_TL_F","O_diver_F","O_diver_exp_F"];
while {_random > 0} do {_classes set [count _classes,_cl select (floor(random (count _cl)))];_random = _random - 1;};
_group = [_start, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
{_x setpos _start;} foreach units _group;
_group setbehaviour "SAFE";
_units append (units _group);

_obj = createVehicle ["O_SDV_01_F",_start, [], 0, "NONE"]; 
_obj setpos _start;
_obj setdir (random 360);

((units _group) select 0) moveindriver _obj;
((units _group) select 1) moveingunner _obj;
{_x moveincargo _obj;} foreach ((units _group) - [((units _group) select 0),((units _group) select 1)]);

((units _group) select 0) action ["PeriscopeDepthOn",_obj];
((units _group) select 0) action ["LightOn",_obj];
((units _group) select 0) action ["SearchLightOn",_obj];

_nul = [_group, _start] SPAWN {
while {count units (_this select 0) > 0} do {
_s = [((_this select 1) select 0) - 180 + random 360, ((_this select 1) select 1) - 180 + random 360, -30+(random 27)];
while {!surfaceIsWater _s} do {sleep 0.1;_start = [((_this select 1) select 0) - 180 + random 360, ((_this select 1) select 1) - 180 + random 360, -10+(random 9)];}; 
(_this select 0) move _s;
sleep 20 + (random 70);
};
};

_nul = [_obj] SPAWN {waitUntil {sleep 10; count crew (_this select 0) == 0}; CARS = CARS + [(_this select 0)];};

_nul = [_group] SPAWN {waitUntil {sleep 5; behaviour leader (_this select 0) == "COMBAT" || isNull (_this select 0) || vehicle leader (_this select 0) distance vehicle player < 30}; 
if (!isNull (_this select 0)) then {
_v = vehicle leader (_this select 0);
_v forcespeed 0;
sleep 4;
{_x action ["eject",vehicle _x];} foreach  (units (_this select 0));
(units (_this select 0)) ordergetin false; 
sleep 6;
_v forcespeed -1;
};
};

//Pgroups pushBack _group; "O_SDV_01_F"


};
{_x spawn SAOKDELETE;} foreach _units;
waitUntil {sleep 15; surfaceIsWater (getposATL player)};
};