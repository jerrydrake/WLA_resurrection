
SAOKRESETVEHZ = {
private ["_f","_mType","_n","_count"];
_f = {
private ["_mN","_vehAr","_oldVehAr","_newAr"];
_mN = _this select 0;
_vehAr = _this select 1;
_oldVehAr = missionNamespace getvariable _mN;
_newAr = [];
{_newAr set [count _newAr, (_vehAr call RETURNRANDOM)];} foreach _oldVehAr;
missionNamespace setvariable [_mN,_newAr];
};
{
_mType = getmarkertype _x;
switch (_mType) do {
//SPEEDBOATS
case "o_mech_inf": {_n = [_x,ARMEDVEHICLES select 1] CALL _f;};
case "n_mech_inf": {_n = [_x,ARMEDVEHICLES select 2] CALL _f;};
case "b_mech_inf": {_n = [_x,ARMEDVEHICLES select 0] CALL _f;};
case "o_armor": {_n = [_x,ARMEDTANKS select 1] CALL _f;};
case "n_armor": {_n = [_x,ARMEDTANKS select 2] CALL _f;};
case "b_armor": {_n = [_x,ARMEDTANKS select 0] CALL _f;};
case "o_air": {_n = [_x,AIRARMCHOP select 1] CALL _f;};
case "n_air": {_n = [_x,AIRARMCHOP select 2] CALL _f;};
case "b_air": {_n = [_x,AIRARMCHOP select 0] CALL _f;};
case "o_plane": {_n = [_x,AIRFIGTHER select 1] CALL _f;};
case "n_plane": {_n = [_x,AIRFIGTHER select 2] CALL _f;};
case "b_plane": {_n = [_x,AIRFIGTHER select 0] CALL _f;};
case "o_art": {if (markertext _x == " AA") then {_n = [_x,ARMEDAA select 1] CALL _f;};};
case "b_art": {if (markertext _x == " AA") then {_n = [_x,ARMEDAA select 0] CALL _f;};};
};
} foreach VEHZONESA;
hint "Vehicle Zones Reseted";
_count = (count (configFile / "CfgVehicles")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgVehicles") select _count);
if ((getNumber (configfile >> "CfgVehicles" >> _n >> "scope")) != 0 && {getText(configfile >> "CfgVehicles" >> _n >> "displayName") != ""}) then {
if ((_n iskindof "SoldierWB" || {_n iskindof "SoldierGB"}) && {{_n == _x} count FRIENDC4 + FRIENDC3 + FRIENDC2 + FRIENDC1 == 0}) then {
FRIENDC5 set [count FRIENDC5, _n];
};
};
_count = _count - 1;
};
};

SAOKGEARSLOT = {
private ["_slotNum","_savename","_ar","_dGe"];
_slotNum = _this select 0;
if (count _this > 1) then {
//
hint "Saved";
_savename = "SaOkSlotSave"+format ["%1",_slotNum];
_ar = [
ARMEDVEHICLES,
ARMEDTANKS,
ARMEDAA,
ARMEDCARRIER,
ARMEDSTATIC,
AIRFIGTHER,
AIRARMCHOP,
AIRCARRIERCHOP,
ENEMYC1,
ENEMYC2,
ENEMYC3,
FRIENDC1,
FRIENDC2,
FRIENDC3,
FRIENDC4,
CIVS1,
CIVVEH,
ARMEDSUPPORT
];
profileNamespace setvariable [_savename,_ar];
//LOAD 
} else { 
_savename = "SaOkSlotSave"+format ["%1",_slotNum];
if (!isNil{profileNamespace getvariable _savename}) then {
hint "Loaded";
_dGe = profileNamespace getvariable _savename;
ARMEDVEHICLES = _dGe select 0;
ARMEDTANKS = _dGe select 1;
ARMEDAA = _dGe select 2;
ARMEDCARRIER = _dGe select 3;
ARMEDSTATIC = _dGe select 4;
AIRFIGTHER = _dGe select 5;
AIRARMCHOP = _dGe select 6;
AIRCARRIERCHOP = _dGe select 7;
ENEMYC1 = _dGe select 8;
ENEMYC2 = _dGe select 9;
ENEMYC3 = _dGe select 10;
FRIENDC1 = _dGe select 11;
FRIENDC2 = _dGe select 12;
FRIENDC3 = _dGe select 13;
FRIENDC4 = _dGe select 14;
CIVS1 = _dGe select 15;
CIVVEH = _dGe select 16;
ARMEDSUPPORT = _dGe select 17;
} else {hint "Loadfile dont exist";};
};
};

SAOKADDONMAIN = {

private ["_ok","_myDisplay","_ctrl"];
[["WLA","CustomMods"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "SaOkAddOnMain"; 
_myDisplay = findDisplay 2000;
_ctrl = _myDisplay displayCtrl 1520;
};

//VEH2
SAOKADDONVEH2DIA = {

private ["_foreachindex","_n","_ok","_myDisplay","_ctrl","_ctrl2","_ctrl3","_ctrl4","_ctrl5","_helpD"];
[["WLA","CustomMods"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "SaOkAddOnVeh2"; 
_myDisplay = findDisplay 2004;
_ctrl = _myDisplay displayCtrl 1520;
_ctrl2 = _myDisplay displayCtrl 1500;
_ctrl3 = _myDisplay displayCtrl 1505;
_ctrl4 = _myDisplay displayCtrl 1510;
_ctrl5 = _myDisplay displayCtrl 1515;
_helpD = [];
{
lbAdd [1520,getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_ctrl lbSetTooltip [_foreachindex,_x];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach SAOKallveh;
missionNameSpace setvariable ["helpD",_helpD];
_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1520"}) then {_n = missionnamespace getvariable "AddIndex1520";};
lbSetCurSel [1520, _n];
lbAdd [1521, "NATO Supply"];
lbAdd [1521, "CSAT Supply"];
lbAdd [1521, "GREEN Supply"];
lbAdd [1521, "Civ Vehicles"];
_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1521"}) then {_n = missionnamespace getvariable "AddIndex1521";};
lbSetCurSel [1521, _n];
_in = 0;
{lbAdd [1500, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1500, _in, _x];_in = _in + 1;_ctrl2 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDSUPPORT select 0);
_in = 0;{lbAdd [1505, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1505, _in, _x];_in = _in + 1;_ctrl3 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDSUPPORT select 1);
_in = 0;{lbAdd [1510, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1510, _in, _x];_in = _in + 1;_ctrl4 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDSUPPORT select 2);
_in = 0;{lbAdd [1515, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1515, _in, _x];_in = _in + 1;_ctrl5 lbSetTooltip [_foreachindex,_x];} foreach CIVVEH;
};

SAOKADDONVEH2REMLAST = {
private ["_side","_old","_new"];
_side = _this select 0;
missionnamespace setvariable ["AddIndex1521",_side];
switch _side do {
case 0: {_old = (ARMEDSUPPORT select 0); _new = [_old,(count _old - 1)] call SAOKREMINDEX; ARMEDSUPPORT set [0,_new];};
case 1: {_old = (ARMEDSUPPORT select 1); _new = [_old,(count _old - 1)] call SAOKREMINDEX; ARMEDSUPPORT set [1,_new];};
case 2: {_old = (ARMEDSUPPORT select 2); _new = [_old,(count _old - 1)] call SAOKREMINDEX; ARMEDSUPPORT set [2,_new];};
case 3: {CIVVEH = [CIVVEH,(count CIVVEH - 1)] call SAOKREMINDEX;};
};
};

SAOKADDONVEH2ADD = {
private ["_classN","_side","_old","_item"];
_classN = _this select 0;
_side = _this select 1;
missionnamespace setvariable ["AddIndex1521",_side];
_item = "";
{if (_classN == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (_item == "") exitWith {};
switch _side do {
case 0: {_old = (ARMEDSUPPORT select 0);_old set [count _old,_item];ARMEDSUPPORT set [0,_old];};
case 1: {_old = (ARMEDSUPPORT select 1);_old set [count _old,_item];ARMEDSUPPORT set [1,_old];};
case 2: {_old = (ARMEDSUPPORT select 2);_old set [count _old,_item];ARMEDSUPPORT set [2,_old];};
case 3: {CIVVEH set [count CIVVEH,_item];};
};
};

//MAN
SAOKADDONUNITDIA = {

private ["_foreachindex","_n","_ok","_myDisplay","_ctrl","_ctrl2","_ctrl3","_ctrl4","_ctrl5","_ctrl6","_ctrl7","_ctrl8","_ctrl9","_helpD"];
[["WLA","CustomMods"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "SaOkAddOnUnits"; 
_myDisplay = findDisplay 2003;
_ctrl = _myDisplay displayCtrl 1520;
_ctrl2 = _myDisplay displayCtrl 1500;
_ctrl3 = _myDisplay displayCtrl 1505;
_ctrl4 = _myDisplay displayCtrl 1510;
_ctrl5 = _myDisplay displayCtrl 1515;
_ctrl6 = _myDisplay displayCtrl 1502;
_ctrl7 = _myDisplay displayCtrl 1507;
_ctrl8 = _myDisplay displayCtrl 1512;
_ctrl9 = _myDisplay displayCtrl 1517;
_helpD = [];
{
lbAdd [1520,getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_ctrl lbSetTooltip [_foreachindex,_x];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach SAOKallunits;
missionNameSpace setvariable ["helpD",_helpD];
_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1520"}) then {_n = missionnamespace getvariable "AddIndex1520";};
lbSetCurSel [1520, _n];
lbAdd [1521, "FRIEND1"];
lbAdd [1521, "FRIEND2"];
lbAdd [1521, "FRIEND3"];
lbAdd [1521, "FRIEND4"];
lbAdd [1521, "ENEMY1"];
lbAdd [1521, "ENEMY2"];
lbAdd [1521, "ENEMY3"];
lbAdd [1521, "CIVILIAN"];
_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1521"}) then {_n = missionnamespace getvariable "AddIndex1521";};
lbSetCurSel [1521, _n];
_in = 0;
{lbAdd [1500, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1500, _in, _x];_in = _in + 1;_ctrl2 lbSetTooltip [_foreachindex,_x];} foreach FRIENDC1;
_in = 0;{lbAdd [1505, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1505, _in, _x];_in = _in + 1;_ctrl3 lbSetTooltip [_foreachindex,_x];} foreach FRIENDC2;
_in = 0;{lbAdd [1510, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1510, _in, _x];_in = _in + 1;_ctrl4 lbSetTooltip [_foreachindex,_x];} foreach FRIENDC3;
_in = 0;{lbAdd [1515, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1505, _in, _x];_in = _in + 1;_ctrl5 lbSetTooltip [_foreachindex,_x];} foreach FRIENDC4;
_in = 0;{lbAdd [1502, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1502, _in, _x];_in = _in + 1;_ctrl6 lbSetTooltip [_foreachindex,_x];} foreach ENEMYC1;
_in = 0;{lbAdd [1507, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1507, _in, _x];_in = _in + 1;_ctrl7 lbSetTooltip [_foreachindex,_x];} foreach ENEMYC2;
_in = 0;{lbAdd [1512, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1512, _in, _x];_in = _in + 1;_ctrl8 lbSetTooltip [_foreachindex,_x];} foreach ENEMYC3;
_in = 0;{lbAdd [1517, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1517, _in, _x];_in = _in + 1;_ctrl9 lbSetTooltip [_foreachindex,_x];} foreach CIVS1;
};

SAOKADDONUNITREMLAST = {
private ["_side"];
_side = _this select 0;
missionnamespace setvariable ["AddIndex1521",_side];
switch _side do {
case 0: {FRIENDC1 = [FRIENDC1,(count FRIENDC1 - 1)] call SAOKREMINDEX;};
case 1: {FRIENDC2 = [FRIENDC2,(count FRIENDC2 - 1)] call SAOKREMINDEX;};
case 2: {FRIENDC3 = [FRIENDC3,(count FRIENDC3 - 1)] call SAOKREMINDEX;};
case 3: {FRIENDC4 = [FRIENDC4,(count FRIENDC4 - 1)] call SAOKREMINDEX;};
case 4: {ENEMYC1 = [ENEMYC1,(count ENEMYC1 - 1)] call SAOKREMINDEX;};
case 5: {ENEMYC2 = [ENEMYC2,(count ENEMYC2 - 1)] call SAOKREMINDEX;};
case 6: {ENEMYC3 = [ENEMYC3,(count ENEMYC3 - 1)] call SAOKREMINDEX;};
case 7: {CIVS1 = [CIVS1,(count CIVS1 - 1)] call SAOKREMINDEX;};
};
};

SAOKADDONUNITADD = {
private ["_classN","_side","_item"];
_classN = _this select 0;
_side = _this select 1;
missionnamespace setvariable ["AddIndex1521",_side];
_item = "";
{if (_classN == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (_item == "") exitWith {};
switch _side do {
case 0: {FRIENDC1 set [count FRIENDC1,_item];};
case 1: {FRIENDC2 set [count FRIENDC2,_item];};
case 2: {FRIENDC3 set [count FRIENDC3,_item];};
case 3: {FRIENDC4 set [count FRIENDC4,_item];};
case 4: {ENEMYC1 set [count ENEMYC1,_item];};
case 5: {ENEMYC2 set [count ENEMYC2,_item];};
case 6: {ENEMYC3 set [count ENEMYC3,_item];};
case 7: {CIVS1 set [count CIVS1,_item];};
};
};

//AIR
SAOKADDONAIRDIA = {

private ["_foreachindex","_n","_ok","_myDisplay","_ctrl","_ctrl2","_ctrl3","_ctrl4","_ctrl5","_ctrl6","_ctrl7","_ctrl8","_ctrl9","_ctrl10","_helpD"];
[["WLA","CustomMods"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "SaOkAddOnAirVeh"; 
_myDisplay = findDisplay 2002;
_ctrl = _myDisplay displayCtrl 1520;
_ctrl2 = _myDisplay displayCtrl 1500;
_ctrl3 = _myDisplay displayCtrl 1505;
_ctrl4 = _myDisplay displayCtrl 1510;
_ctrl5 = _myDisplay displayCtrl 1501;
_ctrl6 = _myDisplay displayCtrl 1506;
_ctrl7 = _myDisplay displayCtrl 1511;
_ctrl8 = _myDisplay displayCtrl 1502;
_ctrl9 = _myDisplay displayCtrl 1507;
_ctrl10 = _myDisplay displayCtrl 1512;
//{lbAdd [_x, format ["%1",_x]];} foreach [1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1522];
_helpD = [];
{
lbAdd [1520, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_ctrl lbSetTooltip [_foreachindex,_x];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach SAOKallairveh;
_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1520"}) then {_n = missionnamespace getvariable "AddIndex1520";};
lbSetCurSel [1520, _n];
missionNameSpace setvariable ["helpD",_helpD];
lbAdd [1521, "BLUFOR"];
lbAdd [1521, "REDFOR"];
lbAdd [1521, "GREENFOR"];

_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1521"}) then {_n = missionnamespace getvariable "AddIndex1521";};
lbSetCurSel [1521, _n];
lbAdd [1522, "Figthers"];
lbAdd [1522, "Armed Choppers"];
lbAdd [1522, "Carrier Choppers"];

_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1522"}) then {_n = missionnamespace getvariable "AddIndex1522";};
lbSetCurSel [1522, _n];

_in = 0;
{lbAdd [1500, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1500, _in, _x];_in = _in + 1;_ctrl2 lbSetTooltip [_foreachindex,_x];} foreach (AIRFIGTHER select 0);
_in = 0;{lbAdd [1505, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1505, _in, _x];_in = _in + 1;_ctrl3 lbSetTooltip [_foreachindex,_x];} foreach (AIRFIGTHER select 1);
_in = 0;{lbAdd [1510, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1510, _in, _x];_in = _in + 1;_ctrl4 lbSetTooltip [_foreachindex,_x];} foreach (AIRFIGTHER select 2);


_in = 0;{lbAdd [1501, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1501, _in, _x];_in = _in + 1;_ctrl5 lbSetTooltip [_foreachindex,_x];} foreach (AIRARMCHOP select 0);
_in = 0;{lbAdd [1506, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1506, _in, _x];_in = _in + 1;_ctrl6 lbSetTooltip [_foreachindex,_x];} foreach (AIRARMCHOP select 1);
_in = 0;{lbAdd [1511, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1511, _in, _x];_in = _in + 1;_ctrl7 lbSetTooltip [_foreachindex,_x];} foreach (AIRARMCHOP select 2);


_in = 0;{lbAdd [1502, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1502, _in, _x];_in = _in + 1;_ctrl8 lbSetTooltip [_foreachindex,_x];} foreach (AIRCARRIERCHOP select 0);
_in = 0;{lbAdd [1507, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1507, _in, _x];_in = _in + 1;_ctrl9 lbSetTooltip [_foreachindex,_x];} foreach (AIRCARRIERCHOP select 1);
_in = 0;{lbAdd [1512, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1512, _in, _x];_in = _in + 1;_ctrl10 lbSetTooltip [_foreachindex,_x];} foreach (AIRCARRIERCHOP select 2);
};

SAOKADDONAIRVEHREMLAST = {
private ["_side","_section","_old","_new"];
_side = _this select 0;
missionnamespace setvariable ["AddIndex1521",_side];
_section = _this select 1;
missionnamespace setvariable ["AddIndex1522",_section];
switch _section do {
case 0: {_old = + (AIRFIGTHER select _side); _new = [_old,(count _old - 1)] call SAOKREMINDEX; AIRFIGTHER set [_side,_new];};
case 1: {_old = + (AIRARMCHOP select _side); _new = [_old,(count _old - 1)] call SAOKREMINDEX; AIRARMCHOP set [_side,_new];};
case 2: {_old = + (AIRCARRIERCHOP select _side); _new = [_old,(count _old - 1)] call SAOKREMINDEX; AIRCARRIERCHOP set [_side,_new];};
};

};
//0 NATO 1 RED 2 GREEN 3 RES
//0 ARMED 1 TANK 2 AA 3 CARRIER 4 STATIC
SAOKADDONAIRVEHADD = {
private ["_classN","_side","_section","_old","_new","_item"];
_classN = _this select 0;
_side = _this select 1;
missionnamespace setvariable ["AddIndex1521",_side];
_section = _this select 2;
missionnamespace setvariable ["AddIndex1522",_section];
_item = "";
{if (_classN == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (_item == "") exitWith {};
switch _section do {
case 0: {_old = +(AIRFIGTHER select _side); _new = _old + [_item]; AIRFIGTHER set [_side,_new];};
case 1: {_old = +(AIRARMCHOP select _side); _new = _old + [_item]; AIRARMCHOP set [_side,_new];};
case 2: {_old = +(AIRCARRIERCHOP select _side); _new = _old + [_item]; AIRCARRIERCHOP set [_side,_new];};
};
};

//LAND
SAOKADDONVEHDIA = {

private ["_foreachindex","_n","_ok","_myDisplay","_ctrl","_ctrl2","_ctrl3","_ctrl4","_ctrl5","_ctrl6","_ctrl7","_ctrl8","_ctrl9","_ctrl10","_ctrl11","_ctrl12","_ctrl13","_ctrl14","_ctrl15","_ctrl16","_ctrl17","_ctrl18","_ctrl19","_ctrl20","_ctrl21","_helpD"];
[["WLA","CustomMods"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "SaOkAddOnVeh"; 
_myDisplay = findDisplay 2001;
_ctrl = _myDisplay displayCtrl 1520;
_ctrl2 = _myDisplay displayCtrl 1500;
_ctrl3 = _myDisplay displayCtrl 1505;
_ctrl4 = _myDisplay displayCtrl 1510;
_ctrl5 = _myDisplay displayCtrl 1515;
_ctrl6 = _myDisplay displayCtrl 1501;
_ctrl7 = _myDisplay displayCtrl 1506;
_ctrl8 = _myDisplay displayCtrl 1511;
_ctrl9 = _myDisplay displayCtrl 1516;
_ctrl10 = _myDisplay displayCtrl 1502;
_ctrl11 = _myDisplay displayCtrl 1507;
_ctrl12 = _myDisplay displayCtrl 1512;
_ctrl13 = _myDisplay displayCtrl 1517;
_ctrl14 = _myDisplay displayCtrl 1503;
_ctrl15 = _myDisplay displayCtrl 1508;
_ctrl16 = _myDisplay displayCtrl 1513;
_ctrl17 = _myDisplay displayCtrl 1518;
_ctrl18 = _myDisplay displayCtrl 1504;
_ctrl19 = _myDisplay displayCtrl 1509;
_ctrl20 = _myDisplay displayCtrl 1514;
_ctrl21 = _myDisplay displayCtrl 1519;
//{lbAdd [_x, format ["%1",_x]];} foreach [1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1522];
_helpD = [];
{
lbAdd [1520, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
_ctrl lbSetTooltip [_foreachindex,_x];
_helpD set [count _helpD, [_x,getText(configfile >> "CfgVehicles" >> _x >> "displayName")]];
} foreach SAOKallveh;
_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1520"}) then {_n = missionnamespace getvariable "AddIndex1520";};
lbSetCurSel [1520, _n];
missionNameSpace setvariable ["helpD",_helpD];
lbAdd [1521, "BLUFOR"];
lbAdd [1521, "REDFOR"];
lbAdd [1521, "GREENFOR"];
lbAdd [1521, "GREEN RES"];
_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1521"}) then {_n = missionnamespace getvariable "AddIndex1521";};
lbSetCurSel [1521, _n];
lbAdd [1522, "Light Veh"];
lbAdd [1522, "Tanks"];
lbAdd [1522, "Anti-Air"];
lbAdd [1522, "Carrier"];
lbAdd [1522, "Static Gun"];
_n = 0;
if (!isNil{missionnamespace getvariable "AddIndex1522"}) then {_n = missionnamespace getvariable "AddIndex1522";};
lbSetCurSel [1522, _n];

{lbAdd [1500, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1500, _foreachIndex, _x];_ctrl2 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDVEHICLES select 0);
{lbAdd [1505, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1505, _foreachIndex, _x];_ctrl3 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDVEHICLES select 1);
{lbAdd [1510, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1510, _foreachIndex, _x];_ctrl4 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDVEHICLES select 2);
{lbAdd [1515, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1515, _foreachIndex, _x];_ctrl5 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDVEHICLES select 3);

{lbAdd [1501, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1501, _foreachIndex, _x];_ctrl6 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDTANKS select 0);
{lbAdd [1506, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1506, _foreachIndex, _x];_ctrl7 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDTANKS select 1);
{lbAdd [1511, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1511, _foreachIndex, _x];_ctrl8 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDTANKS select 2);
{lbAdd [1516, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1516, _foreachIndex, _x];_ctrl9 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDTANKS select 3);

{lbAdd [1502, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1502, _foreachIndex, _x];_ctrl10 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDAA select 0);
{lbAdd [1507, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1507, _foreachIndex, _x];_ctrl11 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDAA select 1);
{lbAdd [1512, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1512, _foreachIndex, _x];_ctrl12 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDAA select 2);
{lbAdd [1517, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1517, _foreachIndex, _x];_ctrl13 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDAA select 3);

{lbAdd [1503, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1503, _foreachIndex, _x];_ctrl14 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDCARRIER select 0);
{lbAdd [1508, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1508, _foreachIndex, _x];_ctrl15 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDCARRIER select 1);
{lbAdd [1513, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1513, _foreachIndex, _x];_ctrl16 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDCARRIER select 2);
{lbAdd [1518, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1518, _foreachIndex, _x];_ctrl17 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDCARRIER select 3);

{lbAdd [1504, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1504, _foreachIndex, _x];_ctrl18 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDSTATIC select 0);
{lbAdd [1509, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1509, _foreachIndex, _x];_ctrl19 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDSTATIC select 1);
{lbAdd [1514, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1514, _foreachIndex, _x];_ctrl20 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDSTATIC select 2);
{lbAdd [1519, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];lbSetData [1519, _foreachIndex, _x];_ctrl21 lbSetTooltip [_foreachindex,_x];} foreach (ARMEDSTATIC select 3);
};

//0 NATO 1 RED 2 GREEN 3 RES
//0 ARMED 1 TANK 2 AA 3 CARRIER 4 STATIC
SAOKADDONVEHREMLAST = {
private ["_side","_section","_old","_new"];
_side = _this select 0;
missionnamespace setvariable ["AddIndex1521",_side];
_section = _this select 1;
missionnamespace setvariable ["AddIndex1522",_section];
switch _section do {
case 0: {_old = + (ARMEDVEHICLES select _side); _new = [_old,(count _old - 1)] call SAOKREMINDEX; ARMEDVEHICLES set [_side,_new];};
case 1: {_old = + (ARMEDTANKS select _side); _new = [_old,(count _old - 1)] call SAOKREMINDEX; ARMEDTANKS set [_side,_new];};
case 2: {_old = + (ARMEDAA select _side); _new = [_old,(count _old - 1)] call SAOKREMINDEX; ARMEDAA set [_side,_new];};
case 3: {_old = + (ARMEDCARRIER select _side); _new = [_old,(count _old - 1)] call SAOKREMINDEX; ARMEDCARRIER set [_side,_new];};
case 4: {_old = + (ARMEDSTATIC select _side); _new = [_old,(count _old - 1)] call SAOKREMINDEX; ARMEDSTATIC set [_side,_new];};
};

};
//0 NATO 1 RED 2 GREEN 3 RES
//0 ARMED 1 TANK 2 AA 3 CARRIER 4 STATIC
SAOKADDONVEHADD = {
private ["_classN","_side","_section","_old","_new","_item"];
_classN = _this select 0;
_side = _this select 1;
missionnamespace setvariable ["AddIndex1521",_side];
_section = _this select 2;
missionnamespace setvariable ["AddIndex1522",_section];
_item = "";

//{if (_classN == _x select 1) exitWith {_item = _x select 0};} foreach (missionNameSpace getvariable "helpD");
if (_item == "") exitWith {};
switch _section do {
case 0: {_old = +(ARMEDVEHICLES select _side); _new = _old + [_item]; ARMEDVEHICLES set [_side,_new];};
case 1: {_old = +(ARMEDTANKS select _side); _new = _old + [_item]; ARMEDTANKS set [_side,_new];};
case 2: {_old = +(ARMEDAA select _side); _new = _old + [_item]; ARMEDAA set [_side,_new];};
case 3: {_old = +(ARMEDCARRIER select _side); _new = _old + [_item]; ARMEDCARRIER set [_side,_new];};
case 4: {_old = +(ARMEDSTATIC select _side); _new = _old + [_item]; ARMEDSTATIC set [_side,_new];};
};
};