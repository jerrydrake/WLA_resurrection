
private ["_pP","_ranP","_R","_tar","_rangeMid","_Rmid","_nul","_road","_cRoads","_road2","_tcc","_pR","_pR2","_di","_range","_mid","_mar","_marker","_Lna","_Tid","_header","_desc","_someId3","_aika","_dir","_class","_tg2","_tg1","_wp0","_wp1","_someId","_someId2"];
_pP = getposATL player;
_ranP = [(_pP select 0)+2000-(random 4000),(_pP select 1)+2000-(random 4000),0];
sleep 0.1;
_R = _ranP nearroads 400;
while {count _R == 0} do {
sleep 1;
_pP = getposATL player;
_ranP = [(_pP select 0)+2000-(random 4000),(_pP select 1)+2000-(random 4000),0];
sleep 0.1;
_R = _ranP nearroads 400;
};
_road = _R select 0;
_cRoads = roadsConnectedTo _road;
_road2 = _cRoads call RETURNRANDOM;	
_tcc = (ARMEDSUPPORT select 1);

_pR = getposATL _road;
_pR2 = getposATL _road2;

_tar = locationposition (["ColorRed",getposATL _road] CALL NEARESTCAMP);
while {_tar distance _pR < 2000} do {_tar = getmarkerpos (FacMarkers call RETURNRANDOM);sleep 0.1;};

_di= [_pR, _tar] call SAOKDIRT;
_range = if (_tar distance _pR < 4000) then {(_tar distance _pR)*0.5} else {2000};
_mid = [(_pR select 0)+(sin _di)*_range,(_pR select 1)+(cos _di)*_range,0];
_rangeMid = 100;
_Rmid = _mid nearroads _rangeMid;
while {count _Rmid == 0} do {_rangeMid = _rangeMid + 100;_Rmid = _mid nearroads _rangeMid;sleep 0.1;if (_rangeMid > 3000) exitWith {};};
if (_rangeMid > 3000) exitWith {};
_mid = getposATL (_Rmid call RETURNRANDOM);

NUMM=NUMM+1;
_mar = format ["TaskConM%1",NUMM];
_marker = [_mar,_mid, "hd_flag", [0.5,0.5], "ColorRed", "Ambush and Destroy Convoy"] CALL FUNKTIO_CREATEMARKER;

_Lna = _mid CALL NEARESTLOCATIONNAME;
NUMM=NUMM+1;
_Tid = format ["TaskConv%1",NUMM];
_header = format ["Destroy Convoy near %1",_Lna];
_desc =("We have received intel of halted CSAT convoy that should pass this marked zone soon. We may have some time to head there before it moves again.");
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
objNull, // Task destination
"CREATED"  
] call SAOKCRTASK;
NUMM = NUMM + 1;
//icon = "\A3\ui_f\data\map\markers\nato\o_support.paa";
_someId3 = format ["ICONCON%1",NUMM];
[_someId3, "onEachFrame", {
drawIcon3D ["\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_launchers_CA.paa", ICONCOLOR, _this, 1.0, 1.0, 0, (format ["Strike CSAT Convoy around here: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _mid] call BIS_fnc_addStackedEventHandler;

_aika = time + 300;
waitUntil {sleep 4; player distance _mid < 200 || {player distance _pR < 1000} || {_aika < time}};

[_someId3, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
if (_aika < time) exitWith {_nul = [_Tid,"FAILED"] call SAOKCOTASK;deletemarker _marker;};
BaseR globalchat "Wolf, the CSAT convoy is moving again. Be ready. Out";
sleep 10;
_dir = [_pR2,_pR] call SAOKDIRT;
_class = _tcc call RETURNRANDOM;
_tg2 = [_pR2, _dir, _class, EAST] call SPAWNVEHICLE;
_class = _tcc call RETURNRANDOM;
_tg1 = [_pR, _dir, _class, EAST] call SPAWNVEHICLE;
(units (_tg2 select 2)) join (_tg1 select 2);
_wp0= (_tg1 select 2) addWaypoint [_mid, 0]; 
_wp1= (_tg1 select 2) addWaypoint [_tar, 0]; 
NUMM = NUMM + 1;
_someId = format ["ICONCON%1",NUMM];
[_someId, "onEachFrame", {
drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORRED, getposATL _this, 0.5, 0.5, 0, (format ["Truck",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, (_tg1 select 0)] call BIS_fnc_addStackedEventHandler;
NUMM = NUMM + 1;
_someId2 = format ["ICONCON%1",NUMM];
[_someId2, "onEachFrame", {
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORRED, getposATL _this, 0.5, 0.5, 0, (format ["Truck",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, (_tg2 select 0)] call BIS_fnc_addStackedEventHandler;
waitUntil {sleep 3; {player distance _x < 3500} count [(_tg2 select 0),(_tg1 select 0),_mid] == 0 || {{!isNull _x && {alive _x} && {{alive _x} count crew _x > 0}} count [(_tg2 select 0),(_tg1 select 0)]  == 0}};
deletemarker _marker;
if ({alive _x && {{alive _x} count crew _x > 0}} count [(_tg2 select 0),(_tg1 select 0)]  == 0) then {
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
pisteet = pisteet + 350;
_nul = [350, "Convoy Destroyed"] SPAWN PRESTIGECHANGE;
} else {_nul = [_Tid,"FAILED"] call SAOKCOTASK;};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
[_someId2, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
CARS set [count CARS, (_tg2 select 0)];
CARS set [count CARS, (_tg1 select 0)];
