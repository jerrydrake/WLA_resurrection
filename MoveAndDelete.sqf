//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

private ["_group","_pos","_tim","_wp","_n","_typeOf","_car"];
_group = _this select 0;
_pos = _this select 1;
_tim =  _this select 2;
sleep _tim;
//thanks kju for example
if (!isNull _group) then {
_n = _group SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 1; scriptdone _n};
_wp = _group addWaypoint [_pos, 0];
_wp setWaypointSpeed "FULL";
};
waituntil {sleep 3; isNil"_group" || {(leader _group) distance _pos < 500}};
if (!isNil"_group") then {
{_x spawn SAOKDELETE;} foreach [vehicle (leader _group)] + (units _group);
if (!isNil{vehicle (leader _group) getvariable "REFUND"}) then {
_car = (vehicle (leader _group));
_typeOf = typeOf (vehicle (leader _group));
if ((_car getvariable "REFUND") in ["Mortar","Scorcher","Sandstorm"]) then {
_n = [(getposATL _car), "ColorBlue",[_typeOf],"b_art"] CALL AddVehicleZone;
} else {
if ((typeOf _car) isKindOf "Truck_F") then {
_n = [(getposATL _car), "ColorBlue",[_typeOf],"b_support"] CALL AddVehicleZone;
} else {
_n = [(getposATL _car), "ColorBlue",[_typeOf]] CALL AddVehicleZone;
};
};
};
};