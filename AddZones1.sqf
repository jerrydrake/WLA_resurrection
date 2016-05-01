//BOAT ZONES I_Boat_Armed_01_minigun_F
waitUntil {sleep 1; !isNil"StartMission"};
sleep 5;
_g = [];
_p = SAOKMAPSIZE*0.5;
{_g pushBack (locationposition _x);} foreach (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]);
_dat = (worldname CALL SAOKMAPDATA); 
_isWater = (_dat select 6);
if (isNil"IFENABLED" && {_isWater}) then {
[] SPAWN {
private ["_num","_star","_n","_nn"];
_num = 0;
_nn = 20;
if (DIFLEVEL < 1) then {_nn = 10;};
while {_num < _nn} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (surfaceIsWater _star) then {
if (random 1 < 0.7) then {
_n = [_star, "ColorRed",["O_Boat_Armed_01_hmg_F","O_Boat_Armed_01_hmg_F"],"o_naval"] CALL AddVehicleZone; _num = _num + 1;
} else {
_n = [_star, "ColorGreen",["I_Boat_Armed_01_minigun_F","I_Boat_Armed_01_minigun_F"],"n_naval"] CALL AddVehicleZone; _num = _num + 1;
};
};
sleep 1;
};
};
};
//CHOPPER ZONES "o_air"
[] SPAWN {
private ["_num","_star","_n"];
_num = 0;
if (DIFLEVEL < 1) exitWith {};
while {_num < 2} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
_n = [_star, "ColorRed",[(AIRARMCHOP select 1) call RETURNRANDOM],"o_air"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};

[] SPAWN {
private ["_num","_star","_n","_nn"];
_num = 0;
_nn = 3;
if (DIFLEVEL < 1) then {_nn = 1;};
while {_num < _nn} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
_n = [_star, "ColorRed",[(AIRFIGTHER select 1) call RETURNRANDOM],"o_plane"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};

//QQ ZONES "o_air"
_g SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 1} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (count _this > 0) then {
_star = _this call RETURNRANDOM; 
_star = [(_star select 0)+2000 - random 4000,(_star select 1)+2000 - random 4000,0];
};
if (!surfaceIsWater _star) then {
_n = ["N","AA",_star,1] CALL CVZ; _num = _num + 1;
};
sleep 1;
};
};

//TANK ZONES "o_air"
_g SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 1} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (count _this > 0) then {
_star = _this call RETURNRANDOM; 
_star = [(_star select 0)+2000 - random 4000,(_star select 1)+2000 - random 4000,0];
};
if (!surfaceIsWater _star) then {
_n = ["N","T",_star,2] CALL CVZ; _num = _num + 1;
};
sleep 1;
};
};

//VEH ZONES "o_air"
_g SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 1} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (count _this > 0) then {
_star = _this call RETURNRANDOM; 
_star = [(_star select 0)+2000 - random 4000,(_star select 1)+2000 - random 4000,0];
};
if (!surfaceIsWater _star) then {
_n = ["N","V",_star,2] CALL CVZ; _num = _num + 1;
};
sleep 1;
};
};

//Plane ZONES "o_air"
_g SPAWN {
private ["_num","_star","_n"];
_num = 0;
if (DIFLEVEL < 1) exitWith {};
while {_num < 1} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (count _this > 0) then {
_star = _this call RETURNRANDOM; 
_star = [(_star select 0)+2000 - random 4000,(_star select 1)+2000 - random 4000,0];
};
if (!surfaceIsWater _star) then {
_n = [_star, "ColorGreen",[(AIRARMCHOP select 2) call RETURNRANDOM],"n_plane"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};
if (isNil"IFENABLED") then {
//ART ZONES "o_art"
[] SPAWN {
private ["_num","_star","_n","_nn"];
_num = 0;
_nn = 3;
if (DIFLEVEL < 1) then {_nn = 1;};
while {_num < _nn} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
_n = [_star, "ColorRed",["O_MBT_02_arty_F"],"o_art"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};
};



//MORT ZONES
_g SPAWN {
private ["_num","_star","_n","_nn"];
_num = 0;
_nn = 8;
if (DIFLEVEL < 1) then {_nn = 3;};
while {_num < _nn} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
if (random 1 < 0.7) then {
_c = "O_Mortar_01_F";
if (!isNil"IFENABLED") then {_c = "LIB_GrWr34";};
_n = [_star, "ColorRed",[_c],"o_mortar"] CALL AddVehicleZone; _num = _num + 1;
} else {
if (count _this > 0) then {
_star = _this call RETURNRANDOM; 
_star = [(_star select 0)+500 - random 1000,(_star select 1)+500 - random 1000,0];
};
if (!surfaceIsWater _star) then {
_c = "I_Mortar_01_F";
if (!isNil"IFENABLED") then {_c = "LIB_BM37";};
_n = [_star, "ColorGreen",[_c],"n_mortar"] CALL AddVehicleZone; _num = _num + 1;
};
};
};
sleep 1;
};
};

if (isNil"IFENABLED") then {
//MEDICAL
_g SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 2} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (count _this > 0) then {
_star = _this call RETURNRANDOM; 
_star = [(_star select 0)+500 - random 1000,(_star select 1)+500 - random 1000,0];
};
if (!surfaceIsWater _star) then {
_n = [_star, "ColorGreen",["I_Truck_02_medical_F"],"n_med"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};
};

//SUPPORT
_g SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 1} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (count _this > 0) then {
_star = _this call RETURNRANDOM; 
_star = [(_star select 0)+500 - random 1000,(_star select 1)+500 - random 1000,0];
};
if (!surfaceIsWater _star) then {
_n = [_star, "ColorGreen",[(ARMEDSUPPORT select 2)call RETURNRANDOM,(ARMEDSUPPORT select 2)call RETURNRANDOM,(ARMEDSUPPORT select 2)call RETURNRANDOM],"n_support"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};

if (isNil"IFENABLED") then {
//MEDICAL
[] SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 7} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
_rC = ["O_Truck_03_medical_F","O_Truck_02_medical_F"] call RETURNRANDOM; 
_n = [_star, "ColorRed",[_rC],"o_med"] CALL AddVehicleZone; _num = _num + 1;
};
sleep 1;
};
};
};
//SUPPORT
[] SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 7} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
//_rC = ARMEDSUPPORT select 1;
["EAST","S",2,_star] SPAWN SAOKMOREVEHZONES;
//_n = [_star, "ColorRed",[_rC call RETURNRANDOM,_rC call RETURNRANDOM],"o_support"] CALL AddVehicleZone; 
_num = _num + 1;
};
sleep 1;
};
};

[] SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 2} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
//_rC = ARMEDSUPPORT select 1;
["EAST","O",1,_star] SPAWN SAOKMOREVEHZONES;
//_n = [_star, "ColorRed",[_rC call RETURNRANDOM,_rC call RETURNRANDOM],"o_support"] CALL AddVehicleZone; 
_num = _num + 1;
};
sleep 1;
};
};
[] SPAWN {
private ["_num","_star","_n"];
_num = 0;
while {_num < 2} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
//_rC = ARMEDSUPPORT select 1;
["EAST","R",1,_star] SPAWN SAOKMOREVEHZONES;
//_n = [_star, "ColorRed",[_rC call RETURNRANDOM,_rC call RETURNRANDOM],"o_support"] CALL AddVehicleZone; 
_num = _num + 1;
};
sleep 1;
};
};


//AA 
[] SPAWN {
private ["_num","_star","_n","_nn"];
_num = 0;
_nn = 6;
if (DIFLEVEL < 1) then {_nn = 3;};
while {_num < _nn} do {
_star = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
if (!surfaceIsWater _star) then {
_n = ["H","AA",_star,1] CALL CVZ; _num = _num + 1;
};
sleep 1;
};
};