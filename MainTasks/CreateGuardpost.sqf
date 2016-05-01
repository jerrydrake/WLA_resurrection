
private ["_ranP","_roads","_locat","_Tid","_Lna","_header","_desc","_Mcolor","_nul","_pP","_someId"];
_pP = getposATL player;
_ranP = [(_pP select 0)+2000-(random 4000),(_pP select 1)+2000-(random 4000),0];
_roads = (_ranP nearRoads 450);
while {count _roads == 0} do {
_ranP = [(_pP select 0)+2000-(random 4000),(_pP select 1)+2000-(random 4000),0];
_roads = (_ranP nearRoads 450);
};
_locat = getposATL (_roads select 0);

_Tid = format ["TaskCreg%1",NUMM];
NUMM=NUMM+1;
_Lna = _locat CALL NEARESTLOCATIONNAME;
_header = format ["Create Guardpost next to marked road near %1",_Lna];
_desc =("We need to get control of this road by creating guardpost inside 100m radius from this point with at least one static weapon or vehicle.");
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
[_desc, _header, _header], // Task description
objNull, // Task destination
"CREATED"
] call SAOKCRTASK;
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORGREEN, _this,1.51, 1.51, 0, (format ["Create Guardpost: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _locat] call BIS_fnc_addStackedEventHandler;
_Mcolor = "ColorGreen";
waitUntil {sleep 8; _locat distance (getposATL ([_locat] CALL RETURNGUARDPOST)) < 100 && {count (([_locat] CALL RETURNGUARDPOST) getvariable "StaticW") > 0} && (getmarkercolor (([_locat] CALL RETURNGUARDPOST) getvariable "Gmark")) == _Mcolor};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
pisteet = pisteet + 350;
_nul = [350, "RoadBlock Created"] SPAWN PRESTIGECHANGE;