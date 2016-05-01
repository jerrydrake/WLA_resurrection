
private ["_ttt","_closest","_dist","_posPl","_nul","_wp","_totaldam2","_pPos","_totaldam","_forEachIndex"];
VARCoLoop = false;
_totaldam2 = 0;
_ttt = 0;
while {VarAlarm} do {
_totaldam = 0;
{_totaldam = _totaldam + damage _x;sleep 0.1;} foreach units group player;
//player pos is revealed if his team is receiving damage
_b = true;
if (captive player) then {_b = false;};
sleep 0.1;
if (_b && {[] CALL SAOKREINFCUT}) then {_b = false;};
sleep 0.1;
if (_b && {{_x knowsabout vehicle player > 0.4 && {behaviour leader _x == "COMBAT"} && {(leader _x distance vehicle player < 500)} && {(_totaldam > _totaldam2)} && {([player,leader _x] CALL FUNKTIO_LOS || {_ttt == 3})}} count (Pgroups + HeliGroups + CampGroups + VehicleGroups + AirGroups) == 0}) then {_b = false;};
sleep 0.1;
while {_b} do {
if (_ttt == 3) then {_ttt = 0;};
_totaldam2 = 0;
{_totaldam2 = _totaldam2 + damage _x;sleep 0.1;} foreach units group player;
sleep 0.1;
{if (isNil"_x") exitWith {_deAT = Pgroups deleteAt _forEachIndex;};sleep 0.1;} foreach Pgroups;
sleep 0.1;
{if (isNil"_x") exitWith {_deAT = VehicleGroups deleteAt _forEachIndex;};sleep 0.1;} foreach VehicleGroups;
sleep 0.1;
{if (isNil"_x") exitWith {_deAT = NAPAveh deleteAt _forEachIndex;};sleep 0.1;} foreach NAPAveh;
sleep 0.1;
{if (isNil"_x") exitWith {_deAT = GuardTanks deleteAt _forEachIndex;};sleep 0.1;} foreach GuardTanks;
sleep 0.1;
_arr = Pgroups + HeliGroups + CampGroups + VehicleGroups;
if (count _arr > 0) then {
_closest = leader (_arr call RETURNRANDOM);
_dist = vehicle player distance _closest;
sleep 0.1;
{if (!isNil"_x" && {leader _x distance vehicle player < _dist}) then {_dist = leader _x distance vehicle player;_closest = leader _x;};sleep 0.1;} foreach (Pgroups + HeliGroups + CampGroups + VehicleGroups);
//"player position" is less accurate if closest enemy is far
_pPos = getposATL vehicle player;
_posPl=[(_pPos select 0)+((_dist-((random _dist)*2))*0.5),(_pPos select 1)+((_dist-((random _dist)*2))*0.5),0];
if (random 1 < 0.3 && {isNil"CIVMODE"}) then {[_posPl,EAST] SPAWN F_AIArtyVirtual;};
sleep 0.1;
if (!isNil"debugi") then {_nul = [_posPl, 30] SPAWN FUNKTIO_TM;hint "Enemy updated your location";};

_gps = Pgroups + VehicleGroups +NAPAveh +GuardTanks;
_c = count _gps - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _gps select _i;
if (!isNil"_xx" && {isNil{_xx getvariable "Diversion"}} && {count units _xx > 0}) then { 
_n = _xx SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_start2 = getposATL leader _xx;
_mid = [((_start2 select 0)+(_posPl select 0))*0.5,((_start2 select 1)+(_posPl select 1))*0.5,0];
[[_start2],"hd_unknown","ColorRed",0] SPAWN SAOKCREATEMARKER;
[[_mid],"mil_arrow2","ColorRed",([_start2, _posPl] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
_wp = _xx addWaypoint [[(_posPl select 0) + 200 - (random 400),(_posPl select 1) + 200 - (random 400),0], 0]; 
};
sleep 0.1;
};
//if (_c > 0) then {[[getposATL vehicle player],"Horizontal","ColorOrange",300,11,0.25] SPAWN SAOKCREATEMARKERA;};
};
sleep 10;
_ttt = _ttt + 1;
_b = true;
if (captive player) then {_b = false;};
sleep 0.1;
if (_b && {[] CALL SAOKREINFCUT}) then {_b = false;};
sleep 0.1;
if (_b && {{_x knowsabout vehicle player > 0.4 && {behaviour leader _x == "COMBAT"} && {(leader _x distance vehicle player < 500)} && {(_totaldam > _totaldam2)} && {([player,leader _x] CALL FUNKTIO_LOS || {_ttt == 3})}} count (Pgroups + HeliGroups + CampGroups + VehicleGroups + AirGroups) == 0}) then {_b = false;};
sleep 0.1;
};
sleep 5;
};

_pPos = getposATL vehicle player;
_gps = + (Pgroups + VehicleGroups);
_c = count _gps - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _gps select _i;
if (!isNil"_xx" && {isNil{_xx getvariable "Diversion"}}) then { 
_n = _xx SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp = _xx addWaypoint [[(_pPos select 0) + 1700 - (random 3400),(_pPos select 1) + 1700 - (random 3400),0], 0]; 
};
sleep 0.1;
};


VARCoLoop = true;


