private ["_wayPs"];
//MAXCARSSUP = 2;
//_wayPs = [["SupR",100],["SupR_1",110],["SupR_2",100],["SupR_3",90],["SupR_4",75],["SupR_5",45],["SupR_6",330],["SupR_7",180],["SupR_8",90],["SupR_9",180]];
//TaskSupply = 6;
while {true} do {
_wayPs = [["Zone11",0],["Zone6",0]];
if (getmarkercolor "Zone4" == "ColorBlue") then {_wayPs = _wayPs + ["Zone4",180];};
if (getmarkercolor "Zone3" == "ColorBlue") then {_wayPs = _wayPs + ["Zone3",180];};
waitUntil {sleep 10; {vehicle player distance getmarkerpos (_x select 0) < 900} count _wayPs > 0 && MAXCARSSUP > 0 && getmarkercolor "Zone6" == "ColorBlue"};

[] SPAWN {
private ["_wayPs","_start","_cl","_tr","_dir","_w"];
MAXCARSSUP = MAXCARSSUP - 1;
_wayPs = [["Zone11",0],["Zone6",0]];
if (getmarkercolor "Zone4" == "ColorBlue") then {_wayPs = _wayPs + ["Zone4",180];};
if (getmarkercolor "Zone3" == "ColorBlue") then {_wayPs = _wayPs + ["Zone3",180];};
_start = _wayPs call RETURNRANDOM;
_dir = _start select 1;
_start = _start select 0;
while {vehicle player distance getmarkerpos _start < 700} do {
_start = _wayPs call RETURNRANDOM;
_dir = _start select 1;
_start = _start select 0;
};
_end = "";
switch (_start) do {case "Zone11" : {_end = "Zone6";}; case "Zone6" : {
//_dir = _dir + 180; 
_end = "Zone11";};};
if (_end == "") then {
_end = ["Zone11","Zone6"] call RETURNRANDOM;
//if (_end == "SupR") then {_dir = _dir + 180;};
}; 
_cl = ["I_Truck_02_Repair_F","I_Truck_02_Refuel_F","I_Truck_02_Reammo_F"] call RETURNRANDOM;
_tr = [getmarkerpos  _start,1,_cl,WEST] call SPAWNVEHICLE;
(_tr select 0) setdir _dir;
(_tr select 0) lock true;
_w = (_tr select 2) addWaypoint [getmarkerpos _end, 0]; 
_aika = time + 360;
waituntil {sleep 15; ((_tr select 0) distance (getmarkerpos _end) < 30 || !(alive (_tr select 0)) || {alive _x} count crew (_tr select 0) == 0) || _aika < time};
//if ((_tr select 0) distance (getmarkerpos _end) > 30 && vehicle player distance (_tr select 0) < 700) then {};
waituntil {sleep 15; vehicle player distance (_tr select 0) > 700};
{_x spawn SAOKDELETE;} foreach units (_tr select 2) + [(_tr select 0)];
MAXCARSSUP = MAXCARSSUP + 1;
};

};

