private ["_ctrl","_ok","_myDisplay","_data","_n","_desP","_desT","_pos","_dis","_text","_Sti","_car","_hrs","_te","_mins","_st","_start","_p1","_p2","_p3","_p4","_p5","_p6","_p7","_p8","_hcGroups","_matka","_TiN","_TiA","_dat","_textH","_c","_t"];
sleep (random 0.05);
if (dialog) exitWith {};

disableserialization;
_ok = createDialog "FastTravelDialog"; 
_myDisplay = findDisplay 1233;
_ctrl = _myDisplay displayCtrl 1500;
_data = [];
_n = 1;
_textH = "";
// && {_x in VisitedCamps}if (DIFLEVEL < 0.5) then {
_p = SAOKMAPSIZE*0.5;
{
_xx = _x getvariable "Marker";
_a = "";
if ((DIFLEVEL < 0.5) || {_xx in VisitedCamps}) then {
_pos = getmarkerpos _xx;
_dis = (_pos distance player)*0.001;
_dis = [_dis,1] CALL BIS_fnc_cutDecimals;
_text = (format ["%1",_n])+". Camp near "+(_pos CALL NEARESTLOCATIONNAME)+(format [" %1km",_dis]);
if (_xx in UndAttackMs) then {_textH = _textH + "<t color='#900000'>" + _text + "</t>" + "<br/>";_a = "a";};
_data = _data + [[_pos,_text,_a]];
_n = _n + 1;
};
} foreach (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]);
_p = SAOKMAPSIZE * 0.5;
{
_a = "";
_pp = _x getvariable "Post";
_pos = getposATL _pp;
_dis = (_pos distance player)*0.001;
_dis = [_dis,1] CALL BIS_fnc_cutDecimals;
_text = (format ["%1",_n])+". Guardpost near "+(_pos CALL NEARESTLOCATIONNAME)+(format [" %1km",_dis]);
if (!isNil{_pp getvariable "ColorG"}) then {
switch (_pp getvariable "ColorG") do {
case "Blue": {_c = "<t color='#0066CC'>";_textH = _textH + _c + _text + "</t>"+ "<br/>";_a = "b";};
case "Red": {_c = "<t color='#900000'>";_textH = _textH + _c + _text + "</t>" + "<br/>";_a = "a";};
case "Yellow": {_c = "<t color='#CCFF66'>";_textH = _textH + _c + _text + "</t>" + "<br/>";_a = "y";};
};
};
_data append [[_pos,_text,_a]];
_n = _n + 1;
} foreach (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
missionnamespace setvariable ["FastData",_data];

if (_textH != "") then {
_t = ("SPECIAL DESTINATIONS"+ "<br/>"+ "<br/>"+_textH + "<br/>"+ "<t color='#900000'>UNDER ATTACK</t>"+ "<br/>"+ "<t color='#0066CC'>ASSIST NEARBY ATTACK</t>"+ "<br/>"+ "<t color='#CCFF66'>NEAREST TO TASK</t>"+ "<br/>");
[_t] SPAWN SAOKBOXHINT;
};


if (count _data > 0) then {
{
lbAdd [1500, _x select 1];
if (_x select 2 != "") then {
if (_x select 2 == "b") then {
_ctrl lbSetPicture [_foreachindex,"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"];
_ctrl lbSetTooltip [_foreachindex,"Planning for Assault on CSAT Camp"];
};
if (_x select 2 == "a") then {
_ctrl lbSetPicture [_foreachindex,"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"];
_ctrl lbSetTooltip [_foreachindex,"Under Attack by CSAT"];
};
if (_x select 2 == "y") then {
_ctrl lbSetPicture [_foreachindex,"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"];
_ctrl lbSetTooltip [_foreachindex,"Near to Task"];
};
} else {
_ctrl lbSetPicture [_foreachindex,(getText (configfile >> "CfgMarkers" >> "loc_Bunker" >> "icon"))];
};
} foreach _data;
//lbSetCurSel [1500, 0];


sleep 0.1;
_desP = getposATL player;
_desT = "";
while {dialog} do {
_desT = (lbText [1500,(lbCurSel 1500)]);
sleep 0.01;
};
if (_desT == "") exitWith {MATKUSTA=nil;};
if (!isNil"MATKUSTA") then {
titlecut ["","black out",2];
sleep 2;
{
if (_desT == _x select 1) exitWith {_desP = _x select 0;};
} foreach _data;
MATKUSTA=nil;
_matka = (player distance _desP)*0.001;
_Sti = _matka / (3 + random 3);
if (!isNil{missionnamespace getvariable "LastVeh"}) then {
_car = (missionnamespace getvariable "LastVeh");
if (alive _car) then {
_Sti = _matka / (20 + random 20);
};
};
_TiN = date;
skiptime _Sti;
_TiA = date;
_te = "Near "+(_desP CALL NEARESTLOCATIONNAME)+" ";
_mins = (_TiA select 4) - (_TiN select 4);
if (_mins < 0) then {_mins = _mins + 60;};
_hx = 0;
if (_mins > 59) then {_mins = _mins - 60;_hx = 1;};
if (_mins < 10) then {_mins = "0"+ str _mins;};
if (_TiN select 3 != _TiA select 3) then {
_hrs = (_TiA select 3) - (_TiN select 3);
if (_hrs < 0) then {_hrs = _hrs + 24;};
if ((_TiA select 4) <= (_TiN select 4)) then {_hrs = _hrs - 1;};
if (_hrs > 0) then {
_hrs = _hrs + _hx;
if (_hrs > 24) then {_hrs = _hrs - 24;};
if (_hrs < 10) then {_hrs = "0"+ str _hrs;};
_te = _te + (format ["%1",_hrs])+" Hour(s) and ";
};
};
_te = _te + (format ["%1",_mins])+" Minute(s) later.";
_dat = "Current Time "+(if (10 > Date select 3) then {format ["0%1",Date select 3]} else {format ["%1",Date select 3]}) + ":" + (if (10 > Date select 4) then {format ["0%1",Date select 4]} else {format ["%1",Date select 4]});
[
[_te,_dat]
] spawn BIS_fnc_typeText;
missionnamespace setvariable ["JustTeleported",1];
player setpos [(_desP select 0)+10-(random 20),(_desP select 1)+10-(random 20),0];
{
if (alive _x) then {
_x setpos [(_desP select 0)+10-(random 20),(_desP select 1)+10-(random 20),0];
_x SPAWN FClone;
};
sleep 0.1;
} foreach units group player - [player];


if (!isNil{missionnamespace getvariable "LastVeh"}) then {
_car = (missionnamespace getvariable "LastVeh");
if (alive _car && {!surfaceisWater getposATL _car}) then {
_start = [_desP,60,30,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
_max = 0;
while {[_start,typeof _car] CALL SAOKTAKENBOX && {_max < 7}} do {
_max = _max + 1;
sleep 1;
_start = [_desP,60,30,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
};
if (_max < 7) then {_car setpos _start;};
};
};

_hcGroups = [];
{
if ({!isNil{_x getvariable "FromP"}}count units _x > 0) then {
_hcGroups pushback _x;
};
} foreach hcAllGroups player;
{
_pos = _desP;
_pos = [(_pos select 0)+100-(random 200),(_pos select 1)+100-(random 200),0];
while {surfaceIsWater _pos} do {sleep 0.01;_pos = [(_pos select 0)+300-(random 600),(_pos select 1)+300-(random 600),0];};
{_x setpos [(_pos select 0)+10-(random 20),(_pos select 1)+10-(random 20),0];} foreach units _x;
} foreach _hcGroups;
sleep 5;
titlecut ["","black in",2];
sleep 20;
missionnamespace setvariable ["JustTeleported",nil];
};


};
