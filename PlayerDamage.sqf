private ["_unts","_nPlayer","_nn","_gT","_spawnPos","_c","_array","_building","_waypoints","_xx2","_yy2","_ran","_group","_unit2","_di","_civs","_unit3","_nul","_unit","_range","_pos","_rmusic","_h","_w","_n"];
sleep (random 0.3);
SAOKDIEWISH = SAOKDIEWISH + 1;
if ((SAOKDIEWISH > 1 && {count _this == 0}) || {!isNil{missionnamespace getvariable "SaOkHealed"}}) exitWith {SAOKDIEWISH = 0;};
titlecut ["","white out",0.1];
SAOKSKIPCUT = nil;
missionnamespace setvariable ["SaOkHealed",1];
missionnamespace setvariable ["PPos",getposATL player];
SAOKDIEWISH = 0;
_rmusic = ["FR_Helios_StealthIV","FR_Helios_CalmIII","FR_Helios_CalmII","FR_Helios_Calm","FR_Helios_Intro"]call RETURNRANDOM;
[_rmusic] SPAWN MusicP;
SAOKPDIE = true;
_loppu = false;
player allowdamage false;
if (isNil"TeDam" || {vehicle player != player}) then {
if (count _this > 0 || {(_this select 0) != ""}) then {(_this select 0) SPAWN HINTSAOK2;};
} else {
"Wait for Revive or press SPACE. Only medics, or soldiers with firstAid pack can revive. They must follow you too" SPAWN HINTSAOK;
player setvariable ["SAwounded",time];
player SPAWN SAOKWOUNDED;
titlecut ["","white in",0.3];
LastHit = true;
waitUntil {sleep 0.1;isNil{player getvariable "SAwounded"} || {isNil"LastHit"} || {!isNil"SAOKSKIPCUT"}};
LastHit = nil;
if (isNil{player getvariable "SAwounded"}) then {
_loppu = true;
player allowdamage true;
} else {
titlecut ["","white out",0.1];
if (count _this > 0 || {(_this select 0) != ""}) then {(_this select 0) SPAWN HINTSAOK2;};
player allowdamage false;
};
};
if (_loppu) exitWIth {SAOKPDIE = nil;missionnamespace setvariable ["SaOkHealed",nil];missionnamespace setvariable ["VehKill",nil];};

sleep 0.3;
skiptime ((random 0.2)+0.05);
RESPAWN = "";
_n = [] SPAWN {
disableserialization;
_ok = createDialog "RespawnDialog"; 
_myDisplay = findDisplay 52552;
if (getmarkercolor (([getposATL player,"ColorGreen"] CALL NEARESTGUARDPOST)getvariable "Gmark") != "ColorGreen" || {player distance ([getposATL player,"ColorGreen"] CALL NEARESTGUARDPOST) > 4000}) then {ctrlEnable [1602, false];};
if (getmarkercolor ((["ColorBlue"] CALL NEARESTCAMP) getvariable "Marker") != "ColorBlue" || {locationposition (["ColorBlue"] CALL NEARESTCAMP) distance player > 4000}) then {ctrlEnable [1603, false];};
_p = SAOKMAPSIZE * 0.5;
if ({markertext ((_x getvariable "Post") getvariable "Gmark") == " Camp Wolf"} count (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) == 0) then {ctrlEnable [1604, false];};
waitUntil {sleep 1; !dialog};
};


waitUntil {sleep 1; scriptdone _n};
_gT = getposATL player;
_range = 350;
_minD = 250;
if (RESPAWN == "FAR") then {_range = 750;_minD = 550;};
{if (alive _x && {vehicle _x != _x} && {(getposATL vehicle _x) select 2 < 2}) exitWith {_gT = getposATL (vehicle _x);_range = 100;};} foreach units group player - [player]; 
_spawnPos = [(_gT select 0)+_range-(random _range)*2,(_gT select 1)+_range-(random _range)*2,0];
_nn = 0;
while {surfaceIsWater _spawnPos || {_spawnPos distance player < _minD} || {({alive _x && {side _x == EAST}} count (_spawnPos nearEntities [["Man"],300]) > _nn)}} do {sleep 0.1;_nn = _nn + 0.5;_range = _range + 10;_gT = getposATL player; _spawnPos = [(_gT select 0)+_range-(random _range)*2,(_gT select 1)+_range-(random _range)*2,0];};

if (RESPAWN == "POST") then {_spawnPos = getposATL ([getposATL player,"ColorGreen"] CALL NEARESTGUARDPOST);};
if (RESPAWN == "CAMP") then {_spawnPos = getmarkerpos (["ColorBlue"] CALL NEARESTCAMP);};
if (RESPAWN == "CAMPW") then {
_p = SAOKMAPSIZE * 0.5;
{if (markertext (_x getvariable "Gmark") == " Camp Wolf") exitWIth {_spawnPos = locationposition _x;};} foreach (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
};

if (random 1 < 0.5) then {
_building = nearestBuilding _spawnPos;
_waypoints = _building call SAOKBUILDINGPOS;
if (count _waypoints > 0 && {({alive _x && {side _x == EAST}} count ((getposATL _building) nearEntities [["Man"],150]) == 0)}) then {
_spawnPos = _building buildingPos (_waypoints call RETURNRANDOM);
};
};

//_spawnPos = (locationposition (player CALL SAOKNEARESTVIL)); 
player setpos _spawnPos;
_unts = + (units group player - [player]);
_nPlayer = player;
if (isNil{missionnamespace getvariable "NewRespawn"}) then {
_n = [player] SPAWN FClone;
waitUntil {sleep 0.1; !isNil{missionnamespace getvariable "NewP"}};
_nPlayer = missionnamespace getvariable "NewP";
_nPlayer allowdamage false;
missionnamespace setvariable ["NewP",nil];
} else {};

_nPlayer switchmove "Acts_UnconsciousStandUp_part1";
if (DIFLEVEL < 1) then {_nPlayer setdamage 0;};

if (isNil"TeamStay") then {
sleep 1;
{
if (alive _x && {vehicle _x == _x}) then {
_x setpos [(_spawnPos select 0)+10-(random 20),(_spawnPos select 1)+10-(random 20),0];
_x SPAWN FClone;
};
} foreach _unts;
};
_civs = [];


_ran = CIVS1 call RETURNRANDOM;
_group = [[1000,1000,0], CIVILIAN, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;

_unit = leader _group;
_unit setvariable ["Talki",1];
_xx2 = random 2;
_yy2 = 2 - _xx2;
if (random 1 > 0.5) then {_xx2 = -1*_xx2;};
if (random 1 > 0.5) then {_yy2 = -1*_yy2;};
_h = if (getposATL player select 2 < 1.5) then {getposATL player select 2} else {0};
_unit setpos [(_spawnPos select 0)+_xx2,(_spawnPos select 1)+_yy2,_h];
_di= [_unit, _nPlayer] call SAOKDIRT;
_unit setdir _di;
_group setformdir _di;
//_unit playmoveNow (["Acts_TreatingWounded01","Acts_TreatingWounded02","Acts_TreatingWounded03","Acts_TreatingWounded04","Acts_TreatingWounded05","Acts_TreatingWounded06"] call RETURNRANDOM);
_civs = _civs + [_unit];
if (random 1 < 0.5) then {
_ran = CIVS1 call RETURNRANDOM;
_group = [[1000,1000,0], CIVILIAN, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
_unit2 = leader _group;
_unit2 setvariable ["Talki",1];
_xx2 = random 2.5;
_yy2 = 2.5 - _xx2;
if (random 1 > 0.5) then {_xx2 = -1*_xx2;};
if (random 1 > 0.5) then {_yy2 = -1*_yy2;};
_unit2 setpos [(_spawnPos select 0)+_xx2,(_spawnPos select 1)+_yy2,_h];
_di= [_unit2, _nPlayer] call SAOKDIRT;
_unit2 setdir _di;
_group setformdir _di;
//_unit2 playmoveNow (["Acts_TreatingWounded01","Acts_TreatingWounded02","Acts_TreatingWounded03","Acts_TreatingWounded04","Acts_TreatingWounded05","Acts_TreatingWounded06"] call RETURNRANDOM);
_civs = _civs + [_unit2];
};
if (random 1 < 0.5) then {
_ran = CIVS1 call RETURNRANDOM;
_group = [[1000,1000,0], CIVILIAN, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
_unit3 = leader _group;
_unit3 setvariable ["Talki",1];
_xx2 = random 2.5;
_yy2 = 2.5 - _xx2;
if (random 1 > 0.5) then {_xx2 = -1*_xx2;};
if (random 1 > 0.5) then {_yy2 = -1*_yy2;};
_unit3 setpos [(_spawnPos select 0)+_xx2,(_spawnPos select 1)+_yy2,_h];
_di= [_unit3, _nPlayer] call SAOKDIRT;
_unit3 setdir _di;
_group setformdir _di;
//_unit3 playmoveNow (["Acts_TreatingWounded01","Acts_TreatingWounded02","Acts_TreatingWounded03","Acts_TreatingWounded04","Acts_TreatingWounded05","Acts_TreatingWounded06"] call RETURNRANDOM);
_civs = _civs + [_unit3];
};

sleep 8;
_nPlayer setHit ["legs", 0];
titlecut ["","white in",7];
_w = (missionnamespace getvariable "ResTT");
sleep _w;
titlecut ["","black out",0.5];
sleep 0.5;
_nPlayer switchmove "";
sleep 0.2;
titlecut ["","black in",0.5];
{_x switchmove "";_nul = [_x,1] SPAWN FHideAndDelete;} foreach _civs;
missionnamespace setvariable ["SaOkHealed",nil];
_nPlayer allowdamage true;
_nPlayer switchmove "";
if (!isNil{missionnamespace getvariable "VehKill"}) then {
missionnamespace setvariable ["VehKill",nil];
sleep (2+random 15);
"Look for paradropped crate with AT-launcher" SPAWN HINTSAOK;
_pos = [(getposATL player select 0)+35-(random 70),(getposATL player select 1)+35-(random 70),0];
_cl = if (isNil"IFENABLED") then {"Box_NATO_WpsLaunch_F"} else {"LIB_BasicWeaponsBox_US"};
_nul = [_pos,_cl] SPAWN FSupportDrop;
};
sleep 10;
SAOKPDIE = nil;