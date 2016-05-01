//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
private ["_f","_unit","_veh","_Vpos"];
_f = {
private ["_unit","_veh"];
_unit = (_this select 0);
_veh = (_this select 1);
waitUntil {sleep 1;isNull _unit || {vehicle _unit != _unit} || {getposATL _unit select 2 < 20}};
_unit allowdamage false;
waitUntil {sleep 1;isNull _unit || {vehicle _unit != _unit} || {getposATL _unit select 2 < 1}};
if (getposATL _unit select 2 > 1) then {
vehicle _unit disableCollisionWith _veh; 
};
sleep 2;
_unit allowdamage true;
};
_unit = _this select 0;
_veh = _this select 1;
removeBackpack _unit;
_unit addbackpack "B_Parachute";
_unit disableCollisionWith _veh; 
_unit allowdamage false;
sleep (random 5);
_Vpos = getposATL _veh;
_unit setpos [_Vpos select 0,_Vpos select 1,(_Vpos select 2)-12];
unassignvehicle _unit;
[_unit] ordergetin false;
sleep (1.5+(random 0.5));
_unit action ["OpenParachute",_unit];
[_unit, _veh] SPAWN _f;
sleep 6;
_unit allowdamage true;




