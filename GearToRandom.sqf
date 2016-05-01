private ["_unit","_f1","_f2","_f3","_uniF","_hats","_vI","_uI","_vests","_inv","_weR","_maR","_t","_nul"];
_f1 = {
private ["_unit","_typ","_cW","_c"];
//MAGAZINE CARGO
_cW = _this select 0;
_unit = _this select 1;
_typ = _this select 2;
_c = count (_cW select 0) - 1;
if (_c < 0) exitWith {};
for "_i" from 0 to _c do {
private ["_class"];
_class = (_cW select 0) select _i;
_num = (_cW select 1) select _i;
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addMagazineCargo [_class , 1];};
case "V": {(vestContainer _unit) addMagazineCargo [_class , 1];};
case "B": {(backpackContainer _unit) addMagazineCargo [_class , 1];};
};
};
};
};

_f2 = {
private ["_unit","_typ","_cW","_c"];
//ITEM CARGO
_cW = _this select 0;
_unit = _this select 1;
_typ = _this select 2;
_c = count (_cW select 0) - 1;
if (_c < 0) exitWith {};
for "_i" from 0 to _c do {
private ["_class","_nameA","_f"];
_class = (_cW select 0) select _i;
_num = (_cW select 1) select _i;
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addItemCargo [_class , 1];};
case "V": {(vestContainer _unit) addItemCargo [_class , 1];};
case "B": {(backpackContainer _unit) addItemCargo [_class , 1];};
};
};
};
};
_f3 = {
private ["_unit","_typ","_cW","_c"];
//WEAPON CARGO
_cW = _this select 0;
_unit = _this select 1;
_typ = _this select 2;
_c = count (_cW select 0) - 1;
if (_c < 0) exitWith {};
for "_i" from 0 to _c do {
private ["_class","_nameA","_f"];
_class = (_cW select 0) select _i;
_num = (_cW select 1) select _i;
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addWeaponCargo [_class , 1];};
case "V": {(vestContainer _unit) addWeaponCargo [_class , 1];};
case "B": {(backpackContainer _unit) addWeaponCargo [_class , 1];};
};
};
};
};
_unit = _this select 0;

_itemCargoUni = [];
_magCargoUni = [];
_weaCargoUni = [];
_uniBol = !isnull (uniformContainer _unit);
if (!isNil"_uniBol" && {_uniBol}) then {
_itemCargoUni = (getitemCargo (uniformContainer _unit)) ;
_magCargoUni = (getMagazineCargo (uniformContainer _unit));
_weaCargoUni = (getWeaponCargo (uniformContainer _unit));
};

_itemCargoBackPack = [];
_magCargoBackPack = [];
_weaCargoBackPack = [];
_BackPackBol = !isnull (BackPackContainer _unit);
if (!isNil"_BackPackBol" && {_BackPackBol}) then {
_itemCargoBackPack = (getitemCargo (BackPackContainer _unit));
_magCargoBackPack = (getMagazineCargo (BackPackContainer _unit));
_weaCargoBackPack = (getWeaponCargo (BackPackContainer _unit));
};

_itemCargoVest = [];
_magCargoVest = [];
_weaCargoVest = [];
_VestBol = !isnull (VestContainer _unit);
if (!isNil"_VestBol" && {_VestBol}) then {
_itemCargoVest = (getitemCargo (VestContainer _unit));
_magCargoVest = (getMagazineCargo (VestContainer _unit));
_weaCargoVest = (getWeaponCargo (VestContainer _unit));
};

_uniF = _this select 1;
_hats = _this select 2;
_vests = _this select 3;

if (count _uniF > 0) then {[_unit,(_uniF call RETURNRANDOM)] CALL SAOKADDUNIFORM;};
if (count _hats > 0) then {_unit addHeadgear (_hats call RETURNRANDOM);};
if (count _vests > 0) then {_unit addVest (_vests call RETURNRANDOM);};
if (count _this > 4 && {count (_this select 4) > 0}) then {_unit addbackpack ((_this select 4) call RETURNRANDOM);};
clearWeaponCargo UniformContainer _unit;
clearItemCargo UniformContainer _unit;

clearMagazineCargo VestContainer _unit;
clearWeaponCargo VestContainer _unit;
clearItemCargo VestContainer _unit;

if (!isNil"_BackPackBol" && {_BackPackBol}) then {
clearMagazineCargo BackpackContainer _unit;
clearWeaponCargo BackpackContainer _unit;
clearItemCargo BackpackContainer _unit;
};



if (!isNil"_uniBol" && {_uniBol}) then {
[_weaCargoUni,_unit,"U"] CALL _f3;
[_itemCargoUni,_unit,"U"] CALL _f2;
[_magCargoUni,_unit,"U"] CALL _f1;
};

if (!isNil"_BackPackBol" && {_BackPackBol}) then {
[_weaCargoBackPack,_unit,"B"] CALL _f3;
[_itemCargoBackPack,_unit,"B"] CALL _f2;
[_magCargoBackPack,_unit,"B"] CALL _f1;
};


if (!isNil"_VestBol" && {_VestBol}) then {
[_weaCargoVest,_unit,"V"] CALL _f3;
[_itemCargoVest,_unit,"V"] CALL _f2;
[_magCargoVest,_unit,"V"] CALL _f1;
};
sleep 0.1;
if (!isPlayer _unit) then {
if (handgunWeapon _unit != "") then {_unit removeweapon (handgunWeapon _unit);};
};

_weR = SAOKrs call RETURNRANDOM;
if (isNil"_weR" || {typename _weR == "ARRAY"} || {_weR == ""}) exitWith {};
_maR = (getArray (configfile >> "CfgWeapons" >> _weR >> "magazines")) call RETURNRANDOM;
_t = 0;
while {(typename _maR == "ARRAY" || {_maR == "30Rnd_65x39_case_mag"} || {!isClass(configFile >> "cfgMagazines" >> _maR)} || {(getNumber (configfile >> "CfgMagazines" >> _maR >> "scope")) == 0}) && {_t < 7}} do {
_weR = SAOKrs call RETURNRANDOM;
_maR = (getArray (configfile >> "CfgWeapons" >> _weR >> "magazines")) call RETURNRANDOM;
_t = _t + 1;
};
sleep 0.1;
{_parentsAr = [(configfile >> "CfgMagazines" >> _x),true] call BIS_fnc_returnParents; if (!("CA_LauncherMagazine" in _parentsAr) && {!("HandGrenade" in _parentsAr)}) then {_unit removeMagazines _x;};} foreach magazines _unit;
{if (_unit canAdd _maR) then {_unit addmagazine _maR;};sleep 0.01;} foreach [1,2,3,4,5];
_unit addweapon _weR;
sleep 1;
if (primaryWeapon _unit != "") then {_unit selectweapon (primaryWeapon _unit);};



