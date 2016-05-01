private ["_crate","_data","_c","_m","_mN"];
_crate = _this select 0;
_data = _this select 1;
clearWeaponCargo _crate;
clearMagazineCargo _crate;
clearItemCargo _crate;
clearBackpackCargo _crate;
if (!isNil"_data") then {
if (count (_data select 1) > 0) then {
if (count ((_data select 1) select 0) > 0) then {
_m = (_data select 1) select 0;
_mN = (_data select 1) select 1;
_c = (count _m) - 1;
while {_c > - 1} do {_crate addMagazineCargo [_m select _c,_mN select _c];_c = _c - 1;};
};
};
if (count (_data select 0) > 0) then {
if (count ((_data select 0) select 0) > 0) then {
_m = (_data select 0) select 0;
_mN = (_data select 0) select 1;
_c = count _m - 1;
while {_c > - 1} do {_crate addWeaponCargo [_m select _c,_mN select _c];_c = _c - 1;};
};
};

{
_crate addItemCargo [_x, 1]; 
} foreach (_data select 2);
{
_crate addBackpackCargo [_x, 1]; 
} foreach (_data select 3);

};

