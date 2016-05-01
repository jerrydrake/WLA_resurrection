//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
private ["_limitsF","_ok","_sliP","_sel","_class","_veh","_timeT","_myDisplay","_pDir","_c","_cc","_curS","_textA","_cost","_post","_marker","_d","_nul","_earlier","_id","_sd","_text","_classD","_vaara","_nRPP","_ngg","_ukkoLimit","_aseLimit"];
sleep (random 0.15);
if (dialog || {!isNil"LIIKUTAOBJEKTI"}) exitWith {};
disableserialization;
if (!isNil{missionnamespace getvariable "DrawFF"} && {(player distance ((missionnamespace getvariable "DrawFF") select 1) > 100)}) then {
missionnamespace setvariable ["DrawFF",nil];
};

if ({alive _x} count ((getposATL player) nearEntities [CONSVEHCLAS, 75]) == 0) exitWith {
"Operative Construct-vehicle needs to be under 75m away from you." SPAWN HINTSAOK;
_t = "VEHICLES WITH CONSTRUCT ABILITY / PRICING FACTOR:"+ "<br/>";
{
if (isclass(configfile >> "CfgVehicles" >> _x)) then {
_t = _t + (getText (configfile >> "CfgVehicles" >> _x >> "displayName"))+ " |"+format ["%1",([_x] CALL SAOKCONSRATE)]+"<br/>";
};
} foreach CONSVEHCLAS;
[_t] SPAWN SAOKBOXHINT;
};
_marker = "InsertionChop";
_post = ([(getposATL player)] CALL RETURNGUARDPOST);
if !(isNil{_post getvariable "Gmark"}) then {
_marker = _post getvariable "Gmark";
};
_sd = "ColorRed";
if (side player == EAST) then {_sd = "ColorGreen";};
if (getmarkercolor _marker == _sd && {_post distance (getposATL player) < 250}) exitWith {"Enemy guardpost too close, under 250m away" SPAWN HINTSAOK;};
if (_post distance (getposATL player) > 50 && {GUARDLIM}) then {
[["WLA","ConstructNotes"]] call BIS_fnc_advHint;
};
if (!GUARDLIM) then {
[["WLA","ConstructNotes"]] call BIS_fnc_advHint;
};
sleep (random 0.05);
if (!isNil{missionnamespace getvariable "CurObject"}) then {deletevehicle (missionnamespace getvariable "CurObject");missionnamespace setvariable ["CurObject",nil];};
if (!dialog && {isNil"LIIKUTAOBJEKTI"}) then {

if (!isNil{missionnamespace getvariable "ConsMoved"} && {_post distance (getposATL player) > 50}) then {
if (0 != ((missionnamespace getvariable "ConsMoved") select 1)) then {
missionnamespace setvariable ["ConsMoved",nil];
};
};


_ok = createDialog "ConstructionDialog"; 
ctrlEnable [1608, false];
_myDisplay = findDisplay 1233;
//if (!isNil{_post getvariable "GCreator"}) then {hint format ["%1 %2",(_post getvariable "GCreator"),name player];};
if ((!isNil{_post getvariable "GCreator"} && {(_post getvariable "GCreator") == name player}) || {true}) then {ctrlEnable [1607, true];} else {ctrlEnable [1607, false];};
if (!isNil{_post getvariable "StaticOS"} && {count (_post getvariable "StaticOS") > 0}) then {ctrlEnable [1607, false];};
sliderSetRange [1900, 0, 360];
sliderSetRange [1901, 0, 25];
sliderSetRange [1902, -90, 90];
_pDir = direction player;
if (_pDir < 0) then {_pDir = _pDir + 360;};
if (_pDir > 360) then {_pDir = _pDir - 360;};
_pDir = _pDir + 180;
if (_pDir > 360) then {_pDir = _pDir - 360;};
sliderSetPosition [1900, _pDir];
sliderSetPosition [1901, 0];

_sPp = 0;
if (!isNil{(missionnamespace getvariable "StepDir")}) then {_sPp = (missionnamespace getvariable "StepDir");};
sliderSetPosition [1902, _sPp];

_post = [(getposATL player)] CALL RETURNGUARDPOST;
_preVO = "";
_ar = (_post getvariable "StaticO");
if (!isNil"_ar") then {
_c = count _ar;
_preVO = "";
if (_c > 0 && {_post distance player < 300}) then {
_c = _c - 1;
_preVO = (_ar select _c) select 0;
};
};
if (isNil{missionnamespace getvariable "Arrow"}) then {
if !(_preVO in ["Land_HBarrierWall4_F","Field Toilet","Chair Plastic","Land_CampingChair_V1_F","Land_Mil_WiredFence_F","Land_Mil_WallBig_4m_F","Land_Shoot_House_Wall_Long_F","Land_CncWall4_F","Land_HBarrierBig_F","Land_HBarrier_5_F","Land_HBarrier_3_F","Land_BagFence_Round_F","Land_BagFence_Long_F"]) then {ctrlEnable [1606, false];ctrlEnable [1605, false];} else {ctrlEnable [1606, true];ctrlEnable [1605, true];};
} else {
if (missionnamespace getvariable "Arrow" == -1) then {
ctrlEnable [1605, false];ctrlEnable [1606, true];
} else {
ctrlEnable [1605, true];ctrlEnable [1606, false];
};
};
if (_post distance (getposATL player) > 300) then {ctrlEnable [1606, false];ctrlEnable [1605, false];};
lbAdd [1501, "Fortress"];
if (_post distance (getposATL player) < 120) then {
lbAdd [1501, "Objects"];
lbAdd [1501, "Special"];
lbAdd [1501, "Furniture"];
lbAdd [1501, "AI Weapons"];
if ("ResHelp" in (missionnamespace getvariable "Progress")) then {
lbAdd [1501, "AI Guards"];
lbAdd [1501, "AI Vehicles"];
};
};
_c = 0; 
if (!isNil{(missionnamespace getvariable "LastCat")}) then {_c =(missionnamespace getvariable "LastCat");};
lbSetCurSel [1501, _c];
missionnamespace setvariable ["LastCat",_c];
(lbText [1501, (lbCurSel 1501)]) CALL SAOKCONSCATHEGORY;
_c = 0;
if (!isNil{ (missionnamespace getvariable "LastOb")}) then {_c =(missionnamespace getvariable "LastOb");};
lbSetCurSel [1500, _c];
missionnamespace setvariable ["LastOb",_c];
_curS = (lbText [1500, (lbCurSel 1500)]);
missionnamespace setvariable ["CurrentOb",_curS];
_textA = "Price: ";
_cost = ((lbText [1500, (lbCurSel 1500)]) CALL CONSCOST)*([] CALL SAOKCONSRATE);
_textA = _textA + (format ["%1",_cost]);
(_myDisplay displayCtrl 1100) ctrlSetStructuredText parseText _textA;
[] SPAWN SAOKCONSITEM;
};


