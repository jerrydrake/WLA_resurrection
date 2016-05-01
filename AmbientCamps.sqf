private ["_dd","_cUnits","_Tents","_sGun","_CAMPOBJS","_units","_start","_normal2","_firee","_obj","_y","_forEachIndex","_d","_P","_patUnits"];


_P = {
private ["_pPos","_start","_dd"];
_pPOs = getposATL (vehicle player);
_dd = (["Lb"] CALL DIS);
_start = [(_pPOs select 0)+_dd-(random _dd)*2,(_pPOs select 1)+_dd-(random _dd)*2,0];
_start
};
//_start 
_Tents = {
private ["_start","_CAMPOBJS","_xx","_yy","_obj"];
_start = _this;
_CAMPOBJS=[];
_xx = random 6;
_yy = 6 - _xx;
if (!isOnRoad  [(_start select 0) + _xx, (_start select 1) + _yy, 0]) then {
_obj = createVehicle ["Land_TentA_F",[(_start select 0) + _xx, (_start select 1) + _yy, 0], [], 0, "NONE"]; 
_obj setdir (random 360);
_obj setvectorup (surfaceNormal (getposATL _obj));
_CAMPOBJS pushBack _obj;
};
if (!isOnRoad  [(_start select 0) - _xx, (_start select 1) + _yy, 0]) then {
_obj = createVehicle ["Land_TentA_F",[(_start select 0) - _xx, (_start select 1) + _yy, 0], [], 0, "NONE"]; 
_obj setdir (random 360);
_obj setvectorup (surfaceNormal (getposATL _obj));
_CAMPOBJS pushBack _obj;
};
if (!isOnRoad  [(_start select 0) - _xx, (_start select 1) - _yy, 0]) then {
_obj = createVehicle ["Land_TentA_F",[(_start select 0) - _xx, (_start select 1) - _yy, 0], [], 0, "NONE"]; 
_obj setdir (random 360);
_obj setvectorup (surfaceNormal (getposATL _obj));
_CAMPOBJS pushBack _obj;
};
_CAMPOBJS
};

_cUnits = {
private ["_start","_group","_random","_ucc","_unitrate","_classes","_nul","_flare"];
_start = _this;
_unitrate = [4,5];
_ucc = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushBack (_ucc call RETURNRANDOM);};
_group = [_start, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
_nul = [units _group] SPAWN AICampBehaviour;
CampGroups pushBack _group;
{
_flare = ["UGL_FlareRed_F"] call RETURNRANDOM;
if (typeof _x ==  "O_Soldier_GL_F" || {typeof _x ==  "O_Soldier_SL_F"}) then {_nul = [_x,"EGLM",_flare] SPAWN FUNKTIO_AIFLARE;};
} foreach units _group;
(units _group)
};

_sGun = {
private ["_xx2","_yy2","_yy","_xx","_start","_group","_rann","_obj","_di","_classes"];
_start = _this;
_rann = ((["ST",1] CALL VEHARRAY)-["O_static_AA_F"]) call RETURNRANDOM;
_xx2 =1.5 +  random 0.5;
_yy2 = 3 - _xx2;
_xx = 1;
_yy = 1;
if (random 1 > 0.5) then {_xx2 = -1*_xx2;};
if (random 1 > 0.5) then {_yy2 = -1*_yy2;};
_obj = createVehicle [_rann, [(_start select 0) - (_xx*_xx2), (_start select 1) - (_yy*_yy2), 0], [], 0, "NONE"]; 
_di = [_start, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
_obj setvectorup (surfaceNormal (getposATL _obj));
_classes = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_group = [ [(_start select 0) + 20 - (random 40),(_start select 1) + 20 - (random 40),0], EAST, [(_classes call RETURNRANDOM)],[],[],[0.4,0.8]] call SpawnGroupCustom;
_group setformdir _di;
leader _group moveingunner _obj;
[leader _group, _obj]
};


_patUnits =
{
private ["_start","_u","_range","_unitrate","_ucc","_random","_group","_rP","_classes"];
_start = _this;
_u = [];
_range = 650;
_unitrate = [3,5];
_ucc = [ENEMYC1,ENEMYC2] call RETURNRANDOM;
while {{_start distance (getmarkerpos _x) < (getmarkersize _x select 0)} count Bpositions > 0 || {{vehicle _x distance _start < 400} count [vehicle player] > 0} || {surfaceIsWater _start} || {{_start distance _x < 400} count VarBlackListE > 0}} do {_rP = [vehicle player] call RETURNRANDOM;_start = [(getposATL vehicle _rP select 0) + _range - (random (_range*2)),(getposATL vehicle _rP select 1) + _range - (random (_range*2)),0];};
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushBack (_ucc call RETURNRANDOM);};
_group = [_start, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
[_group, _start, _range] call bis_fnc_taskPatrol;
Pgroups pushBack _group;
(units _group)
};

_CAMPOBJS = [];
_units = [];
while {true} do {
sleep 1;

while {count _units >= VarReEnemies || {{side _x ==  EAST} count allUnits > 55}} do { 
//REMOVE UNNEEDED
_dd = (["Lc"] CALL DIS) + 100;
{_y = _x; if ({vehicle _x distance _y < _dd} count [vehicle player] == 0) then {_x spawn SAOKDELETE;_CAMPOBJS = _CAMPOBJS - [_x];};sleep 0.1;} foreach _CAMPOBJS; 
sleep 0.1;
{if (isnull _x) then {_CAMPOBJS = _CAMPOBJS - [_x];};sleep 0.1;} foreach _CAMPOBJS; 
sleep 0.1;
{_y = _x; if ({vehicle _x distance _y < _dd} count [vehicle player] == 0) then {_x spawn SAOKDELETE;_units = _units - [_x];};sleep 0.1;} foreach _units; 
sleep 0.1;
{if (isnull _x) then {_units = _units - [_x];};sleep 0.1;} foreach _units; 
sleep 0.1;
{if (isNil"_x") exitWith {_deAT = _CAMPOBJS deleteAt _forEachIndex;};sleep 0.1;} foreach _CAMPOBJS;
sleep 0.1;
{if (isNil"_x") exitWith {_deAT = _units deleteAt _forEachIndex;};sleep 0.1;} foreach _units;
sleep 10;
};
sleep 10;
//SEARCH PLACE
_start = [] CALL _P;
_normal2 = surfaceNormal _start; 
_startS = _start CALL SAOKATLTOASL;
while {{(vehicle _x) distance _start < 400} count [vehicle player] > 0 || {((locationposition (["ColorRed",_start] CALL NEARESTCAMP) distance _start) > (locationposition (["ColorBlue",_start] CALL NEARESTCAMP) distance _start))} || {(isOnRoad _start)} || {(_normal2 select 2 < 0.98)} || {_start CALL IORW} || {_start distance (getmarkerpos _x) < (getmarkersize _x select 0)} count Bpositions > 0  || {_start distance ([_start] CALL NEARESTGUARDPOST) < 800} || {surfaceIsWater _start} || {{[_startS,vehicle _x] CALL FUNKTIO_LOSOBJ} count [vehicle player] > 0} || {{side _x != EAST && {side _x != CIVILIAN}} count (_start nearEntities [["Man"],400]) > 0}} do {
_start = [] CALL _P;
_normal2 = surfaceNormal _start; 
_startS = _start CALL SAOKATLTOASL;
sleep 10;
};
//CREATE

_firee = ["FirePlace_burning_F","Land_FirePlace_F","Land_Camping_Light_F"] call RETURNRANDOM;
if (!isNil"IFENABLED") then {_firee = ["FirePlace_burning_F","Land_FirePlace_F"] call RETURNRANDOM;};	
_obj = createVehicle [_firee,_start, [], 0, "NONE"]; 
_CAMPOBJS pushBack _obj;
_obj setvectorup (surfaceNormal (getposATL _obj));
_d = [];
if (random 1 < 0.7) then {
_d = _start CALL _Tents;
} else {
_d = [(["FUR1","CAMP1","CAMP2","CAMP3","CAMP4","POST1","POST2","WALL1"] call RETURNRANDOM),_start,random 360] CALL CreateCusObjT;
};
_CAMPOBJS append _d;
//_CAMPOBJS = _CAMPOBJS + _d;
_d = _start CALL _cUnits;
//_units = _units + _d;
_units append _d;
if (random 1 < 0.3) then {
_d = _start CALL _sGun;
_units pushBack (_d select 0);
_CAMPOBJS pushBack (_d select 1);
};
};
