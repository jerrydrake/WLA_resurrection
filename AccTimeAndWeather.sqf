//WEATHER
private ["_tf","_a1","_a2","_a3","_ocast"];
if (isNil{FogOFF}) then {
_a1 = [0.1,0.3,0.4,0.7] call RETURNRANDOM;
_a2 = [0.005,0.01,0.01,0.015] call RETURNRANDOM;
_a3 = [10,40,80,100] call RETURNRANDOM;
1 setFog [random _a1,0.005 + random _a2,random _a3];
} else {1 setFog [0,0.005,0];};
sleep 30;
_tf = {
private ["_r","_tar"];
if (random 1 < 0.6) exitWith {};
sleep (random 20);
_r = [3,4,5,6,7,8,10,15] call RETURNRANDOM;
while {_r > 0 && {overcast > 0.7}} do {
_pp = getposatl player;
_tar = [(_pp select 0) + 3000 - (random 6000),(_pp select 1) + 3000 - (random 6000),0];
if (random 1 < 0.6) then {_tar = (getposATL (vehicles call RETURNRANDOM));};
if (random 1 < 0.6) then {_tar = getposATL (nearestbuilding _tar);};
_r = _r - 1;
_v = (createGroup sidelogic) createUnit ["Logic", _tar, [], 0, "NONE"];    
sleep 0.1; 
_n = [_v, 7, true] spawn BIS_fnc_moduleLightning;
sleep (1 + (random 20));
};
};

while {true} do {
if !(isNil"DisW") then {
1 setFog [0,0.005,0];
if (DisW == 1) then {600 setOvercast 0.6;} else {600 setOvercast 0.1;};
waitUntil {sleep 10; isNil"DisW"};
};
_ocast = (random 1);
if (!isNil"RainyW") then {_ocast = 0.7 + (random 0.3);};
600 setOvercast _ocast;
if (isNil"FogOFF") then {
_a1 = [0.1,0.3,0.4,0.7] call RETURNRANDOM;
_a2 = [0.005,0.01,0.01,0.015] call RETURNRANDOM;
_a3 = [10,40,80,100] call RETURNRANDOM;
(100 + (random 200)) setFog [random _a1,0.005 + random _a2,random _a3];
} else {1 setFog [0,0.005,0];};
sleep 100;
if (overcast > 0.7) then {10 setRain (random 1); };
sleep 100;
if (overcast > 0.7) then {10 setRain (random 1);};
sleep 100;
if (isNil"FogOFF") then {
_a1 = [0.1,0.3,0.4,0.7] call RETURNRANDOM;
_a2 = [0.005,0.01,0.01,0.015] call RETURNRANDOM;
_a3 = [10,40,80,100] call RETURNRANDOM;
(100 + (random 200)) setFog [random _a1,0.005 + random _a2,random _a3];
} else {1 setFog [0,0.005,0];};
if (overcast > 0.7) then {10 setRain (random 1); };
sleep 100;
if (overcast > 0.7) then {10 setRain (random 1);};
sleep 100;
if (overcast > 0.7) then {10 setRain (random 1); };
sleep 100;
};



