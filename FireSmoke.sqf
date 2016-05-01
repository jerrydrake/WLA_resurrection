private ["_Flogic","_Slogic","_pos","_cond","_var","_wrecks","_class"];
_pos = _this select 0;
_cond = _this select 1;
_var = _this select 2;
_wrecks = ["Land_Tyres_F","Land_GarbageContainer_closed_F","Land_GarbageContainer_open_F","Land_Wreck_Van_F","Land_Wreck_Truck_dropside_F","Land_Wreck_Ural_F","Land_Wreck_UAZ_F","Land_Wreck_Offroad2_F","Land_Wreck_Offroad_F","Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_Truck_F","Land_Wreck_CarDismantled_F","Land_Wreck_Car_F","Land_Wreck_Skodovka_F"];
_class = "Land_Tyre_F";
if (isOnRoad _pos) then {_class = _wrecks call RETURNRANDOM;};
_Flogic = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];  
//_Slogic = createVehicle ["Land_Tyre_F", _pos, [], 0, "CAN_COLLIDE"];  

_Flogic setVariable ["Timeout",[_var,_cond]];
//_Slogic setVariable ["Timeout",[_var,_cond]];

_Flogic CALL BISfireS;
_Flogic CALL BISsmokeS;
_Flogic