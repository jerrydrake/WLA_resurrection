[] SPAWN F_KGSNED;
CurTaskS = CurTaskS + ["Cutscenes\USSitRep.sqf"];
if ("USHelp" in (missionnamespace getvariable "Progress")) exitWith {};
[
WEST, // Task owner(s)
"taskUS0", // Task ID (used when setting task state, destination or description later)
["Its time to do SitRep at Chapel near Cap Agrios.", "SitRep at Chapel near Cap Agrios", "SitRep at Chapel near Cap Agrios"], // Task description
[15034.7,22744.4,0], // Task destination
"CREATED"  ] call SAOKCRTASK;
waitUntil {sleep 5; vehicle player distance [15034.7,22744.4,0] < 60};

_nul = ["taskUS0","SUCCEEDED"] call SAOKCOTASK;
_nul = [4] SPAWN MusicT;
titlecut ["","black out",2];
sleep 2;
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
showcinemaBorder false;
if (!isNil{missionnamespace getvariable "LastVeh"} &&!isNull (missionnamespace getvariable "LastVeh") && alive (missionnamespace getvariable "LastVeh")) then {(missionnamespace getvariable "LastVeh") setpos getposATL Respad_3;(missionnamespace getvariable "LastVeh") setdir (direction Respad_3);};
{_x allowdamage false; _x setpos getposATL Respad2_3;} foreach units group player;
player hideobject true;
_nul = [] SPAWN FMoveHCs;
[(player CALL SAOKNEARESTVIL),"A","Friendly"] CALL SAOKVILSET;
titlecut ["","black in",5];
_actor1 = [WEST,"B_recon_JTAC_F",150,[15028.6,22763.7,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_actor2 = [WEST,typeof player,330,[15029.4,22760.8,0],player] CALL FUNKTIO_SPAWNACTOR;
_actor2 setIdentity (missionnamespace getvariable "CIdentity");
//actor1 setidentity "Marek_Vitek";
_camera camPrepareTarget [14049.02,122374.94,-8277.87];
_camera camPreparePos [15035.60,22724.40,0.94];
_camera camPrepareFOV 0.338;
_camera camCommitPrepared 0;
_camera camPrepareTarget [14055.68,121702.20,-14216.53];
_camera camPreparePos [15035.68,22726.53,1.10];
_camera camPrepareFOV 0.338;
_camera camCommitPrepared 5;
sleep 5;
//P
_camera camPrepareTarget [-51196.74,-52107.55,2949.48];
_camera camPreparePos [15029.92,22761.73,1.51];
_camera camPrepareFOV 0.479;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-52603.78,-50862.73,-2248.71];
_camera camPreparePos [15029.92,22761.73,1.51];
_camera camPrepareFOV 0.479;
_camera camCommitPrepared 8;
titletext [((name player)+": It is what we feared, Persians are holding the island. We need to support locals and help AAF to return in power"),"PLAIN DOWN",7];
sleep 8;
_camera camPrepareTarget [-60990.21,87690.68,-2248.71];
_camera camPreparePos [15030.94,22760.13,1.48];
_camera camPrepareFOV 0.479;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-42316.14,103162.52,-15695.59];
_camera camPreparePos [15030.33,22759.90,1.75];
_camera camPrepareFOV 0.317;
_camera camCommitPrepared 8;
titletext ["US Contact #1: Understood, I will inform HQ. You will need to capture shipyard for our use so we get assets in quickly","PLAIN DOWN",7];
sleep 8;
_camera camPrepareTarget [88474.09,90253.20,7134.81];
_camera camPreparePos [15028.08,22762.66,1.31];
_camera camPrepareFOV 0.555;
_camera camCommitPrepared 0;
_camera camPrepareTarget [95196.26,82112.07,7134.81];
_camera camPreparePos [15028.06,22763.01,1.48];
_camera camPrepareFOV 0.555;
_camera camCommitPrepared 5;
titletext ["US Contact #1: Here is detailed orders from HQ. Good luck","PLAIN DOWN",7];
sleep 3;
titlecut ["","black out",3];
sleep 3;
titletext ["","PLAIN DOWN",7];
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
{_x allowdamage true;} foreach units group player;
player hideobject false;
deletevehicle _actor1;
deletevehicle _actor2;
{_x SPAWN FClone;} foreach units group player - [player];
titlecut ["","black in",2];
CurTaskS = CurTaskS - ["Cutscenes\USSitRep.sqf"];
_nul = [] execVM "MainTasks\US1.sqf";
["D"] SPAWN F_KGSNED;



