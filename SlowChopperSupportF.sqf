private ["_chopg","_tim","_reveal","_driver","_infgroup","_nul","_xx","_yy","_wp"];
sleep (3+(random 7));
_chopg = _this select 0;
_tim = _this select 1;
_reveal = _this select 2;
_infgroup = _this select 3;
_driver = driver (vehicle (leader _chopg));
_driver setbehaviour "CARELESS";
{_x setCombatMode "YELLOW";} foreach units _chopg - [_driver];
if (_reveal == 1) then {
_nul = [_chopg,_infgroup] SPAWN {
private ["_s", "_unit", "_tar","_infgroup"];
_s = _this select 0;
_infgroup = _this select 1;
while {!isNull _s && {!(isNull leader _infgroup)} && {count units _s > 0}} do {
_tar = (leader _infgroup) nearTargets 600; 
{
_unit = _x;
{
_unit reveal [_x select 4, 4];
sleep 0.01;
} foreach _tar;
sleep 0.01;
} foreach units _s;
sleep 15;
};
};
};
while {_tim > 0 && {(alive vehicle leader _chopg)} && {alive (driver (vehicle leader _chopg))}} do {
_n = _chopg SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_xx = random (600);
_yy = 600 - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
if (random 1 < 0.5) then {_yy = _yy*(-1)};
if (!(isNull (leader _infgroup))) then {
_wp = _chopg addWaypoint [[(getposATL (leader _infgroup) select 0) + _xx,(getposATL (leader _infgroup) select 1) + _yy,0], 0]; 
_wp setWaypointSpeed "LIMITED";
} else {
_wp = _chopg addWaypoint [[(getposATL (vehicle (leader _chopg)) select 0) + _xx,(getposATL (vehicle (leader _chopg)) select 1) + _yy,0], 0];
_wp setWaypointSpeed "LIMITED"; 
};

//_wp setWaypointBehaviour "CARELESS";
sleep 20;
_tim = _tim - 20;
};
if (alive (driver (vehicle leader _chopg))) then {_nul = [_chopg, [1000,1000,0], 7] SPAWN FMoveAndDelete;} else {_nul = [_chopg] SPAWN FMoveAwayAndGetDeleted; CARS = CARS + [(vehicle leader _chopg)];};
