private ["_fff","_dd","_atLeastOnce","_ambpos","_diir","_xx","_yy","_start","_end","_class","_tank","_posPl","_st","_wp","_Ppos","_timePassed","_maxPatrol","_nul","_ran","_roads","_inf"];
if (!isNil"OnlyOnce") exitWith {};
OnlyOnce=true;
_fff = {
private ["_start","_posPl"];
_start = _this select 0;
_isWpos = [_start, 1800, 900] CALL SAOKSEARCHPOS;
_posPl = _this select 1;
_tank = ["O_MRAP_02_F"];
if (count Pgroups < (VarPG + 1)  && {!([] CALL PlayerStill)}) then {
_tank =(["C",1] CALL VEHARRAY);
_tank = _tank call RETURNRANDOM;	
_oC = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM; 
_inf = [_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM];
_params = [_start, _posPl, _posPl, EAST, 90, _tank,_inf,[0.6,0.7],0];
if (surfaceiswater _isWpos) then {
_tank = ["O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F"] call RETURNRANDOM; 
_LZ = [_isWpos,_posPl] CALL SAOKSEEKSHORE;  
_isWpos = _isWpos CALL SAOKCORRECTSEASTART;
_params = [_isWpos, _LZ, _posPl, EAST, 90, _tank,_inf,[0.6,0.7],0,""];
};
_nul = _params SPAWN FUNKTIO_LandTransport;
};
if (random 1 < 0.1 && {!([] CALL PlayerStill)} && {count Pgroups < VarPG} && {(locationposition (["ColorRed",(vehicle player)] CALL NEARESTCAMP) distance (vehicle player) < 4000)} && {!(_start CALL NotBlackListed)}) then {
sleep 10;
if (_start distance ([_start] CALL NEARESTGUARDPOST) > 800) then {
_tank = (["C",1] CALL VEHARRAY);
_tank = _tank call RETURNRANDOM;	
_oC = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM; 
_inf = [_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM];
_params = [_start, _posPl, _posPl, EAST, 90, _tank,_inf,[0.6,0.7],0];
if (surfaceiswater _isWpos) then {
_tank = ["O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F"] call RETURNRANDOM; 
_LZ = [_isWpos,_posPl] CALL SAOKSEEKSHORE;  
_isWpos = _isWpos CALL SAOKCORRECTSEASTART;
_params = [_isWpos, _LZ, _posPl, EAST, 90, _tank,_inf,[0.6,0.7],0,""];
};
_nul = _params SPAWN FUNKTIO_LandTransport;
};
};
if (random 1 < 0.1 && {!([] CALL PlayerStill)} && {count Pgroups < VarPG} && {(locationposition (["ColorRed",(vehicle player)] CALL NEARESTCAMP) distance (vehicle player) < 4000)} && {!(_start CALL NotBlackListed)}) then {
sleep 10;
if (_start distance ([_start] CALL NEARESTGUARDPOST) > 800) then {
_tank = _tank call RETURNRANDOM;	
_oC = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM; 
_inf = [_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM];
_params = [_start, _posPl, _posPl, EAST, 90, _tank,_inf,[0.6,0.7],0];
if (surfaceiswater _isWpos) then {
_tank = ["O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F"] call RETURNRANDOM; 
_LZ = [_isWpos,_posPl] CALL SAOKSEEKSHORE; 
_isWpos = _isWpos CALL SAOKCORRECTSEASTART; 
_params = [_isWpos, _LZ, _posPl, EAST, 90, _tank,_inf,[0.6,0.7],0,""];
};
_nul = _params SPAWN FUNKTIO_LandTransport;
};

};
};

//INIT
Pgroups = [];
VarAlarm = false;
waitUntil {sleep 2; !isNil"StartMission"};

sleep 45;
_nul = [1] SPAWN MusicT;
while {true} do {
_maxPatrol = 0;
_timePassed = time  + 40 + (random 40);
waitUntil {sleep 5; !(surfaceIsWater getposATL player)};
//PATROLS
_atLeastOnce = 1;
while {captive player || {{side _x == EAST && {_x knowsabout vehicle player > 0.1}} count allGroups == 0} || {_atLeastOnce > 0}} do {
if (_timePassed < time && {_maxPatrol > 0}) then {_timePassed = time + 40 + (random 40);_maxPatrol = _maxPatrol - 1;};
_atLeastOnce = _atLeastOnce - 1;
if (!isNil"debugi") then {hint "State - Patrol";};
_Ppos = getposATL (vehicle player);
_dd = (["Lb"] CALL DIS);
_ambpos = [(_Ppos select 0) + _dd - (random _dd)*2,(_Ppos select 1) + _dd - (random _dd)*2,0];
while {surfaceIsWater _ambpos} do {
waitUntil {sleep 5; !(surfaceIsWater getposATL player)};
sleep 1; 
_Ppos = getposATL (vehicle player);
_ambpos = [(_Ppos select 0) + _dd - (random _dd)*2,(_Ppos select 1) + _dd - (random _dd)*2,0];};
if ((locationposition (["ColorRed",_ambpos] CALL NEARESTCAMP) distance _ambpos < 6000)) then {
if (count Pgroups < VarPG && {_maxPatrol < 4*DIFLEVEL}) then {_nul = [_ambpos,1100,VarPGSize] SPAWN FUNKTIO_AmbientPatrol; _maxPatrol = _maxPatrol + 1;};
};
VarAlarm = false;
waitUntil {sleep 5; !(surfaceIsWater getposATL player)};
if (random 1 < 0.1) then {
if (random 1 < 0.2 && {locationposition (["ColorRed",(vehicle player)] CALL NEARESTCAMP) distance (vehicle player) < 4000}) then {
	_diir= random 360;
	_dd = (["A"] CALL DIS);
	_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_start nearRoads 450);
	if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
	while {surfaceIsWater _start || {!(_start CALL NotBlackListed)}} do {
	sleep 3;
	_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_start nearRoads 450);
	if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
	};	
	sleep 0.1;
	_end = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_end nearRoads 450);
	if (count _roads > 0) then {_end = getposATL (_roads select 0);};  
	while  {surfaceIsWater _end} do {
	sleep 0.5;
	_end = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_end nearRoads 450);
	if (count _roads > 0) then {_end = getposATL (_roads select 0);}; 
	};
	_bol = _start distance ([_start] CALL NEARESTGUARDPOST) > 800;
	if (count Pgroups < VarPG && {!([] CALL PlayerStill)} && {MAXCARS > 0} && {_bol}) then {
	_ran = (["C",1] CALL VEHARRAY) call RETURNRANDOM;	
	_oC = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM; 
	_inf = [_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM];
	_class = [[_ran,_inf]];
	_class = _class call RETURNRANDOM;
	_nul = [_class select 0,_start,_end,EAST,_diir,_class select 1, 0] SPAWN AmbientScoutCar;
	};
	if (random 1 < 0.1*DIFLEVEL && {!([] CALL PlayerStill)} && {count Pgroups < VarPG} && {MAXCARS > 0} && {_bol}) then {
	sleep 1;
	_ran = (["C",1] CALL VEHARRAY) call RETURNRANDOM;	
	_oC = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM; 
	_inf = [_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM];
	_class = [[_ran,_inf]];
	_class = _class call RETURNRANDOM;
	_nul = [_class select 0,_start,_end,EAST,_diir,_class select 1, 0] SPAWN AmbientScoutCar;
	};
	if (random 1 < 0.1*DIFLEVEL && {!([] CALL PlayerStill)} && {count VehicleGroups < EVEHMAX} && {MAXCARS > 0} && {_bol}) then {
	sleep 1;
	_class = (ARMEDVEHICLES select 1) call RETURNRANDOM;	
	_nul = [_class,_start,_end,EAST,_diir,[], 1] SPAWN AmbientScoutCar;
	};
} else {
	_diir= random 360;
	_dd = (["A"] CALL DIS);
	_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_start nearRoads 450);
	if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
	while  {surfaceIsWater _start || {!(_start CALL NotBlackListed)} || {_start distance vehicle player < 600}} do {
	sleep 3;
	_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_start nearRoads 450);
	if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
	};	
	sleep 0.1;
	_end = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_end nearRoads 450);
	if (count _roads > 0) then {_end = getposATL (_roads select 0);};  
	while  {surfaceIsWater _end} do {
	sleep 0.5;
	_end = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_end nearRoads 450);
	if (count _roads > 0) then {_end = getposATL (_roads select 0);}; 
	};
	sleep 0.1;
	_bol = (locationposition (["ColorRed",_start] CALL NEARESTCAMP) distance _start < 4000);
	_bol2 = _start distance ([_start] CALL NEARESTGUARDPOST) > 800;
	sleep 0.1;
	if (count VehicleGroups < EVEHMAX && {!([] CALL PlayerStill)} && {MAXCARS > 0} && {_bol} && {_bol2}) then {
	_class = (ARMEDVEHICLES select 1) call RETURNRANDOM;	
	_nul = [_class,_start,_end,EAST,_diir,[], 1] SPAWN AmbientScoutCar;
	};
	sleep 0.1;
	if (random 1 < 0.1*DIFLEVEL && {!([] CALL PlayerStill)} && {count VehicleGroups < EVEHMAX} && {MAXCARS > 0} && {_bol} && {_bol2}) then {
	sleep 5;
	_class = (ARMEDVEHICLES select 1) call RETURNRANDOM;	
	_nul = [_class,_start,_end,EAST,_diir,[], 1] SPAWN AmbientScoutCar;
	};
	if (random 1 < 0.05*DIFLEVEL && {!([] CALL PlayerStill)} && {count VehicleGroups < EVEHMAX} && {MAXCARS > 0} && {_bol} && {_bol2}) then {
	sleep 5;
	_class = (ARMEDVEHICLES select 1) call RETURNRANDOM;	
	_nul = [_class,_start,_end,EAST,_diir,[], 1] SPAWN AmbientScoutCar;
	};
	if (random 1 < 0.05*DIFLEVEL && {!([] CALL PlayerStill)} && {count VehicleGroups < EVEHMAX} && {MAXCARS > 0} && {_bol} && {_bol2}) then {
	sleep 5;
	_class = (ARMEDVEHICLES select 1) call RETURNRANDOM;		
	_nul = [_class,_start,_end,EAST,_diir,[], 1] SPAWN AmbientScoutCar;
	};
};
}; 
sleep 1;
while {count Pgroups >= VarPG && {{side _x == EAST && _x knowsabout vehicle player > 0.1} count allGroups == 0}} do {sleep (20/DIFLEVEL);};
};
//FAST REINFORCEMENTS
_nul = [2] SPAWN MusicT;
if (!isNil"debugi") then {hint "State - Fast Reinf";};
VarAlarm = true;

{if (behaviour leader _x != "COMBAT") then {_x setbehaviour "AWARE";};sleep 0.1;} foreach Pgroups;
_posPl=getposATL vehicle player;
{
_n = _x SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp = _x addWaypoint [[(_posPl select 0) + 300 - (random 600),(_posPl select 1) + 300 - (random 600),0], 0]; 
sleep 0.1;
} foreach Pgroups;
if (VARCoLoop) then {_nul = [] SPAWN FUNKTIO_CL;};



if (random 1 < 0.3 && {isNil"IFENABLED"}) then {

if (VarTRChop && {!([] CALL PlayerStill)} && VarRes > 0.3 && {count Pgroups < (VarPG + 1)} && {!(SurfaceIsWater getposATL player)} && {(vehicle player) distance [1036.67,7113.46,50] > 500} && {(locationposition (["ColorRed",(vehicle player)] CALL NEARESTCAMP) distance (vehicle player) < 6000)}) then {
//["O_Ka60_Unarmed_F"]
_tank = (["AIRC",1] CALL VEHARRAY); 
_tank = _tank call RETURNRANDOM;	
_oC = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM; 
_inf = [_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM];
_Ppos = getposATL (vehicle player);
_nul = [[1036.67,7113.46,50], [(_Ppos select 0)+500-(random 1000),(_Ppos select 1)+500-(random 1000),0], [(_Ppos select 0)+(500-(random 1000))*0.5,(_Ppos select 1)+(500-(random 1000))*0.5,0], EAST, 290, _tank, 50,_inf,[0.6,0.7],0] SPAWN FUNKTIO_ChopperTransport;
if (random 1 < 0.1*DIFLEVEL && {!([] CALL PlayerStill)} && {count Pgroups < VarPG} && {(locationposition (["ColorRed",(vehicle player)] CALL NEARESTCAMP) distance (vehicle player) < 6000)}) then {
sleep 1;
_tank = (["AIRC",1] CALL VEHARRAY); 
_tank = _tank call RETURNRANDOM;	
_oC = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM; 
_inf = [_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM];
_nul = [[1046.67,7103.46,50], [(_Ppos select 0)+500-(random 1000),(_Ppos select 1)+500-(random 1000),0], [(_Ppos select 0)+(500-(random 1000))*0.5,(_Ppos select 1)+(500-(random 1000))*0.5,0], EAST, 290, _tank, 50,_inf,[0.6,0.7],0] SPAWN FUNKTIO_ChopperTransport;
};
if (random 1 < 0.1*DIFLEVEL && {!([] CALL PlayerStill)} && {count Pgroups < VarPG} && {(locationposition (["ColorRed",(vehicle player)] CALL NEARESTCAMP) distance (vehicle player) < 6000)}) then {
sleep 1;
_tank = (["AIRC",1] CALL VEHARRAY); 
_tank = _tank call RETURNRANDOM;	
_oC = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM; 
_inf = [_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM,_oC call RETURNRANDOM];
_nul = [[1056.67,7123.46,50], [(_Ppos select 0)+500-(random 1000),(_Ppos select 1)+500-(random 1000),0], [(_Ppos select 0)+(500-(random 1000))*0.5,(_Ppos select 1)+(500-(random 1000))*0.5,0], EAST, 290, _tank, 50,_inf,[0.6,0.7],0] SPAWN FUNKTIO_ChopperTransport;
};
};

} else {
sleep (20+(random 20));
if (!(SurfaceIsWater getposATL player)) then { 
_dd = (["A"] CALL DIS);
_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
_roads = (_start nearRoads 450);
if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
while {surfaceIsWater _start || {!(_start CALL NotBlackListed)} || {_start distance vehicle player < 600}} do {
sleep 3;
_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
_roads = (_start nearRoads 450);
if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
};
_nul = [_start,_posPl] SPAWN _fff;
};
};

sleep (110 + (random 70));
//SLOW REINFORCEMENTS
_nul = [3] SPAWN MusicT;
if (!(surfaceIsWater getposATL player)) then {
if (!isNil"debugi") then {hint "State - Slow Reinf";};

if !([] CALL SAOKREINFCUT) then {
if (locationposition(["ColorBlue",_posPl] CALL NEARESTCAMP) distance _posPl > locationposition(["ColorRed",_posPl] CALL NEARESTCAMP) distance _posPl) then {
_nul = [_posPl] SPAWN EnemySupport;
};
};
_nul = [] SPAWN FriendlySupport;

if (random 1 < 0.1*DIFLEVEL && {!([] CALL SAOKREINFCUT)}) then {_nul = [_posPl] SPAWN EnemySupport;};
if (random 1 < 0.1) then {_nul = [] SPAWN FriendlySupport;};
};
sleep 400;
//ALIVE GROUPS TO PATROL
_gps = + Pgroups;
_c = count _gps - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _gps select _i;
if (!isNil"_xx" && {isNil{_xx getvariable "Diversion"}}) then { 
_n = _xx SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
[_xx, [(_posPl select 0) + 1100 -(random 2200),(_posPl select 1) + 1100 -(random 2200),0],600] call bis_fnc_taskPatrol;
};
sleep 0.1;
};



_nul = [1] SPAWN MusicT;
};