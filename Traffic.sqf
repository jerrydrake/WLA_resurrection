//SHIP TRAFFIC

private ["_start","_dd","_roads","_end","_nul","_ran","_type","_classR","_diir","_num"];
if ((worldname CALL SAOKMAPDATA) select 6) then {
_nul = [] SPAWN {
private ["_carc","_ccarc","_diir","_start","_end","_ran","_nul","_r"];
_carc = ["C_Boat_Civil_01_F","C_Boat_Civil_01_F","C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F"];
_ccarc = count _carc;
MAXBOATS = 2;
//ENABLED
while {true} do {
	waitUntil {sleep 15; MAXBOATS > 0 && {count vehicles < 60}};
	_diir= random 360;
	_start = ATLTOASL ([(vehicle player),1700,1400] CALL SAOKSEARCHPOS);
	while  {!surfaceIsWater _start || {([_start,player] CALL FUNKTIO_LOSOBJ)}} do {
	sleep 20;
	_start = [(vehicle player),1700,1400] CALL SAOKSEARCHPOS;
	};	
	sleep 1;
	_end = [_start,2400,1000] CALL SAOKSEARCHPOS;
	_r = 2400;
	while  {!surfaceIsWater _end} do {
	sleep 1;
	_r = _r + 100;
	_end = [_start,_r,1000] CALL SAOKSEARCHPOS;
	};
	_ran = _carc select (floor(random _ccarc));	
	if (MAXBOATS > 0) then {_nul = [_ran,_start,_end,civilian,_diir] SPAWN F_ambientboat;MAXBOATS=MAXBOATS-1; };  
};
};
};
sleep (10+(random 10));	
while {true} do {
	waitUntil {sleep 5; !(surfaceIsWater getposATL player) && {([] CALL FPSGOOD)} && {count vehicles < 60}};
	_diir= random 360;
	_dd = (["V"] CALL DIS);
	_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_start nearRoads 450);
	if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
	while {surfaceIsWater _start || {{_start distance (getmarkerpos _x) < (getmarkersize _x select 0)} count Bpositions > 0} || {_start CALL IORW}} do {
	sleep 5;
	_dd = (["V"] CALL DIS);
	_start = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_start nearRoads 450);
	if (count _roads > 0) then {_start = getposATL (_roads select 0);}; 
	};	
	sleep 0.1;
	_end = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_end nearRoads 450);
	if (count _roads > 0) then {_end = getposATL (_roads select 0);};  
	while  {surfaceIsWater _end} do {
	sleep 5;
	_dd = (["V"] CALL DIS);
	_end = [(vehicle player),_dd] CALL SAOKSEARCHPOS;
	_roads = (_end nearRoads 450);
	if (count _roads > 0) then {_end = getposATL (_roads select 0);}; 
	};
	sleep 0.1;
	_num = floor(random 10);
	if (_num < 7) then {
	_ran = CIVVEH call RETURNRANDOM;		
	if ({count crew _x > 0 && {side driver _x == CIVILIAN} && {(getposATL _x) select 2 < 1}} count vehicles < 3 && {_start distance vehicle player > 250}) then {_nul = [_ran,_start,_end,civilian,_diir] SPAWN FUNKTIO_AmbientCarCIV;};   
	} else {
	//MILITARY 
	if (random 1 < 0.7 && {MAXCARS > 0} && {_start distance vehicle player > 250}) then {
	_ran = ((["VEH",1] CALL VEHARRAY)+(["SUP",1] CALL VEHARRAY)+(["SUP",2] CALL VEHARRAY)+(["CIV",2] CALL VEHARRAY)) call RETURNRANDOM;
	_type = 0;
	if (_ran in (["VEH",1] CALL VEHARRAY)) then {_type = 1;};
	if (_ran in (["SUP",1] CALL VEHARRAY)) then {_type = 2;};
	if (_ran in (["SUP",2] CALL VEHARRAY)) then {_type = 3;};
	if ((_type == 1 && {count VehicleGroups < (EVEHMAX + 1)} && {!([] CALL PlayerStill)}) || (_type == 0 && {count Pgroups < (VarPG + 1)})) then {
	_classR = [];
	for "_i" from 1 to 3 do {
	_classR pushBack (ENEMYC1 call RETURNRANDOM);
	};
	_nul = [_ran,_start,_end,EAST,_diir,_classR, _type] SPAWN FAmbientScoutCar; 
	};
	if (_type == 2 && {!([] CALL PlayerStill)} && {(locationposition (["ColorRed",_start] CALL NEARESTCAMP) distance _start < 4000)} && {(locationposition (["ColorRed",_start] CALL NEARESTCAMP) distance vehicle player > 400)} && {{count crew _x > 0 && {side driver _x == CIVILIAN} && {(getposATL _x) select 2 < 1}} count vehicles < 3}) then {
	[_ran,_start,_end] SPAWN {
	private ["_start","_cl","_tr","_dir","_w","_end","_nul","_aika"];
	_cl = _this select 0;
	_start = _this select 1;
	_end = _this select 2;
	if (random 1 < 0.4) then {
	if (random 1 < 0.5 && {vehicle player distance (locationposition (["ColorRed"] CALL NEARESTCAMP)) > 450}) then {_start = locationposition (["ColorRed"] CALL NEARESTCAMP);} else {_end = locationposition (["ColorRed"] CALL NEARESTCAMP);};
	};
	_dir = random 360;
	_tr = [_start,1,_cl,EAST] call SPAWNVEHICLE;
	(_tr select 0) setdir _dir;
	(_tr select 0) lock true;
	_w = (_tr select 2) addWaypoint [_end, 0]; 
	_aika = time + 660;
	waituntil {sleep 15; ((_tr select 0) distance _end < 30 || {!(alive (_tr select 0))} || {{alive _x} count crew (_tr select 0) == 0}) || {_aika < time} || {vehicle player distance (_tr select 0) > 3000}};
	if ((_tr select 0) distance _end > 30 && (!(alive (_tr select 0)) || {{alive _x} count crew (_tr select 0) == 0}) && {vehicle player distance (_tr select 0) < 700}) then {
	pisteet = pisteet + 150;
	_nul = [150, "Destroyed Enemy Supply Truck"] SPAWN PRESTIGECHANGE;
	};
	waituntil {sleep 15; vehicle player distance (_tr select 0) > 900};
	{_x spawn SAOKDELETE;} foreach units (_tr select 2) + [(_tr select 0)];
	};
	};
	if (_type == 3 && {getmarkerpos ([] CALL NEARESTFACTORY) distance player < 6000} && {[(getmarkerpos ([] CALL NEARESTFACTORY))] CALL SAOKNEARVILRELA == "Friendly"} && {{count crew _x > 0 && {side driver _x == CIVILIAN} && {(getposATL _x) select 2 < 1}} count vehicles < 3}) then {
	[_ran,_start,_end] SPAWN {
	private ["_start","_cl","_tr","_dir","_w","_end","_aika"];
	_cl = _this select 0;
	_start = _this select 1;
	_end = _this select 2;
	if (random 1 < 0.8) then {
	if (random 1 < 0.5 && {getmarkerpos ([] CALL NEARESTFACTORY) distance player > 450}) then {_start = getmarkerpos ([] CALL NEARESTFACTORY);} else {_end = getmarkerpos ([] CALL NEARESTFACTORY);};
	};
	_dir = random 360;
	_tr = [_start,1,_cl,WEST] call SPAWNVEHICLE;
	(_tr select 0) setdir _dir;
	(_tr select 0) lock true;
	_w = (_tr select 2) addWaypoint [_end, 0]; 
	_aika = time + 660;
	waituntil {sleep 15; ((_tr select 0) distance _end < 30 || {!(alive (_tr select 0))} || {{alive _x} count crew (_tr select 0) == 0}) || {_aika < time}};
	
	waituntil {sleep 15; vehicle player distance (_tr select 0) > 900};
	{_x spawn SAOKDELETE;} foreach units (_tr select 2) + [(_tr select 0)];
	};
	
	};
	};
	};
sleep (10+(random 20));	
};			

//[[2754.31,5282.63,0],10,[4402.38,6362.95,0],[5274.75,8624.66,0],270]

