private ["_c","_v1","_v2","_v3","_func","_hndl","_hndl2","_ran","_nul"];
_func = {
private ["_rmusic","_w"];
missionnamespace setvariable ["SaOkHealed",1];
_this allowdamage false;
_rmusic = ["FR_Helios_CalmIII","FR_Helios_CalmII","FR_Helios_Calm","FR_Helios_Intro"] call RETURNRANDOM;
[_rmusic] SPAWN MusicP;
titlecut ["","black out",7];
sleep 7;
skiptime ((random 3.2)+0.05);
_this switchmove "Acts_UnconsciousStandUp_part1";
sleep 4;
_this setHit ["legs", 0];
titlecut ["","black in",7];
_w = (missionnamespace getvariable "ResTT");
sleep _w;
titlecut ["","black out",0.5];
sleep 0.5;
_this switchmove "";
sleep 0.2;
titlecut ["","black in",0.5];
missionnamespace setvariable ["SaOkHealed",nil];
_this allowdamage true;
_this switchmove "";
};
waitUntil {sleep 1; !isNil"StartMission"};
waitUntil {sleep 20; !isNil"PNEEDS"};
waitUntil {sleep 5; !isNil"TVasynyt" || {!isNil"TJano"} || {!isNil"TNalka"}};
sleep (180 + (random 180));
if (!isNil"PNEEDS") then {
_hndl = ppEffectCreate ["RadialBlur", 452];
_hndl ppEffectEnable TRUE;
_hndl ppEffectAdjust [0.0017,0.0017,0.1,0.1];
_hndl ppEffectCommit (2+(random 3));
_hndl2 = ppEffectCreate ["DynamicBlur", 451];
_hndl2 ppEffectEnable TRUE;
_hndl2 ppEffectAdjust [random 0.233];
_hndl2 ppEffectCommit (2+(random 3));
sleep 5;
"Blurry vision effects from player needs, can be disabled in shift+1 options" SPAWN HINTSAOK;
} else {waitUntil {sleep 20; !isNil"PNEEDS"};};
while {true} do {
if (isNil"PNEEDS") then {
_hndl ppEffectAdjust [0,0,0,0];_hndl ppEffectCommit (2+(random 3));
_hndl2 ppEffectAdjust [0];_hndl2 ppEffectCommit (2+(random 3));
waitUntil {sleep 20; !isNil"PNEEDS"};
};
_c = 0; 
if (!isNil"TVasynyt") then {_c = _c + 1;};
if (!isNil"TNalka") then {_c = _c + 1;};
if (!isNil"TJano") then {_c = _c + 1;};
_v1 = _c * 0.0017;
_v2 = _c * 0.1;
_v3 = _c * 0.233;
if (_c > 2 && {random 1 < 0.015} && {vehicle player == player} && {isNil{missionnamespace getvariable "SaOkHealed"}}) then {
_hndl ppEffectAdjust [0.0117,0.0117,0.7,0.7];
_hndl ppEffectCommit 7;
_hndl2 ppEffectAdjust [10];
_hndl2 ppEffectCommit 7;
player SPAWN _func;
sleep 8;
{
if (!isNil"TVasynyt" && {[_x] CALL BIS_fnc_taskExists}) then {
TVasynyt = nil;
_ran = 10 + (random 30);
_nul = [_x,"SUCCEEDED"] call SAOKCOTASK;
_x SPAWN {
private ["_n"];
sleep 60; _n = [_this] CALL BIS_fnc_deleteTask;};
}
} foreach ["TaskVasynyt"];
};
if (_c == 0) then {
_hndl ppEffectAdjust [0,0,0,0];_hndl ppEffectCommit (2+(random 3));
_hndl2 ppEffectAdjust [0];_hndl2 ppEffectCommit (2+(random 3));
waitUntil {sleep 5; !isNil"TVasynyt" || {!isNil"TJano"} || {!isNil"TNalka"}};
sleep (180 + (random 180));
};
if (random 1 < 0.5) then {_hndl ppEffectAdjust [random _v1,random _v1,random _v2,random _v2];_hndl ppEffectCommit (2+(random 3));};
if (random 1 < 0.7) then {_hndl2 ppEffectAdjust [random _v3];_hndl2 ppEffectCommit (2+(random 3));};
sleep 5;
};
