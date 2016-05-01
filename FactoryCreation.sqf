
SAOKDFACPIC = {
private ["_pic","_veh"];
//Vehicles
_veh = "";
{if (_this == getText(configfile >> "CfgVehicles" >> _x >> "displayName")) exitWith {_veh = _x;};} foreach SAOKallveh + SAOKallairveh;
if (_veh != "") then {
_pic = getText(configfile >> "CfgVehicles" >> _veh >> "picture");
ctrlSetText [1200, _pic];
};
};

SAOKDFACCREATE = {
private ["_veh","_Pstart","_start","_st","_cP","_obj"];
//Vehicles
_veh = "";
{if (_this == getText(configfile >> "CfgVehicles" >> _x >> "displayName")) exitWith {_veh = _x;};} foreach SAOKallveh + SAOKallairveh;
if (_veh != "") then {
_Pstart = [];
_start = getposATL player;
_cP = screenToWorld [0.5,0.5];
if (_cP distance player < 40 && {count (_cP nearObjects ["House",10]) == 0} && {count (_cP nearObjects ["Static",10]) == 0}) then {_Pstart = + _cP;};
if (count _Pstart > 0) then {_start = + _Pstart;} else {
_start = [getposATL player, 50,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
};
_obj = createVehicle [_veh,_start, [], 0, "NONE"]; 
_obj setdir (random 360);
CARS set [count CARS, _obj];
AddIdVeh set [count AddIdVeh, _obj];
FACRES = FACRES - 3;
};
};

SAOKFACDIA = {
private ["_ok","_text"];
sleep (random 0.1);
if (dialog) exitWith {};
[["WLA","FactoryCreations"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "FactoryDialog"; 
{
if !(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"]) then {
lbAdd [1500, getText(configfile >> "CfgVehicles" >> _x >> "displayName")];
};
} foreach SAOKallveh + SAOKallairveh;
lbSetCurSel [1500, 0];
if (FACRES < 3) then {ctrlEnable [1600, false];};
_text = "Factory Resources: "+(format ["%1",FACRES]);
_text SPAWN HINTSAOK;
};