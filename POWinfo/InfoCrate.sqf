private ["_nV","_str","_mar","_mP","_marker","_Tid","_Lna","_header","_nul","_nearest","_n","_tasks","_picked","_head","_toChoose"];
//CONVERSATION
(missionnamespace getvariable "CivC") SPAWN {
_aika = time + 4;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 3;};
_p = ["Pow6"]call RETURNRANDOM;
[_this,player, "ZafV", _p]SPAWN SAOKKBTELL;
};
_head = "Wait, I know location for one weapon cache";
_toChoose = ["Tell me more","Not interested of your traps"];
_nul = [_head, _toChoose,"S",[["JinN33","JinN32"],["JinN42","JinN43","JinN38"]]] SPAWN FConversationDialogSur;
//TASK TAKEN
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {};
if (LineSelected == 0) then {
_real = true;
_st2 = [getposATL player, 3150,"(1 - houses) * (1 - sea)"] CALL FUNKTIO_POS;
_home = (_st2 select 0) select 0;
_mP = [(_home select 0)+20-(random 40),(_home select 1)+20-(random 40),0];
_mar = format ["InfoM%1",NUMM];
NUMM=NUMM+1;
_marker = [_mar,_mP, "mil_unknown", [0.8,0.8], "ColorGreen", "Find Weapon Cache"] CALL FUNKTIO_CREATEMARKER;
_Tid = format ["Info%1",NUMM];
NUMM=NUMM+1;
_Lna = _mP CALL NEARESTLOCATIONNAME;
_header = format ["Find Weapon Cache near %1",_Lna];
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["According to surrendered CSAT soldier, there should weapon cache near this location (around inside 20m radius). Should we check it or play safe?", _header, _header], // Task description
objNull, // Task destination
true // true to set task as current upon creation icon = "\A3\ui_f\data\map\markers\military\unknown_CA.paa";
] call SAOKCRTASK;
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\vehicleicons\iconCrateWpns_ca.paa", ICONCOLORGREEN, _this,1.51, 1.51, 0, (format ["Find Weapon Cache: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _mP] call BIS_fnc_addStackedEventHandler;
_ranCrate = (CRATECLAS select 1) call RETURNRANDOM; 
_crate = createVehicle [_ranCrate,_home, [], 0, "NONE"]; 
_crate setvariable ["AmCrate",1];
waitUntil {sleep 7; player distance _crate < 17};
deletemarker _marker;
_crate setvariable ["AmCrate",nil];
if (_real) then {
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
} else {
_nul = [_Tid,"FAILED"] call SAOKCOTASK;
};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
};

