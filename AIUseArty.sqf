private ["_posPl","_pos","_exp","_vv"];
if (isNil"VarDisableArty") then {
["E","ARTY"] SPAWN SAOKRADIOMES;
_posPl = _this select 0;
_vv = 8;
while {_vv > 0} do {
_pos = [(_posPl select 0) + 180 - (random 360),(_posPl select 1) + 180 - (random 360), 30];
_exp = "Sh_120mm_AMOS" createvehicle _pos;
_exp setVelocity [1, 20, 1];
_vv = _vv - 1;
sleep (3 + random 4);
};
};

