
private ["_start","_nul","_type","_veh","_someId"];
_start = [getposATL player, 2500,1000,"(1 - trees) *(1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
while {surfaceiswater _start || {!(_start CALL SAOKINMAP)}} do {
sleep 2;
_start = [getposATL player, 2500,1000,"(1 - trees) *(1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
};
BaseR globalchat localize "STR_Sp2s1r1";
sleep 10;
player sidechat localize "STR_Sp2s1r2";
[player,player, "PlaV","V37"]SPAWN SAOKKBTELL;
[
WEST, // Task owner(s)
"taskBT", // Task ID (used when setting task state, destination or description later)
["AAF support truck have broken down and need to be fixed and returned to friendly camp.", "Fix and Return Supply Truck", "Fix and Return Supply Truck"], // Task description
objNull, // Task destination
"CREATED"  ] call SAOKCRTASK;
NUMM=NUMM+1;
//icon = "\A3\ui_f\data\map\markers\nato\n_support.paa";
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\vehicleicons\pictureRepair_ca.paa", ICONCOLOR, _this,1.51, 1.51, 0, (format ["Fix broken truck: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _start] call BIS_fnc_addStackedEventHandler;
waitUntil {sleep 6; vehicle player distance _start < 800};
_type = ((ARMEDSUPPORT select 2) call RETURNRANDOM);
_veh = createVehicle [_type, _start, [], 0, "NONE"];
_veh setdir (random 360);
_veh setvariable ["AmCrate",1];
_veh setHit [getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> "HitLFWheel" >> "name"), 1];
_veh setHit [getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> "HitEngine" >> "name"), 1];
waitUntil {sleep 6; isNull _veh || {!alive _veh} || {canMove _veh}};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
if !(isNull _veh || {!alive _veh}) then {
player sidechat localize "STR_Sp2s1r3";
//["taskBT",(locationposition (["ColorBlue"] CALL NEARESTCAMP))] call BIS_fnc_taskSetDestination;
["taskBT"] call BIS_fnc_taskSetCurrent;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLOR, _this,1.51, 1.51, 0, (format ["Return the Truck: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, (locationposition (["ColorBlue"] CALL NEARESTCAMP))] call BIS_fnc_addStackedEventHandler;

"You can return the truck to any current friendly camp or capture an enemy camp and bring the truck there" SPAWN HINTSAOK;
waitUntil {sleep 6; isNull _veh || !alive _veh || vehicle player distance (locationposition (["ColorBlue"] CALL NEARESTCAMP)) < 50};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
if !(isNull _veh || !alive _veh) then {
pisteet = pisteet + 200;
_nul = [200, "Supply Truck Returned"] SPAWN PRESTIGECHANGE;
_nul = ["taskBT","SUCCEEDED"] call SAOKCOTASK;
BaseR globalchat localize "STR_Sp2s1r4";
} else {
_nul = ["taskBT","FAILED"] call SAOKCOTASK;
};

} else {
_nul = ["taskBT","FAILED"] call SAOKCOTASK;
};
CARS = CARS + [_veh];
_veh setvariable ["AmCrate",nil];
