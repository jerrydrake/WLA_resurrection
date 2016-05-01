titlecut ["","black out",2];
_all = [];
//BOATS _nul = [] execVM "Cutscenes\Cut2_GreenArrive.sqf";
_tar = objNull;
_i = 0;
{
_tg2 = [_x, 10, "I_Boat_Armed_01_minigun_F", WEST] call SPAWNVEHICLE;
(_tg2 select 2) move [7243.4,10740.1,0];
_all set [count _all, (_tg2 select 0)];
if (_i == 1) then {_tar = (_tg2 select 0);};
_all = _all + (units (_tg2 select 2));
_i = _i + 1;
} foreach [[6916.98,9050.4,0],[6751.85,9069.61,0],[6736.49,8950.56,0],[6963.06,8962.08,0]];

//CHOPPERS
_i = 0;
_tar2 = objNull;
{
_tg2 = [_x, 10, "I_Heli_light_03_unarmed_F", WEST] call SPAWNVEHICLE;
(_tg2 select 2) move [7980.25,12359.3,0];
_all set [count _all, (_tg2 select 0)];
if (_i == 1) then {_tar2 = (_tg2 select 0);};
_all = _all + (units (_tg2 select 2));
_i = _i + 1;
} foreach [[6298.7,8267,0],[5826.36,8489.73,0]];

{
_tg2 = [_x, 10, "I_Heli_Transport_02_F", WEST] call SPAWNVEHICLE;
(_tg2 select 2) move [7980.25,12359.3,0];
_all set [count _all, (_tg2 select 0)];
_all = _all + (units (_tg2 select 2));
} foreach [[6161.87,8139.14,0]];
//WAYTPOINT[7243.4,10740.1,0]
sleep 4;
_rmusic = ["FR_Helios_Intro"]call RETURNRANDOM;
[_rmusic] SPAWN MusicP;
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
showcinemaBorder false;
titlecut ["","black in",3];
_camera camPrepareTarget [74159.54,-40663.34,-54673.70];
_camera camPreparePos [6731.35,8969.63,7.40];
_camera camPrepareFOV 0.929;
_camera camCommitPrepared 0;
//_camera camPrepareTarget [72320.02,76575.26,-33572.71]; _tar
_camera camPrepareTarget _tar;
_camera camPreparePos [6731.34,8969.64,7.43];
_camera camPrepareFOV 0.929;
_camera camCommitPrepared 13;
sleep 13;
[
["GREEN ARMY APPOARCHING EDESSA BAY"]
] spawn BIS_fnc_typeText;
//_camera camPrepareTarget [50072.95,94084.18,-29478.50];
_camera camPrepareTarget _tar;
_camera camPreparePos [6570.38,9040.53,103.62];
_camera camPrepareFOV 0.409;
_camera camCommitPrepared 0;
//_camera camPrepareTarget [50072.95,94084.18,-29478.51];
_camera camPrepareTarget _tar;
_camera camPreparePos [6551.76,9097.20,103.46];
_camera camPrepareFOV 0.409;
_camera camCommitPrepared 17;
sleep 17;
//_camera camPrepareTarget [-90941.75,27947.26,291.78];
_camera camPrepareTarget _tar2;
_camera camPreparePos [7293.83,9247.32,7.99];
_camera camPrepareFOV 0.269;
_camera camCommitPrepared 0;
//_camera camPrepareTarget [-85876.88,45567.23,291.79];
_camera camPrepareTarget _tar2;
_camera camPreparePos [7293.83,9247.32,7.93];
_camera camPrepareFOV 0.469;
_camera camCommitPrepared 8;
sleep 8;
//OVER 
_camera camPrepareTarget [-12962.21,91174.36,-53516.97];
_camera camPreparePos [7123.52,9241.05,263.16];
_camera camPrepareFOV 0.377;
_camera camCommitPrepared 0;
_camera camPrepareTarget [11974.37,107430.59,-18142.64];
_camera camPreparePos [7061.14,9261.91,263.06];
_camera camPrepareFOV 0.325;
_camera camCommitPrepared 15;
sleep 12;
titlecut ["","black out",3];
3 fadeMusic 0;
3 fadeSound 0;
sleep 3;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
{_x spawn SAOKDELETE;} foreach _all;
titlecut ["","black in",3];
1 fadeMusic 0.5;
1 fadeSound 0.5;