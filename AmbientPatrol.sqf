private ["_poNeCa","_pRP","_center","_range","_unitrate","_start","_group","_random","_cl","_rP","_nul","_ran","_num","_flare","_classes","_n","_startD","_roads","_tank","_inf","_st"];
_center = _this select 0;
_range = _this select 1;
_unitrate = _this select 2;
_start = + _center;
if ([] CALL PlayerStill || {!([] CALL FPSGOOD)}) exitWith {};
if ({side _x == EAST} count allUnits > 60) exitWith {};
if ((player CALL SAOKNEARVILRELA) in ["Angry","Hostile"] && {{([getposATL player] CALL SAOKNEARVILP) distance _x < 300} count [vehicle player] > 0}) then {
_rP = [vehicle player] call RETURNRANDOM;
_nul = [EAST,ENEMYC3,([2,3,4] call RETURNRANDOM),getposATL _rP, 80,{
_rP = [vehicle player] call RETURNRANDOM;
//_this addWaypoint [getposATL _rP, 0]; 
_Lna = (getposATL _rP) CALL NEARESTLOCATIONNAME;
_header = format ["Furious Villagers Arming Themselves Against NATO in %1",_Lna];
[_header, date] CALL SAOKEVENTLOG;
//[_this, 1] setWaypointType "GUARD"; 
_nul = [units _this] SPAWN AICampBehaviour;
{_c = [_x] SPAWN ConvertToArmedCivilianL;sleep 0.1;} foreach units _this;
}] SPAWN InfFromHouse;
} else {

while {{vehicle _x distance _start < 600} count [vehicle player] > 0 || {_start distance (locationposition (["ColorBlue",_start] CALL NEARESTCAMP)) < 1500} || {surfaceIsWater _start} || {{_start distance _x < 400} count VarBlackListE > 0 }} do {
sleep 5;
_rP = ([vehicle player] call RETURNRANDOM);
_pRP = getposATL vehicle _rP;
_start = [(_pRP select 0) + (_range) - (random _range)*2,(_pRP select 1) + (_range) - (random _range)*2,0];
};
_ran = 0;
if ({_start distance (getmarkerpos _x) < (getmarkersize _x select 0)} count Bpositions > 0) then {_ran = 2;};
//INSERTION TYPE: 0 Normal, 1 Parachute, 2 Truck/Other vehicle
if (_ran == 0) then {
_num = [1,2,2,2];
if (!isNil"IFENABLED") then {_num = [2,2,2];};
_ngpp = ([_start,"ColorGreen"] CALL NEARESTGUARDPOST);
if (_ngpp distance _start > 500) then {_num append [0,0];};
_poNeCa = locationposition (["ColorRed",_start] CALL NEARESTCAMP);
if ((_poNeCa distance _start < 4000) && {vehicle player != player} && {_ngpp distance _start > 500}) then {_num append [0,0,0,0,0];};
if ((_poNeCa distance _start < 5000)) then {
if (isNil"IFENABLED") then {_num append [1,2,2];} else {_num append [2,2,2]};
};
_ran = _num call RETURNRANDOM;
};
if (surfaceiswater _start) exitWith {};
switch (_ran) do {
case 0: {

_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
_cl = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_cl call RETURNRANDOM);};
_group = [_start, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
Pgroups pushBack _group;
[_group, _start, _range] call bis_fnc_taskPatrol;
_nul = [_group,"ColorBlue"] SPAWN FUNKTIO_GM; 
{
_flare = ["UGL_FlareRed_F"] call RETURNRANDOM;
if (typeof _x ==  "O_Soldier_GL_F" || {typeof _x ==  "O_Soldier_SL_F"}) then {_nul = [_x,"EGLM",_flare] SPAWN FUNKTIO_AIFLARE;};
sleep 0.1;
} foreach units _group;
if (random 1 < 0.5) then {_nul = _group SPAWN SAOKAIGSMOKE;};
};
case 1: {
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
_cl = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_cl call RETURNRANDOM);};
_group = [_start, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
Pgroups pushBack _group;
_n = [_group,EAST,_start] SPAWN FHaloJump;
[_group, _start, _range] call bis_fnc_taskPatrol;
_nul = [_group,"ColorBlue"] SPAWN FUNKTIO_GM; 
{
_flare = ["UGL_FlareRed_F"] call RETURNRANDOM;
if (typeof _x ==  "O_Soldier_GL_F" || {typeof _x ==  "O_Soldier_SL_F"}) then {_nul = [_x,"EGLM",_flare] SPAWN FUNKTIO_AIFLARE;};
sleep 0.1;
} foreach units _group;
if (random 1 < 0.5) then {_nul = _group SPAWN SAOKAIGSMOKE;};
};
case 2: {
_isWpos = [player, 1800, 900] CALL SAOKSEARCHPOS;
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
_cl = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_cl call RETURNRANDOM);};
_tank = (["C",1] CALL VEHARRAY) call RETURNRANDOM;	
_startD = (locationposition (["ColorRed"] CALL NEARESTCAMP));
_roads = (_startD nearRoads 350);
if (count _roads > 0) then {_startD = getposATL (_roads select 0);} else {
_startD = [_startD, 70,0,"(1 - sea) * (1 + meadow)"] CALL SAOKSEEKPOS;
};
while {{vehicle _x distance _startD < 400} count [vehicle player]  > 0 || {surfaceisWater _startD}} do {
_startD = [(vehicle player),1200,300] CALL SAOKSEARCHPOS;
_roads = (_startD nearRoads 450);
if (count _roads > 0) then {_startD = getposATL (_roads select 0);};
sleep 1;
};
_params = [_startD, _start, _start, EAST, 180, _tank,_classes,[0.4,0.5],0];
if (surfaceisWater _isWpos) then {
_tank = ["O_Boat_Armed_01_hmg_F","O_Boat_Transport_01_F"] call RETURNRANDOM; 
_LZ = [_isWpos,_start] CALL SAOKSEEKSHORE;  
_isWpos = _isWpos CALL SAOKCORRECTSEASTART;
_params = [_isWpos, _LZ, _start, EAST, 180, _tank,_classes,[0.4,0.5],0,""];
};
_nul = _params SPAWN FLandTransportToPatrol;


};
};
};




