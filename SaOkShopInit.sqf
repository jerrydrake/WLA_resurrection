SAOKUSHOPD = {
private ["_ok","_myDisplay"];
disableserialization;
_ok = createDialog "SaOkUnitShop"; 
_myDisplay = findDisplay 6995;
"RES|140 GREEN|160 NATO|180 NATOSF|190, OTHER|170, Higher Price -> Higher Skill" SPAWN HINTSAOK;
lbAdd [1500, "Resistance"];
if (typename _this == "ARRAY") then {
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {
lbAdd [1500, "Green Army"];
};
if ("USHelp" in (missionnamespace getvariable "Progress")) then {
lbAdd [1500, "NATO"];
lbAdd [1500, "NATO SPECIAL"];
};
lbAdd [1500, "Other"];
};
lbSetCurSel [1500, 0];
};

SAOKUADD = {
private ["_c","_array","_pos","_waypoints","_building","_sHou","_class","_baseS","_group"];
_class = _this select 0;
_baseS = _this select 1;
_pos = getposATL vehicle player;
_group = [ [(_pos select 0) + 50 - (random 100),(_pos select 1) + 50 - (random 100),0], WEST, [_class],[],[],[0.6,0.9]] call SpawnGroupCustom;

{
_x setUnitRank (["PRIVATE", "CORPORAL", "SERGEANT"] call RETURNRANDOM);
if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];
_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];
_eh = _x addEventHandler ["Explosion", {_this call SADAME}];
};
} foreach units _group;
{
_x setSkill ["aimingaccuracy", _baseS + (random 0.4)];
_x setSkill ["aimingShake", _baseS + (random 0.4)];
_x setSkill ["aimingSpeed", _baseS + (random 0.4)];
_x setSkill ["spotDistance", _baseS + (random 0.4)];
_x setSkill ["spotTime", _baseS + (random 0.35)];
_x setSkill ["endurance", _baseS + (random 0.35)];
_x setSkill ["courage", _baseS + (random 0.35)];
_x setSkill ["reloadSpeed", _baseS + (random 0.35)];
_x setSkill ["commanding", _baseS + (random 0.35)];
_x setSkill ["general", _baseS + (random 0.35)];
} foreach [leader _group];
if !(count _this > 2) then {
{
_c = 0;
_building = objNull;
_sHou = [(_pos select 0) + 100 - (random 200), (_pos select 1) + 100 - (random 200), 0];
_building = nearestBuilding _sHou;
_waypoints = _building call SAOKBUILDINGPOS;
if (count _waypoints > 0) then {
_pos = _building buildingPos (_waypoints call RETURNRANDOM);
_x setpos _pos;
};
} foreach units _group;
} else {_gP = getposATL leader _group; leader _group setpos [_gP select 0, _gP select 1, 120]; _nul = [leader _group,vehicle leader _group] SPAWN SAOKEJECT;sleep 6;};
units _group join player;
};

SAOKUSHOPBUY = {
private ["_cat","_unitN","_unitC","_price","_bs","_nul"];
_cat = (lbText [1500, (lbCurSel 1500)]);
_unitN = (lbText [1501, (lbCurSel 1501)]);
_unitC =[];{if (_unitN == _x select 1) exitWith {_unitC = _x select 0;};} foreach (missionNameSpace getvariable "helpD");
if (typename _unitC == "ARRAY") exitWith {};
_price = 140;
_bs = 0.1;
switch _cat do {
case "Resistance": {
_price = 140;
_bs = 0.1;
};
case "Green Army": {
_price = 160;
_bs = 0.22;
};
case "NATO": {
_price = 180;
_bs = 0.35;
};
case "NATO SPECIAL": {
_price = 190;
_bs = 0.47;
};
case "OTHER": {
_price = 170;
_bs = 0.28;
};
};
if (pisteet >= _price) then {
pisteet = pisteet - _price;
"Cash" SPAWN SAOKPLAYSOUND;
_nul = [-_price, "Received Team-mate"] SPAWN PRESTIGECHANGE;
[_unitC,_bs] SPAWN SAOKUADD;
} else {(format ["%1 more prestige value needed to receive new team-mate", _price - pisteet]) SPAWN HINTSAOK;}; 
};

SAOKUSHOPCAT = {
private ["_helpD"];
lbClear 1501;
_helpD = [];
switch _this do {
case "Resistance": {
{
lbAdd [1501, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach FRIENDC4;
};
case "Green Army": {
{
lbAdd [1501, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach FRIENDC2;
};
case "NATO": {
{
lbAdd [1501, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach FRIENDC1;
};
case "NATO SPECIAL": {
{
lbAdd [1501, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach FRIENDC3;
};
case "Other": {
{
lbAdd [1501, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach FRIENDC5;
};
};
missionNameSpace setvariable ["helpD",_helpD];
};