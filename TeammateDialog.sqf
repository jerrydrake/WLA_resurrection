private ["_text","_c","_St","_myDisplay","_ok"];
sleep (random 0.05);
if (!dialog) then {

[] SPAWN {
private ["_unit"];
while {dialog} do {
{
_unit = _x;
{
if (isNil{_unit getvariable (_x+"B")}) then {
_unit setvariable [(_x+"B"),_unit skill _x];
}; 
_unit setSkill [_x, _unit getvariable (_x+"B")];
} foreach ["AimingAccuracy","AimingShake","AimingSpeed","SpotDistance","SpotTime","Endurance","Courage","ReloadSpeed","Commanding","General"];
//SKILLEFFECTS
{
if (!isNil{_unit getvariable _x}) then {
[(_unit getvariable _x),_unit] CALL SKILLEFFECT;
};
} foreach ["Mental","Sickness","Relationship","TiRed"];


} foreach units group player - [player];
sleep 1;
};

};
disableserialization;
_ok = createDialog "TeammateDialog"; 
_myDisplay = findDisplay 1231;
{
lbAdd [1500, name _x];
} foreach units group player - [player];
lbSetCurSel [1500, 0];

sleep 0.1;
_St = 0;
_c = count (units (group player));
while {dialog && _c == count (units (group player))} do {
	SELunit = player;
	{if (name _x == (lbText [1500, (lbCurSel 1500)])) exitwith {SELunit = _x;};} foreach units group player;
	_text = "";
	{_text = _text + _x + (format [" %1", SELunit skill _x])+ "<br/>";} foreach ["AimingAccuracy","AimingShake","AimingSpeed","SpotDistance","SpotTime","Endurance","Courage","ReloadSpeed","Commanding","General"];
	(_myDisplay displayCtrl 1100) ctrlSetStructuredText parseText _text;
	_text = "Enemy Kills " + (format ["%1",(if (!isNil{SELunit getvariable "Kills"}) then {SELunit getvariable "Kills"} else {0})]) + "<br/>";
	_text = _text + "Civilian Kills " + (format ["%1",(if (!isNil{SELunit getvariable "CKills"}) then {SELunit getvariable "CKills"} else {0})]) + "<br/>";
	_text = _text + "Friendly Kills " + (format ["%1",(if (!isNil{SELunit getvariable "FKills"}) then {SELunit getvariable "FKills"} else {0})]) + "<br/>";
	(_myDisplay displayCtrl 1102) ctrlSetStructuredText parseText _text;
	_text = "";
	{
	if (!isNil{SELunit getvariable _x}) then {
	_text = _text + (SELunit getvariable _x) + "<br/>" + ([(SELunit getvariable _x)] CALL SKILLEFFECT) + "<br/>";
	};
	} foreach ["Mental","Sickness","Relationship","TiRed"];
	
	(_myDisplay displayCtrl 1101) ctrlSetStructuredText parseText _text;
	sleep 0.1;
};
if (dialog) then {closeDialog 0;};
SELunit=nil;
};







