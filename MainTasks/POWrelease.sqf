
//_post = [getposATL player,"ColorGreen"] CALL NEARESTGUARDPOST;

private ["_post","_wp","_posP","_gps","_c","_aika","_f"];
_post = [];
{if (!isNil{_x getvariable "PowCells"} && {isNil{_x getvariable "PowAttacked"}} && {{(_x select 1) != ""} count (_x getvariable "PowCells") > 0}) exitWith {_post = _x;};} foreach activatedPost;
if (typename _post != "ARRAY") then {
_post setvariable ["PowAttacked",1];
_posP = getposATL _post;
_gps = + (Pgroups + VehicleGroups);
_c = count _gps - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _gps select _i;
if (!isNil"_xx") then { 
_n = _xx SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp = _xx addWaypoint [[(_posP select 0) + 20 - (random 40),(_posP select 1) + 20 - (random 40),0], 0]; 
};
sleep 0.1;
};
_aika = time + 400;
_f = {
private ["_bol"];
_bol = false;
_unts = (_this nearEntities [["Man"],70]);
if ({alive _x && {side _x == EAST} && {isNil{_x getvariable "PowMan"}}} count _unts > {alive _x && {side _x != EAST}} count _unts && {{alive _x && {side _x == EAST} && {isNil{_x getvariable "PowMan"}} && {_x distance _posP < 20}} count _unts > 0}) then {_bol = true;};
_bol
};
waitUntil {sleep 5; !(_post in activatedPost) || {_posP CALL _f} || {_aika < time}};
_post setvariable ["PowAttacked",nil];
if ((_post in activatedPost) && {_aika > time}) then {
_post SPAWN SAOKFREEPOWS;
};
};
