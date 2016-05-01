/*
_light1 = "#lightpoint" createVehicleLocal _pos;  
_light1 setLightAmbient [0.787919, 0.123304, 0]; 
_light1 setLightColor [0.748461, 0.118371, 0.0037087]; 
_light1 setLightAttenuation [8.09501,15.2896,26.733,4.31918e-005];
_light1 setLightIntensity 7263.81;
_light1 setLightUseFlare true;
_light1 setLightFlareSize 5.85701; 
_light1 setLightFlareMaxDistance 1000;
_light1 setLightDayLight true;


_light1 = "#lightpoint" createVehicleLocal _pos;  
_light1 setLightAmbient [1, 1, 1]; 
_light1 setLightColor [1, 1, 1]; 
_light1 setLightAttenuation [2.17648,25.647,42.5158,21.7014];
_light1 setLightIntensity 1000;
_light1 setLightUseFlare true;
_light1 setLightFlareSize 10; 
_light1 setLightFlareMaxDistance 100;
_light1 setLightDayLight true;

*/
SAOKALARMLIGHT1 = {
private ["_light1"];
_forttyp = ["Land_Cargo_Tower_V3_F","Land_Cargo_House_V3_F","Land_Cargo_Patrol_V2_F","Land_Cargo_HQ_V1_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_HBarrierTower_F","Land_BagBunker_Small_F"];
_house = objNull;
while {isNull _house && {count _forttyp > 0}} do {_c = _forttyp call RETURNRANDOM; _forttyp = _forttyp - [_c]; _house = nearestObject [player, _c];sleep 0.1;};
if (isNull _house) exitWith {};

_waypoints = _building call SAOKBUILDINGPOS;
if (count _waypoints == 0) exitWith {};

_pos = _house buildingPos (_waypoints call RETURNRANDOM);
_pos = [_pos select 0,_pos select 1,(_pos select 2)+1.5];

_light1 = "#lightpoint" createVehicleLocal _pos;  
_light1 setLightAmbient [0.787919, 0.123304, 0]; 
_light1 setLightColor [0.748461, 0.118371, 0.0037087]; 
_light1 setLightAttenuation [2.17648,25.647,42.5158,21.7014];
_light1 setLightIntensity 263.81;
_light1 setLightUseFlare true;
_light1 setLightFlareSize 4.85701; 
_light1 setLightFlareMaxDistance 1000;
_light1 setLightDayLight true;
_n = 1;
_m = 1;
_aika = time + 20;
while {_aika > time} do {
_light1 setLightIntensity (_n*263.81);
_light1 setLightFlareSize (_n*4.85701); 
sleep 0.01;
if (_m > 0) then {_n = _n - 0.04;} else {_n = _n + 0.04;};
if (_n > 1) then {_m = 1;};
if (_n <= 0) then {_m = 0;sleep 0.2;}; 
};
deletevehicle _light1;
/*
NUMM = NUMM + 1;
_someId = format ["LIGHTALARM%1",NUMM];
[_someId, "onEachFrame", {
	_light1 = _this;
	_d = 0;
	_n = 
	_light1 setLightIntensity (_n*7263.81);
	_light1 setLightFlareSize (_n*5.85701); 
}, _light1] call BIS_fnc_addStackedEventHandler;
sleep _timeS;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
*/
};
