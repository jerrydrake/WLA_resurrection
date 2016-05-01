
private ["_ff","_str","_nearest","_mNs","_f","_f2","_center","_pows","_guards","_ran","_group","_p","_dead","_Lna","_header"];
_f = {
private ["_unit"];
_unit = _this;
_unit setcaptive true;
_unit stop true;
_unit setunitpos "UP";
removeAllWeapons _unit;	
_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
};

_f2 = {
private ["_unit"];
_unit = _this;
_unit setcaptive false;
_unit stop false;
_unit setunitpos "UP";
removeAllWeapons _unit;	
_unit SwitchMove "";
_unit allowfleeing 1;
};

_ff = {
private ["_p","_b","_cen","_cc","_p1","_p2"];
_b = false;
_p = (_this select 1);
if (count _p == 2) then {_p pushback 0;};
_cen = atltoasl _p;
_cc = (_this select 0);
_p1 = [(_cen select 0) + (_cc select 0),(_cen select 1) + (_cc select 1),((_cen select 2) + 0.5)];
_p2 = [(_cen select 0) + (_cc select 0),(_cen select 1) + (_cc select 1),((_cen select 2) + 0.5)];
if (lineIntersects [_p1,_p2]) then {_b = true;};
_b
};

_center = _this;
_m = 0;
while {{[_x, _center] call _ff} count [[2,2],[-2,-2],[2,-4],[4,-2]] > 0 && {_m < 20}} do {_center = [_center,50,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS; sleep 0.1;_m = _m + 1;};
if (surfaceisWater _center || {vehicle player distance _center < 250} || {!(_m < 20)}) exitWith {};
_pows = [];
_guards = [];
_ran = CIVS1 call RETURNRANDOM;
_group = [_center, CIVILIAN, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
leader _group setpos _center;
_pows append (units _group);
_ran = CIVS1 call RETURNRANDOM;
_p = [(_center select 0)+2,(_center select 1)+2,0];
_group = [_p, CIVILIAN, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
leader _group setpos _p;
_pows append (units _group);
_p = [(_center select 0)-2,(_center select 1)-2,0];
_ran = CIVS1 call RETURNRANDOM;
_group = [_p, CIVILIAN, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
leader _group setpos _p;
_pows append (units _group);
{_x SPAWN _f;_x setvariable ["Uhkailtu",1];_x setvariable ["CivNo",1]; _x setcaptive true;} foreach _pows;  
_p = [(_center select 0)+2,(_center select 1)-4,0];
_ran = ENEMYC1 call RETURNRANDOM;
_group = [_p, EAST, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
leader _group setpos _p;
_guards append (units _group);
_p = [(_center select 0)+4,(_center select 1)-2,0];
_ran = ENEMYC1 call RETURNRANDOM;
{_x setunitpos "UP";} foreach _guards;
_group = [_p, EAST, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
_nul = [units _group] SPAWN AICampBehaviour;
_guards append (units _group);

_dead = {
private ["_bol"];
_bol = false;
if ({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}}} count _this == 0) then {_bol = true;};
_bol
};
waitUntil {sleep 3; _center distance player > 800 || {_pows CALL _dead} || {_guards CALL _dead}};
//VIL REL GET WORSE
if (_pows CALL _dead && {_center distance player < 100}) then {
_Lna = _center CALL NEARESTLOCATIONNAME;
_header = format ["Tradegy in %1, Civilian Hostages Killed in Firefight",_Lna];
[_header, date] CALL SAOKEVENTLOG;
"Local relations have worsened due to civilian deaths" SPAWN HINTSAOK;
PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);
[] SPAWN SAOKLOWERRELVIL;
};
//VIL REL IMPROVE
if (_guards CALL _dead && {!(_pows CALL _dead)} && {_center distance player < 100}) then {
_Lna = _center CALL NEARESTLOCATIONNAME;
_header = format ["Civilian Hostages Saved in %1",_Lna];
[_header, date] CALL SAOKEVENTLOG;
"Improved local relationship from saved civilians" SPAWN HINTSAOK;
if ({player distance _x < 30} count _pows > 0) then {
[] SPAWN {
private ["_actor1","_n","_nul"];
if (vehicle player != player) exitWith {};
sleep 5;
_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_n = [
[getposATL player, player, _actor1],
[],
[
[[[player], ["Hey, are you okay?"],3]]
,[[[_actor1], "I need to take deep breath but you came to help just in right time, thank you",8]]
,[[[_actor1], "They would have moved us to prison camp or worse",7]]
,[[[_actor1], ["We will not forgot that you helped us"],5]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_nul = [_actor1,""] SPAWN FHideAndDelete;
};
};
{_x SPAWN _f2;} foreach _pows;
_nearest = (player CALL SAOKNEARESTVIL); 
_nearest CALL SAOKIMPREL;
};
waitUntil {sleep 4; _center distance player > 800};
{_x spawn SAOKDELETE;} foreach (_pows+_guards);