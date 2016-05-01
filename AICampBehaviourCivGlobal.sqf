private ["_masterFunc","_c","_allU","_fafas","_unitsAICAMPC","_d","_forEachIndex"];
_fafas = {
private ["_xPos"];
if (!isNull _this) then {
_xPos = getposATL _this;
_this setvariable ["CBFirePs",[]];
_this setvariable ["CBHouses",[_xPos, 100]];
_this setvariable ["CBgPoints",[]];
_this setvariable ["CBCpos",_xPos];
_this setvariable ["gPos",[0,0,0]];
_this setbehaviour "SAFE";
_this forcespeed 1;
};
_this
};

_masterFunc = {
private ["_y","_unitsAICAMPC"];
sleep (random 1);
_y = _this select 0;
if (behaviour _y == "COMBAT") then {_y allowfleeing 1;} else {_y allowfleeing 0;};
_unitsAICAMPC = _this select 1;
if (isNil {_y getvariable "Busy"} && {isNil{_y getvariable "Called"}}) then {
sleep 1;
//fireplace
if (random 1 < 0.2 && {isNil {_y getvariable "Busy"}}) exitWith {
sleep 1;
if (count (_y getvariable "CBFirePs") > 0) then {
{
if (typename _x == "OBJECT") then {
if (isNil{_x getvariable "N"} && {isNil{_y getvariable "Busy"}}) exitWith {
//FUNC2
[_x,_y,"N"] SPAWN SAOKAICAMPf2;
};
if (isNil{_x getvariable "E"} && {isNil {_y getvariable "Busy"}}) exitWith {
//FUNC2
[_x,_y,"E"] SPAWN SAOKAICAMPf2;
};
if (isNil{_x getvariable "S"} && {isNil {_y getvariable "Busy"}}) exitWith {
//FUNC2
[_x,_y,"S"] SPAWN SAOKAICAMPf2;
};
if (isNil{_x getvariable "W"} && {isNil {_y getvariable "Busy"}}) exitWith {
//FUNC2
[_x,_y,"W"] SPAWN SAOKAICAMPf2;
};
};
sleep 0.1;
} foreach [(_y getvariable "CBFirePs") call RETURNRANDOM];
};
};
//_houses
if (!isNull _y && {random 1.5 < (0.5+rain)} && {isNil {_y getvariable "Busy"}}) exitWith {
//FUNC3
[_y,_y,_unitsAICAMPC] SPAWN SAOKAICAMPf3;
};

//_gPoints
if (!isNull _y && {random 1 < 0.6} && {isNil {_y getvariable "Busy"}}) exitWith {
//FUNC4
[_y,_y,_unitsAICAMPC] SPAWN SAOKAICAMPf4;
};
};
};


_unitsAICAMPC = [];
while {true} do {
_allU = + AllUnits;
_c = count _allU - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _allU select _i;
if (typeof _xx iskindof "CIVILIAN" && {alive _xx} && {!(_xx in _unitsAICAMPC)} && {isNil{_xx getvariable "CivNo"}} && {isNil{_xx getvariable "Busy"}} && {vehicle _xx == _xx}) then {
_d = _xx SPAWN _fafas;
_unitsAICAMPC pushBack _xx;
};
sleep 0.01;
};
sleep 1;
_c = count _unitsAICAMPC - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _unitsAICAMPC select _i;
_xx setbehaviour "SAFE";
_xx forcespeed 1;
sleep 0.1;
};
//PEACETIME CAMP BEHAVIOUR
{
		if (isNull _x || {!alive _x}) exitWith {_deAT = _unitsAICAMPC deleteAt _forEachIndex;};
sleep 0.01;
} foreach _unitsAICAMPC;
{if (isNil"_x" || {typename _x != "OBJECT"} || {!(typeof _x iskindof "Man")}) exitWith {_deAT = _unitsAICAMPC deleteAt _forEachIndex;};sleep 0.01;} foreach _unitsAICAMPC;
sleep 1;
_c = count _unitsAICAMPC - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _unitsAICAMPC select _i;
if (!isNull _xx && {behaviour _xx == "DANGER"} && {random 1 < 0.3} && {alive _xx} && {isNil{_xx getvariable "Busy"}}) then {

} else {
[_xx,_unitsAICAMPC] SPAWN _masterFunc;
};
sleep 0.1;
};
sleep 15;
};