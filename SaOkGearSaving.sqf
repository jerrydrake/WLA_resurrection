SAOKGEARANDTMSAVE = {
private ["_u","_sk","_s","_uClass","_itemCargoUni","_magCargoUni","_weaCargoUni","_itemCargoBackPack","_magCargoBackPack","_weaCargoBackPack","_itemCargoVest","_magCargoVest","_weaCargoVest","_mag","_mag2","_mag3","_bp","_uni","_hat","_Vest","_asI","_uniBol","_BackPackBol","_VestBol","_DatAr","_pP","_group","_unit","_primWeaItems","_hgunItems","_handgunWeapon","_primaryWeapon","_secondaryWeapon","_itP","_itS","_data","_f1","_f2","_f3","_fN","_varss"];
_f1 = {
private ["_unit","_typ","_cW","_c","_num"];
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
if !(gettext (configfile >> "CfgMagazines" >> _class >> "nameSound") in ["Chemlight","handgrenade","smokeshell"]) then {
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addMagazineCargo [_class , 1];};
case "V": {(vestContainer _unit) addMagazineCargo [_class, 1];};
case "B": {(backpackContainer _unit) addMagazineCargo [_class , 1];};
};
};
} else {
[_unit,_class,_num] SPAWN {sleep 2; (_this select 0) addmagazine [(_this select 1),(_this select 2)];};
};
};
};

_f2 = {
private ["_unit","_typ","_cW","_c","_num"];
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
if !(gettext (configfile >> "CfgMagazines" >> _class >> "nameSound") in ["Chemlight","handgrenade","smokeshell"]) then {
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addItemCargo [_class , 1];};
case "V": {(vestContainer _unit) addItemCargo [_class, 1];};
case "B": {(backpackContainer _unit) addItemCargo [_class , 1];};
};
};
} else {
[_unit,_class,_num] SPAWN {sleep 2; (_this select 0) addmagazine [(_this select 1),(_this select 2)];};
};
};
};
_f3 = {
private ["_unit","_typ","_cW","_c","_num"];
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
if !(gettext (configfile >> "CfgMagazines" >> _class >> "nameSound") in ["Chemlight","handgrenade","smokeshell"]) then {
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addWeaponCargo [_class , 1];};
case "V": {(vestContainer _unit) addWeaponCargo [_class , 1];};
case "B": {(backpackContainer _unit) addWeaponCargo [_class , 1];};
};
};
} else {
[_unit,_class,_num] SPAWN {sleep 2; (_this select 0) addmagazine [(_this select 1),(_this select 2)];};
};
};
};
_data = [];
if (typename _this == "STRING" && {_this == "Save"}) then {
//SAVE
if (!isNil"CIVMODE") exitWith {};
{
if (alive _x || {isPlayer _x}) then {
_uClass = typeof _x;
if (isplayer _x) then {_uClass = "player";};
_mag = primaryWeaponMagazine _x;
_mag2 = secondaryWeaponMagazine _x;
_mag3 = handgunMagazine _x;
_bp = Backpack _x;
_uni = uniform _x;
_hat = headgear _x;
_Vest = Vest _x;
_asI = assignedItems _x;
_itemCargoUni = [];
_magCargoUni = [];
_weaCargoUni = [];
_uniBol = !isnull (uniformContainer _x);
if (_uniBol) then {
_itemCargoUni = (getitemCargo (uniformContainer _x)) ;
_magCargoUni = (getMagazineCargo (uniformContainer _x));
_weaCargoUni = (getWeaponCargo (uniformContainer _x));
};
_itemCargoBackPack = [];
_magCargoBackPack = [];
_weaCargoBackPack = [];
_BackPackBol = !isnull (BackPackContainer _x);
if (_BackPackBol) then {
_itemCargoBackPack = (getitemCargo (BackPackContainer _x));
_magCargoBackPack = (getMagazineCargo (BackPackContainer _x));
_weaCargoBackPack = (getWeaponCargo (BackPackContainer _x));
};
_itemCargoVest = [];
_magCargoVest = [];
_weaCargoVest = [];
_VestBol = !isnull (VestContainer _x);
if (_VestBol) then {
_itemCargoVest = (getitemCargo (VestContainer _x));
_magCargoVest = (getMagazineCargo (VestContainer _x));
_weaCargoVest = (getWeaponCargo (VestContainer _x));
};
_varss = [];
_unit = _x;
{if (!isNil{_unit getvariable _x}) then {_varss pushback [_x,_unit getvariable _x];};} foreach ["PointSK"];
_s = [];
_u = _x;
{_s pushback (_u skill _x);} foreach ["general","commanding","reloadSpeed","courage","spotTime","spotDistance","endurance","aimingSpeed","aimingShake","aimingAccuracy"];
_data pushback [_uClass,_mag,_mag2,_mag3,_bp,_uni,_hat,_Vest,_asI,_uniBol,_itemCargoUni,_magCargoUni,_weaCargoUni,_BackPackBol,_itemCargoBackPack,_magCargoBackPack,_weaCargoBackPack,_VestBol,_itemCargoVest,_magCargoVest,_weaCargoVest,name _x,face _x,damage _x,primaryWeaponItems _x,handgunItems _x,handgunWeapon _x,primaryWeapon _x,secondaryWeapon _x, rank _x,goggles _x,_varss,_s, speaker _x];
};
} foreach [player]+(units group player - [player]);
_fN = "SaOkSaveWLAGearAndTM";
if (worldname != "Altis") then {_fN = _fN + worldname;};
profileNamespace setvariable [_fN,_data];
} else {
//LOAD
_fN = "SaOkSaveWLAGearAndTM";
if (worldname != "Altis") then {_fN = _fN + worldname;};
if (isNil{profileNamespace getvariable _fN}) exitWith {};
_data = profileNamespace getvariable _fN;
{deletevehicle _x;} foreach (units group player - [player]);
{
if ((_x select 23) < 1) then {
_uClass = _x select 0;
_mag = _x select 1;
_mag2 = _x select 2;
_mag3 = _x select 3;
_bp = _x select 4;
_uni = _x select 5;
_hat = _x select 6;
_Vest = _x select 7;
_asI = _x select 8;
_itemCargoUni = _x select 10;
_magCargoUni = _x select 11;
_weaCargoUni = _x select 12;
_uniBol = _x select 9;
_itemCargoBackPack = _x select 14;
_magCargoBackPack = _x select 15;
_weaCargoBackPack =_x select 16;
_BackPackBol = _x select 13;
_itemCargoVest = _x select 18;
_magCargoVest = _x select 19;
_weaCargoVest = _x select 20;
_VestBol = _x select 17;
_unit = player;
if (_uClass != "player") then {
_pP = getposATL player;
_group = [[(_pP select 0)+10-(random 20),(_pP select 1)+10-(random 20),0], WEST, [_uClass],[],[],[0.9,1.0],[],[-1, 1],0,""] call SpawnGroupCustom;
if (!isNil"TeDam") then {
leader _group setvariable ["TeDam",1];
_eh = leader _group addEventHandler ["HandleDamage", {_this call SADAME}];
_eh = leader _group addEventHandler ["Explosion", {_this call SADAME}];
};
_unit = leader _group;
_unit setDamage (_x select 23);
_unit setName (_x select 21);
_unit setFace (_x select 22);
[_unit] JoinSilent player;
};
_primWeaItems = _x select 24;
_hgunItems = _x select 25;
_handgunWeapon = _x select 26;
_primaryWeapon = _x select 27;
_secondaryWeapon = _x select 28;
if (count _x > 29) then {_unit setUnitRank (_x select 29);};
if (count _x > 30 && {(_x select 30) != ""}) then {_unit addGoggles (_x select 30);};
if (count _x > 31) then {{_unit setvariable _x;} foreach (_x select 31)};
if (count _x > 32) then {
_sk = (_x select 32);
{_unit setSkill [_x,_sk select _foreachindex];} foreach ["general","commanding","reloadSpeed","courage","spotTime","spotDistance","endurance","aimingSpeed","aimingShake","aimingAccuracy"];
};
if (count _x > 33) then {_unit setspeaker (_x select 33);};
removeAllAssignedItems _unit; 
removeallweapons _unit;
removeHeadgear _unit;
removeVest _unit;
//_unit addItem _x;

_itP = if (!isNil{_primWeaItems}) then {_primWeaItems} else {[]};
_itS = if (!isNil{_hgunItems}) then {_hgunItems} else {[]};



if (_uni != "") then {
[_unit,_uni] CALL SAOKADDUNIFORM;
clearMagazineCargo UniformContainer _unit;
clearWeaponCargo UniformContainer _unit;
clearItemCargo UniformContainer _unit;
};

if (!isNil"_hat") then {
_unit addHeadgear _hat;
};
if (!isNil"_Vest") then {
_unit addVest _Vest;
clearMagazineCargo VestContainer _unit;
clearWeaponCargo VestContainer _unit;
clearItemCargo VestContainer _unit;
};

removeallweapons _unit;
{if (count _x > 0) then {_unit addmagazine (_x select 0)};} foreach [_mag,_mag2,_mag3];
if (_primaryWeapon != "") then {_unit addweapon _primaryWeapon;};
if (_handgunWeapon != "") then {_unit addweapon _handgunWeapon;};
if (_secondaryWeapon != "") then {_unit addweapon _secondaryWeapon;};

if (_bp != "") then {
removeBackpack _unit;
_unit addBackpack _bp;
clearMagazineCargo BackpackContainer _unit;
clearWeaponCargo BackpackContainer _unit;
clearItemCargo BackpackContainer _unit;
};
removeAllPrimaryWeaponItems _unit; 
{
if (_x != "") then {
_unit addPrimaryWeaponItem _x;
};
} foreach _itP;
removeAllHandgunItems _unit; 
{
if (_x != "") then {
_unit addhandgunItem _x;
};
} foreach _itS;

{
if !(_x in (assignedItems _unit)) then {
_unit addItem _x;_unit assignItem _x;
if (_x == "Laserdesignator") then {_unit addMagazine "Laserbatteries";};
};
} foreach _asI;

if (_uniBol) then {
[_weaCargoUni,_unit,"U"] CALL _f3;
[_itemCargoUni,_unit,"U"] CALL _f2;
[_magCargoUni,_unit,"U"] CALL _f1;
};
if (_BackPackBol) then {
[_weaCargoBackPack,_unit,"B"] CALL _f3;
[_itemCargoBackPack,_unit,"B"] CALL _f2;
[_magCargoBackPack,_unit,"B"] CALL _f1;
};
if (_VestBol) then {
[_weaCargoVest,_unit,"V"] CALL _f3;
[_itemCargoVest,_unit,"V"] CALL _f2;
[_magCargoVest,_unit,"V"] CALL _f1;
};
//
//_unit assignItem _x; 
};
} foreach _data;
};
};