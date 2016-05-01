private ["_masterFunc","_c","_forEachIndex","_n"];
SAOKAICAMPADDF = {
private ["_xPos"];
sleep (random 5);
_xPos = getposATL _this;
if !(isNil{_this getvariable "WaitGG"}) then {_xPos = _this getvariable "WaitGG"; waitUntil {sleep 6; isNull _this || {!alive _this} || {isNil{_this getvariable "WaitGG"}}};} else {
waitUntil {sleep 8; isNull _this || {!alive _this} || {vehicle _this == _this && {speed _this < 1}}};
_xPos = getposATL _this;
};
if (isNull _this || {!alive _this}) exitWith {};
_this setvariable ["CBFirePs",[]];
_this setvariable ["CBHouses",[_xPos, 100]];
_this setvariable ["CBgPoints",[]];
_this setvariable ["CBCpos",_xPos];
_this setvariable ["gPos",[0,0,0]];
_this setbehaviour "SAFE";
MIlunitsAICAMP pushBack _this;
};

_masterFunc = {
private ["_y"];
_y = _this select 0;
if (behaviour _y != "COMBAT") then {_y forcespeed 1;} else {_y forcespeed -1;};
if (random 1 < 0.5 && {!isNull _y}) then {_y setvariable ["CBFirePs",(nearestObjects [getposATL _y, ["FirePlace_burning_F","Land_FirePlace_F"], 50])];};
if (typename _y == "OBJECT" && {isNil {_y getvariable "Busy"}} && {isNil{_y getvariable "Called"}} && {vehicle _y == _y}) then {
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
[_y,_y,MIlunitsAICAMP] SPAWN SAOKAICAMPf3;
};
//_gPoints
if (!isNull _y && {random 1 < 0.6} && {isNil {_y getvariable "Busy"}}) exitWith {
//FUNC4
[_y,_y,MIlunitsAICAMP] SPAWN SAOKAICAMPf4;
};
};
};

while {true} do {
sleep 1;
//PEACETIME CAMP BEHAVIOUR
{
		if (isNull _x || {!alive _x}) exitWith {_deAT = MIlunitsAICAMP deleteAt _forEachIndex;};
sleep 0.01;
} foreach MIlunitsAICAMP;
{if (isNil"_x" || {typename _x != "OBJECT"} || {!(typeof _x iskindof "Man")}) exitWith {_deAT = MIlunitsAICAMP deleteAt _forEachIndex;};sleep 0.01;} foreach MIlunitsAICAMP;
sleep 1;
_c = count MIlunitsAICAMP - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = MIlunitsAICAMP select _i;
_n = [_xx] SPAWN _masterFunc;
sleep 0.1;
};
sleep 15;
};