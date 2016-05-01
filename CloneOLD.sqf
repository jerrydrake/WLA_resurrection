private ["_un","_bp","_Vest","_itS","_itP","_group","_da","_pP","_hat","_uni","_typeOf","_we","_uI","_vI","_t","_mag","_mag2"];
_f1 = {
//MAGAZINE CARGO
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
_vI = vestItems _this;
_uI = uniformItems _this;
_bp = Backpack _this;
_mag = primaryWeaponMagazine _this;
_mag2 = secondaryWeaponMagazine _this;
removeBackpack _this;
//_ma = + (magazines _this);
_we = + (weapons _this);
if (handgunWeapon _this != "") then {_we = _we - [handgunWeapon _this];};
//_pM = handgunMagazine _this;
//if (count _pM > 0) then {while {(_pM select 0) in _ma} do {_ma = _ma - _pM;};};
_typeOf = typeOf _this;
_uni = uniform _this;
_hat = headgear _this;
_pP = getposATL player;
_da= damage _this;
_Vest = Vest _this;



//NEW UNIT
_group = [[(_pP select 0)+10-(random 20),(_pP select 1)+10-(random 20),0], WEST, [_typeOf],[],[],[0.9,1.0]] call SpawnGroupCustom;
_un = leader _group;
removeallweapons _un;
removeHeadgear _un;
removeVest _un;
//COPY SKILL
{_un setSkill [_x,(_this skill _x)];} foreach ["general","commanding","reloadSpeed","courage","spotTime","spotDistance","endurance","aimingSpeed","aimingShake","aimingAccuracy"];

_itP = if (!isNil{primaryWeaponItems _this}) then {primaryWeaponItems _this} else {[]};
_itS = if (!isNil{secondaryWeaponItems _this}) then {secondaryWeaponItems _this} else {[]};


_un AddUniform _uni;


if (!isNil"_hat") then {
_un addHeadgear _hat;
};
if (!isNil"_Vest") then {
_un addVest _Vest;
};


removeallweapons _un;
{if (_x != "" && {isClass(configFile >> "cfgWeapons" >> _x)}) then {_un addweapon _x;};} foreach _we;

if (_bp != "") then {
removeBackpack _un;
_un addBackpack _bp;
};



removeAllPrimaryWeaponItems _un; 
{
if (_x != "") then {
_un addPrimaryWeaponItem _x;
};
} foreach _itP;
{
if (_x != "") then {
_un addSecondaryWeaponItem _x;
};
} foreach _itS;

{
if (_x != "") then {
if (isClass(configFile >> "cfgWeapons" >> _x)) then {
_un addItem _x;
} else {
_un addmagazine _x;
};
};
} foreach _vI + _uI;

_un setDamage _da;
_un setName (name _this);
_un setFace (face _this);


if (!isnull (uniformContainer _this)) then {
(itemCargo (uniformContainer _this)) CALL _f2;
(getMagazineCargo (uniformContainer _this)) CALL _f1;
};
if (!isnull (BackPackContainer _this)) then {
(itemCargo (BackPackContainer _this)) CALL _f2;
(getMagazineCargo (BackPackContainer _this)) CALL _f1;
};
if (!isnull (VestContainer _this)) then {
(itemCargo (VestContainer _this)) CALL _f2;
(getMagazineCargo (VestContainer _this)) CALL _f1;
};

/*
if (count _mag > 0) then {
_mag = _mag select 0;
_un addmagazine _mag;
_t = 0;
while {{_mag == _x} count (magazines (_un)) < 3 && {_t < 3}} do {
_un addmagazine _mag;
_t = _t + 1;
};
};


if (count _mag2 > 0) then {
_mag = _mag2 select 0;
_t = 0;
while {{_mag == _x} count (magazines (_un)) < 1 && {_t < 1}} do {
_un addmagazine _mag;
_t = _t + 1;
};
};
*/


{
if !(isNil{_this getvariable _x}) then {_un setvariable [_x,(_this getvariable _x)];};
} foreach ["Relationship","TiRed","Sickness","Mental","CKills","Kills","FKills"];

deletevehicle _this;
[_un] joinSilent player;
