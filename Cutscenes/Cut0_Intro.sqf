titleCut ["","BLACK FADED",9999];
1 setFog [0,0.005,0];
//STUFF REMOVED IN STARTDIALOG.SQF
if (!(worldname in ["Altis","altis"]) || {{isClass(configFile >> "cfgVehicles" >> _x)} count ["LIB_GER_unterofficer"] > 0}) then {
{_x hideObject true;} foreach [c1,c2,c3,c4,c5,c6,c7,c8,c9,x1,x2,x3,x4,x5,s1,s2,s3,s4,s5,s6];
};
{_x setvariable ["CivNo",1];} foreach [c1,c2,c3,c4,c5,c6,c7,c8,c9];
waitUntil {sleep 0.1;!isNil"TEST_MODE"};
if (TEST_MODE) exitWith {titlecut ["","black in",3];_nul = [] SPAWN compile preprocessfileLineNumbers "StartDialog.sqf";};
{_x setbehaviour "CARELESS";_x setvariable ["DAPPED",1];} foreach [s1,s2,s3,s4,s5,s6];
{s2 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s3 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s4 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s5 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s6 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
//s1 switchmove "Acts_C_in1_briefing";
s2 switchmove "InBaseMoves_patrolling1";
s3 switchmove "InBaseMoves_patrolling2";
sleep 1;

//"introV" SPAWN SAOKPLAYSOUND;
//if (isClass(configFile >> "cfgSounds" >> "Civ1")) then {sleep 19;};
/*
juopunut
Acts_C_in1_briefing

Acts_carFixingWheel




InBaseMoves_HandsBehindBack1

LHD_krajPaluby
*/
1 cutRsc ["WLAlogo","PLAIN"];
if (isClass(configFile >> "cfgSounds" >> "Civ1")) then {playmusic (["FR_Helios_CutsceneII","FR_Helios_Intro","FR_Helios_Intro","FR_Helios_Stealth"]call RETURNRANDOM);} else {_nul = [1] SPAWN MusicT;[["WLA","CustomSounds"]] call BIS_fnc_advHint;};
_f = {
titlecut ["","black out",3];
sleep 3;
if (!isNil"ChaTime") then {
if (ChaTime != -1) then {
skiptime ChaTime;
} else {
sleep 4;
if (!isNil"SaOkDate") then {
setdate SaOkDate;
};
};
ChaTime = nil;
};
sleep 1; 
waitUntil {sleep 1; !isNil"StartMission" && {!isNil"SAbing"}};
sleep 2;
SAbing = nil;
_this cameraeffect ["terminate", "back"];
camdestroy _this;
titlecut ["","black in",3];
};
sleep 2;
if ((productVersion select 2) < 126) then {[] SPAWN {_time = time + 180; while {_time > time} do {"OUTDATED GAME VERSION, PLESE UPDATE THE GAME TO PLAY" SPAWN HINTSAOK;sleep 8;};};};
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
showcinemaBorder false;
titlecut ["","black in",3];
_camera camPrepareTarget [55621.54,97007.93,-15468.62];
_camera camPreparePos [3330.49,13186.14,6.33];
_camera camPrepareFOV 0.693;
_camera camCommitPrepared 0;
_camera camPrepareTarget [36927.23,107066.39,-7744.57];
_camera camPreparePos [3343.38,13194.02,6.06];
_camera camPrepareFOV 0.693;
_camera camCommitPrepared 17;
/*
[] SPAWN {
//0 cutRsc ["Credit0", "PLAIN",2];
sleep 1;
1 cutRsc ["Credit1", "PLAIN",2];
sleep 0.2;
if (isClass(configFile >> "cfgSounds" >> "Civ1")) then {
2 cutRsc ["Credit2", "PLAIN",2];
sleep 0.1;
3 cutRsc ["Credit3", "PLAIN",2];
sleep 0.1;
4 cutRsc ["Credit4", "PLAIN",2];
sleep 0.1;
5 cutRsc ["Credit5", "PLAIN",2];
sleep 0.1;
6 cutRsc ["Credit6", "PLAIN",2];
} else {9 cutRsc ["Credit9", "PLAIN",2];};
sleep 0.1;
7 cutRsc ["Credit7", "PLAIN",2];
sleep 0.1;
8 cutRsc ["Credit8", "PLAIN",2];
};
*/
if (isClass(configFile >> "cfgSounds" >> "Civ1")) then {
2 cutRsc ["WLAlogoSC","PLAIN"];
};
sleep 5;
sleep 6;
_nul = [] SPAWN compile preprocessfileLineNumbers "StartDialog.sqf";
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
c5 switchmove "Acts_C_in1_briefing";
//c6 switchmove "InBaseMoves_HandsBehindBack1";
_camera camPrepareTarget [-95030.66,-3939.28,-4047.92];
_camera camPreparePos [3397.67,13249.26,1.16];
_camera camPrepareFOV 0.693;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-90843.64,-19948.32,-4047.70];
_camera camPreparePos [3396.87,13252.72,1.46];
_camera camPrepareFOV 0.693;
_camera camCommitPrepared 10;
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
if (isNil"StartMission") then {titlecut ["","black out",1];};
sleep 1;
if (isNil"StartMission") then {titlecut ["","black in",1];};
c2 switchmove "HubBriefing_scratch"; 
c3 switchmove "HubBriefing_stretch"; 
c1 switchmove "HubBriefing_think";
c4 switchmove "Acts_Kore_Introducing"; 
_camera camPrepareTarget [44593.22,-77644.78,-6310.11];
_camera camPreparePos [3376.70,13247.07,1.77];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_camera camPrepareTarget [91715.26,-33190.33,-6310.18];
_camera camPreparePos [3376.70,13247.07,1.77];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 5;
c7 switchMove "Acts_AidlPercMstpSlowWrflDnon_pissing";
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
if (isNil"StartMission") then {titlecut ["","black out",1];};
sleep 1;
if (isNil"StartMission") then {titlecut ["","black in",1];};
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
c4 switchmove "Acts_Kore_PointingForward"; 
c2 switchmove "HubBriefing_scratch"; 
c3 switchmove "HubBriefing_stretch"; 
c1 switchmove "HubBriefing_think";
_camera camPrepareTarget [100622.95,-2433.83,-17234.01];
_camera camPreparePos [3375.72,13245.05,1.91];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_camera camPrepareTarget [101767.15,8557.04,-17233.72];
_camera camPreparePos [3375.72,13245.05,1.91];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
//WINDMILL
/*
_camera camPrepareTarget [-1171.46,-80252.42,-37611.95];
_camera camPreparePos [8997.11,11826.22,9.08];
_camera camPrepareFOV 0.375;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-26352.27,-77706.66,-27089.22];
_camera camPreparePos [8994.79,11817.04,5.33];
_camera camPrepareFOV 0.462;
_camera camCommitPrepared 10;
*/
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
//FORTRESS ABUSE SCENE
s5 setpos getposATL s4;
s6 setpos getposATL s4;
{_x setdir 90;} foreach [s4,s5,s6];
s4 switchmove "Acts_Abuse_abuser";
s5 switchmove "Acts_Abuse_abusing";
s6 switchmove "Acts_Abuse_Akhanteros";
_camera camPrepareTarget [79000.27,75445.49,-19171.00];
_camera camPreparePos [3175.73,13149.64,1.68];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_camera camPrepareTarget [42468.89,102668.59,-20981.06];
_camera camPreparePos [3178.13,13148.65,2.57];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
if (isNil"StartMission") then {titlecut ["","black out",1];};
sleep 1;
if (isNil"StartMission") then {titlecut ["","black in",1];};
_camera camPrepareTarget [-22497.89,-20895.68,-89009.34];
_camera camPreparePos [8969.10,11872.75,28.36];
_camera camPrepareFOV 0.732;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-22497.89,-20895.68,-89009.21];
_camera camPreparePos [8964.83,11870.02,25.61];
_camera camPrepareFOV 0.732;
_camera camCommitPrepared 10;
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
sleep 1;
if (!isNil"StartMission") exitWith {_camera SPAWN _f;};
if (isNil"StartMission") then {titlecut ["","black out",1];};
sleep 1;
if (isNil"StartMission") then {titlecut ["","black in",1];};
while {true} do {
if (!isNil"StartMission") exitWith {};
_camera camPrepareTarget [97113.57,-35668.05,-1819.22];
_camera camPreparePos [9185.80,11927.38,3.20];
_camera camPrepareFOV 0.419;
_camera camCommitPrepared 0;
_camera camPrepareTarget [101997.96,-24314.52,-8491.14];
_camera camPreparePos [9185.80,11927.38,3.20];
_camera camPrepareFOV 0.419;
_camera camCommitPrepared 9.5;
sleep 5;
if (!isNil"StartMission") exitWith {};
sleep 4;
if (!isNil"StartMission") exitWith {};
_camera camPrepareTarget [99990.34,47309.37,-22301.87];
_camera camPreparePos [9136.75,11999.02,12.88];
_camera camPrepareFOV 0.474;
_camera camCommitPrepared 0;
_camera camPrepareTarget [99990.34,47309.37,-22302.15];
_camera camPreparePos [9133.46,12007.51,12.72];
_camera camPrepareFOV 0.474;
_camera camCommitPrepared 9.5;
sleep 5;
if (!isNil"StartMission") exitWith {};
sleep 4;
if (!isNil"StartMission") exitWith {};
_camera camPrepareTarget [104040.52,23504.07,-29383.36];
_camera camPreparePos [9152.90,12033.09,5.58];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_camera camPrepareTarget [101947.24,46174.84,-14935.05];
_camera camPreparePos [9155.63,12027.07,2.39];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 9.5;
sleep 5;
if (!isNil"StartMission") exitWith {};
sleep 4;
};
titlecut ["","black out",3];
sleep 3;
if (!isNil"ChaTime") then {
if (ChaTime != -1) then {
skiptime ChaTime;
} else {
sleep 4;
if (!isNil"SaOkDate") then {
setdate SaOkDate;
};
};
ChaTime = nil;
};
waitUntil {sleep 1; !isNil"StartMission" && {!isNil"SAbing"}};
sleep 2;
SAbing = nil;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
titlecut ["","black in",3];