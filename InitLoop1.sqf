
private ["_lva","_posATL","_nul","_current","_xx","_yy","_start","_forEachIndex","_dd"];
_notDel = [HCmodule,HCmodule2];
if (!isNil"BIS_SUPP_HQ_WEST") then {_notDel = [BIS_SUPP_HQ_WEST,HCmodule,HCmodule2];};
if (!isNil"BIS_SUPP_HQ_RESISTANCE") then {_notDel pushback BIS_SUPP_HQ_RESISTANCE;};
if (!isNil"bis_hc_mainscope") then {_notDel pushback bis_hc_mainscope;};
_lva = + (AllUnits - _notDel);
_c = count _lva - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _lva select _i;
if !(_xx CALL SAOKBISCHECK) then {
//Is on water
_posATL = (getposATL _xx);
if (surfaceIsWater _posATL && {_posATL select 2 < 2} && {!(typeof _xx in ["O_diver_TL_F","O_diver_F","O_diver_exp_F"])} && {_xx == vehicle _xx} && {group _xx != group player}) then {
if (isNil{_xx getvariable "OnSea"}) then {
	_xx setvariable ["OnSea",1];
	} else {
	if (_xx getvariable "OnSea" > 3) then {deletevehicle _xx;} else {_xx setvariable ["OnSea",(_xx getvariable "OnSea")+ 1];};
	};
};
};sleep 0.1;
};
_c = count _lva - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _lva select _i;
if !(_xx CALL SAOKBISCHECK) then {
_posATL = (getposATL _xx);
if (_posATL distance [0,0,0] < 250 && {group _xx != group player}) then {
deletevehicle _xx;
};
};
sleep 0.1;
};
sleep 0.5;
_lva = + vehicles;
_c = count _lva - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _lva select _i;
if !(_xx CALL SAOKBISCHECK) then {
if (_xx distance vehicle player > 300 && {{alive _x} count crew _xx == 0}) then {
if (isNil{_xx getvariable "AmCrate"}) then {
CARS pushBack _xx;
};
};
};
sleep 0.1;
};
sleep 0.5;
_dd = (["W"] CALL DIS);
_lva = + (allGroups - DONTDELGROUPS);
_c = count _lva - 1;
for "_i" from 0 to _c do {
private ["_xx","_uxx"];
_xx = _lva select _i;
_uxx = units _xx;
if ({_x in _notDel} count _uxx == 0) then {
if (count _uxx == 0) then {deleteGroup _xx;} else {
	_lx = leader _xx;
	_vlx = vehicle _lx;
	if (_vlx distance vehicle player > _dd) then {
		_current = if (!isNil{_xx getVariable "TooFar"}) then {_xx getVariable "TooFar"} else {0};
		_current = _current + 1;
		if ((_current < 8 || {(_current < 25 && {(getposATL _vlx select 2) > 15})})) then {_xx setvariable ["TooFar",_current];} 
			else {
			if (_vlx != _lx) then {deletevehicle _vlx;};
			{_nul = [_x] SPAWN FUNKTIO_DELUNIT;sleep 0.01;} foreach _uxx;
			};
	 
	} else {
	if (side _xx == EAST && {random 1 < 0.4} && {count _uxx > 0}) then {[[getposATL leader _xx],"hd_unknown","ColorRed",0] SPAWN SAOKCREATEMARKER;};
	};
};
};
sleep 0.1;
};


_dd = (["Lc"] CALL DIS);
_lva = + DONTDELGROUPS;
_c = count _lva - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _lva select _i;
if (isNil"_xx") exitWith {};
_lx = leader _xx;
if (!isNil{_xx getVariable "ReInf"} && {_lx distance vehicle player > 2000} && {vehicle _lx == _lx}) then {
_xxp = random _dd;
_yy = _dd - _xxp;
if (random 1 < 0.5) then {_xxp = _xxp*(-1)};
_yy = _yy*(-1);
_gP = getposATL vehicle player;
_start = [(_gP select 0) + _xxp,(_gP select 1) + _yy,0];
while  {surfaceIsWater _start || {{_start distance _xx < 500} count VarBlackListF > 0}} do {
_xxp = random _dd;
_yy = _dd - _xxp;
if (random 1 < 0.5) then {_xxp = _xxp*(-1)};
_yy = _yy*(-1);
_gP = getposATL vehicle player;
_start = [(_gP select 0) + _xxp,(_gP select 1) + _yy,0];
sleep 0.5;
};
{
_x setpos _start;
sleep 0.01;
} foreach units _xx;
};
sleep 0.1;
};
if (CLEANNUM == 0) then {
{if (isNil"_x") exitWith {_deAT = DONTDELGROUPS deleteAt _forEachIndex;};sleep 0.01;} foreach DONTDELGROUPS; 
{if (isNull _x) then {CARS  = CARS - [_x];};sleep 0.01;} foreach CARS;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = CARS deleteAt _forEachIndex;};sleep 0.01;} foreach CARS;
sleep 0.5;
{if (isNull _x) then {NAPAveh = NAPAveh- [_x];};sleep 0.01;} foreach NAPAveh;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = NAPAveh deleteAt _forEachIndex;};sleep 0.01;} foreach NAPAveh;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = CantCommand deleteAt _forEachIndex;};sleep 0.01;} foreach CantCommand;
sleep 0.5;
{if (isNull _x) then {CantCommand  = CantCommand - [_x];};sleep 0.01;} foreach CantCommand;
};
if (CLEANNUM == 1) then {
sleep 0.5;
{if (isNull _x) then {CIVIGNORE = CIVIGNORE - [_x];};sleep 0.01;} foreach CIVIGNORE;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = CIVIGNORE deleteAt _forEachIndex;};sleep 0.01;} foreach CIVIGNORE;
sleep 0.5;
{if (isNull _x) then {HeliGroups = HeliGroups - [_x];};sleep 0.01;} foreach HeliGroups;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = HeliGroups deleteAt _forEachIndex;};sleep 0.01;} foreach HeliGroups;
sleep 0.5;
{if (isNull _x) then {CampGroups = CampGroups - [_x];};sleep 0.01;} foreach CampGroups;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = CampGroups deleteAt _forEachIndex;};sleep 0.01;} foreach CampGroups;
sleep 0.5;
};
if (CLEANNUM == 2) then {
{if (isNull _x) then {VehicleGroups = VehicleGroups - [_x];};sleep 0.01;} foreach VehicleGroups;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = VehicleGroups deleteAt _forEachIndex;};sleep 0.01;} foreach VehicleGroups;
sleep 0.5;
{if (isNull _x) then {AirGroups = AirGroups - [_x];};sleep 0.01;} foreach AirGroups;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = AirGroups deleteAt _forEachIndex;};sleep 0.01;} foreach AirGroups;
sleep 0.5;
{if (isNull _x) then {GuardTanks = GuardTanks - [_x];};sleep 0.01;} foreach GuardTanks;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = GuardTanks deleteAt _forEachIndex;};sleep 0.01;} foreach GuardTanks;
sleep 0.5;
};
if (CLEANNUM == 3) then {
{if (isNull _x) then {FriendlyVehicles = FriendlyVehicles - [_x];}; if (leader _x == vehicle leader _x) then { _nul = [_x] SPAWN FUNKTIO_MAAGD; FriendlyVehicles = FriendlyVehicles - [_x];};sleep 0.01;} foreach FriendlyVehicles;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = FriendlyVehicles deleteAt _forEachIndex;};sleep 0.01;} foreach FriendlyVehicles;
sleep 0.5;
{if (isNull _x) then {FriendlyInf = FriendlyInf - [_x];};sleep 0.01;} foreach FriendlyInf;
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = FriendlyInf deleteAt _forEachIndex;};sleep 0.01;} foreach FriendlyInf;
sleep 0.5;
{if (isNull _x) then {Pgroups = Pgroups - [_x];};sleep 0.01;} foreach Pgroups; 
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = Pgroups deleteAt _forEachIndex;};sleep 0.01;} foreach Pgroups;
sleep 0.5;
{
     if ((_x distance [0,0,0]) < 1) then {
         deleteVehicle _x;
     };
sleep 0.01;	 
} count (allMissionObjects "EmptyDetector");
};
if (CLEANNUM == 4) then {
{if (isNull _x) then {BVEHI = BVEHI - [_x];};sleep 0.01;} foreach BVEHI; 
sleep 0.5;
{if (isNil"_x") exitWith {_deAT = BVEHI deleteAt _forEachIndex;};sleep 0.01;} foreach BVEHI;
sleep 0.5;
{if (isNull _x || {typename _x != "LOCATION"}) exitWith {_deAT = VEHZONES deleteAt _forEachIndex;};sleep 0.01;} foreach VEHZONES;
sleep 0.5;
{if (isNil"_x" || {typename _x != "STRING"} || {_x == ""}) exitWith {_deAT = Bpositions deleteAt _forEachIndex;};sleep 0.01;} foreach Bpositions;
sleep 0.5;
{if (isNil"_x" || {typename _x != "ARRAY"} || {count _x == 0}) exitWith {_deAT = AMBbattles deleteAt _forEachIndex;};sleep 0.01;} foreach AMBbattles;
};
CLEANNUM = CLEANNUM + 1;
if (CLEANNUM > 4) then {CLEANNUM = 0;};
sleep 5;
_dd = (["Ld"] CALL DIS);
{_lx = leader _x; if (!(_x in DONTDELGROUPS) && {((vehicle player) distance (vehicle _lx) > _dd && {(vehicle _lx == _lx || {{alive _x} count units _x == 0})})}) then {{_nul = [_x] SPAWN FUNKTIO_DELUNIT;sleep 0.01;} foreach units _x;if !(_x in DONTDELGROUPS) then {Pgroups = Pgroups - [_x];};};sleep 0.01;} foreach Pgroups; 
sleep 0.5;
_dd = (["W"] CALL DIS);
{if ((vehicle player) distance (vehicle leader _x) > _dd) then { {_nul = [_x] SPAWN FUNKTIO_DELUNIT;sleep 0.01;} foreach units _x; VehicleGroups = VehicleGroups - [_x]; };sleep 0.01;} foreach VehicleGroups;
sleep 5;
{if ((vehicle player) distance (vehicle leader _x) > _dd) then {{_nul = [_x] SPAWN FUNKTIO_DELUNIT;sleep 0.01;} foreach units _x; FriendlyVehicles = FriendlyVehicles - [_x];};sleep 0.01;} foreach FriendlyVehicles;
sleep 0.5;
_dd = (["Ld"] CALL DIS);
{_lx = leader _x;if (!(_x in DONTDELGROUPS) && {((vehicle player) distance (vehicle _lx) > _dd && {(vehicle _lx == _lx || {{alive _x} count units _x == 0})})}) then {{_nul = [_x] SPAWN FUNKTIO_DELUNIT;sleep 0.01;} foreach units _x;if !(_x in DONTDELGROUPS) then {FriendlyInf = FriendlyInf - [_x];};};sleep 0.01;} foreach FriendlyInf;
//sleep 10;
//RANDOM CUSTOM BEHAVIOUR
sleep 0.5;
//Surrendering when alone

_lva = + AllGroups;
_c = count _lva - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _lva select _i;
_lxx = leader _xx;
_uxx = units _xx;
_gxx = getposATL _lxx;
if (side _lxx == EAST && {count _uxx < 3} && {random 1 < 0.4}) then {
if (behaviour _lxx == "COMBAT" && {{side _x == EAST && {alive _x}} count (_gxx nearEntities [["Man"],100]) < 3} && {{side _x != EAST && {side _x != CIVILIAN} && {alive _x}} count (_gxx nearEntities [["Man"],300]) > 2}) then {
sleep (random 10);
{if (alive _x && {isNil{_x getvariable "PowMan"}}) then {[_x] SPAWN FUNKTIO_ANTAUDU; _x setvariable ["SaOkSurrendeRed",1];};sleep 0.01;} foreach _uxx;
};
};
};