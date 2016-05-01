private ["_pic"];
//Vehicles
_pic = "";
if (typename _this == "STRING") then {
_pic = if (_this != "" && {isClass(configfile >> "CfgWeapons" >> _this)}) then {getText(configfile >> "CfgWeapons" >> _this >> "picture")} else {""};
} else {
_ar = "CfgVehicles";
if (count _this > 1) then {_ar = "CfgGlasses";};
_pic = if ((_this select 0) != "" && {isClass(configfile >> _ar >> (_this select 0))}) then {getText(configfile >> _ar >> (_this select 0) >> "picture")} else {""}; 
};
_pic