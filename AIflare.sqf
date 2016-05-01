private ["_unit","_muzzle","_ammo","_delay","_upos","_p1","_p2"];
_unit = _this select 0;
_muzzle = _this select 1;
_ammo = _this select 2;
while {!isNull _unit && {alive _unit}} do {
waituntil {sleep 10;  isNull _unit || {!alive _unit} || {daytime < 5} || {daytime > 21}};
if (isNull _unit || {!alive _unit}) exitWith {};
_delay = if (behaviour _unit != "COMBAT") then {30+(random 50)} else {10+(random 30)};
_upos = eyePos _unit;
_p1 = [(_upos select 0),(_upos select 1),(_upos select 2) + 0.5];
_p2 = [(_upos select 0),(_upos select 1),(_upos select 2) + 6];
if (!(lineIntersects [_p1,_p2,_unit])) then {
if (_unit canAdd _ammo) then {
_unit addmagazine _ammo;
sleep _delay;
_unit fire [_muzzle,_muzzle,_ammo];
};
};
};

