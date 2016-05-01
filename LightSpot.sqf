private ["_light1","_center","_whereTo","_start","_dist"];
_center = _this;

_light1 = "#lightpoint" createVehicleLocal _center; 
_light1 setLightBrightness 1.0; 
_light1 setLightAmbient [0.0, 0.0, 0.0]; 
_light1 setLightColor [1.0, 1.0, 1.0]; 
_light1 setLightAttenuation [15,0,80,4.31918e-005];
_light1 setLightIntensity 1000;
_light1 setLightUseFlare true;
ang1 = 0;
/*
_someId = "LG";
[_someId, "onEachFrame", {
	ang1 = ang1 + 0.5;
	_xB = 30;
	_yB = 30;
	_pP = getposATL (_this select 1);
	_light1 = _this select 0;
	_light1 setpos [(_pP select 0)+((sin ang1)*_xB),(_pP select 1)+((cos ang1)*_yB),3];
}, [_light1,player]] call BIS_fnc_addStackedEventHandler;
*/


while {player distance _this < 2000} do {
sleep (random 12);
if (_light1 distance _this > 600) then {_light1 setpos [(_this select 0)+300-(random 600),(_this select 1)+300-(random 600),0];};
if (player distance _light1 > 3) then {
_whereTo = [(_center select 0)+300-(random 600),(_center select 1)+300-(random 600),0];
if (_whereTo distance _center < 50) then {
_u = (getposATL player) nearEntities [["Man"],200];
if (count _u > 0) then {
_center2 = getposATL (_u call RETURNRANDOM);
_whereTo = [(_center2 select 0)+30-(random 60),(_center2 select 1)+30-(random 60),0];
} else {
_whereTo = [(_center select 0)+300-(random 600),(_center select 1)+300-(random 600),0];
};
};

_start = getposATl _light1;
//_whereTo = getposATL player;
_dist = _start distance _whereTo;
_timeS = (_dist / (9+random 19));
_time = _timeS * diag_fps; 
_Dx = ((_start select 0) - (_whereTo select 0));
_Dy = ((_start select 1) - (_whereTo select 1));
_perSx = _Dx / _time;
_perSy = _Dy / _time;

NUMM = NUMM + 1;
_someId = format ["LIGHSPOT%1",NUMM];
[_someId, "onEachFrame", {
	_light1 = _this select 0;
	_perSx = _this select 1;
	_perSy = _this select 2;
	_c = getposATL _light1;
	_light1 setpos [(_c select 0) - _perSx,(_c select 1) - _perSy,6];
}, [_light1,_perSx,_perSy]] call BIS_fnc_addStackedEventHandler;
sleep _timeS;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
};

};
deletevehicle _light1;