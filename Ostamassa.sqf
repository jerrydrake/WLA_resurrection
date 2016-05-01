private ["_p","_cost","_cP","_Pstart","_n","_tg1","_veh","_ran","_nul","_start","_st","_p1","_p2","_p3","_p4","_p5","_p6","_p7","_p8","_cls","_str","_roads","_cost"];
_Pstart = [];
_cP = screenToWorld [0.5,0.5];
if (_cP distance player < 40 && {count (_cP nearObjects ["House",10]) == 0} && {count (_cP nearObjects ["Static",10]) == 0}) then {_Pstart = + _cP;};
if ({_this == getText (configfile >> "CfgVehicles" >> _x >> "displayName")} count ((AIRARMCHOP select 0)+(AIRFIGTHER select 0)+(AIRARMCHOP select 2)+(AIRFIGTHER select 2)+(AIRCARRIERCHOP select 0)+(AIRCARRIERCHOP select 2)) > 0) exitWith {
_p = "";
{if (_this == getText (configfile >> "CfgVehicles" >> _x >> "displayName")) exitWith {_p = _x;};} foreach ((AIRARMCHOP select 0)+(AIRFIGTHER select 0)+(AIRARMCHOP select 2)+(AIRFIGTHER select 2)+(AIRCARRIERCHOP select 0)+(AIRCARRIERCHOP select 2));
_cost = ((getText (configfile >> "CfgVehicles" >> _p >> "displayName")) CALL SUPPORTCOST) * 0.8;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,_p] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle [_p, _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};

if ({_this == getText (configfile >> "CfgVehicles" >> _x >> "displayName")} count ((ARMEDVEHICLES select 3)+(ARMEDTANKS select 3)+(ARMEDVEHICLES select 2)+(ARMEDTANKS select 2)+(ARMEDVEHICLES select 0)+(ARMEDTANKS select 0)) > 0) exitWith {
_p = "";
{if (_this == getText (configfile >> "CfgVehicles" >> _x >> "displayName")) exitWith {_p = _x;};} foreach ((ARMEDVEHICLES select 3)+(ARMEDTANKS select 3)+(ARMEDVEHICLES select 2)+(ARMEDTANKS select 2)+(ARMEDVEHICLES select 0)+(ARMEDTANKS select 0));
_cost = ((getText (configfile >> "CfgVehicles" >> _p >> "displayName")) CALL SUPPORTCOST) * 0.8;
_nul = [_p,_cost] SPAWN FBuyVehicle;
};

switch _this do {
case "Empty Rubberboat": {
if (pisteet >= 20) then {
pisteet = pisteet - 20;
_nul = [-20, "Rubberboat"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [player, 40,"(1 + sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_start set [2,0];
_apu = (_st select 0) select 0;
_apu set [2,0];
_t = 10;
while {!surfaceiswater _start || {getTerrainHeightASL _start > -2}} do {_start = [(_apu select 0)+_t-(random _t)*2,(_apu select 1)+_t-(random _t)*2,0];_t = _t + 10;};
_veh = createVehicle ["C_Rubberboat", _start, [], 0, "NONE"];
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to receive Rubberboat", 20 - pisteet])SPAWN HINTSAOK;
};
};

case "Empty Motorboat": {
if (pisteet >= 70) then {
pisteet = pisteet - 70;
_nul = [-70, "Motorboat"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [player, 40,"(1 + sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_start set [2,0];
_apu = (_st select 0) select 0;
_apu set [2,0];
_t = 10;
while {!surfaceiswater _start || {getTerrainHeightASL _start > -2}} do {_start = [(_apu select 0)+_t-(random _t)*2,(_apu select 1)+_t-(random _t)*2,0];_t = _t + 10;};
_veh = createVehicle ["C_Boat_Civil_01_F", _start, [], 0, "NONE"];
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to receive Motorboat", 70 - pisteet])SPAWN HINTSAOK;
};
};

case "Empty Assault Boat": {
if (pisteet >= 30) then {
pisteet = pisteet - 30;
_nul = [-30, "Assault Boat"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [player, 40,"(1 + sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_start set [2,0];
_apu = (_st select 0) select 0;
_apu set [2,0];
_t = 10;
while {!surfaceiswater _start || {getTerrainHeightASL _start > -2}} do {_start = [(_apu select 0)+_t-(random _t)*2,(_apu select 1)+_t-(random _t)*2,0];_t = _t + 10;};
_veh = createVehicle ["B_Boat_Transport_01_F", _start, [], 0, "NONE"];
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to receive Assault Boat", 30 - pisteet])SPAWN HINTSAOK;
};
};

case "Empty Speedboat MG": {
if (pisteet >= 120) then {
pisteet = pisteet - 120;
_nul = [-120, "Speedboat MG"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [player, 40,"(1 + sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_start set [2,0];
_apu = (_st select 0) select 0;
_apu set [2,0];
_t = 10;
while {!surfaceiswater _start || {getTerrainHeightASL _start > -2}} do {_start = [(_apu select 0)+_t-(random _t)*2,(_apu select 1)+_t-(random _t)*2,0];_t = _t + 10;};
_veh = createVehicle ["B_Boat_Armed_01_minigun_F", _start, [], 0, "NONE"];
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to receive Speedboat MG", 120 - pisteet])SPAWN HINTSAOK;
};
};

case "Empty SDV": {
if (pisteet >= 100) then {
pisteet = pisteet - 100;
_nul = [-100, "SDV"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [player, 40,"(1 + sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_start set [2,0];
_apu = (_st select 0) select 0;
_apu set [2,0];
_t = 10;
while {!surfaceiswater _start || {getTerrainHeightASL _start > -2}} do {_start = [(_apu select 0)+_t-(random _t)*2,(_apu select 1)+_t-(random _t)*2,0];_t = _t + 10;};
_veh = createVehicle ["B_SDV_01_F", _start, [], 0, "NONE"];
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to receive SDV", 100 - pisteet])SPAWN HINTSAOK;
};
};

case "MQ4A Greyhawk (AI)": {
if (pisteet >= 350) then {
pisteet = pisteet - 350;
_nul = [-350, "Received MQ4A Greyhawk"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_tg1 = [[(getmarkerpos "InsertionM") select 0, (getmarkerpos "InsertionM") select 1, 50], ([(getmarkerpos "InsertionM"), getposATL player] call SAOKDIRT), "B_UAV_02_F", WEST] call SPAWNVEHICLE;
//createVehicleCrew (_tg1 select 0);
CARS set [count CARS, (_tg1 select 0)];AddIdVeh set [count AddIdVeh, (_tg1 select 0)];
} else {
(format ["%1 more prestige value needed to receive MQ4A Greyhawk", 350 - pisteet])SPAWN HINTSAOK;
};
};
case "AR-2 Darter (AI)": {
if (pisteet >= 50) then {
pisteet = pisteet - 50;
_nul = [-50, "Received AR-2 Darter"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_tg1 = [[(locationposition ([] CALL NEARESTCAMP)) select 0, (locationposition ([] CALL NEARESTCAMP)) select 1, 20], 0, "B_UAV_01_F", WEST] call SPAWNVEHICLE;
//createVehicleCrew (_tg1 select 0);
CARS set [count CARS, (_tg1 select 0)];AddIdVeh set [count AddIdVeh, (_tg1 select 0)];
} else {
(format ["%1 more prestige value needed to receive AR-2 Darter", 50 - pisteet])SPAWN HINTSAOK;
};
};
case "UGV Stomper (AI)": {
if (pisteet >= 50) then {
pisteet = pisteet - 50;
_nul = [-50, "Received UGV Stomper"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [locationposition ([] CALL NEARESTCAMP),60,20,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start, "B_UGV_01_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [locationposition ([] CALL NEARESTCAMP),60,20,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_tg1 = [_start, 0, "B_UGV_01_F", WEST] call SPAWNVEHICLE;
//createVehicleCrew (_tg1 select 0);
CARS set [count CARS, (_tg1 select 0)];AddIdVeh set [count AddIdVeh, (_tg1 select 0)];
} else {
(format ["%1 more prestige value needed to receive UGV Stomper", 50 - pisteet])SPAWN HINTSAOK;
};
};
case "UGV Stomper RCWS (AI)": {
if (pisteet >= 100) then {
pisteet = pisteet - 100;
_nul = [-100, "Received UGV Stomper RCWS"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [locationposition ([] CALL NEARESTCAMP),60,20,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start, "B_UGV_01_rcws_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [locationposition ([] CALL NEARESTCAMP),60,20,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_tg1 = [_start, 0, "B_UGV_01_rcws_F", WEST] call SPAWNVEHICLE;
//createVehicleCrew (_tg1 select 0);
CARS set [count CARS, (_tg1 select 0)];AddIdVeh set [count AddIdVeh, (_tg1 select 0)];
} else {
(format ["%1 more prestige value needed to receive UGV Stomper RCWS", 100 - pisteet])SPAWN HINTSAOK;
};
};
case "HC AT-Guard": {
_nul = ["B_APC_Wheeled_01_cannon_F"] SPAWN FBuyVehicle;
};
case "Offroad FIA": {
_nul = ["B_G_Offroad_01_F",150] SPAWN FBuyVehicle;
};

case "Scout M3": {
_nul = ["LIB_US_Scout_m3",150] SPAWN FBuyVehicle;
};
case "GMC Tent": {
_nul = ["LIB_US_GMC_Tent",150] SPAWN FBuyVehicle;
};


case "Strider": {
_nul = ["I_MRAP_03_F",180] SPAWN FBuyVehicle;
};
case "Empty Strider HMG": {
_nul = ["I_MRAP_03_hmg_F",230] SPAWN FBuyVehicle;
};
case "Empty Strider GMG": {
_nul = ["I_MRAP_03_gmg_F",280] SPAWN FBuyVehicle;
};
case "Hunter": {
_nul = ["B_MRAP_01_F",150] SPAWN FBuyVehicle;
};
case "Empty Hunter HMG": {
_nul = ["B_MRAP_01_hmg_F",200] SPAWN FBuyVehicle;
};
case "Empty Hunter GMG": {
_nul = ["B_MRAP_01_gmg_F",250] SPAWN FBuyVehicle;
};
case "Empty Gorgon": {
_nul = ["I_APC_Wheeled_03_cannon_F",350] SPAWN FBuyVehicle;
};
case "Empty Panther": {
_nul = ["B_APC_Tracked_01_rcws_F",400] SPAWN FBuyVehicle;
};
case "Empty Marshall": {
_nul = ["B_APC_Wheeled_01_cannon_F",350] SPAWN FBuyVehicle;
};
case "Empty Cheetah": {
_nul = ["B_APC_Tracked_01_AA_F",400] SPAWN FBuyVehicle;
};
case "Empty Slammer": {
_nul = ["B_MBT_01_cannon_F",600] SPAWN FBuyVehicle;
};
case "Empty Slammer UP": {
_nul = ["B_MBT_01_TUSK_F",630] SPAWN FBuyVehicle;
};
case "Empty Scorcher": {
_nul = ["B_MBT_01_arty_F",500] SPAWN FBuyVehicle;
};
case "Empty Sandstorm": {
_nul = ["B_MBT_01_mlrs_F",500] SPAWN FBuyVehicle;
};
case "Empty FV-720 Mora": {
_nul = ["I_APC_tracked_03_cannon_F",400] SPAWN FBuyVehicle;
};
case "Empty MBT-52 Kuma": {
_nul = ["I_MBT_03_cannon_F",500] SPAWN FBuyVehicle;
};


case "Mortar Team": {
if (pisteet >= 300) then {
pisteet = pisteet - 300;
_nul = [-300, "Received Mortar Team"] SPAWN PRESTIGECHANGE;
"Cash" SPAWN SAOKPLAYSOUND;
_st = [locationposition ([] CALL NEARESTCAMP), 40,"(1 + meadow) * (1 - sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
if (count _Pstart > 0) then {_start = + _Pstart;};
_cl = if (isNil"IFENABLED") then {"I_Mortar_01_F"} else {"LIB_BM37"};
_tg1 = [_start, 0, _cl, WEST] call SPAWNVEHICLE;
(_tg1 select 0) setvariable ["REFUND","Mortar"];
IDNUM = IDNUM + 1;
_Gid = "MortarTeam";
_Gid = _Gid + format ["%1",IDNUM];
(_tg1 select 2) setgroupid [_Gid];
[(_tg1 select 2)] SPAWN {
_group = _this select 0;
_veh = (vehicle (leader _group)); 
DONTDELGROUPS = DONTDELGROUPS +  [_group];
_wP = (magazines _veh) select 0;
//B_MBT_01_arty_F {(!(_wP in (magazines _veh)) && {!(_vt == "B_MBT_01_arty_F")}) || {(_vt == "B_MBT_01_arty_F" && {(count (magazines _veh) < 3)})}} _vt = typeof _veh;
waitUntil {sleep 5; !alive _veh || {count units _group == 0} || {!(_wP in (magazines _veh))}};
DONTDELGROUPS = DONTDELGROUPS -  [_group];
CARS set [count CARS, _veh];
(vehicle (leader _group)) synchronizeObjectsRemove [mudo1]; mudo1 synchronizeObjectsRemove [(vehicle (leader _group))]; 
};
} else {
(format ["%1 more prestige value needed to receive mortar team", 300 - pisteet])SPAWN HINTSAOK;
};
};
case "Chopper Transport": {
if (pisteet >= 400) then {
pisteet = pisteet - 400;
_nul = [-400, "Chopper Transport"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_tg1 = [getmarkerpos "ChopperM", 0, "I_Heli_Transport_02_F", WEST] call SPAWNVEHICLE;

(vehicle (leader (_tg1 select 2))) synchronizeObjectsAdd [mudo2]; mudo2 synchronizeObjectsAdd [(vehicle (leader (_tg1 select 2)))]; 
(_tg1 select 2) allowfleeing 0;
(_tg1 select 2) setbehaviour "CARELESS";
[(_tg1 select 2)] SPAWN {
_group = _this select 0;
_veh = (vehicle (leader _group)); 
waitUntil {sleep 5; !alive _veh || count units _group == 0};
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
(vehicle (leader _group)) synchronizeObjectsRemove [mudo2]; mudo2 synchronizeObjectsRemove [(vehicle (leader _group))]; 
};
} else {
(format ["%1 more prestige value needed to receive chopper transport", 400 - pisteet])SPAWN HINTSAOK;
};
};
case "Set SPLTY Medical": {
if (pisteet >= 30) then {
pisteet = pisteet - 30;
_nul = [-30, "Set Specialty"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_ran = ["None","Medical","AntiAir","AntiTank"]call RETURNRANDOM;
[(player CALL SAOKNEARESTVIL),"B","Medical"] CALL SAOKVILSET;
} else {
(format ["%1 more prestige value needed to set specialty", 30 - pisteet])SPAWN HINTSAOK;
};
};
case "Set SPLTY AA-Guard": {
if (pisteet >= 30) then {
pisteet = pisteet - 30;
_nul = [-30, "Set Specialty"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
[(player CALL SAOKNEARESTVIL),"B","AntiAir"] CALL SAOKVILSET;
} else {
(format ["%1 more prestige value needed to set specialty", 30 - pisteet])SPAWN HINTSAOK;
};
};
case "Set SPLTY AT-Guard": {
if (pisteet >= 30) then {
pisteet = pisteet - 30;
_nul = [-30, "Set Specialty"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
[(player CALL SAOKNEARESTVIL),"B","AntiTank"] CALL SAOKVILSET;
} else {
(format ["%1 more prestige value needed to set specialty", 30 - pisteet])SPAWN HINTSAOK;
};
};
case "Set SPLTY MG-Guard": {
if (pisteet >= 30) then {
pisteet = pisteet - 30;
_nul = [-30, "Set Specialty"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
[(player CALL SAOKNEARESTVIL),"B","MachineGunners"] CALL SAOKVILSET;
} else {
(format ["%1 more prestige value needed to set specialty", 30 - pisteet])SPAWN HINTSAOK;
};
};
case "Bribe": {
if (pisteet >= 400) then {
pisteet = pisteet - 400;
_nul = [-400, "Bribed friendship"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
[(player CALL SAOKNEARESTVIL), "A","Friendly"] CALL SAOKVILSET;
} else {
(format ["%1 more prestige value needed to Bribe", 400 - pisteet])SPAWN HINTSAOK;
};
};
case "Buy PickUp": {
if (pisteet >= 20) then {
pisteet = pisteet - 20;
_nul = [-20, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [getposATL player, 40,"(1 + meadow) * (1 - sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_roads = (_start nearRoads 40);
if (count _roads > 0) then {_start = _roads call RETURNRANDOM;};
if (count _st == 0) then {_start = locationposition (player CALL SAOKNEARESTVIL);_start set [2,0];};
_veh = createVehicle ["C_Offroad_01_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];

[_veh] SPAWN {
private ["_t"];
_t = 0;
while {vehicle player distance (_this select 0) > 10 && _t < 100} do {
_t = _t + 1;
(_this select 0) say3d "AlarmCar";
sleep 5;
};
};

} else {
(format ["%1 more prestige value needed to buy vehicle", 20 - pisteet])SPAWN HINTSAOK;
};
};
case "Buy QuadBike": {
if (pisteet >= 20) then {
pisteet = pisteet - 20;
_nul = [-20, "Vehicle Cost"] SPAWN PRESTIGECHANGE;
"Cash" SPAWN SAOKPLAYSOUND;
_st = [getposATL player, 40,"(1 + meadow) * (1 - sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_roads = (_start nearRoads 40);
if (count _roads > 0) then {_start = _roads call RETURNRANDOM;};
if (count _st == 0) then {_start = locationposition (player CALL SAOKNEARESTVIL);_start set [2,0];};
_veh = createVehicle ["C_Quadbike_01_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
[_veh] SPAWN {
private ["_t"];
_t = 0;
while {vehicle player distance (_this select 0) > 10 && _t < 100} do {
_t = _t + 1;
(_this select 0) say3d "AlarmCar";
sleep 5;
};
};

} else {
(format ["%1 more prestige value needed to buy vehicle", 20 - pisteet])SPAWN HINTSAOK;
};
};
case "Buy Hatchback": {
if (pisteet >= 20) then {
pisteet = pisteet - 20;
_nul = [-20, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [getposATL player, 40,"(1 + meadow) * (1 - sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_roads = (_start nearRoads 40);
if (count _roads > 0) then {_start = _roads call RETURNRANDOM;};
if (count _st == 0) then {_start = locationposition (player CALL SAOKNEARESTVIL);_start set [2,0];};
_veh = createVehicle ["C_Hatchback_01_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
[_veh] SPAWN {
private ["_t"];
_t = 0;
while {vehicle player distance (_this select 0) > 10 && _t < 100} do {
_t = _t + 1;
(_this select 0) say3d "AlarmCar";
sleep 5;
};
};

} else {
(format ["%1 more prestige value needed to buy vehicle", 20 - pisteet])SPAWN HINTSAOK;
};
};
case "Buy Sport Hatchback": {
if (pisteet >= 20) then {
pisteet = pisteet - 20;
_nul = [-20, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [getposATL player, 40,"(1 + meadow) * (1 - sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_roads = (_start nearRoads 40);
if (count _roads > 0) then {_start = _roads call RETURNRANDOM;};
if (count _st == 0) then {_start = locationposition (player CALL SAOKNEARESTVIL);_start set [2,0];};
_veh = createVehicle ["C_Hatchback_01_sport_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
[_veh] SPAWN {
private ["_t"];
_t = 0;
while {vehicle player distance (_this select 0) > 10 && _t < 100} do {
_t = _t + 1;
(_this select 0) say3d "AlarmCar";
sleep 5;
};
};

} else {
(format ["%1 more prestige value needed to buy vehicle", 20 - pisteet])SPAWN HINTSAOK;
};
};
case "Buy SUV": {
if (pisteet >= 20) then {
pisteet = pisteet - 20;
_nul = [-20, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [getposATL player, 40,"(1 + meadow) * (1 - sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_roads = (_start nearRoads 40);
if (count _roads > 0) then {_start = _roads call RETURNRANDOM;};
if (count _st == 0) then {_start = locationposition (player CALL SAOKNEARESTVIL);_start set [2,0];};
_veh = createVehicle ["C_SUV_01_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
[_veh] SPAWN {
private ["_t"];
_t = 0;
while {vehicle player distance (_this select 0) > 10 && _t < 100} do {
_t = _t + 1;
(_this select 0) say3d "AlarmCar";
sleep 5;
};
};

} else {
(format ["%1 more prestige value needed to buy vehicle", 20 - pisteet])SPAWN HINTSAOK;
};
};
case "Buy Truck": {
if (pisteet >= 20) then {
pisteet = pisteet - 20;
_nul = [-20, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_st = [getposATL player, 40,"(1 + meadow) * (1 - sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_roads = (_start nearRoads 40);
if (count _roads > 0) then {_start = _roads call RETURNRANDOM;};
if (count _st == 0) then {_start = locationposition (player CALL SAOKNEARESTVIL);_start set [2,0];};
_veh = createVehicle ["C_Van_01_transport_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
[_veh] SPAWN {
private ["_t"];
_t = 0;
while {vehicle player distance (_this select 0) > 10 && _t < 100} do {
_t = _t + 1;
(_this select 0) say3d "AlarmCar";
sleep 5;
};
};
} else {
(format ["%1 more prestige value needed to buy vehicle", 20 - pisteet])SPAWN HINTSAOK;
};
};

case "Mine/Construction-Truck": {
if (pisteet >= 50) then {
pisteet = pisteet - 50;
_nul = [-50, "Mine/Construction-Truck Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [locationposition ([] CALL NEARESTCAMP),60,20,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
_cl = if (isNil"IFENABLED") then {"B_Truck_01_covered_F"} else {"LIB_US_GMC_Tent"};
while {[_start,_cl] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [locationposition ([] CALL NEARESTCAMP),60,20,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle [_cl, _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
_veh setvariable ["MineTruck",1];
} else {
(format ["%1 more prestige value needed to buy Mine/Construction-Truck", 50 - pisteet])SPAWN HINTSAOK;
};
};

case "Empty Blackfoot": {
_cost = "Empty Blackfoot" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"B_Heli_Attack_01_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["B_Heli_Attack_01_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty AH-9": {
_cost = "Empty AH-9" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"B_Heli_Light_01_armed_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["B_Heli_Light_01_armed_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty MH-9": {
_cost = "Empty MH-9" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"B_Heli_Light_01_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["B_Heli_Light_01_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty MH-9 PMC": {
_cost = "Empty MH-9 PMC" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"PMC_MH9"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["PMC_MH9", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty CH-49 [CONS]": {
_cost = "Empty CH-49 [CONS]" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"I_Heli_Transport_02_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["I_Heli_Transport_02_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
_veh setvariable ["MineTruck",1];
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty UH-80": {
_cost = "Empty UH-80" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"B_Heli_Transport_01_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["B_Heli_Transport_01_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty UH-80 Camo": {
_cost = "Empty UH-80 Camo" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"B_Heli_Transport_01_camo_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["B_Heli_Transport_01_camo_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty Buzzard AA": {
_cost = "Empty Buzzard AA" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"I_Plane_Fighter_03_AA_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["I_Plane_Fighter_03_AA_F", _start, [], 0, "NONE"];
_veh setdir ([_start, getposATL player] call SAOKDIRT);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty Buzzard CAS": {
_cost = "Empty Buzzard CAS" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"I_Plane_Fighter_03_CAS_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["I_Plane_Fighter_03_CAS_F", _start, [], 0, "NONE"];
_veh setdir ([_start, getposATL player] call SAOKDIRT);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty F/A-18 E": {
_cost = "Empty F/A-18 E" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"JS_JC_FA18E"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["JS_JC_FA18E", _start, [], 0, "NONE"];
_veh setdir ([_start, getposATL player] call SAOKDIRT);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty F/A-18 F": {
_cost = "Empty F/A-18 F" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE;"Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"JS_JC_FA18F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["JS_JC_FA18F", _start, [], 0, "NONE"];
_veh setdir ([_start, getposATL player] call SAOKDIRT);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};

case "Empty A-164 Wipeout": {
_cost = "Empty A-164 Wipeout" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE; "Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"B_Plane_CAS_01_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["B_Plane_CAS_01_F", _start, [], 0, "NONE"];
_veh setdir ([_start, getposATL player] call SAOKDIRT);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};

case "Empty WY-55 Hellcat": {
_cost = "Empty WY-55 Hellcat" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE; "Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"I_Heli_light_03_unarmed_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["I_Heli_light_03_unarmed_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};

case "Empty WY-55 Hellcat MG": {
_cost = "Empty WY-55 Hellcat MG" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE; "Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,"I_Heli_light_03_F"] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["I_Heli_light_03_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};

case "Empty Repair Truck": {
_cost = "Empty Repair Truck" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE; "Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
_cl = if (isNil"IFENABLED") then {"B_Truck_01_Repair_F"} else {"LIB_US_GMC_Parm"};
while {[_start,_cl] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle [_cl, _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty Fuel Truck": {
_cost = "Empty Fuel Truck" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE; "Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
_cl = if (isNil"IFENABLED") then {"B_Truck_01_fuel_F"} else {"LIB_US_GMC_Fuel"};
while {[_start,_cl] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle [_cl, _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty Rearm Truck": {
_cost = "Empty Rearm Truck" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE; "Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
_cl = if (isNil"IFENABLED") then {"B_Truck_01_ammo_F"} else {"LIB_US_GMC_Ammo"};
while {[_start,_cl] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle [_cl, _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Empty Medical Truck": {
_cost = "Empty Medical Truck" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Vehicle Cost"] SPAWN PRESTIGECHANGE; "Cash" SPAWN SAOKPLAYSOUND;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
_cl = if (isNil"IFENABLED") then {"B_Truck_01_medical_F"} else {"LIB_US_GMC_Ambulance"};
while {[_start,_cl] CALL SAOKTAKENBOX && {_max < 7} && {count _Pstart == 0}} do {
_max = _max + 1;
sleep 1;
_start = [getmarkerpos ([] CALL NEARESTAIRFIELD),80,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle [_cl, _start, [], 0, "NONE"];
_veh setdir (random 360);
CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};
case "Water Barrel": {
_cost = "Water Barrel" CALL SUPPORTCOST;
if (pisteet >= _cost) then {
pisteet = pisteet - _cost;
_nul = [-_cost, "Water Cost"] SPAWN PRESTIGECHANGE; "Cash" SPAWN SAOKPLAYSOUND;
_st = [getposATL player, 10,"(1 + meadow) * (1 - sea)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
if (count _Pstart > 0) then {_start = + _Pstart;};
_veh = createVehicle ["Land_BarrelWater_F", _start, [], 0, "NONE"];
_veh setdir (random 360);
//CARS set [count CARS, _veh];AddIdVeh set [count AddIdVeh, _veh];
} else {
(format ["%1 more prestige value needed to buy", _cost - pisteet])SPAWN HINTSAOK;
};
};

};




