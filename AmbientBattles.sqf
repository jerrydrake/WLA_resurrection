private ["_camps","_pick","_t","_n","_nul","_cPos"];
TASK_CreateGuardpost = compileFinal preprocessfileLineNumbers "MainTasks\CreateGuardpost.sqf";
TASK_OFFICER = compileFinal preprocessfileLineNumbers "MainTasks\Officer.sqf";
_p = SAOKMAPSIZE*0.5;
waitUntil {sleep 10; ("ResHelp" in (missionnamespace getvariable "Progress")) || {count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]) > 2}};
sleep (300 + (random 300));
while {true} do {
waitUntil {sleep 20; count AMBbattles < 2};
if (random 1 < 0.7) then {[] SPAWN SAOKCSATTAKEFACTORY;};
if (random 1 < 0.1) then {[] SPAWN TASK_Bobcat;sleep (30+(random 90));};

if (((worldname CALL SAOKMAPDATA) select 6) && {random 1 < 0.3}) then {
[] SPAWN FDefendBeach;
} else {
_sLo = PierMarkers + StoMarkers + PowMarkers;
if (random 1 < 0.2 && {{getmarkercolor _x == "ColorGreen"} count _sLo > 0}) then {
//STRATEGIC POINT ACTION
if (random 1 < 0.75) then {
_pick = _sLo call RETURNRANDOM;
while {getmarkercolor _pick != "ColorGreen"} do {_pick = _sLo call RETURNRANDOM; sleep 5;};
AMBbattles pushBack [_pick,"FDefendFactory"];
_nul = [_pick] SPAWN FDefendFactory;
} else {
//SUPPLY LINE ACTION
_nul = [] SPAWN FDefendSupply;
};
} else {
//CAMP ACTION
waitUntil {sleep 15; count (nearestLocations [[_p,_p,0], ["CampR"], SAOKMAPSIZE*0.7]) > 0 && {count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]) > 0}};
_camps = [];
{
if (!isNil{_x getvariable "Marker"}) then {
_xx = _x getvariable "Marker";
_cPos = locationposition _x;
_nearbyVZs = nearestLocations [_cPos,["Name"], 1000];
if ({_xx == _x select 0} count AMBbattles == 0 && {{!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == "ColorRed"} && {!((_x getvariable "Mtype") in ["o_naval","o_art","o_mortar"])}} count _nearbyVZs > 0}) then {_camps pushBack _xx;};sleep 0.1;
};
} foreach (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]);
_n = _camps SPAWN SAOKCAMPSINDANGER;
waitUntil {sleep 1; scriptdone _n};
_n = (missionnamespace getvariable "SaOkCautionCamps") SPAWN SAOKISCAMPOK;
waitUntil {sleep 1; scriptdone _n};
if (random 2 < DIFLEVEL) then {[] SPAWN SAOKCSATTOWARDCAMP;};
if (count _camps > 0 && {random 1 < 0.7}) then {
_pick = _camps call RETURNRANDOM;
AMBbattles pushBack [_pick,"FDefendRandom"];
[_pick] SPAWN {sleep 1200; 
{if (_this select 0 == _x select 0) exitWith {AMBbattles deleteAT _foreachIndex;};} foreach AMBbattles;
};
_nul = [_pick] SPAWN FDefendRandom;
} else {
if (random 2 < DIFLEVEL) then {[] SPAWN SAOKCSATTOWARDCAMP;};
if (random 2 < DIFLEVEL) then {[""] SPAWN SAOKCSATTOWARDCAMP;};
_camps = [];
{
if (!isNil{_x getvariable "Marker"}) then {
_xx = _x getvariable "Marker"; _cPos = getmarkerpos _xx;
_nearbyVZs = nearestLocations [_cPos,["Name"], 1000];
if ({_xx == _x select 0} count AMBbattles == 0 && {{!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") in ["ColorBlue","ColorGreen"]}} count _nearbyVZs > 1}) then {_camps pushBack _xx;};
sleep 0.1;
};
} foreach (nearestLocations [[_p,_p,0], ["CampR"], SAOKMAPSIZE*0.7]);
if (count _camps > 0) then {
_pick = _camps call RETURNRANDOM;
AMBbattles pushBack [_pick,"FAttackRandom"];
_nul = [_pick] SPAWN FAttackRandom;
};
};
};
};
_t = 500 + (random 1300);
if (DIFLEVEL < 1) then {_t = 2200 + (random 2300);};
if (DIFLEVEL < 0.5) then {_t = 3500 + (random 2300);};
sleep _t;
};

