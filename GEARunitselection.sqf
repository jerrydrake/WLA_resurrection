//CUSTOM UNIT SELECTION FOR Gear
private ["_id","_unit","_ctrl","_ok","_myDisplay","_cc","_c"];
sleep (random 0.1);
if (dialog) exitWith {};
disableserialization;
"DOUBLECLICKING CAN BE USED" SPAWN SAOKBOXHINT;
_ok = createDialog "GEARDialog"; 
_myDisplay = findDisplay 1212;
_ctrl = _myDisplay displayCtrl 1500;
_c = 0;
_cc = 0;
{
if (alive _x && {vehicle _x == _x}) then {
if (VariSelectedUnit == _x) then {_cc = _c;};
_unit = _x;
//_id = _foreachindex;
lbAdd [1500, name _unit];
_xIcon = gettext (configfile >> "CfgVehicles" >> typeof _unit >> "icon");
_image = gettext (configfile >> "CfgVehicleIcons" >> _xIcon);
_ctrl lbSetPicture [_c,_image];
{
if (gettext (_x >> "displayName") == (rank _unit)) exitWith {
//_ctrl lbSetPicture [_c,gettext (_x >> "texture")];
_ctrl lbSetTooltip [_c,gettext (_x >> "displayName")];
};
} foreach ("isclass _x" configclasses (configfile >> "CfgRanks"));
_c = _c + 1;
if (VariSelectedUnit == _x) then {_cc = _c;};
};
} foreach units group player;
lbSetCurSel [1500, _cc];
{
lbAdd [1501, _x];
} foreach ["General","Commanding","ReloadSpeed","Courage","SpotTime","SpotDistance","Endurance","AimingSpeed","AimingShake","AimingAccuracy"];
lbSetCurSel [1501, 0];
while {dialog} do {
sleep 0.1;
{if (name _x == (lbText [1500, (lbCurSel 1500)])) exitwith {VariSelectedUnit = _x;};} foreach units group player;
};	