
private ["_parents","_n","_count"];
SAOKls = [];
SAOKrs = [];
SAOKps = [];
SAOKunif = [];
SAOKvest = [];
SAOKpack = [];
SAOKitem = [];
SAOKmag = [];
SAOKhat = [];
SAOKglas = [];

_count = (count (configFile / "CfgWeapons")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgWeapons") select _count);
if ((getNumber (configfile >> "CfgWeapons" >> _n >> "scope")) != 0) then {
_parents = ((configFile / "CfgWeapons") select _count) call BIS_fnc_returnParents;
if ({configName _x in ["Rifle_Base_F","LIB_RIFLE","Rifle"]} count _parents > 0 && {_n != "Rifle_Base_F"}) then {SAOKrs pushBack _n;};
if ({configName _x in ["Launcher_Base_F","Launcher"]} count _parents > 0 && {_n != "Launcher_Base_F"}) then {SAOKls pushBack _n;};
if ({configName _x in ["Pistol_Base_F","LIB_PISTOL","Pistol"]} count _parents > 0 && {_n != "Pistol_Base_F"}) then {SAOKps pushBack _n;};
if ({configName _x in ["Uniform_Base"]} count _parents > 0) then {
_nameA = toArray _n;
_f = [_nameA select 0, _nameA select 1,_nameA select 2];
_f = toString _f;
if (_f != "U_O") then {
SAOKunif pushBack _n;
};
};
};
_count = _count - 1;
};
SAOKunif = SAOKunif call BIS_fnc_sortAlphabetically;

SAOKallveh = [];
_count = (count (configFile / "CfgVehicles")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgVehicles") select _count);
if ((getNumber (configfile >> "CfgVehicles" >> _n >> "scope")) != 0) then {
_parents = ((configFile / "CfgVehicles") select _count) call BIS_fnc_returnParents;
if ({configName _x in ["LandVehicle"]} count _parents > 0 && {_n != "LandVehicle"}) then {
SAOKallveh pushBack _n;
};
};
_count = _count - 1;
};

SAOKallveh = SAOKallveh call BIS_fnc_sortAlphabetically;

SAOKallairveh = [];
_count = (count (configFile / "CfgVehicles")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgVehicles") select _count);
if ((getNumber (configfile >> "CfgVehicles" >> _n >> "scope")) != 0) then {
_parents = ((configFile / "CfgVehicles") select _count) call BIS_fnc_returnParents;
if ({configName _x in ["Air"]} count _parents > 0 && {_n != "Air"}) then {
SAOKallairveh pushBack _n;
};
};
_count = _count - 1;
};

SAOKallairveh = SAOKallairveh call BIS_fnc_sortAlphabetically;

SAOKallunits = [];
_count = (count (configFile / "CfgVehicles")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgVehicles") select _count);
if ((getNumber (configfile >> "CfgVehicles" >> _n >> "scope")) != 0) then {
_parents = ((configFile / "CfgVehicles") select _count) call BIS_fnc_returnParents;
if ({configName _x in ["Man"]} count _parents > 0 && {_n != "CAManBase"}) then {
SAOKallunits pushBack _n;
};
};
_count = _count - 1;
};

SAOKallunits = SAOKallunits call BIS_fnc_sortAlphabetically;
sleep 0.5;
_count = (count (configFile / "CfgWeapons")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgWeapons") select _count);
if ((getNumber (configfile >> "CfgWeapons" >> _n >> "scope")) != 0) then {
_parents = ((configFile / "CfgWeapons") select _count) call BIS_fnc_returnParents;
if ({configName _x in ["Vest_NoCamo_Base","Vest_Camo_Base"]} count _parents > 0 && {!(_n in ["Vest_NoCamo_Base","Vest_Camo_Base"])}) then {
SAOKvest pushBack _n;
};
}; 
_count = _count - 1;
};
sleep 0.5;
_count = (count (configFile / "CfgVehicles")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgVehicles") select _count);
if ((getNumber (configfile >> "CfgVehicles" >> _n >> "scope")) != 0) then {
_parents = ((configFile / "CfgVehicles") select _count) call BIS_fnc_returnParents;
if ({configName _x in ["Bag_Base"]} count _parents > 0 && {_n != "Bag_Base"}) then {
SAOKpack pushBack _n;
};
}; 
_count = _count - 1;
};
sleep 0.5;
_count = (count (configFile / "CfgWeapons")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgWeapons") select _count);
if ((getNumber (configfile >> "CfgWeapons" >> _n >> "scope")) != 0) then {
_parents = ((configFile / "CfgWeapons") select _count) call BIS_fnc_returnParents;
//Item_U_B_CombatUniform_mcam_vest
_nameA = toArray _n;
if (_n != "" && {count _nameA > 5}) then {
_f = [_nameA select 0, _nameA select 1, _nameA select 2, _nameA select 3, _nameA select 4, _nameA select 5];
_f = toString _f;
if ({configName _x in ["ItemCore","Binocular"]} count _parents > 0 && {{configName _x in ["H_HelmetB","Vest_NoCamo_Base","Vest_Camo_Base","Uniform_Base"]} count _parents == 0} && {_n != "ItemCore"} && {_f != "Item_U"}) then {
SAOKitem pushBack _n;
};
};
}; 
_count = _count - 1;
};
sleep 0.5;
_count = (count (configFile / "CfgWeapons")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgWeapons") select _count);
if ((getNumber (configfile >> "CfgWeapons" >> _n >> "scope")) != 0) then {
_parents = ((configFile / "CfgWeapons") select _count) call BIS_fnc_returnParents;
_nameA = toArray _n;
if (_n != "" && {count _nameA > 1}) then {
_f = [_nameA select 0, _nameA select 1];
_f = toString _f;
if (({configName _x in ["H_HelmetB"]} count _parents > 0 && {_n != "H_HelmetB"}) || {_f == "H_"}) then {
SAOKhat pushBack _n;
};
};
}; 
_count = _count - 1;
};
sleep 0.5;
_count = (count (configFile / "CfgMagazines")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgMagazines") select _count);
if ((getNumber (configfile >> "CfgMagazines" >> _n >> "scope")) != 0 && {getText(configfile >> "CfgMagazines" >> _n >> "displayName") != ""}) then {
SAOKmag pushBack _n;
};
_count = _count - 1;
};
sleep 0.5;
_count = (count (configFile / "CfgGlasses")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgGlasses") select _count);
if ((getNumber (configfile >> "CfgGlasses" >> _n >> "scope")) != 0 && {getText(configfile >> "CfgGlasses" >> _n >> "displayName") != ""}) then {
SAOKglas pushBack _n;
};
_count = _count - 1;
};
sleep 0.5;
_count = (count (configFile / "CfgVehicles")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgVehicles") select _count);
if ((getNumber (configfile >> "CfgVehicles" >> _n >> "scope")) != 0 && {getText(configfile >> "CfgVehicles" >> _n >> "displayName") != ""}) then {
if ((_n iskindof "SoldierWB" || {_n iskindof "SoldierGB"}) && {{_n == _x} count FRIENDC4 + FRIENDC3 + FRIENDC2 + FRIENDC1 == 0}) then {
FRIENDC5 pushBack _n;
};
};
_count = _count - 1;
};



