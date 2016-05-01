
private ["_unit", "_t"];
//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

_unit = _this select 0;
sleep 40 + (random 20);
_t=0;
while {!(isNUll _unit) && {((vehicle player) distance _unit < 220)} && {(_t < 13)}} do {sleep 25; _t=_t+1;};
while {!(isNUll _unit) && {((vehicle player) distance _unit < 120)}} do {sleep 25;};
while {!(isNUll _unit) && {(((vehicle player) distance _unit < 100))}} do {sleep 25;};
if (isNull _unit || {!isNil{_unit getvariable "PowMan"}}) then {} else {deletevehicle _unit;};



