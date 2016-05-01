private ["_dd","_dig","_sGun","_P","_Tents","_cUn","_normal","_firee","_u","_start","_obj","_objs","_forEachIndex","_d","_cUn2","_startS"];

_objs = [];
CAMPUNITS = [];

_P = {
private ["_dd","_pPos","_start"];
_dd = (["Lb"] CALL DIS);
_pPOs = getposATL (vehicle player);
_start = [(_pPOs select 0)+_dd-(random _dd)*2,(_pPOs select 1)+_dd-(random _dd)*2,0];
_start
};

_Tents = {
private ["_start","_CAMPOBJS","_xx","_yy","_obj"];
_start = _this;
_CAMPOBJS=[];
_xx = random 8;
_yy = 8 - _xx;
_tT = "Land_TentDome_F";
if (!isNil"IFENABLED") then {_tT = "Land_TentA_F";};
if (!isOnRoad  [(_start select 0) + _xx, (_start select 1) + _yy, 0]) then {
_obj = createVehicle [_tT,[(_start select 0) + _xx, (_start select 1) + _yy, 0], [], 0, "NONE"]; 
_obj setdir (random 360);
_obj setvectorup (surfaceNormal (getposATL _obj));
_CAMPOBJS pushBack _obj;
};
if (!isOnRoad  [(_start select 0) - _xx, (_start select 1) + _yy, 0]) then {
_obj = createVehicle [_tT,[(_start select 0) - _xx, (_start select 1) + _yy, 0], [], 0, "NONE"]; 
_obj setdir (random 360);
_obj setvectorup (surfaceNormal (getposATL _obj));
_CAMPOBJS pushBack _obj;
};
if (!isOnRoad  [(_start select 0) - _xx, (_start select 1) - _yy, 0]) then {
_obj = createVehicle [_tT,[(_start select 0) - _xx, (_start select 1) - _yy, 0], [], 0, "NONE"]; 
_obj setdir (random 360);
_obj setvectorup (surfaceNormal (getposATL _obj));
_CAMPOBJS pushBack _obj;
};
_CAMPOBJS
};

_sGun = {
private ["_xx2","_yy2","_yy","_xx","_start","_group","_rann","_obj","_di","_classes"];
_start = _this;
_rann = (["ST",2] CALL VEHARRAY) call RETURNRANDOM;
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
_classes = [FRIENDC1,FRIENDC2,FRIENDC4,FRIENDC4,FRIENDC4] call RETURNRANDOM;
_group = [ [(_start select 0) + 20 - (random 40),(_start select 1) + 20 - (random 40),0], WEST, [(_classes call RETURNRANDOM)],[],[],[0.4,0.8]] call SpawnGroupCustom;
_group setformdir _di;
leader _group moveingunner _obj;
[[leader _group], [_obj]]
};

_cUn = {
private ["_unts","_start","_group","_random","_ucc","_unitrate","_classes","_nul","_flare"];
_start = _this;
_unitrate = [3,4];
_unts = [];
_ucc = [FRIENDC1,FRIENDC2,FRIENDC4,FRIENDC4,FRIENDC4] call RETURNRANDOM;
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushBack (_ucc call RETURNRANDOM);};
_group = [_start, WEST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
if (!isNil"_group" && {count units _group > 0}) then {_unts append (units _group);_nul = [units _group] SPAWN AICampBehaviour;};
if ("B_Soldier_A_F" in _ucc) then {
{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;} foreach units _group;
};
{
_flare = ["UGL_FlareGreen_F","UGL_FlareWhite_F","UGL_FlareYellow_F"] call RETURNRANDOM;
if (typeof _x ==  "B_Soldier_GL_F" || {typeof _x ==  "B_Soldier_SL_F"}) then {_nul = [_x,"GL_3GL_F",_flare] SPAWN FUNKTIO_AIFLARE;};
} foreach units _group;
_unts
};

_cUn2 = {
private ["_start","_group","_random","_ucc","_unitrate","_classes","_nul","_flare","_range"];
_start = _this;
_range = 650;
_unitrate = [2,4];
_ucc = [FRIENDC1,FRIENDC2,FRIENDC4,FRIENDC4,FRIENDC4] call RETURNRANDOM;
_start = [(_start select 0) + _range - (random (_range*2)),(_start select 1) + _range - (random (_range*2)),0];
while {{vehicle _x distance _start < 400} count [player] > 0 || {surfaceIsWater _start} || {{_start distance _x < 400} count VarBlackListF > 0}} do {_start = [(_start select 0) + _range - (random (_range*2)),(_start select 1) + _range - (random (_range*2)),0];_range = _range + 20;};
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
for "_i" from 0 to _random do {_classes pushBack (_ucc call RETURNRANDOM);};
_group = [_start, WEST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
if ("B_Soldier_A_F" in _ucc) then {
{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;} foreach units _group;
};
[_group, _start, _range] call bis_fnc_taskPatrol;
{
_flare = ["UGL_FlareGreen_F","UGL_FlareWhite_F","UGL_FlareYellow_F"] call RETURNRANDOM;
if (typeof _x ==  "B_Soldier_GL_F" || {typeof _x ==  "B_Soldier_SL_F"}) then {_nul = [_x,"GL_3GL_F",_flare] SPAWN FUNKTIO_AIFLARE;};
} foreach units _group;
(units _group)
};

_dig = {
private ["_start","_xx2","_yy2","_obj","_di","_objs","_xx","_yy","_oPos"];
_start = _this;
_objs = [];
_di = 100;
_xx = 1;
_yy = 1;
if (random 1>0.1) then {
_xx2 = random 3.3;
_yy2 = 3.3 - _xx2;
if (random 1 > 0.5) then {_xx2 = -1*_xx2;};
if (random 1 > 0.5) then {_yy2 = -1*_yy2;};
if (isClass(configFile >> "cfgVehicles" >> "CraterLong_small")) then {
_obj = createVehicle ["CraterLong_small", [(_start select 0) -  (_xx*_xx2), (_start select 1) - (_yy*_yy2), 0], [], 0, "NONE"]; 
if (!isNil"_start" && {!isNil"_obj"} && {!isNull _obj}) then {
_di= [_start, getposATL _obj] call SAOKDIRT;
};
_obj setdir (_di);
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setpos [getposATL _obj select 0,getposATL _obj select 1,-0.4];
_objs pushBack _obj;
};
};
if (random 1>0.3) then {
_xx2 = random 4;
_yy2 = 4 - _xx2;
if (random 1 > 0.5) then {_xx2 = -1*_xx2;};
if (random 1 > 0.5) then {_yy2 = -1*_yy2;};
if (isClass(configFile >> "cfgVehicles" >> "CraterLong")) then {
_obj = createVehicle ["CraterLong", [(_start select 0) -  (_xx*_xx2), (_start select 1) - (_yy*_yy2), 0], [], 0, "NONE"]; 
if (!isNil"_start" && {!isNil"_obj"} && {!isNull _obj}) then {
_di= [_start, getposATL _obj] call SAOKDIRT;
};
_obj setdir _di;
_obj setvectorup (surfaceNormal (getposATL _obj));
_oPos = getposATL _obj;
_obj setpos [_oPos select 0,_oPos select 1,-0.4];
_objs pushBack _obj;
};
};
if (random 1>0.5) then {
_xx2 = random 6;
_yy2 = 6 - _xx2;
if (random 1 > 0.5) then {_xx2 = -1*_xx2;};
if (random 1 > 0.5) then {_yy2 = -1*_yy2;};
if (isClass(configFile >> "cfgVehicles" >> "CraterLong_small")) then {
_obj = createVehicle ["CraterLong_small",[(_start select 0) -  (_xx*_xx2), (_start select 1) - (_yy*_yy2), 0], [], 0, "NONE"]; 
if (!isNil"_start" && {!isNil"_obj"} && {!isNull _obj}) then {
_di= [_start, getposATL _obj] call SAOKDIRT;
};
_obj setdir (_di);
_obj setvectorup (surfaceNormal (getposATL _obj));
_oPos = getposATL _obj;
_obj setpos [_oPos select 0,_oPos select 1,-0.4];
_objs pushBack _obj;
};
};
if (random 1>0.6) then {
_xx2 = random 5;
_yy2 = 5 - _xx2;
if (random 1 > 0.5) then {_xx2 = -1*_xx2;};
if (random 1 > 0.5) then {_yy2 = -1*_yy2;};
if (isClass(configFile >> "cfgVehicles" >> "CraterLong_small")) then {
_obj = createVehicle ["CraterLong_small",[(_start select 0) -  (_xx*_xx2), (_start select 1) - (_yy*_yy2), 0], [], 0, "NONE"]; 
if (!isNil"_start" && {!isNil"_obj"} && {!isNull _obj}) then {
_di= [_start, getposATL _obj] call SAOKDIRT;
};
_obj setdir (_di);
_obj setvectorup (surfaceNormal (getposATL _obj));
_oPos = getposATL _obj;
_obj setpos [_oPos select 0,_oPos select 1,-0.4];
_objs pushBack _obj;
};
};
_objs
};

while {true} do {
sleep 1;
while {count CAMPUNITS >= VarReUnits || {{side _x ==  WEST} count allUnits > 45}} do {
//REMOVE UNNEEDED if ({side _x ==  WEST} count allUnits > 45) exitWith {};
_dd = (["Lc"] CALL DIS);
{if ({vehicle _x distance _x < _dd} count [player] == 0) then {_objs = _objs - [_x];_x spawn SAOKDELETE;};sleep 0.01;} foreach _objs; 
sleep 0.1;
{if (isnull _x) then {_objs = _objs - [_x];};sleep 0.01;} foreach _objs; 
sleep 0.1;
{_u = _x; if ({vehicle _x distance _u < _dd} count [player] == 0) then {CAMPUNITS = CAMPUNITS - [_x];_x spawn SAOKDELETE;};sleep 0.01;} foreach CAMPUNITS;
sleep 0.1; 
{if (isnull _x) then {CAMPUNITS = CAMPUNITS - [_x];};sleep 0.01;} foreach CAMPUNITS; 
sleep 0.1;
{if (isNil"_x") exitWith {_deAT = CAMPUNITS deleteAt _forEachIndex;};sleep 0.01;} foreach CAMPUNITS;
sleep 0.1;
{if (isNil"_x") exitWith {_deAT = _objs deleteAt _forEachIndex;};sleep 0.01;} foreach _objs;
sleep 10;
};
sleep 10;
//SEARCH GOOD PLACE
_start = [] CALL _P;
_normal = surfaceNormal _start; 
_startS = _start CALL SAOKATLTOASL;
while {{(vehicle _x) distance _start < 400} count [player] > 0 || {(isOnRoad _start)} || {(_normal select 2 < 0.98)} || {_start CALL IORW} || {_start distance ([_start] CALL NEARESTGUARDPOST) < 800} || {surfaceIsWater _start} || {[_startS,player] CALL FUNKTIO_LOSOBJ} || {{side _x == EAST} count (_start nearEntities [["Man"],400]) > 0}} do {
_start = [] CALL _P;
_normal = surfaceNormal _start; 
_startS = _start CALL SAOKATLTOASL;
sleep 5;
};
//player setpos _start;
//CREATE STUFF
if (random 1 < 0.9) then {
_firee = ["FirePlace_burning_F","Land_FirePlace_F","Land_Camping_Light_F"] call RETURNRANDOM;	
if (!isNil"IFENABLED") then {_firee = ["FirePlace_burning_F","Land_FirePlace_F"] call RETURNRANDOM;};	
_obj = createVehicle [_firee,_start, [], 0, "NONE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
_d = _start CALL _Tents;
_objs append _d;
if (random 1 < 0.3) then {
_d = _start CALL _sGun;
CAMPUNITS append (_d select 0);
_objs append (_d select 1);
};
_d = _start CALL _cUn;
CAMPUNITS append _d;
_d = _start CALL _dig;
_objs append _d;
} else {
_d = _start CALL _cUn2;
CAMPUNITS append _d;
};
};