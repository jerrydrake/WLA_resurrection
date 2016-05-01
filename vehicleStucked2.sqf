private ["_dd","_veh","_way","_pos","_xx","_yy","_start","_pPos","_t"];
_veh = _this select 0;
_way = _this select 1;
_pos = + (getposATL _veh);
sleep 30;
_t = 0;
while {_pos distance (getposATL _veh) < 15 && {(vehicle player distance _veh > 400)} && {_t < 1}} do {
_t = _t + 1;
_dd = (["Lc"] CALL DIS);
_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
_roads = (_start nearRoads 450);
if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
_t2 = 0;
while  {!isNull _veh && {surfaceIsWater _start} && {_t2 < 5}} do {
sleep 5;
_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
_roads = (_start nearRoads 450);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};
_t2 = _t2 + 1; 
};
if (isNull _veh) exitWith {};
_veh setpos _start;
(group driver _veh) move _way; 
_pos = + (getposATL _veh);
sleep 30;
_pos = + (getposATL _veh);
};