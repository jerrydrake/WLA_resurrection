_cl = _this select 0;
if (_cl == "Random") then {
sleep 3;
_cl = ["Land_Wreck_BRDM2_F","Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_Car_F","Land_Wreck_Offroad2_F","Land_Wreck_Offroad_F","Land_Wreck_Truck_dropside_F","Land_Wreck_Truck_F"] call RETURNRANDOM;};

_pos = _this select 1;
_obj = createVehicle [_cl,getposATL _pos, [], 0, "NONE"];
_obj setvectorup (surfaceNormal (getposATL _obj));
//_obj setpos (getposATL _pos);
//if (_cl == "Land_Wreck_Commanche_F") then {player setpos getposATL _obj;};
if (count _this > 2) then {_obj setdir (_this select 2);} else {_obj setdir (random 360);};