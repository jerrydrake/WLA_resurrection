private ["_unit","_weR","_maR","_t","_mags"];
//if (!isNil"IFENABLED") exitWith {};
_unit = _this select 0;
if (typeof _unit in ["O_spotter_F","O_sniper_F","b_sniper_f","b_spotter_f","I_Spotter_F","I_Sniper_F","O_Soldier_AR_F","I_Soldier_AR_F","B_Soldier_AR_F"]) exitWith {};
if (side _unit == CIVILIAN || {count SAOKrs == 0}) exitWith {};
_weR = SAOKrs call RETURNRANDOM;
if (isNil"_weR" || {typename _weR == "ARRAY"} || {_weR == ""} ) exitWith {};
_maR = (getArray (configfile >> "CfgWeapons" >> _weR >> "magazines")) call RETURNRANDOM;
if (isNil"_maR" || {typename _maR == "ARRAY"}) exitWith {};
_mags = (getArray(configfile >> "CfgWeapons" >> (primaryweapon _unit) >> "magazines"));
{
if (_x in _mags) then {
_unit removeMagazine _x;
};
sleep 0.01;
} foreach magazines _unit;
//_gg = group _unit;
_t = 0;
while {(typename _maR == "ARRAY" || {_maR == "30Rnd_65x39_case_mag"} || {!isClass(configFile >> "cfgMagazines" >> _maR)} || {(getNumber (configfile >> "CfgMagazines" >> _maR >> "scope")) == 0}) && {_t < 7}} do {
_weR = SAOKrs call RETURNRANDOM;
_maR = (getArray (configfile >> "CfgWeapons" >> _weR >> "magazines")) call RETURNRANDOM;
_t = _t + 1;
sleep 0.01;
};
{_parentsAr = [(configfile >> "CfgMagazines" >> _x),true] call BIS_fnc_returnParents; if (!("CA_LauncherMagazine" in _parentsAr) && {!("HandGrenade" in _parentsAr)}) then {_unit removeMagazines _x;};sleep 0.01;} foreach magazines _unit;
{if (_unit canAdd _maR) then {_unit addmagazine _maR;};sleep 0.01;} foreach [0,1,2,3,4,5];
_unit addweapon _weR;
sleep 1;
if (primaryWeapon _unit != "") then {_unit selectweapon (primaryWeapon _unit);};




