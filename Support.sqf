private ["_start","_tank","_tg1","_tg1wp1","_price","_type","_roads","_nul"];
_price = _this select 0;
_type = _this select 1;
_tank = "";
switch (_type) do {
case "Rearm Truck": {
_tank = "B_Truck_01_ammo_F";
if (!isNil"IFENABLED") then {
_tank = "lib_opelblitz_ammo";
};
};
case "Fuel Truck": {
_tank = "B_Truck_01_fuel_F";
if (!isNil"IFENABLED") then {
_tank = "LIB_opelblitz_fuel";
};
};
case "Medical Truck": {
_tank = "B_Truck_01_medical_F";
if (!isNil"IFENABLED") then {
_tank = "LIB_opelblitz_ambulance";
};
};
case "Repair Truck": {
_tank = "B_Truck_01_Repair_F";
if (!isNil"IFENABLED") then {
_tank = "LIB_opelblitz_parm";
};
};
};

if (pisteet >= _price) then {
pisteet = pisteet - _price;
"Cash" SPAWN SAOKPLAYSOUND;
_nul = [-_price, "Support Call"] SPAWN PRESTIGECHANGE;

leader player sidechat ("Wolf to Base, we would need supplies. Any "+_type+" nearby? Over");
sleep 7;
[WEST,"HQ"] sidechat ("Roger that, Wolf. Enabling comms to nearby "+_type+"-Guard. Contact them via radio channel 5-1. Out");
"Radio3" SPAWN SAOKPLAYSOUND;


hint "You can call now the support via 5-1 channel";


_start = [(getposATL (vehicle player) select 0) + 500 - (random 1000),(getposATL (vehicle player) select 1) + 500 - (random 1000),0];
_roads = (_start nearRoads 450);
if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
while  {surfaceIsWater _start || {_start distance _x < 500} count VarBlackListF > 0} do {
sleep 1;
_start = [(getposATL (vehicle player) select 0) + 500 - (random 1000),(getposATL (vehicle player) select 1) + 500 - (random 1000),0];
_roads = (_start nearRoads 450);
if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
};

_tg1 = [_start, 0, _tank, WEST] call SPAWNVEHICLE;
_tg1wp1= (_tg1 select 2) addWaypoint [getposATL (_tg1 select 0), 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "CARELESS";
[(_tg1 select 2), 1] setWaypointType "SUPPORT";
(_tg1 select 2) allowfleeing 0;
CARS set [count CARS,(_tg1 select 0)];
(_tg1 select 0) setvariable ["REFUND",_type];
} else {
(format ["%1 more prestige value needed to call support", _price - pisteet])SPAWN HINTSAOK;
};