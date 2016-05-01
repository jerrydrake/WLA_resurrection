private ["_crate","_gP","_mags","_weps","_its","_bs","_data"];
_crate = _this select 0;
_gP = _this select 1;
_mags =  if (!isNil{getMagazineCargo _crate}) then {getMagazineCargo _crate} else {[]};  
_weps = if (!isNil{getWeaponCargo _crate}) then {getWeaponCargo _crate} else {[]};  
_its = if (!isNil{itemCargo _crate}) then {itemCargo _crate} else {[]}; 
_bs = if (!isNil{backpackCargo _crate}) then {backpackCargo _crate} else {[]};  
_data = [_weps,_mags,_its,_bs];
_gP setvariable ["CrateC",_data];
