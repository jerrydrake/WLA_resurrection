private ["_side","_class","_dir","_pos","_cweaponfrom","_group","_da","_we","_ma","_backbag","_itP","_itS","_un","_hat","_Vest","_headG"];

_side = _this select 0;
_class = _this select 1;
_dir = _this select 2;
_pos = _this select 3;
_cweaponfrom = _this select 4;

_group = [_pos, _side, [_class],[],[],[0.9,1.0]] call SpawnGroupCustom;
_group setformdir _dir;
leader _group setvariable ["CivNo",1];
leader _group setcaptive true; 
leader _group setbehaviour "CARELESS";
leader _group setdir _dir;
leader _group setpos _pos;
leader _group setVariable ["BIS_noCoreConversations", true];
if (!isNull _cweaponfrom) then {
//removeBackpack leader _group;
removeallweapons leader _group;
removeHeadgear leader _group;
removeVest leader _group;
_da= damage _cweaponfrom;
_we= weapons _cweaponfrom;
_itP = if (!isNil{primaryWeaponItems _cweaponfrom}) then {primaryWeaponItems _cweaponfrom} else {[]};
_itS = if (!isNil{secondaryWeaponItems _cweaponfrom}) then {secondaryWeaponItems _cweaponfrom} else {[]};
_ma= magazines _cweaponfrom;
_un = uniform _cweaponfrom;
_hat = Headgear _cweaponfrom;
//_backbag = Backpack _cweaponfrom;
_Vest = Vest _cweaponfrom;
_headG = headgear _cweaponfrom;
//if (player hasWeapon "M9") then {} else {_we = _we + ["M9"]; _ma = _ma + ["15Rnd_9x19_M9"];};
{if (leader _group canAdd _x) then {leader _group addmagazine _x;};} foreach _ma;
{leader _group addweapon _x;} foreach _we;
removeAllPrimaryWeaponItems leader _group; 
{
if (_x != "") then {
leader _group addPrimaryWeaponItem _x;
};
} foreach _itP;
{
if (_x != "") then {
leader _group addSecondaryWeaponItem _x;
};
} foreach _itS;
leader _group setDamage _da;
[leader _group,_un] CALL SAOKADDUNIFORM;
if (!isNil"_hat") then {
leader _group addHeadgear _hat;
};
if (!isNil"_Vest") then {
leader _group addVest _Vest;
};

if (!isNull (unitBackpack _cweaponfrom)) then {
removeBackpack leader _group;
_backbag = Backpack _cweaponfrom;
leader _group addBackpack _backbag;
};

if (!isNil"_headG") then {
leader _group addHeadgear _headG;
};

while {!(canStand leader _group)} do {_da = _da - 0.3;leader _group setDamage _da;};
{_x allowdamage false; _x disableAI "AUTOTARGET"; _x disableAI "TARGET";} foreach [leader _group];
};
leader _group removeweapon "NVGoggles";
leader _group