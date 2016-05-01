private ["_dd","_class","_posPl","_raa","_xx","_yy","_start","_tank","_tg1","_tg1wp1","_wp1","_group2","_group3","_random","_pPosi","_classes","_nul","_roads","_flare","_sPosi","_st","_n","_ran","_distKM"];
if ({side _x ==  WEST} count allUnits > 45) exitWith {};
if ((locationposition (["ColorBlue"] CALL NEARESTCAMP) distance vehicle player > 2000)) exitWith {
if (random 1 < 0.3 && {"USHelp" in (missionnamespace getvariable "Progress")} && {isNil"IFENABLED"}) then {
_pPosi = getposATL (vehicle player);
_raa = [FRIENDC1,FRIENDC2,FRIENDC3] call RETURNRANDOM;
_random = 3 + floor (random 3);
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_raa call RETURNRANDOM);};
_tank = (["AIRC",0] CALL VEHARRAY)+(["AIRC",2] CALL VEHARRAY); 
_tank = _tank call RETURNRANDOM;	
_pPosi = getposATL (vehicle player);
_nul = [getmarkerpos "InsertionM", [(_pPosi select 0)+ 500 - (random 1000),(_pPosi select 1)+ 500 - (random 1000),0], [(_pPosi select 0)+ 500 - (random 1000)*0.5,(_pPosi select 1)+ 500 - (random 1000)*0.5,0], WEST, 180, _tank, 50,_classes,[0.6,0.7],0,1] SPAWN FUNKTIO_ChopperTransportF;
};
};
_distKM = (locationposition (["ColorBlue"] CALL NEARESTCAMP) distance vehicle player)*0.001;
sleep (10+(random 20)*_distKM);
//US Vehicles
if (random 1 < 0.3 && {count FriendlyInf < FINFMAX}) then {
_dd = (["Lc"] CALL DIS);
_xx = random _dd;
_yy = _dd - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_pPosi = getposATL (vehicle player);
_sPosi = locationposition (["ColorBlue"] CALL NEARESTCAMP);
_start = [(_sPosi select 0) + _xx,( _sPosi select 1) + _yy,0];
_roads = (_start nearRoads 650);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};  
while  {_start distance vehicle player < 1000 || {surfaceIsWater _start} || {{_start distance _x < 500} count VarBlackListF > 0}} do {
sleep 5;
_dd = (["Lc"] CALL DIS);
_xx = random _dd;
_yy = _dd - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_pPosi = getposATL (vehicle player);
_start = [(_sPosi select 0) + _xx,( _sPosi select 1) + _yy,0];
_roads = (_start nearRoads 650);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};  
};
//"B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"
_tank = (["C",3] CALL VEHARRAY);	
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {
_tank = _tank + (["C",2] CALL VEHARRAY);	
};
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_tank = _tank + (["C",1] CALL VEHARRAY);};

_tank = _tank call RETURNRANDOM;
_tg1 = [_start, 0, _tank, WEST] call SPAWNVEHICLE;

_pPosi = getposATL (vehicle player);
_posPl = [(_pPosi select 0) + 200 -(random 400), (_pPosi select 1)+ 200 -(random 400), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
[(_tg1 select 2), 1] setWaypointType "GUARD";
//NAPAveh set [count NAPAveh,(_tg1 select 2)];
_nul = [(_tg1 select 2),"ColorRed"] SPAWN FUNKTIO_GM; 
_nul = [(_tg1 select 0), _posPl] SPAWN FUNKTIO_VS;
CARS set [count CARS,(_tg1 select 0)];
//FriendlyVehicles set [count FriendlyVehicles,(_tg1 select 2)];

if (_tank in ["I_APC_tracked_03_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","C_Offroad_01_F","I_MRAP_03_F","I_Truck_02_covered_F","I_Truck_02_transport_F","B_Truck_01_transport_F","B_Truck_01_covered_F"] && {count FriendlyInf < 3}) then {
_random = 2 + floor (random 1);
if (_tank in ["C_Offroad_01_F","B_G_Offroad_01_F"]) then {_random = 3 + floor (random 3);};
if (_tank in ["I_Truck_02_covered_F","I_Truck_02_transport_F","B_Truck_01_transport_F","B_Truck_01_covered_F"]) then {_random = 4 + floor (random 3);};
_classes = [];
_raa = [FRIENDC1,FRIENDC2,FRIENDC3] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_raa call RETURNRANDOM);};
_group2 = [_start, WEST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;

if (!("USHelp" in (missionnamespace getvariable "Progress")) || {random 1 < 0.3}) then {{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;sleep 0.1;} foreach units _group2;};
{_x moveincargo (_tg1 select 0);} foreach units _group2;
_pPosi = getposATL (vehicle player);
_posPl = [(_pPosi select 0) +100-(random 200), (_pPosi select 1)+100-(random 200), 0];
_wp1= _group2 addWaypoint [_posPl, 0]; 
[_group2, 1] setWaypointType "GUARD";
_nul = [_group2, (_tg1 select 2)] SPAWN SAOKSHF22;
_nul = [_group2,"ColorGreen"] SPAWN FUNKTIO_GM;
FriendlyInf set [count FriendlyInf,_group2];


{
_flare = ["UGL_FlareGreen_F","UGL_FlareWhite_F","UGL_FlareYellow_F"] call RETURNRANDOM;
if (typeof _x ==  "B_Soldier_GL_F" || {typeof _x ==  "B_Soldier_SL_F"}) then {_nul = [_x,"GL_3GL_F",_flare] SPAWN FUNKTIO_AIFLARE;};
sleep 0.1;
} foreach units _group2;
}; 
};
_distKM = (locationposition (["ColorBlue"] CALL NEARESTCAMP) distance vehicle player)*0.001;
sleep (10+(random 20)*_distKM);
if (random 1 < 0.3 && {count FriendlyVehicles < FVEHMAX} && {("GreenHelp" in (missionnamespace getvariable "Progress"))}) then {
_dd = (["Lc"] CALL DIS);
_xx = random _dd;
_yy = _dd - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_pPosi = getposATL (vehicle player);
_sPosi = locationposition (["ColorBlue"] CALL NEARESTCAMP);
_start = [(_sPosi select 0) + _xx,( _sPosi select 1) + _yy,0];
_roads = (_start nearRoads 650);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};  
while  {_start distance vehicle player < 1000 || {surfaceIsWater _start} || {{_start distance _x < 500} count VarBlackListF > 0}} do {
sleep 5;
_dd = (["Lc"] CALL DIS);
_xx = random _dd;
_yy = _dd - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_pPosi = getposATL (vehicle player);
_start = [(_sPosi select 0) + _xx,( _sPosi select 1) + _yy,0];
_roads = (_start nearRoads 650);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};  
};
_tank = (["VEH",3] CALL VEHARRAY);	
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {
_tank = _tank + (["VEH",2] CALL VEHARRAY);	
};
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_tank = _tank + (["VEH",1] CALL VEHARRAY);};
_tank = _tank call RETURNRANDOM;	
_tg1 = [_start, 0, _tank, WEST] call SPAWNVEHICLE;

_pPosi = getposATL (vehicle player);
_posPl = [(_pPosi select 0) + 200 -(random 400), (_pPosi select 1)+ 200 -(random 400), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
[(_tg1 select 2), 1] setWaypointType "GUARD";
NAPAveh set [count NAPAveh,(_tg1 select 2)];
_nul = [(_tg1 select 2),"ColorRed"] SPAWN FUNKTIO_GM;
_nul = [(_tg1 select 0), _posPl] SPAWN FUNKTIO_VS;
CARS set [count CARS,(_tg1 select 0)];
FriendlyVehicles set [count FriendlyVehicles,(_tg1 select 2)];
};
_distKM = (locationposition (["ColorBlue"] CALL NEARESTCAMP) distance vehicle player)*0.001;
sleep (10+(random 20)*_distKM);
//Air
if (random 15 < VarFS && {"GreenHelp" in (missionnamespace getvariable "Progress")}) then {
if (random 1 < 0.3 || {!("USHelp" in (missionnamespace getvariable "Progress"))}) then {
_class = (["AIRF",2] CALL VEHARRAY);
if (isClass(configFile >> "cfgVehicles" >> "JS_JC_FA18E")) then {
_class = _class + ["JS_JC_FA18E","JS_FA18F"];
};
_pPosi = getposATL (vehicle player);
_class = _class call RETURNRANDOM;	
_tg1 = [[5758.18,12613.9,100], 300, _class, WEST] call SPAWNVEHICLE;
_posPl = [(_pPosi select 0) + 200 -(random 400), (_pPosi select 1) + 200 -(random 400), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
[(_tg1 select 2), 1] setWaypointType "GUARD";
_nul = [(_tg1 select 2), [4645.2,2553.59,0],500] SPAWN FUNKTIO_MAD;
} else {
_pPosi = getposATL (vehicle player);
_class = (["AIRF",0] CALL VEHARRAY)+(["AIRARMC",0] CALL VEHARRAY);
_class = _class call RETURNRANDOM;	
_tg1 = [[7730.63,6171.94,50], 0, _class, WEST] call SPAWNVEHICLE;

CantCommand set [count CantCommand,_tg1 select 2];
_posPl = [(_pPosi select 0) + 200 -(random 400), (_pPosi select 1) + 200 -(random 400), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
[(_tg1 select 2), 1] setWaypointType "GUARD";
_nul = [(_tg1 select 2), [7730.63,6171.94,0],500] SPAWN FUNKTIO_MAD;
};
};
_distKM = (locationposition (["ColorBlue"] CALL NEARESTCAMP) distance vehicle player)*0.001;
sleep (10+(random 20)*_distKM);
//US Units
if (random 1 < 0.3 && {count FriendlyInf < FINFMAX}) then {
if (random 1 < 0.5 && {("USHelp" in (missionnamespace getvariable "Progress"))} && {isNil"IFENABLED"}) then {
_raa = [FRIENDC1,FRIENDC2,FRIENDC3] call RETURNRANDOM;
_random = 2 + floor (random 2);
_classes = [];
for "_i" from 0 to _random do {_classes pushback (_raa call RETURNRANDOM);};
_tank = (["AIRC",0] CALL VEHARRAY)+(["AIRC",2] CALL VEHARRAY); 
_tank = _tank call RETURNRANDOM;	
_pPosi = getposATL (vehicle player);
_nul = [getmarkerpos "InsertionM", [(_pPosi select 0)+ 500 - (random 1000),(_pPosi select 1)+ 500 - (random 1000),0], [(_pPosi select 0)+ 500 - (random 1000)*0.5,(_pPosi select 1)+ 500 - (random 1000)*0.5,0], WEST, 180, _tank, 50,_classes,[0.6,0.7],0,1] SPAWN FUNKTIO_ChopperTransportF;

} else {
_dd = (["Lb"] CALL DIS);
_xx = random _dd;
_yy = _dd - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_pPosi = getposATL (vehicle player);
_sPosi = locationposition (["ColorBlue"] CALL NEARESTCAMP);
_start = [(_sPosi select 0) + _xx,(_sPosi select 1) + _yy,0];
_start = [_start,400,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
sleep 0.1;
_roads = (_start nearRoads 650);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};  
while {_start distance vehicle player < 600 || {surfaceIsWater _start} || {{_start distance _x < 500} count VarBlackListF > 0}} do {
sleep 5;
_dd = (["Lb"] CALL DIS);
_xx = random _dd;
_yy = _dd - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_pPosi = getposATL (vehicle player);
_start = [(_sPosi select 0) + _xx,(_sPosi select 1) + _yy,0];
_start = [_start,400,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
sleep 0.1;
_roads = (_start nearRoads 650);
if (count _roads > 0) then {_start = getposATL (_roads select 0);};  
};
_random = 2 + floor (random 2);
_classes = [];
_ran = [FRIENDC1,FRIENDC2,FRIENDC3] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_ran call RETURNRANDOM);};
_group3 = [_start, WEST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;sleep 0.1;} foreach units _group3;
_posPl = [(_pPosi select 0) +100-(random 200), (_pPosi select 1)+100-(random 200), 0];
_wp1= _group3 addWaypoint [_posPl, 0]; 
[_group3, 1] setWaypointType "GUARD";
_nul = [_group3,"ColorGreen"] SPAWN FUNKTIO_GM;
FriendlyInf set [count FriendlyInf,_group3];
if (random 1 < 0.5) then {_n = [_group3,WEST,_start] SPAWN FHaloJump;};

{
_flare = ["UGL_FlareGreen_F","UGL_FlareWhite_F","UGL_FlareYellow_F"] call RETURNRANDOM;
if (typeof _x ==  "B_Soldier_GL_F" || {typeof _x ==  "B_Soldier_SL_F"}) then {_nul = [_x,"GL_3GL_F",_flare] SPAWN FUNKTIO_AIFLARE;};
sleep 0.1;
} foreach units _group3;
};
};
