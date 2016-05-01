private ["_body","_OBJS","_xx","_yy","_start","_di"];
_body = _this select 0;
if (isNil"_body") exitWith {};
_body setvariable ["OnRoad",1];
_start = getposATL _body;
if (_start distance [0,0,0] < 200 || {vehicle player distance _body < 100}) exitWith {};
_OBJS = [];
//CREATE BARRIERS
//1
_xx = 3 + (random 3);
_yy = 3 + (random 3);
_picked = ["RoadBarrier_F","RoadBarrier_small_F","RoadCone_F","RoadCone_L_F"] call RETURNRANDOM;	
_obj = createVehicle [_picked,[(_start select 0) + _xx, (_start select 1) + _yy, 0], [], 0, "NONE"]; 
_di= [_start, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
//_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
//1

//1
_xx = 3 + (random 3);
_yy = 3 + (random 3);
_picked = ["RoadBarrier_F","RoadBarrier_small_F","RoadCone_F","RoadCone_L_F"] call RETURNRANDOM;	
_obj = createVehicle [_picked,[(_start select 0) + _xx, (_start select 1) - _yy*0.5, 0], [], 0, "NONE"]; 
_di= [_start, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
//_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
//1
_xx = 3 + (random 3);
_yy = 3 + (random 3);
_picked = ["RoadBarrier_F","RoadBarrier_small_F","RoadCone_F","RoadCone_L_F"] call RETURNRANDOM;	
_obj = createVehicle [_picked,[(_start select 0) - _xx, (_start select 1) + _yy*0.5, 0], [], 0, "NONE"]; 
_di= [_start, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
//_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
//1
_xx = 3 + (random 3);
_yy = 3 + (random 3);
_picked = ["RoadBarrier_F","RoadBarrier_small_F","RoadCone_F","RoadCone_L_F"] call RETURNRANDOM;	
_obj = createVehicle [_picked,[(_start select 0) - _xx*0.5, (_start select 1) + _yy*0.5, 0], [], 0, "NONE"]; 
_di= [_start, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
//_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
//2

//3
_xx = 3 + (random 3);
_yy = 3 + (random 3);
_picked = ["RoadBarrier_F","RoadBarrier_small_F","RoadCone_F","RoadCone_L_F"] call RETURNRANDOM;	
_obj = createVehicle [_picked,[(_start select 0) + _xx, (_start select 1) - _yy, 0], [], 0, "NONE"]; 
_di= [_start, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
//_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
//4
_xx = 3 + (random 3);
_yy = 3 + (random 3);
_picked = ["RoadBarrier_F","RoadBarrier_small_F","RoadCone_F","RoadCone_L_F"] call RETURNRANDOM;	
_obj = createVehicle [_picked,[(_start select 0) - _xx, (_start select 1) - _yy, 0], [], 0, "NONE"]; 
_di= [_start, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
//_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
sleep 200;
waitUntil {sleep 10; vehicle player distance _start > 750};
//REMOVE WHEN PLAYER FAR
{_x spawn SAOKDELETE;} foreach _OBJS;