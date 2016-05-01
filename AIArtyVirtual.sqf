private ["_c","_posPl","_pos","_art","_artT","_ammo","_exp","_vv","_side"];
if (isNil"VarDisableArty") then {
_posPl = _this select 0;
_side = _this select 1;
_art = ["o_art","o_mortar"];
if (_side == WEST) then {_art = ["n_art","n_mortar","b_art","b_mortar"];["F","ARTY",""] SPAWN SAOKRADIOMES;} else {["E","ARTY"] SPAWN SAOKRADIOMES;};

_nearbyVZs = nearestLocations [_posPl,["Name"], 4000];
if ({!isNil{_x getvariable "VZ"} && {(_x getvariable "Mtype") in _art}} count _nearbyVZs == 0) exitWith {};
_artT = "";

_c = count _nearbyVZs - 1;
for "_i" from 0 to _c do {_xx = _nearbyVZs select _i; if (!isNil{_xx getvariable "VZ"} && {(_xx getvariable "Mtype") in _art}) exitWith {_artT = (_xx getvariable "Mtype");};};
_ammo = "Sh_155mm_AMOS";
if (_artT in ["o_mortar","n_mortar","b_mortar"]) then {_ammo = "Sh_82mm_AMOS";};
_vv = [8,10,12,6] call RETURNRANDOM;
sleep (15+(random 15));
while {_vv > 0} do {
_pos = [(_posPl select 0) + 150 - (random 300),(_posPl select 1) + 150 - (random 300), 30];
_exp = createVehicle [_ammo , _pos, [], 0, "NONE"];  
_exp setpos _pos;
_exp setVelocity [1, 20, 1];
_vv = _vv - 1;
sleep (1 + random 4);
};
};

