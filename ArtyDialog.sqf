ARTGROUPS = [];
ARTYDIALOG = {

private ["_pos","_as","_foreachindex","_mar","_ok","_myDisplay","_ctrl","_zones"];
if (dialog) exitWith {};
_pos = _this;
if (player distance _pos > 5000) then {_pos = [getposATL player,1200,600,"(1 - sea)"] CALL SAOKSEEKPOS;};
_mar = createMarker ["MARTYPOS",_pos];
_mar setMarkerShape "ICON";
_mar setMarkerType "mil_circle";
_mar setMarkerSize [0.8,0.8];
_mar setMarkerColor "ColorOrange";
_mar setMarkerText " ARTY";
disableserialization;
_ok = createDialog "ArtyDialog"; 
_myDisplay = findDisplay 1265;
_ctrl = _myDisplay displayCtrl 1500;
_zones = [];
{if ((_x getvariable "Mtype") in ["n_art","b_art","n_mortar","b_mortar"] && {(_x getvariable "Mtext") == ""}) then {_zones pushback _x;};} foreach VEHZONESA;
_ii = 0;
{
if (count ((_x CALL SAOKZONEDRNEW) select 0) > 0) then {
_as = (((_x CALL SAOKZONEDRNEW) select 0) select 0);
lbAdd [1500, (getText (configfile >> "CfgVehicles" >> _as >> "displayName"))];
_ctrl lbSetPicture [(_foreachindex-_ii),(getText (configfile >> "CfgVehicles" >> _as >> "picture"))];
lbSetData [1500, (_foreachindex-_ii), (_x getvariable "IDCODE")];
} else {_ii = _ii + 1;};
} foreach _zones;
waitUntil {sleep 0.5; !dialog};
deletemarker _mar;
};

SAOKARTYF1 = {
private ["_amCC","_foreachindex","_f","_myDisplay","_ctrl","_zone","_amm"];
disableserialization;
_myDisplay = findDisplay 1265;
_ctrl = _myDisplay displayCtrl 1501;
_zone = (lbData [1500, lbCurSel 1500]); 
if (isNil{missionnamespace getvariable _zone}) exitWith {};
_zone = missionnamespace getvariable _zone;
_amm = (((_zone CALL SAOKZONEDRNEW) select 0) select 1);
lbClear 1501;
{
lbAdd [1501, (getText (configfile >> "CfgMagazines" >> (_x select 0) >> "displayName"))];
_amCC = format ["%1 Rounds Left",(_x select 1)];
_ctrl lbSetTooltip [_foreachindex,_amCC];
_f = format ["_b = ['%1',%2]; _b",(_x select 0),(_x select 1)];
lbSetData [1501, _foreachIndex,_f];
} foreach _amm;
};

SAOKARTYF3 = {
private ["_dd","_d1","_am"];
_dd = compile (lbData [1501, lbCurSel 1501]);
_d1 = [] call _dd;
_am = _d1 select 1;
sliderSetRange [1901, 0, _am];
sliderSetPosition [1901, _am];
};

SAOKARTYF2 = {
private ["_zone","_dd","_d1","_mag","_am"];
if ((lbText [1501, (lbCurSel 1501)]) == "" || {sliderPosition 1901 == 0}) exitWith {};
_zone = (lbData [1500, lbCurSel 1500]);
if (isNil{missionnamespace getvariable _zone}) exitWith {};
_zone = missionnamespace getvariable _zone;
//hint str (lbData [1501, lbCurSel 1501]);
_dd = compile (lbData [1501, lbCurSel 1501]);
_d1 = [] call _dd;
_mag = _d1 select 0;
_am = floor (sliderPosition 1901);
if (typename _zone == "LOCATION" && {{typename _x == "STRING" && {_x != ""}} count [_mag] == 1} && {{typename _x == "SCALAR" && {_x > 0}} count [_am] == 1}) then {
[_zone,_mag,_am] SPAWN SAOKARTYFIRE;
};
};

SAOKARTYFIRE = {
private ["_arr","_foreachIndex","_pos2","_exp","_rounds","_deAT","_otdat","_ammoDD","_f","_d","_nnD","_ammo","_zone","_type","_pos"];
_zone = _this select 0;
_type = _this select 1;
_rounds = _this select 2;
_arr = [];
{if (_zone == _x select 0) exitWIth {_arr = _x select 1;};} foreach ARTGROUPS;
_pos = [getmarkerpos "MARTYPOS",30,0,"(1 - sea)"] CALL SAOKSEEKPOS;
["F","ARTY",""] SPAWN SAOKRADIOMES;
if (typename _arr != "ARRAY") then {
//SPAWNED
if ({alive _x} count units _arr > 0) then {
(leader _arr) doArtilleryFire [_pos, _type, _rounds];
};
} else {
_deAT = [];
_otdat = (_zone call SAOKZONEDRNEW) select 0;
_ammoDD = + (_otdat select 1);
if (typename _ammoDD == "ARRAY") then {
{
if (count _x > 1 && {(_x select 0) == _type} && {(_x select 1) == _rounds}) exitWith {
_ammoDD deleteAT _foreachIndex;
};
if (count _x > 1 && {(_x select 0) == _type} && {(_x select 1) > _rounds}) exitWith {
_ammoDD set [_foreachIndex,[_type,((_x select 1)-_rounds)]];
};
} foreach _ammoDD;
};
_f = (_otdat select 2);
_d = (_otdat select 3);
_nnD = [(_otdat select 0), _ammoDD, _f, _d];
_deAT pushback _nnD;
[_zone,_deAT] CALL SAOKZONED;
//VIRTUAL
_ammo = gettext (configfile >> "CfgMagazines" >> _type >> "ammo");
sleep (20 + random 20);
while {_rounds > 0} do {
_pos2 = [(_pos select 0) + 50 - (random 100),(_pos select 1) + 50 - (random 100), 30];
_exp = createVehicle [_ammo , _pos2, [], 0, "NONE"];  
_exp setpos _pos2;
_exp setVelocity [1, 20, 1];
_rounds = _rounds - 1;
sleep (1 + random 4);
};
};
};

