private ["_dialogC","_camera","_cam","_timeS"];
if (!isNil"GearCamGoing") exitWith {};
titlecut ["","black out",1];
NoDia = nil;
GearCamGoing = true;
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
_unit = VariSelectedUnit;
_unit disableAI "MOVE";
_unit setunitpos "UP";
_unit switchmove "";
_VP = getposATL VariSelectedUnit;
_dP = direction VariSelectedUnit;
_timeS = 2;
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
showcinemaBorder false;
_camera camPrepareTarget [_VP select 0,_VP select 1 - 0.3 + random 0.6, 1.2 + random 0.2];
_camera camPreparePos [(_VP select 0)+(sin _dP)*(3 + random 1),(_VP select 1)+(cos _dP)*(2 - random 4),0.2 + random 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
_camera camPrepareTarget [_VP select 0,_VP select 1 - 0.3 + random 0.6, 1.2 + random 0.2];
_camera camPreparePos [(_VP select 0)+(sin _dP)*(3 + random 1),(_VP select 1)+(cos _dP)*(2 - random 4),0.2 + random 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 14;
titlecut ["","black in",1];
_head = "";
//"GreenHelp" "USHelp" "ResHelp"
if ({_x in (missionnamespace getvariable "Progress")} count ["GreenHelp","USHelp","ResHelp"] == 0) then {
_head = parsetext ("<t size='2.1'>Conditions on "+(format ["%1 are unclear",worldname])+"</t><br />No response from Green Army, NATO is preparing a secret recon operation?");
};
if ({_x in (missionnamespace getvariable "Progress")} count ["ResHelp"] > 0) then {
_head = parsetext ("<t size='2.1'>Resistance Rising on "+(format ["%1?",worldname])+"</t><br />Locals are reporting uprising against CSAT");
};
if ({_x in (missionnamespace getvariable "Progress")} count ["GreenHelp"] > 0) then {
_head = parsetext ("<t size='2.1'>Green Dawn on "+(format ["%1",worldname])+"</t><br />Green Army movement reported first time in week");
};
if ({_x in (missionnamespace getvariable "Progress")} count ["USHelp"] > 0) then {
_head = parsetext ("<t size='2.1'>NATO have entered "+(format ["%1",worldname])+"</t><br />Its official, NATO is joining to beat CSAT out of the country");
};
_text = "";
_t = 0;
_c = count (missionnamespace getvariable "EventLog");
_nn = if (_c > 4) then {floor (random (_c-1))} else {0};
while {_t < 40 && {_c > 0}} do {
_textA = "";
{
if (_nn < _foreachindex) then {
_text = _text + _x + "|";_t = _t + 1;
} else {
_textA = _textA + _x + "|";_t = _t + 1;
};
if (_t >= 40) exitWith {};
} foreach (missionnamespace getvariable "EventLog");
_text = _text + _textA;
};
_text = parsetext _text;
_n = [_head,_text] SPAWN BIS_fnc_AAN;
sleep _timeS;
_timeS = 0;
while {[] CALL _dialogC} do {
if (_timeS < 2 || {_unit != VariSelectedUnit}) then {
_timeS = 12 + random 6;
if (_unit != VariSelectedUnit) then {
_unit enableAI "MOVE";
_unit setunitpos "AUTO";
_unit = VariSelectedUnit;
_unit disableAI "MOVE";
_unit setunitpos "UP";
_unit switchmove "";
_timeS = 1 + random 1;
};
_VP = getposATL VariSelectedUnit;
_dP = direction VariSelectedUnit;
_camera camPrepareTarget [_VP select 0,_VP select 1 - 0.5 + random 1, 1.2 + random 0.2];
_camera camPreparePos [(_VP select 0)+(sin _dP)*(3 + random 1),(_VP select 1)+(cos _dP)*(2 - random 4),0.2 + random 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared _timeS;
};
sleep 0.5;
_timeS = _timeS - 0.5;
};
titlecut ["","black out",1];
sleep 1;
(uinamespace getvariable "BIS_AAN") closedisplay 1;
//terminate _n;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
_unit enableAI "MOVE";
_unit setunitpos "AUTO";
titlecut ["","black in",1];
GearCamGoing = nil;