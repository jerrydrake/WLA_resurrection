private ["_unit","_f1","_f2","_f3","_un","_bp","_Vest","_itS","_itP","_group","_da","_pP","_hat","_uni","_typeOf","_mag","_mag2","_itemCargoUni","_magCargoUni","_weaCargoUni","_itemCargoBackPack","_magCargoBackPack","_weaCargoBackPack","_itemCargoVest","_magCargoVest","_weaCargoVest","_eh","_units","_Upos","_mag3","_asI","_uniBol","_BackPackBol","_VestBol"];
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
case "V": {(vestContainer _unit) addMagazineCargo [_class , 1];};
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
case "V": {(vestContainer _unit) addItemCargo [_class , 1];};
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
_unit = if (typename _this == "ARRAY") then {_this select 0} else {_this};
_mag = primaryWeaponMagazine _unit;
_mag2 = secondaryWeaponMagazine _unit;
_mag3 = handgunMagazine _unit;
_typeOf = typeOf _unit;
_bp = Backpack _unit;
_uni = uniform _unit;
_hat = headgear _unit;
_goggles = goggles _unit;
_pP = getposATL player;
_da= damage _unit;
_Vest = Vest _unit;
_asI = assignedItems _unit;
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



//NEW UNIT
_group = [[(_pP select 0)+10-(random 20),(_pP select 1)+10-(random 20),0], WEST, [_typeOf],[],[],[0.9,1.0],[],[-1, 1],0,""] call SpawnGroupCustom;
_un = leader _group;
_un setvariable ["DAPPED",1];
_un allowdamage false;
removeAllAssignedItems _un; 
removeallweapons _un;
removeHeadgear _un;
removeVest _un;
removeBackpack _un;

if (_goggles != "") then {
_un addGoggles _goggles;
};
//COPY SKILL
{_un setSkill [_x,(_unit skill _x)];} foreach ["general","commanding","reloadSpeed","courage","spotTime","spotDistance","endurance","aimingSpeed","aimingShake","aimingAccuracy"];

_itP = if (!isNil{primaryWeaponItems _unit}) then {primaryWeaponItems _unit} else {[]};
_itS = if (!isNil{handgunItems _unit}) then {handgunItems _unit} else {[]};



if (!isnull (UniformContainer _unit)) then {
[_un,_uni] CALL SAOKADDUNIFORM;
clearMagazineCargo UniformContainer _un;
clearWeaponCargo UniformContainer _un;
clearItemCargo UniformContainer _un;
};

if (!isNil"_hat") then {
_un addHeadgear _hat;
};
if (!isNil"_Vest") then {
_un addVest _Vest;
clearMagazineCargo VestContainer _un;
clearWeaponCargo VestContainer _un;
clearItemCargo VestContainer _un;
};
if (_bp != "") then {
_un addBackpack _bp;
clearMagazineCargo BackpackContainer _un;
clearWeaponCargo BackpackContainer _un;
clearItemCargo BackpackContainer _un;
};


{if (count _x > 0) then {if (_un canAdd (_x select 0)) then {_un addmagazine (_x select 0);};};sleep 0.1;} foreach [_mag,_mag2,_mag3];
if (handgunWeapon _unit != "") then {_un addweapon (handgunWeapon _unit);};
if (primaryWeapon _unit != "") then {_un addweapon (primaryWeapon _unit);};
if (secondaryWeapon _unit != "") then {_un addweapon (secondaryWeapon _unit);};





removeAllPrimaryWeaponItems _un; 
{
if (_x != "") then {
_un addPrimaryWeaponItem _x;
};
} foreach _itP;
removeAllHandgunItems _un; 
{
if (_x != "") then {
_un addhandgunItem _x;
};
} foreach _itS;


{
if !(_x in (assignedItems _un)) then {
_un addItem _x;_un assignItem _x;
if (_x == "Laserdesignator" && {_un canAdd _x}) then {_un addMagazine "Laserbatteries";};
};
} foreach _asI;

_un setDamage _da;
if !(typename _this == "ARRAY") then {
_un setName (name _unit);
_un setFace (face _unit);
};

if (_uniBol) then {
[_weaCargoUni,_un,"U"] CALL _f3;
[_itemCargoUni,_un,"U"] CALL _f2;
[_magCargoUni,_un,"U"] CALL _f1;
};

if (_BackPackBol) then {
[_weaCargoBackPack,_un,"B"] CALL _f3;
[_itemCargoBackPack,_un,"B"] CALL _f2;
[_magCargoBackPack,_un,"B"] CALL _f1;
};

if (_VestBol) then {
[_weaCargoVest,_un,"V"] CALL _f3;
[_itemCargoVest,_un,"V"] CALL _f2;
[_magCargoVest,_un,"V"] CALL _f1;
};

//VARIABLES TO COPY
{if (!isNil{_unit getvariable _x}) then {_un setvariable [_x,_unit getvariable _x];};} foreach ["PointSK"];
//{_un assignItem _x;} foreach _asI;
_un setUnitRank (rank _unit);
if !(typename _this == "ARRAY") then {
deletevehicle _unit;
[_un] joinSilent player;
{if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};} foreach [_un];
_un SPAWN {
private ["_time"];
_time = time + 100;
while {!isNull _this && {time < _time} && {alive _this}} do {
sleep 5;
if (leader _this != player) then {[_this] joinSilent player;};
};
};
} else {
missionnamespace setvariable ["NewP",_un];
addSwitchableUnit _un;
_units = + (units group player - [player]);
_Upos = getposATL _unit;

if (isnil{missionnamespace getvariable "PID"}) then {
_un setIdentity (missionnamespace getvariable "CIdentity");
} else {
_un setName (missionnamespace getvariable "PID");
_un setFace (face _unit);
};
{
private ["_bol"];
if ([_x] CALL BIS_fnc_taskExists) then {
_bol = if (_x == [_unit] CALL BIS_fnc_taskCurrent) then {true} else {false};
[
_un, // Task owner(s)
_x, // Task ID (used when setting task state, destination or description later)
(_x call BIS_fnc_taskDescription), // Task description
(_x call BIS_fnc_taskDestination), // Task destination
_bol, // true to set task as current upon creation
false
] call SAOKCRTASK;
};
sleep 0.1;
} foreach ([_unit] CALL BIS_fnc_tasksUnit);

//_n = ["task0"] CALL BIS_fnc_deleteTask; hint format ["%1",(["task0"] CALL BIS_fnc_taskExists)];
selectPlayer _un;
removeSwitchableUnit _unit;
deletevehicle _unit;
_un setpos _Upos;

[] SPAWN SAOKBRIE;
player addEventHandler ["FiRed",{[_this select 5,_this select 2] SPAWN FSmokeSignal;}];
/*
{player setVariable [format ["BIS_SUPP_used_%1", _x], 0, TRUE];} forEach [
		"Artillery",
		"CAS_Heli",
		"CAS_Bombing",
		"UAV",
		"Drop",
		"Transport"
];
*/
if (!isNil{missionnamespace getvariable "NewFatigue"}) then {player enableFatigue false;};
//player setVariable ["BIS_SUPP_transmitting", FALSE];
//if (!(player kbHasTopic "BIS_SUPP_protocol")) then {player kbAddtopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}]};
//if (isNil {player getVariable "BIS_SUPP_HQ"}) then {player setVariable ["BIS_SUPP_HQ", missionNamespace getVariable format ["BIS_SUPP_HQ_%1", side group player]]};
//if (!(isNil {modu2 getVariable "BIS_SUPP_custom_HQ"})) then {if ((modu2 getVariable "BIS_SUPP_custom_HQ") != "") then {player setVariable ["BIS_SUPP_HQ", call compile (modu2 getVariable "BIS_SUPP_custom_HQ")]}};
//(player getVariable "BIS_SUPP_HQ") kbAddtopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
//[_un, modu2, mudo1] CALL BIS_fnc_addSupportLink;

if (Bumblebeeman == 0) then {
_eh = player addEventHandler ["HandleDamage", {_this CALL FUNKTIO_PDA}];
_eh = player addEventHandler ["Explosion", {_this CALL FUNKTIO_PDAEX}];
} else {
//NO RESPAWN
_eh = player addEventHandler ["HandleDamage", {_this CALL FUNKTIO_PDA2}];
_eh = player addEventHandler ["Explosion", {if (((_this select 1) + damage player) > 0.9) then {player setdamage 1;};}];
};
_logic = player getvariable "BIS_HC_scope";
if (isnil "_logic") then {_logic = bis_hc_mainscope; player setvariable ["BIS_HC_scope",_logic,true]};
player setUnitRank "LIEUTENANT";
player setgroupid ["Wolf"];
[player,"PlaV", "JinVoices\sounds.bikb", ""] CALL SAOKKBTOPIC;
//ADV HINT
if (isNil {player getVariable "BIS_fnc_advHint_HActiveF"}) then {
				player setVariable ["BIS_fnc_advHint_HActiveF",""]
			};
			if (isNil {player getVariable "BIS_fnc_advHint_HActiveS"}) then {
				player setVariable ["BIS_fnc_advHint_HActiveS",""]
			};
//			
sleep 1;
if ({rank _x in ["LIEUTENANT"]} count _units > 0) then {player setUnitRank "MAJOR";};
_units joinsilent player;
{
_x SPAWN {
private ["_time"];
_time = time + 100;
while {!isNull _this && {time < _time} && {alive _this}} do {
sleep 5;
if (leader _this != player) then {[_this] joinSilent player;};
};
};
sleep 0.1;
} foreach _units;
player allowdamage true;
(group player) selectLeader player;
};
sleep 1;
_un allowdamage true;
if (primaryWeapon _un != "") then {_un selectweapon (primaryWeapon _un);};
if !(isPlayer _un) then {_un switchmove "";};