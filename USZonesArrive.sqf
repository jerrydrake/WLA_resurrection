//_nul = [] execVM "USZonesArrive.sqf";
//BOATS
_dat = (worldname CALL SAOKMAPDATA); 
_isWater = (_dat select 6);
if (_isWater) then {
[] SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 6} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (surfaceIsWater _star) then {
_n = [_star, "ColorBlue",["B_Boat_Armed_01_minigun_F","B_Boat_Armed_01_minigun_F"],"b_naval"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};
};
//CHOPPER ZONES "o_air"
[] SPAWN {
private ["_num","_star"];
_num = 0;
while {_num < 2} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
_n = [_star, "ColorBlue",["B_Heli_Attack_01_F"],"b_air"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};

//VEHICLE ZONES
[] SPAWN {
private ["_num","_star"];
_classs = ARMEDVEHICLES select 0;
_num = 0;
while {_num < 4} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star && {{getmarkerpos _x distance _star < 3000} count PierMarkers > 0}) then {
_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
_n = [_star, "ColorBlue",_classs,"n_armor"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};

//PLANE ZONES "o_air"
[] SPAWN {
private ["_num","_star"];
_num = 0;
while {_num < 2} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
_n = [_star, "ColorBlue",["B_Plane_CAS_01_F"],"b_plane"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};
