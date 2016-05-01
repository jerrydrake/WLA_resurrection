private ["_ok","_myDisplay","_nV","_nCb","_nA","_nC","_vP","_pP","_post"];
_wlacam = {
private ["_dialogC","_camera","_cam","_timeS"];
sleep 1;
_dialogC = {
private ["_bol"];
_bol = true;
if (dialog && {!isNil"NoDia"}) then {NoDia = nil;};
if (!dialog && {isNil"NoDia"}) then {NoDia = 1;};
if (!dialog && {!isNil"NoDia"}) then {
if (NoDia < 3) then {
NoDia = NoDia + 1;
} else {
_bol = false;
NoDia = nil;
};
};
_bol
};
_VariSelectedUnit = player;
_unit = _VariSelectedUnit;
//_unit disableAI "MOVE";
//_unit setunitpos "UP";
//_unit switchmove "";
_VP = getposATL _VariSelectedUnit;
_dP = direction _VariSelectedUnit;
_timeS = 2;
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back", "rendertarget4"];
showcinemaBorder false;
_camera camPrepareTarget [_VP select 0,_VP select 1 - 0.3 + random 0.6, 1.2 + random 0.2];
_camera camPreparePos [(_VP select 0)+(sin _dP)*(3 + random 1),(_VP select 1)+(cos _dP)*(2 - random 4),0.2 + random 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_camera camPrepareTarget [_VP select 0,_VP select 1 - 0.3 + random 0.6, 1.2 + random 0.2];
_camera camPreparePos [(_VP select 0)+(sin _dP)*(3 + random 1),(_VP select 1)+(cos _dP)*(2 - random 4),0.2 + random 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 14;
sleep _timeS;
_timeS = 0;
while {[] CALL _dialogC} do {
if (_timeS < 2 || {_unit != _VariSelectedUnit}) then {
_timeS = 12 + random 6;
if (_unit != _VariSelectedUnit) then {
_unit enableAI "MOVE";
_unit setunitpos "AUTO";
_unit = _VariSelectedUnit;
_unit disableAI "MOVE";
_unit setunitpos "UP";
_unit switchmove "";
_timeS = 1 + random 1;
};
_VP = getposATL _VariSelectedUnit;
_dP = direction _VariSelectedUnit;
_camera camPrepareTarget [_VP select 0,_VP select 1 - 0.5 + random 1, 1.2 + random 0.2];
_camera camPreparePos [(_VP select 0)+(sin _dP)*(3 + random 1),(_VP select 1)+(cos _dP)*(2 - random 4),0.2 + random 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared _timeS;
};
sleep 0.5;
_timeS = _timeS - 0.5;
};
sleep 1;
//terminate _n;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
titlecut ["","black in",1];
};

sleep (random 0.1);
if (dialog) exitWith {}; 
//WLAMenu
[["WLA","WLAMenu"]] call BIS_fnc_advHint;
disableserialization;
_ok = createDialog "WLADialog"; 
_myDisplay = findDisplay 32144;

_b = true;
if (isNil{HEALMODEVAR}) then {_b = false;};
(_myDisplay displayCtrl 2800) ctrlSetChecked _b;
_b = true;
if (isNil{REARMMODEVAR}) then {_b = false;};
(_myDisplay displayCtrl 2801) ctrlSetChecked _b;
//[] spawn _wlacam;
lbAdd [1501, "Hotkeys"];
lbAdd [1501, "Important Notes"];
lbAdd [1501, "Mod Info"];
lbAdd [1501, "Legend Forces"];
lbAdd [1501, "Legend Other"];
lbAdd [1501, "Event Log"];
//lbAdd [1501, "Team-mates"];
lbSetCurSel [1501, 0];
_nV = (player CALL SAOKNEARESTVIL);
_nCb = (locationposition (["ColorBlue"] CALL NEARESTCAMP));
_nA = ([] CALL NEARESTAIRFIELD);
_nC = ([] CALL NEARESTCAMP);
_vP = vehicle player;
_pP = getposATL player;
if (_pP CALL NEARESTLOCATIONNAME == "factory") then {ctrlSetText [1600,"Factory"];};
if !(((_vP distance (getmarkerpos _nA) < 200 && {getmarkercolor _nA == "ColorGreen"}) || {((_vP) distance (locationposition _nC) < 100 && {getmarkercolor (_nC getvariable "Marker") == "ColorBlue"})} || {({_vP distance (getmarkerpos _x) < 50 && {getmarkercolor _x == "ColorGreen"}} count PierMarkers > 0)})) then {
ctrlEnable [1601, false];
};
_post = ([_pP] CALL RETURNGUARDPOST);
if (_post distance _pP < 50 && {{!isNil{_post getvariable _x}} count ["BaseCamp","NATO","Green"] > 0}) then {ctrlEnable [1601, true];};
if !(((_vP) distance (locationposition _nV) < (size _nV select 0))) then {
ctrlEnable [1600, false];
};
if (_post distance _pP > 50 || {{!isNil{_post getvariable _x}} count ["NATO","Green"] == 0}) then {
if !(_vP distance _nCb < 100 || {count (nearestObjects [_pP, ["Land_TBox_F"], 20]) > 0}  || {{alive _x} count (_pP nearEntities [["B_Truck_01_ammo_F", "I_Truck_02_ammo_F", "O_Truck_02_Ammo_F"], 20]) > 0}) then {
ctrlEnable [1607, false];
};
};
if (DIFLEVEL < 0.5) then {ctrlEnable [1607, true];};
if (_vP != player) then {ctrlEnable [1607, false];};
if !((_vP distance _nCb < 100) || {DIFLEVEL < 1 && {(_post distance _vP < 30)} && {getmarkercolor (_post getvariable "Gmark") == "ColorGreen"}}) then {
ctrlEnable [1603, false];
};
if (DIFLEVEL < 0.5) then {ctrlEnable [1603, true];};



//SAOKWLATEXT in sharedfunc2.sqf