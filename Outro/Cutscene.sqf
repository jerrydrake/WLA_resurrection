private ["_camera"];
if (worldname != "Altis") exitWith {endmission "END1";};
{_x setbehaviour "CARELESS";} foreach [s1,s2,s3];
{s1 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s2 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s3 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s4 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s5 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
{s6 disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
removeHeadgear s3;
removeGoggles s3;
s3 unlinkItem "NVGoggles_OPFOR";
s1 switchmove "InBaseMoves_patrolling1";
titleCut ["","BLACK FADED",9999];
0 fadeMusic 0.7;
0 fadeSound 0.2;
/*
ANIMATIONS
kohti kavely ja hopina Acts_A_M04_briefing
Acts_Abuse_abuser
Acts_Abuse_abusing
Acts_Abuse_Akhanteros
Acts_Ending_Adams2  13
Acts_Ending_Lacey2 13

Acts_Kore_TalkingOverRadio_loop

Acts_PercMstpSlowWrflDnon_handup2   1bc

Acts_ShowingTheRightWay_loop
Acts_listeningToRadio_Loop
Acts_SittingWounded_loop
*/
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
showcinemaBorder false;
titlecut ["","black in",5];
s3 switchMove "Acts_SittingWounded_loop";
_camera camPrepareTarget [-41898.98,-76925.46,-5467.43];
_camera camPreparePos [4109.47,11690.26,1.21];
_camera camPrepareFOV 0.424;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-52275.13,-70713.36,-5467.54];
_camera camPreparePos [4109.73,11690.11,1.21];
_camera camPrepareFOV 0.424;
_camera camCommitPrepared 10;
sleep 10;
s2 switchMove "Acts_listeningToRadio_Loop";
_camera camPrepareTarget [97970.04,-22550.39,-3784.01];
_camera camPreparePos [4092.76,11689.73,1.16];
_camera camPrepareFOV 0.299;
_camera camCommitPrepared 0;
_camera camPrepareTarget [100606.60,-14384.98,-2229.21];
_camera camPreparePos [4092.64,11689.40,1.32];
_camera camPrepareFOV 0.299;
_camera camCommitPrepared 6;
sleep 6;
_camera camPrepareTarget [-35367.96,-77761.84,-20950.15];
_camera camPreparePos [4095.02,11690.99,1.50];
_camera camPrepareFOV 0.425;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-35367.96,-77761.84,-20950.21];
_camera camPreparePos [4095.20,11690.91,1.48];
_camera camPrepareFOV 0.425;
_camera camCommitPrepared 6;
sleep 5;
titlecut ["","black out",1];
sleep 1;
titlecut ["","black in",1];
s3 switchMove "Acts_SittingWounded_loop";
//Wounded CSAT
_camera camPrepareTarget [45608.92,101625.40,-13153.63];
_camera camPreparePos [4055.38,11629.63,7.01];
_camera camPrepareFOV 0.203;
_camera camCommitPrepared 0;
_camera camPrepareTarget [47470.42,101030.80,-11033.66];
_camera camPreparePos [4055.33,11629.97,6.96];
_camera camPrepareFOV 0.203;
_camera camCommitPrepared 10;
sleep 10;
_camera camPrepareTarget [101038.63,-8735.46,13431.38];
_camera camPreparePos [4056.11,11636.45,5.02];
_camera camPrepareFOV 0.516;
_camera camCommitPrepared 0;
_camera camPrepareTarget [101038.63,-8735.46,13431.70];
_camera camPreparePos [4056.24,11636.57,5.00];
_camera camPrepareFOV 0.516;
_camera camCommitPrepared 6;
sleep 6;
s3 setdamage 1;
_camera camPrepareTarget [43020.03,-80436.14,-1982.19];
_camera camPreparePos [4057.04,11638.82,5.13];
_camera camPrepareFOV 0.522;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-35266.06,-80294.78,-1364.82];
_camera camPreparePos [4058.32,11637.92,4.94];
_camera camPrepareFOV 0.352;
_camera camCommitPrepared 12;
/*
_camera camPrepareTarget [-45104.37,-71987.04,-24249.01];
_camera camPreparePos [4059.00,11637.29,5.75];
_camera camPrepareFOV 0.516;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-45104.37,-71987.04,-24248.90];
_camera camPreparePos [4059.13,11637.20,5.75];
_camera camPrepareFOV 0.516;
_camera camCommitPrepared 10;
*/
sleep 11;
titlecut ["","black out",1];
sleep 1;
titlecut ["","black in",1];
s5 setpos getposATL s4;
s6 setpos getposATL s4;
{_x setdir 90;} foreach [s4,s5,s6];
s4 switchmove "Acts_Abuse_abuser";
s5 switchmove "Acts_Abuse_abusing";
s6 switchmove "Acts_Abuse_Akhanteros";
_camera camPrepareTarget [-32998.75,-81531.29,1955.00];
_camera camPreparePos [3797.70,11432.52,9.12];
_camera camPrepareFOV 0.456;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-20900.81,-78792.24,-35330.09];
_camera camPreparePos [3797.70,11432.52,9.12];
_camera camPrepareFOV 0.456;
_camera camCommitPrepared 7;
sleep 7;
_camera camPrepareTarget [-65256.11,-58054.19,-20108.41];
_camera camPreparePos [3798.39,11420.31,2.41];
_camera camPrepareFOV 0.456;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-92172.80,31022.19,-20107.95];
_camera camPreparePos [3799.92,11414.36,2.41];
_camera camPrepareFOV 0.456;
_camera camCommitPrepared 7;
sleep 4;
c7 switchMove "Acts_AidlPercMstpSlowWrflDnon_pissing";
sleep 3;
GoGo=true;
_camera camPrepareTarget [-92500.69,-13356.22,-10795.38];
_camera camPreparePos [3776.65,11421.49,2.22];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-65200.34,-60144.70,-10990.43];
_camera camPreparePos [3771.81,11421.82,3.66];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 6;
sleep 5;
titlecut ["","black out",1];
sleep 1;
titlecut ["","black in",1];
_camera camPrepareTarget [-12016.66,-79510.39,-38450.08];
_camera camPreparePos [3751.63,11432.46,19.95];
_camera camPrepareFOV 0.666;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-95838.22,12169.40,-8986.44];
_camera camPreparePos [3751.63,11432.46,26.05];
_camera camPrepareFOV 0.666;
_camera camCommitPrepared 8;
sleep 7;
titlecut ["","black out",1];
sleep 1;
titlecut ["","black in",1];
_camera camPrepareTarget [-82035.52,27139.32,-48830.86];
_camera camPreparePos [3751.63,11432.46,148.82];
_camera camPrepareFOV 0.666;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-81796.63,27095.59,-49192.68];
_camera camPreparePos [3751.63,11432.46,165.66];
_camera camPrepareFOV 0.666;
_camera camCommitPrepared 8;
sleep 7;
titlecut ["","black out",1];
sleep 1;
titlecut ["","black in",1];
_camera camPrepareTarget [-40398.88,58281.43,-75699.95];
_camera camPreparePos [3730.21,11237.11,716.49];
_camera camPrepareFOV 0.666;
_camera camCommitPrepared 0;
_camera camPrepareTarget [-31525.78,54614.30,-82088.62];
_camera camPreparePos [3730.21,11237.11,842.46];
_camera camPrepareFOV 0.666;
_camera camCommitPrepared 4;
sleep 3;
titlecut ["","black out",1];
sleep 1;
titlecut ["","black in",1];
_camera camPrepareTarget [17532.22,26549.77,-96276.47];
_camera camPreparePos [3170.61,11013.47,1502.39];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_camera camPrepareTarget [17532.22,26549.77,-96275.94];
_camera camPreparePos [3170.61,11013.47,1524.54];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 9;
sleep 2;
titlecut ["","black out",7];
6 fadeMusic 0;
6 fadeSound 0;
sleep 7;
1 cutRsc ["WLAlogo","PLAIN"];
sleep 10;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
endmission "END1";


