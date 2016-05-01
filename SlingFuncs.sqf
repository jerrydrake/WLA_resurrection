SAOKSLINGDIA = {
if (dialog || {vehicle player == player}) exitWith {};
disableserialization;
_ok = createDialog "SlingDialog"; 
_myDisplay = findDisplay 14335;
"ITEM DRAGING OR DOUBLECLICKING CAN BE USED" SPAWN SAOKBOXHINT;
_gP = (getposATL vehicle player);
_crates = (_gP nearEntities [["ReammoBox_F","Land_BarrelWater_F","LandVehicle","Car"], 20]);
_f1 = 0;
_f2 = 0;
_dat = [];
{
if (_x != vehicle player) then {
if (!isNil{missionnamespace getvariable "SLINGED"} && {_x in (missionnamespace getvariable "SLINGED")}) then {
lbAdd [1501, (getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))];
//lbSetData [1501, _f1, _x]; 
_f1 = _f1 + 1;
} else {
lbAdd [1500, (getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))];
_dat set [count _dat,[_f2, _x,(getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))]];
//lbSetData [1500, _f2, _x]; 
_f2 = _f2 + 1;
};
};
} foreach _crates;
missionnamespace setvariable ["SlingD",_dat];
};
SAOKSLINGADD = {
if (!isNil{missionnamespace getvariable "SLINGED"}) exitWith {};
_gP = vehicle player;
//_v = lbData [1500, _this];
_v = "";
if (typename _this == "SCALAR") then {
{if (_this == _x select 0) exitWith {_v = _x select 1;};} foreach (missionnamespace getvariable "SlingD");
} else {
{if (_this == _x select 2) exitWith {_v = _x select 1;};} foreach (missionnamespace getvariable "SlingD");
};
if (typename _v == "STRING") exitWith {};
{ropeDestroy _x;} foreach ((missionnamespace getvariable "SLINGED") select 1);
//lbAdd [1501, (getText (configfile >> "CfgVehicles" >> (typeof _v) >> "displayName"))];
//lbSetData [1501, 0, _v];
_mass = 0;
if (getmass _v > 3000) then {_mass = getmass _v;_v setMass [3000,3];};
_bbr = boundingBoxReal _v;
//_p1 = _bbr select 0;
_p2 = _bbr select 1;
_p2 set [0, ((_p2 select 0) * 0.2)];
_p2 set [1, ((_p2 select 1) * 0.2)];
_p2 set [2, -((_p2 select 2) * 0.2)];
//_p2 set [2, 0];
//_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
//_maxLength = abs ((_p2 select 1) - (_p1 select 1));
//_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
//slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4"};
_sP = [0,0,0];
if ((getText (configfile >> "CfgVehicles" >> (typeof _gP) >> "slingLoadMemoryPoint")) != "") then {_sP = (getText (configfile >> "CfgVehicles" >> (typeof _gP) >> "slingLoadMemoryPoint"));};
if (count (getArray (configfile >> "CfgVehicles" >> (typeof _v) >> "slingLoadCargoMemoryPoints")) == 0) then {
_r = ropeCreate [vehicle player,_sP,_v,[_p2 select 0,_p2 select 1,_p2 select 2],15];
_r2 = ropeCreate [vehicle player,_sP,_v,[_p2 select 0,-(_p2 select 1),_p2 select 2],15];
_r3 = ropeCreate [vehicle player,_sP,_v,[-(_p2 select 0),-(_p2 select 1),_p2 select 2],15];
_r4 = ropeCreate [vehicle player,_sP,_v,[-(_p2 select 0),_p2 select 1,_p2 select 2],15];
missionnamespace setvariable ["SLINGED",[_v,[_r,_r2,_r3,_r4],_mass]];
} else {
_rops = [];
{
_r = ropeCreate [vehicle player,_sP,_v,_x,15];
_rops pushback _r;
} foreach (getArray (configfile >> "CfgVehicles" >> (typeof _v) >> "slingLoadCargoMemoryPoints"));
missionnamespace setvariable ["SLINGED",[_v,_rops,_mass]];
};
//{ropeSetCargoMass [_x, _v, 100];} foreach [_r,_r2,_r3,_r4];
lbClear 1501;
lbClear 1500;
_dat = [];
_f1 = 0;
_f2 = 0;
_crates = (_gP nearEntities [["ReammoBox_F","Land_BarrelWater_F","LandVehicle","Car"], 20]);
{
if (_x != vehicle player) then {
if (!isNil{missionnamespace getvariable "SLINGED"} && {_x in (missionnamespace getvariable "SLINGED")}) then {
lbAdd [1501, (getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))];
//lbSetData [1501, _f1, _x]; 
_f1 = _f1 + 1;
} else {
lbAdd [1500, (getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))];
_dat set [count _dat,[_f2, _x,(getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))]];
//lbSetData [1500, _f2, _x]; 
_f2 = _f2 + 1;
};
};
} foreach _crates;
missionnamespace setvariable ["SlingD",_dat];
};
SAOKSLINGREM = {
_gP = vehicle player;
if (!isNil{missionnamespace getvariable "SLINGED"}) then {
{ropeDestroy _x;} foreach ((missionnamespace getvariable "SLINGED") select 1);
if (((missionnamespace getvariable "SLINGED") select 2) > 0) then {
((missionnamespace getvariable "SLINGED") select 0) setMass [((missionnamespace getvariable "SLINGED") select 2),3];
};
missionnamespace setvariable ["SLINGED",nil];
lbClear 1501;
lbClear 1500;
_dat = [];
_f1 = 0;
_f2 = 0;
_crates = (_gP nearEntities [["ReammoBox_F","Land_BarrelWater_F","LandVehicle","Car"], 30]);
{
if (_x != vehicle player) then {
if (!isNil{missionnamespace getvariable "SLINGED"} && {_x in (missionnamespace getvariable "SLINGED")}) then {
lbAdd [1501, (getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))];
//lbSetData [1501, _f1, _x]; 
_f1 = _f1 + 1;
} else {
lbAdd [1500, (getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))];
_dat set [count _dat,[_f2, _x,(getText (configfile >> "CfgVehicles" >> (typeof _x) >> "displayName"))]];
//lbSetData [1500, _f2, _x]; 
_f2 = _f2 + 1;
};
};
} foreach _crates;
missionnamespace setvariable ["SlingD",_dat];

};

};
