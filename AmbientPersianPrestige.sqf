private ["_n","_nWalls","_Gps","_Func1","_Hintbol","_cWalls","_t","_start","_dir","_end","_nul","_ranW","_center","_radius","_br","_ar","_star","_sel","_obj","_objc","_pos","_objs","_cW","_forEachIndex","_rC"];
waitUntil {sleep 1; !isNil"StartMission"};
sleep 30;
_Hintbol = false;
if (isNil"PERSIANPRESTIGE") then {PERSIANPRESTIGE = 900*DIFLEVEL*0.5;};
if (isNil"WalledCamp") then {WalledCamp = [];};
if (isNil"WalledOther") then {WalledOther = [];};
_Func1 = {
private ["_Fs","_Mp","_nGp"];
_Fs = [];
{_Mp = getmarkerpos _x; _nGp = ([_Mp] CALL NearestGuardPost); if (!isNil{_nGp getvariable "Gmark"} && {(getmarkercolor (_nGp getvariable "Gmark")) == "ColorRed"} && {_nGp distance _Mp < 350}) then {_Fs set [count _Fs,_x];};} foreach FacMarkers;
PERSIANPRESTIGE = PERSIANPRESTIGE + (4*(count _Fs)*DIFLEVEL);
_Fs
};


sleep 55;
//ADD WALLS FOR EACH ENEMY CAMP  _walls = [10,0,"Land_Mil_WiredFence_F",0] CALL FUNKTIO_DrawBox; _nul = [_end,_start,"Land_Mil_WiredFence_F",9500] SPAWN AddWall;
_p = SAOKMAPSIZE*0.5;
if (isNil"Bwalll" && {isNil"SAOKRESUME"}) then {
{
_xx = _x getvariable "Marker";
if (!(_xx in WalledCamp) && {!(_xx in WalledOther)} && {random 1 < 0.1}) then {
_ranW = ["Land_CncWall4_F","Land_CncWall4_F","Land_Mil_WallBig_4m_F","Land_Mil_WiredFence_F"] call RETURNRANDOM;
_center = getmarkerpos _xx;
WalledCamp pushback _xx;
_radius = 200 + (random 200);
_dir = random 360;
_start = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_end = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
if (!surfaceIsWater _end && {!surfaceIsWater _start}) then {_nul = [_end,_start,_ranW,200] SPAWN AddWall;};
_t = 1;
while {random 1 < 0.5 && {_t < 3}} do {
_t =_t + 1;
_start = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_end = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
if (!surfaceIsWater _end && {!surfaceIsWater _start}) then {_nul = [_end,_start,_ranW,200] SPAWN AddWall;};
};
};
sleep 0.1;
} foreach (nearestLocations [[_p,_p,0], ["CampR"], SAOKMAPSIZE*0.7]);
};


while {true} do {
sleep 60;
//UPDATE PRESTIGE
_Gps = [] CALL _Func1;
//BUILD SOMETHING IF PRESTIGE IS OVER 300
if (PERSIANPRESTIGE > 1000) then {
//NO WALLED FACTORIES
_nWalls = _Gps - WalledOther;
_cWalls = [];
{_xx = _x getvariable "Marker"; if (!(_xx in WalledCamp)) then {_cWalls pushback _xx;};sleep 0.1;} foreach (nearestLocations [[_p,_p,0], ["CampR"], SAOKMAPSIZE*0.7]);
	
//0 NEW ZONE 1 NEW STRAIGHT WALL 2 NEW FACTORY BOX WALL 3 SILO
_n = [0,0,0,0,0];
if (count _nWalls > 0 && {isNil"Bwalll"}) then {_n pushback 2;}; 
if (count _cWalls > 0 && {isNil"Bwalll"}) then {_n pushback 4;}; 

_n = _n call RETURNRANDOM;

switch _n do {
//VEH ZONE
case 0: {if (_Hintbol) then {Hint "New VEH Zone"};
["CSAT Seen Producing More Military Vehicles from Factory", date] CALL SAOKEVENTLOG;
if ({(_x getvariable "Mcolor") == "ColorRed"} count VEHZONES < 65) then {
_ar = + _Gps;
_br = [];
if (count _ar == 0) then {
{_xx = _x getvariable "Marker";_br pushback _xx;sleep 0.1;} foreach (nearestLocations [[_p,_p,0], ["CampR"], SAOKMAPSIZE*0.7]);
};
if (count _ar > 0 || {count _br > 0}) then {

_star = getmarkerpos ((_ar+_br) call RETURNRANDOM);
_start = [_star,100,30,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
_rC = ["C","P","T","T","V","V","AA","S","S","S","A","M","R","O","R","O"] call RETURNRANDOM;
if ({(_x getvariable "Mtype") == "o_support"} count VEHZONESA < 2  && {random 1 < 0.5}) then {_rC = "S";};
if ({(_x getvariable "Mtext") == " AA"} count VEHZONESA < ((count VEHZONESA)*0.05) && {random 1 < 0.5}) then {_rC = "AA";};
if (_start distance [0,0,0] > 50 && {!(surfaceiswater _start)}) then {
["EAST",_rC,2,_start] SPAWN SAOKMOREVEHZONES;
PERSIANPRESTIGE = PERSIANPRESTIGE - 150;
};
};
};
};
//DISABLED CURRENTLY ["EAST","T",1,_start] SPAWN SAOKMOREVEHZONES;
case 1: {if (_Hintbol) then {Hint "New S Wall"};};
//FACTORY WALLS
case 2: {
if (_Hintbol) then {Hint "New Fac Wall"};
["CSAT Constructing Walls Around One of Their Factories", date] CALL SAOKEVENTLOG;
_sel = _nWalls call RETURNRANDOM;
if ({(getmarkerpos _sel) distance (getmarkerpos _x) < 3000} count (WalledOther+WalledCamp) == 0) then {
PERSIANPRESTIGE = PERSIANPRESTIGE - 700;
WalledOther pushback _sel;
_center = getmarkerpos _sel;
_radius = 150 + (random 200);
_dir = random 360;
_start = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_end = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
if (!surfaceIsWater _end && {!surfaceIsWater _start}) then {_nul = [_end,_start,"Land_CncWall4_F",200] SPAWN AddWall;};
_t = 1;
while {random 1 < 0.8 && {_t < 3}} do {
_t =_t + 1;
_start = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_end = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
if (!surfaceIsWater _end && {!surfaceIsWater _start}) then {_nul = [_end,_start,"Land_CncWall4_F",200] SPAWN AddWall;};
};
};
};
//NEW CAMP WALL
case 4: {if (_Hintbol) then {Hint "New C Wall"};
["CSAT Building Walls to Cover One of Their Camps", date] CALL SAOKEVENTLOG;
_cW = _cWalls call RETURNRANDOM;
if ({(getmarkerpos _cW) distance (getmarkerpos _x) < 3000} count (WalledOther + WalledCamp) == 0) then {
PERSIANPRESTIGE = PERSIANPRESTIGE - 1000;
_ranW = ["Land_CncWall4_F","Land_CncWall4_F","Land_Mil_WallBig_4m_F","Land_Mil_WiredFence_F"] call RETURNRANDOM;
_center = getmarkerpos _cW;
WalledCamp pushback _cW;
_radius = 200 + (random 200);
_dir = random 360;
_start = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_end = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
if (!surfaceIsWater _end && {!surfaceIsWater _start}) then {_nul = [_end,_start,_ranW,200] SPAWN AddWall;};
_t = 1;
while {random 1 < 0.5 && {_t < 3}} do {
_t =_t + 1;
_start = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
_dir = _dir + 90;
_end = [(_center select 0)+((sin _dir)*_radius),(_center select 1)+((cos _dir)*_radius),0];
if (!surfaceIsWater _end && {!surfaceIsWater _start}) then {_nul = [_end,_start,_ranW,200] SPAWN AddWall;};
};
};
};

};

} else {
/*
//SILO GONE Land_CratesWooden_F
{
if (!alive _x || {isNull _x}) then {PRESTIGESILOS = PRESTIGESILOS - [_x];};
sleep 0.1;
} foreach PRESTIGESILOS;
{if (isNil"_x") exitWith {PRESTIGESILOS = [PRESTIGESILOS,_forEachIndex] call SAOKREMINDEX;};sleep 0.1;} foreach PRESTIGESILOS;
//TURN STORAGED SILO TO PRESTIGE
if (random 1 < 0.4 && {count PRESTIGESILOS > 0}) then {
{if (true) exitWith {_x spawn SAOKDELETE;PRESTIGESILOS = [PRESTIGESILOS,_forEachIndex] call SAOKREMINDEX;PERSIANPRESTIGE = PERSIANPRESTIGE + 50;};} foreach PRESTIGESILOS;
};
*/
};
};

//PRESTIGE STORING, WALLS, GUARDPOSTS, VEH ZONES, NEW CAMPS, BOAT CARGO PRESTIGE, RADARS?, OTHER SPECIAL COMPOUNDS?