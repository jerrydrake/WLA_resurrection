private ["_car","_start","_end","_side","_dire","_t1","_way1","_wp1","_posC","_nul","_aika","_s","_e","_d1"];
_car = _this select 0;
_start = _this select 1;
_end = _this select 2;
_side = _this select 3;
_dire = _this select 4;
_t1 = [_start,1,_car,_side] call SPAWNVEHICLE;
_way1= (_t1 select 2) addWaypoint [_end, 0]; 
(_t1 select 0) setdir _dire;
if (count _this > 5) then {(_t1 select 2) setspeedmode (_this select 5)};
if (_side==civilian) then {(_t1 select 2) setbehaviour "CARELESS"; (_t1 select 2) allowfleeing 0;} else {(_t1 select 2) setbehaviour "SAFE";};
if (count _this > 6) then {(_t1 select 2) setbehaviour (_this select 6)};
CARS pushBack (_t1 select 0);
_posC = getposATL (_t1 select 0);
sleep 60;
_s = {
private ["_dd","_xx","_yy","_start","_roads"];
_dd = (["Lc"] CALL DIS);
_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
_roads = (_start nearRoads 450);
if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
_start
};
_e = {
private ["_dd","_xx","_yy","_end","_roads"];
_dd = (["Lc"] CALL DIS);
_end = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
_roads = (_end nearRoads 450);
if (count _roads > 0) then {_end = getposATL (_roads select 0);}; 
_end
};
_d1 = {
private ["_y"];
_y = _this select 0;
waituntil {sleep 5; {_y distance _x < 400} count [player] == 0}; 
deletevehicle _y;
};

//STUCK CHECK
if (_posC distance (_t1 select 0) < 3 && {{(_x in (_t1 select 0))} count [player] == 0} && {(count (crew (_t1 select 0)) > 0)}) then {
_start = [] CALL _s;
while {surfaceIsWater _start} do {
sleep 5;
_start = [] CALL _s;
};
(_t1 select 0) setpos _start;
_end = [] CALL _e;
while  {surfaceIsWater _end} do {
sleep 5;
_end = [] CALL _e;
};
_n = (_t1 select 2) SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp1= (_t1 select 2) addWaypoint [_end, 0]; 
[(_t1 select 2), 1] setWaypointBehaviour "CARELESS";
};
//////////


_aika = time + 300;
waitUntil {sleep 10;isNil"_t1" || {isNull (_t1 select 0)} || {((_t1 select 0) distance (_end)) < 50} || {!(alive leader (_t1 select 2))} || {{(vehicle _x == (_t1 select 0))} count [player] > 0} ||{!(alive (_t1 select 0))}|| {_aika < time} || {({(vehicle _x distance (_t1 select 0)) < 2200} count [player] == 0)}};
if (isNil"_t1" || {isNull (_t1 select 0)}) exitWith {};
if ({(vehicle _x == (_t1 select 0))} count [player] >0) exitWith {};
if (!(alive leader (_t1 select 2)) || {!(alive (_t1 select 0))}) exitWith {
{
_nul = [_x] SPAWN _d1;sleep 0.1;
} foreach (units (_t1 select 2));
};

while {!isNil"_t1" && {!isNull (_t1 select 0)} && {({vehicle _x distance (_t1 select 0) < 500} count [player] > 0)}} do {
if ({(vehicle _x == (_t1 select 0))} count [player] > 0) exitWith {};
_end = [] CALL _e;
while  {surfaceIsWater _end} do {
sleep 5;
_end = [] CALL _e;
};
_n = (_t1 select 2) SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp1= (_t1 select 2) addWaypoint [_end, 0]; 
waitUntil {sleep 10; isNil"_t1" || {isNull (_t1 select 0)} || {((_t1 select 0) distance (_end) < 50)} || {!(alive leader  (_t1 select 2))} || {{(vehicle _x == (_t1 select 0))} count [player] > 0} || {!(alive (_t1 select 0))}};
if (isNil"_t1" || {isNull (_t1 select 2)}) exitWith {};
if ({(vehicle _x == (_t1 select 0))} count [player] >0) exitWith {};
if (!(alive leader  (_t1 select 2)) || {!(alive (_t1 select 0))}) exitWith {
{
_nul = [_x] SPAWN _d1;sleep 0.1;
} foreach (units (_t1 select 2));
};
sleep 5;
};
if ({(vehicle _x == (_t1 select 0))} count [player] > 0) exitWith {};


if ({_x distance (_t1 select 0) < 500} count [player] == 0) then {
{unassignvehicle _x;[_x] ordergetin false;_x action ["GetOut",vehicle _x];sleep 0.1;} foreach units  (_t1 select 2);
{_x spawn SAOKDELETE;sleep 0.1;} foreach [(_t1 select 0)];
{_x spawn SAOKDELETE;sleep 0.1;} foreach (units (_t1 select 2));
};
