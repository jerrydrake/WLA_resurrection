SaOkGearPrimW = []; 
SaOkGearSecW = [];
SaOkGearPistol = [];
SaOkGearHat = [["H_HelmetB_camo",1],["H_Booniehat_khk",1]];
SaOkGearFatigue = [];
SaOkGearVest = [["V_Rangemaster_belt",1],["V_BandollierB_rgr",1]];
SaOkGearBackPack = [];
SaOkGearAttachments = [];
SaOkGearOther = [];
SaOkGearGlasses = [];
SaOkGearPic=compile preprocessfileLineNumbers "SaOkGearPic.sqf";
SaOkGear=compile preprocessfileLineNumbers "SaOkGear.sqf";
missionNameSpace setvariable ["LastIPic",""];

SAOKGATHERWEAPON = {

private ["_parentsAr"];
_parentsAr = [(configfile >> "CfgWeapons" >> _this),true] call BIS_fnc_returnParents;
if ("Pistol" in _parentsAr) then {
SaOkGearPistol = [SaOkGearPistol,_this,1] CALL SAOKADDORREMOVE;
};
if ("Rifle" in _parentsAr) then {
SaOkGearPrimW = [SaOkGearPrimW,_this,1] CALL SAOKADDORREMOVE;
};
if ("Launcher" in _parentsAr) then {
SaOkGearSecW = [SaOkGearSecW,_this,1] CALL SAOKADDORREMOVE;
};
deletevehicle _this;
};

//SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;
SAOKGATHERUNIT = {

private ["_nameA","_f"];
{SaOkGearOther = [SaOkGearOther,_x,1] CALL SAOKADDORREMOVE;} foreach (magazines _this);
{
_nameA = toArray _x;
_f = [_nameA select 0, _nameA select 1,_nameA select 2];
_f = toString _f;
if !(_f in ["muz","opt","acc"]) then {
SaOkGearOther = [SaOkGearOther,_x,1] CALL SAOKADDORREMOVE;
} else {
SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;
};
} foreach items _this;
if (primaryWeapon _this != "") then {if (count (primaryWeaponMagazine _this) > 0) then {SaOkGearOther = [SaOkGearOther,((primaryWeaponMagazine _this) select 0),1] CALL SAOKADDORREMOVE;};SaOkGearPrimW = [SaOkGearPrimW,primaryWeapon _this,1] CALL SAOKADDORREMOVE;};
if (secondaryWeapon _this != "") then {if (count (secondaryWeaponMagazine _this) > 0) then {SaOkGearOther = [SaOkGearOther,((secondaryWeaponMagazine _this) select 0),1] CALL SAOKADDORREMOVE;};SaOkGearSecW = [SaOkGearSecW,secondaryWeapon _this,1] CALL SAOKADDORREMOVE;};
if (handgunWeapon _this != "") then {if (count (handgunMagazine _this) > 0) then {SaOkGearOther = [SaOkGearOther,((handgunMagazine _this) select 0),1] CALL SAOKADDORREMOVE;};SaOkGearPistol = [SaOkGearPistol,handgunWeapon _this,1] CALL SAOKADDORREMOVE;};
if (backpack _this != "") then {SaOkGearBackPack = [SaOkGearBackPack,backpack _this,1] CALL SAOKADDORREMOVE;removeBackPack _this;};
if (vest _this != "") then {SaOkGearVest = [SaOkGearVest,vest _this,1] CALL SAOKADDORREMOVE;removeVest _this;};
removeallweapons _this;
};
SAOKGATHERCRATEB = {
private ["_bol"];
_bol = false;
{if (count (_x select 0) > 0) exitWith {_bol = true};} foreach [(getBackpackCargo _this),(getItemCargo _this),(getMagazineCargo _this),(getWeaponCargo _this)];
_bol
};

SAOKGATHERCRATE = {
private ["_ar","_arN","_parentsAr","_forEachIndex","_nameA","_f"];
_ar = (getBackpackCargo _this);
_arN = (_ar select 1);
{SaOkGearBackPack = [SaOkGearBackPack,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;} foreach (_ar select 0);
_ar = (getItemCargo _this);
_arN = (_ar select 1);
{
_nameA = toArray _x;
_f = [_nameA select 0, _nameA select 1,_nameA select 2];
_f = toString _f;
if !(_f in ["muz","opt","acc"]) then {
SaOkGearOther = [SaOkGearOther,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
} else {
SaOkGearAttachments = [SaOkGearAttachments,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
};
} foreach (_ar select 0);
_ar = (getMagazineCargo _this);
_arN = (_ar select 1);
{SaOkGearOther = [SaOkGearOther,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;} foreach (_ar select 0);
_ar = (getWeaponCargo _this);
_arN = (_ar select 1);
{
_parentsAr = [(configfile >> "CfgWeapons" >> _x),true] call BIS_fnc_returnParents;
if ("Pistol" in _parentsAr) then {
SaOkGearPistol = [SaOkGearPistol,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
};
if ("Rifle" in _parentsAr) then {
SaOkGearPrimW = [SaOkGearPrimW,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
};
if ("Launcher" in _parentsAr) then {
SaOkGearSecW = [SaOkGearSecW,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
};
} foreach (_ar select 0);
clearWeaponCargo _this;
clearMagazineCargo _this;
clearBackPackCargo _this;
clearItemCargo _this;
};
SAOKGATHERVEHICLE = {
private ["_ar","_parentsAr","_arN","_forEachIndex","_nameA","_f"];
_ar = (getBackpackCargo _this);
_arN = (_ar select 1);
{SaOkGearBackPack = [SaOkGearBackPack,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;} foreach (_ar select 0);
_ar = (getItemCargo _this);
_arN = (_ar select 1);
{
_nameA = toArray _x;
_f = [_nameA select 0, _nameA select 1,_nameA select 2];
_f = toString _f;
if !(_f in ["muz","opt","acc"]) then {
SaOkGearOther = [SaOkGearOther,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
} else {
SaOkGearAttachments = [SaOkGearAttachments,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
};
} foreach (_ar select 0);
_ar = (getMagazineCargo _this);
_arN = (_ar select 1);
{SaOkGearOther = [SaOkGearOther,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;} foreach (_ar select 0);
_ar = (getWeaponCargo _this);
_arN = (_ar select 1);
{
_parentsAr = [(configfile >> "CfgWeapons" >> _x),true] call BIS_fnc_returnParents;
if ("Pistol" in _parentsAr) then {
SaOkGearPistol = [SaOkGearPistol,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
};
if ("Rifle" in _parentsAr) then {
SaOkGearPrimW = [SaOkGearPrimW,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
};
if ("Launcher" in _parentsAr) then {
SaOkGearSecW = [SaOkGearSecW,_x,(_arN select _forEachIndex)] CALL SAOKADDORREMOVE;
};
} foreach (_ar select 0);
clearWeaponCargo _this;
clearMagazineCargo _this;
clearBackPackCargo _this;
clearItemCargo _this;
};

SAOKADDORREMOVE = {
private ["_Ar","_change","_w","_forEachIndex","_f"];
_Ar = + (_this select 0);
_w = _this select 1;
_change = _this select 2;
if (isNil"_w" || {isNil"_change"} || {_w == ""} || {typename _change != "SCALAR"}) exitWith {_Ar};
//_w = "";
//{if (_item == _x select 1) exitWith {_w = _x select 0;};} foreach (missionNameSpace getvariable "helpD");
if (_change > 0) then {
_f = false;
{if (_w == _x select 0) exitWith {_Ar set [_forEachIndex,[(_x select 0),(_x select 1)+_change]];_f = true;};} foreach _Ar;
if (!_f) then {_Ar set [count _Ar, [_w, _change]];};
} else {
{
if (_w == _x select 0) exitWith {
if ((_x select 1)-1 > 0) then {
_Ar set [_forEachIndex,[(_x select 0),(_x select 1)-1]];
} else {
_Ar = [_Ar,_forEachIndex] call SAOKREMINDEX;
};
};
} foreach _Ar;
};
_Ar
};

SAOKDESTROYATTACHMENTS = {
_w = "";
if (_this == "") ExitWith {};
{if (_this == _x select 1) exitWith {_w = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (_w != "") then {
{
if (_w == _x select 0) exitWith {
SaOkGearAttachments = [SaOkGearAttachments,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearAttachments;
};
};

SAOKREMOVEATTACHMENTS = {
switch (_this) do {
case "W": {
if (primaryweapon VariSelectedUnit != "") then {
{if (_x != "") then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach primaryWeaponItems VariSelectedUnit;
removeAllPrimaryWeaponItems VariSelectedUnit;
};
};
case "P": {
if (handgunWeapon VariSelectedUnit != "") then {
{if (_x != "") then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach handgunItems VariSelectedUnit;
removeAllhandgunItems VariSelectedUnit;
};
};
};
};

SAOKADDITEM = {
private ["_item","_f","_m","_mode"];
_f = {
private ["_nameA","_f"];
_nameA = toArray _this;
_f = [_nameA select 0, _nameA select 1,_nameA select 2];
_f = toString _f;
if !(_f in ["muz","opt","acc"]) then {
SaOkGearOther = [SaOkGearOther,_this,0] CALL SAOKADDORREMOVE;
} else {
SaOkGearAttachments = [SaOkGearAttachments,_this,0] CALL SAOKADDORREMOVE;
};
};
_item = "";
if (_this == "") ExitWith {};
missionNameSpace setvariable ["LastIPic",_this];
{if (_this == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
_mode = (missionNameSpace getvariable "Wmode");
switch (_mode) do {
case "F": {
if (!isClass(configFile >> "cfgMagazines" >> _item) && {VariSelectedUnit canAddItemToUniform _item;}) then {VariSelectedUnit AddItemToUniform _item;_item CALL _f;};
if (isClass(configFile >> "cfgMagazines" >> _item)) then {_m = {_item == _x} count (magazines VariSelectedUnit); VariSelectedUnit addmagazine _item;if (_m != {_item == _x} count (magazines VariSelectedUnit)) then {_item CALL _f;};}; 
};
case "B": {
if (!isClass(configFile >> "cfgMagazines" >> _item) && {VariSelectedUnit canAddItemToBackpack _item;}) then {VariSelectedUnit AddItemToBackpack _item;_item CALL _f;};
if (isClass(configFile >> "cfgMagazines" >> _item)) then {_m = {_item == _x} count (magazines VariSelectedUnit); VariSelectedUnit addmagazine _item;if (_m != {_item == _x} count (magazines VariSelectedUnit)) then {_item CALL _f;};}; 
};
case "V": {
if (!isClass(configFile >> "cfgMagazines" >> _item) && {VariSelectedUnit canAddItemToVest _item;}) then {VariSelectedUnit AddItemToVest _item;_item CALL _f;};
if (isClass(configFile >> "cfgMagazines" >> _item)) then {_m = {_item == _x} count (magazines VariSelectedUnit); VariSelectedUnit addmagazine _item;if (_m != {_item == _x} count (magazines VariSelectedUnit)) then {_item CALL _f;};}; 
};
};
};


SAOKGEARGCHANGE = {

private ["_item"];
_item = "";
if (_this == "") ExitWith {};
{if (_this == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (headgear VariSelectedUnit != "") then {
SaOkGearGlasses = [SaOkGearGlasses,goggles VariSelectedUnit,1] CALL SAOKADDORREMOVE;
removegoggles VariSelectedUnit;
};
if (_this != "None") then {
SaOkGearGlasses = [SaOkGearGlasses,_item,0] CALL SAOKADDORREMOVE;
VariSelectedUnit addgoggles _item;
};
};

SAOKGEARHCHANGE = {

private ["_item"];
_item = "";
if (_this == "") ExitWith {};
{if (_this == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (headgear VariSelectedUnit != "") then {
SaOkGearHat = [SaOkGearHat,headgear VariSelectedUnit,1] CALL SAOKADDORREMOVE;
removeheadgear VariSelectedUnit;
};
if (_this != "None") then {
SaOkGearHat = [SaOkGearHat,_item,0] CALL SAOKADDORREMOVE;
VariSelectedUnit addheadgear _item;
};
};

SAOKGEARCDEL = {

private ["_item","_f1","_f2","_mode"];
_item = "";
_f1 = {
//MAGAZINE CARGO

private ["_num","_con","_cW","_c"];
_con = _this;
_cW = + (_con select 0);
_c = count _cW - 1;
for "_i" from 0 to _c do {
private ["_class"];
_class = _cW select _i;
_num = (_con select 1) select _i;
while {_num > 0} do {
_num = _num -1;
SaOkGearOther = [SaOkGearOther,_class,1] CALL SAOKADDORREMOVE;
};
};
};
_f2 = {
//ITEM CARGO

private ["_cW","_c"];
_cW = _this;
_c = count _cW - 1;
for "_i" from 0 to _c do {
private ["_class","_nameA","_f"];
_class = _cW select _i;
_nameA = toArray _class;
_f = [_nameA select 0, _nameA select 1,_nameA select 2];
_f = toString _f;
if !(_f in ["muz","opt","acc"]) then {
SaOkGearOther = [SaOkGearOther,_class,1] CALL SAOKADDORREMOVE;
} else {
SaOkGearAttachments = [SaOkGearAttachments,_class,1] CALL SAOKADDORREMOVE;
};
};
};


_mode = (missionNameSpace getvariable "Wmode");
switch (_mode) do {
case "F": {
if (!isnull (uniformContainer VariSelectedUnit)) then {
SaOkGearFatigue = [SaOkGearFatigue,uniform VariSelectedUnit,1] CALL SAOKADDORREMOVE;
(itemCargo (uniformContainer VariSelectedUnit)) CALL _f2;
(getMagazineCargo (uniformContainer VariSelectedUnit)) CALL _f1;
removeUniform VariSelectedUnit;
};

};
case "B": {
if (!isnull (BackPackContainer VariSelectedUnit)) then {
SaOkGearBackPack = [SaOkGearBackPack,BackPack VariSelectedUnit,1] CALL SAOKADDORREMOVE;
(itemCargo (BackPackContainer VariSelectedUnit)) CALL _f2;
(getMagazineCargo (BackPackContainer VariSelectedUnit)) CALL _f1;
removeBackPack VariSelectedUnit;
};

};
case "V": {
if (!isnull (VestContainer VariSelectedUnit)) then {
SaOkGearVest = [SaOkGearVest,vest VariSelectedUnit,1] CALL SAOKADDORREMOVE;
(itemCargo (VestContainer VariSelectedUnit)) CALL _f2;
(getMagazineCargo (VestContainer VariSelectedUnit)) CALL _f1;
removeVest VariSelectedUnit;
};

};
};

};

SAOKGEARCCHANGE = {

private ["_item","_f1","_f2","_mode"];
_item = "";
_f1 = {
//MAGAZINE CARGO

private ["_num","_con","_cW","_c"];
_con = _this;
_cW = + (_con select 0);
_c = count _cW - 1;
for "_i" from 0 to _c do {
private ["_class"];
_class = _cW select _i;
_num = (_con select 1) select _i;
while {_num > 0} do {
_num = _num -1;
SaOkGearOther = [SaOkGearOther,_class,1] CALL SAOKADDORREMOVE;
};
};
};
_f2 = {
//ITEM CARGO

private ["_cW","_c"];
_cW = _this;
_c = count _cW - 1;
for "_i" from 0 to _c do {
private ["_class","_nameA","_f"];
_class = _cW select _i;
_nameA = toArray _class;
_f = [_nameA select 0, _nameA select 1,_nameA select 2];
_f = toString _f;
if !(_f in ["muz","opt","acc"]) then {
SaOkGearOther = [SaOkGearOther,_class,1] CALL SAOKADDORREMOVE;
} else {
SaOkGearAttachments = [SaOkGearAttachments,_class,1] CALL SAOKADDORREMOVE;
};
};
};

if (_this == "") ExitWith {};
{if (_this == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
_mode = (missionNameSpace getvariable "Wmode");
switch (_mode) do {
case "F": {
if (!isnull (uniformContainer VariSelectedUnit)) then {
SaOkGearFatigue = [SaOkGearFatigue,uniform VariSelectedUnit,1] CALL SAOKADDORREMOVE;
(itemCargo (uniformContainer VariSelectedUnit)) CALL _f2;
(getMagazineCargo (uniformContainer VariSelectedUnit)) CALL _f1;
removeuniform VariSelectedUnit;
};
SaOkGearFatigue = [SaOkGearFatigue,_item,0] CALL SAOKADDORREMOVE;
[VariSelectedUnit,_item] CALL SAOKADDUNIFORM;
clearMagazineCargo uniformContainer VariSelectedUnit;
clearWeaponCargo uniformContainer VariSelectedUnit;
clearItemCargo uniformContainer VariSelectedUnit;
};
case "B": {
if (!isnull (BackPackContainer VariSelectedUnit)) then {
SaOkGearBackPack = [SaOkGearBackPack,BackPack VariSelectedUnit,1] CALL SAOKADDORREMOVE;
(itemCargo (BackPackContainer VariSelectedUnit)) CALL _f2;
(getMagazineCargo (BackPackContainer VariSelectedUnit)) CALL _f1;
removebackpack VariSelectedUnit;
};
SaOkGearBackPack = [SaOkGearBackPack,_item,0] CALL SAOKADDORREMOVE;
VariSelectedUnit addBackPack _item;
clearMagazineCargo BackPackContainer VariSelectedUnit;
clearWeaponCargo BackPackContainer VariSelectedUnit;
clearItemCargo BackPackContainer VariSelectedUnit;
};
case "V": {
if (!isnull (VestContainer VariSelectedUnit)) then {
SaOkGearVest = [SaOkGearVest,vest VariSelectedUnit,1] CALL SAOKADDORREMOVE;
(itemCargo (VestContainer VariSelectedUnit)) CALL _f2;
(getMagazineCargo (VestContainer VariSelectedUnit)) CALL _f1;
removevest VariSelectedUnit;
};
SaOkGearVest = [SaOkGearVest,_item,0] CALL SAOKADDORREMOVE;
VariSelectedUnit addVest _item;
clearMagazineCargo VestContainer VariSelectedUnit;
clearWeaponCargo VestContainer VariSelectedUnit;
clearItemCargo VestContainer VariSelectedUnit;
};
};

};

SAOKREMOVEITEM = {
private ["_item","_f","_mode"];
_item = "";
_f = {
private ["_nameA","_f"];
_nameA = toArray _this;
_f = [_nameA select 0, _nameA select 1,_nameA select 2];
_f = toString _f;
if !(_f in ["muz","opt","acc"]) then {
SaOkGearOther = [SaOkGearOther,_this,1] CALL SAOKADDORREMOVE;
} else {
SaOkGearAttachments = [SaOkGearAttachments,_this,1] CALL SAOKADDORREMOVE;
};
};
if (_this == "") ExitWith {};
missionNameSpace setvariable ["LastIPic2",_this];
{if (_this == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
_mode = (missionNameSpace getvariable "Wmode");
switch (_mode) do {
case "F": {
if (!isClass(configFile >> "cfgMagazines" >> _item)) then {
VariSelectedUnit removeItemFromUniform _item;_item CALL _f;
} else {
VariSelectedUnit removemagazine _item;_item CALL _f;
};
};
case "B": {
if (!isClass(configFile >> "cfgMagazines" >> _item)) then {
VariSelectedUnit removeItemFromBackpack _item;_item CALL _f;
} else {
VariSelectedUnit removemagazine _item;_item CALL _f;
};
};
case "V": {
if (!isClass(configFile >> "cfgMagazines" >> _item)) then {
VariSelectedUnit removeItemFromVest _item;_item CALL _f;
} else {
VariSelectedUnit removemagazine _item;_item CALL _f;
};
};
};
};

//SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;
SAOKADDATTACHMENT = {
private ["_w","_mode","_pr"];
_w = "";
if (_this == "") ExitWith {};
{if (_this == _x select 1) exitWith {_w = _x select 0};} foreach (missionNameSpace getvariable "helpD");
_mode = missionNameSpace getvariable "Wmode";
switch (_mode) do {
case "W": {
_pr = primaryweaponItems VariSelectedUnit;
_pr = _pr - [""];
if (primaryweapon VariSelectedUnit != "" && {!(_w in primaryweaponItems VariSelectedUnit)}) then {
VariSelectedUnit addprimaryweaponItem _w; 
if (_w in primaryweaponItems VariSelectedUnit) then {
SaOkGearAttachments = [SaOkGearAttachments,_w,0] CALL SAOKADDORREMOVE;
//{if (_x == _w) exitWith {SaOkGearAttachments = [SaOkGearAttachments,_forEachIndex] call SAOKREMINDEX;};} foreach SaOkGearAttachments;
};
{if !(_x in (primaryweaponItems VariSelectedUnit)) then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach _pr;
};
};
case "P": {
_pr = handgunItems VariSelectedUnit;
_pr = _pr - [""];
if (handgunWeapon VariSelectedUnit != "" && {!(_w in handgunItems VariSelectedUnit)}) then {
VariSelectedUnit addHandgunItem _w; 
if (_w in handgunItems VariSelectedUnit) then {
SaOkGearAttachments = [SaOkGearAttachments,_w,0] CALL SAOKADDORREMOVE;
//{if (_x == _w) exitWith {SaOkGearAttachments = [SaOkGearAttachments,_forEachIndex] call SAOKREMINDEX;};} foreach SaOkGearAttachments;
};
{if !(_x in (handgunItems VariSelectedUnit)) then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach _pr;
};
};
};
};

SAOKGEARWDES = {
private ["_mode","_w"];
_w = "";
if (_this == "") ExitWith {};
{if (_this == _x select 1) exitWith {_w = _x select 0};} foreach (missionNameSpace getvariable "helpD");
_mode = missionNameSpace getvariable "Wmode";
switch (_mode) do {
case "W": {
{
if (_w == _x select 0) exitWith {
SaOkGearPrimW = [SaOkGearPrimW,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearPrimW;
};
case "S": {
{
if (_w == _x select 0) exitWith {
SaOkGearSecW = [SaOkGearSecW,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearSecW;
};
case "P": {
{
if (_w == _x select 0) exitWith {
SaOkGearPistol = [SaOkGearPistol,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearPistol;
};
};
};

SAOKGEARWDEL = {
private ["_mode"];
_mode = missionNameSpace getvariable "Wmode";
switch (_mode) do {
case "W": {
if (primaryweapon VariSelectedUnit != "") then {
{if (_x != "") then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach primaryWeaponItems VariSelectedUnit;
SaOkGearPrimW = + ([SaOkGearPrimW,primaryweapon VariSelectedUnit,1] CALL SAOKADDORREMOVE);
if (count (primaryWeaponMagazine VariSelectedUnit) > 0) then {SaOkGearOther = [SaOkGearOther,((primaryWeaponMagazine VariSelectedUnit) select 0),1] CALL SAOKADDORREMOVE;};
VariSelectedUnit removeweapon (primaryweapon VariSelectedUnit); 
};

};
case "S": {
if (secondaryweapon VariSelectedUnit != "") then {
//{if (_x != "") then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach secondaryweapon VariSelectedUnit;
SaOkGearSecW = +([SaOkGearSecW,secondaryweapon VariSelectedUnit,1] CALL SAOKADDORREMOVE);
if (count (secondaryWeaponMagazine VariSelectedUnit) > 0) then {SaOkGearOther = [SaOkGearOther,((secondaryWeaponMagazine VariSelectedUnit) select 0),1] CALL SAOKADDORREMOVE;};
VariSelectedUnit removeweapon (secondaryweapon VariSelectedUnit); 
};

};
case "P": {
if (handgunWeapon VariSelectedUnit != "") then {
{if (_x != "") then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach handgunItems VariSelectedUnit;
SaOkGearPistol = +([SaOkGearPistol,handgunWeapon VariSelectedUnit,1] CALL SAOKADDORREMOVE);
if (count (handgunMagazine VariSelectedUnit) > 0) then {SaOkGearOther = [SaOkGearOther,((handgunMagazine VariSelectedUnit) select 0),1] CALL SAOKADDORREMOVE;};
VariSelectedUnit removeweapon (handgunWeapon VariSelectedUnit); 
};

};
};
};

SAOKGEARWCHANGE = {
private ["_w","_mode"];
_w = "";
if (_this == "") ExitWith {};
{if (_this == _x select 1) exitWith {_w = _x select 0};} foreach (missionNameSpace getvariable "helpD");
_mode = missionNameSpace getvariable "Wmode";
switch (_mode) do {
case "W": {
if (primaryweapon VariSelectedUnit != "") then {
{if (_x != "") then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach primaryWeaponItems VariSelectedUnit;
//removeAllPrimaryWeaponItems VariSelectedUnit; SaOkGearPrimW = [SaOkGearPrimW,_w,0] CALL SAOKADDORREMOVE;
SaOkGearPrimW = + ([SaOkGearPrimW,primaryweapon VariSelectedUnit,1] CALL SAOKADDORREMOVE);
if (count (primaryWeaponMagazine VariSelectedUnit) > 0) then {SaOkGearOther = [SaOkGearOther,((primaryWeaponMagazine VariSelectedUnit) select 0),1] CALL SAOKADDORREMOVE;};
};
SaOkGearPrimW = + ([SaOkGearPrimW,_w,0] CALL SAOKADDORREMOVE);
VariSelectedUnit addweapon _w;
removeAllPrimaryWeaponItems VariSelectedUnit;
};
case "S": {
if (secondaryweapon VariSelectedUnit != "") then {
//{if (_x != "") then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach secondaryweapon VariSelectedUnit;
SaOkGearSecW = +([SaOkGearSecW,secondaryweapon VariSelectedUnit,1] CALL SAOKADDORREMOVE);
if (count (secondaryWeaponMagazine VariSelectedUnit) > 0) then {SaOkGearOther = [SaOkGearOther,((secondaryWeaponMagazine VariSelectedUnit) select 0),1] CALL SAOKADDORREMOVE;};
};
SaOkGearSecW = +([SaOkGearSecW,_w,0] CALL SAOKADDORREMOVE);
VariSelectedUnit addweapon _w;
};
case "P": {
if (handgunWeapon VariSelectedUnit != "") then {
{if (_x != "") then {SaOkGearAttachments = [SaOkGearAttachments,_x,1] CALL SAOKADDORREMOVE;};} foreach handgunItems VariSelectedUnit;
SaOkGearPistol = +([SaOkGearPistol,handgunWeapon VariSelectedUnit,1] CALL SAOKADDORREMOVE);
if (count (handgunMagazine VariSelectedUnit) > 0) then {SaOkGearOther = [SaOkGearOther,((handgunMagazine VariSelectedUnit) select 0),1] CALL SAOKADDORREMOVE;};
};
SaOkGearPistol = +([SaOkGearPistol,_w,0] CALL SAOKADDORREMOVE);
VariSelectedUnit addweapon _w;
removeAllHandgunItems VariSelectedUnit;
};
};

};

SAOKGEARW = {
private ["_AMMOSTATE2","_ctrl2","_ctrl","_Wpic2","_AMMOSTATE","_text","_ok","_myDisplay","_Wpic","_items","_helpD","_class","_kuva2"];
disableserialization;
_ok = createDialog "SaOkGearDialogW"; 
_myDisplay = findDisplay 1991;
_ctrl = _myDisplay displayCtrl 1500;
_ctrl2 = _myDisplay displayCtrl 1501;
sleep 0.1;
_Wpic = "";
_Wpic2 = "";
_items = ["","",""];
_helpD = [];
_text = "";
_AMMOSTATE = {
private ["_text","_Allowedmags","_c","_mag"];
_text = "";
_Allowedmags = [];
_c = 0;
switch (_this) do {
case "W": {
if (primaryweapon VariSelectedUnit != "") then {
_Allowedmags = _Allowedmags + (getArray(configfile >> "CfgWeapons" >> (primaryweapon VariSelectedUnit) >> "magazines"));
} else {_text = "No Weapon Selected";_c = -1;};
};
case "S": {
if (secondaryweapon VariSelectedUnit != "") then {
_Allowedmags = _Allowedmags + (getArray(configfile >> "CfgWeapons" >> (secondaryweapon VariSelectedUnit) >> "magazines"));
} else {_text = "No Weapon Selected";_c = -1;};
};
case "P": {
if (handgunweapon VariSelectedUnit != "") then {
_Allowedmags = _Allowedmags + (getArray(configfile >> "CfgWeapons" >> (handgunweapon VariSelectedUnit) >> "magazines"));
} else {_text = "No Weapon Selected";_c = -1;};
};
};

if (_c == 0) then {
{_mag = _x; {if (_mag == (_x select 0)) exitWith {_c = _c + (_x select 1);};} foreach SaOkGearOther;} foreach _Allowedmags;
{_mag = _x; {if (_mag == _x) then {_c = _c + 1;};} foreach (magazines VariSelectedUnit);} foreach _Allowedmags;
_text = format ["Storage: %1 Magazines", _c];
};
_text
};
_AMMOSTATE2 = {
private ["_Allowedmags","_c","_mag"];
_Allowedmags = [];
_c = 0;
_Allowedmags = _Allowedmags + (getArray(configfile >> "CfgWeapons" >> _this >> "magazines"));
if (_c == 0) then {
{_mag = _x; {if (_mag == (_x select 0)) exitWith {_c = _c + (_x select 1);};} foreach SaOkGearOther;} foreach _Allowedmags;
{_mag = _x; {if (_mag == _x) then {_c = _c + 1;};} foreach (magazines VariSelectedUnit);} foreach _Allowedmags;
};
_c
};
switch (_this) do {
//SPEEDBOATS displayName = "Vermin SMG .45 ACP"; getText(configfile >> "CfgVehicles" >> (_this select 0) >> "picture")
case "W": {
_text = "W" CALL _AMMOSTATE;
_Wpic = (primaryWeapon VariSelectedUnit) CALL SaOkGearPic;_items = (primaryWeaponItems VariSelectedUnit);
{
_class = (_x select 0);
lbAdd [1500, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1)+ format [" (x%1 Magazines Avail.)",(_class CALL _AMMOSTATE2)])];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearPrimW;
lbSetCurSel [1500, 0];
{
_class = (_x select 0);
lbAdd [1501, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl2 lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearAttachments;
lbSetCurSel [1501, 0];
};
case "S": {
_text = "S" CALL _AMMOSTATE;
_Wpic = (secondaryWeapon VariSelectedUnit) CALL SaOkGearPic;_items = (secondaryWeaponItems VariSelectedUnit);
{
_class = (_x select 0);
lbAdd [1500, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1)+ format [" (x%1 Magazines Avail.)",(_class CALL _AMMOSTATE2)])];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearSecW;
lbSetCurSel [1500, 0];
{
_class = (_x select 0);
lbAdd [1501, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl2 lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] +(["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearAttachments;
lbSetCurSel [1501, 0];
};
case "P": {
_text = "P" CALL _AMMOSTATE;
_Wpic = (handGunWeapon VariSelectedUnit) CALL SaOkGearPic;_items = (handGunItems VariSelectedUnit);
{
_class = (_x select 0);
lbAdd [1500, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1)+ format [" (x%1 Magazines Avail.)",(_class CALL _AMMOSTATE2)])];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearPistol;
lbSetCurSel [1500, 0];
{
_class = (_x select 0);
lbAdd [1501, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl2 lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] +(["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearAttachments;
lbSetCurSel [1501, 0];
};
};

(_myDisplay displayCtrl 1100) ctrlSetStructuredText parseText _text;

missionNameSpace setvariable ["helpD",_helpD];
missionNameSpace setvariable ["Wmode",_this];
if (count _items != 3) then {_items = ["","",""];};
ctrlSetText [1200, _Wpic]; 
/*
ctrlSetText [1201, (_items select 0) CALL SaOkGearPic]; 
ctrlSetText [1202, (_items select 1) CALL SaOkGearPic]; 
ctrlSetText [1203, (_items select 2) CALL SaOkGearPic];
*/
_att = "Carrying";
if ({_x != ""} count _items == 0) then {_att = _att + " none"};
{if (_x != "") then {_att = _att + "<br/>"+ (format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgWeapons" >> _x >> "picture"))]) + " " + (gettext (configfile >> "CfgWeapons" >> _x >> "displayName"));};} foreach _items;
(_myDisplay displayCtrl 1101) ctrlSetStructuredText (parseText _att);
_att = "Selection";
(_myDisplay displayCtrl 1102) ctrlSetStructuredText (parseText _att);
_kuva2 = [];
{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_kuva2 = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (typename _kuva2 == "STRING") then {_Wpic2 = _kuva2 CALL SaOkGearPic;ctrlSetText [1204, _Wpic2];};
};
SAOKGEARG = {
private ["_ctrl","_ok","_myDisplay","_Wpic","_helpD","_class","_item"];
disableserialization;
_ok = createDialog "SaOkGearDialogG"; 
_myDisplay = findDisplay 1999;
_ctrl = _myDisplay displayCtrl 1500;
_Wpic = [(goggles VariSelectedUnit),""] CALL SaOkGearPic;
ctrlSetText [1200, _Wpic]; 
_helpD = [];
lbAdd [1500, "None"];
{
_class = (_x select 0);
lbAdd [1500, getText(configfile >> "CfgGlasses" >> _class >> "displayName")];
_ctrl lbSetPicture [(_foreachindex+1),gettext (configfile >> "CfgGlasses" >> _class >> "picture")];
_ctrl lbSetTooltip [(_foreachindex+1),(format ["x%1 ",(_x select 1)] + getText(configfile >> "CfgGlasses" >> _class >> "displayName"))];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgGlasses" >> _class >> "displayName")]];
} foreach SaOkGearGlasses;
lbSetCurSel [1500, 0];
missionNameSpace setvariable ["helpD",_helpD];
_Wpic = "";
_item = [];
{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable "helpD");
if (typename _item == "STRING") then {
_Wpic = [_item,""] CALL SaOkGearPic;
ctrlSetText [1201, _Wpic];
} else {ctrlSetText [1201, ""];};
};

SAOKGEARH = {
private ["_ctrl","_ok","_myDisplay","_Wpic","_helpD","_class","_item"];
disableserialization;
_ok = createDialog "SaOkGearDialogH"; 
_myDisplay = findDisplay 1993;
_ctrl = _myDisplay displayCtrl 1500;
_Wpic = (headgear VariSelectedUnit) CALL SaOkGearPic;
ctrlSetText [1200, _Wpic]; 
_helpD = [];
lbAdd [1500, "None"];
{
_class = (_x select 0);
lbAdd [1500, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl lbSetPicture [(_foreachindex+1),gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl lbSetTooltip [(_foreachindex+1),(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearHat;
lbSetCurSel [1500, 0];
missionNameSpace setvariable ["helpD",_helpD];
_Wpic = "";
_item = [];
{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable "helpD");
if (typename _item == "STRING") then {
_Wpic = _item CALL SaOkGearPic;
ctrlSetText [1201, _Wpic];
} else {ctrlSetText [1201, ""];};
};

SAOKGEARCSHOPBUY = {
private ["_item"];
if (_this select 0 == "") ExitWith {};
_item = "";
{if (_this select 0 == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (_item !="") then {
hint format ["+%2 %1 now available in fatigue selection",_this select 0,_this select 1];
SaOkGearFatigue = [SaOkGearFatigue,_item,_this select 1] CALL SAOKADDORREMOVE;
};
};

SAOKBUYWEAPON = {

private ["_cost","_parentsAr","_nul"];
if (typename _this != "STRING") exitWith {};
_cost = 100;
_parentsAr = [(configfile >> "CfgWeapons" >> _this),true] call BIS_fnc_returnParents;
if ("Pistol" in _parentsAr) then {
SaOkGearPistol = [SaOkGearPistol,_this,1] CALL SAOKADDORREMOVE;
_cost = 50;
};
if ("Rifle" in _parentsAr) then {
SaOkGearPrimW = [SaOkGearPrimW,_this,1] CALL SAOKADDORREMOVE;
_cost = 100;
};
if ("Launcher" in _parentsAr) then {
SaOkGearSecW = [SaOkGearSecW,_this,1] CALL SAOKADDORREMOVE;
_cost = 200;
};
if (pisteet < _cost) exitWith {"Not enought prestige to buy a weapon" SPAWN HINTSAOK;};
pisteet = pisteet - _cost;
"Cash" SPAWN SAOKPLAYSOUND;
_nul = [-_cost, "Purhcased Weapon"] SPAWN PRESTIGECHANGE;
};

SAOKBUYMAG = {

private ["_am","_nul"];
if (typename (_this select 0) != "STRING") exitWith {};
_am = (_this select 1)+1;
if (pisteet < _am*20) exitWith {"Not enought prestige to buy magazines" SPAWN HINTSAOK;};
SaOkGearOther = [SaOkGearOther,(_this select 0),_am] CALL SAOKADDORREMOVE;
pisteet = pisteet - _am*20;
"Cash" SPAWN SAOKPLAYSOUND;
_nul = [-(_am*20), "Purhcased Mag(s)"] SPAWN PRESTIGECHANGE;
};

SAOKGEARWMAGS = {
private ["_helpD2","_ctrl","_myDisplay"];
if (typename _this != "STRING") exitWith {};
_myDisplay = findDisplay 2491;
_ctrl = _myDisplay displayCtrl 1501;
lbClear 1501;
_helpD2 = [];
{
lbAdd [1501, getText(configfile >> "CfgMagazines" >> _x >> "displayName")];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgMagazines" >> _x >> "picture")];
_helpD2 set [count _helpD2, [_x,getText(configfile >> "CfgMagazines" >> _x >> "displayName")]];
} foreach (getArray(configfile >> "CfgWeapons" >> _this >> "magazines"));
{
lbAdd [1501, getText(configfile >> "CfgMagazines" >> _x >> "displayName")];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgMagazines" >> _x >> "picture")];
_helpD2 set [count _helpD2, [_x,getText(configfile >> "CfgMagazines" >> _x >> "displayName")]];
} foreach ["1Rnd_HE_Grenade_shell","HandGrenade","APERSBoundingMine_Range_Mag","APERSTripMine_Wire_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","ClaymoredirectionalMine_Remote_Mag","ATMine_Range_Mag","1Rnd_Smoke_Grenade_shell","SmokeShell","UGL_FlareGreen_F"];
missionNameSpace setvariable ["helpD2",_helpD2];
lbSetCurSel [1501, 0];
};

SAOKGEARWSHOP = {
private ["_ctrl2","_ctrl","_ok","_myDisplay","_Wpic","_item","_helpD","_helpD2","_name","_names"];
[["WLA","GearShop"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "SaOkGearDialogWepShop"; 
_myDisplay = findDisplay 2491;
_ctrl = _myDisplay displayCtrl 1500;
_ctrl2 = _myDisplay displayCtrl 1501;
_Wpic = "";
_item = "";
CSHOPISSA = true;
_helpD = [];
_names = [];
_aa = 0;
{
_name = (["CfgWeapons",_x] call SAOKCL1);
if !(_name in _names) then {
_names set [count _names,_name];
lbAdd [1500, _name];
_ctrl lbSetPicture [(_foreachindex - _aa),gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
_helpD set [count _helpD, [_x,_name]];
} else {_aa = _aa + 1;};
} foreach SAOKls + SAOKrs + SAOKps;
lbSetCurSel [1500, 0];
_helpD2 = [];
{
lbAdd [1501, getText(configfile >> "CfgMagazines" >> _x >> "displayName")];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgMagazines" >> _x >> "picture")];
_helpD2 set [count _helpD2, [_x,getText(configfile >> "CfgMagazines" >> _x >> "displayName")]];
} foreach (getArray(configfile >> "CfgWeapons" >> (SAOKls select 0) >> "magazines"));
{
lbAdd [1501, getText(configfile >> "CfgMagazines" >> _x >> "displayName")];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgMagazines" >> _x >> "picture")];
_helpD2 set [count _helpD2, [_x,getText(configfile >> "CfgMagazines" >> _x >> "displayName")]];
} foreach ["1Rnd_HE_Grenade_shell","HandGrenade","APERSBoundingMine_Range_Mag","APERSTripMine_Wire_Mag","APERSMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","ClaymoredirectionalMine_Remote_Mag","ATMine_Range_Mag","1Rnd_Smoke_Grenade_shell","SmokeShell","UGL_FlareGreen_F"];
missionNameSpace setvariable ["helpD2",_helpD2];
lbSetCurSel [1501, 0];
lbAdd [1502, "1"];
lbAdd [1502, "2"];
lbAdd [1502, "3"];
lbAdd [1502, "4"];
lbAdd [1502, "5"];
lbSetCurSel [1502, 0];
missionNameSpace setvariable ["helpD",_helpD];
{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable "helpD");_Wpic = _item CALL SaOkGearPic;ctrlSetText [1200, _Wpic];
//while {!isNil"CSHOPISSA" && {dialog}} do {{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable "helpD");_Wpic = _item CALL SaOkGearPic;ctrlSetText [1200, _Wpic]; sleep 0.1;};
};

SAOKGEAROSHOP = {
private ["_ok","_myDisplay"];
[["WLA","GearShop"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "SaOkGearDialogOtherShop"; 
_myDisplay = findDisplay 2592;
CSHOPISSA = true;
lbAdd [1500, "Vests"];
lbAdd [1500, "Backpacks"];
lbAdd [1500, "Headgear"];
lbAdd [1500, "Items"];
lbAdd [1500, "Glasses"];
//lbAdd [1500, "Magazines"];
lbAdd [1502, "1"];
lbAdd [1502, "2"];
lbAdd [1502, "3"];
lbAdd [1502, "4"];
lbAdd [1502, "5"];
lbSetCurSel [1500, 0];
lbSetCurSel [1502, 0];
//ctrlSetText [1200, ""]; Glasses
};

SAOKGEAROITEMS = {
private ["_ctrl2","_myDisplay","_helpD","_item","_Wpic"];
if (typename _this != "STRING") exitWith {};
lbClear 1501;
_myDisplay = findDisplay 2592;
_ctrl2 = _myDisplay displayCtrl 1501;
_helpD = [];
switch _this do {
case "Glasses": {
{
lbAdd [1501, getText(configfile >> "CfgGlasses" >> _x >> "displayName")];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgGlasses" >> _x >> "picture")];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgGlasses" >> _x >> "displayName")]];
} foreach SAOKglas;
};
case "Magazines": {
{
lbAdd [1501, getText(configfile >> "CfgMagazines" >> _x >> "displayName")];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgMagazines" >> _x >> "picture")];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgMagazines" >> _x >> "displayName")]];
} foreach SAOKmag;
};
case "Vests": {
{
lbAdd [1501, (["CfgWeapons",_x] call SAOKCL1)];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
_helpD set [count _helpD, [_x,(["CfgWeapons",_x] call SAOKCL1)]];
} foreach SAOKvest;
};
case "Backpacks": {
{
lbAdd [1501, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach SAOKpack;
};
case "Items": {
{
lbAdd [1501, (["CfgWeapons",_x] call SAOKCL1)];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
_helpD set [count _helpD, [_x,(["CfgWeapons",_x] call SAOKCL1)]];
} foreach SAOKitem;
};
case "Headgear": {
{
lbAdd [1501, (["CfgWeapons",_x] call SAOKCL1)];
_ctrl2 lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
_helpD set [count _helpD, [_x,(["CfgWeapons",_x] call SAOKCL1)]];
} foreach SAOKhat;
};
};
missionNameSpace setvariable ["helpD",_helpD];
lbSetCurSel [1501, 0];
_item =[];
{if ((lbText [1501, (lbCurSel 1501)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable "helpD");
if ((lbText [1500, (lbCurSel 1500)]) != "Magazines" && {typename _item == "STRING"}) then {
if ((lbText [1500, (lbCurSel 1500)]) == "Backpacks") then {_item = [_item];};
if ((lbText [1500, (lbCurSel 1500)]) == "Glasses") then {_item = [_item,""];};
_Wpic = _item CALL SaOkGearPic;
ctrlSetText [1200, _Wpic];
} else {ctrlSetText [1200, ""];};
};

SAOKGEAROBUY = {
private ["_type","_item","_amount","_cost","_nul","_f","_nameA"];
_type = _this select 0;
_item = _this select 1;
_amount =  _this select 2;
switch _type do {
case "Glasses": {
_cost = 20*_amount;
if (pisteet < _cost) exitWith {"Not enought prestige for glasses" SPAWN HINTSAOK;};
"Cash" SPAWN SAOKPLAYSOUND;
pisteet = pisteet - _cost;
_nul = [-_cost, "Purhcased Glasses"] SPAWN PRESTIGECHANGE;
SaOkGearGlasses = [SaOkGearGlasses,_item,_amount] CALL SAOKADDORREMOVE;
};
case "Vests": {
_cost = 100*_amount;
if (pisteet < _cost) exitWith {"Not enought prestige for vests" SPAWN HINTSAOK;};
"Cash" SPAWN SAOKPLAYSOUND;
pisteet = pisteet - _cost;
_nul = [-_cost, "Purhcased Vests"] SPAWN PRESTIGECHANGE;
SaOkGearVest = [SaOkGearVest,_item,_amount] CALL SAOKADDORREMOVE;
};
case "Backpacks": {
_cost = 100*_amount;
if (pisteet < _cost) exitWith {"Not enought prestige for backpacks" SPAWN HINTSAOK;};
"Cash" SPAWN SAOKPLAYSOUND;
pisteet = pisteet - _cost;
_nul = [-_cost, "Purhcased Backpacks"] SPAWN PRESTIGECHANGE;
SaOkGearBackPack = [SaOkGearBackPack,_item,_amount] CALL SAOKADDORREMOVE;
};
case "Headgear": {
_cost = 20*_amount;
if (pisteet < _cost) exitWith {"Not enought prestige for headgear" SPAWN HINTSAOK;};
"Cash" SPAWN SAOKPLAYSOUND;
pisteet = pisteet - _cost;
_nul = [-_cost, "Purhcased Headgear"] SPAWN PRESTIGECHANGE;
SaOkGearHat = [SaOkGearHat,_item,_amount] CALL SAOKADDORREMOVE;
};
case "Items": {
_nameA = toArray _item;
if (count _nameA > 2) then {
_f = [_nameA select 0, _nameA select 1, _nameA select 2];
_f = toString _f;
if (_f in ["acc","muz","opt"]) then {
_cost = 50*_amount;
if (pisteet < _cost) exitWith {"Not enought prestige for weapon items" SPAWN HINTSAOK;};
"Cash" SPAWN SAOKPLAYSOUND;
pisteet = pisteet - _cost;
_nul = [-_cost, "Purhcased Weapon Items"] SPAWN PRESTIGECHANGE;
SaOkGearAttachments = [SaOkGearAttachments,_item,_amount] CALL SAOKADDORREMOVE;
} else {
_cost = 30*_amount;
if (pisteet < _cost) exitWith {"Not enought prestige for these items" SPAWN HINTSAOK;};
"Cash" SPAWN SAOKPLAYSOUND;
pisteet = pisteet - _cost;
_nul = [-_cost, "Purhcased Items"] SPAWN PRESTIGECHANGE;
SaOkGearOther = [SaOkGearOther,_item,_amount] CALL SAOKADDORREMOVE;
};
};
};
case "Magazines": {
_cost = 50*_amount;
if (pisteet < _cost) exitWith {"Not enought prestige to magazines" SPAWN HINTSAOK;};
"Cash" SPAWN SAOKPLAYSOUND;
pisteet = pisteet - _cost;
_nul = [-_cost, "Purhcased Magazines"] SPAWN PRESTIGECHANGE;
SaOkGearOther = [SaOkGearOther,_item,_amount] CALL SAOKADDORREMOVE;
};
case "Scopes": {
SaOkGearAttachments = [SaOkGearAttachments,_item,_amount] CALL SAOKADDORREMOVE;
};
};
};



SAOKGEARCSHOP = {
private ["_ctrl","_ok","_myDisplay","_Wpic","_item","_helpD","_class"];
disableserialization;
_ok = createDialog "SaOkGearDialogUniShop"; 
_myDisplay = findDisplay 1995;
_ctrl = _myDisplay displayCtrl 1500;
_Wpic = "";
_item = "";
CSHOPISSA = true;
_helpD = [];
{
_class = _x;
lbAdd [1500, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SAOKunif;
lbSetCurSel [1500, 0];
lbAdd [1501, "1"];
lbAdd [1501, "2"];
lbAdd [1501, "3"];
lbAdd [1501, "4"];
lbAdd [1501, "5"];
lbSetCurSel [1501, 0];
missionNameSpace setvariable ["helpD",_helpD];
{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable "helpD");_Wpic = _item CALL SaOkGearPic;ctrlSetText [1200, _Wpic];
//while {!isNil"CSHOPISSA" && {dialog}} do {{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable "helpD");_Wpic = _item CALL SaOkGearPic;ctrlSetText [1200, _Wpic]; sleep 0.1;};
};

SAOKGEARC = {
private ["_pii","_ctrl3","_aaa","_ctrl2","_ctrl","_ok","_myDisplay","_Wpic","_items","_helpD","_class","_p2","_p","_iii","_ii","_Allowedmags","_text","_num","_cW","_c","_con","_item"];
disableserialization;
_ok = createDialog "SaOkGearDialogC"; 
_myDisplay = findDisplay 1992;
_ctrl = _myDisplay displayCtrl 1500;
_ctrl2 = _myDisplay displayCtrl 1501;
_ctrl3 = _myDisplay displayCtrl 1502;
_Wpic = "";
_items = ["","",""];
_helpD = [];
_Allowedmags = [];
_p2 = 0;
{
_Allowedmags = _Allowedmags + (getArray(configfile >> "CfgWeapons" >> _x >> "magazines"));
} foreach (weapons VariSelectedUnit);
switch (_this) do {
//SPEEDBOATS displayName = "Vermin SMG .45 ACP";
case "F": {
_Wpic = (uniform VariSelectedUnit) CALL SaOkGearPic;
{
_class = (_x select 0);
lbAdd [1500, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearFatigue;
lbSetCurSel [1500, 0];
_p = 0;

_ii = 0;
_aaa = 0;
{
_class = (_x select 0);
if (!isClass(configFile >> "cfgMagazines" >> _class)) then {
if (isClass(configFile >> "CfgWeapons" >> _class) && {(["CfgWeapons",_class] call SAOKCL1) != ""}) then {
if (missionNameSpace getvariable "LastIPic" == (["CfgWeapons",_class] call SAOKCL1)) then {_p = _ii;};
lbAdd [1501, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl2 lbSetPicture [(_foreachindex-_aaa),gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl2 lbSetTooltip [(_foreachindex-_aaa),(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {_aaa = _aaa + 1};	
} else {
if (missionNameSpace getvariable "LastIPic" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p = _ii;};
_text = gettext(configfile >> "CfgMagazines" >> _class >> "nameSound");
if ((_text != "Magazine" || {_class in _Allowedmags}) && {getText(configfile >> "CfgMagazines" >> _class >> "displayName") != ""}) then {
lbAdd [1501, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl2 lbSetPicture [(_foreachindex-_aaa),gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_ctrl2 lbSetTooltip [(_foreachindex-_aaa),(format ["x%1 ",(_x select 1)] + gettext (configfile >> "CfgMagazines" >> _class >> "displayName"))];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
} else {_aaa = _aaa + 1};	
};
_ii = _ii + 1;
} foreach SaOkGearOther + SaOkGearAttachments;

lbSetCurSel [1501, _p];
if (!isnull (uniformContainer VariSelectedUnit)) then {
_cW = itemCargo (uniformContainer VariSelectedUnit);
_c = count _cW - 1;
_iii = 0;
for "_i" from 0 to _c do {
private ["_class"];
_class = _cW select _i;
if (!isClass(configFile >> "cfgMagazines" >> _class)) then {
if (missionNameSpace getvariable "LastIPic2" == (["CfgWeapons",_class] call SAOKCL1)) then {_p2 = _iii;};
lbAdd [1502, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "cfgWeapons" >> _class >> "picture")];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {
if (missionNameSpace getvariable "LastIPic2" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p2 = _iii;};
lbAdd [1502, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
};
_iii = _iii + 1;
};
_con = getMagazineCargo (uniformContainer VariSelectedUnit);
_cW = + (_con select 0);
_c = count _cW - 1;
_pii = 0;
for "_i" from 0 to _c do {
private ["_class"];
_class = _cW select _i;
_num = (_con select 1) select _i;
while {_num > 0} do {
_num = _num -1;
if (!isClass(configFile >> "cfgMagazines" >> _class)) then {
if (missionNameSpace getvariable "LastIPic2" == (["CfgWeapons",_class] call SAOKCL1)) then {_p2 = _iii;};
lbAdd [1502, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "cfgWeapons" >> _class >> "picture")];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {
if (missionNameSpace getvariable "LastIPic2" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p2 = _iii;};
lbAdd [1502, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
};
_pii = _pii + 1;
_iii = _iii + 1;
};
};
lbSetCurSel [1502, _p2];
};

};
case "B": {
_Wpic = [(Backpack VariSelectedUnit)] CALL SaOkGearPic;
{
_class = (_x select 0);
lbAdd [1500, getText(configfile >> "CfgVehicles" >> _class >> "displayName")];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgVehicles" >> _class >> "picture")];
_ctrl lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] + getText(configfile >> "CfgVehicles" >> _class >> "displayName"))];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgVehicles" >> _class >> "displayName")]];
} foreach SaOkGearBackPack;
lbSetCurSel [1500, 0];
_p = 0;
_ii = 0;

_aaa = 0;
{
_class = (_x select 0);
if (!isClass(configFile >> "cfgMagazines" >> _class)) then {
if (isClass(configFile >> "CfgWeapons" >> _class) && {(["CfgWeapons",_class] call SAOKCL1) != ""}) then {
if (missionNameSpace getvariable "LastIPic" == (["CfgWeapons",_class] call SAOKCL1)) then {_p = _ii;};
lbAdd [1501, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl2 lbSetPicture [(_foreachindex-_aaa),gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl2 lbSetTooltip [(_foreachindex-_aaa),(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {_aaa = _aaa + 1};	
} else {
if (missionNameSpace getvariable "LastIPic" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p = _ii;};
_text = gettext(configfile >> "CfgMagazines" >> _class >> "nameSound");
if ((_text != "Magazine" || {_class in _Allowedmags}) && {getText(configfile >> "CfgMagazines" >> _class >> "displayName") != ""}) then {
lbAdd [1501, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl2 lbSetPicture [(_foreachindex-_aaa),gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_ctrl2 lbSetTooltip [(_foreachindex-_aaa),(format ["x%1 ",(_x select 1)] + gettext (configfile >> "CfgMagazines" >> _class >> "displayName"))];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
} else {_aaa = _aaa + 1};	
};
_ii = _ii + 1;
} foreach SaOkGearOther + SaOkGearAttachments;
lbSetCurSel [1501, _p];

if (!isnull (backpackContainer VariSelectedUnit)) then {
_cW = itemCargo (backpackContainer VariSelectedUnit);
_c = count _cW - 1;
_iii = 0;
for "_i" from 0 to _c do {
private ["_class"];
_class = _cW select _i;
if !(isClass(configFile >> "cfgMagazines" >> _class)) then {
if (missionNameSpace getvariable "LastIPic2" == (["CfgWeapons",_class] call SAOKCL1)) then {_p2 = _iii;};
lbAdd [1502, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "cfgWeapons" >> _class >> "picture")];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {
if (missionNameSpace getvariable "LastIPic2" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p2 = _iii;};
lbAdd [1502, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
};
_iii = _iii + 1;
};
_con = getMagazineCargo (backpackContainer VariSelectedUnit);
_cW = + (_con select 0);
_c = count _cW - 1;
_pii = 0;
for "_i" from 0 to _c do {
private ["_class"];
_class = _cW select _i;
_num = (_con select 1) select _i;
while {_num > 0} do {
_num = _num -1;
if !(isClass(configFile >> "cfgMagazines" >> _class)) then {
if (missionNameSpace getvariable "LastIPic2" == (["CfgWeapons",_class] call SAOKCL1)) then {_p2 = _iii;};
lbAdd [1502, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {
if (missionNameSpace getvariable "LastIPic2" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p2 = _iii;};
lbAdd [1502, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
};
_pii = _pii + 1;
_iii = _iii + 1;
};
};
lbSetCurSel [1502, _p2];
};

};
case "V": {
_Wpic = (Vest VariSelectedUnit) CALL SaOkGearPic;
{
_class = (_x select 0);
lbAdd [1500, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl lbSetPicture [_foreachindex,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl lbSetTooltip [_foreachindex,(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} foreach SaOkGearVest;
lbSetCurSel [1500, 0];
_p = 0;
_ii = 0;
_aaa = 0;
{
_class = (_x select 0);
if (!isClass(configFile >> "cfgMagazines" >> _class)) then {
if (isClass(configFile >> "CfgWeapons" >> _class) && {(["CfgWeapons",_class] call SAOKCL1) != ""}) then {
if (missionNameSpace getvariable "LastIPic" == (["CfgWeapons",_class] call SAOKCL1)) then {_p = _ii;};
lbAdd [1501, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl2 lbSetPicture [(_foreachindex-_aaa),gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_ctrl2 lbSetTooltip [(_foreachindex-_aaa),(format ["x%1 ",(_x select 1)] + (["CfgWeapons",_class] call SAOKCL1))];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {_aaa = _aaa + 1};	
} else {
if (missionNameSpace getvariable "LastIPic" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p = _ii;};
_text = gettext(configfile >> "CfgMagazines" >> _class >> "nameSound");
if ((_text != "Magazine" || {_class in _Allowedmags}) && {getText(configfile >> "CfgMagazines" >> _class >> "displayName") != ""}) then {
lbAdd [1501, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl2 lbSetPicture [(_foreachindex-_aaa),gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_ctrl2 lbSetTooltip [(_foreachindex-_aaa),(format ["x%1 ",(_x select 1)] + gettext (configfile >> "CfgMagazines" >> _class >> "displayName"))];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
} else {_aaa = _aaa + 1};	
};
_ii = _ii + 1;
} foreach SaOkGearOther + SaOkGearAttachments;
lbSetCurSel [1501, _p];

if (!isnull (vestContainer VariSelectedUnit)) then {
_cW = itemCargo (vestContainer VariSelectedUnit);
_c = count _cW - 1;
_iii = 0;
for "_i" from 0 to _c do {
private ["_class"];
_class = _cW select _i;
if !(isClass(configFile >> "cfgMagazines" >> _class)) then {
if (missionNameSpace getvariable "LastIPic2" == (["CfgWeapons",_class] call SAOKCL1)) then {_p2 = _iii;};
lbAdd [1502, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "cfgWeapons" >> _class >> "picture")];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {
if (missionNameSpace getvariable "LastIPic2" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p2 = _iii;};
lbAdd [1502, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
};
_iii = _iii + 1;
};
_con = getMagazineCargo (vestContainer VariSelectedUnit);
_cW = + (_con select 0);
_c = count _cW - 1;
_pii = 0;
for "_i" from 0 to _c do {
private ["_class"];
_class = _cW select _i;
_num = (_con select 1) select _i;
while {_num > 0} do {
_num = _num -1;
if !(isClass(configFile >> "cfgMagazines" >> _class)) then {
if (missionNameSpace getvariable "LastIPic2" == (["CfgWeapons",_class] call SAOKCL1)) then {_p2 = _iii;};
lbAdd [1502, (["CfgWeapons",_class] call SAOKCL1)];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "CfgWeapons" >> _class >> "picture")];
_helpD set [count _helpD, [_class,(["CfgWeapons",_class] call SAOKCL1)]];
} else {
if (missionNameSpace getvariable "LastIPic2" == getText(configfile >> "CfgMagazines" >> _class >> "displayName")) then {_p2 = _iii;};
lbAdd [1502, getText(configfile >> "CfgMagazines" >> _class >> "displayName")];
_ctrl3 lbSetPicture [_iii,gettext (configfile >> "CfgMagazines" >> _class >> "picture")];
_helpD set [count _helpD, [_class,getText(configfile >> "CfgMagazines" >> _class >> "displayName")]];
};
_pii = _pii + 1;
_iii = _iii + 1;
};
};
lbSetCurSel [1502, _p2];
};

};
};

missionNameSpace setvariable ["helpD",_helpD];
missionNameSpace setvariable ["Wmode",_this];
ctrlSetText [1200, _Wpic]; 
_item =[];
{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable "helpD");
if (typename _item == "STRING") then {
if (isClass(configFile >> "cfgVehicles" >> _item)) then {_item = [_item];};
_Wpic = _item CALL SaOkGearPic;
ctrlSetText [1201, _Wpic];
};
};

SAOKDELITEM = {
private ["_item","_f","_m","_mode"];
_item = "";
if (_this == "") ExitWith {};
missionNameSpace setvariable ["LastIPic",_this];
{if (_this == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");

{
if (_item == _x select 0) exitWith {
SaOkGearOther = [SaOkGearOther,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearOther;
{
if (_item == _x select 0) exitWith {
SaOkGearAttachments = [SaOkGearAttachments,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearAttachments;
};

SAOKGEARCDES = {
private ["_item","_f1","_f2","_mode"];
_item = "";
if (_this == "") ExitWith {};
missionNameSpace setvariable ["LastIPic",_this];
{if (_this == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
_mode = (missionNameSpace getvariable "Wmode");
switch (_mode) do {
case "F": {
{
if (_item == _x select 0) exitWith {
SaOkGearFatigue= [SaOkGearFatigue,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearFatigue;
};
case "B": {
{
if (_item == _x select 0) exitWith {
SaOkGearBackPack= [SaOkGearBackPack,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearBackPack;
};
case "V": {
{
if (_item == _x select 0) exitWith {
SaOkGearVest= [SaOkGearVest,_forEachIndex] call SAOKREMINDEX;
};
} foreach SaOkGearVest;
};
};
};

SAOKGEARREMMAGS = {
{
SaOkGearOther = [SaOkGearOther,_x,1] CALL SAOKADDORREMOVE;VariSelectedUnit removeMagazine _x;
} foreach magazines VariSelectedUnit;
};

SAOKGEARREMWMAGS = {
private ["_mode","_mags"];
_mode = missionNameSpace getvariable "Wmode";
_mags = [];
switch (_mode) do {
case "W": {
if (primaryweapon VariSelectedUnit != "") then {
_mags = (getArray(configfile >> "CfgWeapons" >> (primaryweapon VariSelectedUnit) >> "magazines"));
};
};
case "S": {
if (secondaryweapon VariSelectedUnit != "") then {
_mags = (getArray(configfile >> "CfgWeapons" >> (secondaryweapon VariSelectedUnit) >> "magazines"));
};

};
case "P": {
if (handgunWeapon VariSelectedUnit != "") then {
_mags = (getArray(configfile >> "CfgWeapons" >> (handgunWeapon VariSelectedUnit) >> "magazines"));
};
};
};
{
if (_x in _mags) then {
SaOkGearOther = [SaOkGearOther,_x,1] CALL SAOKADDORREMOVE;
VariSelectedUnit removeMagazine _x;
};
} foreach magazines VariSelectedUnit;
};

SAOKGEARADDWMAGS = {
private ["_mode","_mags","_mag","_magC","_c","_c2","_added","_w"];
_mode = missionNameSpace getvariable "Wmode";
_mags = [];
_w = "";
if (typename _this == "STRING") then {
if (_this == "") ExitWith {};
{if (_this == _x select 1) exitWith {_w = _x select 0};} foreach (missionNameSpace getvariable "helpD");
} else {
switch (_mode) do {
case "W": {
_w = primaryweapon VariSelectedUnit;
};
case "S": {
_w =  secondaryweapon VariSelectedUnit;
};
case "P": {
_w = handgunWeapon VariSelectedUnit;
};
};
};
if (_w == "") ExitWith {};
_mags = (getArray(configfile >> "CfgWeapons" >> _w >> "magazines"));
_max = 0;
_mag = "";
_added = 0;
while {_max < 5 && {{_magC = _x; {_magC == (_x select 0)} count SaOkGearOther > 0} count _mags > 0}} do {
_max = _max + 1;
{if ((_x select 0) in _mags) exitWith {_mag = _x select 0;};} foreach SaOkGearOther;
_c = {_x == _mag} count magazines VariSelectedUnit;
VariSelectedUnit addMagazine _mag;
_c2 = {_x == _mag} count magazines VariSelectedUnit;
if (_c2 > _c) then {
_added = _added + 1;
SaOkGearOther = [SaOkGearOther,_mag,0] CALL SAOKADDORREMOVE;
};
};
(format ["%1 magazines added for the selected weapon",_added]) SPAWN HINTSAOK;
};