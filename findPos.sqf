private ["_bestplace","_position","_radius","_expression","_precision","_sourcesCount","_pos","_m","_foreachindex","_posses"];
_bestplace = [[[1000,1000,0]]];
if (vehicle player == player || {count _this > 3}) then {
_position = if (!isNil{_this select 0}) then {_this select 0} else {getposATL player};
_radius = if (!isNil{_this select 1} && {typename (_this select 1) == "SCALAR"}) then {_this select 1} else {1000};
_expression = if (!isNil{_this select 2} && {typename (_this select 2) == "STRING"}) then {_this select 2} else {"(1 - sea)"};
_precision = 7;
_sourcesCount = if (count _this > 3 && {typename (_this select 3) == "SCALAR"}) then {4} else {1};
_bestplace = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];
_m = 0;
while {count _bestplace == 0 && {_m < 15}} do {
_m = _m + 1;
_radius = _radius + 1000;
_bestplace = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];
};
_posses = [];
{_posses pushBack (_x select 0);} foreach _bestplace;
{
_pos = _x;
while {isOnRoad _pos} do {
_pos = [(_x select 0) + 15 - (random 30), (_x select 1) + 15 - (random 30),0];
};
_posses set [_foreachindex,_pos];
} foreach _posses;
_bestplace = [_posses];
} else {
_position = if (isNil{_this select 0}) then {[1000,1000,0]} else {if (typeName (_this select 0) == "ARRAY") then {(_this select 0)} else {getposATL (_this select 0)};};
_radius = if (isNil{_this select 1}) then {1000} else {_this select 1};
_bestplace = [(_position select 0)- _radius + random (_radius*2),(_position select 1)- _radius + random (_radius*2),0];
//while {surfaceIsWater _bestplace} do {_bestplace = [(_position select 0)- _radius + random (_radius*2),(_position select 1)- _radius + random (_radius*2),0];};
_bestplace = [[_bestplace]];
};
if (count ((_bestplace select 0) select 0) == 0) then {_bestplace = [[[1000,1000,0]]];};
_bestplace