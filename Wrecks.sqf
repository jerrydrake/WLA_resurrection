_wre = ["Land_Wreck_BRDM2_F","Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_Car_F","Land_Wreck_Commanche_F","Land_Wreck_Offroad2_F","Land_Wreck_Offroad_F","Land_Wreck_Traw2_F","Land_Wreck_Traw_F","Land_Wreck_Truck_dropside_F","Land_Wreck_Truck_F","TankWreck"];
_firep = [];
{
		_pos = getposATL player;
		_start = [_pos, 550,0,"(1 + houses) * (1 - sea)"] CALL SAOKSEEKPOS;
		_r = 600;
		while {isOnRoad _start} do {
		sleep 0.5;
		_start = [_pos, _r,0,"(1 + houses) * (1 - sea)"] CALL SAOKSEEKPOS;
		_r = _r + 100;
		};
		_obj = createVehicle [_x,_start, [], 0, "NONE"]; 
		_obj setvectorup (surfaceNormal (getposATL _obj));
		_firep pushback _obj;
} foreach _wre;


//Tent