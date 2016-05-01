_n = [
[getposATL player, player, aa],
[[aa, "ZafV", "ZafVoices\sounds.bikb", ""]],
[
[[[aa], "I dont remember the last day without firefight",4],[aa,player, "ZafV", "Sol2d"]]
,[[[player], ["Any troubles?"],2],[player,aa, "PlaV", "JinN50"]]
,[[[aa], ["Our air support managed to hit CSAT convoy carrying high ranked officer. But seems like he is still alive and waiting for pick up. Would you be interested to head there and finish the job?"],12.5],[aa,player, "ZafV", "Sol10"]]
,[[[player], ["I see what can I do"],1],[player,aa, "PlaV", "V17"]]
]
] SPAWN SAOKCUTSCENE;


[] SPAWN {  
if (vehicle player != player) exitWith {};  
sleep 5;  
_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;  
SAOKanswer1 = {
switch _this do {
case 0: {"Nice, well big thank you. Friend"};
case 1: {"Why you did do such a thing? Jerk!"};
}; 
};
_n = [  
[getposATL player, player, _actor1],  [], 
[  
[[[_actor1], ["Hey, did you manage to deliver that value crate to its destination?"],8]]  
,[[[player], "",6,["Yes, the receiver was happy to receive it","No, I dumped it to ocean. We are not delivery company. Take learn from this"]]]  
,[[[_actor1], {(SAOKCHOSEN SELECT 0) CALL SAOKanswer1},4]]] 
] SPAWN SAOKCUTSCENE;  
waitUntil {sleep 0.1; scriptdone _n}; 
SAOKanswer1 = nil;
hint format ["%1",SAOKCHOSEN];  
_nul = [_actor1,""] SPAWN FHideAndDelete;  
};

/*
[aa, "ZafV", "ZafVoices\sounds.bikb", ""]CALL SAOKKBTOPIC;
titlecut ["","black out",1];
sleep 1;
0 SPAWN SAOKHALTCSAT;
_c = [getposATL player, player, aa] SPAWN SAOKSEARCHCINEMAPOS;
waitUntil {sleep 0.1;scriptdone _c};
player switchmove "";
SAOKcamera = "camera" camcreate [0,0,0];
SAOKcamera cameraeffect ["internal", "back"];
showcinemaBorder false;
_c = [[aa], "I dont remember the last day without firefight",4] SPAWN SAOKCAM;
titlecut ["","black in",1];
sleep 1;
player action ["WeaponOnBack", player];
[aa,player, "ZafV", "Sol2d"]SPAWN SAOKKBTELL;
waitUntil {sleep 0.1;scriptdone _c};
_c = [[player], ["Any troubles?"],2] SPAWN SAOKCAM;
sleep 1;
[player,aa, "PlaV", "JinN50"]SPAWN SAOKKBTELL;
waitUntil {sleep 0.1;scriptdone _c};
_c = [[aa], ["Our air support managed to hit CSAT convoy carrying high ranked officer. But seems like he is still alive and waiting for pick up. Would you be interested to head there and finish the job?"],12.5] SPAWN SAOKCAM;
sleep 1;
[aa,player, "ZafV", "Sol10"]SPAWN SAOKKBTELL;
waitUntil {sleep 0.1;scriptdone _c};
_c = [[player], ["I see what can I do"],1] SPAWN SAOKCAM;
sleep 1;
[player,aa, "PlaV", "V17"]SPAWN SAOKKBTELL;
waitUntil {sleep 0.1;scriptdone _c};
titlecut ["","black out",1];
sleep 1;
SAOKcamera cameraeffect ["terminate", "back"];
camdestroy SAOKcamera;
titlecut ["","black in",1];
1 SPAWN SAOKHALTCSAT;
*/
/*
"Soldier, how is it going?"
[player,aa, "JinV", "JinN54"]SPAWN SAOKKBTELL;

"Quite good, still alive"
[aa,player, "ZafV", "Sol1d"]SPAWN SAOKKBTELL;


"Any troubles that I could try to solve for you?"
[player,aa, "JinV", "JinN50"]SPAWN SAOKKBTELL;


"Our air support managed to hit CSAT convoy carrying high ranked officer. But seems like he is still alive and waiting for pick up. Would you be interested to head there and finish the job?"
[aa,player, "ZafV", "Sol10"]SPAWN SAOKKBTELL;

"I see what can I do"
[player,aa, "JinV", "V17"]SPAWN SAOKKBTELL;
*/
