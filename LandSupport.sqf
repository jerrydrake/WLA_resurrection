private ["_dd","_start","_tank","_tg1","_posPl","_tg1wp1","_price","_type","_roads","_nul","_classes","_group","_wp1"];
_price = _this select 0;
_type = _this select 1;
_tank = "";
switch (_type) do {
case "Paradrop-Squad": {_tank = "Paradrop-Squad";};
case "Motorized-Squad": {_tank = "Motorized-Squad";};
case "AT-Team": {_tank = "AT-Team";};
case "AA-Team": {_tank = "AA-Team";};
case "INF-Team": {_tank = "INF-Team";};
case "PMC-Team": {_tank = "PMC-Team";};
case "Offroad MG": {_tank = "I_G_Offroad_01_armed_F";};
case "Hunter HMG": {_tank = "B_MRAP_01_hmg_F";};
case "Hunter GMG": {_tank = "B_MRAP_01_gmg_F";};
case "Strider HMG": {_tank = "I_MRAP_03_hmg_F";};
case "Strider GMG": {_tank = "I_MRAP_03_gmg_F";};
case "Marshall": {_tank = "B_APC_Wheeled_01_cannon_F";};
case "Panther": {_tank = "B_APC_Tracked_01_rcws_F";};
case "Gorgon": {_tank = "I_APC_Wheeled_03_cannon_F";};
case "Bobcat": {_tank = "B_APC_Tracked_01_CRV_F";};
case "Cheetah": {_tank = "B_APC_Tracked_01_AA_F";};
case "Slammer": {_tank = "B_MBT_01_cannon_F";};
case "Slammer UP": {_tank = "B_MBT_01_TUSK_F";};
case "Scorcher": {_tank = "B_MBT_01_arty_F";};
case "Sandstorm": {_tank = "B_MBT_01_mlrs_F";};
case "FV-720 Mora": {_tank = "I_APC_tracked_03_cannon_F";};
case "MBT-52 Kuma": {_tank = "I_MBT_03_cannon_F";};
};
if (_tank == "") then {
{if (getText (configfile >> "CfgVehicles" >> _x >> "displayName") == _type) exitWith {_tank = _x;};} foreach (ARMEDAA select 0)+(ARMEDAA select 3)+(ARMEDAA select 2)+(ARMEDTANKS select 0) + (ARMEDVEHICLES select 0) + (ARMEDTANKS select 2) + (ARMEDVEHICLES select 2) + (ARMEDTANKS select 3) + (ARMEDVEHICLES select 3);
};

if (pisteet >= _price) then {
pisteet = pisteet - _price;
"Cash" SPAWN SAOKPLAYSOUND;
_nul = [-_price, "Support Call"] SPAWN PRESTIGECHANGE;
//_trigger = _this select 0;
//_trigger setTriggerActivation ["NONE", "PRESENT", true];
if !(_type in ["PMC-Team","INF-Team","AA-Team","AT-Team","Motorized-Squad","Paradrop-Squad"]) then {
leader player sidechat ("Wolf to Base. Is there any "+_type+"-teams nearby? We would need more force. Over");
[player,player, "PlaV", "V4"]SPAWN SAOKKBTELL;
} else {
leader player sidechat ("Wolf to nearby units, we would need help of "+_type+" here. Anyone there? Over");
[player,player, "PlaV", "V4"]SPAWN SAOKKBTELL;
};

sleep 7;
if (_type in ["PMC-Team","INF-Team","AA-Team","AT-Team","Motorized-Squad","Paradrop-Squad"]) then {
"Radio2" SPAWN SAOKPLAYSOUND;
//(_tg1 select 2) setgroupid [_type]; leader (_tg1 select 2) sidechat "Wolf, we are heading to help you shortly. ETA - few minutes. Out";
} else {
[WEST,"HQ"] sidechat ("Understood, Wolf. I am sending "+_type+"-team to your way. They will be there shortly. Out");
"Radio2" SPAWN SAOKPLAYSOUND;
};

if !(_type in ["PMC-Team","INF-Team","AA-Team","AT-Team","Motorized-Squad","Paradrop-Squad"]) then {
_dd = (["Lb"] CALL DIS);
_start = [(getposATL (vehicle player) select 0) + _dd - (random _dd)*2,(getposATL (vehicle player) select 1) + _dd - (random _dd)*2,0];
_roads = (_start nearRoads 650);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};  
while  {surfaceIsWater _start || {{_start distance _x < 500} count VarBlackListF > 0} || _start distance vehicle player < 500} do {
sleep 1;
_start = [(getposATL (vehicle player) select 0) + _dd - (random _dd)*2,(getposATL (vehicle player) select 1) + _dd - (random _dd)*2,0];
_roads = (_start nearRoads 650);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};  
};

_tg1 = [_start, 0, _tank, WEST] call SPAWNVEHICLE;
if !(_tank in ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]) then {
_posPl = [(getposATL (vehicle player) select 0) + (random 200)-(random 200), (getposATL (vehicle player) select 1)+ (random 200)-(random 200), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
[(_tg1 select 2), 1] setWaypointType "GUARD";
NAPAveh set [count NAPAveh,(_tg1 select 2)];
_nul = [(_tg1 select 2),"ColorRed"] SPAWN FUNKTIO_GM;
//_nul = [(_tg1 select 0), _posPl] SPAWN FUNKTIO_VS;
CARS set [count CARS,(_tg1 select 0)];
FriendlyVehicles set [count FriendlyVehicles,(_tg1 select 2)];
} else {(_tg1 select 2) allowfleeing 0;};
(_tg1 select 0) setvariable ["REFUND",_type];
if (_tank in ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]) then {
_Gid = "Sandstorm";
if (_tank == "B_MBT_01_arty_F") then {_Gid = "Scorcher";};
IDNUM = IDNUM + 1;
_Gid = _Gid + format ["%1",IDNUM];
(_tg1 select 2) setgroupid [_Gid];
[(_tg1 select 2),_tank] SPAWN {
_group = _this select 0;
_veh = (vehicle (leader _group)); 
_wP = (magazines _veh) select 0;
_vt = typeof _veh;
DONTDELGROUPS = DONTDELGROUPS +  [_group];
CantCommand = CantCommand + [_group];
// {(!(_wP in (magazines _veh)) && {!(_vt == "B_MBT_01_arty_F")}) || {(_vt == "B_MBT_01_arty_F" && {(count (magazines _veh) < 3)})}} 
_aika = time + 20;
waitUntil {sleep 5; !alive _veh || {count units _group == 0} || {(!(_wP in (magazines _veh)) && {!(_vt == "B_MBT_01_arty_F")}) || {(_vt == "B_MBT_01_arty_F" && {(count (magazines _veh) < 3)})}}};
if (_aika > time) then {[0,_this select 1] SPAWN FLandSupport;};
CARS = CARS + [_veh];
CantCommand = CantCommand + [_group];
DONTDELGROUPS = DONTDELGROUPS -  [_group];
(vehicle (leader _group)) synchronizeObjectsRemove [mudo1]; mudo1 synchronizeObjectsRemove [(vehicle (leader _group))]; 
};
};
if (_tank in ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]) exitWith {};
sleep 60;
if ({alive _x} count units (_tg1 select 2) > 1) then {(_tg1 select 2) setgroupid [_type];leader (_tg1 select 2) sidechat localize "STR_Sp1s1r6";};
} else {
//INF TEAM
_start = [getposATL player] CALL SAOKNEARVILP;
{if ((_x getvariable "Mcolor") in ["ColorBlue","ColorGreen"] && {(_x getvariable "Mtype") in ["b_recon","n_recon","b_mech_inf","n_mech_inf"]} && {_start distance player > locationposition _x distance player}) then {_start = locationposition _x;};} foreach VEHZONESA;
_d = 300;
while {vehicle player distance _start < 300} do {
sleep 0.1;
_start = [_start,_d,100,"(1 - sea)"] CALL SAOKSEEKPOS;
_d = _d + 30;
};
_classes = ["I_G_Soldier_LAT_F","I_G_Soldier_LAT_F"];
if (_type == "PMC-Team") then {_classes = ["PMC_TL","PMC_SecurityCon_MXGL","PMC_SecurityCon_MX","PMC_Engineer","PMC_Medic","PMC_FieldSpecialist_LMG","PMC_Marksman","PMC_Bodyguard1"];};
if (_type == "AA-Team") then {_classes = ["B_soldier_AA_F","B_soldier_AA_F"];};
if (_type == "INF-Team") then {_classes = [FRIENDC2 call RETURNRANDOM,FRIENDC2 call RETURNRANDOM,FRIENDC2 call RETURNRANDOM,FRIENDC2 call RETURNRANDOM];};
if (_type in ["Motorized-Squad","Paradrop-Squad"]) then {_classes = [FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM];};
_group = [_start, WEST, _classes,[],[],[0.9,1.0]] call SpawnGroupCustom;
{_x setvariable ["DAPPED",true];} foreach units _group;
if (_type == "AA-Team") then {
{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;} foreach units _group;
};
FriendlyInf set [count FriendlyInf,_group];
_posPl = [(getposATL (vehicle player) select 0) + (random 200)-(random 200), (getposATL (vehicle player) select 1)+ (random 200)-(random 200), 0];
_wp1= _group addWaypoint [_posPl, 0]; 
if (_tank in ["Motorized-Squad"]) then {_n = [_group, WEST, _posPl] SPAWN VehicleArrival;_group SPAWN {
{_x setcaptive true;} foreach units _this;
waitUntil {sleep 1; isNull _this || {count units _this == 0} || {isnull _x || {!alive _x} || {vehicle _x == _x}} count units _this > 0};
{_x setcaptive false;} foreach units _this;
};};
if (_tank in ["Paradrop-Squad"]) then {_n = [_group,WEST,_posPl] SPAWN FHaloJump;};
_group setgroupid [_type]; leader _group sidechat "Wolf, we are heading to help you shortly. ETA - few minutes. Out";
};
sleep 600 + (random 300);
//_trigger setTriggerActivation ["DELTA", "PRESENT", true];
//hint "Land Support is available again via radio channel - Delta";
} else {
(format ["%1 more prestige value needed to call land support", _price - pisteet]) SPAWN HINTSAOK;
};