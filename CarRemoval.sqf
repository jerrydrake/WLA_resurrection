//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
private ["_car","_dead","_counted","_nul","_ran","_obj","_pos","_dir","_Mm","_newAr","_forEachIndex","_ok","_id","_n","_typeOf","_class","_type"];
_car = _this select 0;
if ((typeOf _car) isKindOf "Car" && {([] CALL FPSGOOD)} && {isOnRoad getposATL _car} && {isNil{_car getvariable "OnRoad"}} && {count Allunits < 50} && {_car in CARS}) then {_nul = [_car] SPAWN FWreckOnRoad;};
CARS = CARS - [_car];
if (isnull _car) exitWith {};
_car setvariable ["dung",1];
sleep 60;
if ({alive _x} count crew _car > 0) exitWith {CARS pushBack _car;_car setvariable ["dung",nil];};
while {(vehicle player) distance _car < 400 && {!isnull _car}} do {
	sleep 5;
	if (isnull _car) exitWith {};
	if ({alive _x} count crew _car > 0) exitWith {CARS pushBack _car;_car setvariable ["dung",nil];};
};
if (isnull _car || {{alive _x} count crew _car > 0}) exitWith {_car setvariable ["dung",nil];};
if (!isNil{_car getvariable "VehID"}) then {
if (alive _car) then {
_ok = 0;
{
if (_car getvariable "VehID" == _x select 0) exitWith {
_Mm = 0;
if (!isNil{_car getvariable "MineTruck"}) then {_Mm = 1;};
_newAr = [_car getvariable "VehID",typeOf _car,getposATL _car, direction _car,fuel _car, damage _car, _Mm];
SaOkVehicleData set [_forEachIndex,_newAr];
_ok = 1;
};
sleep 0.01;
} foreach SaOkVehicleData;
if (_ok == 0) then {
_Mm = 0;
if (!isNil{_car getvariable "MineTruck"}) then {_Mm = 1;};
_newAr = [_car getvariable "VehID",typeOf _car,getposATL _car, direction _car,fuel _car, damage _car, _Mm];
SaOkVehicleData pushBack _newAr;
};
if (count SaOkVehicleData > 40) then {
_id = (SaOkVehicleData select 0) select 0;
{
if (!isNil{_x getvariable "VehID"}) then {
if (_id == _x getvariable "VehID") exitWith {_x setvariable ["VehID",nil];};
};
sleep 0.01;
} foreach vehicles; 
_deAT = SaOkVehicleData deleteAt 0;
};
} else {
{
if (_car getvariable "VehID" == _x select 0) exitWith {
_deAT = SaOkVehicleData deleteAt _forEachIndex;
};
sleep 0.01;
} foreach SaOkVehicleData;
};
};

if (!isNil{_car getvariable "REFUND"} && {alive _car} && {damage _car < 0.5}) then {
_typeOf = (_car getvariable "REFUND");
if (_typeOf in ["Mortar","Scorcher","Sandstorm"]) then {
_n = [(getposATL _car), "ColorBlue",[typeOf _car],"b_art"] CALL AddVehicleZone;
} else {
if ((typeOf _car) isKindOf "Truck_F") then {
_n = [(getposATL _car), "ColorBlue",[typeOf _car],"b_support"] CALL AddVehicleZone;
} else {
_n = [(getposATL _car), "ColorBlue",[typeOf _car]] CALL AddVehicleZone;
};
};
};
deletevehicle _car;


