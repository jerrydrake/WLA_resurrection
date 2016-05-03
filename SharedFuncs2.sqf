//[getPosATL player, getposATL faa] SPAWN SAOKASTAR;
//[carrier, carried, endpos] SPAWN SAOKCARRY;

TeamCAMERA = {
private ["_n","_dialogC","_camera","_VariSelectedUnit","_render","_num","_a","_dir"];
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
_VariSelectedUnit = _this select 0;
_render = "rendertarget" + (_this select 1);
_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back", _render];
_render setPiPEffect [3, 1, 1,1,0,[0.1,0.2,0.3,-0.5],[1,1,1,0.4],[0.5,0.2,0,1]];
_num = SAOKPIPM;
if (_num > 2) then {_num = 7;};
_render setPiPEffect [_num];
//_render setPiPEffect [6, 1, 0.04,1,1,0,1,true];
//colorCorrections[] = {1,1,0,[0.1,0.2,0.3,-0.5],[1,1,1,0.4],[0.5,0.2,0,1]};
//filmGrain[] = {0.04,1,1,0,1};
showcinemaBorder false;
_a = [0,0,0];
//_hand = [];
if (SAOKPIPP select 0 == "Head") then {_a = [-0.3,0,0];};
_camera attachTo [_VariSelectedUnit, _a, SAOKPIPP select 0];
if (!isNil{_VariSelectedUnit getvariable "NAME"}) then {
	_dir = 180;
	if (typeof _VariSelectedUnit == "Land_LampHalogen_F") then {_dir = 270;};
	detach _camera;
	_camera setdir (direction _VariSelectedUnit + _dir);
	if (!isNil{_VariSelectedUnit getvariable "NAME"}) then {_n = [_camera,(direction _VariSelectedUnit + _dir)] SPAWN SAOKCAMDIRM;};
};
/*
_camera camsettarget _VariSelectedUnit;
_camera camsetrelpos [0, 0.2, 1.4];
_camera camPrepareFOV 0.700
_camera camCommit 1
@camCommitted _camera
*/

/*
_VP = getposATL _VariSelectedUnit;
_dP = direction _VariSelectedUnit;
_timeS = 2;
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
while {[] CALL _dialogC && {!isNil{_VariSelectedUnit getvariable ("CAMM" + _render)}}} do {
if (_timeS < 2) then {
_timeS = 12 + random 6;
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
!([] CALL _dialogC) ||
*/
waitUntil {sleep 0.1;isNil{_VariSelectedUnit getvariable "REN"}};
//{terminate _x;} foreach _hand;
detach _camera;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera;
};

SAOKCAMDIRM = {
private ["_cam","_c","_a","_b"];
_cam = _this select 0;
_c = _this select 1;
_a = 0;
_b = true;
while {!isNull _cam} do {
_cam setdir (_c + _a);
sleep 0.05;
if (_b) then {_a = _a + 0.5; if (_a > 35) then {_b = false;};} else {_a = _a - 0.5; if (_a < -35) then {_b = true;};};
};
//hint "bing";
};

SAOKNAME = {
private ["_n"];
_n = if (typeof _this iskindof "MAN") then {name _this} else {if (!isNil{_this getvariable "NAME"}) then {_this getvariable "NAME"} else {(getText (configfile >> "CfgVehicles" >> (typeof _this) >> "displayName"))}};
_n
};

SAOKTEAMCAMDIA = {
private ["_t","_ok","_myDisplay","_dis","_nam","_cc","_n","_naa","_ctrl","_c"];
_t = "POST OBJECTS WITH CAMS:" +"<br/>";
{
if (isclass(configfile >> "CfgVehicles" >> _x)) then {
_t = _t + (getText (configfile >> "CfgVehicles" >> _x >> "displayName"))+"<br/>";
};
} foreach ["Land_PortableLight_single_F","Land_LampHalogen_F"];
_t = _t + "<br/>" + "Also your last used vehicle have a cam";
_t = "<t color='#FF00CC'>" + _t + "</t>";
[_t] SPAWN SAOKBOXHINT;


disableserialization;
_ok = createDialog "TeamCamDialog"; 
_myDisplay = findDisplay 4455;
_ctrl = (_myDisplay displayCtrl 2800);
if (!isNil"SAPIPCAM") then {_ctrl ctrlSetChecked true;};
SAOKCAMDE = 1;
_t = 4;
lbAdd [1498, "Shoulder"];
lbSetData [1498, 0, "LeftShoulder"];
lbAdd [1498, "Helmet"];
lbSetData [1498, 1, "Head"];
lbAdd [1498, "Weapon"];
lbSetData [1498, 2, "Weapon"];
//lbAdd [1498, "Neck"];
//lbSetData [1498, 3, "Neck"];
//lbAdd [1498, "Pelvis"];
//lbSetData [1498, 4, "Pelvis"];
_c = [];
if (!isnil"LastVeh") then {_c pushback LastVeh;};
_cc = 1;
{
if ((getmarkercolor (_x getvariable "Gmark")) in ["ColorGreen"]) then {
{
if (typeof (_x select 0) in ["Land_PortableLight_single_F","Land_LampHalogen_F"]) then {
_dis = (_x select 0) distance player;
if (_dis > 300) then {
_dis = _dis*0.001;
_dis = [_dis,1] CALL BIS_fnc_cutDecimals;
_dis = (str _dis) + "km";
} else {
_dis = [_dis,0] CALL BIS_fnc_cutDecimals;
_dis = (str _dis) + "m";
};
//_nam = ("CAM"+str _cc+" "+_dis);
_nam = ("CAM"+str _cc);
_c pushback (_x select 0);(_x select 0) setvariable ["NAME",_nam];
_cc = _cc + 1;
};
} foreach (_x getvariable "ObjectsNow");
};
} foreach activatedPost;
lbSetCurSel [1498, SAOKPIPP select 1];
lbAdd [1499, "Normal"];
lbAdd [1499, "Night Vision"];
lbAdd [1499, "Thermal"];
lbAdd [1499, "Thermal Invert"];
lbSetCurSel [1499, SAOKPIPM];
_n = "";
if (!isNil"SAPIPCAM" && {typename SAPIPCAM != "STRING"} && {!isNull SAPIPCAM} && {alive SAPIPCAM} && {SAPIPCAM in (units group player + _c)}) then {lbAdd [1500, SAPIPCAM CALL SAOKNAME];_n = SAPIPCAM CALL SAOKNAME;};
{
_naa = _x CALL SAOKNAME;
if (_n != _naa && {_naa != ""}) then {lbAdd [1500, _naa];};
if (_naa != "") then {
lbAdd [1501, _naa];
lbAdd [1502, _naa];
lbAdd [1503, _naa];
};
if (_t < 8) then {lbSetCurSel [(1496+_t), _t - 4];} else {lbSetCurSel [(1496+_t), 0];};
_t = _t + 1;
} foreach units group player + _c;
if (_t < 6) then {lbSetCurSel [1501, 0];};
if (_t < 7) then {lbSetCurSel [1502, 0];};
if (_t < 8) then {lbSetCurSel [1503, 0];};
sleep 1;
SAOKCAMDE = nil;
[(lbText [1500,(lbCurSel 1500)]),"4",1] SPAWN SAOTEAMCAM;
waitUntil {sleep 0.1; !dialog};
{_x setvariable ["REN",nil];} foreach units group player + _c;
sleep 0.5;
if (!isNil"SAPIPCAM") then {
[] SPAWN SAOKSIDECAM;
};
};

SAOKSIDECAM = {
private ["_camera","_pic","_num","_a","_dir","_n","_hand"];
//special thanks to killzone of sample code
_camera = "camera" camCreate [0,0,0];
_camera cameraEffect ["internal","back","rendertarget8"];
"rendertarget8" setPiPEffect [3, 1, 1,1,0,[0.1,0.2,0.3,-0.5],[1,1,1,0.4],[0.5,0.2,0,1]];
_num = SAOKPIPM;
if (_num > 2) then {_num = 7;};
"rendertarget8" setPiPEffect [_num];
showcinemaBorder false;
_a = [0,0,0];
if (SAOKPIPP select 0 == "Head") then {_a = [-0.3,0,0];};
	_camera attachTo [SAPIPCAM, _a, SAOKPIPP select 0];
	if (!isNil{SAPIPCAM getvariable "NAME"}) then {
	_dir = 180;
	if (typeof SAPIPCAM == "Land_LampHalogen_F") then {_dir = 270;};
	detach _camera;
	_camera setdir (direction SAPIPCAM + _dir);
	if (!isNil{SAPIPCAM getvariable "NAME"}) then {_n = [_camera,(direction SAPIPCAM + _dir)] SPAWN SAOKCAMDIRM;_hand = [_n];};
	};
	with uiNamespace do {
	disableserialization;
     _pic = findDisplay 46 ctrlCreate ["RscPicture", -1];
     _pic ctrlSetPosition [(safeZoneX + safeZoneW) - safeZoneW*0.19,0,safeZoneW*0.19,safeZoneW*0.19];
     _pic ctrlCommit 0;
     _pic ctrlSetText "#(argb,512,512,1)r2t(rendertarget8,1.0)";
	 waitUntil {sleep 0.1;isNil"SAPIPCAM" || {!alive SAPIPCAM}};
	 ctrlDelete _pic;
	};
waitUntil {sleep 0.1;isNil"SAPIPCAM" || {!alive SAPIPCAM}};
if (!isNil"SAPIPCAM" && {!alive SAPIPCAM}) then {SAPIPCAM = nil;};
detach _camera;
_camera cameraeffect ["terminate", "back"];
camdestroy _camera; 
};

SAOTEAMCAM = {
private ["_unit","_cc","_name","_a","_myDisplay","_ctrl","_c"];
if (!isNil"SAOKCAMDE") exitWith {};
_unit = "";
disableserialization;
_c = [];
if (!isnil"LastVeh") then {_c pushback LastVeh;};
_cc = 1;
{if (getmarkercolor (_x getvariable "Gmark") == "ColorGreen") then {{if (typeof (_x select 0) in ["Land_PortableLight_single_F","Land_LampHalogen_F"]) then {_c pushback (_x select 0);(_x select 0) setvariable ["NAME","CAM"+str _cc];_cc = _cc + 1;};} foreach (_x getvariable "ObjectsNow")};} foreach activatedPost;
{if (_x CALL SAOKNAME == _this select 0) exitWith {_unit = _x;};} foreach units group player + _c;
if (typename _unit != "STRING" && {(isNil{_unit getvariable "REN"} || {_unit getvariable "REN" != (_this select 1)}) || {count _this > 2}}) then {
{_x setvariable ["REN",nil];} foreach units group player + _c;
_unit setvariable ["REN",(_this select 1)];
_a = ["4","5","6","7"];
_a = _a - [(_this select 1)];
SAPIPCAM = nil;
sleep 0.5;
[_unit,(_this select 1)] SPAWN TeamCAMERA;
_name = "";
_unit = "";
_name = (lbText [1500,(lbCurSel 1500)]);
{if (_x CALL SAOKNAME == _name) exitWith {_unit = _x;};} foreach units group player + _c;
_myDisplay = findDisplay 4455;
_ctrl = (_myDisplay displayCtrl 2800);
if (typename _unit != "STRING" && {ctrlChecked _ctrl}) then {
SAPIPCAM = _unit;
_unit SPAWN SAOKSIDECAM;
};
{
_name = "";
_unit = "";
if (_x == "4") then {_name = (lbText [1500,(lbCurSel 1500)]);};
if (_x == "5") then {_name = (lbText [1501,(lbCurSel 1501)]);};
if (_x == "6") then {_name = (lbText [1502,(lbCurSel 1502)]);};
if (_x == "7") then {_name = (lbText [1503,(lbCurSel 1503)]);};
{if (_x CALL SAOKNAME == _name) exitWith {_unit = _x;};} foreach units group player + _c;
if (typename _unit != "STRING") then {
_unit setvariable ["REN",_x];
[_unit,_x] SPAWN TeamCAMERA;
};
} foreach _a;
};
};

SAOKCARRY = {

private ["_n","_pRcamp","_wp","_carrier","_carried","_endpos"];
_carrier = _this select 0;
_carried = _this select 1;
_endpos = _this select 2;
if (!isNil{_carried getvariable "WAITCAR"}) exitWith {};
_carried setvariable ["NOMOVE",1];
_carried setvariable ["WAITCAR",1];
CARRYZONES = CARRYZONES - [_carrier];
[_carrier,"Heading to Carry"] SPAWN SAOKADDVEHZCON;
_n = [_carrier,locationposition _carried] CALL SAOKZONEM;
waitUntil {sleep 2; {!isNil{_x getvariable "ACTIVE"}} count [_carrier,_carried] > 0 || {{!isNil{_x getvariable "IDCODE"}} count [_carrier,_carried] != 2}  || {{_x getvariable "Mcolor" == "ColorGrey"} count [_carrier,_carried] > 0} || {count (_carrier CALL SAOKZONEMW) == 0} || {((_carrier CALL SAOKZONEMW) select 0) distance locationposition _carried > 50}};
if ({!isNil{_x getvariable "ACTIVE"}} count [_carrier,_carried] == 0 && {{!isNil{_x getvariable "IDCODE"}} count [_carrier,_carried] == 2} && {{_x getvariable "Mcolor" == "ColorGrey"} count [_carrier,_carried] == 0} && {locationposition _carrier distance locationposition _carried < 50}) then {
_n = [_carrier,_endpos] CALL SAOKZONEM;
[_carrier,"Carrying Team"] SPAWN SAOKADDVEHZCON;
[_carried,""] SPAWN SAOKADDVEHZCON;
while {{!isNil{_x getvariable "ACTIVE"}} count [_carrier,_carried] == 0} do {
_carried setposition (locationposition _carrier);
if !({!isNil{_x getvariable "ACTIVE"}} count [_carrier,_carried] == 0 && {{!isNil{_x getvariable "IDCODE"}} count [_carrier,_carried] == 2} && {{_x getvariable "Mcolor" == "ColorGrey"} count [_carrier,_carried] == 0} && {locationposition _carrier distance _endpos > 50}) exitWith {};
sleep 0.1;
};
if (surfaceiswater locationposition _carried) then {_carried CALL SAOKZONED;_carried CALL SAOKZONEG;_n = _carried CALL SAOKZONEM;VEHZONES = VEHZONES - [_carried];VEHZONESA = VEHZONESA - [_carried];_carried setvariable ["Mcolor","ColorGrey"];_carried SPAWN {sleep 30;missionnamespace setvariable [(_this getvariable "IDCODE"),nil];_this call resFexit;deleteLocation _this;};};
};
_carrier CALL SAOKVZMOVESTOP;
if (!isNil{_carrier getvariable "IDCODE"}) then {
_pRcamp = locationposition (["ColorRed",locationposition _carrier] CALL NEARESTCAMP);
_wp = [_pRcamp,250,150,"(1 - sea)"] CALL SAOKSEEKPOS;
[_carrier, _wp] SPAWN ZoneMove;
};

if ({!isNil{_x getvariable "IDCODE"}} count [_carrier] == 1 && {{_x getvariable "Mcolor" == "ColorGrey"} count [_carrier] == 0}) then {CARRYZONES pushback _carrier;};
_carried setvariable ["NOMOVE",nil];
_carried setvariable ["WAITCAR",nil];
};

SAOKNEARVILP = {
private ["_nCity","_a"];
_a = [0,0,0];
{
_nCity = nearestLocation [_this select 0, _x];
if (locationposition _nCity distance (_this select 0) < locationposition _nCity distance _a) then {_a = locationposition _nCity;};
} foreach ["NameCity","NameVillage","NameCityCapital","NameLocal"];
_a
};

SAOKVZCOL = {
private ["_n"];
_n = "";
switch (toLower _this) do {
case "colorred": {_n = [0.8,0,0,1];};
case "colorblue": {_n = [0.2,0.2,1,1];};
case "colorgreen": {_n = [0,1,0.4,1];};
};
_n
};

SAOKDELETE = {
_this disableAI "ANIM";
_this disableAI "FSM";
_this enablesimulation false;
sleep 1;
deletevehicle _this;
};

SAOKASTAR = {
private ["_wsur2","_wsur","_z","_inde","_nn","_sRe","_cro","_size","_nyP","_a","_s","_alku","_loppu","_ak","_lk","_nykN","_in","_foreachIndex","_G","_H","_nelio","_in2","_u","_cor","_con","_ms","_reitti","_naa","_viimisin","_reDatName","_cR","_reittiU","_korj","_wp","_ss","_gg"];
_alku = _this select 0;
_loppu = _this select 1;
_z = _this select 2;
_reDatName = _this select 3;
_size = if (count _this > 4) then {_this select 4} else {500};
_cro = (_size^2+_size^2)^0.5;
_sRe = 1 /_size;
_ak = [(floor ((_alku select 0) * _sRe))*_size,(floor ((_alku select 1)* _sRe))*_size];
_lk = [(floor ((_loppu select 0)* _sRe))*_size,(floor ((_loppu select 1)* _sRe))*_size];
//_reDatName = format ["AA%1N%2N%3N%4N%5",(_z getvariable "IDCODE"),_ak select 0,_ak select 1,_lk select 0,_lk select 1];
_wsur = {private ["_bol"];_bol = if (surfaceisWater _this) then {true} else {false};_bol};
_wsur2 = {private ["_bol"];_bol = if (_this CALL SAOKWATERBETWEEN) then {true} else {false};_bol};
if (["naval", (_z getvariable "Mtype")] call SAOKINSTRING) then {
_wsur = {private ["_bol"];_bol = if (surfaceisWater _this) then {false} else {true};_bol};
_wsur2 = {private ["_bol"];_bol = if (_this CALL SAOKLANDBETWEEN) then {true} else {false};_bol};
};
_ms = [];
//nelio data - pos, F,G,H,viime nelio koordi
_H = (abs ((_ak select 0) - (_lk select 0)))+(abs ((_ak select 1) - (_lk select 1)));
_a = [[_ak,_H,0,_H,_ak]];
_s = [];
_nykN = [_ak,_H,0,_H,_ak];
_in = 0;
_ss = 0;
while {count _a > 0 && {str (_nykN select 0) != str _lk} && {_ss < 150}} do {
_nykN = [[0,0],10000000];
{
if (_x select 1 < _nykN select 1) then {_nykN = _x;_in = _foreachIndex;};
} foreach _a;
_a deleteAt _in;
_s pushback _nykN;
_ss = _ss + 1;
//naapurineliot
_nyP = _nykN select 0;
{
_u = [(_nyP select 0) + (_x select 0),(_nyP select 1) + (_x select 1)];

if ({str _u == str (_x select 0)} count _s > 0 || {_u call _wsur && {str _u != str _lk}}) then {} else {
if ({str _u == str (_x select 0)} count _a == 0) then {
//NUMM=NUMM+1;_n = format ["M%1",NUMM];_m = [_n,_u, "c_unknown", [0.9,0.9], "ColorPink", (str _foreachindex)] CALL FUNKTIO_CREATEMARKER;_ms pushback _n;
_nn = _size;
if ({_x == 0} count _x == 0) then {_nn = _cro;};
_G = (_nykN select 2)+_nn;
_H = (abs ((_u select 0) - (_lk select 0)))+(abs ((_u select 1) - (_lk select 1)));
_a pushback [_u,(_G+_H),_G,_H,_nyP];
} else {
_in2 = 0;
_nelio = [];
{if (str _u == str (_x select 0)) exitWith {_nelio = _x; _in2 = _foreachindex;};} foreach _a;
_nn = _size;
if ({_x == 0} count _x == 0) then {_nn = _cro;};
_G = (_nykN select 2) + _nn;
if ((_nelio select 1) > (_G + (_nelio select 3))) then {
_nelio = [(_nelio select 0),(_G + (_nelio select 3)),_G,(_nelio select 3),_nyP];
_a set [_in2,_nelio];
};
};
};
} foreach [[-_size,0],[-_size,_size],[0,_size],[_size,_size],[_size,0],[_size,-_size],[0,-_size],[-_size,-_size]];
};
if !(_ss < 150) exitWith {missionnamespace setvariable [_reDatName,[]];};
_reitti = [];
_cor = (_nykN select 0);
_con = (_nykN select 4);
if (count _a > 0) then {
//hint "reitti loyty";
while {str _cor != str _ak} do {
_reitti pushback _cor;
{if (str _con == str (_x select 0)) exitwith {_cor = _x select 0;_con = (_x select 4);};} foreach _s;
};
} else {
//hint "ei reittia";
};
{deletemarker _x;} foreach _ms;
reverse _reitti;
_cR = count _reitti - 1;
_reittiU = [];
_inde = 0;
_h = 0;
_gg = [[0]];
while {_inde < _cR} do {
if (_size != 50 && {_inde < _cR} && {[(_reitti select _inde),(_reitti select (_inde + 1))] CALL _wsur2}) then {
_naa = format ["AA%1N%2N%3N%4N%5",(_z getvariable "IDCODE"),(_reitti select _inde) select 0,(_reitti select _inde) select 1,(_reitti select (_inde + 1)) select 0,(_reitti select (_inde + 1)) select 1];
_nn = [(_reitti select _inde), (_reitti select (_inde + 1)),_z,_naa,50] SPAWN SAOKASTAR;
waitUntil {sleep 0.1; scriptdone _nn};
_gg = if (!isNil{(missionnamespace getvariable _naa)}) then {(missionnamespace getvariable _naa)} else {[]};
_reittiU append _gg;
missionnamespace setvariable [_naa,nil];
//hint str _gg;
} else {
_reittiU pushback (_reitti select _inde);
};
_inde = _inde + 1;
};
if (count _gg == 0) exitWith {missionnamespace setvariable [_reDatName,[]];};
//poista turhat 
_korj = [];
_wp = [];
if (count _reittiU > 0) then {
_wp = _reittiU select (count _reittiU - 1);
_viimisin = _reittiU select 0;
{
if (_foreachIndex > 0) then {
if ([_viimisin,(_reittiU select _foreachIndex),25] CALL _wsur2) then {
_korj pushback (_reittiU select (_foreachIndex - 1));
_viimisin = _korj select ((count _korj) - 1);
if !([_viimisin,_wp,25] CALL _wsur2) exitWith {_korj pushback _wp;};
if ([_viimisin,(_reittiU select _foreachIndex + 1),25] CALL _wsur2) then {
_korj pushback (_reittiU select _foreachIndex);
_viimisin = _korj select ((count _korj) - 1);
};
};
};
if !([_viimisin,_wp,25] CALL _wsur2) exitWith {_korj pushback _wp;};
} foreach _reittiU;
} else {_korj pushback _loppu;};
missionnamespace setvariable [_reDatName,_korj];
if (true) exitWith {};
};

//[getPosATL player, getposATL faa] SPAWN SAOKASTARM;
SAOKASTARM = { 
private ["_rei","_ms","_alku","_loppu","_ak","_lk","_naa","_ne"];
_rei = [];
_ms = [];
if (!isNil{(_this select 0) getvariable "NOMOVE"}) exitWith {};
_alku = locationposition (_this select 0);
WAITSTOMOVE pushback ((_this select 0) getvariable "IDCODE");
_loppu = _this select 1;
_ak = [(floor ((_alku select 0) * 0.002))*500,(floor ((_alku select 1)* 0.002))*500];
_lk = [(floor ((_loppu select 0)* 0.002))*500,(floor ((_loppu select 1)* 0.002))*500];
_naa = format ["AA%1N%2N%3N%4N%5",(_this select 0) getvariable "IDCODE",_ak select 0,_ak select 1,_lk select 0,_lk select 1];
_ne = [_alku,_loppu,(_this select 0),_naa] SPAWN SAOKASTAR;
waitUntil {sleep 0.1; scriptdone _ne};
WAITSTOMOVE = WAITSTOMOVE - [((_this select 0) getvariable "IDCODE")];
if (count (missionnamespace getvariable _naa) > 0) then {
_rei append (missionnamespace getvariable _naa);
_rei pushback _loppu;
{[(_this select 0), _x] SPAWN ZoneMove;sleep 0.5;} foreach _rei;
};
missionnamespace setvariable [_naa,nil];
};
PATHFBL = [];
SAOKTRYFINDROUTE2 = {
private ["_ss","_start","_wp","_dir","_dis","_j","_b","_f","_jj","_w","_d","_al","_ww","_wps","_viimisin","_foreachindex","_l","_wdots"];
_l = {
private ["_c","_a","_r","_p"];
_c = _this select 0;
_a = _this select 1;
_r = _this select 2;
_p = [(_c select 0) + (sin _a)*_r,(_c select 1) + (cos _a)*_r,0];
_p
};
_wdots = {
private ["_d","_dir","_j","_f","_l"];
_l = {
private ["_c","_a","_r","_p"];
_c = _this select 0;
_a = _this select 1;
_r = _this select 2;
_p = [(_c select 0) + (sin _a)*_r,(_c select 1) + (cos _a)*_r,0];
_p
};
_d = 0;
_dir = 0;
_j = 75;
while {_dir < 360} do {
_f = [_this,_dir,_j] call _l;
if (surfaceiswater _f) then {_d = _d + 1;};
_dir = _dir + 20;
};
_d
};
_start = _this select 0;
_wp = _this select 1;
_dis = _start distance _wp;
_dir = ([_start, _wp] call SAOKDIRT);
_wps = [];
if ([_start,_wp] CALL SAOKWATERBETWEEN) then {
PATHFBL pushback _start;
_j = 0;
_b = [];
while {_j+75 < _dis && {(count _b == 0 || {[(_b select (count _b - 1)),_wp] CALL SAOKWATERBETWEEN})}} do {
_f = [_start,_dir,_j] call _l;
_jj = 0;
_w = [_f,(_dir - 90),_jj] call _l;
while {(surfaceiswater _w) && {_jj < _dis*5}} do {_jj = _jj + 75;_w = [_f,(_dir - 90),_jj] call _l;};
_ss = 0;
if (_jj < _dis*5) then {
if (count _b > 0 && {[(_b select (count _b - 1)),_w] CALL SAOKWATERBETWEEN}) then {
_ww = ([(_b select (count _b - 1)),_w] CALL SAOKTRYFINDROUTE2);
if (count _ww > 1 || {!([(_ww select (count _ww - 1)),_wp] CALL SAOKWATERBETWEEN)}) then {
//_ww deleteat 0;
_b = _b + _ww;
PATHFBL = PATHFBL + _ww;
_ss = 1;
};
} else {
if ([_start,_w] CALL SAOKWATERBETWEEN) then {
_ww = [_start,_w] CALL SAOKTRYFINDROUTE2;
if (count _ww > 1 || {!([(_ww select (count _ww - 1)),_wp] CALL SAOKWATERBETWEEN)}) then {
//_ww deleteat 0;
_b = _b + _ww;
PATHFBL = PATHFBL + _ww;
_ss = 1;
};
} else {
_b pushback _w;
PATHFBL pushback _w;
};
};
};
if (_ss == 1) exitWith {};
if !(_jj < _dis*5 || {(count _b > 0 && {{(_b select (count _b - 1)) distance _x < 100} count PATHFBL > 10})}) exitWith {_b = [];};
_j = _j + 75;
};
_j = 0;
_d = [];
if (count _b == 0 || {[(_b select (count _b - 1)),_wp] CALL SAOKWATERBETWEEN}) then {
while {_j+75 < _dis && {(count _d == 0 ||{[(_d select (count _d - 1)),_wp] CALL SAOKWATERBETWEEN})}} do {
_f = [_start,_dir,_j] call _l;
_jj = 0;
_w = [_f,(_dir + 90),_jj] call _l;
while {(surfaceiswater _w) && {_jj < _dis*5}} do {_jj = _jj + 75;_w = [_f,(_dir + 90),_jj] call _l;};
_ss = 0;
if (_jj < _dis*5) then {
if (count _d > 0 && {[(_d select (count _d - 1)),_w] CALL SAOKWATERBETWEEN}) then {
_ww = [(_d select (count _d - 1)),_w] CALL SAOKTRYFINDROUTE2;
if (count _ww > 1 || {!([(_ww select (count _ww - 1)),_wp] CALL SAOKWATERBETWEEN)}) then {
//_ww deleteat 0;
_d = _d + _ww;
PATHFBL = PATHFBL + _ww;
_ss = 1;
};
} else {
if ([_start,_w] CALL SAOKWATERBETWEEN) then {
_ww = [_start,_w] CALL SAOKTRYFINDROUTE2;
if (count _ww > 1 || {!([(_ww select (count _ww - 1)),_wp] CALL SAOKWATERBETWEEN)}) then {
//_ww deleteat 0;
_d = _d + _ww;
PATHFBL = PATHFBL + _ww;
_ss = 1;
};
} else {
_d pushback _w;
PATHFBL pushback _w;
};
};
};
if (_ss == 1) exitWith {};
if !(_jj < _dis*5 || {(count _d > 0 && {{(_d select (count _d - 1)) distance _x < 100} count PATHFBL > 10})}) exitWith {_d = [];};
_j = _j + 75;
};
};

if ((count _d > 0 && {!([(_d select (count _d - 1)),_wp] CALL SAOKWATERBETWEEN)}) || {(count _b > 0 && {!([(_b select (count _b - 1)),_wp] CALL SAOKWATERBETWEEN)})}) then {
if (count _d > 0 && {!([(_d select (count _d - 1)),_wp] CALL SAOKWATERBETWEEN)}) then {_b = _d;};
//while {count _b > 0 && {!([(_b select (count _b - 1)),_wp] CALL SAOKWATERBETWEEN)}} do {_b deleteat (count _b - 1);};
_wps = _wps + _b;
} else {
if (count _d > 0 || {count _b > 0}) then {
if (count _b == 0) then {_b = _d;} else {
//_ww2 = ([(_b select (count _b - 1)),_wp] CALL SAOKTRYFINDROUTE2);
//&& {((_b select (count _b - 1)) distance _wp > (_d select (count _d - 1)) distance _wp)}
if (count _d > 0 && {(_b select (count _b - 1)) call _wdots > (_d select (count _d - 1)) call _wdots}) then {
//_ww = ([(_d select (count _d - 1)),_wp] CALL SAOKTRYFINDROUTE2);
_b = _d;
};
};
if (count _b > 0) then {
_al = _b select (count _b - 1);
_ww = ([_al,_wp] CALL SAOKTRYFINDROUTE2);
if (count _ww > 1 || {!([(_ww select (count _ww - 1)),_wp] CALL SAOKWATERBETWEEN)}) then {
//_ww deleteat 0;
_b = _b + _ww;
};
};
};
};
} else {_b = [];};

if (count _b > 0 && {count _wps == 0}) then {
_viimisin = _start;
{
if ([_viimisin,(_b select _foreachIndex),25] CALL SAOKWATERBETWEEN) then {
_wps pushback (_b select (_foreachIndex - 1));
_viimisin = _wps select ((count _wps) - 1);
if !([_viimisin,_wp,25] CALL SAOKWATERBETWEEN) exitWith {};
if ([_viimisin,(_b select _foreachIndex + 1),25] CALL SAOKWATERBETWEEN) then {
_wps pushback (_b select _foreachIndex);
_viimisin = _wps select ((count _wps) - 1);
};
};
if !([_viimisin,_wp,25] CALL SAOKWATERBETWEEN) exitWith {};
} foreach _b;
};
_wps pushback _wp;
//{NUMM=NUMM+1;_n = format ["M%1",NUMM];_m = [_n,_x, "c_unknown", [0.8,0.8], "ColorBlack", (str _foreachindex)] CALL FUNKTIO_CREATEMARKER;} foreach _wps;
_wps
};

//[getPosATL player, getposATL faa] SPAWN SAOKFWP;
SAOKFWP = {
private ["_allway","_ms","_m","_end","_b","_viimisin","_n","_foreachindex","_h"];
_allway = [_this select 0];
_end = _this select 1;
_b = _this CALL SAOKTRYFINDROUTE2;
_ms = [];
{NUMM=NUMM+1;_n = format ["M%1",NUMM];_m = [_n,_x, "c_unknown", [0.9,0.9], "ColorOrange", (str _foreachindex)] CALL FUNKTIO_CREATEMARKER; _ms pushback _m;} foreach _b;
if (count _b > 0) then {_b deleteat (count _b - 1);};
//hint format ["AMSA %1",_b];
_h = 0;
_viimisin = _allway select ((count _allway) - 1);
{
if ([_viimisin,(_b select _foreachIndex),25] CALL SAOKWATERBETWEEN) then {
_allway pushback (_b select (_foreachIndex - 1));
_viimisin = _allway select ((count _allway) - 1);
if !([_viimisin,_end,25] CALL SAOKWATERBETWEEN) exitWith {};
if ([_viimisin,(_b select _foreachIndex + 1),25] CALL SAOKWATERBETWEEN) then {
_allway pushback (_b select _foreachIndex);
_viimisin = _allway select ((count _allway) - 1);
};
};
if !([_viimisin,_end,25] CALL SAOKWATERBETWEEN) exitWith {};
} foreach _b;
_allway pushback _end;
PATHFBL = [];
//hint "bum";
{NUMM=NUMM+1;_n = format ["M%1",NUMM];_m = [_n,_x, "c_unknown", [1,1], "ColorBlue", (str _foreachindex)] CALL FUNKTIO_CREATEMARKER;_ms pushback _m;sleep 0.1;} foreach _allway;
{if (_foreachIndex < count _allway && {[_x,_allway select (_foreachIndex+1),25] CALL SAOKWATERBETWEEN}) then {hint "vetta";};} foreach _allway;
sleep 10;
{deletemarker _x;} foreach _ms;
};


SAOKCALLGELP = {
private ["_hPos","_c","_wp","_dt","_h","_nearbyVZs"];
_hPos = locationposition (_this select 0);
if (surfaceiswater _hPos || {((_this select 0) getvariable "Mcolor") in ["ColorGrey","colorGrey"]}) exitwith {};
_h = [];
_c = ["ColorRed"];
if (((_this select 0) getvariable "Mcolor") != "ColorRed") then {_c = ["ColorBlue","ColorGreen"];};
_nearbyVZs = nearestLocations [_hPos,["Name"], 3500];
{if ((_this select 0) != _x && {_hPos distance (_this select 1) < (_this select 1) distance (locationposition _x)} && {!((_x getvariable "Mtype") in ["o_unknown","o_naval","b_naval","n_naval","n_support","n_med","n_mortar","n_art","o_support","o_med","o_mortar","o_art","b_support","b_med","b_mortar","b_art"])} && {locationposition _x distance _hPos > 1000} && {locationposition _x distance _hPos < 3500} && {(_x getvariable "Mcolor") in _c} && {!(_x CALL SAOKVZMOVING)}) then {_h pushback _x;};if (count _h > 3) exitWith {};sleep 0.01;} foreach _nearbyVZs;
{
_wp = [_hPos,500,0,"(1 - sea)"] CALL SAOKSEEKPOS; 
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
if ((_x getvariable "Mcolor") != "ColorRed") then {_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];};
[_x,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
[_x,"Heading to Assist"] SPAWN SAOKADDVEHZCON;
sleep 1;
} foreach _h;
};

SAOKADDVEHZCON = {

private ["_foreachindex","_h","_d","_t"];
if (typename (_this select 0) != "LOCATION") exitWith {};
{if (((_this select 0) getvariable "IDCODE") == _x select 0) exitWith {ZONECONTEXT deleteat _foreachindex;};} foreach ZONECONTEXT;
_d = + _this;
_d set [0,(_d select 0) getvariable "IDCODE"];
_t = (_this select 0) getvariable "Mtext";
_t = toarray _t;
_h = " ";
{_h = _h + " ";} foreach _t;
_d set [1,(_h + (_d select 1))];
_d set [2,(time+120)];
ZONECONTEXT pushback _d;
(_this select 0) setvariable ["MLINED2",nil];
};

SAOKRETVEHAMM = {
private ["_amD","_c","_mags"];
_amD = [];
_mags = getArray (configfile >> "CfgVehicles" >> _this >> "Turrets" >> "MainTurret" >> "magazines");
if (count _mags == 0) then {_mags = getarray (configfile >> "CfgVehicles" >> _this >> "magazines");};
{
_c = getNumber (configfile >> "CfgMagazines" >> _x >> "count");
_amD pushback [_x,_c];
} foreach _mags;
_amD
};

HOUSEDOOR = {

private ["_cT","_pP"];
_cT = nearestBuilding player;
_pP = getposATL player;
copyToClipboard str [typeof _cT,_cT worldToModel _pP];
};

WAITINGSUP = [];
BUSYSUPS = [];
SAOKDEPOTORCALL = {
//goes to depot or calls help WAITSTOMOVE
private ["_c","_dt","_wp","_b","_nr","_s","_n","_f"];
_n = [] SPAWN SAOKCOMMITSUPPORT;
waitUntil {sleep 1; scriptdone _n;};
{
_s = _x;
if !(_x CALL SAOKVZMOVING) then {
if (_x call SAOKISDAMAGED || {(_x call SAOKISLOWAMMO && {!((_x getvariable "Mtype") in ["o_support","b_support","n_support","o_med","b_med","n_med"])})} || {(_x CALL SAOKISLOWFUEL && {!((_x getvariable "Mtype") in ["o_mortar","b_mortar","n_mortar"])})}) then {
if ((_x getvariable "Mtype") in ["o_air","b_air","n_air","o_plane","b_plane","n_plane","o_uav","b_uav","n_uav"] || {["AIR", (_x getvariable "Mtext")] call SAOKINSTRING}) then {
if !(_x CALL SAOKVZMOVING) then {
_c = ["ColorBlue","ColorGreen"];
if ((_s getvariable "Mcolor") == "ColorRed") then {_c = ["ColorRed"];};
_b = 0;
{if (getmarkercolor _x in _c) exitWith {
_wp = [getmarkerpos _x,50,0,"(1 - sea)"] CALL SAOKSEEKPOS; 
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
if ((_s getvariable "Mcolor") != "ColorRed") then {_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];};
[_s,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
[_s,"Heading Home"] SPAWN SAOKADDVEHZCON;
_b = 1;
};sleep 0.01;} foreach AIRFIELDLOCATIONS;
if (_b == 0) then {
{if (getmarkercolor _x in ["ColorOrange"]) exitWith {
_wp = [getmarkerpos _x,50,0,"(1 - sea)"] CALL SAOKSEEKPOS; 
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
if ((_s getvariable "Mcolor") != "ColorRed") then {_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];};
[_s,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
[_s,"Heading Home"] SPAWN SAOKADDVEHZCON;
};sleep 0.01;} foreach AIRFIELDLOCATIONS;
};
};
} else {
if (_x CALL SAOKNOFUEL || {random 1 < 0.7} || {(_x getvariable "Mtype") in ["b_mortar","i_mortar","o_mortar","n_naval","b_naval","o_naval"]}) then {_x SPAWN SAOKCALLSUP;} else {
_f = {
private ["_bol","_mP","_c","_nVZs"];
_bol = false;
_mP = locationposition _this;
_c = ["ColorRed"];
if ((_this getvariable "Mcolor") != "ColorRed") then {_c = ["ColorBlue","ColorGreen"];};
_nVZs = (nearestLocations [locationposition _this,["Name"], 400]) - [_this];
if ((!isNil{_this getvariable "WAITINGSUP"} && {(_this getvariable "WAITINGSUP") CALL SAOKVZMOVING}) || {{locationposition _x distance _mp < 400 && {(_x getvariable "Mcolor") in _c}} count BUSYSUPS > 0} || {{!isNil{_this getvariable "WAITINGSUP"} && {(_x getvariable "Mcolor") in _c}} count _nVZs > 0}) then {_bol = true;[_this,"Waiting Turn for Resupply"] SPAWN SAOKADDVEHZCON;} else {
_this setvariable ["WAITINGSUP",nil];
};
_bol
};
if (!(_x CALL SAOKVZMOVING) && {(_x getvariable "Mtype") in ["o_support","b_support","n_support","o_med","b_med","n_med"] || {(!(_x call _f))}}) then {
_c = ["ColorBlue","ColorGreen"];
if ((_s getvariable "Mcolor") == "ColorRed") then {_c = ["ColorRed"];};
_nr = "";
{if (getmarkercolor _x in _c && {(_nr == "" || {getmarkerpos _nr distance locationposition _s > getmarkerpos _x distance locationposition _s})}) then {_nr = _x;};sleep 0.01;} foreach SUPDEPOTS;
if (_nr != "") then {
_wp = [getmarkerpos _nr,190,130,"(1 - sea)"] CALL SAOKSEEKPOS; 
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
if ((_s getvariable "Mcolor") != "ColorRed") then {_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];};
[_s,"Heading to Depot"] SPAWN SAOKADDVEHZCON;
[_s,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
};
};
};
};
};
};
sleep 0.1;
} foreach VEHZONESA;
sleep 10;
[] SPAWN SAOKDEPOTORCALL;
};

SAOKADDAMDAT = {
private ["_nA","_type","_arr","_nd"];
if (typename _this == "ARRAY") then {
{
_arr = _x CALL SAOKZONEDRNEW;
_nd = [];
if (typename _arr == "ARRAY") then {
{
_type = if (typename _x == "STRING") then {_x} else {_x select 0};
_nA = _type CALL SAOKRETVEHAMM;
if (typename _x == "ARRAY" && {count _x > 2}) then {
_nd pushback [_type,_nA,_x select 2,_x select 3];
} else {
_nd pushback [_type,_nA,1,0];
};
} foreach _arr;
[_x,_nd] CALL SAOKZONED;
};
sleep 0.01;
} foreach VEHZONESA;
} else {
_arr = _this CALL SAOKZONEDRNEW;
_nd = [];
if (typename _arr == "ARRAY") then {
{
_type = if (typename _x == "STRING") then {_x} else {_x select 0};
_nA = _type CALL SAOKRETVEHAMM;
if (typename _x == "ARRAY" && {count _x > 2}) then {
_nd pushback [_type,_nA,_x select 2,_x select 3];
} else {
_nd pushback [_type,_nA,1,0];
};
} foreach _arr;
[_this,_nd] CALL SAOKZONED;
};
};
};
//configfile >> "CfgMagazines" >> "120Rnd_CMFlareMagazine" >> "count"
//configfile >> "CfgVehicles" >> "B_Mortar_01_F" >> "Turrets" >> "MainTurret" >> "magazines"
//[zone,res] "SUPDEPOTS","SUPRESOUR"
SUPDEPOTS = [];
SUPRESOURT = [];
//SAOKISDAMAGED SAOKISLOWFUEL SAOKISLOWAMMO
SAOKCOMMITSUPPORT = {
private ["_c","_f","_dT","_nV","_nr","_wp","_s","_allS","_co","_xP"];
_allS = [];
{
if (!isnil{_x getvariable "Mcolor"}) then {
_co = _x getvariable "Mcolor";
_c = ["ColorRed"];
if (_co != "ColorRed") then {_c = ["ColorGreen","ColorBlue"];};
_xP = locationposition _x;
if ({getmarkercolor _x in _c && {getmarkerpos _x distance _xP < 200}} count SUPDEPOTS > 0) then {
if (_x call SAOKISDAMAGED) then {[_x,"Repair"] call SAOKZONERESUP;[_x,"Repaired"] SPAWN SAOKADDVEHZCON;};
if (_x call SAOKISLOWAMMO) then {[_x,"Ammo"] call SAOKZONERESUP;[_x,"Rearmed"] SPAWN SAOKADDVEHZCON;};
if (_x call SAOKISLOWFUEL) then {[_x,"Fuel"] call SAOKZONERESUP;[_x,"Refueled"] SPAWN SAOKADDVEHZCON;};
};
if ((_x getvariable "Mtype") in ["o_support","b_support","n_support","b_med","n_med","o_med"]) then {_allS pushback _x;};
};
sleep 0.01;
} foreach VEHZONESA;
{
_s = _x;
_c = ["ColorBlue","ColorGreen"];
if ((_s getvariable "Mcolor") == "ColorRed") then {_c = ["ColorRed"];};
if (isNil{_s getvariable "SUPRESOUR"}) then {_s setvariable ["SUPRESOUR",5];};
if (_s getvariable "SUPRESOUR" > 0) then {
_nV = [];
{
_xP = locationposition _x;
//"o_naval","b_naval","n_naval"
if ((_x getvariable "Mtype") in []) then {
if (_x call SAOKISDAMAGED) then {[_x,"Repair"] call SAOKZONERESUP;[_x,"Repaired"] SPAWN SAOKADDVEHZCON;};
if (_x call SAOKISLOWAMMO) then {[_x,"Ammo"] call SAOKZONERESUP;[_x,"Rearmed"] SPAWN SAOKADDVEHZCON;};
if (_x call SAOKISLOWFUEL) then {[_x,"Fuel"] call SAOKZONERESUP;[_x,"Refueled"] SPAWN SAOKADDVEHZCON;};
} else {
if (_x != _s && {(_x getvariable "Mcolor") in _c} && {(locationposition _s) distance _xP < 200} && {(_x call SAOKISDAMAGED || {_x call SAOKISLOWAMMO} || {_x call SAOKISLOWFUEL})}) exitWith {
if (_x call SAOKISDAMAGED) then {[_x,"Repair"] call SAOKZONERESUP;[_x,"Repaired"] SPAWN SAOKADDVEHZCON;[_s,"Resupplying"] SPAWN SAOKADDVEHZCON;};
if (_x call SAOKISLOWAMMO) then {[_x,"Ammo"] call SAOKZONERESUP;[_x,"Rearmed"] SPAWN SAOKADDVEHZCON;[_s,"Resupplying"] SPAWN SAOKADDVEHZCON;};
if (_x call SAOKISLOWFUEL) then {[_x,"Fuel"] call SAOKZONERESUP;[_x,"Refueled"] SPAWN SAOKADDVEHZCON;[_s,"Resupplying"] SPAWN SAOKADDVEHZCON;};
_f = _s getvariable "SUPRESOUR";
_f = _f - 1;
_s setvariable ["WAITINGSUP",nil];
_s setvariable ["SUPRESOUR",_f];
};
};
sleep 0.01;
} foreach VEHZONESA;
} else {
//RETURN TO DEP OR IS NEAR ALREADY 
if ({getmarkerpos _x distance locationposition _s < 200 && {getmarkercolor _x in _c}} count SUPDEPOTS > 0) then {
_s setvariable ["SUPRESOUR",5];
[_s,"Loaded Supplies"] SPAWN SAOKADDVEHZCON;
} else {
if !(_x CALL SAOKVZMOVING) then {
_nr = ""; 
{if (getmarkercolor _x in _c && {(_nr == "" || {getmarkercolor _nr distance locationposition _s > getmarkercolor _x distance locationposition _s})}) then {_nr = _x;};sleep 0.01;} foreach SUPDEPOTS;
if (_nr != "") then {
BUSYSUPS pushback _s;
_s SPAWN {waitUntil {sleep 3; isNull _this || {!(_this CALL SAOKVZMOVING)}}; BUSYSUPS = BUSYSUPS - [_this];};
_wp = [locationposition _nr,190,130,"(1 - sea)"] CALL SAOKSEEKPOS; 
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
if ((_s getvariable "Mcolor") != "ColorRed") then {_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];};
[_s,"Getting Supplies"] SPAWN SAOKADDVEHZCON;
[_s,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
};
};
};
};
sleep 0.01;
} foreach _allS;
_allS = [];
{if ((_x getvariable "Mtype") in ["o_air","b_air","n_air","o_plane","b_plane","n_plane","o_uav","b_uav","n_uav"] || {["AIR", (_x getvariable "Mtext")] call SAOKINSTRING}) then {_allS pushback _x;};sleep 0.01;} foreach VEHZONESA;
{
if (typename _x != "STRING") then {
_s = _x;
_c = ["ColorBlue","ColorGreen","ColorOrange"];
if ((_x getvariable "Mcolor") == "ColorRed") then {_c = ["ColorRed","ColorOrange"];};
if ({getmarkercolor _x in _c && {locationposition _s distance getmarkerpos _x < 100}} count AIRFIELDLOCATIONS > 0) then {
if (_s call SAOKISDAMAGED) then {[_s,"Repair"] call SAOKZONERESUP;[_s,"Repaired"] SPAWN SAOKADDVEHZCON;};
if (_s call SAOKISLOWAMMO) then {[_s,"Ammo"] call SAOKZONERESUP;[_s,"Rearmed"] SPAWN SAOKADDVEHZCON;};
if (_s call SAOKISLOWFUEL) then {[_s,"Fuel"] call SAOKZONERESUP;[_s,"Refueled"] SPAWN SAOKADDVEHZCON;};
};
};
sleep 0.01;
} foreach _allS;
};
//{{_x distance _mP < 300} count (_x CALL SAOKZONEMW) > 0} count BUSYSUPS > 0
SAOKCALLSUP = {
private ["_f","_thisP","_avZ","_wp","_dt","_bil","_locationA","_landC","_ss","_bol"];
_f = {
private ["_bol","_mP"];
_bol = false;
_mP = locationposition _this;
if ((!isNil{_this getvariable "WAITINGSUP"} && {(_this getvariable "WAITINGSUP") CALL SAOKVZMOVING})) then {_bol = true;} else {
_this setvariable ["WAITINGSUP",nil];
};
_bol
};
_thisP = locationposition _this;
_bol = _this call _f;
if (_bol) exitWith {};
_bil = false;
if ((_this getvariable "Mtype") in ["n_naval","b_naval","n_naval"] && {!(_this CALL SAOKVZMOVING)}) then {
_landC = [_thisP,100,30,"(1 - sea)"] CALL SAOKSEEKPOS;  
if (surfaceiswater _landC) then {
_bil = true;
_locationA = [_thisP,getmarkerpos "Fac4"] CALL SAOKSEEKSHORE; 
if !([_thisP,_locationA] CALL SAOKLANDBETWEEN) then {[_this, _locationA] SPAWN ZoneMove;[_this,"Moving to Shore"] SPAWN SAOKADDVEHZCON;};
};
};
if (_bil) exitWith {};
sleep (random 2);
if ((_this getvariable "Mcolor") == "ColorRed") then {
_avZ = "";
{_ss = _x;if ((_x getvariable "Mtype") in ["o_support","o_med"] && {!(_x CALL SAOKVZMOVING)} && {!(_x in BUSYSUPS)} && {{!isNil{_x getvariable "SUPRESOUR"} && {_x getvariable "SUPRESOUR" > 0} && {!(_x call SAOKISLOWFUEL)} && {!(_x call SAOKISDAMAGED)}} count SUPRESOURT > 0} && {(typename _avZ == "STRING" || {locationposition _avZ distance _thisP > locationposition _x distance _thisP})}) then {_avZ = _x;};sleep 0.01;} foreach VEHZONESA;
if (typename _avZ != "STRING") then {
_wp = [_thisP,100,30,"(1 - sea)"] CALL SAOKSEEKPOS; 
if (surfaceiswater _wp) exitWith {};
BUSYSUPS pushback _avZ;
_this setvariable ["WAITINGSUP",_avZ];
[_this,"Waiting Resupply"] SPAWN SAOKADDVEHZCON;
_avZ SPAWN {sleep 20;waitUntil {sleep 3; isNull _this || {!(_this CALL SAOKVZMOVING)}}; BUSYSUPS = BUSYSUPS - [_this];};
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
[_avZ,"Moving to Resupply"] SPAWN SAOKADDVEHZCON;
[_avZ,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
} else {
//zone low ammo?
if (_this CALL SAOKISLOWAMMO) then {};
};
} else {
_avZ = "";
{_ss = _x;if ((_x getvariable "Mtype") in ["b_support","n_support","b_med","n_med"] && {!(_x CALL SAOKVZMOVING)} && {!(_x in BUSYSUPS)} && {{!isNil{_x getvariable "SUPRESOUR"} && {_x getvariable "SUPRESOUR" > 0} && {!(_x call SAOKISLOWFUEL)} && {!(_x call SAOKISDAMAGED)}} count SUPRESOURT > 0}  && {(typename _avZ == "STRING" || {locationposition _avZ distance _thisP > locationposition _x distance _thisP})}) then {_avZ = _x;};sleep 0.01;} foreach VEHZONESA;
if (typename _avZ != "STRING") then {
_wp = [_thisP,100,30,"(1 - sea)"] CALL SAOKSEEKPOS; 
if (surfaceiswater _wp) exitWith {};
BUSYSUPS pushback _avZ;
WAITINGSUP pushback [_this,_avZ];
[_this,"Waiting Resupply"] SPAWN SAOKADDVEHZCON;
_avZ SPAWN {sleep 20;waitUntil {sleep 3; isNull _this || {!(_this CALL SAOKVZMOVING)}}; BUSYSUPS = BUSYSUPS - [_this];};
_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];
[_avZ,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
[_avZ,"Moving to Resupply"] SPAWN SAOKADDVEHZCON;
};
};
};



SAOKISDAMAGED = {
private ["_arr","_bol"];
//vehz _this
_arr = _this CALL SAOKZONEDRNEW;
_bol = false;
if (typename _arr == "ARRAY") then {
{
if (typename _x == "ARRAY" && {count _x > 3}) then {
if (0.3 < (_x select 3)) exitWith {_bol = true;};
};
} foreach _arr;
};
_bol
};

SAOKNOFUEL = {
private ["_arr","_bol"];
//vehz _this
_arr = _this CALL SAOKZONEDRNEW;
_bol = false;
if (typename _arr == "ARRAY") then {
{
if (typename _x == "ARRAY" && {count _x > 2}) then {
if (0.05 > (_x select 2)) exitWith {_bol = true;};
};
} foreach _arr;
};
_bol
};

SAOKISLOWFUEL = {
private ["_arr","_bol"];
//vehz _this
_arr = _this CALL SAOKZONEDRNEW;
_bol = false;
if (typename _arr == "ARRAY") then {
{
if (typename _x == "ARRAY" && {count _x > 2}) then {
if (0.3 > (_x select 2)) exitWith {_bol = true;};
};
} foreach _arr;
};
_bol
};

SAOKISLOWAMMO = {
private ["_apuF","_arr","_bol","_nnn","_vClas"];
_apuF = {
private ["_bol"];
_bol = false;
if ({[_x, _this] call SAOKINSTRING} count ["smoke","flare"] > 0) exitWith {_bol = true;};
_bol
};
//vehz _this
_arr = _this CALL SAOKZONEDRNEW;
_bol = false;
if !((_this getvariable "Mtype") in ["n_support","b_support","o_support","b_med","n_med","o_med"]) then {
if (typename _arr == "ARRAY") then {
{
if (typename _x == "ARRAY" && {typename (_x select 1) == "ARRAY"} && {count (_x select 1) > 0}) then {
_vClas = _x select 0;
_nnn = _vClas CALL SAOKRETVEHAMM;
if (count _nnn > (count (_x select 1) + 1) || {count (_x select 1) == 0} || {(({(_x select 0) call _apuF} count (_x select 1)) + 1) > count (_x select 1)}) exitWith {_bol = true;};
};
} foreach _arr;
};
};
_bol
};
RESUPPEDZ = [];
SAOKZONERESUP = {
private ["_zone","_type","_dat","_a","_nA","_foreachIndex","_mP","_landC"];
_zone = _this select 0;
_type = _this select 1;
_dat = _zone CALL SAOKZONEDRNEW;
_zone setvariable ["WAITINGSUP",nil];
switch _type do {
case "Ammo": {{_a = _dat select _foreachIndex;_nA = (_a select 0) CALL SAOKRETVEHAMM; if (typename _nA == "ARRAY") then {_a set [1,_nA];_dat set [_foreachIndex, _a];};} foreach _dat;};
case "Fuel": {{_a = _dat select _foreachIndex;_a set [2,1];_dat set [_foreachIndex, _a];} foreach _dat;};
case "Repair": {{_a = _dat select _foreachIndex;_a set [3,0];_dat set [_foreachIndex, _a];} foreach _dat;};
};
RESUPPEDZ pushback _zone;
[_zone,_dat] CALL SAOKZONED;
if ((_zone getvariable "Mtype") in ["o_naval","i_naval","b_naval"] && {!(_zone call SAOKISDAMAGED)} && {!(_zone call SAOKISLOWAMMO)} && {!(_zone call SAOKISLOWFUEL)} && {!(_zone call SAOKVZMOVING)}) exitWith {
_mP = locationposition _zone;
_landC = [_mP,1200,450,"(1 - sea)"] CALL SAOKSEEKPOS;  
if (surfaceiswater _landC) then {
if !([_mP,_landC] CALL SAOKLANDBETWEEN) then {[_zone, _landC] SPAWN ZoneMove;};
};
};
};



SAOKCSATTOWARDCAMP = {
private ["_dt","_v","_n","_p","_tar","_wp","_ar","_flm"];
if (count VEHZONES == 0 || {!isNil"NOCSATATTACKS"}) exitWith {};
_v = + VEHZONES;  
_n = 10*DIFLEVEL;  
//SAOKISDAMAGED SAOKISLOWFUEL SAOKISLOWAMMO _vClas CALL SAOKRETVEHAMM;
while {_n > 0 && {count _v > 0}} do {  
_n = _n - 1;  
_p = _v call RETURNRANDOM;  
_v = _v - [_p]; 
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
if (count _this > 0) then {_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];};
//[_p,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
if (!((_p getvariable "Mtype") in ["b_naval","o_naval","n_naval","o_art","o_mortar","o_support","b_art","b_mortar","b_support","o_med","b_med","i_med","o_unknown","b_unknown"]) && {(_p getvariable "Mcolor") == (_dt select 0)} && {locationposition _p distance locationposition ([(_dt select 2),locationposition _p] CALL NEARESTCAMP) > 800} && {!(_p CALL SAOKVZMOVING)}) then {  
_tar = [([(_dt select 2),locationposition _p] CALL NEARESTCAMP)]; 
{if (getmarkercolor (_x getvariable "Marker") ==  (_dt select 2) && {[getmarkerpos (_x getvariable "Marker"),"ColorRed"] CALL SAOKNEARVZNUM < 3}) then {_tar pushBack _x;};sleep 0.01;} foreach (nearestLocations [locationposition _p, ["CampB","CampR"], 8000]);
_tar = _tar call RETURNRANDOM;  
_wp = [locationposition _tar,700,40,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;  
if ((_p getvariable "Mtype") in (_dt select 3) && {(_p CALL SAOKISDAMAGED || {_p CALL SAOKISLOWFUEL} || {_p CALL SAOKISLOWAMMO})}) then {
_tar = ([locationposition _p,(_dt select 1)] CALL NEARESTAIRFIELD);  
if (getmarkercolor _tar == (_dt select 0)) then {
_wp = [getmarkerpos _tar,100,0,"(1 - sea)"] CALL SAOKSEEKPOS;  
};
};
if (((_p getvariable "Mtype") in (_dt select 3)) || {(!(_p CALL SAOKISDAMAGED) && {!(_p CALL SAOKISLOWFUEL)} && {!(_p CALL SAOKISLOWAMMO)})}) then {
[_p,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
};
} else {
if !(_p CALL SAOKVZMOVING) then {
if ((_p getvariable "Mtype") in ["o_naval"]) then {
_wp = [locationposition _p,1000,50,"(1 - sea)"] CALL SAOKSEEKPOS;  
if (surfaceiswater _wp && {!(_wp call SAOKOUTOFMAP)} && {!([locationposition _p,_wp] CALL SAOKLANDBETWEEN)}) then {[_p, _wp] SPAWN ZoneMove;};
};
if ((_p getvariable "Mtype") in ["o_support","o_med"] && {!(_p in BUSYSUPS)}) then {
_ar = [] CALL SAOKCSATFACTORIES;
if (random 1 < 0.5) then {
{_ar pushBack _x;sleep 0.01;} foreach (nearestLocations [locationposition _p, ["CampR"], 5000]);
} else {
{_ar pushBack _x;sleep 0.01;} foreach (nearestLocations [locationposition _p, ["PostR"], 5000]);
};
_wp = _ar call RETURNRANDOM;
if (!isNil"_wp" && {typename _wp != "ARRAY"}) then {
if (typename _wp == "STRING") then {_wp = getmarkerpos _wp;} else {_wp = locationposition _wp};
};
if (!isNil"_wp" && {typename _wp == "ARRAY"} && {count _wp > 1}) then {
_wp = [_wp,100,0,"(1 - sea)"] CALL SAOKSEEKPOS;  
[_p,[],_wp] SPAWN SAOKFINDROUTEANDMOVE;
};
};
if ((_p getvariable "Mtype") in ["o_art","o_mortar"] && {!(_p CALL SAOKISLOWAMMO)} && {(_p getvariable "Mtype") != "o_art" || {!(_p CALL SAOKISLOWFUEL)}}) then {
_flm = _p CALL SAOKNEARESTFL;
if (!isNil"_flm" && {typename _flm == "STRING"} && {_flm != ""}) then {_wp = [getmarkerpos _flm,100,0,"(1 - sea)"] CALL SAOKSEEKPOS; [_p,[],_wp] SPAWN SAOKFINDROUTEANDMOVE;};
};

};
};
sleep 1;  
};
};

SAOKINMAP = {
private ["_bol","_xx","_yy"];
_xx = _this select 0;
_yy = _this select 1;
_bol = if ({_x > 0 && {_x < SAOKMAPSIZE}} count [_xx,_yy] == 2) then {true} else {false};
_bol
};

SAOKUNSTUCKUN = {
private ["_start"];
{
if (surfaceiswater getposATL _x) then {
_start = [_x,30,0,"(1 - sea)"] CALL SAOKSEEKPOS;
if (!surfaceiswater _start) then {_x setpos _start;} else {_x setpos [(getposATL _x select 0)+10-(random 20),(getposATL _x select 1)+10-(random 20),0];};
} else {
_x setpos [(getposATL _x select 0)+10-(random 20),(getposATL _x select 1)+10-(random 20),0];
};
_x switchmove "";
_x enablesimulation true;
sleep 0.01;
} foreach (groupSelectedUnits player);
};

SAOKBUILDINGPOS = {
private ["_tO","_waypoints","_c","_array"];
_tO = typeof _this;
_waypoints = [];
if ({_tO == (_x select 0)} count GOODBUILDING == 0) then {
_c = 0;
_array = _this buildingPos _c;
while {!(_array isEqualTo [0,0,0]) && {_c < 20}} do {	
_waypoints pushBack _c;
_c = _c + 1;
_array = _this buildingPos _c;
};
if (count _waypoints > 0) then {GOODBUILDING pushback [_tO,_waypoints];};
} else {
{if (_tO == (_x select 0)) exitWith {_waypoints = _x select 1;};} foreach GOODBUILDING;
};
_waypoints
};

SAOKISBUILDING = {
private ["_bol"];
_bol = false;
if ({typeof _this == (_x select 0)} count GOODBUILDING > 0 || {count (_this call SAOKBUILDINGPOS) > 0}) then {_bol = true;};
_bol
};

SAOKATLTOASL = {
private ["_ar"];
_ar = + _this;
if (count _ar == 3) then {_ar = ATLtoASL _ar;};
_ar 
};

CivNx = [];

SAOKVILAR = {
private ["_ar","_r","_d","_pt","_deAT"];
_ar = [];
_pt = [_this,2] call SAOKREMINDEX;
_pt = [((_pt select 0)*0.001),((_pt select 1)*0.001)];
{
if (_pt distance (_x select 0) < 20) then {
_r = + _x;
_deAT = _r deleteAt 0;
_ar = _ar +_r;
};
} foreach CivNx;
_d = 20;
while {count _ar == 0 && {count CivNx > 0} && {_d < 45}} do {
{
if (_pt distance (_x select 0) < _d) then {
_r = + _x;
_deAT = _r deleteAt 0;
_ar = _ar + _r;
};
} foreach CivNx;
_d = _d + 20;
};
_ar 
};

SAOKADDPATROL = {
private ["_random","_unitrate","_classes","_cl","_group"];
_unitrate = if (count _this > 1) then {_this select 1} else {[4,5]};
_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
_classes = [];
_cl = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
for "_i" from 0 to _random do {_classes pushback (_cl call RETURNRANDOM);};
_group = [_this select 0, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
Pgroups pushBack _group;
[_group, _this select 0, 100] call bis_fnc_taskPatrol;
};

SAOKONRUNWAY = {
private ["_NRun","_funcRun","_bol","_runW"];
_bol = false;
_NRun = {
private ["_run"];
_run = "";
{if ((_this select 0) distance (getmarkerpos _x) < (_this select 1)) exitWith {_run = _x;};} foreach AIRFIELDLOCATIONS;
//["AirC","AirC_1","AirC_2","AirC_3","AirC_4","AirC_5"]
switch _run do {
case "AirC": {_run = runway0;};
case "AirC_1": {_run = runway1;};
case "AirC_2": {_run = runway2;};
case "AirC_3": {_run = runway3;};
case "AirC_4": {_run = runway4;};
case "AirC_5": {_run = runway5;};
case "": {_run = runwayNul;};
};
_run
};
_funcRun = {
private ["_bol"];
_bol = false;
if (([_this select 0, _this select 1] call BIS_fnc_inTrigger)) then {_bol = true;};
_bol
};
_runW = [_this, 2000] CALL _NRun;
if (([_runW, _this] call _funcRun)) then {_bol = true;};
_bol
};

SAOKVILD = [];
SAOKVILL = [];
SAOKVILSET = {
private ["_old"];
if (typename (_this select 0) != "LOCATION" || {isNil{SAOKDATAB getvariable (str (_this select 0))}}) exitWith {};
if ((_this select 1) == "A") then {_old = SAOKDATAB getvariable (str (_this select 0));_old set [2,_this select 2]; SAOKDATAB setvariable [str (_this select 0), _old];};
if ((_this select 1) == "B") then {_old = SAOKDATAB getvariable (str (_this select 0));_old set [1,_this select 2]; SAOKDATAB setvariable [str (_this select 0), _old];};
if ((_this select 1) == "Task") then {_old = SAOKDATAB getvariable (str (_this select 0));_old set [3,_this select 2]; SAOKDATAB setvariable [str (_this select 0), _old];};
};

SAOKVILRET = {
private ["_dat"];
_dat = "";
if (!isNil{(SAOKDATAB getvariable (str (_this select 0)))}) then {
if ((_this select 1) == "A") then {_dat = (SAOKDATAB getvariable (str (_this select 0))) select 2;};
if ((_this select 1) == "B") then {_dat = (SAOKDATAB getvariable (str (_this select 0))) select 1;};
if ((_this select 1) == "M") then {_dat = (SAOKDATAB getvariable (str (_this select 0))) select 0;};
if ((_this select 1) == "Task") then {_dat = (SAOKDATAB getvariable (str (_this select 0))) select 3;};
};
_dat
};

SAOKVILCON = {
private ["_n","_dat"];
_dat = false;
_n = SAOKDATAB getvariable (str (_this select 0));
if (!isNil{_n}) then {
if ((_this select 1) == "A" && {count _n > 2}) then {_dat = true;};
if ((_this select 1) == "B" && {count _n > 1}) then {_dat = true;};
if ((_this select 1) == "M" && {count _n > 0}) then {_dat = true;};
if ((_this select 1) == "Task" && {count _n > 3}) then {_dat = true;};
};
_dat
};

SAOKVILDATREM = {
private ["_dat"];
if (isNil{SAOKDATAB getvariable (str _this)}) exitWith {};
_dat = SAOKDATAB getvariable (str _this);
_dat deleteAT 3;
SAOKDATAB setvariable [str _this, _dat];
};

SAOKIMPREL = {
private ["_str"];
_str = _this;
if !([_str,"A"] CALL SAOKVILCON) then {
[_str,"A","Friendly"] CALL SAOKVILSET;
} else {
if ([_str,"A"] CALL SAOKVILRET == "Neutral") then {
[_str,"A","Friendly"] CALL SAOKVILSET;
};
if ([_str,"A"] CALL SAOKVILRET == "Angry") then {
[_str,"A","Neutral"] CALL SAOKVILSET;
};
if ([_str,"A"] CALL SAOKVILRET == "Hostile") then {
[_str,"A","Angry"] CALL SAOKVILSET;
};
};
};


SAOKADDPROG = {
private ["_cur"];
_cur = if (!isNil{missionnamespace getvariable "Progress"}) then {missionnamespace getvariable "Progress"} else {[]};
if !(_this in _cur) then {missionnamespace setvariable ["Progress",_cur + [_this]];};
};

ZONEDATA = []; 

SAOKCRTASK = {
private ["_a"];
	_a = + _this;
	//_a set [3,objnull];
	_a set [4,false];
	_a set [5,-1];
	_a set [6,true];
	//if (count _a > 7) then {_a set [7,""];};
	_a CALL BIS_fnc_taskCreate;
	if (time > 0 && {isNil"SAOKPDIE"} && {!isNil"StartMission"} && {isNil"NOTASKNOTI"}) then {
		["NEW OBJECTIVE",(_a select 2) select 1] SPAWN SAOKTASKHINT;
	};
};

SAOKCOTASK = {
	private ["_a"];
	_a = + _this;
	_a pushBack false;
	_a pushBack false;
	if (time > 0 && {isNil"SAOKPDIE"} && {!isNil"StartMission"} && {isNil"NOTASKNOTI"}) then {
		[(_a select 1),(((_a select 0) call BIS_fnc_taskDescription) select 1) select 0] SPAWN SAOKTASKHINT;
	};
	_a CALL BIS_fnc_taskSetState;
};

SAOKZONED = {
private [];
//{if !((_x select 0) in allmapmarkers) exitWith {_deAT = ZONEDATA deleteAt _forEachIndex;};} foreach ZONEDATA; 
if (typename _this == "ARRAY") exitWith {
//{if (_this select 0 == _x select 0) exitWith {_deAT = ZONEDATA deleteAt _forEachIndex;};} foreach ZONEDATA; 
//ZONEDATA pushBack _this;
(_this select 0) setvariable ["ZONEDATA",(_this select 1)];
};
if (typename _this == "LOCATION") exitWith {
//{if (_this == _x select 0) exitWith {_deAT = ZONEDATA deleteAt _forEachIndex;};} foreach ZONEDATA; 
while {_this in RESUPPEDZ} do {RESUPPEDZ = RESUPPEDZ - [_this];};
};
};
APUFF = {
private ["_arara"];
_arara = [];
{_arara pushback (_x select 0);} foreach _this;
_arara
};
SAOKZONEDR = {
private ["_ar","_zn"];
_zn = _this;
if (typename _zn == "STRING") then {hint _zn;};
_ar = if (!isNil{_zn getvariable "ZONEDATA"}) then {_zn getvariable "ZONEDATA"} else {[]};
_ar
};

SAOKZONEDRNEW = {
private ["_ar","_zn"];
_zn = _this;
if (typename _zn == "STRING") then {hint _zn;};
_ar = if (!isNil{_zn getvariable "ZONEDATA"}) then {_zn getvariable "ZONEDATA"} else {[]};
_ar
};

ZONEMG = []; 
SAOKZONEG = {
private ["_forEachIndex","_deAT"];
//if (random 1 < 0.3) then {{if !((_x select 0) in allmapmarkers) exitWith {_deAT = ZONEDATA deleteAt _forEachIndex;};} foreach ZONEDATA;};
{if (isNil{(_x select 0) getvariable "ZONEDATA"}) exitWith {_deAT = ZONEMG deleteAt _forEachIndex;};} foreach ZONEMG; 
if (typename _this == "ARRAY") exitWith {
{if (_this select 0 == _x select 0) exitWith {_deAT = ZONEMG deleteAt _forEachIndex;};} foreach ZONEMG; 
ZONEMG pushBack _this;
};
if (typename _this == "LOCATION") exitWith {
{if (_this == _x select 0) exitWith {_deAT = ZONEMG deleteAt _forEachIndex;};} foreach ZONEMG; 
};
};

SAOKZONEM = {
private ["_forEachIndex","_w","_deAT"];
//if (random 1 < 0.3) then {{if !((_x select 0) in allmapmarkers) exitWith {_deAT = ZONEDATA deleteAt _forEachIndex;};} foreach ZONEDATA;};
{if (!((_x select 0) in allmapmarkers) || {isNull (_x select 1)}) exitWith {_deAT = ZONEMG deleteAt _forEachIndex;};} foreach ZONEMG; 
//ADD W _n = ["ZoneName",[0,0,0]] CALL SAOKZONEM;
if (typename _this == "ARRAY" && {typename (_this select 1) == "ARRAY"}) exitWith {
_w = if (!isNil{(_this select 0) getvariable "ZONEMS"}) then {(_this select 0) getvariable "ZONEMS"} else {[]};
_w pushback (_this select 1);
(_this select 0) setvariable ["ZONEMS",_w];
if !((_this select 0) in ZONETOMOVE) then {ZONETOMOVE pushback (_this select 0);};
};
//REMOVE WHOLE DATA _n = "ZoneName" CALL SAOKZONEM;
if (typename _this == "LOCATION") exitWith {
_this setvariable ["ZONEMS",[]];
};
//REMOVE LAST W _n = ["ZoneName",""] CALL SAOKZONEM;
if (typename _this == "ARRAY" && {typename (_this select 1) == "STRING"}) exitWith {
_w = if (!isNil{(_this select 0) getvariable "ZONEMS"}) then {(_this select 0) getvariable "ZONEMS"} else {[]};
_w deleteAt 0;
(_this select 0) setvariable ["ZONEMS",_w];
};
};
//RETURN WAYPOINTS _n = "ZoneName" CALL SAOKZONEMW;
SAOKZONEMW = {
private ["_w"];
_w = if (!isNil{_this getvariable "ZONEMS"}) then {_this getvariable "ZONEMS"} else {[]};
//{if (_this == _x select 0) exitWith {_w = _x select 1};} foreach ZONEMS;
_w
};

SAOKMILCENLIST = {
private ["_added"];
lbClear 1500;
_added = [];
switch _this do {
case "Other": {
lbAdd [1500, "Water Barrel"];
lbAdd [1500, "Mine/Construction-Truck"];
if (isNil"IFENABLED") then {
lbAdd [1500, "Hunter"];
lbAdd [1500, "Strider"];
lbAdd [1500, "Offroad FIA"];
};
};
case "Boats": {
lbAdd [1500, "Empty Rubberboat"];
if (isNil"IFENABLED") then {
lbAdd [1500, "Empty Motorboat"];
if ("USHelp" in (missionnamespace getvariable "Progress") || {"GreenHelp" in (missionnamespace getvariable "Progress")}) then {
lbAdd [1500, "Empty Assault Boat"];
lbAdd [1500, "Empty Speedboat MG"];
lbAdd [1500, "Empty SDV"];
};
};
};
case "Supplies": {
lbAdd [1500, "Empty Repair Truck"];
if (vehicle player distance (getmarkerpos ([] CALL NEARESTAIRFIELD)) < 200 && {getmarkercolor ([] CALL NEARESTAIRFIELD) == "ColorGreen"}) then {
lbAdd [1500, "Empty Fuel Truck"];
lbAdd [1500, "Empty Rearm Truck"];
lbAdd [1500, "Empty Medical Truck"];
};
};
//crew = "B_UAV_AI";
case "NATO Air Vehicles": {
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRARMCHOP select 0);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRCARRIERCHOP select 0);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRFIGTHER select 0);
};
case "US Air Vehicles": {
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRARMCHOP select 0);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRFIGTHER select 0);
};
case "GREEN Air Vehicles": {
"CH-49 comes with ability to construct guardposts and minefields" SPAWN HINTSAOK;
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRARMCHOP select 2);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRCARRIERCHOP select 2);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRFIGTHER select 2);
};
case "German Air Vehicles": {
//"CH-49 comes with ability to construct guardposts and minefields" SPAWN HINTSAOK;
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRARMCHOP select 2);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRFIGTHER select 2);
};
case "GUER Land Vehicles": {
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 3);
};
case "Polish Land Vehicles": {
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 3);
};
case "GREEN Land Vehicles": {
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 2);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDTANKS select 2);
};
case "German Land Vehicles": {
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 2);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDTANKS select 2);
};
case "NATO Land Vehicles": {
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 0);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDTANKS select 0);
};
case "US Land Vehicles": {
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 0);
{if (!(_x in _added) && {!(getText (configfile >> "CfgVehicles" >> _x >> "crew") in ["B_UAV_AI","O_UAV_AI","I_UAV_AI"])}) then {lbAdd [1500, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDTANKS select 0);
};
case "AI Support": {
//lbAdd [1500, "Mortar Team"];
if (isNil"IFENABLED") then {
lbAdd [1500, "AR-2 Darter (AI)"];
lbAdd [1500, "UGV Stomper (AI)"];
lbAdd [1500, "UGV Stomper RCWS (AI)"];
lbAdd [1500, "MQ4A Greyhawk (AI)"];
};
};
};
lbSetCurSel [1500, 0];
};

SAOKBOXHINT = {
private ["_disp"];
28 cutRsc ["MyRscTitle8","PLAIN"];
disableSerialization;
_disp = uiNamespace getVariable "d8_MyRscTitle";
if (typename _this == "ARRAY") then {
(_disp displayCtrl 308) ctrlSetStructuredText parseText (_this select 0);
} else {
(_disp displayCtrl 308) ctrlSetStructuredText parseText ("<t color='#FF6600'>"+_this+"</t>");
};
};

SAOKLAUNCDYNTASK = {
private ["_n","_bol","_c","_deAT"];
_c = count SAOKDYNTASKS - 1;
_bol = true;
while {_c >= 0 && {_bol}} do {
if ((count (SAOKDYNTASKS select _c) > 1 && {[] CALL ((SAOKDYNTASKS select _c) select 1)}) || {((SAOKDYNTASKS select _c) select 0) CALL SAOKTCOND}) then {
if (!isNil{missionnamespace getvariable ((SAOKDYNTASKS select _c) select 0)}) then {
_n = [] SPAWN (missionnamespace getvariable ((SAOKDYNTASKS select _c) select 0));
} else {
_n = [] execVM ((SAOKDYNTASKS select _c) select 0);
};
_bol = false;
_deAT = SAOKDYNTASKS deleteAt _c;
};
_c = _c - 1;
sleep 0.2;
};
};

SAOKMORECSAT = {
private ["_r","_max","_n","_max2","_start","_rC","_gP","_nP","_p"];
if (random 1.5 > DIFLEVEL) exitWith {};
_p = SAOKMAPSIZE*0.5;
_max = 5 * (count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]));
if (_max > 70) then {_max = 70;};
if ({(_x getvariable "Mcolor") == "ColorRed"} count VEHZONESA > _max) exitWith {};
_gP = [];
{if (getmarkercolor _x == "ColorYellow") then {_gP pushBack _x;};} foreach PierMarkers;
if (count _gP == 0) exitWith {};
_n = _gP call RETURNRANDOM;
_max2 = 0;
_nP = getmarkerpos _n;
while {(getmarkercolor _n != "ColorYellow" || {locationposition(["ColorBlue",_nP] CALL NEARESTCAMP) distance _nP > locationposition(["ColorRed",_nP] CALL NEARESTCAMP) distance _nP}) && {_max2 < 15}} do {_n = _gP call RETURNRANDOM;_max2 = _max2 + 1; sleep 0.1;};
if !(_max2 < 15) exitWith {};
_start = [getmarkerpos _n,100,30,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
_rC = ["C","P","T","V","T","V","T","V","AA","S"] call RETURNRANDOM;
_r = [2,3,4] call RETURNRANDOM;
if (_rC in ["AA","S"]) then {_r = [1,2] call RETURNRANDOM;};
["EAST",_rC,_r,_start] SPAWN SAOKMOREVEHZONES;
};

SAOKVZFUNC1 = {
private ["_g","_mar","_n"];
_g = "";
{if (!isNull _x) exitWith {_g = group _x;};} foreach _this;
if (typename _g == "STRING") exitWith {};
_mar = _g getvariable "GMar";
_n = [_mar,""] CALL SAOKZONEM;
};

SAOKEJECT = {
private ["_f1","_f2","_f3","_unit","_veh","_Vpos","_itemCargoBackPack","_magCargoBackPack","_weaCargoBackPack","_bp","_BackPackBol"];
_f1 = {
private ["_unit","_typ","_cW","_c","_num"];
//MAGAZINE CARGO
_cW = _this select 0;
_unit = _this select 1;
_typ = _this select 2;
_c = count (_cW select 0) - 1;
if (_c < 0) exitWith {};
for "_i" from 0 to _c do {
private ["_class"];
_class = (_cW select 0) select _i;
_num = (_cW select 1) select _i;
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addMagazineCargo [_class , 1];};
case "V": {(vestContainer _unit) addMagazineCargo [_class , 1];};
case "B": {(backpackContainer _unit) addMagazineCargo [_class , 1];};
};
};
};
};

_f2 = {
private ["_unit","_typ","_cW","_c","_num"];
//ITEM CARGO
_cW = _this select 0;
_unit = _this select 1;
_typ = _this select 2;
_c = count (_cW select 0) - 1;
if (_c < 0) exitWith {};
for "_i" from 0 to _c do {
private ["_class","_nameA","_f"];
_class = (_cW select 0) select _i;
_num = (_cW select 1) select _i;
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addItemCargo [_class , 1];};
case "V": {(vestContainer _unit) addItemCargo [_class , 1];};
case "B": {(backpackContainer _unit) addItemCargo [_class , 1];};
};
};
};
};
_f3 = {
private ["_unit","_typ","_cW","_c","_num"];
//WEAPON CARGO
_cW = _this select 0;
_unit = _this select 1;
_typ = _this select 2;
_c = count (_cW select 0) - 1;
if (_c < 0) exitWith {};
for "_i" from 0 to _c do {
private ["_class","_nameA","_f"];
_class = (_cW select 0) select _i;
_num = (_cW select 1) select _i;
while {_num > 0} do {
_num = _num -1;
switch (_typ) do {
case "U": {(uniformContainer _unit) addWeaponCargo [_class , 1];};
case "V": {(vestContainer _unit) addWeaponCargo [_class , 1];};
case "B": {(backpackContainer _unit) addWeaponCargo [_class , 1];};
};
};
};
};
_unit = _this select 0;
_veh = _this select 1;
_bp = backpack _unit;
_itemCargoBackPack = [];
_magCargoBackPack = [];
_weaCargoBackPack = [];
_BackPackBol = !isnull (BackPackContainer _unit);
if (!isNil"_BackPackBol" && {_BackPackBol}) then {
_itemCargoBackPack = (getitemCargo (BackPackContainer _unit));
_magCargoBackPack = (getMagazineCargo (BackPackContainer _unit));
_weaCargoBackPack = (getWeaponCargo (BackPackContainer _unit));
};
_unit disableCollisionWith _veh; 
_unit allowdamage false;
sleep 1;
_Vpos = getposATL _veh;
_unit setpos [_Vpos select 0,_Vpos select 1,(_Vpos select 2)-12];
if (vehicle _unit != _unit) then {
_unit action ["Eject", _veh];
[_unit] ordergetin false;
};
unassignvehicle _unit;
removeBackpack _unit;
_unit addbackpack "B_Parachute";
sleep (2+(random 0.5));
_unit action ["OpenParachute",_unit];
[_unit, _veh] SPAWN {
private ["_unit","_veh"];
_unit = _this select 0;
_veh = _this select 1;
waitUntil {isNull _unit || {getposATL _unit select 2 < 20}};
_unit allowdamage false;
waitUntil {isNull _unit || {getposATL _unit select 2 < 1}};
if (getposATL _unit select 2 > 1) then {
vehicle _unit disableCollisionWith _veh; 
};
sleep 2;
_unit allowdamage true;
};
sleep 6;
_unit allowdamage true;
waitUntil {sleep 1; getposATL _unit select 2 < 1};
if (alive _unit && {_bp != ""}) then {
if (!isPlayer _unit) then {_unit switchmove "";};
_unit addBackpack _bp;
clearMagazineCargo BackpackContainer _unit;
clearWeaponCargo BackpackContainer _unit;
clearItemCargo BackpackContainer _unit;
if (_BackPackBol) then {
[_weaCargoBackPack,_unit,"B"] CALL _f3;
[_itemCargoBackPack,_unit,"B"] CALL _f2;
[_magCargoBackPack,_unit,"B"] CALL _f1;
};
};
};

SAOKMZDIALOG = {
private ["_ok","_myDisplay","_ta"];
disableserialization;
_ok = createDialog "CreateVMDialog"; 
_myDisplay = findDisplay 12453;
_ta = [
"Armored",
"Light Armored",
"Recon",
"Anti-Air",
"Chopper",
"Plane",
"Mortar",
"Support"
];
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_ta pushback "Artillery";};
{
lbAdd [1499, _x];
} foreach _ta;
lbSetCurSel [1499, 0];
};

SAOKMZCAT = {
//
private ["_myDisplay","_ctrl","_text","_ctrl2","_u","_nn","_aa","_aa2"];
lbClear 1500;
lbClear 1501;
_myDisplay = findDisplay 12453;
_ctrl = (_myDisplay displayCtrl 1500);
_text = "";
_ctrl2 = (_myDisplay displayCtrl 1100);
//_ctrl2 ctrlSetStructuredText parseText _text;
_u = [];
_nn = 0;
_aa = [3];
_aa2 = [];
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_aa pushback 0;_aa2 pushback 0;};
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {_aa pushback 2;_aa2 pushback 2;};
switch _this do {
case "Armored": {{{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach (ARMEDTANKS select _x);} foreach _aa;};
case "Light Armored": {{{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach (ARMEDVEHICLES select _x);} foreach _aa;};
case "Recon": {{{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach (ARMEDVEHICLES select _x);} foreach _aa;};
case "Anti-Air": {{{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach (ARMEDAA select _x);} foreach _aa;};
case "Chopper": {{{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach (AIRARMCHOP select _x);} foreach _aa;};
case "Plane": {{{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach (AIRFIGTHER select _x);} foreach _aa;};
case "Support": {{{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach (ARMEDSUPPORT select _x);} foreach _aa2;};
case "Mortar": {{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach ["I_Mortar_01_F"];};
case "Artillery": {{if !(_x in _u) then {_u pushback _x;lbAdd [1500,  getText(configfile >> "CfgVehicles" >> _x >> "displayName")];_ctrl lbSetPicture [_nn,gettext (configfile >> "CfgVehicles" >> _x >> "picture")];_nn = _nn + 1;};} foreach ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"];};
};
};

SAOKMZADD = {
private ["_v","_cl","_n","_cost","_c","_ar","_text","_myDisplay","_lim","_aa","_aa2"];
_lim = 3;
if ((lbText [1499,(lbCurSel 1499)]) in ["Mortar","Artillery"]) then {_lim = 1;};
if (_this != "" && {lbSize 1501 < _lim}) then {lbAdd [1501, _this];};
_n = lbSize 1501 - 1;
_ar = [];
_v = [];
_aa = [3];
_aa2 = [];
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_aa pushback 0;_aa2 pushback 0;};
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {_aa pushback 2;_aa2 pushback 2;};
//(ARMEDTANKS select 0)+(ARMEDVEHICLES select 0)+(ARMEDAA select 0)+(AIRARMCHOP select 0)+(AIRFIGTHER select 0)+(ARMEDSUPPORT select 0)
switch (lbText [1499,(lbCurSel 1499)]) do {
case "Armored": {{_v append (ARMEDTANKS select _x);} foreach _aa;};
case "Light Armored": {{_v append (ARMEDVEHICLES select _x);} foreach _aa;};
case "Recon": {{_v append (ARMEDVEHICLES select _x);} foreach _aa;};
case "Anti-Air": {{_v append (ARMEDAA select _x);} foreach _aa;};
case "Chopper":  {{_v append (AIRARMCHOP select _x);} foreach _aa;};
case "Plane":  {{_v append (AIRFIGTHER select _x);} foreach _aa;};
case "Support":  {{_v append (ARMEDSUPPORT select _x);} foreach _aa2;};
case "Mortar": {_v =["I_Mortar_01_F"];};
case "Artillery": {_v = ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"];};

};
while {_n >= 0} do {
_cl = "";
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 0)+(ARMEDVEHICLES select 0)+(ARMEDAA select 0)+(AIRARMCHOP select 0)+(AIRFIGTHER select 0)+(ARMEDSUPPORT select 0)+["B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
if (_cl == "") then {
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 2)+(ARMEDVEHICLES select 2)+(ARMEDAA select 2)+(AIRARMCHOP select 2)+(AIRFIGTHER select 2)+(ARMEDSUPPORT select 2)+["I_Mortar_01_F"];
};
if (_cl == "") then {
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 3)+(ARMEDVEHICLES select 3)+(ARMEDAA select 3)+(AIRARMCHOP select 3)+(AIRFIGTHER select 3);
};
if (_cl != "") then {_ar pushBack _cl;};
_n = _n - 1;
};
_c = 0;
{
_cost = ((getText(configfile >> "CfgVehicles" >> _x >> "displayName")) CALL SUPPORTCOST) * 0.7;
if ((lbText [1499,(lbCurSel 1499)]) == "Recon") then {_cost = _cost * 1.3;};
_c = _c + _cost;
} foreach _ar;
_text = format ["Price %1",_c];
_myDisplay = findDisplay 12453;
(_myDisplay displayCtrl 1100) ctrlSetStructuredText parseText _text;
};

SAOKMZREM = {
private ["_v","_cl","_n","_cost","_c","_ar","_text","_myDisplay","_aa","_aa2"];
lbDelete [1501, _this];
_n = lbSize 1501 - 1;
_ar = [];
_v = [];
_aa = [3];
_aa2 = [];
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_aa pushback 0;_aa2 pushback 0;};
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {_aa pushback 2;_aa2 pushback 2;};
switch (lbText [1499,(lbCurSel 1499)]) do {
case "Armored": {{_v append (ARMEDTANKS select _x);} foreach _aa;};
case "Light Armored": {{_v append (ARMEDVEHICLES select _x);} foreach _aa;};
case "Recon": {{_v append (ARMEDVEHICLES select _x);} foreach _aa;};
case "Anti-Air": {{_v append (ARMEDAA select _x);} foreach _aa;};
case "Chopper":  {{_v append (AIRARMCHOP select _x);} foreach _aa;};
case "Plane":  {{_v append (AIRFIGTHER select _x);} foreach _aa;};
case "Support":  {{_v append (ARMEDSUPPORT select _x);} foreach _aa2;};
case "Mortar": {_v =["I_Mortar_01_F"];};
case "Artillery": {_v = ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"];};
};
while {_n >= 0} do {
_cl = "";
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 0)+(ARMEDVEHICLES select 0)+(ARMEDAA select 0)+(AIRARMCHOP select 0)+(AIRFIGTHER select 0)+(ARMEDSUPPORT select 0)+["B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
if (_cl == "") then {
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 2)+(ARMEDVEHICLES select 2)+(ARMEDAA select 2)+(AIRARMCHOP select 2)+(AIRFIGTHER select 2)+(ARMEDSUPPORT select 2)+["I_Mortar_01_F"];
};
if (_cl == "") then {
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 3)+(ARMEDVEHICLES select 3)+(ARMEDAA select 3)+(AIRARMCHOP select 3)+(AIRFIGTHER select 3);
};
if (_cl != "") then {_ar pushBack _cl;};
_n = _n - 1;
};
_c = 0;
{
_cost = ((getText(configfile >> "CfgVehicles" >> _x >> "displayName")) CALL SUPPORTCOST) * 0.7;
if ((lbText [1499,(lbCurSel 1499)]) == "Recon") then {_cost = _cost * 1.3;};
_c = _c + _cost;
} foreach _ar;
_text = format ["Price %1",_c];
_myDisplay = findDisplay 12453;
(_myDisplay displayCtrl 1100) ctrlSetStructuredText parseText _text;
};

SAOKMZCALLIN = {

private ["_typ","_v","_tex","_cl","_n","_cost","_c","_nul","_star","_ar","_copy","_t","_star2","_dt","_aa","_aa2"];
_typ = "";
_v = [];
_tex = "";
_aa = [3];
_aa2 = [];
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_aa pushback 0;_aa2 pushback 0;};
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {_aa pushback 2;_aa2 pushback 2;};
switch (lbText [1499,(lbCurSel 1499)]) do {
case "Armored": {_typ = "b_armor";{_v append (ARMEDTANKS select _x);} foreach _aa;};
case "Light Armored": {_typ = "b_mech_inf";{_v append (ARMEDVEHICLES select _x);} foreach _aa;};
case "Recon": {_typ = "b_recon";{_v append (ARMEDVEHICLES select _x);} foreach _aa;};
case "Anti-Air": {_typ = "b_art";_tex = " AA";{_v append (ARMEDAA select _x);} foreach _aa;};
case "Chopper":  {_typ = "b_air";{_v append (AIRARMCHOP select _x);} foreach _aa;};
case "Plane":  {_typ = "b_plane";{_v append (AIRFIGTHER select _x);} foreach _aa;};
case "Support":  {_typ = "b_support";{_v append (ARMEDSUPPORT select _x);} foreach _aa2;};
case "Mortar": {_typ = "n_mortar";_v =["I_Mortar_01_F"];};
case "Artillery": {_typ = "b_art";_v = ["B_MBT_01_arty_F","B_MBT_01_mlrs_F"];};
};
_n = lbSize 1501 - 1;
_ar = [];
while {_n >= 0} do {
_cl = "";
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 0)+(ARMEDVEHICLES select 0)+(ARMEDAA select 0)+(AIRARMCHOP select 0)+(AIRFIGTHER select 0)+(ARMEDSUPPORT select 0)+["B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
if (_cl == "") then {
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 2)+(ARMEDVEHICLES select 2)+(ARMEDAA select 2)+(AIRARMCHOP select 2)+(AIRFIGTHER select 2)+(ARMEDSUPPORT select 2)+["I_Mortar_01_F"];
};
if (_cl == "") then {
{if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == lbText [1501, _n]) exitWith {_cl = _x;};} foreach (ARMEDTANKS select 3)+(ARMEDVEHICLES select 3)+(ARMEDAA select 3)+(AIRARMCHOP select 3)+(AIRFIGTHER select 3);
};
if (_cl != "") then {_ar pushBack _cl;};
_n = _n - 1;
};
if (count _ar > 0 && {_typ != ""}) then {

_c = 0;
{
_cost = ((getText(configfile >> "CfgVehicles" >> _x >> "displayName")) CALL SUPPORTCOST) * 0.7;
if (_typ == "b_recon") then {_cost = _cost * 1.3;};
_c = _c + _cost;
} foreach _ar;
if (pisteet > _c) then {
pisteet = pisteet - _c;
"Cash" SPAWN SAOKPLAYSOUND;
_nul = [-_c, "Called Platoon"] SPAWN PRESTIGECHANGE;
_copy = + PierMarkers;
_t = [] CALL SAOKSORTPLAYER;
_copy = [_copy,[_t],{_input0 distance getmarkerpos _x},"ASCEND"] call SAOKSORTBY;
if ({getmarkercolor _x == "ColorGreen"} count _copy > 0) then {{if (getmarkercolor _x != "ColorGreen") then {_copy = _copy - [_x];};} foreach _copy;};
_star = [getmarkerpos (_copy select 0),600,100,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_n = [_star, "ColorBlue",_ar,_typ,_tex] CALL AddVehicleZone;
_star2 = [getposATL player,500,100,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];
[_n,(_dt select 3),_star2] SPAWN SAOKFINDROUTEANDMOVE;
} else {(format ["%1 More Prestige Needed",_c - pisteet]) SPAWN HINTSAOK;};
};

};

//["Sheep_random_F","Cock_random_F","Fin_random_F","Alsatian_Random_F","Hen_random_F","Goat_random_F"]
// animal1 = [getposATL player, "Fin_random_F"] CALL SAOKANIMAL;
SAOKBIRDMSF = {
	private ["_crow","_st","_end","_dis","_wp","_time"];
	_crow = _this select 0;
	_st = _this select 1;
	_end = _this select 2;
	_wp = [
	(_st select 0) - 10 + (random 20),
	(_st select 1) - 10 + (random 20),
	20 + random 10
	];
	_dis = _crow distance _wp;
	_time = (_dis);
	_crow camsetpos _wp;
	_crow camcommit _time;
	sleep (1+(random 2));
	_wp = [
	(_end select 0) - 10 + (random 20),
	(_end select 1) - 10 + (random 20),
	(_end select 2) + random 10
	];
	_dis = _crow distance _wp;
	_time = (_dis);
	_crow camsetpos _wp;
	_crow camcommit _time;
};
//[""] SPAWN SAOKSPAWNBIGCAMP;
SAOKFREEMORTAR = {
private ["_start","_c","_n"];
_start = [(vehicle player),5000,2000,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_c = "I_Mortar_01_F";
if (!isNil"IFENABLED") then {_c = "LIB_BM37";};
_n = [_start, "ColorGreen",[_c],"n_mortar"] CALL AddVehicleZone; 
};
//[EAST,_locationA,3000] CALL SAOKZONEVEHICLESNEARBY;
SAOKZONEVEHICLESNEARBY = {
private ["_veh","_vehs","_side","_cen","_rad"];
_side = _this select 0;
_cen = _this select 1;
_rad = _this select 2;
_vehs = [];
{if (_x distance _cen < _rad && {{alive _x && {side _x == _side}} count crew _x > 0} && {!isNil{_x getvariable "ZoneVehi"}}) then {
_veh = _x;
if ({typeof _veh in _x} count ARMEDVEHICLES > 0 || {typeof _veh in _x} count ARMEDTANKS > 0) then {
_vehs pushBack _x;
};
};} foreach vehicles;
_vehs
};

SAOKSPAWNBIGCAMP = {
private ["_start","_d","_st","_pAr","_nul"];
_d = 12000;
sleep 0.1;
_st = [vehicle player, 12000,1000,"(1 - sea)* (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOSAR;
_start = "";
{if ([_x,40] CALL SAOKISFLAT) exitWith {_start = _x;};} foreach (_st select 0);
while {typename _start == "STRING" || {count (_st select 0) == 0} || {surfaceisWater _start} || {!(_start CALL SAOKINMAP)} || { count (nearestLocations [_start, ["PostR","PostG"], 400]) > 0} ||{count (nearestLocations [_start, ["CampB","CampR"], 400]) > 0} || {!([_start,80] CALL SAOKISFLAT)} || {count (_start nearRoads 60) > 0}} do {
sleep 0.1;
if (_d < 15000) then {_d = _d + 300;};
sleep 0.1;
_st = [vehicle player, _d,1000,"(1 - sea)* (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOSAR;
{if ([_x,40] CALL SAOKISFLAT) exitWIth {_start = _x;};} foreach (_st select 0);
sleep 0.2;
};
_pAr = [_start,"",(65+random 25)];
if (count _this > 0) then {_pAr pushBack (_this select 0);};
_nul = _pAr SPAWN CreateRoadBlock;
waitUntil {sleep 0.1; scriptdone _nul};
//player setpos _start;
};

SAOKTASKDIALOG = {
private ["_ok","_myDisplay"];
disableserialization;
_ok = createDialog "TaskDialog"; 
_myDisplay = findDisplay 3992;
{
lbAdd [1500, _x];
} foreach [
"Transport Chopper Duty"
];
};

SAOKTASKLAUNCH = {
switch _this do {
case "Transport Chopper Duty": {[] SPAWN TASK_AirTask1;};
case "Rescue Officer": {["MilitaryTasks\TaskFindOfficer.sqf"] SPAWN SA_TASKM1;};
case "Kill Officer": {["MilitaryTasks\TaskKillOfficer.sqf"] SPAWN SA_TASKM2;};
case "MilitaryTasks\TaskCreateGuardpost.sqf": {["MilitaryTasks\TaskCreateGuardpost.sqf"] SPAWN SA_TASKM3;};
case "MilitaryTasks\TaskConvoy.sqf": {["MilitaryTasks\TaskConvoy.sqf"] SPAWN SA_TASKM4;};
case "MilitaryTasks\TaskZone.sqf": {["MilitaryTasks\TaskZone.sqf"] SPAWN SA_TASKM5;};
case "MilitaryTasks\TaskAttackCamp.sqf": {["MilitaryTasks\TaskAttackCamp.sqf"] SPAWN SA_TASKM6;};
case "MilitaryTasks\TaskGuardRoadBlock.sqf": {["MilitaryTasks\TaskGuardRoadBlock.sqf"] SPAWN SA_TASKM7;};
};
};

SAOKTAKENBOX = {
private ["_xM","_xP","_yM","_yP","_z6","_z3","_yy","_zz","_xx","_size","_bol","_start","_p8","_p7","_p6","_p5","_p4","_p3","_p2","_p1"];
_bol = false;
_start = _this select 0;
_size = if (count _this > 1) then {if (typename (_this select 1) == "STRING") then {((_this select 1) CALL SAOKBSIZE)*0.5} else {(_this select 1)}} else {5};
if (typename _size != "SCALAR") then {hint str (_this select 1);};
_xx = _start select 0;
_yy = _start select 1;
_zz = if (count _start > 2) then {_start select 2} else {0};
_z3 = _zz + 0.3;
_z6 = _zz + 6;
_yP = _yy + _size;
_yM = _yy - _size;
_xP = _xx + _size;
_xM = _xx - _size;
_p1 = ATLtoASL [_xM,_yP,_z3];
_p2 = ATLtoASL [_xM,_yP,_z6];
_p3 = ATLtoASL [_xP,_yP,_z3];
_p4 = ATLtoASL [_xP,_yP,_z6];
_p5 = ATLtoASL [_xM,_yM,_z3];
_p6 = ATLtoASL [_xM,_yM,_z6];
_p7 = ATLtoASL [_xP,_yM,_z3];
_p8 = ATLtoASL [_xP,_yM,_z6];
if (lineIntersects [_p3,_p5] || {lineIntersects [_p3,_p7]} || {lineIntersects [_p5,_p7]} || {lineIntersects [_p1,_p7]} || {lineIntersects [_p1,_p5]} || {lineIntersects [_p1,_p3]} || {lineIntersects [_p1,_p2]} || {lineIntersects [_p3,_p4]} || {lineIntersects [_p5,_p6]} || {lineIntersects [_p7,_p8]}) then {_bol = true;};
_bol
};

SAOKANIMALEVENT2 = {
private ["_s","_sHou","_a","_m","_all","_t","_c","_pos","_e"];
if (true) exitWith {};
if ("SAOKANIMALEVENT2" in CurrentEvents) exitWith {};
CurrentEvents = CurrentEvents + ["SAOKANIMALEVENT2"];
_all = [];
_t = ["Sheep_random_F","Goat_random_F"] call RETURNRANDOM; 
_c = 6 + floor random 9;
_pos = getposATL player;
_s = [(_pos select 0) + 150 - (random 300), (_pos select 1) + 150 - (random 300), 0];
while {_s distance player < 50 || {[_s,player] CALL FUNKTIO_LOSOBJ}} do {_s = [(_pos select 0) + 150 - (random 300), (_pos select 1) + 150 - (random 300), 0]; sleep 0.1;};
_e = [(_pos select 0) + 150 - (random 300), (_pos select 1) + 150 - (random 300), 0];
for "_i" from 0 to _c do {
_sHou = [(_s select 0) + 10 - (random 20), (_s select 1) + 10 - (random 20), 0];
_a = [_sHou, _t] CALL SAOKANIMAL;
_all pushBack _a;
_m = [(_e select 0) + 5 - (random 10), (_e select 1) + 5 - (random 10), 0];
_a domove _m;
sleep 0.1;
};
waitUntil {sleep 5; {_x distance player < 500} count _all == 0};
{_x spawn SAOKDELETE;} foreach _all;
CurrentEvents = CurrentEvents - ["SAOKANIMALEVENT2"];
};

SAOKANIMALEVENT1 = {
private ["_c","_sHou","_waypoints","_building","_t","_a","_xx","_m","_pP","_all","_pos","_time"];
if (true) exitWith {};
if ("SAOKANIMALEVENT1" in CurrentEvents) exitWith {};
CurrentEvents = CurrentEvents + ["SAOKANIMALEVENT1"];
_all = [];
_c = 3 + floor random 6;
_pos = getposATL player;
for "_i" from 0 to _c do {
_c = 0;
_building = objNull;
_sHou = [(_pos select 0) + 100 - (random 200), (_pos select 1) + 100 - (random 200), 0];
_building = nearestBuilding _sHou;
_waypoints = _building call SAOKBUILDINGPOS;
if (count _waypoints > 0) then {
_sHou = _building buildingPos (_waypoints call RETURNRANDOM);
};
_t = ["Fin_random_F","Alsatian_Random_F"] call RETURNRANDOM; 
_a = [_sHou, _t] CALL SAOKANIMAL;
_a setpos _sHou;
_all pushBack _a;
sleep 0.1;
};
_time = time + 120;
while {_pos distance vehicle player < 300 && {_time > time}} do {
sleep (random 3);
_pP = getposATL player;
_c = count _all - 1;
for "_i" from 0 to _c do {
if (random 1 < 0.3) then {
_xx = _all select _i;
_m = [(_pP select 0) + 5 - (random 10), (_pP select 1) + 5 - (random 10), 0];
_xx domove _m;
sleep (random 2);
if ({_x distance player < 20} count _all > 0 && {abs (PSHOT - time) < 5}) exitWith {};
};
sleep 0.1;
};
};
waitUntil {sleep 5; {_x distance player < 400} count _all == 0};
{_x spawn SAOKDELETE;} foreach _all;
CurrentEvents = CurrentEvents - ["SAOKANIMALEVENT1"];
};

SAOKANIMAL = {
private ["_g","_a"];
_g = creategroup civilian;
_a = _g createUnit [_this select 1, _this select 0, [], 0, "NONE"]; 
_a
};

SAOKREMOVEWAYPOINTS = {
private ["_c","_cc"];
_c = waypoints _this;
_cc = count _c;
if (_cc < 1) exitWith {};
for "_i" from _cc to 0 step -1  do {
deleteWaypoint (_c select _i); 
};
};
//acts_CrouchingCoveringRifle01 Acts_starterPistol_fire
SAOKGUNPOINTING = {
private ["_unts","_Lna","_header"];
while {true} do {
  sleep 1;
  _unts = ((getposATL player) nearEntities [["Civilian"],14]);
  if (count _unts > 0) then {
  if (!isNull cursorTarget && {cursorTarget in _unts} && {isNil{cursorTarget getvariable "CivNo"}} && {currentWeapon player != ""} && {(player weaponDirection currentWeapon player) select 2 > -0.4} && {([player, cursorTarget] CALL FUNKTIO_LOS)}) then {
  if (isNil{cursorTarget getvariable "Talki"}) then {
  cursorTarget playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
  cursorTarget setvariable ["Uhkailtu",1];
  if (random 1 < 0.1) then {
	_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
	_header = format ["NATO Soldiers Seen Pointing Guns at Civilians in %1",_Lna];
	[_header, date] CALL SAOKEVENTLOG;
  };
  sleep 5;
  };
  };
  };
 };
};
[] SPAWN SAOKGUNPOINTING;

missionnamespace setvariable ["RandomEvents",[]];
SAOKADDRANDOMEVENTS = {
private ["_b"];
_b = missionnamespace getvariable "RandomEvents";
_b = _b + _this;
missionnamespace setvariable ["RandomEvents",_b];
};

SAOKTRANDOMEVENT = {
private ["_c","_p","_n"];
_c = missionnamespace getvariable "RandomEvents"; 
if (count _c == 0) exitWith {};
_p = _c call RETURNRANDOM; 
while {_p in _c} do {_c = _c - [_p];};
missionnamespace setvariable ["RandomEvents",_c];
switch _p do {
case "CSATBASE1": {_n = [2,30,"CSAT SUN RISING",("CSAT Is Building Fast New Command Center to Unknown Location on "+(format ["%1",worldname]))] SPAWN SAOKCOMINGCHAP;};
case "CSATBASE2": {_n = [6,30,"CSAT EXPANDING",("CSAT Preparing Another Large Post to Unknown Location on "+(format ["%1",worldname]))] SPAWN SAOKCOMINGCHAP;};
case "CSATAIR": {_n = [1,40,"CSAT AIR OPERATION","CSAT Fighters Seen Leaving Stratis"] SPAWN SAOKCOMINGCHAP;};
case "CSATLAND": {_n = [1,45,"CSAT LAND OPERATION",("Unresponding Cargo Ships Heading Towards "+(format ["%1",worldname]))] SPAWN SAOKCOMINGCHAP;};
};
};

SAOKCHAPTEREVENTS = {
private ["_n"];
[((_this)+" STARTED"), date] CALL SAOKEVENTLOG;
switch _this do {
case "CSATBASE1": {_n = [] SPAWN SAOKSPAWNBIGCAMP;["CSATBASE2"] SPAWN SAOKADDRANDOMEVENTS;gameLogic1 globalchat localize "STR_milC1_l3";};
case "CSATBASE2": {_n = [] SPAWN SAOKSPAWNBIGCAMP;gameLogic1 globalchat localize "STR_milC1_l4";};
case "CSAT AIR OPERATION": {
["EAST","P",2] SPAWN SAOKMOREVEHZONES;["EAST","C",2] SPAWN SAOKMOREVEHZONES;
gameLogic1 globalchat localize "STR_milC1_l1";
sleep (120 + random 900);
["EAST","P",2] SPAWN SAOKMOREVEHZONES;["EAST","C",2] SPAWN SAOKMOREVEHZONES;
};
case "CSAT LAND OPERATION": {
["EAST","T",4] SPAWN SAOKMOREVEHZONES;["EAST","V",2] SPAWN SAOKMOREVEHZONES;["EAST","AA",1] SPAWN SAOKMOREVEHZONES;
gameLogic1 globalchat localize "STR_milC1_l2";
sleep (120 + random 900);
["EAST","T",4] SPAWN SAOKMOREVEHZONES;["EAST","V",2] SPAWN SAOKMOREVEHZONES;["EAST","AA",1] SPAWN SAOKMOREVEHZONES;
};
};
};



SAOKTMSKILLUP = {
private ["_unit","_r","_p"];
{
_unit = _x;
_r = 0.3 / DIFLEVEL;
if (random 1 < _r) then {
_p = if (isNil{_unit getvariable "PointSK"}) then {0} else {_unit getvariable "PointSK"};
_unit setvariable ["PointSK",(_p+(1 + (floor random 2)))];
};
} foreach units group player - [player];
};

SAOKSUPTEXT = {
private ["_text","_myDisplay"];
_text = "";
switch _this do {
case "Air Support": {_text = "Autonomous AI support";};
case "Land Support": {_text = "Autonomous, but can also be HighCommanded via Ctrl+Space";};
case "Infantry Support": {_text = "Autonomous, but can also be HighCommanded via Ctrl+Space";};
case "Artillery": {_text = "Use by pressing 0-8";};
case "Gear Drop": {_text = "Paradropped nearby after few minutes";};
case "Support": {_text = "Can be HighCommanded via Ctrl+Space or called by pressing 5-1";};
case "Diversions": {_text = "Nearby enemy vehicles will head away with certain changes";};
case "Vehicles [Para]": {_text = "Paradropped nearby after few minutes";};
case "Teammates [Para]": {_text = "Paradropped nearby and joined automatically";};
case "Undercover": {_text = "Move Undercover exitzone more nearby. You can also exit this mode in any friendly camp";};
case "Transport": {_text = "Be picked after few minutes delay and transported to any wanted location.";};
};
_myDisplay = findDisplay 1235;
(_myDisplay displayCtrl 1101) ctrlSetStructuredText parseText _text;
};

//_unit getvariable "PointSK"
SAOKUNITSELTEXT = {
private ["_unit","_text","_v","_myDisplay"];
_myDisplay = findDisplay 1212;
(_myDisplay displayCtrl 1603) ctrlEnable false;
_unit = player;
{if (_this == name _x) exitWith {_unit = _x;};} foreach units group player;
_text = (name _unit)+"<br/>";
_text = _text + (rank _unit)+"<br/>" +"<br/>";
_text = _text + "SKILLS";
if (!isNil{_unit getvariable "PointSK"}) then {_text = _text + format [" (%1)",_unit getvariable "PointSK"];
if (_unit getvariable "PointSK" > 0) then {(_myDisplay displayCtrl 1603) ctrlEnable true;} else {(_myDisplay displayCtrl 1603) ctrlEnable false;};
};
_text = _text +"<br/>";
{
_v = 100*(_unit skill _x);
_v = [_v,0] CALL BIS_fnc_cutDecimals;
_text = _text + format ["%2: %1",_v, _x] +"<br/>";
} foreach ["General","Commanding","ReloadSpeed","Courage","SpotTime","SpotDistance","Endurance","AimingSpeed","AimingShake","AimingAccuracy"];
(_myDisplay displayCtrl 1100) ctrlSetStructuredText parseText _text;
};

SAOKADDSKILLP = {
private ["_unitN","_skill","_unit","_k","_p"];
_unitN = _this select 0;
_skill = _this select 1;
_unit = player;
{if (_unitN == name _x) exitWith {_unit = _x;};} foreach units group player;
_p = if (!isNil{_unit getvariable "PointSK"}) then {_unit getvariable "PointSK"} else {0};
if (!isPlayer _unit && {_p > 0}) then {
_k = _unit skill _skill;
if (_k + 0.01 <= 1) then {_unit setSkill [_skill, (_k + 0.01)];_p = _p - 1;_unit setvariable ["PointSK",(floor _p)];};
};
};

SAOKWLATEXT = {
private ["_text","_myDisplay","_v","_foreachIndex","_unit","_colors"];
_text = "";
switch _this do {
case "Mod Info": {
_text = _text + "<t size='1.1'>";
_text = _text + "Any mod vehicles and units can be enabled to appear (for AI/Shops/Support) during the mission via Mods-button. Mod gear appears automatically for AI units and in shops. The mods just need to be enabled when starting the game.";
_text = _text + "<br/><br/>Mission can also be played on Sauerland, Reshmaan, Staszow, Napf, Bornholm, Sara (Sahrani), smd_sahrani_a3 (SMD Sahrani), Fallujah, FDF_isle1_a (Podagorsk), Clafghan, Isladuala3, Panthera3, Chernarus and Takistan by renaming pbo file to e.g. WLA.Chernarus.pbo.<br/><br/>Automatic MOD support for RHS Escalation, Chernarus Conflict, The Eridanus Insurrection and Iron Front";
_text = _text + "</t>";
};
case "Legend Forces": {
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_armor","b_armor","n_armor"];
_text = _text + " Armor<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_mech_inf","b_mech_inf","n_mech_inf"];
_text = _text + " Armored Vehicle<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_recon","b_recon","n_recon"];
_text = _text + " Recon<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_air","b_air","n_air"];
_text = _text + " Chopper<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_plane","b_plane","n_plane"];
_text = _text + " Plane<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_unknown"];
_text = _text + " Vehicle Carrier<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_uav","b_uav","n_uav"];
_text = _text + " UAV<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_naval","b_naval","n_naval"];
_text = _text + " Armored Boat<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_art","b_art","n_art"];
_text = _text + " Artillery/Anti-Air<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_mortar","b_mortar","n_mortar"];
_text = _text + " Mortar<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_support","b_support","n_support"];
_text = _text + " Support Truck<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_med","b_med","n_med"];
_text = _text + " Medical<br/>";
};
case "Legend Other": {
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_hq","n_hq"];
_text = _text + " Camp<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_installation","n_installation"];
_text = _text + " Guardpost<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["o_service","n_service"];
_text = _text + " Supply Depot<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["u_installation"];
_text = _text + " Factory or Airfield (Orange)<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["loc_Power"];
_text = _text + " Power Plant<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["loc_Quay"];
_text = _text + " Pier<br/>";
{_text = _text + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach ["n_service"];
_text = _text + " Storage<br/>";
};
case "Hotkeys": {
_text = _text + "<t size='0.9'>";
_text = _text + "Call Mortar/Artillery: SHIFT + 6<br/>";
_text = _text + "Flip Vehicle/Push Boat: SHIFT + 4<br/>";
_text = _text + "Repack Magazines: CTRL + R<br/>";
_text = _text + "Construction View: SHIFT + C<br/>";
_text = _text + "Talk To Civilians/Soldiers: SHIFT + Y<br/>";
_text = _text + "Team Monitoring: SHIFT + 8<br/>";
_text = _text + "Steal Car/Take Objects: Y<br/>";
_text = _text + "Load Crates to Truck: SHIFT + 9<br/>";
_text = _text + "Change to Civ: ALT+Y<br/>";
_text = _text + "(Un)holster pistol (when undercover): CTRL+Y<br/>";
_text = _text + "Toggle 3D Icons/Location Info: Shift+U<br/>";
_text = _text + "Use Fist (when unarmed): U<br/>";
_text = _text + "YELL (To make CSAT surrender, when armed): U<br/><br/>";
_text = _text + "With certain keyboards, use Z instead of Y-key.<br/>";
_text = _text + "See Field-Manual (ESC) or Notes (M) for more info. Also check Important Notes section above.";
_text = _text+ "</t>";
};
case "Important Notes": {
_text = _text + "<t size='1.1'>";
_text = _text + "Mission features an own savegame system with more fluent mission loading and performance resulting. Always save your game in the WLA - menu, clicking 0-0-0 or using the autosave trough WLA-menu options. The ESC-menu, save DON'T create my custom save game file.";
_text = _text + "<br/><br/>To load your mission progress, use reset or play button in the scenarios menu to enter the mission instead of resume. You can then choose to continue your saved overall mission progress at mission start.";
_text = _text+ "<br/><br/>When saving, wait for ""Completed""-hint before exiting the game.</t>";
};
case "Event Log": {
_text = _text + "<t size='1.1'>";
_c = count ((missionnamespace getvariable "EventLog") select 0);
if (_c > 0) then {
_a = ((missionnamespace getvariable "EventLog") select 0) select [0,5];_s = ((missionnamespace getvariable "EventLog") select 0) select [6,_c - 1];
_t = 0;
{
if (_c == count _x) then {
_c = count _x;
if (_s == _x select [6,_c - 1]) then {
_t = _t + 1;
} else {
if (_a != "") then {
if (_t < 2) then {
_text = _text + (_a + " "+ _s) + "<br/>";
} else {
_text = _text + (_a + "-"+(_x select [0,5])+" x"+str _t+" "+ _s) + "<br/>";
};
};
_a = _x select [0,5];_s = _x select [6,_c - 1];_t = 0;};
} else {
_c = count _x;
if (_a != "") then {
if (_t < 2) then {
_text = _text + (_a + " "+ _s) + "<br/>";
} else {
_text = _text + (_a + "-"+(_x select [0,5])+" x"+str _t+" "+ _s) + "<br/>";
};
};_a = _x select [0,5];_s = _x select [6,_c - 1];_t = 0;
};
} foreach (missionnamespace getvariable "EventLog");
_cc = count (missionnamespace getvariable "EventLog") - 1;
if (_a != "") then {
if (_t < 2) then {
_text = _text + (_a + " "+ _s) + "<br/>";
} else {
_text = _text + (_a + "-"+(((missionnamespace getvariable "EventLog") select _cc) select [0,5])+" x"+str _t+" "+ _s) + "<br/>";
};
};
};
_text = _text+ "</t>";
};
case "Team-mates": {
_colors = ["<t color='#0000FF'>","<t color='#00FF00'>","<t color='#990000'>","<t color='#990099'>","<t color='#99FFFF'>","<t color='#CCFF00'>","<t color='#FF0000'>","<t color='#CCFFFF'>","<t color='#FFFF00'>","<t color='#FF0033'>"];
{
_unit = _x;
_text = _text + (rank _x)+" "+(name _x) + " " + "<t size='0.8'>";
{
_v = (_unit skill _x);
_v = [_v,1] CALL BIS_fnc_cutDecimals;
_text = _text + (_colors select _foreachIndex) +format ["%1",_v] +"</t>" +"|";
} foreach ["general","commanding","reloadSpeed","courage","spotTime","spotDistance","endurance","aimingSpeed","aimingShake","aimingAccuracy"];
_text = _text + "</t>" + "<br/>";
} foreach units group player - [player];
_text = _text + "<br/>" + "<t size='0.7'>";
{_text = _text + (_colors select _foreachIndex) + _x+ "</t>" +"|";} foreach ["general","commanding","reloadSpeed","courage","spotTime","spotDistance","endurance","aimingSpeed","aimingShake","aimingAccuracy"];
_text = _text+ "</t>";
};
};
disableserialization;
_myDisplay = findDisplay 32144;
_cont = (_myDisplay displayCtrl 1100);
_cont ctrlSetStructuredText parseText _text;
_n = ctrlTextHeight _cont;
//_nn = (17.5 * GUI_GRID_W);
_pos = ctrlPosition _cont;
_pos set [3, _n];
//_cont ctrlSetPosition [0, 0, _nn, _n];
_cont ctrlSetPosition _pos;
_cont ctrlCommit 0;
};

missionnamespace setvariable ["EventLog",[]];
SAOKEVENTLOG = {
private ["_old","_text","_log","_time","_deAT","_m","_hx","_h"];
_old = (missionnamespace getvariable "EventLog");
if (count _old > 20) then {_deAT = _old deleteAt ((count _old) - 1);};
_text = _this select 0;
_time = _this select 1;
_m = _time select 4;
_hx = 0;
if (_m > 59) then {_m = _m - 60; _hx = 1;};
if (_m < 10) then {_m = "0" + (str _m);};
_h = (_time select 3) + _hx;
if (_h > 23) then {_h = _h - 24;};
if (_h < 10) then {_h = "0"+(str _h);};
_log = (format ["%1:%2 ",_h,_m]) + _text; 
missionnamespace setvariable ["EventLog",(_old+[_log])];
};



//[] SPAWN {_function = missionnamespace getvariable "SAOKCOMINGCHAP";_n = [0,1,"CSAT AIR OPERATION","CSAT Fighters Seen Leaving Stratis"] SPAWN _function;};
SAOKCOMINGCHAP = {
private ["_m","_h","_d","_name","_dateThen","_log"];
_h = _this select 0;
_m = _this select 1;
_name = _this select 2;
_dateThen = date;
_d = 0;
_m = (_dateThen select 4) + _m;
_h = (_dateThen select 3) + _h;
_d = (_dateThen select 2);
if (_m > 59) then {_m = _m - 60;_h = _h + 1;};
if (_h > 23) then {_h = _h - 24;_d = _d + 1;};
_dateThen set [4,_m];
_dateThen set [3,_h];
_dateThen set [2,_d];
missionnamespace setvariable ["ComingChapters",((missionnamespace getvariable "ComingChapters")+[[_name,_dateThen]])];
_log = if (count _this > 3) then {_this select 3} else {("New chapter coming at "+(format ["%1:%2 ",_dateThen select 3,_dateThen select 4]))};
[_log, date] CALL SAOKEVENTLOG;
};

SAOKTRIGGETCHAP = {
private ["_ar","_t","_forEachIndex","_deAT"];
_ar = (missionnamespace getvariable "ComingChapters");
{
_t = _x select 1;
if (dateToNumber date > dateToNumber _t) exitWith {
(_x select 0) SPAWN SAOKCHAPTERADD;
_deAT = _ar deleteAt _forEachIndex;
missionnamespace setvariable ["ComingChapters",_ar];
};
} foreach _ar;
};

SAOKCL1 = {
private ["_t","_nameA","_f"];
_t = getText(configfile >> (_this select 0) >> (_this select 1) >> "displayName");
_nameA = toArray (_this select 1);
if (count _nameA > 1) then {
_f = [_nameA select 0, _nameA select 1];
_f = toString _f;
if (_f in ["B_","I_","O_","b_","i_","o_"]) then {
_nameA = toArray _f;
_f = [_nameA select 0];
_f = toString _f;
_t = _t + " ("+_f+")";
};
};
_t
};

SA_TASK1 = compile preprocessfileLineNumbers "VillageTasks\TaskFindRes.sqf";
SA_TASK2 = compile preprocessfileLineNumbers "VillageTasks\TaskCrate.sqf";
SA_TASK3 = compile preprocessfileLineNumbers "VillageTasks\TaskWater.sqf";
SA_TASK4 = compile preprocessfileLineNumbers "VillageTasks\TaskCivPOW.sqf";
SA_TASK5 = compile preprocessfileLineNumbers "VillageTasks\TaskEscort.sqf";
SA_TASK6 = compile preprocessfileLineNumbers "VillageTasks\TaskRepair.sqf";
SA_TASK7 = compile preprocessfileLineNumbers "VillageTasks\TaskFortress.sqf";
SA_TASK8 = compile preprocessfileLineNumbers "VillageTasks\TaskGuardPost.sqf";


SA_TASKM1 = compile preprocessfileLineNumbers "MilitaryTasks\TaskFindOfficer.sqf";
SA_TASKM2 = compile preprocessfileLineNumbers "MilitaryTasks\TaskKillOfficer.sqf";
SA_TASKM3 = compile preprocessfileLineNumbers "MilitaryTasks\TaskCreateGuardpost.sqf";
SA_TASKM4 = compile preprocessfileLineNumbers "MilitaryTasks\TaskConvoy.sqf";
SA_TASKM5 = compile preprocessfileLineNumbers "MilitaryTasks\TaskZone.sqf";
SA_TASKM6 = compile preprocessfileLineNumbers "MilitaryTasks\TaskAttackCamp.sqf";
SA_TASKM7 = compile preprocessfileLineNumbers "MilitaryTasks\TaskGuardRoadBlock.sqf";

SA_TASKP1 = compile preprocessfileLineNumbers "PowInfo\InfoNothing.sqf";
SA_TASKP2 = compile preprocessfileLineNumbers "PowInfo\InfoCrate.sqf";
SA_TASKP3 = compile preprocessfileLineNumbers "PowInfo\InfoNothing.sqf";

SA_TASKS1 = compile preprocessfileLineNumbers "MainTasks\BrokenTruck.sqf";
SA_TASKS2 = compile preprocessfileLineNumbers "MainTasks\HiddenEnemyVeh.sqf";
SA_TASKS3 = compile preprocessfileLineNumbers "MainTasks\AAVehicle.sqf";

SAOKSTARTTASK = {

private ["_n"];
switch (_this select 0) do {
case "MainTasks\BrokenTruck.sqf": {_n = ["MainTasks\BrokenTruck.sqf"] SPAWN SA_TASKS1;waitUntil {sleep 30; scriptdone _n};};
case "MainTasks\HiddenEnemyVeh.sqf": {_n = ["MainTasks\HiddenEnemyVeh.sqf"] SPAWN SA_TASKS2;waitUntil {sleep 30; scriptdone _n};};
case "MainTasks\AAVehicle.sqf": {_n = ["MainTasks\AAVehicle.sqf"] SPAWN SA_TASKS3;waitUntil {sleep 30; scriptdone _n};};

case "PowInfo\InfoNothing.sqf": {["PowInfo\InfoNothing.sqf"] SPAWN SA_TASKP1;};
case "PowInfo\InfoCrate.sqf": {["PowInfo\InfoCrate.sqf"] SPAWN SA_TASKP2;};
case "PowInfo\InfoDepot.sqf": {["PowInfo\InfoDepot.sqf"] SPAWN SA_TASKP3;};

case "MilitaryTasks\TaskFindOfficer.sqf": {["MilitaryTasks\TaskFindOfficer.sqf"] SPAWN SA_TASKM1;};
case "MilitaryTasks\TaskKillOfficer.sqf": {["MilitaryTasks\TaskKillOfficer.sqf"] SPAWN SA_TASKM2;};
case "MilitaryTasks\TaskCreateGuardpost.sqf": {["MilitaryTasks\TaskCreateGuardpost.sqf"] SPAWN SA_TASKM3;};
case "MilitaryTasks\TaskConvoy.sqf": {["MilitaryTasks\TaskConvoy.sqf"] SPAWN SA_TASKM4;};
case "MilitaryTasks\TaskZone.sqf": {["MilitaryTasks\TaskZone.sqf"] SPAWN SA_TASKM5;};
case "MilitaryTasks\TaskAttackCamp.sqf": {["MilitaryTasks\TaskAttackCamp.sqf"] SPAWN SA_TASKM6;};
case "MilitaryTasks\TaskGuardRoadBlock.sqf": {["MilitaryTasks\TaskGuardRoadBlock.sqf"] SPAWN SA_TASKM7;};

case "VillageTasks\TaskFindRes.sqf": {[] SPAWN SA_TASK1;};
case "VillageTasks\TaskCrate.sqf": {["VillageTasks\TaskCrate.sqf"] SPAWN SA_TASK2;};
case "VillageTasks\TaskWater.sqf": {["VillageTasks\TaskWater.sqf"] SPAWN SA_TASK3;};
case "VillageTasks\TaskCivPOW.sqf": {["VillageTasks\TaskCivPOW.sqf"] SPAWN SA_TASK4;};
case "VillageTasks\TaskEscort.sqf": {["VillageTasks\TaskEscort.sqf"] SPAWN SA_TASK5;};
case "VillageTasks\TaskRepair.sqf": {["VillageTasks\TaskRepair.sqf"] SPAWN SA_TASK6;};
case "VillageTasks\TaskFortress.sqf": {["VillageTasks\TaskFortress.sqf"] SPAWN SA_TASK7;};
case "VillageTasks\TaskGuardPost.sqf": {["VillageTasks\TaskGuardPost.sqf"] SPAWN SA_TASK8;};
};
};



if (isClass(configFile >> "cfgSounds" >> "cow1")) then {
SAOKANIMALVOICES = {
private ["_f"];
_f = {
private ["_animal","_c","_listA","_voice"];
_listA = (getposATL player) nearEntities [["Fin_random_F","Alsatian_Random_F","Sheep_random_F","Cock_random_F","Goat_random_F"],35];
_c = count _listA - 1;
if (_c < 0) exitWith {};
for "_i" from 0 to _c do {
_animal = _listA select _i;
if (player distance _animal < 10 && {random 1 < 0.2}) then {
_voice = ["barking1","barking1","barking2","barking3","barking4","barking5"] call BIS_fnc_selectRandom;
if (typeof _animal iskindof "WildBoar") then {_voice = ["boar1","boar1","boar2","boar3","boar4"] call BIS_fnc_selectRandom;};
if (typeof _animal iskindof "Cock_random_F") then {_voice = ["Chicken1","Rooster1","Rooster2","Rooster3","Rooster4","Rooster5"] call BIS_fnc_selectRandom;};
if (typeof _animal iskindof "Sheep_random_F" || {typeof _animal iskindof "Goat_random_F"} || {typeof _animal iskindof "Sheep"} || {typeof _animal iskindof "Goat"}) then {_voice = ["Goat1","Goat2","Goat3","Goat4","Goat5","Goat6","Goat7"] call BIS_fnc_selectRandom;};
_voice = [_animal, _voice] CALL FUNKTIO_ECHO;
//player say3d "Goat1";
if (alive player) then {_animal say3d _voice;};
}; 
sleep (random 0.5);
};
};
while {true} do {
sleep (3+random 5);
if (vehicle player == player) then {
[] SPAWN _f;
};
};
};
[] SPAWN SAOKANIMALVOICES;
};

//["EAST","A",7] SPAWN SAOKMOREVEHZONES;

SAOKMOREVEHZONES = {
private ["_vB","_vA","_atyp","_side","_type","_amount","_center","_center2","_c","_m","_star","_n","_ar"];
_side = _this select 0;
_type = _this select 1;
_amount = _this select 2;
_center2 = if (count _this > 3) then {_this select 3} else {getposATL vehicle player};
_vA = 10000;_vB = 2000;
if (count _this > 3) then {_vA = 500;_vB = 40;};
_c = "H";
switch (_side) do {
case "WEST": {_c = "U"};
case "Green": {_c = "N";};
case "RES": {_c = "L";};
};
//_center
_atyp = "(1 + meadow) * (1 - sea)";
if (_type in ["P","C","B"]) then {_atyp = "(1 + sea)";};
_center = [_center2,_vA,_vB,_atyp] CALL SAOKSEEKPOS;
if (_type in ["P","C","B"]) then {
while {!surfaceisWater _center} do {sleep 0.1;_center = [_center2,_vA,_vB,_atyp] CALL SAOKSEEKPOS;};
} else {
while {surfaceisWater _center} do {sleep 0.1;_center = [_center2,_vA,_vB,_atyp] CALL SAOKSEEKPOS;};
};
_m = _amount * 500;
while {_amount > 0} do {
sleep 0.1;
_amount = _amount - 1;
_star = [_center,_m,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_ar = [_c,_type,_star];
if (count _this > 4) then {_ar = _ar + ["NOMOVE"];};
_n = _ar CALL CVZ;
};
};

SAOKMOREVEHZONESC = {
private ["_vB","_vA","_atyp","_side","_type","_amount","_center","_center2","_c","_m","_star","_n","_ar","_zones"];
_side = _this select 0;
_type = _this select 1;
_amount = _this select 2;
_center2 = if (count _this > 3) then {_this select 3} else {getposATL vehicle player};
_vA = 10000;_vB = 2000;
if (count _this > 3) then {_vA = 500;_vB = 40;};
_c = "H";
switch (_side) do {
case "WEST": {_c = "U"};
case "Green": {_c = "N";};
case "RES": {_c = "L";};
};
//_center
_atyp = "(1 + meadow) * (1 - sea)";
if (_type in ["P","C","B"]) then {_atyp = "(1 + sea)";};
_center = [_center2,_vA,_vB,_atyp] CALL SAOKSEEKPOS;
if (_type in ["P","C","B"]) then {
while {!surfaceisWater _center} do {sleep 0.1;_center = [_center2,_vA,_vB,_atyp] CALL SAOKSEEKPOS;};
} else {
while {surfaceisWater _center} do {sleep 0.1;_center = [_center2,_vA,_vB,_atyp] CALL SAOKSEEKPOS;};
};
_m = _amount * 500;
_zones = [];
while {_amount > 0} do {
sleep 0.1;
_amount = _amount - 1;
_star = [_center,_m,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
_ar = [_c,_type,_star];
if (count _this > 4) then {_ar = _ar + ["NOMOVE"];};
_n = _ar CALL CVZC;
_zones pushBack _n;
};
_zones
};


SAOKRETURNDEFENSES = {
private ["_t","_g","_u","_post"];
_t = "";
_g = [];
_u = [0,0];
{_g pushBack (_x getvariable "Post");} foreach (nearestLocations [_this, ["PostG"], 500]);
{
_post = _x;
_u set [0, (_u select 0)+(count (_post getvariable "StaticW"))];
{
if (!isNil{_post getvariable _x}) then {_u set [1, (_u select 1)+1];};
} foreach ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"];
} foreach _g;
_cg = count _g;
if (_cg > 0) then {
if (_cg == 1) then {_t = _t + format [" %1 Post<br/>(",_cg];} else {
_t = _t + format [" %1 Posts<br/>(",_cg];
};
};
if ((_u select 0) == 0 && {(_u select 1) == 0}) then {_t = "Low";};
if ((_u select 0) > 0) then {_t = _t + format ["%1 Static",(_u select 0)];};
if ((_u select 0) > 0 && {(_u select 1) > 0}) then {_t = _t + "|";};
if ((_u select 1) > 0) then {_t = _t + format ["%1 Men",(_u select 1)];};
if ((_u select 0) > 0 || {(_u select 1) > 0}) then {_t = _t + ")";};
_t
};

SAOKISCAMPDANGER = {
private ["_bol","_mar"];
_bol = false; 
_mar = format ["Camp%1",_this];
if (_mar in allMapMarkers) then {_bol = true;};
_bol
};

SAOKISCAMPOK = {
private ["_camp","_c","_n"];
_c = count _this - 1;
if (_c < 0) exitWith {};
_n = (missionnamespace getvariable "SaOkCautionCamps");
for "_i" from 0 to _c do {
_camp = _this select _i;
if ({(_x getvariable "Mcolor") == "ColorRed" && {!((_x getvariable "Mtype") in ["o_naval","o_art","o_mortar"])} && {locationposition _x distance getmarkerpos _camp < 1000}} count VEHZONESA == 0) then {deletemarker _camp;_n = _n - [_camp];};
sleep 0.1;
};
missionnamespace setvariable ["SaOkCautionCamps",_n];
};

// (missionnamespace getvariable "SaOkCautionCamps") SPAWN SAOKISCAMPOK;
missionnamespace setvariable ["SaOkCautionCamps",[]];
SAOKCAMPSINDANGER = {
private ["_c","_m","_mar","_mar2"];
_c = count _this - 1;
if (_c < 0) exitWith {};
for "_i" from 0 to _c do {
_m = _this select _i;
_mar = format ["Camp%1",_m];
if !(_mar in allMapMarkers) then {
_mar2 = createMarker [_mar,getmarkerpos _m];
_mar2 setMarkerShape "ELLIPSE";
_mar2 setMarkerAlpha 0.25;
_mar2 setMarkerBrush "SolidBorder";
_mar2 setMarkerSize [1000,1000];
_mar2 setMarkerDir 0;
_mar2 setMarkerText "";
_mar2 setMarkerColor "ColorOrange"; 
missionnamespace setvariable ["SaOkCautionCamps",((missionnamespace getvariable "SaOkCautionCamps") + [_mar])];
};
sleep 0.1;
};
};

//["WEST","P",4] SPAWN SAOKMOREVEHZONES;["WEST","C",4] SPAWN SAOKMOREVEHZONES;["WEST","T",4] SPAWN SAOKMOREVEHZONES;["WEST","T",4] SPAWN SAOKMOREVEHZONES;[""] SPAWN SAOKCSATTOWARDCAMP; [] SPAWN SAOKCSATTOWARDCAMP;
SAOKNOTCSATFACTORY = {

private ["_Mp","_nGp","_ar"];
_ar = [];
{_Mp = getmarkerpos _x; _nGp = ([_Mp] CALL NearestGuardPost); if (!isNil{_nGp getvariable "Gmark"} && {(getmarkercolor (_nGp getvariable "Gmark")) == "ColorRed"} && {_nGp distance _Mp < 150}) then {} else {
if (_Mp distance locationposition (["ColorRed",_Mp] CALL NEARESTCAMP) < _Mp distance locationposition (["ColorBlue",_Mp] CALL NEARESTCAMP)) then {
_ar set [count _ar, _x];
};
};} foreach FacMarkers;
_ar
};

SAOKCSATFACTORIES = {
private ["_Mp","_nGp","_ar"];
_ar = [];
{_Mp = getmarkerpos _x; _nGp = ([_Mp] CALL NearestGuardPost); if (!isNil{_nGp getvariable "Gmark"} && {(getmarkercolor (_nGp getvariable "Gmark")) == "ColorRed"} && {_nGp distance _Mp < 150}) then {_ar pushBack _x;};} foreach FacMarkers;
_ar
};

SAOKCSATTAKEFACTORY = {
private ["_nul","_d","_start","_s","_b","_xx","_mP","_max","_p","_tar","_wp","_ma","_t","_c","_ar","_er"];
_ar = [] CALL SAOKNOTCSATFACTORY;
_er = [];
_b = 0;
if (count _ar > 0) then {
_c = count _ar - 1; 
for "_i" from 0 to _c do {
_xx = _ar select _i;
_mP = getmarkerpos _xx;
if ({_mP distance locationposition _x < 500 && {(_x getvariable "Mcolor") == "ColorRed"}} count VEHZONESA > 0) then {
if (getmarkercolor _xx  == "ColorGreen") then {
if (({_xx == _x select 0} count AMBbattles == 0) && {count AMBbattles < 3}) then {
_nul = [_xx] SPAWN FDefendFactory;AMBbattles pushBack [_xx,"FDefendFactory"];
};
} else {
if ({_mP distance locationposition _x < 500 && {(_x getvariable "Mcolor") in ["ColorBlue","ColorGreen"]}} count VEHZONESA == 0 && {_mP distance ([_mP,"ColorRed"] CALL NEARESTGUARDPOST) > 400}) then {
_start = [getmarkerpos _xx, 100,0,"(1 - sea) * (1 + meadow)* (1 - hills)",150] CALL SAOKSEEKPOS;
_d = 100;
_s = (15+random 25);
sleep 0.1;
while {!([_start,_s] CALL SAOKISFLAT)} do {
_d = _d + 2;
_start = [getmarkerpos _xx, _d,0,"(1 - sea) * (1 + meadow)* (1 - hills)",150] CALL SAOKSEEKPOS;
sleep 0.2;
};
_nul = [_start,"",_s] SPAWN CreateRoadBlock;
};
};
_b = 1;} else {_er pushBack _xx;};
};
if (_b == 0 && {count _er > 0}) then {
_t = 0;
_ma = 0;
while {_ma < 5} do {
_ma = _ma + 1;
_p = VEHZONES call RETURNRANDOM; 
_max = 0;
while {_max < 7 && {((_p getvariable "Mcolor") != "ColorRed" || {(_p getvariable "Mtype") in ["o_naval","o_art","o_mortar"]}) || {_p call SAOKVZMOVING}}} do {sleep 0.1;_max = _max + 1; _p = VEHZONES call RETURNRANDOM;};
if (_max < 7) then {
_tar = _er call RETURNRANDOM;  
_wp = [getmarkerpos _tar,300,40,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;  
[_p,["o_air","o_uav","o_plane"],_wp] SPAWN SAOKFINDROUTEANDMOVE;
};
sleep 0.1;
};

};
};
};
//[_p,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
SAOKFINDROUTEANDMOVE = {
private ["_p","_dt","_wp","_carrier","_bol"];
_p = _this select 0;
_dt = _this select 1;
_wp = _this select 2;
if (!isNil{_p getvariable "WAITCAR"}) exitWith {};
_bol = isNil{_p getvariable "ACTIVE"};
if (_bol && {{[_x, (_p getvariable "Mtype")] call SAOKINSTRING} count ["_armor","_mech","_recon","_art"] > 0} && {locationposition _p distance _wp > 4000} && {{(_p getvariable "Mcolor") == (_x getvariable "Mcolor") && {isNil{_x getvariable "ACTIVE"}}} count CARRYZONES > 0}) exitWith {
_carrier = "";
{if ((_p getvariable "Mcolor") == (_x getvariable "Mcolor") && {isNil{_x getvariable "ACTIVE"}} && {typename _carrier == "STRING" || {_x distance _p < _carrier distance _p}}) exitWith {_carrier = _x;};} foreach CARRYZONES;
if (typename _carrier != "STRING") then {
[_carrier, _p, _wp] SPAWN SAOKCARRY;
};
};
if (_p call SAOKVZMOVING) exitWith {};
if (isNil"_wp" || {typename _wp != "ARRAY"} || {count _wp < 2} || {_wp distance [0,0,0] < 40}) exitWith {};
if ((_p getvariable "Mtype") in _dt || {["AIR", (_p getvariable "Mtext")] call SAOKINSTRING} || {(!(["naval", (_p getvariable "Mtext")] call SAOKINSTRING) && {!([locationposition _p,_wp] CALL SAOKWATERBETWEEN)})}) then {
[_p, _wp] SPAWN ZoneMove;
} else {
if (!isNull _p && {!((_p getvariable "IDCODE") in WAITSTOMOVE)} && {!(surfaceiswater _wp)}) then {[_p, _wp] SPAWN SAOKASTARM;};
/*
_ap = getmarkerpos "Help1";
_ap = [(_ap select 0)+200 - random 400, (_ap select 1)+200 - random 400,0];
_ap2 = getmarkerpos "Help2";
_ap2 = [(_ap2 select 0)+200 - random 400, (_ap2 select 1)+200 - random 400,0];
sleep 0.1;
_done = 0;
if (_done == 0 && {{_x distance _ap > _x distance _ap2} count [getmarkerpos _p,_wp] == 0} && {!([getmarkerpos _p,_ap] CALL SAOKWATERBETWEEN)} && {!([_wp,_ap] CALL SAOKWATERBETWEEN)}) then {
[_p, _ap] SPAWN ZoneMove;sleep 0.2;
[_p, _wp] SPAWN ZoneMove;
_done = 1;
}; 
if (_done == 0 && {!([getmarkerpos _p,_ap] CALL SAOKWATERBETWEEN)} && {!([_wp,_ap2] CALL SAOKWATERBETWEEN)}) then {
[_p, _ap] SPAWN ZoneMove;sleep 0.2;
[_p, _ap2] SPAWN ZoneMove;sleep 0.2;
[_p, _wp] SPAWN ZoneMove;
_done = 1;
}; 
sleep 0.1;
if (_done == 0 && {!([getmarkerpos _p,_ap2] CALL SAOKWATERBETWEEN)} && {!([_wp,_ap] CALL SAOKWATERBETWEEN)}) then {
[_p, _ap2] SPAWN ZoneMove;sleep 0.2;
[_p, _ap] SPAWN ZoneMove;sleep 0.2;
[_p, _wp] SPAWN ZoneMove;
_done = 1;
}; 
if (_done == 0 && {getmarkerpos "Help5" distance _x < 2000} count [getmarkerpos _p,_wp] > 0) then {
_done = 1;
//ALL WEST SIDE
if ({_ap2 distance _x > _ap distance _x} count [getmarkerpos _p,_wp] == 0) then {
_ap = getmarkerpos "Help5";
_ap = [(_ap select 0)+50 - random 100, (_ap select 1)+50 - random 100,0];
_ap2 = getmarkerpos "Help3";
_ap2 = [(_ap2 select 0)+200 - random 400, (_ap2 select 1)+200 - random 400,0];
if (getmarkerpos _p distance _ap < _wp distance _ap) then {
if ([getmarkerpos _p,_ap2] CALL SAOKWATERBETWEEN && {!([_wp,_ap] CALL SAOKWATERBETWEEN)}) then {
[_p, _ap] SPAWN ZoneMove;sleep 0.2;
[_p, _ap2] SPAWN ZoneMove;
} else {[_p, _ap2] SPAWN ZoneMove;};
} else {
[_p, _ap2] SPAWN ZoneMove;sleep 0.2;
[_p, _ap] SPAWN ZoneMove;
};
} else {
_ap = getmarkerpos "Help1";
_ap = [(_ap select 0)+200 - random 400, (_ap select 1)+200 - random 400,0];
_ap2 = getmarkerpos "Help2";
_ap2 = [(_ap2 select 0)+200 - random 400, (_ap2 select 1)+200 - random 400,0];
_ap3 = getmarkerpos "Help3";
_ap3 = [(_ap2 select 0)+100 - random 200, (_ap2 select 1)+100 - random 200,0];
if (!([getmarkerpos _p,_ap] CALL SAOKWATERBETWEEN) && {!([_wp,_ap2] CALL SAOKWATERBETWEEN)}) then {
[_p, _ap] SPAWN ZoneMove;sleep 0.2;
[_p, _ap2] SPAWN ZoneMove;sleep 0.2;
[_p, _ap3] SPAWN ZoneMove;
}; 
};
};
if (_done == 0 && {getmarkerpos "Help4" distance _x < 2000} count [getmarkerpos _p,_wp] > 0) then {
//ALL WEST SIDE
if ({_ap2 distance _x > _ap distance _x} count [getmarkerpos _p,_wp] == 0) then {
_ap = getmarkerpos "Help4";
_ap = [(_ap select 0)+50 - random 100, (_ap select 1)+50 - random 100,0];
_ap2 = getmarkerpos "Help3";
_ap2 = [(_ap2 select 0)+200 - random 400, (_ap2 select 1)+200 - random 400,0];
if (getmarkerpos _p distance _ap < _wp distance _ap) then {
if ([getmarkerpos _p,_ap2] CALL SAOKWATERBETWEEN && {!([_wp,_ap] CALL SAOKWATERBETWEEN)}) then {
[_p, _ap] SPAWN ZoneMove;sleep 0.2;
[_p, _ap2] SPAWN ZoneMove;
} else {[_p, _ap2] SPAWN ZoneMove;};
} else {
[_p, _ap2] SPAWN ZoneMove;sleep 0.2;
[_p, _ap] SPAWN ZoneMove;
};
} else {
_ap = getmarkerpos "Help1";
_ap = [(_ap select 0)+200 - random 400, (_ap select 1)+200 - random 400,0];
_ap2 = getmarkerpos "Help2";
_ap2 = [(_ap2 select 0)+200 - random 400, (_ap2 select 1)+200 - random 400,0];
_ap3 = getmarkerpos "Help3";
_ap3 = [(_ap2 select 0)+100 - random 200, (_ap2 select 1)+100 - random 200,0];
if (!([getmarkerpos _p,_ap] CALL SAOKWATERBETWEEN) && {!([_wp,_ap2] CALL SAOKWATERBETWEEN)}) then {
[_p, _ap] SPAWN ZoneMove;sleep 0.2;
[_p, _ap2] SPAWN ZoneMove;sleep 0.2;
[_p, _ap3] SPAWN ZoneMove;
}; 
};
};
*/
};
};

SAOKNEARVZNUM = {
private ["_cen","_col","_count","_type","_nearbyLocations"];
_cen = _this select 0;
if (typename _cen == "STRING") then {_cen = locationposition (_this select 0);};
_col = _this select 1;
_nearbyLocations = nearestLocations [_cen,["Name"], 1000];
if (count _this == 2) then {
_count = {!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == _col}} count _nearbyLocations;
} else {
_type = _this select 2;
if (typename _type == "STRING") then {
_count = {!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == _col} && {(_x getvariable "Mtext") == _type}} count _nearbyLocations;
} else {
_count = {!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == _col} && {(_x getvariable "Mtext") in _type}} count _nearbyLocations;
};
};
_count
};

SAOKFARVZ = {
private ["_cen","_col","_count","_type","_nearbyLocations"];
_cen = _this select 0;
if (typename _cen == "STRING") then {_cen = getmarkerpos (_this select 0);};
_col = _this select 1;
_count = [];
_nearbyLocations = nearestLocations [_cen,["Name"], 5000];
if (count _this == 2) then {
{if (!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == _col}) then {_count pushback _x};} foreach _nearbyLocations;
} else {
_type = _this select 2;
if (typename _type == "STRING") then {
{if (!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == _col} && {(_x getvariable "Mtext") == _type}) then {_count pushback _x};} foreach _nearbyLocations;
} else {
{if (!isNil{_x getvariable "VZ"} && {(_x getvariable "Mcolor") == _col} && {(_x getvariable "Mtext") in _type}) then {_count pushback _x};} foreach _nearbyLocations;
};
};
_count
};
// {if (_x call SAOKVZMOVING) then {_x call SAOKVZMOVESTOP;};} foreach VEHZONESA;

SAOKVZMOVESTOP = {
private ["_n"];
_n = _this CALL SAOKZONEM;
};

SAOKVZMOVING = {
private ["_bol"];
_bol = true; 
if !((_this getvariable "IDCODE") in WAITSTOMOVE) then {
if (count (_this CALL SAOKZONEMW) == 0) then {_bol = false;};
};
_bol
};

SAOKOUTOFMAP = {
private ["_bol"];
_bol = false;
if ({_x > SAOKMAPSIZE || {_x < 0}} count _this > 0) then {_bol = true;};
_bol
};
SAOKBISCHECK = {
private ["_bol","_a","_s"];
_bol = false;
_a = toArray (str _this);
if (count _a > 2) then {_s = toString [_a select 0,_a select 1,_a select 2];if (_s == "BIS") then {_bol = true;};};
_bol
};

SAOKNUMTOROMAN = {
private ["_num","_a"];
_num = _this;
_a = "";
while {_num > 1000} do {_num = _num - 1000; _a = _a + "M";};
while {_num > 500} do {_num = _num - 500; _a = _a + "D";};
while {_num > 100} do {_num = _num - 100; _a = _a + "C";};
while {_num > 50} do {_num = _num - 50; _a = _a + "L";};
while {_num > 10} do {_num = _num - 10; _a = _a + "X";};
switch _num do {
case 1: {_num = "I";};
case 2: {_num = "II";};
case 3: {_num = "III";};
case 4: {_num = "IV";};
case 5: {_num = "V";};
case 6: {_num = "VI";};
case 7: {_num = "VII";};
case 8: {_num = "VIII";};
case 9: {_num = "IX";};
case 10: {_num = "X";};
};
_num = _a + _num;
_num
};

SAOKCHAPTERHINT = {
private ["_disp"];
78 cutRsc ["MyRscTitle10","PLAIN"];
disableSerialization;
_disp = uiNamespace getVariable "d10_MyRscTitle";
(_disp displayCtrl 310) ctrlSetStructuredText parseText ("<t color='#990000'>"+_this+"</t>");
};

SAOKCHAPTERADD = {
private ["_ar","_text"];
_ar = missionnamespace getvariable "SaOkChapters";
if (_this in _ar) exitWith {};
_ar pushBack _this;
_this SPAWN SAOKCHAPTEREVENTS;
missionnamespace setvariable ["SaOkChapters", _ar];
_text = format ["Chapter %1 %2", (count _ar) call SAOKNUMTOROMAN,_this];
_text SPAWN SAOKCHAPTERHINT;
};

SAOKMODTEMP = {
NORANWEES = nil;
IFENABLED = nil;
IFSOVIET = nil;
RHSENABLED = nil;
SPECOPSENABLED = nil;
CheConf = nil;
Eridanus = nil;
lbClear 1503;
lbAdd [1503, "Recon"];
lbSetPicture [1503,0,"\A3\ui_f\data\map\markers\nato\b_recon.paa"];
lbSetTooltip [1503,0,"Lead 5 men team equipped with rifle silencers"];
lbAdd [1503, "Standard"];
lbSetPicture [1503,1,"\A3\ui_f\data\map\markers\nato\b_inf.paa"];
lbSetTooltip [1503,1,"Receive 3 extra men after reaching the LZ"];
lbAdd [1503, "Undercover"];
lbSetPicture [1503,2,"\A3\ui_f\data\map\markers\nato\n_unknown.paa"];
lbSetTooltip [1503,2,"Begin the operation alone as civilian dressed local from random land location"];
if (isClass(configFile >> "cfgWeapons" >> "U_PMC_GTShirt_DJeans")) then {
lbAdd [1503, "PMC Team"];
lbSetPicture [1503,4,"\A3\ui_f\data\map\markers\nato\n_inf.paa"];
lbSetTooltip [1503,4,"Lead Private Military Company Team"];
};
if !(isClass(configFile >> "cfgWeapons" >> "U_PMC_GTShirt_DJeans")) then {lbSetCurSel [1503, 0];} else {lbSetCurSel [1503, 2];};
lbClear 1504;
lbAdd [1504, "Chopper"];
lbSetPicture [1504,0,"\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa"];
lbSetTooltip [1504,0,"Your team is inserted to green marked location by chopper"];
if ((worldname CALL SAOKMAPDATA) select 6) then {
lbAdd [1504, "Boat"];
lbSetPicture [1504,1,"\A3\boat_f\Boat_Armed_01\data\ui\Boat_Armed_01_minigun.paa"];
lbSetTooltip [1504,1,"Your team begin in armed boat from blue marked location"];
lbAdd [1504, "Random"];
lbSetPicture [1504,2,"\A3\ui_f\data\map\markers\handdrawn\unknown_CA.paa"];
lbSetTooltip [1504,2,"Mission begin randomly with chopper or boat insertion"];
};
lbSetCurSel [1504, 0];
CRATECLAS = [
["Box_NATO_Ammo_F","Box_NATO_Wps_F","Box_NATO_Grenades_F","Box_NATO_WpsLaunch_F","Box_NATO_AmmoOrd_F","Box_NATO_WpsSpecial_F"]
,["Box_East_Grenades_F","Box_East_AmmoOrd_F","Box_East_Ammo_F","Box_East_WpsSpecial_F","Box_East_Wps_F"]
,["Box_IND_Ammo_F","Box_IND_Wps_F","Box_IND_Grenades_F","Box_IND_WpsLaunch_F","Box_IND_AmmoOrd_F","Box_IND_WpsSpecial_F"]
,["Box_FIA_Ammo_F","Box_FIA_Wps_F","Box_FIA_Support_F"]
];
CIVS1 = ["C_man_p_fugitive_F_afro","C_man_p_beggar_F_afro","C_man_polo_1_F_afro","C_man_polo_2_F_afro","C_man_polo_3_F_afro","C_man_polo_4_F_afro","C_man_polo_5_F_afro","C_man_polo_6_F_afro","C_man_shorts_1_F_afro","C_man_p_shorts_1_F_afro","C_man_shorts_2_F_afro","C_man_shorts_3_F_afro","C_man_shorts_4_F_afro","C_man_p_beggar_F_asia","C_man_polo_1_F_asia","C_man_polo_2_F_asia","C_man_polo_3_F_asia","C_man_polo_4_F_asia","C_man_polo_5_F_asia","C_man_polo_6_F_asia","C_man_shorts_1_F_asia","C_man_p_fugitive_F_asia","C_man_p_shorts_1_F_asia","C_man_shorts_2_F_asia","C_man_shorts_3_F_asia","C_man_shorts_4_F_asia","C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F","C_Nikos","C_Orestes","C_man_p_beggar_F_euro","C_man_polo_1_F_euro","C_man_polo_2_F_euro","C_man_polo_3_F_euro","C_man_polo_4_F_euro","C_man_polo_5_F_euro","C_man_polo_6_F_euro","C_man_shorts_1_F_euro","C_man_p_fugitive_F_euro","C_man_p_shorts_1_F_euro","C_man_shorts_2_F_euro","C_man_shorts_3_F_euro","C_man_shorts_4_F_euro"];
Eridanus = nil;
ARTYAR = [["B_MBT_01_arty_F","B_MBT_01_mlrs_F"],["O_MBT_02_arty_F"],["B_MBT_01_arty_F"],["B_MBT_01_arty_F"]];
switch _this do {
case "The Eridanus Insurrection": {
NORANWEES = true;
Eridanus = true;
CRATECLAS = [
["TEI_M12_LRV_ins","TEI_item_rack","TEI_weapon_rack"]
,["TEI_Magic_Box"]
,["TEI_M12_LRV_ins","TEI_item_rack","TEI_weapon_rack"]
,["TEI_M12_LRV_ins","TEI_item_rack","TEI_weapon_rack"]
];
ARMEDVEHICLES = [
["TEI_M12_LRV","TEI_M12_LRV_black","TEI_M12_LRV_tan","TEI_M12_LRV_snow"],
["TEI_M12_LRV_ins"],
["TEI_M12_LRV","TEI_M12_LRV_black","TEI_M12_LRV_tan","TEI_M12_LRV_snow"],
["TEI_M12_LRV","TEI_M12_LRV_black","TEI_M12_LRV_tan","TEI_M12_LRV_snow"]
];

ARMEDTANKS = [
["TEI_M12G1_LRV","TEI_M12G1_LRV_black","TEI_M12G1_LRV_tan","TEI_M12G1_LRV_snow"],
["TEI_M12_LRV_ins"],
["TEI_M12G1_LRV","TEI_M12G1_LRV_black","TEI_M12G1_LRV_tan","TEI_M12G1_LRV_snow"],
["TEI_M12G1_LRV","TEI_M12G1_LRV_black","TEI_M12G1_LRV_tan","TEI_M12G1_LRV_snow"]
];

ARMEDAA = [
["TEI_M12_LRV","TEI_M12_LRV_black","TEI_M12_LRV_tan","TEI_M12_LRV_snow"],
["TEI_M12_LRV_ins"],
["TEI_M12_LRV","TEI_M12_LRV_black","TEI_M12_LRV_tan","TEI_M12_LRV_snow"],
["TEI_M12_LRV","TEI_M12_LRV_black","TEI_M12_LRV_tan","TEI_M12_LRV_snow"]
];

ARMEDCARRIER = [
["TEI_M813_TT","TEI_M813_TT_black","TEI_M813_TT_tan","TEI_M813_TT_snow"],
["TEI_M12_FAV_APC"],
["TEI_M813_TT","TEI_M813_TT_black","TEI_M813_TT_tan","TEI_M813_TT_snow"],
["TEI_M813_TT","TEI_M813_TT_black","TEI_M813_TT_tan","TEI_M813_TT_snow"]
];

ARMEDSTATIC = [
["B_static_AT_F","B_static_AA_F","B_HMG_01_F","B_HMG_01_high_F","B_GMG_01_F","B_GMG_01_high_F"],
["O_static_AT_F","O_static_AA_F","O_HMG_01_F","O_HMG_01_high_F","O_GMG_01_F","O_GMG_01_high_F"],
["I_static_AT_F","I_static_AA_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_F","I_GMG_01_high_F"],
["I_static_AT_F","I_static_AA_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_F","I_GMG_01_high_F"]
];

ARMEDSUPPORT = [
["B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_Truck_01_Repair_F"],
["O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_fuel_F","O_Truck_02_Ammo_F","O_Truck_03_repair_F","O_Truck_03_medical_F","O_Truck_03_fuel_F","O_Truck_03_ammo_F"],
["I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F","I_Truck_02_Ammo_F"]
];

CIVVEH = ["C_Van_01_fuel_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"];

AIRFIGTHER = [
["B_UAV_02_CAS_F","B_Plane_CAS_01_F"],
["O_UAV_02_F","O_Plane_CAS_02_F"],
["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"],
["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"]
];

AIRARMCHOP = [
["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"],
["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Heli_Light_02_F"],
["I_Heli_light_03_F"],
["I_Heli_light_03_F"]
];
AIRCARRIERCHOP = [
["TEI_Pelican_unarmed_tan","TEI_Pelican_unarmed_green","TEI_Pelican_unarmed_black"],
["TEI_Pelican_unarmed_ins"],
["TEI_Pelican_unarmed_tan","TEI_Pelican_unarmed_green","TEI_Pelican_unarmed_black"],
["TEI_Pelican_unarmed_tan","TEI_Pelican_unarmed_green","TEI_Pelican_unarmed_black"]
];
ENEMYC1 = ["TEI_Ins_URF_Boarder","TEI_Ins_URF_Medic","TEI_Ins_URF_Radioman","TEI_Ins_URF_Rifleman_AR","TEI_Ins_URF_Rifleman_BR","TEI_Ins_URF_Rifleman_AT","TEI_Ins_URF_Rifleman_Light","TEI_Ins_URF_AT_Specialist","TEI_Ins_URF_AA_Specialist","TEI_Ins_URF_Engineer","TEI_Ins_URF_Breacher","TEI_Ins_URF_TeamLead","TEI_Ins_URF_SquadLead","TEI_Ins_URF_Grenadier","TEI_Ins_URF_Autorifleman","TEI_Ins_URF_Assist_Autorifleman","TEI_Ins_URF_Marksman","TEI_Ins_URF_Sniper","TEI_Ins_URF_Observer","TEI_Ins_URF_Demolitions","TEI_Ins_URF_UAV_Op"];
ENEMYC2 = ["TEI_Ins_ER_Surgeon","TEI_Ins_ER_Guerilla_AR","TEI_Ins_ER_Insurgent_BR","TEI_Ins_ER_Rebel_AT","TEI_Ins_ER_Farmer","TEI_Ins_ER_MAdvisor","TEI_Ins_ER_Deserter_GL","TEI_Ins_ER_Militia_MG","TEI_Ins_ER_Assassin","TEI_Ins_ER_Terrorist","TEI_Ins_ER_Warlord"];
ENEMYC3 = ["TEI_Ins_URF_Boarder","TEI_Ins_URF_Medic","TEI_Ins_URF_Radioman","TEI_Ins_URF_Rifleman_AR","TEI_Ins_URF_Rifleman_BR","TEI_Ins_URF_Rifleman_AT","TEI_Ins_URF_Rifleman_Light","TEI_Ins_URF_AT_Specialist","TEI_Ins_URF_AA_Specialist","TEI_Ins_URF_Engineer","TEI_Ins_URF_Breacher","TEI_Ins_URF_TeamLead","TEI_Ins_URF_SquadLead","TEI_Ins_URF_Grenadier","TEI_Ins_URF_Autorifleman","TEI_Ins_URF_Assist_Autorifleman","TEI_Ins_URF_Marksman","TEI_Ins_URF_Sniper","TEI_Ins_URF_Observer","TEI_Ins_URF_Demolitions","TEI_Ins_URF_UAV_Op"];
FRIENDC1 = ["TEI_UNSC_Army_W_Medic","TEI_UNSC_Army_W_Radioman","TEI_UNSC_Army_W_Rifleman_AR","TEI_UNSC_Army_W_Rifleman_BR","TEI_UNSC_Army_W_Rifleman_AT","TEI_UNSC_Army_W_Rifleman_Light","TEI_UNSC_Army_W_AT_Specialist","TEI_UNSC_Army_W_AA_Specialist","TEI_UNSC_Army_W_Engineer","TEI_UNSC_Army_W_Breacher","TEI_UNSC_Army_W_TeamLead","TEI_UNSC_Army_W_SquadLead","TEI_UNSC_Army_W_Grenadier","TEI_UNSC_Army_W_Autorifleman","TEI_UNSC_Army_W_Assist_Autorifleman","TEI_UNSC_Army_W_Marksman","TEI_UNSC_Army_W_Sniper","TEI_UNSC_Army_W_Observer","TEI_UNSC_Army_W_Demolitions","TEI_UNSC_Army_W_UAV_Op"];
FRIENDC2 = ["TEI_UNSC_Army_D_Medic","TEI_UNSC_Army_D_Radioman","TEI_UNSC_Army_D_Rifleman_AR","TEI_UNSC_Army_D_Rifleman_BR","TEI_UNSC_Army_D_Rifleman_AT","TEI_UNSC_Army_D_Rifleman_Light","TEI_UNSC_Army_D_AT_Specialist","TEI_UNSC_Army_D_AA_Specialist","TEI_UNSC_Army_D_Engineer","TEI_UNSC_Army_D_Breacher","TEI_UNSC_Army_D_TeamLead","TEI_UNSC_Army_D_SquadLead","TEI_UNSC_Army_D_Grenadier","TEI_UNSC_Army_D_Autorifleman","TEI_UNSC_Army_D_Assist_Autorifleman","TEI_UNSC_Army_D_Marksman","TEI_UNSC_Army_D_Sniper","TEI_UNSC_Army_D_Observer","TEI_UNSC_Army_D_Demolitions","TEI_UNSC_Army_D_UAV_Op"];
FRIENDC3 = ["TEI_UNSC_Marine_Corpsman","TEI_UNSC_Marine_Radioman","TEI_UNSC_Marine_Rifleman_AR","TEI_UNSC_Marine_Rifleman_BR","TEI_UNSC_Marine_Rifleman_AT","TEI_UNSC_Marine_Rifleman_Light","TEI_UNSC_Marine_AT_Specialist","TEI_UNSC_Marine_AA_Specialist","TEI_UNSC_Marine_Engineer","TEI_UNSC_Marine_Breacher","TEI_UNSC_Marine_TeamLead","TEI_UNSC_Marine_SquadLead","TEI_UNSC_Marine_Grenadier","TEI_UNSC_Marine_Autorifleman","TEI_UNSC_Marine_Assist_Autorifleman","TEI_UNSC_Marine_Marksman","TEI_UNSC_Marine_Sniper","TEI_UNSC_Marine_Observer","TEI_UNSC_Marine_Demolitions","TEI_UNSC_Marine_UAV_Op","TEI_UNSC_Marine_Sgt_Johnson"];
FRIENDC4 = ["TEI_UNSC_ODST_Scout","TEI_UNSC_ODST_Scout_AT","TEI_UNSC_ODST_Rifleman_AR","TEI_UNSC_ODST_Rifleman_BR","TEI_UNSC_ODST_Rifleman_AT","TEI_UNSC_ODST_Autorifleman","TEI_UNSC_ODST_Marksman","TEI_UNSC_ODST_Scout_Sniper","TEI_UNSC_ODST_TeamLead","TEI_UNSC_ODST_Paramedic","TEI_UNSC_ODST_Demo","TEI_UNSC_ODST_ONI_Op"];
};
case "Default": {
ARMEDVEHICLES = [
["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_CRV_F","B_UGV_01_rcws_F"],
["O_APC_Wheeled_02_rcws_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"],
["I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_Wheeled_03_cannon_F","I_UGV_01_rcws_F"],
["I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"]
];

ARMEDTANKS = [
["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"],
["O_MBT_02_cannon_F"],
["I_MBT_03_cannon_F"],
["I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"]
];

ARMEDAA = [
["B_APC_Tracked_01_AA_F"],
["O_APC_Tracked_02_AA_F"],
["I_APC_tracked_03_cannon_F"],
["I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"]
];

ARMEDCARRIER = [
["B_Truck_01_transport_F","B_Truck_01_covered_F","B_G_Offroad_01_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"],
["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_Truck_03_covered_F","O_Truck_03_transport_F","O_Truck_02_covered_F","O_Truck_02_transport_F"],
["I_Truck_02_covered_F","I_Truck_02_transport_F","I_G_Offroad_01_armed_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F"],
["B_G_Van_01_transport_F","B_G_Offroad_01_F","I_G_Van_01_transport_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_F"]
];

ARMEDSTATIC = [
["B_static_AT_F","B_static_AA_F","B_HMG_01_F","B_HMG_01_high_F","B_GMG_01_F","B_GMG_01_high_F"],
["O_static_AT_F","O_static_AA_F","O_HMG_01_F","O_HMG_01_high_F","O_GMG_01_F","O_GMG_01_high_F"],
["I_static_AT_F","I_static_AA_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_F","I_GMG_01_high_F"],
["I_static_AT_F","I_static_AA_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_F","I_GMG_01_high_F"]
];

ARMEDSUPPORT = [
["B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_Truck_01_Repair_F"],
["O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_fuel_F","O_Truck_02_Ammo_F","O_Truck_03_repair_F","O_Truck_03_medical_F","O_Truck_03_fuel_F","O_Truck_03_ammo_F"],
["I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F","I_Truck_02_Ammo_F"]
];

CIVVEH = ["C_Van_01_fuel_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"];

AIRFIGTHER = [
["B_UAV_02_CAS_F","B_Plane_CAS_01_F"],
["O_UAV_02_F","O_Plane_CAS_02_F"],
["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"],
["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"]
];

AIRARMCHOP = [
["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"],
["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Heli_Light_02_F"],
["I_Heli_light_03_F"],
["I_Heli_light_03_F"]
];
AIRCARRIERCHOP = [
["B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F"],
["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_covered_F","O_Heli_Light_02_v2_F","O_Heli_Transport_04_covered_F"],
["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"],
["I_Heli_light_03_unarmed_F"]
];
ENEMYC1 = ["O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_A_F","O_Soldier_AR_F","O_medic_F","O_engineer_F","O_soldier_exp_F","O_Soldier_GL_F","O_soldier_M_F","O_Soldier_AT_F","O_officer_F","O_soldier_repair_F","O_Soldier_F","O_Soldier_LAT_F","O_Soldier_lite_F","O_Soldier_SL_F","O_Soldier_TL_F","O_spotter_F","O_sniper_F"];
ENEMYC2 = ["O_recon_exp_F","O_recon_JTAC_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_TL_F"];
ENEMYC3 = ["O_soldierU_A_F","O_soldierU_AAR_F","O_soldierU_AAT_F","O_soldierU_AR_F","O_soldierU_medic_F","O_engineer_U_F","O_soldierU_exp_F","O_SoldierU_GL_F","O_soldierU_M_F","O_soldierU_AT_F","O_soldierU_repair_F","O_soldierU_LAT_F","O_SoldierU_SL_F","O_soldierU_TL_F"];
FRIENDC1 = ["B_soldier_AAR_F","B_soldier_AAA_F","B_soldier_AAT_F","b_sniper_f","b_spotter_f","B_Soldier_A_F","B_soldier_AR_F","B_medic_F","B_engineer_F","B_soldier_exp_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_AA_F","B_soldier_AT_F","B_soldier_repair_F","B_soldier_repair_F","B_Soldier_F","B_soldier_LAT_F","B_Soldier_lite_F","B_Soldier_SL_F","B_Soldier_TL_F"];
if (isClass(configFile >> "cfgVehicles" >> "AV_IndUs_AR")) then {FRIENDC1 = ["AV_IndUs_medic","AV_IndUs_REP","AV_IndUs_EXP","AV_IndUs_AT","AV_IndUs_Rifleman2","AV_IndUs_Rifleman","AV_IndUs_Rifleman_light","AV_IndUs_SL"];};
FRIENDC2 = ["I_Soldier_AAR_F","I_Soldier_AAA_F","I_Soldier_AAT_F","I_Soldier_A_F","I_Soldier_AR_F","I_medic_F","I_engineer_F","I_Soldier_exp_F","I_Soldier_GL_F","I_Soldier_M_F","I_Soldier_AA_F","I_Soldier_AT_F","I_officer_F","I_Soldier_repair_F","I_soldier_F","I_Soldier_LAT_F","I_Soldier_lite_F","I_Soldier_SL_F","I_Soldier_TL_F","I_Spotter_F","I_Sniper_F"];
FRIENDC3 = ["B_recon_JTAC_F","B_recon_exp_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_recon_TL_F"];
FRIENDC4 = ["I_G_Soldier_A_F","I_G_Soldier_AR_F","I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_officer_F","I_G_Soldier_F","I_G_Soldier_LAT_F","I_G_Soldier_lite_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F"];
};
case "Chernarus Conflict": {
CheConf = true;

ARMEDVEHICLES = [
["B_mas_cer_Offroad_01_armed_F","B_mas_cer_BTR60","B_mas_cer_MRAP_03_gmg_F", "B_mas_cer_MRAP_03_AT_F", "B_mas_cer_APC_Wheeled_01_cannon_F", "B_mas_cer_APC_BMP2_F"],
["O_mas_cer_Offroad_01s_armed_F","O_mas_cer_MRAP_03_AT_F","O_mas_cer_MRAP_03_hmg_F","O_mas_cer_MRAP_03_gmg_F","O_mas_cer_T72_F","O_mas_cer_T55_F","O_mas_cer_BRDM2t","O_mas_cer_BMP1t_F","O_mas_cer_BMP1Pt_F","O_mas_cer_BTR60t","O_mas_cer_BMP1_F","O_mas_cer_BMP1P_F","O_mas_cer_BMP2_F","O_mas_cer_BTR60","O_mas_cer_BRDM2"],
["I_mas_cer_Offroad_01s_armed_F","I_mas_cer_MRAP_03_AT_F","I_mas_cer_MRAP_03_hmg_F","I_mas_cer_MRAP_03_gmg_F","I_mas_cer_BRDM2","I_mas_cer_BTR60","I_mas_cer_BMP2_F","I_mas_cer_BMP1_F","I_mas_cer_BMP1P_F"],
["B_mas_cer_BRDM2", "B_mas_cer_BTR60", "B_mas_cer_BRDM2g", "B_mas_cer_BTR60g", "B_mas_cer_MRAP_03_hmg_Fg", "B_mas_cer_MRAP_03_gmg_Fg", "B_mas_cer_MRAP_03_AT_Fg"]
];

ARMEDTANKS = [
["B_mas_cer_BTR60","B_mas_cer_APC_BMP2_F","B_mas_cer_BMP1_Fg", "B_mas_cer_BMP1P_Fg"],
["O_mas_cer_T72_F","O_mas_cer_T55_F"],
["I_mas_cer_T72_F","I_mas_cer_T55_F","I_mas_cer_BMP2_F","I_mas_cer_BMP1P_F","I_mas_cer_BMP1_F","I_mas_cer_BMP1_Fg","I_mas_cer_BMP1P_Fg"],
["B_mas_cer_BMP1_Fg", "B_mas_cer_BMP1P_Fg"]
];

ARMEDAA = [
["B_mas_cer_ZSU"],
["O_mas_cer_ZSU_F"],
["I_mas_cer_ZSU_F"],
["B_mas_cer_ZU23_Fg"]
];

ARMEDCARRIER = [
["B_mas_cer_Offroad_01_F","B_mas_cer_APC_BMP2_F","B_mas_cer_BTR60","B_mas_cer_MRAP_03_F","B_mas_cer_M119_F","B_mas_cer_Truck_02_covered_F","B_mas_cer_Truck_02_transport_F"],
["O_mas_cer_Offroad_01s_F","O_mas_cer_MRAP_03_F","O_mas_cer_Truck_02_transport_F","O_mas_cer_Truck_02_covered_F","O_mas_cer_BRDM2t","O_mas_cer_BMP1t_F","O_mas_cer_BMP1Pt_F","O_mas_cer_BTR60t","O_mas_cer_BMP1_F","O_mas_cer_BMP1P_F","O_mas_cer_BMP2_F","O_mas_cer_BTR60","O_mas_cer_BRDM2"],
["I_mas_cer_BRDM2","I_mas_cer_BTR60","I_mas_cer_BMP2_F","I_mas_cer_BMP1_F","I_mas_cer_BMP1P_F","I_mas_cer_Offroad_01s_F","I_mas_cer_Truck_02_covered_F","I_mas_cer_Truck_02_transport_F"],
["B_mas_cer_BMP1_Fg", "B_mas_cer_BMP1P_Fg"]
];

ARMEDSTATIC = [
["B_mas_cer_static_AT_F","B_mas_cer_static_AA_F","B_mas_cer_GMG_01_F","B_mas_cer_Mortar_01_F","B_mas_cer_HMG_01_F","B_mas_cer_HMG_01_high_F"],
["O_mas_cer_static_AA_F","O_mas_cer_GMG_01_F","O_mas_cer_D30_F","O_mas_cer_D30_AT_F","O_mas_cer_HMG_01_high_F","O_mas_cer_HMG_01_F","O_mas_cer_ZU23_F","O_mas_cer_Mortar_01_F","O_mas_cer_static_AT_F","O_mas_cer_static_AAt_F","O_mas_cer_GMG_01t_F","O_mas_cer_D30t_F","O_mas_cer_D30t_AT_F","O_mas_cer_HMG_01t_high_F","O_mas_cer_HMG_01t_F","O_mas_cer_ZU23t_F","O_mas_cer_Mortar_01t_F","O_mas_cer_static_ATt_F"],
["I_mas_cer_static_AA_F","I_mas_cer_GMG_01_F","I_mas_cer_GMG_01_F","I_mas_cer_D30_AT_F","I_mas_cer_HMG_01_high_F","I_mas_cer_HMG_01_F","I_mas_cer_static_AT_F","I_mas_cer_Mortar_01_F","I_mas_cer_GMG_01_high_F","I_mas_cer_ZU23_F"],
["B_mas_cer_M119_Fg","B_mas_cer_M119_AT_Fg","B_mas_cer_HMG_01_high_Fg","B_mas_cer_HMG_01_Fg","B_mas_cer_Mortar_01_Fg","B_mas_cer_GMG_01_Fg","B_mas_cer_static_AA_Fg","B_mas_cer_static_AT_Fg","B_mas_cer_ZU23_Fg"]
];

ARMEDSUPPORT = [
["B_mas_cer_APC_BMP2_medical_F","B_mas_cer_Truck_02_logistic_F","B_mas_cer_Truck_02_medic_F"],
["O_mas_cer_BMP2_Ambul_F","O_mas_cer_BMP2_Ambul_F","O_mas_cer_Truck_02_medic_F","O_mas_cer_Truck_02_logistic_F"],
["I_mas_cer_Truck_02_medic_F","I_mas_cer_Truck_02_logistic_F","I_mas_cer_BMP2_Ambul_F"]
];

CIVVEH = ["C_Van_01_fuel_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"];

AIRFIGTHER = [
["B_UAV_02_CAS_F","B_Plane_CAS_01_F"],
["O_UAV_02_F","O_Plane_CAS_02_F"],
["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"],
["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"]
];

AIRARMCHOP = [
["B_mas_cer_Heli_Light_02_F"],
["O_mas_cer_MI24"],
["I_mas_cer_MI24"],
["I_Heli_light_03_F"]
];
AIRCARRIERCHOP = [
["B_mas_cer_MI8", "B_mas_cer_MI8MTV"],
["O_mas_cer_MI24","O_mas_cer_MI8","O_mas_cer_MI8MTV"],
["I_mas_cer_MI8","I_mas_cer_MI8MTV","I_mas_cer_MI24"],
["B_mas_cer_Heli_Light_02_unarmed_F"]
];
ENEMYC1 = ["O_mas_cer_Soldier_F", "O_mas_cer_Soldier_GL_F", "O_mas_cer_soldier_AR_F", "O_mas_cer_soldier_MG_F", "O_mas_cer_Soldier_lite_F", "O_mas_cer_Soldier_una_F", "O_mas_cer_Soldier_off_F", "O_mas_cer_Soldier_off_Fn", "O_mas_cer_Soldier_SL_F", "O_mas_cer_Soldier_TL_Fn", "O_mas_cer_soldier_M_F", "O_mas_cer_soldier_LAT_F", "O_mas_cer_soldier_LAA_F", "O_mas_cer_medic_F", "O_mas_cer_soldier_repair_F", "O_mas_cer_soldier_exp_F", "O_mas_cer_Soldier_amort_F", "O_mas_cer_Soldier_smort_F"];
ENEMYC2 = ["O_mas_cer_rusadv1_F", "O_mas_cer_rusadv2_F", "O_mas_cer_rusadv3_F", "O_mas_cer_recon_F", "O_mas_cer_recon_LAT_F", "O_mas_cer_recon_LAA_F", "O_mas_cer_recon_exp_F", "O_mas_cer_recon_medic_F", "O_mas_cer_recon_TL_F", "O_mas_cer_recon_AR_F", "O_mas_cer_recon_M_F", "O_mas_cer_recon_JTAC_F"];
ENEMYC3 = ["O_mas_cer_Rebel_F", "O_mas_cer_Rebel_SL_F", "O_mas_cer_Rebel_LITE_F",  "O_mas_cer_Rebel_OFF_F", "O_mas_cer_Rebel_EXP_F", "O_mas_cer_Rebel_GL_F", "O_mas_cer_Rebel_TL_F", "O_mas_cer_Rebel_MG_F", "O_mas_cer_Rebel_AR_F", "O_mas_cer_Rebel_LAT_F", "O_mas_cer_Rebel_AA_F", "O_mas_cer_Rebel_M_F", "O_mas_cer_Rebel_MEDIC_F", "O_mas_cer_Rebel_ENG_F", "O_mas_cer_Rebel_UNA_F", "O_mas_cer_Rebel_amort_F", "O_mas_cer_Rebel_smort_F"];
FRIENDC1 = ["B_mas_cer_contract1_F", "B_mas_cer_contract2_F", "B_mas_cer_contract3_F", "B_mas_cer_contract4_F", "B_mas_cer_contract4u_F", "B_mas_cer_contract5_F","B_mas_cer_recon_F", "B_mas_cer_recon_LAT_F", "B_mas_cer_recon_LAA_F", "B_mas_cer_recon_exp_F", "B_mas_cer_recon_medic_F", "B_mas_cer_recon_TL_F", "B_mas_cer_recon_M_F", "B_mas_cer_recon_JTAC_F", "B_mas_cer_recon_AR_F", "B_mas_cer_recon_UAV_F", "B_mas_cer_recon_Fn", "B_mas_cer_recon_Fl", "B_mas_cer_recon_LAT_Fn", "B_mas_cer_recon_LAA_Fn", "B_mas_cer_recon_exp_Fn", "B_mas_cer_recon_medic_Fn", "B_mas_cer_recon_TL_Fn", "B_mas_cer_recon_M_Fn", "B_mas_cer_recon_JTAC_Fn", "B_mas_cer_recon_AR_Fn", "B_mas_cer_recon_UAV_F_Fn", "B_mas_cer_Soldier_F", "B_mas_cer_Soldier_GL_F", "B_mas_cer_Soldier_JTAC_F", "B_mas_cer_soldier_AR_F", "B_mas_cer_soldier_MG_F", "B_mas_cer_Soldier_lite_F", "B_mas_cer_Soldier_una_F", "B_mas_cer_Soldier_off_F", "B_mas_cer_Soldier_off_Fn", "B_mas_cer_Soldier_SL_F", "B_mas_cer_Soldier_TL_F", "B_mas_cer_soldier_M_F", "B_mas_cer_soldier_LAT_F", "B_mas_cer_soldier_AT_F", "B_mas_cer_soldier_LAA_F", "B_mas_cer_medic_F", "B_mas_cer_soldier_repair_F", "B_mas_cer_soldier_exp_F"];
FRIENDC2 = ["I_mas_cer_recon_F", "I_mas_cer_recon_AR_F", "I_mas_cer_recon_LAT_F", "I_mas_cer_recon_LAA_F", "I_mas_cer_recon_exp_F", "I_mas_cer_recon_medic_F", "I_mas_cer_recon_TL_F", "I_mas_cer_recon_M_F", "I_mas_cer_recon_JTAC_F","I_mas_cer_Soldier_F", "I_mas_cer_Soldier_GL_F", "I_mas_cer_soldier_AR_F", "I_mas_cer_soldier_MG_F", "I_mas_cer_Soldier_lite_F", "I_mas_cer_Soldier_Recruit_F", "I_mas_cer_Soldier_Police_F", "I_mas_cer_Soldier_Police2_F",  "I_mas_cer_Soldier_una_F", "I_mas_cer_Soldier_off_F", "I_mas_cer_Soldier_off_Fn", "I_mas_cer_Soldier_SL_F", "I_mas_cer_Soldier_TL_F", "I_mas_cer_soldier_M_F", "I_mas_cer_soldier_LAT_F", "I_mas_cer_soldier_LAA_F", "I_mas_cer_medic_F", "I_mas_cer_soldier_repair_F", "I_mas_cer_soldier_exp_F", "I_mas_cer_Soldier_amort_F", "I_mas_cer_Soldier_smort_F"];
FRIENDC3 = ["I_mas_cer_Rebel_F", "I_mas_cer_Rebel_SL_F", "I_mas_cer_Rebel_LITE_F",  "I_mas_cer_Rebel_OFF_F", "I_mas_cer_Rebel_EXP_F", "I_mas_cer_Rebel_GL_F", "I_mas_cer_Rebel_TL_F", "I_mas_cer_Rebel_MG_F", "I_mas_cer_Rebel_AR_F", "I_mas_cer_Rebel_LAT_F", "I_mas_cer_Rebel_AA_F", "I_mas_cer_Rebel_M_F", "I_mas_cer_Rebel_MEDIC_F", "I_mas_cer_Rebel_ENG_F", "I_mas_cer_Rebel_UNA_F", "I_mas_cer_Rebel_amort_F", "I_mas_cer_Rebel_smort_F"];
FRIENDC4 = ["B_mas_cer_Rebel_F", "B_mas_cer_Rebel_SL_F", "B_mas_cer_Rebel_LITE_F",  "B_mas_cer_Rebel_OFF_F", "B_mas_cer_Rebel_EXP_F", "B_mas_cer_Rebel_GL_F", "B_mas_cer_Rebel_TL_F", "B_mas_cer_Rebel_MG_F", "B_mas_cer_Rebel_AR_F", "B_mas_cer_Rebel_LAT_F", "B_mas_cer_Rebel_LAT2_F", "B_mas_cer_Rebel_AA_F", "B_mas_cer_Rebel_M_F", "B_mas_cer_Rebel_MEDIC_F", "B_mas_cer_Rebel_ENG_F", "B_mas_cer_Rebel_UNA_F", "B_mas_cer_Rebel_amort_F", "B_mas_cer_Rebel_smort_F"];
CIVS1 = ["C_mas_cer_1", "C_mas_cer_2", "C_mas_cer_3", "C_mas_cer_4", "C_mas_cer_5", "C_mas_cer_6", "C_mas_cer_7", "C_mas_cer_8", "C_mas_cer_9", "C_mas_cer_10"];
};
case "RHS Escalation": {
//
ARTYAR = [["rhsusf_m109_usarmy"],["rhs_9k79", "rhs_9k79_K", "rhs_9k79_B", "rhs_2s3_tv"],["rhs_9k79", "rhs_9k79_K", "rhs_9k79_B", "rhs_2s3_tv"],["rhs_9k79", "rhs_9k79_K", "rhs_9k79_B", "rhs_2s3_tv"]];

ARMEDVEHICLES = [
["rhsusf_m113_usarmy_supply", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240", "rhsusf_m113_usarmy_medical", "rhsusf_m113_usarmy_MK19", "rhsusf_m113_usarmy_unarmed", "RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd"],
["rhs_bmp2d_tv", "rhs_bmp2e_tv", "rhs_bmp2_tv", "rhs_bmp1p_tv", "rhs_bmp1k_tv", "rhs_bmp1d_tv", "rhs_bmp1_tv", "rhs_bmp2k_tv", "rhs_brm1k_tv", "rhs_prp3_tv", "rhs_bmp1_msv", "rhs_bmp1d_msv", "rhs_bmp1k_msv", "rhs_bmp1p_msv", "rhs_bmp2_msv", "rhs_bmp2e_msv", "rhs_bmp2d_msv", "rhs_bmp2k_msv", "rhs_bmp3_msv", "rhs_bmp3_late_msv", "rhs_bmp3m_msv", "rhs_bmp3mera_msv", "rhs_brm1k_msv", "rhs_prp3_msv", "rhs_bmp1_vmf", "rhs_bmp1d_vmf", "rhs_bmp1k_vmf", "rhs_bmp1p_vmf", "rhs_bmp2_vmf", "rhs_bmp2e_vmf", "fhs_bmp2d_vmf", "rhs_bmp2k_vmf", "rhs_brm1k_vmf", "rhs_prp3_vmf", "rhs_bmd1", "rhs_bmd1k", "rhs_bmd1p", "rhs_bmd1pk", "rhs_bmd1r", "rhs_bmd2", "rhs_bmd2k", "rhs_bmd2m", "rhs_bmd4_vdv", "rhs_bmd4m_vdv", "rhs_bmd4ma_vdv", "rhs_bmp1_vdv", "rhs_bmp1d_vdv", "rhs_bmp1k_vdv", "rhs_bmp1p_vdv", "rhs_bmp2_vdv", "rhs_bmp2e_vdv", "rhs_bmp2d_vdv", "rhs_bmp2k_vdv", "rhs_brm1k_vdv", "rhs_prp3_vdv"],
["rhs_btr60_chdkz", "rhs_btr70_chdkz", "rhs_uaz_ags_chdkz", "rhs_uaz_dshkm_chdkz", "rhs_uaz_spg9_chdkz", "rhs_bmd1_chdkz", "rhs_bmd2_chdkz", "rhs_bmp1_chdkz", "rhs_bmp1d_chdkz", "rhs_bmp1k_chdkz", "rhs_bmp1p_chdkz", "rhs_bmp2_chdkz", "rhs_bmp2e_chdkz", "rhs_bmp2d_chdkz", "rhs_bmp2k_chdkz", "I_G_Offroad_01_armed_F"],
["rhs_btr60_chdkz", "rhs_btr70_chdkz", "rhs_uaz_ags_chdkz", "rhs_uaz_dshkm_chdkz", "rhs_uaz_spg9_chdkz", "rhs_bmd1_chdkz", "rhs_bmd2_chdkz", "rhs_bmp1_chdkz", "rhs_bmp1d_chdkz", "rhs_bmp1k_chdkz", "rhs_bmp1p_chdkz", "rhs_bmp2_chdkz", "rhs_bmp2e_chdkz", "rhs_bmp2d_chdkz", "rhs_bmp2k_chdkz", "I_G_Offroad_01_armed_F"]
];

ARMEDTANKS = [
["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd", "rhs_m1a2sep1tuskiiwd_usarmy"],
["rhs_t72ba_tv", "rhs_t72bb_tv", "rhs_t72bc_tv", "rhs_t72bd_tv", "rhs_t80a", "rhs_t80", "rhs_t80b", "rhs_t80bk", "rhs_t80bvk", "rhs_t80u", "rhs_t80u45m", "rhs_t80ue1", "rhs_t80uk", "rhs_t80um", "rhs_t90_tv", "rhs_t90a_tv"],
["rhs_t72bb_chdkz"],
["rhs_t72bb_chdkz"]
];

ARMEDAA = [
["RHS_M6_wd"],
["rhs_zsu234_aa"],
["rhs_zsu234_chdkz"],
["rhs_zsu234_chdkz"]
];

ARMEDCARRIER = [
["rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240", "rhsusf_m113_usarmy_MK19", "rhsusf_m113_usarmy_unarmed", "RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd", "RHS_M6_wd", "rhsusf_m1025_w_m2", "rhsusf_m1025_w_mk19", "rhsusf_m1025_w", "rhsusf_m1078A1P2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_wd_open_fmtv_usarmy", "rhsusf_M1078A1P2_B_wd_fmtv_usarmy", "rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy", "rhsusf_M1078AP2_B_wd_open_fmtv_usarmy", "rhsusf_M1083A1P2_wd_fmtv_usarmy", "rhsusf_M1083A1P2_wd_open_fmtv_usarmy", "rhsusf_M1083A1P2_B_wd_fmtv_usarmy", "rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy", "rhsusf_M1083A1P2_B_M2_wd_flatbed_fmtv_usarmy", "rhsusf_M1083A1P2_B_M2_wd_open_fmtv_usarmy", "rhsusf_M1083A1P2_B_wd_open_fmtv_usarmy", "rhsusf_rg33_wd", "rhsusf_rg33_m2_wd", "rhsusf_m1025_w_m2", "rhsusf_m1025_w_mk19", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_2dr_halftop", "rhsusf_m998_w_2dr", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr_halftop", "rhsusf_m998_w_4dr"],
["rhs_btr60_msv", "rhs_btr70_msv", "rhs_btr80_msv", "rhs_btr80a_msv", "rhs_btr60_vmf", "rhs_btr70_vmf", "rhs_btr80_vmf", "rhs_btr80a_vmf", "rhs_pts_vmf", "rhs_btr60_vdv", "rhs_btr70_vdv", "rhs_btr80_vdv", "rhs_btr80a_vdv", "rhs_tigr_msv", "rhs_tigr_3camo_msv", "rhs_tigr_sts_msv", "rhs_tigr_sts_3camo_msv", "rhs_tigr_m_msv", "rhs_tigr_m_3camo_msv", "rhs_gaz66_msv", "rhs_gaz66o_msv", "RHS_UAZ_MSV_01", "rhs_UAZ_open_MSV_01", "RHS_Ural_MSV_01", "RHS_Ural_Open_MSV_01", "rhs_tigr_vmf", "rhs_tigr_3camo_vmf", "rhs_tigr_sts_vmf", "rhs_tigr_sts_3camo_vmf", "rhs_tigr_m_vmf", "rhs_tigr_m_3camo_vmf", "rhs_gaz66_vmf", "rhs_gaz66o_vmf", "RHS_UAZ_vmf_01", "rhs_UAZ_open_vmf_01", "RHS_Ural_vmf_01", "RHS_Ural_Open_vmf_01", "rhs_tigr_vdv", "rhs_tigr_3camo_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_sts_3camo_vdv", "rhs_tigr_m_vdv", "rhs_tigr_m_3camo_vdv", "rhs_gaz66_vdv", "rhs_gaz66o_vdv", "RHS_UAZ_vdv_01", "rhs_UAZ_open_vdv_01", "RHS_Ural_vdv_01", "RHS_Ural_Open_vdv_01", "rhs_typhoon_vdv"],
["RHS_UAZ_chdkz", "rhs_uav_open_chdkz", "rhs_ural_chdkz", "rhs_ural_open_chdkz", "rhs_ural_work_open_chdkz", "rhs_ural_work_chdkz", "I_G_Offroad_01_F", "I_G_Quadbike_01_F", "I_G_Van_01_transport_F", "C_Quadbike_01_F", "C_Offroad_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "RHS_Ural_Civ_01", "RHS_Ural_Open_Civ_01", "RHS_Ural_Civ_03", "RHS_Ural_Open_Civ_03", "RHS_Ural_Civ_02", "RHS_Ural_Open_Civ_02"],
["C_Quadbike_01_F", "C_Offroad_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "RHS_Ural_Civ_01", "RHS_Ural_Open_Civ_01", "RHS_Ural_Civ_03", "RHS_Ural_Open_Civ_03", "RHS_Ural_Civ_02", "RHS_Ural_Open_Civ_02"]
];

ARMEDSTATIC = [
["RHS_Stinger_AA_pod_WD", "RHS_M119_WD", "RHS_M252_WD", "RHS_M2StaticMG_WD", "RHS_M2StaticMG_MiniTripod_WD", "RHS_TOW_TriPod_WD", "RHS_MK19_TriPod_WD"],
["rhs_D30_msv", "rhs_d30_at_msv", "rhs_2b14_82mm_msv", "rhs_Metis_9k115_2_msv", "rhs_Igla_AA_pod_msv", "RHS_AGS30_TriPod_MSV", "rhs_KORD_high_MSV", "rhs_KORD_MSV", "RHS_NSV_TriPod_MSV"],
["rhs_D30_ins", "rhs_D30_at_ins", "rhs_2b14_82mm_ins", "rhs_9k115_1_ins", "rhs_Metis_9k115_2_ins", "rhs_Igla_AA_pod_ins", "RHS_AGS30_TriPod_INS", "rhs_DSHKM_ins", "rhs_DSHKM_Mini_TriPod_ins", "rhs_KORD_INS", "rhs_KORD_high_INS", "RHS_NSV_TriPod_INS", "rhs_SPG9_INS"],
["rhs_D30_ins", "rhs_D30_at_ins", "rhs_2b14_82mm_ins", "rhs_9k115_1_ins", "rhs_Metis_9k115_2_ins", "rhs_Igla_AA_pod_ins", "RHS_AGS30_TriPod_INS", "rhs_DSHKM_ins", "rhs_DSHKM_Mini_TriPod_ins", "rhs_KORD_INS", "rhs_KORD_high_INS", "RHS_NSV_TriPod_INS", "rhs_SPG9_INS"]
];

ARMEDSUPPORT = [
["rhsusf_m113_usarmy_supply","rhsusf_m113_usarmy_medical","B_Truck_01_mover_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_Repair_F","B_Truck_01_medical_F"],
["rhs_gaz66_ammo_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","RHS_Ural_Fuel_MSV_01"],
["I_G_Van_01_fuel_F","I_G_Offroad_01_repair_F","C_Offroad_01_repair_F","C_Van_01_fuel_F","I_Truck_02_ammo_F","I_Truck_02_fuel_F","I_Truck_02_medical_F","I_Truck_02_box_F"]
];

CIVVEH = ["RHS_Ural_Open_Civ_02","RHS_Ural_Civ_02","RHS_Ural_Open_Civ_03","RHS_Ural_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Civ_01","C_Van_01_fuel_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F","I_G_Van_01_fuel_F","I_G_Offroad_01_repair_F","C_Offroad_01_repair_F","C_Van_01_fuel_F"];

AIRFIGTHER = [
["RHS_A10", "rhsusf_f22"],
["RHS_Su25SM_vvsc", "RHS_Su25SM_KH29_vvsc", "RHS_T50_vvs_generic", "RHS_T50_vvs_051", "RHS_T50_vvs_051", "RHS_T50_vvs_052", "RHS_T50_vvs_053", "RHS_T50_vvs_054", "RHS_T50_vvs_blueonblue"],
["I_Plane_Fighter_03_AA_F", "I_Plane_Fighter_03_CAS_F"],
["I_Plane_Fighter_03_AA_F", "I_Plane_Fighter_03_CAS_F"]
];

AIRARMCHOP = [
["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH1Z_wd_CS", "RHS_AH1Z_wd_GS", "RHS_AH1Z_wd"],
["RHS_Mi24P_AT_vdv", "RHS_Mi24P_CAS_vdv", "RHS_Mi24P_vdv", "RHS_Mi24V_AT_vdv", "RHS_Mi24V_vdv", "RHS_Mi24V_FAB_vdv", "RHS_Mi24V_UPK23_vd", "RHS_Ka52_vvsc", "RHS_Ka52_UPK23_vvsc", "RHS_Mi24P_AT_vvsc", "RHS_Mi24P_CAS_vvsc", "RHS_Mi24P_vvsc", "RHS_Mi24V_AT_vvsc", "RHS_Mi24V_vvsc", "RHS_Mi24V_FAC_vvsc", "RHS_Mi24V_UPK223_vvsc"],
["I_Heli_Light_03_F"],
["I_Heli_Light_03_F"]
];
AIRCARRIERCHOP = [
["RHS_CH_47F", "RHS_UH60M", "RHS_UH60M_MEV2", "RHS_UH60M_MEV", "rhsusf_CH53E_USMC", "RHS_UH1Y_FFAR", "RHS_UH1Y", "RHS_UH1Y_UNARMED"],
["RHS_Mi8AMT_vdv", "RHS_Mi8mt_vdv", "RHS_Mi8mt_Cargo_vdv", "RHS_Mi8MTV3_vdv", "RHS_Mi8MTV3_FAV_vdv", "RHS_Mi8MTV3_UPK23_vdv", "rhs_ka60_c", "RHS_Mi8AMT_vvsc", "RHS_Mi8AMTSh_vvsc", "RHS_Mi8AMTSh_FAV_vvsc", "RHS_Mi8AMTSh_UPK23_vvsc", "RHS_Mi8mt_vvsc", "RHS_Mi8mt_Cargo_vvsc", "RHS_Mi8MTV3_vvsc", "RHS_Mi8MTV3_FAB_vvsc", "RHS_Mi8MTV3_UPK23_vvsc"],
["RHS_Mi8amt_chdkz", "C_Heli_light_01_civil_F", "RHS_Mi8amt_civilian", "I_Heli_light_03_unarmed_F"],
["RHS_Mi8amt_chdkz", "C_Heli_light_01_civil_F", "RHS_Mi8amt_civilian", "I_Heli_light_03_unarmed_F"]
];
ENEMYC1 = ["rhs_vdv_aa", "rhs_vdv_at", "rhs_vdv_arifleman", "rhs_vdv_efreitor", "rhs_vdv_engineer", "rhs_vdv_grenadier_rpg", "rhs_vdv_strelok_rpg_assist", "rhs_vdv_junior_sergeant", "rhs_vdv_machinegunner", "rhs_vdv_machinegunner_assisstant", "rhs_vdv_marksman", "rhs_vdv_marksman_asval", "rhs_vdv_medic", "rhs_vdv_officer_armored", "rhs_vdv_rifleman", "rhs_vdv_rifleman_asval", "rhs_vdv_grenadier", "rhs_vdv_LAT", "rhs_-vdv_RShG2", "rhs_vdv_segeant"];
ENEMYC2 = ["rhs_vdv_recon_efreitor", "rhs_vdv_recon_machinegunner_assistant", "rhs_vdv_recon_marksman", "rhs_vdv_recon_marksman_asval", "rhs_vdv_recon_medic", "rhs_vdv_recon_officer", "rhs_vdv_recon_rifleman", "rhs_vdv_recon_rifleman_ak103", "rhs_vdv_recon_rifleman_akms", "rhs_vdv_recon_rifleman_asval", "rhs_vdv_recon_grenadier", "rhs_vdv_recon_rifleman_l", "rhs_vdv_recon_rifleman_lat", "rhs_vdv_recon_rifleman_scout_akm", "rhs_vdv_recon_rifleman_scout", "rhs_vdv_grenadier_scout", "rhs_vdv_recon_arifleman_scout", "rhs_vdv_recon_sergeant"];
ENEMYC3 = ["rhs_msv_emr_aa", "rhs_msv_emr_at", "rhs_msv_emr_arifleman", "rhs_msv_emr_efreitor", "rhs_msv_emr_engineer", "rhs_msv_emr_engineer", "rhs_msv_emr_grenadier_rpg", "rhs_msv_emr_strelok_rpg_assist", "rhs_msv_emr_junior_sergeant", "rhs_msv_emr_machinegunner_assistant", "rhs_msv_emr_marksman", "rhs_msv_emr_medic", "rhs_msv_emr_officer", "rhs_msv_emr_officer_armored", "rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2", "rhs_msv_emr_sergeant"];
FRIENDC1 = ["rhsusf_army_ucp_aa", "rhsusf_army_ucp_javelin", "rhsusf_army_ucp_autorifleman", "rhsusf_army_ucp_autoriflemana", "rhsusf_army_ucp_medic", "rhsusf_army_ucp_engineer", "rhsusf_army_ucp_explosives", "rhsusf_army_ucp_fso", "rhs_army_ucp_grenadier", "rhsusf_army_ucp_machinegunner", "rhsusf_army_ucp_machinegunnera", "rhsusf_army_ucp_marksman", "rhsusf_army_ucp_officer", "rhsusf_army_ucp_rifleman", "rhsusf_army_ucp_riflemanl", "rhsusf_army_ucp_rifemanat", "rhsusf_army_ucp_rifleman_m16", "rhsusf_ucp_rifleman_m4", "rhsusf_army_ucp_rifleman_m590", "rhsusf_army_ucp_sniper", "rhsusf_army_ucp_squadleader", "rhsusf_army_ucp_teamleader", "rhsusf_army_ucp_uav"];
FRIENDC2 = ["rhsusf_usmc_marpat_wd_stinger", "rhsusf_usmc_marpat_wd_smaw", "rhsusf_usmc_marpat_wd_javelin", "rhsusf_usmc_marpat_wd_autorifleman_m249", "rhsusf_usmc_marpat_wd_autorifleman", "rhsusf_usmc_recon_marpat_wd_autorifleman_lite", "rhsusf_usmc_marpat_wd_rifleman_m249_ass", "rhsusf_usmc_marpat_wd_engineer", "rhsusf_usmc_marpat_wd_marksman", "rhsusf_usmc_marpat_wd_explosives", "rhsusf_usmc_marpat_wd_fso", "rhsusf_usmc_marpat_wd_grenadier", "rhsusf_usmc_marpat_wd_grenadier_m32", "rhsusf_usmc_marpat_wd_machinegunner", "rhsusf_usmc_wd_machinegunner_ass", "rhsusf_usmc_recon_marpat_wd_marksman_lite", "rhsusf_usmc_marpat_wd_officer", "rhsusf_usmc_marpat_wd_rifleman_light", "rhsusf_usmc_marpat_wd_riflemanat", "rhsusf_usmc_recon_marpat_wd_rifleman_at_lite", "rhsusf_usmc_marpat_wd_rifleman", "rhsusf_usmc_marpat_wd_rifleman_m4", "rhsusf_usmc_marpat_wd_rifleman_m590", "rhsusf_usmc_lar_marpat_wd_riflemanat", "rhsusf_usmc_lar_marpat_wd_autofileman", "rhsusf_usmc_lar_marpat_wd_grenadier_m32", "rhsusf_usmc_lar_marpat_wd_rifleman", "rhsusf_usmc_lar_marpat_wd_rifleman_light", "rhsusf_usmc_lar_marpat_wd_marksman", "rhsusf_usmc_lar_marpat_wd_squadleader", "rhsusf_usmc_lar_marpat_wd_teamleader", "rhsusf_usmc_marpat_wd_sniper", "rhsusf_usmc_marpat_wd_spotter", "rhsusf_usmc_marpat_wd_teamleader", "rhsusf_usmc_recon_marpat_wd_teamleader_lite", "rhsusf_usmc_marpat_wd_uav"];
FRIENDC3 = ["rhsusf_ucmc_recon_marpat_wd_autorifleman", "rhsusf_usmc_recon_marpat_wd_machinegunner", "rhsusf_usmc_recon_marpat_wd_marksman", "rhsusf_usmc_recon_marpat_wd_rifleman", "rhsusf_usmc_recon_marpat_wd_rifleman_at", "rhsusf_usmc_recon_marpat_wd_teamleader"];
FRIENDC4 = ["rhs_g_Soldier_AA_F", "rhs_g_Soldier_exp_F", "rhs_g_Crew_F", "rhs_g_engineer_F", "rhs_g_Soldier_LAT_F", "rhs_g_Soldier_AAT_F", "rhs_g_Soldier_AR_F", "rhs_g_Soldier_AAR_F", "rhs_g_Soldier_M_F", "rhs_g_medic_F", "rhs_g_Soldier_F2", "rhs_g_Soldier_F3", "rhs_g_Soldier_F", "rhs_g_Soldier_GL_F", "rhs_g_Soldier_lite_F", "rhs_g_Soldier_AT_F", "rhs_g_Soldier_TL_F", "rhs_g_Soldier_SL_F"];
NORANWEES = true;
RHSENABLED = true;
};
case "Italian SPECOPS": {
//
ARTYAR = [["B_mas_it_MBT_01_arty_F", "B_mas_it_MBT_01_mlrs_F"],["rhs_9k79", "rhs_9k79_K", "rhs_9k79_B", "rhs_2s3_tv"],["rhs_9k79", "rhs_9k79_K", "rhs_9k79_B", "rhs_2s3_tv"],["rhs_9k79", "rhs_9k79_K", "rhs_9k79_B", "rhs_2s3_tv"]];

ARMEDVEHICLES = [
["B_mas_it_APC_tracked_03_cannon_F", "B_mas_it_APC_Tracked_01_AA_F"],
["rhs_bmp2d_tv", "rhs_bmp2e_tv", "rhs_bmp2_tv", "rhs_bmp1p_tv", "rhs_bmp1k_tv", "rhs_bmp1d_tv", "rhs_bmp1_tv", "rhs_bmp2k_tv", "rhs_brm1k_tv", "rhs_prp3_tv", "rhs_bmp1_msv", "rhs_bmp1d_msv", "rhs_bmp1k_msv", "rhs_bmp1p_msv", "rhs_bmp2_msv", "rhs_bmp2e_msv", "rhs_bmp2d_msv", "rhs_bmp2k_msv", "rhs_bmp3_msv", "rhs_bmp3_late_msv", "rhs_bmp3m_msv", "rhs_bmp3mera_msv", "rhs_brm1k_msv", "rhs_prp3_msv", "rhs_bmp1_vmf", "rhs_bmp1d_vmf", "rhs_bmp1k_vmf", "rhs_bmp1p_vmf", "rhs_bmp2_vmf", "rhs_bmp2e_vmf", "fhs_bmp2d_vmf", "rhs_bmp2k_vmf", "rhs_brm1k_vmf", "rhs_prp3_vmf", "rhs_bmd1", "rhs_bmd1k", "rhs_bmd1p", "rhs_bmd1pk", "rhs_bmd1r", "rhs_bmd2", "rhs_bmd2k", "rhs_bmd2m", "rhs_bmd4_vdv", "rhs_bmd4m_vdv", "rhs_bmd4ma_vdv", "rhs_bmp1_vdv", "rhs_bmp1d_vdv", "rhs_bmp1k_vdv", "rhs_bmp1p_vdv", "rhs_bmp2_vdv", "rhs_bmp2e_vdv", "rhs_bmp2d_vdv", "rhs_bmp2k_vdv", "rhs_brm1k_vdv", "rhs_prp3_vdv"],
["rhs_btr60_chdkz", "rhs_btr70_chdkz", "rhs_uaz_ags_chdkz", "rhs_uaz_dshkm_chdkz", "rhs_uaz_spg9_chdkz", "rhs_bmd1_chdkz", "rhs_bmd2_chdkz", "rhs_bmp1_chdkz", "rhs_bmp1d_chdkz", "rhs_bmp1k_chdkz", "rhs_bmp1p_chdkz", "rhs_bmp2_chdkz", "rhs_bmp2e_chdkz", "rhs_bmp2d_chdkz", "rhs_bmp2k_chdkz", "I_G_Offroad_01_armed_F"],
["rhs_btr60_chdkz", "rhs_btr70_chdkz", "rhs_uaz_ags_chdkz", "rhs_uaz_dshkm_chdkz", "rhs_uaz_spg9_chdkz", "rhs_bmd1_chdkz", "rhs_bmd2_chdkz", "rhs_bmp1_chdkz", "rhs_bmp1d_chdkz", "rhs_bmp1k_chdkz", "rhs_bmp1p_chdkz", "rhs_bmp2_chdkz", "rhs_bmp2e_chdkz", "rhs_bmp2d_chdkz", "rhs_bmp2k_chdkz", "I_G_Offroad_01_armed_F"]
];

ARMEDTANKS = [
["B_mas_it_MBT_03_cannon_F", "B_mas_it_MBT_01_arty_F", "B_mas_it_MBT_01_mlrs_F"],
["rhs_t72ba_tv", "rhs_t72bb_tv", "rhs_t72bc_tv", "rhs_t72bd_tv", "rhs_t80a", "rhs_t80", "rhs_t80b", "rhs_t80bk", "rhs_t80bvk", "rhs_t80u", "rhs_t80u45m", "rhs_t80ue1", "rhs_t80uk", "rhs_t80um", "rhs_t90_tv", "rhs_t90a_tv"],
["rhs_t72bb_chdkz"],
["rhs_t72bb_chdkz"]
];

ARMEDAA = [
["B_mas_it_APC_Tracked_01_AA_F"],
["rhs_zsu234_aa"],
["rhs_zsu234_chdkz"],
["rhs_zsu234_chdkz"]
];

ARMEDCARRIER = [
["B_mas_it_Offroad_01_F", "B_mas_it_Offroad_01_armed_F", "B_mas_it_SUV_01_F", "B_mas_it_MRAP_01_F", "B_mas_it_MRAP_01_med_F", "B_mas_it_MRAP_01_gmg_F", "B_mas_it_MRAP_01_hmg_F", "B_mas_it_MRAP_01_AT_F", "B_mas_it_Quadbike_01_F", "B_mas_it_APC_Wheeled_01_cannon_F", "B_mas_it_APC_tracked_03_cannon_F", "B_mas_it_APC_Tracked_01_AA_F", "B_mas_it_Truck_02_covered_F", "B_mas_it_Truck_02_transport_F", "B_mas_it_Truck_02_reammo_F", "B_mas_it_Truck_02_refuel_F", "B_mas_it_Truck_02_repair_F"],
["rhs_btr60_msv", "rhs_btr70_msv", "rhs_btr80_msv", "rhs_btr80a_msv", "rhs_btr60_vmf", "rhs_btr70_vmf", "rhs_btr80_vmf", "rhs_btr80a_vmf", "rhs_pts_vmf", "rhs_btr60_vdv", "rhs_btr70_vdv", "rhs_btr80_vdv", "rhs_btr80a_vdv", "rhs_tigr_msv", "rhs_tigr_3camo_msv", "rhs_tigr_sts_msv", "rhs_tigr_sts_3camo_msv", "rhs_tigr_m_msv", "rhs_tigr_m_3camo_msv", "rhs_gaz66_msv", "rhs_gaz66o_msv", "RHS_UAZ_MSV_01", "rhs_UAZ_open_MSV_01", "RHS_Ural_MSV_01", "RHS_Ural_Open_MSV_01", "rhs_tigr_vmf", "rhs_tigr_3camo_vmf", "rhs_tigr_sts_vmf", "rhs_tigr_sts_3camo_vmf", "rhs_tigr_m_vmf", "rhs_tigr_m_3camo_vmf", "rhs_gaz66_vmf", "rhs_gaz66o_vmf", "RHS_UAZ_vmf_01", "rhs_UAZ_open_vmf_01", "RHS_Ural_vmf_01", "RHS_Ural_Open_vmf_01", "rhs_tigr_vdv", "rhs_tigr_3camo_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_sts_3camo_vdv", "rhs_tigr_m_vdv", "rhs_tigr_m_3camo_vdv", "rhs_gaz66_vdv", "rhs_gaz66o_vdv", "RHS_UAZ_vdv_01", "rhs_UAZ_open_vdv_01", "RHS_Ural_vdv_01", "RHS_Ural_Open_vdv_01", "rhs_typhoon_vdv"],
["RHS_UAZ_chdkz", "rhs_uav_open_chdkz", "rhs_ural_chdkz", "rhs_ural_open_chdkz", "rhs_ural_work_open_chdkz", "rhs_ural_work_chdkz", "I_G_Offroad_01_F", "I_G_Quadbike_01_F", "I_G_Van_01_transport_F", "C_Quadbike_01_F", "C_Offroad_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "RHS_Ural_Civ_01", "RHS_Ural_Open_Civ_01", "RHS_Ural_Civ_03", "RHS_Ural_Open_Civ_03", "RHS_Ural_Civ_02", "RHS_Ural_Open_Civ_02"],
["C_Quadbike_01_F", "C_Offroad_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "RHS_Ural_Civ_01", "RHS_Ural_Open_Civ_01", "RHS_Ural_Civ_03", "RHS_Ural_Open_Civ_03", "RHS_Ural_Civ_02", "RHS_Ural_Open_Civ_02"]
];

ARMEDSTATIC = [
["B_mas_it_Mortar_01_F", "B_mas_it_static_AT_F", "B_mas_it_static_AA_F", "B_mas_it_static_AT2_F", "B_mas_it_static_AA2_F", "B_mas_it_GMG_01_F", "B_mas_it_GMG_01_high_F", "B_mas_it_HMG_01_F", "B_mas_it_HMG_01_high_F", "B_mas_it_M119_F", "B_mas_it_M119_AT_F"],
["rhs_D30_msv", "rhs_d30_at_msv", "rhs_2b14_82mm_msv", "rhs_Metis_9k115_2_msv", "rhs_Igla_AA_pod_msv", "RHS_AGS30_TriPod_MSV", "rhs_KORD_high_MSV", "rhs_KORD_MSV", "RHS_NSV_TriPod_MSV"],
["rhs_D30_ins", "rhs_D30_at_ins", "rhs_2b14_82mm_ins", "rhs_9k115_1_ins", "rhs_Metis_9k115_2_ins", "rhs_Igla_AA_pod_ins", "RHS_AGS30_TriPod_INS", "rhs_DSHKM_ins", "rhs_DSHKM_Mini_TriPod_ins", "rhs_KORD_INS", "rhs_KORD_high_INS", "RHS_NSV_TriPod_INS", "rhs_SPG9_INS"],
["rhs_D30_ins", "rhs_D30_at_ins", "rhs_2b14_82mm_ins", "rhs_9k115_1_ins", "rhs_Metis_9k115_2_ins", "rhs_Igla_AA_pod_ins", "RHS_AGS30_TriPod_INS", "rhs_DSHKM_ins", "rhs_DSHKM_Mini_TriPod_ins", "rhs_KORD_INS", "rhs_KORD_high_INS", "RHS_NSV_TriPod_INS", "rhs_SPG9_INS"]
];

ARMEDSUPPORT = [
["B_mas_it_Truck_02_covered_F", "B_mas_it_Truck_02_transport_F", "B_mas_it_Truck_02_reammo_F", "B_mas_it_Truck_02_refuel_F", "B_mas_it_Truck_02_repair_F"],
["rhs_gaz66_ammo_msv","rhs_gaz66_r142_msv","rhs_gaz66_ap2_msv","rhs_gaz66_repair_msv","RHS_Ural_Fuel_MSV_01"],
["I_G_Van_01_fuel_F","I_G_Offroad_01_repair_F","C_Offroad_01_repair_F","C_Van_01_fuel_F","I_Truck_02_ammo_F","I_Truck_02_fuel_F","I_Truck_02_medical_F","I_Truck_02_box_F"]
];

CIVVEH = ["RHS_Ural_Open_Civ_02","RHS_Ural_Civ_02","RHS_Ural_Open_Civ_03","RHS_Ural_Civ_03","RHS_Ural_Open_Civ_01","RHS_Ural_Civ_01","C_Van_01_fuel_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F","I_G_Van_01_fuel_F","I_G_Offroad_01_repair_F","C_Offroad_01_repair_F","C_Van_01_fuel_F"];

AIRFIGTHER = [
["B_mas_it_Plane_02_F", "B_mas_it_Plane_S_02_F", "B_mas_it_Plane_CAS_02_F"],
["RHS_Su25SM_vvsc", "RHS_Su25SM_KH29_vvsc", "RHS_T50_vvs_generic", "RHS_T50_vvs_051", "RHS_T50_vvs_051", "RHS_T50_vvs_052", "RHS_T50_vvs_053", "RHS_T50_vvs_054", "RHS_T50_vvs_blueonblue"],
["I_Plane_Fighter_03_AA_F", "I_Plane_Fighter_03_CAS_F"],
["I_Plane_Fighter_03_AA_F", "I_Plane_Fighter_03_CAS_F"]
];

AIRARMCHOP = [
["B_mas_it_Heli_Light_01_armed_F", "B_mas_it_CH_47F"],
["RHS_Mi24P_AT_vdv", "RHS_Mi24P_CAS_vdv", "RHS_Mi24P_vdv", "RHS_Mi24V_AT_vdv", "RHS_Mi24V_vdv", "RHS_Mi24V_FAB_vdv", "RHS_Mi24V_UPK23_vd", "RHS_Ka52_vvsc", "RHS_Ka52_UPK23_vvsc", "RHS_Mi24P_AT_vvsc", "RHS_Mi24P_CAS_vvsc", "RHS_Mi24P_vvsc", "RHS_Mi24V_AT_vvsc", "RHS_Mi24V_vvsc", "RHS_Mi24V_FAC_vvsc", "RHS_Mi24V_UPK223_vvsc"],
["I_Heli_Light_03_F"],
["I_Heli_Light_03_F"]
];
AIRCARRIERCHOP = [
["B_mas_it_Heli_Light_01_F", "B_mas_it_Heli_Light_01_armed_F", "B_mas_it_Heli_Transport_02_F", "B_mas_it_Heli_Med_02_F", "B_mas_it_CH_47F", "B_mas_it_Heli_light_03_F", "B_mas_it_Heli_light_03_unarmed_F", "B_mas_it_Heli_light_03_med_F"],
["RHS_Mi8AMT_vdv", "RHS_Mi8mt_vdv", "RHS_Mi8mt_Cargo_vdv", "RHS_Mi8MTV3_vdv", "RHS_Mi8MTV3_FAV_vdv", "RHS_Mi8MTV3_UPK23_vdv", "rhs_ka60_c", "RHS_Mi8AMT_vvsc", "RHS_Mi8AMTSh_vvsc", "RHS_Mi8AMTSh_FAV_vvsc", "RHS_Mi8AMTSh_UPK23_vvsc", "RHS_Mi8mt_vvsc", "RHS_Mi8mt_Cargo_vvsc", "RHS_Mi8MTV3_vvsc", "RHS_Mi8MTV3_FAB_vvsc", "RHS_Mi8MTV3_UPK23_vvsc"],
["RHS_Mi8amt_chdkz", "C_Heli_light_01_civil_F", "RHS_Mi8amt_civilian", "I_Heli_light_03_unarmed_F"],
["RHS_Mi8amt_chdkz", "C_Heli_light_01_civil_F", "RHS_Mi8amt_civilian", "I_Heli_light_03_unarmed_F"]
];
ENEMYC1 = ["rhs_vdv_aa", "rhs_vdv_at", "rhs_vdv_arifleman", "rhs_vdv_efreitor", "rhs_vdv_engineer", "rhs_vdv_grenadier_rpg", "rhs_vdv_strelok_rpg_assist", "rhs_vdv_junior_sergeant", "rhs_vdv_machinegunner", "rhs_vdv_machinegunner_assisstant", "rhs_vdv_marksman", "rhs_vdv_marksman_asval", "rhs_vdv_medic", "rhs_vdv_officer_armored", "rhs_vdv_rifleman", "rhs_vdv_rifleman_asval", "rhs_vdv_grenadier", "rhs_vdv_LAT", "rhs_-vdv_RShG2", "rhs_vdv_segeant"];
ENEMYC2 = ["rhs_vdv_recon_efreitor", "rhs_vdv_recon_machinegunner_assistant", "rhs_vdv_recon_marksman", "rhs_vdv_recon_marksman_asval", "rhs_vdv_recon_medic", "rhs_vdv_recon_officer", "rhs_vdv_recon_rifleman", "rhs_vdv_recon_rifleman_ak103", "rhs_vdv_recon_rifleman_akms", "rhs_vdv_recon_rifleman_asval", "rhs_vdv_recon_grenadier", "rhs_vdv_recon_rifleman_l", "rhs_vdv_recon_rifleman_lat", "rhs_vdv_recon_rifleman_scout_akm", "rhs_vdv_recon_rifleman_scout", "rhs_vdv_grenadier_scout", "rhs_vdv_recon_arifleman_scout", "rhs_vdv_recon_sergeant"];
ENEMYC3 = ["rhs_msv_emr_aa", "rhs_msv_emr_at", "rhs_msv_emr_arifleman", "rhs_msv_emr_efreitor", "rhs_msv_emr_engineer", "rhs_msv_emr_engineer", "rhs_msv_emr_grenadier_rpg", "rhs_msv_emr_strelok_rpg_assist", "rhs_msv_emr_junior_sergeant", "rhs_msv_emr_machinegunner_assistant", "rhs_msv_emr_marksman", "rhs_msv_emr_medic", "rhs_msv_emr_officer", "rhs_msv_emr_officer_armored", "rhs_msv_emr_rifleman", "rhs_msv_emr_grenadier", "rhs_msv_emr_LAT", "rhs_msv_emr_RShG2", "rhs_msv_emr_sergeant"];
FRIENDC1 = ["B_mas_it_Soldier_F", "B_mas_it_Soldier_Fm", "B_mas_it_Soldier_F_a", "B_mas_it_Soldier_F_am", "B_mas_it_Soldier_F_v", "B_mas_it_Soldier_F_vm", "B_mas_it_Soldier_F_d", "B_mas_it_Soldier_F_dm", "B_mas_it_Soldier_F_g", "B_mas_it_Soldier_F_w", "B_mas_it_Soldier_F_wm", "B_mas_it_Soldier_02_f", "B_mas_it_Soldier_02_f_a", "B_mas_it_Soldier_02_f_v", "B_mas_it_Soldier_02_f_d", "B_mas_it_Soldier_03_f", "B_mas_it_Soldier_03_f_a", "B_mas_it_Soldier_04_f_a", "B_mas_it_Soldier_05_f_a", "B_mas_it_Soldier_03_f_v", "B_mas_it_Soldier_03_f_d", "B_mas_it_Soldier_GL_F", "B_mas_it_Soldier_GL_F_a", "B_mas_it_Soldier_GL_F_v", "B_mas_it_Soldier_GL_F_d", "B_mas_it_Soldier_GL_F_g", "B_mas_it_Soldier_GL_F_w", "B_mas_it_Soldier_JTAC_F", "B_mas_it_Soldier_JTAC_F_a", "B_mas_it_Soldier_JTAC_F_v", "B_mas_it_Soldier_JTAC_F_d", "B_mas_it_Soldier_JTAC_F_w", "B_mas_it_Soldier_UAV_F", "B_mas_it_Soldier_UAV_F_a", "B_mas_it_Soldier_UAV_F_v", "B_mas_it_Soldier_UAV_F_d", "B_mas_it_Soldier_UAV_F_w", "B_mas_it_soldier_AR_F", "B_mas_it_soldier_AR_F_a", "B_mas_it_soldier_AR_F_v", "B_mas_it_soldier_AR_F_d", "B_mas_it_soldier_AR_F_g", "B_mas_it_soldier_AR_F_w", "B_mas_it_soldier_MG_F", "B_mas_it_soldier_MG_F_a", "B_mas_it_soldier_MG_F_v", "B_mas_it_soldier_MG_F_d", "B_mas_it_soldier_MG_F_w", "B_mas_it_soldier_MG2_F", "B_mas_it_soldier_MG2_F_a", "B_mas_it_soldier_MG2_F_v", "B_mas_it_soldier_MG2_F_d", "B_mas_it_soldier_MG2_F_w", "B_mas_it_Soldier_lite_F", "B_mas_it_Soldier_lite_F_a", "B_mas_it_Soldier_lite_F_v", "B_mas_it_Soldier_lite_F_d", "B_mas_it_Soldier_lite_F_g", "B_mas_it_Soldier_lite_F_w", "B_mas_it_Soldier_off_F", "B_mas_it_Soldier_off_F_a", "B_mas_it_Soldier_off_F_an", "B_mas_it_Soldier_off_F_v", "B_mas_it_Soldier_off_F_d", "B_mas_it_Soldier_off_F_g", "B_mas_it_Soldier_off_F_w", "B_mas_it_Soldier_off_F_wa", "B_mas_it_Soldier_off_F_wn", "B_mas_it_Soldier_SL_F", "B_mas_it_Soldier_SL_F_a", "B_mas_it_Soldier_SL_F_v", "B_mas_it_Soldier_SL_F_d", "B_mas_it_Soldier_SL_F_g", "B_mas_it_Soldier_SL_F_w", "B_mas_it_Soldier_TL_F", "B_mas_it_Soldier_TL_F_a", "B_mas_it_Soldier_TL_F_v", "B_mas_it_Soldier_TL_F_d", "B_mas_it_Soldier_TL_F_g", "B_mas_it_Soldier_TL_F_w", "B_mas_it_soldier_M_F", "B_mas_it_soldier_M_F_a", "B_mas_it_soldier_M_F_v", "B_mas_it_soldier_M_F_d", "B_mas_it_soldier_M_F_g", "B_mas_it_soldier_M_F_gn", "B_mas_it_soldier_M_F_w", "B_mas_it_soldier_M2_F", "B_mas_it_soldier_M2_F_a", "B_mas_it_soldier_M2_F_v", "B_mas_it_soldier_M2_F_d", "B_mas_it_soldier_M2_F_g", "B_mas_it_soldier_M2_F_gn", "B_mas_it_soldier_M2_F_w", "B_mas_it_soldier_Mh_F", "B_mas_it_soldier_Mh_F_a", "B_mas_it_soldier_Mh_F_v", "B_mas_it_soldier_Mh_F_d", "B_mas_it_soldier_Mh_F_g", "B_mas_it_soldier_Mh_F_gn", "B_mas_it_soldier_Mh_F_w", "B_mas_it_soldier_LAT_F", "B_mas_it_soldier_LAT_F_a", "B_mas_it_soldier_LAT_F_v", "B_mas_it_soldier_LAT_F_d", "B_mas_it_soldier_LAT_F_w", "B_mas_it_soldier_AT_F", "B_mas_it_soldier_AT_F_a", "B_mas_it_soldier_AT_F_v", "B_mas_it_soldier_AT_F_d", "B_mas_it_soldier_AT_F_w", "B_mas_it_soldier_LAA_F", "B_mas_it_soldier_LAA_F_a", "B_mas_it_soldier_LAA_F_v", "B_mas_it_soldier_LAA_F_d", "B_mas_it_soldier_LAA_F_w", "B_mas_it_medic_F", "B_mas_it_medic_F_a", "B_mas_it_medic_F_v", "B_mas_it_medic_F_d", "B_mas_it_medic_F_g", "B_mas_it_medic_F_w", "B_mas_it_soldier_repair_F", "B_mas_it_soldier_repair_F_a", "B_mas_it_soldier_repair_F_v", "B_mas_it_soldier_repair_F_d", "B_mas_it_soldier_repair_F_w", "B_mas_it_soldier_exp_F", "B_mas_it_soldier_exp_F_a", "B_mas_it_soldier_exp_F_v", "B_mas_it_soldier_exp_F_d", "B_mas_it_soldier_exp_F_g", "B_mas_it_soldier_exp_F_w", "B_mas_it_soldier_exb_F", "B_mas_it_soldier_exb_F_a", "B_mas_it_soldier_exb_F_v", "B_mas_it_soldier_exb_F_d", "B_mas_it_soldier_exb_F_g", "B_mas_it_soldier_exb_F_w"];
FRIENDC2 = ["rhsusf_usmc_marpat_wd_stinger", "rhsusf_usmc_marpat_wd_smaw", "rhsusf_usmc_marpat_wd_javelin", "rhsusf_usmc_marpat_wd_autorifleman_m249", "rhsusf_usmc_marpat_wd_autorifleman", "rhsusf_usmc_recon_marpat_wd_autorifleman_lite", "rhsusf_usmc_marpat_wd_rifleman_m249_ass", "rhsusf_usmc_marpat_wd_engineer", "rhsusf_usmc_marpat_wd_marksman", "rhsusf_usmc_marpat_wd_explosives", "rhsusf_usmc_marpat_wd_fso", "rhsusf_usmc_marpat_wd_grenadier", "rhsusf_usmc_marpat_wd_grenadier_m32", "rhsusf_usmc_marpat_wd_machinegunner", "rhsusf_usmc_wd_machinegunner_ass", "rhsusf_usmc_recon_marpat_wd_marksman_lite", "rhsusf_usmc_marpat_wd_officer", "rhsusf_usmc_marpat_wd_rifleman_light", "rhsusf_usmc_marpat_wd_riflemanat", "rhsusf_usmc_recon_marpat_wd_rifleman_at_lite", "rhsusf_usmc_marpat_wd_rifleman", "rhsusf_usmc_marpat_wd_rifleman_m4", "rhsusf_usmc_marpat_wd_rifleman_m590", "rhsusf_usmc_lar_marpat_wd_riflemanat", "rhsusf_usmc_lar_marpat_wd_autofileman", "rhsusf_usmc_lar_marpat_wd_grenadier_m32", "rhsusf_usmc_lar_marpat_wd_rifleman", "rhsusf_usmc_lar_marpat_wd_rifleman_light", "rhsusf_usmc_lar_marpat_wd_marksman", "rhsusf_usmc_lar_marpat_wd_squadleader", "rhsusf_usmc_lar_marpat_wd_teamleader", "rhsusf_usmc_marpat_wd_sniper", "rhsusf_usmc_marpat_wd_spotter", "rhsusf_usmc_marpat_wd_teamleader", "rhsusf_usmc_recon_marpat_wd_teamleader_lite", "rhsusf_usmc_marpat_wd_uav"];
FRIENDC3 = ["rhsusf_ucmc_recon_marpat_wd_autorifleman", "rhsusf_usmc_recon_marpat_wd_machinegunner", "rhsusf_usmc_recon_marpat_wd_marksman", "rhsusf_usmc_recon_marpat_wd_rifleman", "rhsusf_usmc_recon_marpat_wd_rifleman_at", "rhsusf_usmc_recon_marpat_wd_teamleader"];
FRIENDC4 = ["rhs_g_Soldier_AA_F", "rhs_g_Soldier_exp_F", "rhs_g_Crew_F", "rhs_g_engineer_F", "rhs_g_Soldier_LAT_F", "rhs_g_Soldier_AAT_F", "rhs_g_Soldier_AR_F", "rhs_g_Soldier_AAR_F", "rhs_g_Soldier_M_F", "rhs_g_medic_F", "rhs_g_Soldier_F2", "rhs_g_Soldier_F3", "rhs_g_Soldier_F", "rhs_g_Soldier_GL_F", "rhs_g_Soldier_lite_F", "rhs_g_Soldier_AT_F", "rhs_g_Soldier_TL_F", "rhs_g_Soldier_SL_F"];
NORANWEES = true;
RHSENABLED = true;
SPECOPSENABLED = true;
};case "Iron Front": {
"Play as Germans against Soviet" SPAWN HINTSAOK;
lbClear 1503;
lbAdd [1503, "Recon"];
lbSetPicture [1503,0,"\A3\ui_f\data\map\markers\nato\b_recon.paa"];
lbSetTooltip [1503,0,"Lead 5 men team"];
lbSetCurSel [1503, 0];
//1 US 2 GERMAN 3 RUS 4 POLAND
ARMEDVEHICLES = [
["LIB_PzKpfwVI_B","LIB_PzKpfwVI_B","LIB_PzKpfwVI_B_camo","LIB_PzKpfwIV_H","LIB_PzKpfwV","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS"],
["LIB_JS2_43","LIB_JS2_43","LIB_t34_76","LIB_t34_85","LIB_SU85","LIB_t34_76","LIB_t34_85","LIB_t34_76","LIB_t34_85"],
["LIB_PzKpfwVI_B","LIB_PzKpfwVI_B","LIB_PzKpfwVI_B_camo","LIB_PzKpfwIV_H","LIB_PzKpfwV","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS"],
["LIB_PzKpfwVI_B","LIB_PzKpfwVI_B","LIB_PzKpfwVI_B_camo","LIB_PzKpfwIV_H","LIB_PzKpfwV","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS"]
];

ARMEDTANKS = [
["LIB_PzKpfwVI_B","LIB_PzKpfwVI_B","LIB_PzKpfwVI_B_camo","LIB_PzKpfwIV_H","LIB_PzKpfwV","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS"],
["LIB_JS2_43","LIB_JS2_43","LIB_t34_76","LIB_t34_85","LIB_SU85","LIB_t34_76","LIB_t34_85","LIB_t34_76","LIB_t34_85"],
["LIB_PzKpfwVI_B","LIB_PzKpfwVI_B","LIB_PzKpfwVI_B_camo","LIB_PzKpfwIV_H","LIB_PzKpfwV","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS"],
["LIB_PzKpfwVI_B","LIB_PzKpfwVI_B","LIB_PzKpfwVI_B_camo","LIB_PzKpfwIV_H","LIB_PzKpfwV","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS"]
];

ARMEDAA = [
["LIB_SdKfz_7_AA","LIB_FlaK_38","LIB_Flakvierling_38"],
["LIB_61k"],
["LIB_SdKfz_7_AA","LIB_FlaK_38","LIB_Flakvierling_38"],
["LIB_SdKfz_7_AA","LIB_FlaK_38","LIB_Flakvierling_38"]
];

ARMEDCARRIER = [
["LIB_opelblitz_open_y_camo","LIB_opelblitz_tent_y_camo","Lib_sdkfz251","LIB_SdKfz_7"],
["LIB_Scout_m3","Lib_SdKfz251_captuRed","lib_us6_tent","lib_us6_open","lib_zis5v"],
["LIB_opelblitz_open_y_camo","LIB_opelblitz_tent_y_camo","Lib_sdkfz251","LIB_SdKfz_7"],
["LIB_opelblitz_open_y_camo","LIB_opelblitz_tent_y_camo","Lib_sdkfz251","LIB_SdKfz_7"]
];

ARMEDSTATIC = [
["LIB_61k","LIB_Zis3","LIB_BM37","SearchLight_SU"],
["LIB_61k","LIB_Zis3","LIB_BM37","SearchLight_SU"],
["SearchLight_GER","LIB_Pak40","LIB_Flakvierling_38","LIB_FlaK_38"],
["LIB_61k","LIB_Zis3","LIB_BM37","SearchLight_SU"]
];

ARMEDSUPPORT = [
["LIB_opelblitz_ambulance","lib_opelblitz_ammo","LIB_opelblitz_fuel","LIB_opelblitz_parm"],
["lib_zis6_parm","lib_zis5v_fuel","lib_zis5v_med","lib_us6_ammo","lib_us6_bm13"],
["LIB_opelblitz_ambulance","lib_opelblitz_ammo","LIB_opelblitz_fuel","LIB_opelblitz_parm"]
];

CIVVEH = ["LIB_US_GMC_Tent","LIB_US_GMC_Open"];

AIRFIGTHER = [
["LIB_FW190F8","LIB_Ju87"],
["LIB_Pe2","LIB_P39"],
["LIB_FW190F8","LIB_Ju87"],
["LIB_FW190F8","LIB_Ju87"]
];

AIRARMCHOP = [
["LIB_FW190F8","LIB_Ju87"],
["LIB_Pe2","LIB_P39"],
["LIB_FW190F8","LIB_Ju87"],
["LIB_FW190F8","LIB_Ju87"]
];
AIRCARRIERCHOP = [
["LIB_FW190F8","LIB_Ju87"],
["LIB_Pe2","LIB_P39"],
["LIB_FW190F8","LIB_Ju87"],
["LIB_FW190F8","LIB_Ju87"]
];
CRATECLAS = [
["LIB_BasicAmmunitionBox_GER","LIB_BasicWeaponsBox_GER","LIB_WeaponsBox_Big_GER"]
,["LIB_Lone_Big_Box","LIB_WeaponsBox_Big_SU","LIB_BasicWeaponsBox_SU","LIB_Mine_Ammo_Box_Su","LIB_BasicAmmunitionBox_SU"]
,["LIB_BasicAmmunitionBox_GER","LIB_BasicWeaponsBox_GER","LIB_WeaponsBox_Big_GER"]
,["LIB_BasicAmmunitionBox_GER","LIB_BasicWeaponsBox_GER","LIB_WeaponsBox_Big_GER"]
];
ENEMYC1 = ["LIB_SOV_sergeant","LIB_SOV_p_officer","LIB_SOV_smgunner","LIB_SOV_smgunner","LIB_SOV_LC_rifleman","LIB_SOV_mgunner","LIB_SOV_medic","LIB_SOV_AT_grenadier","LIB_SOV_AT_grenadier","LIB_SOV_AT_soldier","LIB_SOV_AT_soldier","LIB_SOV_rifleman"];
ENEMYC2 = ["LIB_SOV_sergeant","LIB_SOV_p_officer","LIB_SOV_smgunner","LIB_SOV_smgunner","LIB_SOV_LC_rifleman","LIB_SOV_mgunner","LIB_SOV_medic","LIB_SOV_AT_grenadier","LIB_SOV_AT_grenadier","LIB_SOV_AT_soldier","LIB_SOV_AT_soldier","LIB_SOV_rifleman"];
ENEMYC3 = ["LIB_SOV_sergeant","LIB_SOV_p_officer","LIB_SOV_smgunner","LIB_SOV_smgunner","LIB_SOV_LC_rifleman","LIB_SOV_mgunner","LIB_SOV_medic","LIB_SOV_AT_grenadier","LIB_SOV_AT_grenadier","LIB_SOV_AT_soldier","LIB_SOV_AT_soldier","LIB_SOV_rifleman"];
FRIENDC2 = ["LIB_GER_AT_soldier","LIB_GER_AT_grenadier","LIB_GER_smgunner","LIB_GER_scout_smgunner","LIB_GER_ober_lieutenant","LIB_GER_scout_lieutenant","LIB_GER_mgunner","LIB_GER_scout_mgunner","LIB_GER_medic","LIB_GER_radioman","LIB_GER_ober_rifleman","LIB_GER_scout_ober_rifleman","LIB_GER_rifleman","LIB_GER_scout_rifleman","LIB_GER_sapper","LIB_GER_sapper_gefr","LIB_GER_lieutenant","LIB_GER_unterofficer","LIB_GER_scout_sniper","LIB_GER_stggunner"];
FRIENDC3 = ["SG_sturmtrooper_unterofficer","SG_sturmtrooper_mgunner","SG_sturmtrooper_sniper","SG_sturmtrooper_ober_rifleman","SG_sturmtrooper_stggunner","SG_sturmtrooper_stggunner","SG_sturmtrooper_rifleman","SG_sturmtrooper_rifleman","SG_sturmtrooper_rifleman","SG_sturmtrooper_medic"];
FRIENDC1 = ["LIB_GER_AT_soldier","LIB_GER_AT_grenadier","LIB_GER_smgunner","LIB_GER_scout_smgunner","LIB_GER_ober_lieutenant","LIB_GER_scout_lieutenant","LIB_GER_mgunner","LIB_GER_scout_mgunner","LIB_GER_medic","LIB_GER_radioman","LIB_GER_ober_rifleman","LIB_GER_scout_ober_rifleman","LIB_GER_rifleman","LIB_GER_scout_rifleman","LIB_GER_sapper","LIB_GER_sapper_gefr","LIB_GER_lieutenant","LIB_GER_unterofficer","LIB_GER_scout_sniper","LIB_GER_stggunner"];
FRIENDC4 = ["SG_sturmtrooper_unterofficer","SG_sturmtrooper_mgunner","SG_sturmtrooper_sniper","SG_sturmtrooper_ober_rifleman","SG_sturmtrooper_stggunner","SG_sturmtrooper_stggunner","SG_sturmtrooper_rifleman","SG_sturmtrooper_rifleman","SG_sturmtrooper_rifleman","SG_sturmtrooper_medic"];
NORANWEES = true;
IFENABLED = true;
IFSOVIET = true;
lbClear 1504;
lbAdd [1504, "Land Insertion"];
lbSetPicture [1504,0,"\A3\ui_f\data\map\markers\handdrawn\unknown_CA.paa"];
lbSetTooltip [1504,0,"Your team begin from green marked location"];
lbSetCurSel [1504, 0];
};
case "Iron Front Fic": {
"Fictional - Play as Americans allied, with Germans and Polish, against Soviet" SPAWN HINTSAOK;
lbClear 1503;
lbAdd [1503, "Recon"];
lbSetPicture [1503,0,"\A3\ui_f\data\map\markers\nato\b_recon.paa"];
lbSetTooltip [1503,0,"Lead 5 men team"];
lbSetCurSel [1503, 0];
//1 US 2 GERMAN 3 RUS 4 POLAND
ARMEDVEHICLES = [
["LIB_M4A3_75"],
["LIB_JS2_43","LIB_JS2_43","LIB_t34_76","LIB_t34_85","LIB_SU85","LIB_t34_76","LIB_t34_85","LIB_t34_76","LIB_t34_85"],
["LIB_PzKpfwVI_B","LIB_PzKpfwVI_B","LIB_PzKpfwVI_B_camo","LIB_PzKpfwIV_H","LIB_PzKpfwV","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS"],
["Lib_Willys_MB"]
];

ARMEDTANKS = [
["LIB_M4A3_75"],
["LIB_JS2_43","LIB_JS2_43","LIB_t34_76","LIB_t34_85","LIB_SU85","LIB_t34_76","LIB_t34_85","LIB_t34_76","LIB_t34_85"],
["LIB_PzKpfwVI_B","LIB_PzKpfwVI_B","LIB_PzKpfwVI_B_camo","LIB_PzKpfwIV_H","LIB_PzKpfwV","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS","LIB_StuG_III_G","LIB_StuG_III_G_WS"],
["Lib_Willys_MB"]
];

ARMEDAA = [
["LIB_61k"],
["LIB_61k"],
["LIB_SdKfz_7_AA","LIB_FlaK_38","LIB_Flakvierling_38"],
["Lib_Willys_MB"]
];

ARMEDCARRIER = [
["LIB_US_GMC_Tent","LIB_US_GMC_Open","LIB_US_Scout_m3","LIB_US_Scout_m3"],
["LIB_Scout_m3","Lib_SdKfz251_captuRed","lib_us6_tent","lib_us6_open","lib_zis5v"],
["LIB_opelblitz_open_y_camo","LIB_opelblitz_tent_y_camo","Lib_sdkfz251","LIB_SdKfz_7"],
["lib_us6_tent","lib_us6_open"]
];

ARMEDSTATIC = [
["LIB_61k","LIB_Zis3","LIB_BM37","SearchLight_SU"],
["LIB_61k","LIB_Zis3","LIB_BM37","SearchLight_SU"],
["SearchLight_GER","LIB_Pak40","LIB_Flakvierling_38","LIB_FlaK_38"],
["LIB_61k","LIB_Zis3","LIB_BM37","SearchLight_SU"]
];

ARMEDSUPPORT = [
["LIB_US_GMC_Ambulance","LIB_US_GMC_Ammo","LIB_US_GMC_Fuel","LIB_US_GMC_Parm"],
["lib_zis6_parm","lib_zis5v_fuel","lib_zis5v_med","lib_us6_ammo","lib_us6_bm13"],
["LIB_opelblitz_ambulance","lib_opelblitz_ammo","LIB_opelblitz_fuel","LIB_opelblitz_parm"]
];

CIVVEH = ["LIB_US_GMC_Tent","LIB_US_GMC_Open"];

AIRFIGTHER = [
["LIB_P47"],
["LIB_Pe2","LIB_P39"],
["LIB_FW190F8","LIB_Ju87"],
["LIB_Pe2","LIB_P39"]
];

AIRARMCHOP = [
["LIB_P47"],
["LIB_Pe2","LIB_P39"],
["LIB_FW190F8","LIB_Ju87"],
["LIB_Pe2","LIB_P39"]
];
AIRCARRIERCHOP = [
["LIB_P47"],
["LIB_Pe2","LIB_P39"],
["LIB_FW190F8","LIB_Ju87"],
["LIB_Pe2","LIB_P39"]
];
CRATECLAS = [
["LIB_BasicWeaponsBox_US","LIB_Mine_AmmoBox_US","LIB_BasicAmmunitionBox_US"]
,["LIB_Lone_Big_Box","LIB_WeaponsBox_Big_SU","LIB_BasicWeaponsBox_SU","LIB_Mine_Ammo_Box_Su","LIB_BasicAmmunitionBox_SU"]
,["LIB_BasicAmmunitionBox_GER","LIB_BasicWeaponsBox_GER","LIB_WeaponsBox_Big_GER"]
,["LIB_Lone_Big_Box","LIB_WeaponsBox_Big_SU","LIB_BasicWeaponsBox_SU","LIB_Mine_Ammo_Box_Su","LIB_BasicAmmunitionBox_SU"]
];
ENEMYC1 = ["LIB_SOV_sergeant","LIB_SOV_p_officer","LIB_SOV_smgunner","LIB_SOV_smgunner","LIB_SOV_LC_rifleman","LIB_SOV_mgunner","LIB_SOV_medic","LIB_SOV_AT_grenadier","LIB_SOV_AT_grenadier","LIB_SOV_AT_soldier","LIB_SOV_AT_soldier","LIB_SOV_rifleman"];
ENEMYC2 = ["LIB_SOV_sergeant","LIB_SOV_p_officer","LIB_SOV_smgunner","LIB_SOV_smgunner","LIB_SOV_LC_rifleman","LIB_SOV_mgunner","LIB_SOV_medic","LIB_SOV_AT_grenadier","LIB_SOV_AT_grenadier","LIB_SOV_AT_soldier","LIB_SOV_AT_soldier","LIB_SOV_rifleman"];
ENEMYC3 = ["LIB_SOV_sergeant","LIB_SOV_p_officer","LIB_SOV_smgunner","LIB_SOV_smgunner","LIB_SOV_LC_rifleman","LIB_SOV_mgunner","LIB_SOV_medic","LIB_SOV_AT_grenadier","LIB_SOV_AT_grenadier","LIB_SOV_AT_soldier","LIB_SOV_AT_soldier","LIB_SOV_rifleman"];
FRIENDC2 = ["LIB_GER_AT_soldier","LIB_GER_AT_grenadier","LIB_GER_smgunner","LIB_GER_scout_smgunner","LIB_GER_ober_lieutenant","LIB_GER_scout_lieutenant","LIB_GER_mgunner","LIB_GER_scout_mgunner","LIB_GER_medic","LIB_GER_radioman","LIB_GER_ober_rifleman","LIB_GER_scout_ober_rifleman","LIB_GER_rifleman","LIB_GER_scout_rifleman","LIB_GER_sapper","LIB_GER_sapper_gefr","LIB_GER_lieutenant","LIB_GER_unterofficer","LIB_GER_scout_sniper","LIB_GER_stggunner"];
FRIENDC3 = ["SG_sturmtrooper_unterofficer","SG_sturmtrooper_mgunner","SG_sturmtrooper_sniper","SG_sturmtrooper_ober_rifleman","SG_sturmtrooper_stggunner","SG_sturmtrooper_stggunner","SG_sturmtrooper_rifleman","SG_sturmtrooper_rifleman","SG_sturmtrooper_rifleman","SG_sturmtrooper_medic"];
FRIENDC1 = ["LIB_US_AT_soldier","LIB_US_engineer","LIB_US_grenadier","LIB_US_radioman","LIB_US_second_lieutenant","LIB_US_sniper","LIB_US_smgunner","LIB_US_mgunner","LIB_US_medic","LIB_US_corporal","LIB_US_mgunner","LIB_US_FC_rifleman","LIB_US_FC_rifleman","LIB_US_rifleman","LIB_US_rifleman","LIB_US_rifleman"];
FRIENDC4 = ["LIB_wp_saper","LIB_wp_sniper","LIB_wp_AT_grenadier","LIB_wp_porucznic","LIB_wp_sierzant","LIB_wp_mgunner","LIB_wp_sniper","LIB_wp_starszy_strzelec","LIB_wp_stggunner","LIB_wp_AT_grenadier","LIB_wp_strzelec","LIB_wp_strzelec","LIB_wp_strzelec","LIB_wp_medic"];
NORANWEES = true;
IFENABLED = true;
lbClear 1504;
lbAdd [1504, "Land Insertion"];
lbSetPicture [1504,0,"\A3\ui_f\data\map\markers\handdrawn\unknown_CA.paa"];
lbSetTooltip [1504,0,"Your team begin from green marked location"];
lbSetCurSel [1504, 0];
};
};
[] SPAWN {
private ["_remBad"];
_remBad = {
private ["_c"];
_c = [];
{if (isClass(configFile >> "cfgVehicles" >> _x)) then {_c pushback _x;};} foreach _this;
_c
};
CIVS1 = CIVS1 CALL _remBad;
ENEMYC1 = ENEMYC1 CALL _remBad;
ENEMYC2 = ENEMYC2 CALL _remBad;
ENEMYC3 = ENEMYC3 CALL _remBad;
FRIENDC1 = FRIENDC1 CALL _remBad;
FRIENDC2 = FRIENDC2 CALL _remBad;
FRIENDC3 = FRIENDC3 CALL _remBad;
FRIENDC4 = FRIENDC4 CALL _remBad;
};
};




