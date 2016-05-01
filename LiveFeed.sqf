private ["_source","_target","_ran","_ran2","_fov","_open"];
_source = player;
_target = player;

_open = true;
waitUntil {sleep 5; {(getposATL _x select 2) > 10} count (nearestObjects [vehicle player,["B_UAV_02_CAS_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_armed_F"],2000]) > 0};
{if ((getposATL _x select 2) > 10) then {_source = _x;};} foreach (nearestObjects [vehicle player,["B_UAV_02_CAS_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_armed_F"],2200]);
_target = (getposATL _source) nearEntities [["SoldierEB","SoldierWB"],750];
if (count _target > 0) then {_target = _target call BIS_fnc_selectRandom;} else {_target = [(getposATL _source select 0) + 300 - (random 600),(getposATL _source select 1) + 300 - (random 600),0];};
if (_open) then {[_source, _target, player] call BIS_fnc_liveFeed;};
//hint format ["%1",nearestObjects [vehicle player,["B_Heli_Light_01_F","B_Heli_Light_01_armed_F"],2000]];
while {true} do {
if ({(getposATL _x select 2) > 10} count (nearestObjects [vehicle player,["B_UAV_02_CAS_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_armed_F"],2000]) == 0) then {[] call BIS_fnc_liveFeedTerminate; _open = true; waitUntil {sleep 5; {(getposATL _x select 2) > 10} count (nearestObjects [vehicle player,["B_UAV_02_CAS_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_armed_F"],2000]) > 0};} else {_open = false;}; 

{if ((getposATL _x select 2) > 10) then {_source = _x;};} foreach (nearestObjects [vehicle player,["B_UAV_02_CAS_F","B_Heli_Attack_01_F","B_Heli_Light_01_F","B_Heli_Light_01_armed_F"],2200]);
_target = (getposATL _source) nearEntities [["SoldierEB","SoldierWB"],750];
if (count _target > 0) then {_target = _target call BIS_fnc_selectRandom;} else {_target = [(getposATL _source select 0) + 300 - (random 600),(getposATL _source select 1) + 300 - (random 600),0];};
if (_open) then {[_source, _target, player] call BIS_fnc_liveFeed;};
_ran = 7 + (random 10);
_ran2 = 2 + (random 5);
_fov = 0.5 - (random 0.48);
BIS_liveFeed camPrepareFOV _fov;
BIS_liveFeed camPrepareTarget _target;
BIS_liveFeed camCommitPrepared _ran2;
sleep _ran;
};

/*
[getposATL player, player, player] call BIS_fnc_liveFeed;

BIS_liveFeed camPrepareTarget [-44050.67,94071.59,8882.32];
BIS_liveFeed camPreparePos [1928.12,5713.34,1.57];
BIS_liveFeed camPrepareFOV 0.250;
BIS_liveFeed camCommitPrepared 0;
BIS_liveFeed camPrepareTarget [-31349.27,98042.36,19190.26];
BIS_liveFeed camPreparePos [1927.96,5713.46,1.50];
BIS_liveFeed camPrepareFOV 0.250;
BIS_liveFeed camCommitPrepared 10;
sleep 1;
unit1 say "STR_ca4s2r7"; playsound "STR_ca4s2r7";
sleep 10;
*/
sleep 60;
[] call BIS_fnc_liveFeedTerminate;