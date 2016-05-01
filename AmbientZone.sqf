private ["_dd","_picked","_num","_n","_star","_nameA","_f","_pos","_noHouse","_c","_array","_nObject","_Zcol","_mar","_mar2","_pnO","_y","_cc","_kk","_pi"];
waitUntil {sleep 1; !isNil"StartMission"};
CAMPREINFAR = [];
if (!isNil"SAOKRESUME") then {
sleep 10;
} else {
_n = [] execvm "AddZones1.sqf";

_num = 0;
{
_nameA = toArray _x;
_f = [_nameA select 0, _nameA select 1,_nameA select 2,_nameA select 3,_nameA select 4];
_f = toString _f;
if (_f == "ZoneC") then {
if (worldname != "Altis") then {deletemarker _x;} else {
_x setMarkerSize [1,1];

if (getmarkercolor _x == "ColorBlue") then {
_c = createLocation ["CampB", getmarkerpos _x, 100, 100];
_c setvariable ["Marker",_x];
} else {
_c = createLocation ["CampR", getmarkerpos _x, 100, 100];
_c setvariable ["Marker",_x];
};
if ({_x > SAOKMAPSIZE} count (getmarkerpos _x) > 0) then {
_pos = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
while {surfaceiswater _pos} do {_pos = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];sleep 0.1;};
_nObject = nearestBuilding _pos; 
_x setmarkerpos getposATL _nObject;
};
//RANDOM NEARBY VEHICLE ZONE "hd_Flag"
if (random 1 > 0.6) then {
_star = [getmarkerpos _x, 1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
if (GetMarkerColor _x == "ColorRed") then {
if (random 1 < 0.6) then {
_n = ["H","V",_star] CALL CVZ;
} else {
_n = ["H","T",_star] CALL CVZ;
};
} else {
if (random 1 < 0.6) then {
_n = ["N","V",_star] CALL CVZ;
} else {
_n = ["N","T",_star] CALL CVZ;
};
};
};
};
};
sleep 0.01;
} foreach allMapMarkers;

_p = SAOKMAPSIZE * 0.5;
_cc = count (nearestLocations [[_p,_p,0], ["CampB","CampR"], SAOKMAPSIZE*0.7]);
_kk = 0;
while {count (nearestLocations [[_p,_p,0], ["CampB","CampR"], SAOKMAPSIZE*0.7]) < (23 * (SAOKMAPSIZE / 30000)) && {_kk < 50}} do {
_kk = _kk + 1;
_nObject = objNull;
_noHouse = true;
while {_noHouse} do {
_pos = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
while {surfaceiswater _pos} do {_pos = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];sleep 0.1;};
_nObject = nearestBuilding _pos; 
_c = 0;
//if (!isNull _nObject) then {
_array = _nObject buildingPos _c;
if (!(_array isEqualTo [0,0,0])) then {_noHouse = false;};
while {_array isEqualTo [0,0,0] && {_c < 20} && {_noHouse} && {!surfaceiswater (getposatl _nObject)}} do {	
_c = _c + 1;
_array = _nObject buildingPos _c;
if (!(_array isEqualTo [0,0,0])) then {_noHouse = false;};
sleep 0.1;
};
//};
sleep 0.1;
};
if (count (nearestLocations [_nObject, ["CampB","CampR"], (1200* (SAOKMAPSIZE / 30000))]) == 0) then {
_Zcol = "ColorRed";
if (random 1 < 0.15) then {_Zcol = "ColorBlue";};
_mar = format ["ZoneM%1",NUMM];
NUMM=NUMM+1;
_mar2 = createMarker [_mar,getposATL _nObject];
_mar2 setMarkerShape "ICON";
_mar2 setMarkerType "Empty";
_mar2 setMarkerSize [1,1];
_mar2 setMarkerColor _Zcol;
_mar2 setMarkerText "";

if (getmarkercolor _Zcol == "ColorBlue") then {
_c = createLocation ["CampB", getposATL _nObject, 100, 100];
_c setvariable ["Marker",_mar2];
} else {
_c = createLocation ["CampR", getposATL _nObject, 100, 100];
_c setvariable ["Marker",_mar2];
};
_pnO = getposATL _nObject;
//RANDOM NEARBY VEHICLE ZONE
if (random 1 < 0.5) then {
_star = [_pnO, (1200*(SAOKMAPSIZE / 30000)),0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
if (_Zcol == "ColorRed") then {
if (random 1 < 0.6) then {
_n = ["H","V",_star] CALL CVZ;
} else {
_n = ["H","T",_star] CALL CVZ;
};
} else {
if (random 1 < 0.6) then {
_n = ["N","V",_star] CALL CVZ;
} else {
_n = ["N","T",_star] CALL CVZ;
};
};
};
if (random 1 < 0.2 && {_Zcol == "ColorRed"}) then {
_star = [(_pnO select 0)+1200-(random 2400),(_pnO select 1)+1200-(random 2400),0];
if (isNil"IFENABLED") then {_n = [_star, _Zcol,["O_UAV_02_F"],"o_uav"] CALL AddVehicleZone;};
};
};
sleep 0.1;
};

_c = (nearestLocations [player, ["CampB","CampR"], SAOKMAPSIZE]);
_c2 = _c call RETURNRANDOM;
_c = _c - [_c2];
[_c2,"ColorBlue"] call CAMPSETSIDE; 
sleep 1;
[_c call RETURNRANDOM,"ColorBlue"] call CAMPSETSIDE; 
};
sleep 5;
SAOKCAMPREINF = {
private ["_units","_forEachIndex"];
_units = + (_this select 0);
{if (_this select 1 == _x select 0) exitWith {_units append (_x select 1); _deAT = CAMPREINFAR deleteAt _forEachIndex;};} foreach CAMPREINFAR;
_units
};

SAOKCAMPHELP = {
private ["_side","_random","_color","_icls","_center","_wp","_classes","_unitrate","_group","_n"];
_color = getmarkercolor _this;
if ((_color == "ColorRed" && {side _x == EAST} count allunits > 50) || {(_color == "ColorBlue" && {side _x == WEST} count allunits > 50)}) exitWith {};
_icls = if (_color == "ColorBlue") then {[FRIENDC1,FRIENDC2,FRIENDC3,FRIENDC4,FRIENDC4] call RETURNRANDOM} else {[ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM};
_center = getmarkerpos _this;
_side = west;
if (_color == "ColorRed") then {_side = east;};
_wp = [(_center select 0) + 20 - random 40,(_center select 1) + 20 - random 40,0];
_classes = [];
_unitrate = [3,5];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
for "_i" from 0 to _random do {_classes pushback (_icls call RETURNRANDOM);};
_center = [_center,1500,800,"(1 - sea)"] CALL SAOKSEEKPOS;
_group = [_center, _side, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
_n = [[_group], _side, _wp,[],_wp] SPAWN VehicleArrival;
CAMPREINFAR pushBack [_this, units _group];
};


//FUNCS
SAOKSPAWNEMPTYCARS = {
private ["_objc","_start","_obj"];
_objc = _this select 2;
_start = _this select 0;
_obj = createVehicle [_objc,_start, [], 0, "NONE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setdir (_this select 1);
_obj setvariable ["ZoneCar",1];
if (_this select 3 == "ColorBlue") then {
_obj addWeaponCargo ["Rangefinder",1];
_obj addWeaponCargo ["Laserdesignator",1];
_obj addmagazineCargo ["Laserbatteries",1];
};
_obj
};

SAOKSPAWNSPATROLLINGGROUPS = {
private ["_gmc","_gPp","_random","_center","_range","_unitrate","_start","_group","_icls","_posST","_cc","_side","_n","_nul","_classes","_CantCommand","_unts","_c","_array","_posSSS","_waypoints","_building","_sHou","_unsss"];
_center = _this select 0;
_unitrate = _this select 1;
_range = _this select 2;
_icls = _this select 3;
_side = _this select 4;
_start = [(_center select 0) + _range - random (_range*2),(_center select 1) + _range - random (_range*2),0];
_classes = [];
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
for "_i" from 0 to _random do {_classes pushback (_icls call RETURNRANDOM);};
_posST = _start;
_cc = 0;
if ({_x distance _start < 250 && {isNil{missionnamespace getvariable "JustTeleported"}}} count [player] == 0) then {_posST = _start;} else {
if (_side == EAST) then {
_posST = [(_start select 0),(_start select 1)+300,1];
if (surfaceIsWater _posST) then {_posST = [(_start select 0)+300,(_start select 1)+300,1];};
if (surfaceIsWater _posST) then {_posST = [(_start select 0)-300,(_start select 1)+300,1];};
if (surfaceIsWater _posST) then {_posST = [(_start select 0)+300,(_start select 1),1];};
} else {
_posST = [(_start select 0),(_start select 1)-300,1];
if (surfaceIsWater _posST) then {_posST = [(_start select 0)+300,(_start select 1)-300,1];};
if (surfaceIsWater _posST) then {_posST = [(_start select 0)-300,(_start select 1)-300,1];};
if (surfaceIsWater _posST) then {_posST = [(_start select 0)-300,(_start select 1),1];};
};
_cc = 1;
};
_start = + _posST;
if (_start distance player < 400) then {_start = [(vehicle player),900,600,"(1 + houses) * (1 - sea)"] CALL SAOKSEEKPOS;};
_group = [_posST, _side, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
if (_cc == 0) then {
_unsss = (units _group);
_c = count _unsss - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _unsss select _i;
_c = 0;
_building = objNull;
_sHou = [(_posST select 0) + 100 - (random 200), (_posST select 1) + 100 - (random 200), 0];
_building = nearestBuilding _sHou;
_waypoints = _building call SAOKBUILDINGPOS;
if (count _waypoints > 0) then {
_posSSS = _building buildingPos (_waypoints call RETURNRANDOM);
_xx setpos _posSSS;
} else {if (!surfaceiswater _sHou) then {_xx setpos _sHou;};};
};
};
_unts = [];
_unts append (units _group);
_CantCommand = [_group];
if (_cc == 1 && {{_x distance _start < 250 && {isNil{missionnamespace getvariable "JustTeleported"}}} count [player] > 0}) then {
if (random 1 < 0.2) then {
_n = [_group, _side, _posST] SPAWN FHaloJump;
} else {
_n = [[_group], _side, _posST,[],_posST] SPAWN VehicleArrival;
};
};
_gmc = getmarkercolor _picked;
if (_gmc == "ColorBlue" && {"B_Soldier_A_F" in _icls}) then {{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;} foreach units _group;};
_gPp = getmarkerpos _picked;
_nul = [units _group] SPAWN AICampBehaviour;
[_CantCommand,_unts]
};

SAOKCAMPALARM = {
private ["_nul","_unts","_u"];
_unts = _this select 0;
waitUntil {sleep 5; {behaviour _x == "COMBAT"} count _unts > 0 || {{isNil"_x" || {isNull _x}} count _unts > 0} || {count _unts == 0}};
if ({alive _x && {behaviour _x == "COMBAT"}} count _unts > 0) then {
_u = [];
{if (alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}}) then {_u pushBack _x;};} foreach _unts;
_u = _u call RETURNRANDOM;
if (side _u == EAST) then {
group _u SPAWN SAOKAISMOKEPURPLE;
_nul = [getposATL (nearestBuilding (_this select 1)),(_this select 2)] SPAWN FAlarmEvents;
(_this select 2) SPAWN SAOKCAMPHELP;
sleep 10;
if (DIFLEVEL >= 1 && {random DIFLEVEL > 0.5}) then {(_this select 2) SPAWN SAOKCAMPHELP;};
} else {
group _u SPAWN SAOKAISMOKEBLUE;
(_this select 2) SPAWN SAOKCAMPHELP;
};
};
};
_p = SAOKMAPSIZE * 0.5;
{
_x SPAWN SAOKSHF15;
sleep 0.1;
} foreach (nearestLocations [[_p,_p,0], ["CampB","CampR"], SAOKMAPSIZE*0.7]);

AMBIENTZONEFUNC =  {
private ["_cO","_df","_flags","_guns","_m","_addRB","_mcol","_mpos","_dd","_tankcl","_alarm","_obj","_objs","_aapos","_atpos","_picked","_atc","_aac","_unts","_infp","_infh","_infg","_icls","_parkc","_parkp","_cars","_lamps","_tankd","_w","_c","_type","_flag","_st","_start","_p1","_p2","_crateT","_crateP","_addCampObjs","_d","_objc","_t","_pos","_center","_veh","_countT","_booll","_n","_star","_nul","_c2","_ggro","_y","_nameA","_f","_side","_gPs","_nykyV","_sidee","_classes","_group","_tim","_sff","_xx","_di","_cCa"];
_picked = _this getvariable "Marker";
_nameA = toArray _picked;
_f = [_nameA select 0, _nameA select 1, _nameA select 2];
_f = toString _f;
_mpos = getmarkerpos _picked;
_mcol = getmarkercolor _picked;
_addRB = {
private ["_mP","_mC","_own","_pos","_ra","_roads","_Rpos","_n"];
_mP = getmarkerpos _this;
_mC = getmarkercolor _this;
/*
if (vehicle player == player || {!(typeof (vehicle player) isKindOf "Air")}) then {
_own = "WEST";
if (_mC != "ColorGreen") then {_own = "EAST";};
for "_i" from 0 to 3 do {
_pos = [(_mP select 0)+50-(random 100),(_mP select 1)+50-(random 100),0];
[_pos,_own,player distance _mP,_this] SPAWN F_IEDmil;
if (_mC == "ColorGreen") then {[_pos,"MinefieldAP","ColorBlack",0,"",300] SPAWN SAOKCREATEMARKER;};
sleep 0.1;
};
};
*/
if (_mC == "ColorGreen") then {
if ({!isNil{_x getvariable "IsRoadBlock"}} count (nearestLocations [_mP, ["PostG","PostR"], 4000]) == 0) then {
_ra = 800;
_pos = [(_mP select 0)+_ra-(random _ra)*2,(_mP select 1)+_ra-(random _ra)*2,0];
_roads = (_pos nearroads 100); 
while {count _roads == 0} do {
sleep 0.1;
_ra = _ra + 50;
_pos = [(_mP select 0)+_ra-(random _ra)*2,(_mP select 1)+_ra-(random _ra)*2,0];
_roads = (_pos nearroads 100); 
};
_Rpos = getposATL (_roads call RETURNRANDOM);
_n = [_Rpos] SPAWN F_GREENROADBLOCK;
};
};
};

if (_f != "VZo") then {
_type = if (_mcol == "ColorRed") then {"o_hq"} else {"n_hq"};
_picked setMarkerType _type;
};
_side = if (_mcol == "ColorBlue") then {WEST} else {EAST}; 
_icls = if (_mcol == "ColorBlue") then {[FRIENDC1,FRIENDC2,FRIENDC3,FRIENDC4,FRIENDC4] call RETURNRANDOM} else {[ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM};
_cars = [];
_unts = [];
_lamps =[];
_parkp = [];
_parkc = [];
_infp = [];
_atpos = [];
_aapos = [];
_crateT = [];
_crateP = [];
_addCampObjs = 0;
_flag = "";
if (_f != "VZo") then {
if (_mcol == "ColorBlue") then {
_flag = if (isNil"IFENABLED") then {"Flag_FD_Green_F"} else {"FlagCarrierGER"};
} else {
_flag = if (isNil"IFENABLED") then {"Flag_FD_Red_F"} else {"FlagCarrierSU"};
};
};
if (_f != "VZo") then {
_aac = if (_mcol == "ColorBlue") then {((["AA",2] CALL VEHARRAY)+(["ST",2] CALL VEHARRAY))} else {(["ST",1] CALL VEHARRAY)};
_atc = if (_mcol == "ColorBlue") then {((["VEH",2] CALL VEHARRAY)+(["ST",2] CALL VEHARRAY)+(["TANK",2] CALL VEHARRAY))} else {((["VEH",1] CALL VEHARRAY)+(["ST",1] CALL VEHARRAY)+(["TANK",1] CALL VEHARRAY))};
_infp = [[_mpos,8,50]];
_parkp = [[_mpos,random 360],[_mpos,random 360]];
_parkc = if (_mcol == "ColorBlue") then {
if (isNil"IFENABLED") then {
((["VEH",2] CALL VEHARRAY)+(["C",2] CALL VEHARRAY)+(["CIV",2] CALL VEHARRAY)+["B_G_Offroad_01_repair_F","B_G_Van_01_fuel_F"])
} else {
((["VEH",2] CALL VEHARRAY)+(["C",2] CALL VEHARRAY)+(["CIV",2] CALL VEHARRAY))
}
} else {
((["VEH",1] CALL VEHARRAY)+(["C",1] CALL VEHARRAY))
};
if (random 1 < 0.5) then {
_start = [_mpos, 20,0,"(1 - sea)"] CALL SAOKSEEKPOS;
_crateT = if (_mcol == "ColorBlue") then {(CRATECLAS select 2)+(CRATECLAS select 3)}else{(CRATECLAS select 1)};
_crateP = [_start];
};
_addCampObjs = 1;
};
_infh = [];
_infg = [];
_tankcl = [];
_tankd = [];
_w = [];
_alarm = [];
_c = 0;
//diag_log format ["%1, %2", "PAT G", diag_fps];
//SPAWNS PATROLLING GROUPS
_mmm = [7,8];
if (DIFLEVEL < 1 || {(getposATL vehicle player) select 2 > 3}) then {_mmm = [4,5];};
{
_d = [_mpos,_mmm,50,_icls,_side] CALL SAOKSPAWNSPATROLLINGGROUPS;
CantCommand append (_d select 0);
_unts append (_d select 1);
sleep 0.01;
} foreach _infp;
//diag_log format ["%1, %2", "CAMP A S", diag_fps];
//CAMP ALARM  && {_mcol == "ColorRed"}
if (count _infp > 0) then {
_d = [_unts,_mpos,_picked] SPAWN SAOKCAMPALARM;
};
_objs = [];
_guns = [];
_cO = _picked + "OOO";
if (!isNil{missionnamespace getvariable _cO}) then {
_df = missionnamespace getvariable _cO;
_objs = _df select 0;
_guns = _df select 1;
missionnamespace setvariable [_cO,nil];
};
if (count _objs == 0) then {
//diag_log format ["%1, %2", "CRATE", diag_fps];
//CRATES 
_c = count _crateP - 1;
for "_i" from 0 to _c do {
_xx = _crateP select _i;
_objc = _crateT call RETURNRANDOM;
_obj = createVehicle [_objc,_xx, [], 0, "NONE"]; 
//_obj setpos _xx;
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setvariable ["CCCrate",1];
_obj setdir (random 360);
_objs pushBack _obj;
sleep 0.1;
};
//CAMPOBJECTS
if (_addCampObjs == 1) then {
//diag_log format ["%1, %2", "TENT", diag_fps];
//TENTS
_center = getmarkerpos _picked;
_t = 0;
_objc = if (_mcol == "ColorRed" || {!isNil"IFENABLED"}) then {"Land_TentA_F"} else {"Land_TentDome_F"};
while {_t < 5} do {
sleep 0.1;
_t = _t + 1;
_pos = [(_center select 0)+20-(random 40),(_center select 1)+20-(random 40),0];
if (!([_pos,_objc] CALL SAOKTAKENBOX) && {!isOnRoad _pos} && {((surfaceNormal _pos) select 2 > 0.986)}) then {
_obj = createVehicle [_objc,_pos, [], 0, "NONE"]; 
_obj setdir (random 360);
_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
};
};
//diag_log format ["%1, %2", "BARE", diag_fps];
//EXPLODING BARRELS obj1 = createVehicle ["Land_MetalBarrel_F",getposATL thisTrigger, [], 0, "NONE"]; _n = obj1 SPAWN SAOKBARRELBOMBS;
if (getmarkercolor _picked == "ColorRed") then {
_t = [1,1,2,3] call RETURNRANDOM;
_objc = "Land_MetalBarrel_F";
while {_t < 5} do {
sleep 0.1;
_t = _t + 1;
_pos = [(_center select 0)+20-(random 40),(_center select 1)+20-(random 40),0];
_p1 = ATLTOASL[(_pos select 0),(_pos select 1),(_pos select 2) + 0.5];
_p2 = ATLTOASL[(_pos select 0),(_pos select 1),(_pos select 2) + 6];
if (!isOnRoad _pos && {((surfaceNormal _pos) select 2 > 0.986)}) then {
_obj = createVehicle [_objc,_pos, [], 0, "NONE"]; 
_obj setdir (random 360);
_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
//_n = _obj SPAWN SAOKBARRELBOMBS;
};
sleep 0.1;
};
};
//diag_log format ["%1, %2", "CAMO", diag_fps];
//OTHER (CAMONETS)
_objc = if (_mcol == "ColorRed") then {"CamoNet_OPFOR_open_F"} else {"CamoNet_INDP_open_F"};
_pos = [(_center select 0)+20-(random 40),(_center select 1)+20-(random 40),0];
if (!([_pos,"B_Truck_01_covered_F"] CALL SAOKTAKENBOX)  && {!isOnRoad _pos} && {((surfaceNormal _pos) select 2 > 0.99)}) then {
_obj = createVehicle [_objc,_pos, [], 0, "NONE"]; 
_obj setdir (random 360);
_obj allowdamage false;
_obj setvectorup (surfaceNormal (getposATL _obj));
_objs pushBack _obj;
};
};
};
sleep 0.1;
_flags = [];
//FLAG
if (_flag != "") then {
_obj = createVehicle [_flag,_mpos, [], 0, "NONE"];
_flags pushBack _obj;
};
//diag_log format ["%1, %2", "E CAR", diag_fps];
//SPAWN EMPTY CARS
if ((getposATL vehicle player) select 2 < 10 && {player distance _mpos > 500 || {!isNil{missionnamespace getvariable "JustTeleported"}}}) then {
_c = floor random 1;
for "_i" from 0 to _c do {
_start = "";
_m = 0;
_pL = _parkc call RETURNRANDOM;
while {_m < 5 && {(typename _start != "ARRAY" || {surfaceiswater _start} || {[_start,_pL] CALL SAOKTAKENBOX} || {{_x distance _start < 15} count (_cars+_objs) > 0} || {count (_start nearEntities [["Air", "Car", "LandVehicle"], 15]) > 0})}} do {
_m = _m + 1;
_start = [_mpos,60,0,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
sleep 0.1;
};
if (typename _start == "ARRAY") then {
_d = [_start,random 360,_pL,_mcol] CALL SAOKSPAWNEMPTYCARS;
_cars pushBack _d;
_d SPAWN SAOKSHF16;
};
sleep 0.1;
};
};
if (count _guns == 0) then {
if !(_mcol == "ColorRed" && {{_x distance _mpos < 500} count [player] > 0}) then {
//diag_log format ["%1, %2", "AA", diag_fps];
//SPAWNS STATIC AA WEAPONS
_c = floor (random 1);
for "_i" from 0 to _c do {
_start = "";
_m = 0;
_gunC = _aac call RETURNRANDOM;
while {_m < 5 && {(typename _start != "ARRAY" || {surfaceiswater _start}  || {[_start,_gunC] CALL SAOKTAKENBOX}|| {{_x distance _start < 12} count (_cars+_objs) > 0} || {count (_start nearEntities [["Air", "Car", "LandVehicle"], 12]) > 0})}} do {
_m = _m + 1;
_start = [_mpos,60,0,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
sleep 0.1;
};
if (typename _start == "ARRAY") then {
_classes = FRIENDC4 call RETURNRANDOM;
if (_mcol == "ColorRed") then {
_classes = ENEMYC1 call RETURNRANDOM;
};
_obj = createVehicle [_gunC, _start, [], 0, "NONE"]; 
_group = [_start, _side, [_classes],[],[],[0.4,0.8]] call SpawnGroupCustom;
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setdir (random 360);
_group setformdir (random 360);
leader _group moveingunner _obj;
_unts pushBack (leader _group);
_guns pushBack _obj;
_obj lock 2;
sleep 0.1;
};
};
//diag_log format ["%1, %2", "AT", diag_fps];
//SPAWNS STATIC AT WEAPONS
_c = floor (random 1);
for "_i" from 0 to _c do {
_start = "";
_m = 0;
_pyss = _atc call RETURNRANDOM;
while {_m < 5 && {(typename _start != "ARRAY" || {surfaceiswater _start} || {[_start,_pyss] CALL SAOKTAKENBOX} || {{_x distance _start < 12} count (_cars+_objs) > 0} || {count (_start nearEntities [["Air", "Car", "LandVehicle"], 12]) > 0})}} do {
_m = _m + 1;
_start = [_mpos,60,0,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
sleep 0.1;
};
if (typename _start == "ARRAY") then {
_classes = FRIENDC4 call RETURNRANDOM;
if (_mcol == "ColorRed") then {
_classes = ENEMYC1 call RETURNRANDOM;
};
_obj = createVehicle [_pyss, _start, [], 0, "NONE"]; 
_group = [_start, _side, [_classes],[],[],[0.4,0.8]] call SpawnGroupCustom;
_obj setvectorup (surfaceNormal (getposATL _obj));
sleep 0.1;
_di= [_mpos, getposATL _obj] call SAOKDIRT;
_obj setdir _di;
_group setformdir _di;
leader _group moveingunner _obj;
_unts pushBack (leader _group);
_guns pushBack _obj;
_obj lock 2;
sleep 0.1;
};
};
};
} else {
_classes = FRIENDC4 call RETURNRANDOM;
if (_mcol == "ColorRed") then {
_classes = ENEMYC1 call RETURNRANDOM;
};
{
if (!isNull _x && {alive _x}) then {
_group = [getposATL _x, _side, [_classes],[],[],[0.4,0.8]] call SpawnGroupCustom;
_group setformdir (direction _x);
leader _group moveingunner _x;
_unts pushBack (leader _group);
};
} foreach _guns;
};
//diag_log format ["%1, %2", "GUARDPOST S", diag_fps];
//GUARDPOST STATE (ANY ALIVE NEARBY) AND CSAT INSIDE 30m from camp
_gPs = {
private ["_bool","_c","_mP","_bil"];
_bool = false;
if (getMarkerColor _this == "ColorBlue") then {
_c = 0;
_mP = getMarkerpos _this;
{
_c = _c + ({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x != EAST && {side _x != CIVILIAN}}} count ((locationposition _x) nearEntities [["Man"],100]));
} foreach (nearestLocations [_mP, ["PostG","PostR"], 400]);
_bil = false; 
if ({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x == EAST} && {_x distance (getmarkerpos _this) < 30}} count (_mP nearEntities [["Man"],100]) > 0) then {_bil = true;};
if ({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x != EAST && {side _x != CIVILIAN}} && {_x distance (getmarkerpos _this) < 30}} count (_mP nearEntities [["Man"],100]) > 0) then {_bil = false;};
if (_c > 1 && {_bil}) then {_bool = true;};
};
_bool
};
//PLAYER IS FAR AGAIN
_countT = 0;
_nykyV = getMarkerColor _picked;
_sff = if (_nykyV == "ColorBlue") then {EAST} else {WEST};
_booll = _picked call _gPs;
//diag_log format ["%1, %2", "GUARDPOST S AF", diag_fps];
_dd = (["Ld"] CALL DIS);
while {_countT < 12 && {_nykyV == getMarkerColor _picked} && {{alive _x && {(vehicle _x) distance _mpos < _dd}} count [player] > 0} && {((({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}}} count _unts) + 1)/((count _unts) + 1) >= 0.2 || {_booll})} && {count _unts > 0}} do {
sleep 10; 
_dd = (["Ld"] CALL DIS);
if ({alive _x && {(vehicle _x) distance (_mpos) < 45}} count [player] > 0 && {_nykyV == "ColorRed"}) then {
if (_countT > 4) then {
{if (leader group _x != player) then {group _x move (_mpos);};sleep 0.1;} foreach ((_mpos) nearEntities [["SoldierEB","SoldierGB","SoldierWB"],150]);
};
if ({side _x == EAST && {isNil{_x getvariable "SaOkSurrendeRed"}}} count ((_mpos) nearEntities [["Man"],100]) < 2) then {_countT = _countT + 1;};
};
_booll = _picked call _gPs;
_unts = [_unts,_picked] CALL SAOKCAMPREINF;
//diag_log format ["%1, %2", "CAMPREINF", diag_fps];
};
while {{_picked == _x select 0} count CAMPREINFAR > 0} do {
{if (_picked == _x select 0) exitWith {_deAT = CAMPREINFAR deleteAt _forEachIndex;};sleep 0.01;} foreach CAMPREINFAR;
sleep 0.1;
};
if (_nykyV == getMarkerColor _picked) then {
_c = (count _unts) + 1;
_c2 = ({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}}} count _unts) + 1;
//CAPTURED CONDITION
if ((_c2/_c < 0.2 || {_countT > 11}) && {(!_booll || {_countT > 11})}) then {
if (getMarkerColor _picked == "ColorBlue") then {
[_this,"ColorRed"] call CAMPSETSIDE; 
_n = [_mpos,"EAST"] CALL GuardPostSide;
if (random 1 < 0.5) then {
_star = [_mpos,1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
if (GetMarkerColor _picked == "ColorRed") then {
if (random 1 < 0.6) then {
_n = ["H","V",_star] CALL CVZ;
} else {
_n = ["H","T",_star] CALL CVZ;
};
} else {
if (random 1 < 0.6) then {
_n = ["N","V",_star] CALL CVZ;
} else {
_n = ["N","T",_star] CALL CVZ;
};
};
};
if (random 1 < 0.2 && {GetMarkerColor _picked == "ColorRed"}) then {
_star = [(_mpos select 0)+1200-(random 2400),(_mpos select 1)+1200-(random 2400),0];
if (isNil"IFENABLED") then {_n = [_star, GetMarkerColor _picked,["O_UAV_02_F"],"o_uav"] CALL AddVehicleZone;};
};
if (_f != "VZo") then {
["ScoreRemoved",["Camp was captured by the enemy",60]] call SAOKNOTIFI;
PERSIANPRESTIGE = PERSIANPRESTIGE + (1000*DIFLEVEL);
[] SPAWN SAOKLINES;
["E","CAP"] SPAWN SAOKRADIOMES;
["F","LOS",""] SPAWN SAOKRADIOMES;
};
} else {
[_this,"ColorBlue"] call CAMPSETSIDE; 
_n = [_mpos,"WEST"] CALL GuardPostSide;
if (random 1 < 0.5) then {
_star = [_mpos,1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
if (GetMarkerColor _picked == "ColorRed") then {
if (random 1 < 0.6) then {
_n = ["H","V",_star] CALL CVZ;
} else {
_n = ["H","T",_star] CALL CVZ;
};
} else {
if (random 1 < 0.6) then {
_n = ["N","V",_star] CALL CVZ;
} else {
_n = ["N","T",_star] CALL CVZ;
};
};
};
if (_f != "VZo") then {


[] SPAWN SAOKLINES;
["ScoreAdded",["Camp was succesfully captured",50]] call SAOKNOTIFI;
_tim = (300 + (random 100)) / DIFLEVEL;
_tim SPAWN SAOKREINFCUTADD;
_picked SPAWN _addRB;
pisteet = pisteet + 200;
["F","CAP",""] SPAWN SAOKRADIOMES;
["E","LOS"] SPAWN SAOKRADIOMES;
_nul = [200, "Capture Bonus"] SPAWN PRESTIGECHANGE;
//hint "Camp was succesfully captuRed";
_nearbyVZs = nearestLocations [getmarkerpos _picked,["Name"], 1000];
_cCa = {!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == "ColorRed"}} count _nearbyVZs;
if (_cCa > 0 && {random 1 < (_cCa*0.4)} && {count AMBbattles < 3} && {([] CALL FPSGOOD)} && {{side _x == EAST} count allUnits < 45}) then {
_nul = [_picked] SPAWN FDefendCounterAttack;
AMBbattles pushback [_picked,"FDefendCounterAttack"];
[_picked] SPAWN {sleep 1200;
{if (_this select 0 == _x select 0) exitWith {AMBbattles deleteAT _foreachIndex;};} foreach AMBbattles;
};
};

};
};
};
} else {
if (getMarkerColor _picked == "ColorBlue") then {
_n = [_mpos,"WEST"] CALL GuardPostSide;
if (random 1 < 0.5) then {
_star = [_mpos,1200,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
if (GetMarkerColor _picked == "ColorRed") then {
if (random 1 < 0.6) then {
_n = ["H","V",_star] CALL CVZ;
} else {
_n = ["H","T",_star] CALL CVZ;
};
} else {
if (random 1 < 0.6) then {
_n = ["N","V",_star] CALL CVZ;
} else {
_n = ["N","T",_star] CALL CVZ;
};
};
};
[] SPAWN SAOKLINES;
["ScoreAdded",["Camp was succesfully captured",50]] call SAOKNOTIFI;
["F","CAP",""] SPAWN SAOKRADIOMES;
["E","LOS"] SPAWN SAOKRADIOMES;
_tim = (300 + (random 100)) / DIFLEVEL;
_tim SPAWN SAOKREINFCUTADD;
_picked SPAWN _addRB;
} else {
["F","LOS",""] SPAWN SAOKRADIOMES;
["E","CAP"] SPAWN SAOKRADIOMES;
["ScoreRemoved",["Camp was captured by the enemy",60]] call SAOKNOTIFI;
PERSIANPRESTIGE = PERSIANPRESTIGE + (1000*DIFLEVEL);
_n = [_mpos,"EAST"] CALL GuardPostSide;
[] SPAWN SAOKLINES;
};

};

ACTIVECAMPS = ACTIVECAMPS - [_picked];
{deletevehicle _x;} foreach _flags;
if (player distance getmarkerpos _picked > 400) then {
{
if ({isPlayer _x} count crew _x == 0) then {
{if (group _x != group player) then {_x spawn SAOKDELETE;};sleep 0.1;} foreach crew _x;
_x spawn SAOKDELETE;
} else {CARS pushback _x;};
sleep 0.1;
} foreach _objs + _guns;
} else {
_cO = _picked + "OOO";
missionnamespace setvariable [_cO,[_objs,_guns]];
};

if ({(vehicle _x) distance (_mpos) < _dd} count [player] == 0) then {
{
[_x] SPAWN SAOKSHF17;
sleep 0.1;
} foreach _unts;

} else {
{if (surfaceIsWater getposATL _x) then {_unts = _unts - [_x];_x spawn SAOKDELETE;};sleep 0.1;} foreach _unts;
if (count _unts > 0) then {
_ggro = createGroup _side;
_unts join _ggro;
if !(isNil"_ggro") then {
if (_side == EAST) then {Pgroups pushBack _ggro;} else {FriendlyInf pushBack _ggro;};
};
};
};
if (_f != "VZo") then {
_type = if (getmarkercolor _picked == "ColorRed") then {"o_hq"} else {"n_hq"};
_picked setMarkerType _type;
};
sleep 1;

sleep 4;
{_y = _x; if ({isPlayer _x} count crew _y == 0 && {{(vehicle _x) distance _y < 700} count [player] == 0}) then {
_x spawn SAOKDELETE;
} else {
CARS pushBack _x;
};
sleep 0.1;
} foreach _cars;
};

if (worldname != "Altis") then {
_p = SAOKMAPSIZE*0.5;
{
if ({_x > SAOKMAPSIZE} count locationposition _x > 0) then {
_pos = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
while {surfaceiswater _pos} do {_pos = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];sleep 0.1;};
_nObject = nearestBuilding _pos; 
_x setposition getposATL _nObject;
(_x getvariable "Marker") setmarkerpos getposATL _nObject;
};
sleep 0.01;
} foreach (nearestLocations [[_p,_p,0], ["CampB","CampR"], SAOKMAPSIZE*0.7]);
};

[] SPAWN SAOKLINES;

ACTIVECAMPS = [];
while {true} do {
waitUntil {sleep 3;{isPlayer _x} count [player] > 0};
sleep 3;
_picked = "";
_dd = (["Ld"] CALL DIS);
{_y = _x; if !((_x getvariable "Marker") in ACTIVECAMPS) exitwith {_picked = _x; ACTIVECAMPS pushback (_x getvariable "Marker");};sleep 0.01;} foreach (nearestLocations [player, ["CampB","CampR"], _dd]);
if (typename _picked != "STRING") then {
_picked SPAWN AMBIENTZONEFUNC;
if ([] CALL FPSGOOD) then {(_picked getvariable "Marker") SPAWN SAOKVISITOFFICER;};
};
};



