private ["_disbol","_dd","_posPl","_xx","_yy","_start","_st","_tank","_tg1","_tg1wp1","_class","_random","_classes","_raa","_group2","_wp1","_nul","_sPosi","_pPosi","_distKM"];
_disbol = locationposition (["ColorRed"] CALL NEARESTCAMP) distance vehicle player;
if (_disbol > 2000) exitWith {};
_sPosi = getposATL vehicle player;
_pPosi = getposATL vehicle player;
_distKM = _disbol*0.001;
sleep (10+(random 20)*_distKM);
_posPl = _this select 0;
if (count VehicleGroups < EVEHMAX) then {
_dd = (["A"] CALL DIS);
_start = [_sPosi,_dd] CALL SAOKSEARCHPOS;
_start = [_start,400,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_max = 0;
while {_start distance vehicle player < 1200|| {_start distance (locationposition (["ColorBlue",_start] CALL NEARESTCAMP)) < 1500} || {_start distance ([_start] CALL NEARESTGUARDPOST) < 800} || {surfaceIsWater _start} || {{_start distance _x < 500} count VarBlackListE > 0} || {{_start distance (getmarkerpos _x) < (getmarkersize _x select 0)} count Bpositions > 0}} do {
_max = _max + 1;
if (_max > 5) exitWith {};
sleep 5;
_dd = (["A"] CALL DIS);
_start = [_sPosi,_dd] CALL SAOKSEARCHPOS;
_start = [_start,600,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
};
if (_max > 5) exitWith {};
_tank = (["VEH",1] CALL VEHARRAY) call RETURNRANDOM;	
_tg1 = [_start, 0, _tank, EAST] call SPAWNVEHICLE;
(_tg1 select 0) SPAWN {_this allowdamage false; sleep 10; _this allowdamage true;};

_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
//[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
VehicleGroups set [count VehicleGroups,(_tg1 select 2)];
_nul = [(_tg1 select 2),"ColorRed"] SPAWN FUNKTIO_GM;
_nul = [(_tg1 select 0), _posPl] SPAWN FUNKTIO_VS;
CARS set [count CARS,(_tg1 select 0)];
if (random 1 > VarRes) then {(_tg1 select 0) setfuel (random VarRes);};

if (_tank in ["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F"] && {random 1 < 0.7}) then {
_random = 3;
if (_tank in ["O_APC_Wheeled_02_rcws_F"]) then {_random = 3 + floor (random 2);};
_classes = [];
_raa = [ENEMYC1,ENEMYC2] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_raa call RETURNRANDOM);};
_group2 = [_start, EAST, _classes,[],[],[0.3,0.6]] call SpawnGroupCustom;

{_x moveincargo (_tg1 select 0);} foreach units _group2;
_posPl = [(_posPl select 0) + 250 - (random 500), (_posPl select 1)+ 250 - (random 500), 0];
_wp1= _group2 addWaypoint [_posPl, 0]; 
[_group2, 1] setWaypointType "GUARD";
_nul = [_group2, (_tg1 select 2)] SPAWN SAOKSHF21;
Pgroups set [count Pgroups,_group2];
}; 


};
_distKM = (locationposition (["ColorRed"] CALL NEARESTCAMP) distance vehicle player)*0.001;
sleep (10+(random 20)*_distKM);
if (_pPosi distance getposATL (vehicle player) > 1000) exitWith {};
if (random 1 < 0.3*DIFLEVEL && {count VehicleGroups < EVEHMAX}) then {
_dd = (["A"] CALL DIS);
_start = [_sPosi,_dd] CALL SAOKSEARCHPOS;
_start = [_start,400,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_max = 0;
while  {_start distance vehicle player < 1200|| {_start distance (locationposition (["ColorBlue",_start] CALL NEARESTCAMP)) < 1500} || {_start distance ([_start] CALL NEARESTGUARDPOST) < 800} || {surfaceIsWater _start} || {{_start distance _x < 500} count VarBlackListE > 0} || {{_start distance (getmarkerpos _x) < (getmarkersize _x select 0)} count Bpositions > 0}} do {
_max = _max + 1;
if (_max > 5) exitWith {};
sleep 5;
_dd = (["A"] CALL DIS);
_start = [_sPosi,_dd] CALL SAOKSEARCHPOS;
_start = [_start,600,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
};
if (_max > 5) exitWith {};
_class = (["VEH",1] CALL VEHARRAY);
_class = _class call RETURNRANDOM;	
_tg1 = [_start, 0, _class, EAST] call SPAWNVEHICLE;
(_tg1 select 0) SPAWN {_this allowdamage false; sleep 10; _this allowdamage true;};

_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
VehicleGroups set [count VehicleGroups,(_tg1 select 2)];
_nul = [(_tg1 select 2),"ColorRed"] SPAWN FUNKTIO_GM;
_nul = [(_tg1 select 0), _posPl] SPAWN FUNKTIO_VS;
CARS set [count CARS,(_tg1 select 0)];
if (random 1 > VarRes) then {(_tg1 select 0) setfuel (random VarRes);};
if (_class in ["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F"] && {random 1 < 0.3}) then {
_random = 3;
if (_class in ["O_APC_Wheeled_02_rcws_F"]) then {_random = 3 + floor (random 2);};
_classes = [];
_raa = [ENEMYC1,ENEMYC2] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_raa call RETURNRANDOM);};
_group2 = [_start, EAST, _classes,[],[],[0.3,0.6]] call SpawnGroupCustom;

{_x moveincargo (_tg1 select 0);} foreach units _group2;
_posPl = [(_posPl select 0) + 250 - (random 500), (_posPl select 1)+ 250 - (random 500), 0];
_wp1= _group2 addWaypoint [_posPl, 0]; 
[_group2, 1] setWaypointType "GUARD";
_nul = [_group2, (_tg1 select 2)] SPAWN SAOKSHF21;
Pgroups set [count Pgroups,_group2];
}; 

};
_distKM = (locationposition (["ColorRed"] CALL NEARESTCAMP) distance vehicle player)*0.001;
sleep (10+(random 20)*_distKM);
if (_pPosi distance getposATL (vehicle player) > 1000) exitWith {};
if (random 1 < 0.3*DIFLEVEL && {count VehicleGroups < EVEHMAX}) then {
_dd = (["A"] CALL DIS);
_start = [_sPosi,_dd] CALL SAOKSEARCHPOS;
_start = [_start,400,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_max = 0;
while  {_start distance vehicle player < 1200 || {_start distance (locationposition (["ColorBlue",_start] CALL NEARESTCAMP)) < 1500} || {_start distance ([_start] CALL NEARESTGUARDPOST) < 800} || {surfaceIsWater _start} || {{_start distance _x < 500} count VarBlackListE > 0} || {{_start distance (getmarkerpos _x) < (getmarkersize _x select 0)} count Bpositions > 0}} do {
_max = _max + 1;
if (_max > 5) exitWith {};
sleep 5;
_start = [_sPosi,_dd] CALL SAOKSEARCHPOS;
_start = [_start,600,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
};
if (_max > 5) exitWith {};
_class = (["VEH",1] CALL VEHARRAY); 
_class = _class call RETURNRANDOM;	
_tg1 = [_start, 0, _class, EAST] call SPAWNVEHICLE;
(_tg1 select 0) SPAWN {_this allowdamage false; sleep 10; _this allowdamage true;};

_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
VehicleGroups set [count VehicleGroups,(_tg1 select 2)];
_nul = [(_tg1 select 2),"ColorRed"] SPAWN FUNKTIO_GM;
_nul = [(_tg1 select 0), _posPl] SPAWN FUNKTIO_VS;
CARS set [count CARS,(_tg1 select 0)];
if (random 1 > VarRes) then {(_tg1 select 0) setfuel (random VarRes);};
if (_class in ["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F"] && random 1 < 0.1) then {
_random = 3;
if (_class in ["O_APC_Wheeled_02_rcws_F"]) then {_random = 3 + floor (random 2);};
_classes = [];
_raa = [ENEMYC1,ENEMYC2] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_raa call RETURNRANDOM);};
_group2 = [_start, EAST, _classes,[],[],[0.3,0.6]] call SpawnGroupCustom;

{_x moveincargo (_tg1 select 0);} foreach units _group2;
_posPl = [(_posPl select 0) + 250 - (random 500), (_posPl select 1)+ 250 - (random 500), 0];
_wp1= _group2 addWaypoint [_posPl, 0]; 
[_group2, 1] setWaypointType "GUARD";
_nul = [_group2, (_tg1 select 2)] SPAWN SAOKSHF21;
Pgroups set [count Pgroups,_group2];
}; 
};
