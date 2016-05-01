_price = _this select 0;
_type = _this select 1;
_rate = 1;
switch (_type) do {
case "Massive": {_rate = 1;};
case "Medium": {_range = 0.6;};
case "Light": {_range = 0.3;};
};
if (pisteet >= _price) then {
pisteet = pisteet - _price;
_nul = [-_price, "Diversion Call"] SPAWN PRESTIGECHANGE;
leader player sidechat "Wolf to Green, we would need something to draw CSAT attention away. Over";
sleep 3;
[WEST,"HQ"] sidechat ("Roger that, Wolf. Diversion is commited in minute. Out");
sleep 20;
_posPl = getposATL vehicle player;
_vZ = [];
{if (!isNil{_x getvariable "VehG"}) then {_vZ = _vZ + [_x];};} foreach allGroups;

{
if (!isNil"_x" && {random 1 < _rate}) then { 
_x setvariable ["Diversion",1];
_n = _x SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp = _x addWaypoint [[(_posPl select 0) + 1700 - (random 3400),(_posPl select 1) + 1700 - (random 3400),0], 0]; 
};
} foreach  Pgroups + VehicleGroups + _vZ;
};