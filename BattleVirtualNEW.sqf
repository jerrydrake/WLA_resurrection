private ["_batteF","_r","_F","_E","_mP","_C","_G","_n"];
SAOKRELO = [];
//TO DO 
//ANIMATE BULLET
//SOUND EFFECTS
//CAN POST MEN BE KILLED?
//USE OF SMOKE f
//LASER GUIDING
//DISABLE MORTAR/ART vs AIR f
//DIR BUGI

//ghg = 0; configfile >> "CfgVehicles" >> "I_MBT_03_base_F" >> "Turrets" >> "MainTurret" >> "weapons"
//configfile >> "CfgWeapons" >> "cannon_120mm_long" >> "short" >> "StandardSound" >> "soundBegin"
//configfile >> "CfgWeapons" >> "cannon_120mm_long" >> "magazines"
SaOkFleeF = {
private ["_landC","_dt","_mP","_ene","_dir","_dis","_fleeP","_wp"];
_mP = locationposition (_this select 0);
if (((_this select 0) getvariable "Mtype") in ["o_naval","n_naval","b_naval"]) exitWith {
_landC = [_mP,1000,250,"(1 + sea)"] CALL SAOKSEEKPOS;  
if (surfaceiswater _landC) then {
[_this select 0,[],_landC] SPAWN SAOKFINDROUTEANDMOVE;[_this select 0,"Fleeing"] SPAWN SAOKADDVEHZCON;
};
};
_ene = if (typename (_this select 1) == "LOCATION") then {locationposition (_this select 1)} else {_this select 1};
_ane = if (typename (_this select 0) == "LOCATION") then {locationposition (_this select 0)} else {_this select 0};
if (random 1 < 0.2 && {count _this < 3}) then {[(_this select 0),_ene] SPAWN SAOKCALLGELP;};
_dir = ([_ene, _ane] call SAOKDIRT);
_dis = 700 + random 1200;
_fleeP = [(_mP select 0)+(sin _dir)*_dis,(_mP select 1)+(cos _dir)*_dis,0];
_wp = [_fleeP,450,0,"(1 - sea)"] CALL SAOKSEEKPOS; 
if (!surfaceiswater _wp) then {
(_this select 0) call SAOKVZMOVESTOP;
sleep 2;
_dt = ["ColorRed","ColorRed","ColorBlue",["o_air","o_uav","o_plane"]];
if (((_this select 0) getvariable "Mcolor") != "ColorRed") then {_dt = ["ColorBlue","ColorGreen","ColorRed",["b_air","b_uav","b_plane","n_air","n_uav","n_plane"]];};
[_this select 0,(_dt select 3),_wp] SPAWN SAOKFINDROUTEANDMOVE;
_te = if (count _this > 2) then {_this select 2} else {"Fleeing"};
[_this select 0,_te] SPAWN SAOKADDVEHZCON;
};
};

FUPCOR = {
private ["_p"];
_p = _this;
_p set [1,(_p select 1) + 55];
_p
};
BATTLENEWS = {

private ["_hint"];
[_hint] SPAWN SAOKBOXHINT;
};
_batteF = {
//_found = ["string", "String"] call SAOKINSTRING;
private ["_remFarPlatoons","_postD","_smokeF","_apuFS","_ammoNAME","_conF","_fBulletL","_foreachIndex","_kohde","_xS","_kS","_mar","_pi","_p","_ammo","_y","_pko","_mis","_sS","_sDat","_kDat","_kAm","_apuF","_odds","_lf","_striker","_mar1","_takeAMMO","_kohdeDam","_blueGreen","_red","_guardposts","_gG","_rG","_camps","_rC","_bC","_bo","_in","_st","_aTT","_tt","_smf","_kmp","_dir","_smdis","_smwall","_skP","_m","_y0","_bG","_daP","_uD","_ktyp","_styp"];
//[_striker, _ammo, [1,0.4,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
// [_sDat,["smoke","flare"]] call _smokeF;explosionEffect = "FuelExplosionBig"; playSound3D ["FuelExplosionBig".wss, player, false, getposATL player, 1];
_remFarPlatoons = {
private ["_nA","_platoons","_eL"];
_nA = [];
_platoons = _this select 0;
_platoons = [_platoons,[locationposition (_this select 1)],{_input0 distance locationposition _x},"ASCEND"] call SAOKSORTBY;
_eL = "";
{
_y = _x;
if ({[_x,(_y getvariable "Mtype")] call SAOKINSTRING} count ["plane","uav","chopper"] > 0 || {(["AA",(_y getvariable "Mtext")] call SAOKINSTRING)} || {typename _eL == "STRING"} || {locationposition (_this select 1) distance locationposition _x < (_eL + 120)}) then {
if ({[_x,(_y getvariable "Mtype")] call SAOKINSTRING} count ["plane","uav","chopper"] == 0 && {!(["AA",(_y getvariable "Mtext")] call SAOKINSTRING)} && {typename _eL == "STRING"}) then {_eL = locationposition (_this select 1) distance locationposition _x;};
_nA pushback _x;
if ({[_x,(_y getvariable "Mtype")] call SAOKINSTRING} count ["support","medical","mortar","art"] > 0) then {[_x,(_this select 1)] spawn SaOkFleeF;};
};
} foreach _platoons;
_nA
};
_hintMes = {
private ["_a","_b","_aCol","_bCol","_am","_hint","_t"];
_fol = {
private ["_c"];
_c = "#ff0000";
if (_this == "ColorGreen") then {_c = "#00CC33";};
if (_this == "ColorBlue") then {_c = "#3333CC";};
if (_this == "ColorGrey") then {_c = "#707070";};
_c
};
_a = _this select 0;
_b = _this select 1;
_aCol = _this select 2;
_bCol = "ColorRed";
_bT = "Guard Casultie";
_t = "";
if (_aCol == "ColorRed") then {
if (typename _b == "LOCATION") then {
_bT = if ((_b getvariable "Mcolor") == "ColorGrey") then {"Destroyed"} else {"Unknown Damage"};
_bCol =(_b getvariable "Mcolor"); 
_b = (_b getvariable "Mtype");
} else {
if (_b == "CAMP") then {_bCol = "ColorBlue";_b = "n_hq";} else {_bCol = "ColorGreen";_b = "n_inf";};
};
} else {
if (typename _b == "LOCATION") then {
_bT = if ((_b getvariable "Mcolor") == "ColorGrey") then {"Destroyed"} else {"Unknown Damage"};
_bCol = (_b getvariable "Mcolor"); 
_b = (_b getvariable "Mtype");
} else {
if (_b == "CAMP") then {_b = "o_hq";} else {_b = "o_inf";};
};
};
if (typename _a == "LOCATION") then {_a = (_a getvariable "Mtype");} else {
if (_aCol == "ColorRed") then {
if (_a == "CAMP") then {_a = "o_hq";_t = "Gunfire from Camp";} else {_a = "o_installation";_t = "Gunfire from Post";};
} else {
if (_a == "CAMP") then {_a = "n_hq";_t = "Gunfire from Camp";} else {_a = "n_installation";_t = "Gunfire from Post";};
};
};
_am = if (count _this > 5) then {_this select 5} else {""};
_am2 = if (count _this > 5) then {_this select 5} else {""};
if (_am != "") then {
_vCla = _this select 4;
_am = (getText (configfile >> "CfgMagazines" >> _am2 >> "displayName"));
if (_am == "") then {
_wps = getarray (configfile >> "CfgVehicles" >> _vCla >> "weapons");
{
if (_am2 in (getarray (configfile >> "CfgWeapons" >> _x >> "magazines"))) exitWith {_am = gettext (configfile >> "CfgWeapons" >> _x >> "displayName");};
} foreach _wps;
};
if (_am == "") then {
_am = (getText (configfile >> "CfgMagazines" >> _am2 >> "ammo"));
};
};
if (typename (_this select 0) != "LOCATION") then {_am = _t;} else {if (_am == "") then {_am = "Unknown Ammo";};};

_Lna = (_this select 3) CALL NEARESTLOCATIONNAME;
_hint = "<t color='#FFCC66'>"+ format ["%1",_Lna]+"</t>" + "<br/>";
_hint = _hint + format ["<img size='1.4' color='%2' image='%1'/> <t color='#CC3399'>%3</t>",(getText (configfile >> "CfgMarkers" >> _a >> "icon")),_aCol call _fol, _am] + "<br/>";
_hint = _hint + format ["<img size='1.4' color='%2' image='%1'/> <t color='#CC3399'>%3</t>",(getText (configfile >> "CfgMarkers" >> _b >> "icon")),_bCol call _fol, _bT];
[_hint] SPAWN SAOKBOXHINT;
};
_postD = {
private ["_f","_c","_uk"];
_f = 0.2;
_uk = 0.2;
switch (typeof _this) do {
case "Land_BagBunker_Small_F": {_uk = 0.4;};
case "Land_HBarrierTower_F": {_uk = 0.7;};
case "Land_BagBunker_Large_F": {_uk = 0.7;};
case "Land_BagBunker_Tower_F": {_uk = 0.7;};
case "Land_Cargo_Patrol_V2_F": {_uk = 1.3;};
case "Land_Cargo_Tower_V3_F": {_uk = 1.4;};
case "Land_Cargo_HQ_V1_F": {_uk = 1.5;};
case "trench_tank1": {_uk = 1;};
case "trench_big1": {_uk = 2;};
case "trench_mg1": {_uk = 1.7;};
case "trench_mg2": {_uk = 1.7;};
case "trench_mortar": {_uk = 0.2;};
};
_f = (count (_this getvariable "StaticO"))*0.05 + _uk;
_f
};

_smokeF = {
private ["_apuFS","_pi","_p","_ammo","_y0","_y","_sDat","_kAm"];
_apuFS = {
private ["_bol","_cm","_mm","_n","_m"];
_bol = false;
_n = _this select 0;
_m = _this select 1;
_cm = if (!isNil"_m" && {typename _m == "ARRAY"}) then {count _m} else {0};
while {_cm > 0} do {
_cm = _cm - 1;
_mm = _m select _cm;
if ({[_x, _mm select 0] call SAOKINSTRING} count _n > 0) exitWith {_bol = true;};
};
_bol
};
_sDat = _this select 0;
_kAm = if (count _this > 0) then {_this select 1} else {["smoke","flare"]};
_p = [];
for "_x" from 0 to (count _sDat - 1) do {_p pushback _x;};
_pi = _p call RETURNRANDOM; _p = _p - [_pi];
while {count _p > 0 && {!([_kAm,(_sDat select _pi) select 1] call _apuFS)}} do {_pi = _p call RETURNRANDOM; _p = _p - [_pi];};
_ammo = "";
if (typename _pi == "ARRAY" || {isnil{(_sDat select _pi) select 1}}) exitWith {};
if (([["smoke","flare"],(_sDat select _pi) select 1] call _apuFS)) then {
{
_y = _x;
{_y0 = _x select 0; if ([_y, _y0] call SAOKINSTRING) exitWith {_ammo = _x select 0;};} foreach ((_sDat select _pi) select 1);
if (_ammo != "") exitWith {};
} foreach _kAm;
};
if (_ammo != "") then {
[((_sDat select _pi) select 0), _ammo, "BUM"] SPAWN {_this SPAWN SAOKVIRSOUND};
[((_sDat select _pi) select 0), _ammo, "FLY"] SPAWN {sleep 0.2;_this SPAWN SAOKVIRSOUND};
[((_sDat select _pi) select 0), _ammo, "MIS"] SPAWN {sleep 0.4;_this SPAWN SAOKVIRSOUND};
};
if (_ammo != "") then {_ammo = [_pi,_ammo];};
_ammo
};
_ammoNAME = {
private ["_mn","_wps","_mag"];
_mn = "";
if (typename (_this select 0) == "STRING") then {
_mn = (getText (configfile >> "CfgMagazines" >> (_this select 0) >> "displayName"));
if (_mn == "") then {
_wps = getarray (configfile >> "CfgVehicles" >> (_this select 1) >> "weapons");
_mag = (_this select 0);
{
if (_mag in (getarray (configfile >> "CfgWeapons" >> _x >> "magazines"))) exitWith {_mn = gettext (configfile >> "CfgWeapons" >> _x >> "displayName");};
} foreach _wps;
};
if (_mn == "") then {
_mn = (getText (configfile >> "CfgMagazines" >> (_this select 0) >> "ammo"));
};
};
_mn
};
_conF = {
private ["_id","_z","_t","_col","_pic"];
if (!visiblemap) exitWith {};
_z = _this select 0;
_t = if (!isNil{(_this select 1)} && {typename (_this select 1) == "STRING"}) then {_this select 1} else {"Unknown Ammo"};
_col = _this select 2;
_pic = _this select 3;
_id = "";
if (typename _z == "LOCATION") then {
_zN = str _z;
missionnamespace setvariable [_zN,_z];
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawIcon [
		'%4',
		%3,
		'%1' call LOCPOSR,
		21,
		21,
		0,
		'%2',
		2,
		0.035,
		'TahomaB',
		'right'
	]
",str _z,_t,_col,_pic]];
sleep 5;
(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
} else {
_z = if (typename (_this select 0) == "ARRAY") then {_this select 0} else {if (typename (_this select 0) == "STRING") then {getmarkerpos (_this select 0)} else {getposATL (_this select 0)}};
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawIcon [
		'%4',
		%3,
		(%1 call FUPCOR),
		21,
		21,
		0,
		'%2',
		2,
		0.035,
		'TahomaB',
		'right'
	]
",_z,_t,_col,_pic]];
sleep 5;
(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
};
};
LineFFF = {
private ["_p","_di","_dis","_t","_dd","_tM"];
_p = _this select 0;
_di = _this select 1;
_dis = _this select 2;
_t = _this select 3;
_tM = time - (_this select 4);
if (!isNil{missionnamespace getvariable _t}) then {
if (count _this > 5) then {missionnamespace setvariable [_t,(missionnamespace getvariable _t)+(_dis*_tM)];};
};
_dd = if (!isNil{missionnamespace getvariable _t}) then {(missionnamespace getvariable _t)} else {_dis};
_p = [(_p select 0) + (sin _di)*_dd,(_p select 1) + (cos _di)*_dd,0];
if (!isNil{missionnamespace getvariable _t}) then {
if ((missionnamespace getvariable _t) > _dis && {!(count _this > 4)}) then {missionnamespace setvariable [_t,nil];};
};
_p
};
_fBulletL = {
private ["_shooter","_target","_id","_tiM"];
if (!visiblemap) exitWith {};
_shooter = (_this select 0);
_target = (_this select 1);
_dis = _shooter distance _target;
_di = [_shooter,_target] call SAOKDIRT;
_target = [(_shooter select 0) + (sin _di)*15,(_shooter select 1) + (cos _di)*15,0];
NUMM=NUMM+1; _t = format ["BUL%1",NUMM];
missionnamespace setvariable [_t,0];
_tiM = time;
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawLine [
		([%1,%3,%4,'%5',%6,[]] call LineFFF),
		([%2,%3,%4,'%5',%6] call LineFFF),
		[1,0.2,0.8,1]
	];
",_shooter, _target, _di,_dis,_t,_tiM]];
waitUntil {sleep 0.01; isNil{(missionnamespace getvariable _t)}};
(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
//missionnamespace setvariable [_t,nil];
};
_takeAMMO = {
private ["_n","_dd","_foreachIndex","_sDa","_pi","_d","_d1","_rn"];
_sDa = _this select 1;
_pi = _this select 2;
_d = _sDa select _pi;
_d1 = (_d select 1);
{if (_this select 3 == _x select 0) exitWith {_rn = 1 +  floor (random 5); _n = (_x select 1)- _rn; if (_n <= 0) then {_d1 deleteat _foreachIndex;} else {_dd = _x; _dd set [1,_n];_d1 set [_foreachIndex,_dd];};};sleep 0.1;} foreach _d1;
_d set [1, _d1];
_sDa set [_pi, _d];
[_this select 0,_sDa] CALL SAOKZONED;
if (["_plane", ((_this select 0) getvariable "Mtype")] call SAOKINSTRING) then {
_sss = "F";
if (((_this select 0) getvariable "Mcolor") == "ColorRed") then {_sss = "E";};
[_sss,"TAC"] SPAWN SAOKRADIOMES;
};
};
_kohdeDam = {
private ["_dv","_n","_z","_d","_mDam","_g","_newD","_sss"];
_z = _this select 0;
_d = _this select 1;
_mDam = (_this select 2)*0.4 + random (_this select 2)*0.6;
_g = [];
_newD = [];
for "_x" from 0 to (count _d - 1) do {_g pushback _x;};
_n = _g call RETURNRANDOM;
_g = _g - [_n];
{_newD pushback (_d select _x);sleep 0.1;} foreach _g;
if (((_d select _n) select 3 + _mDam) <= 0.95) then {_dv = (_d select _n); _dv set [3,(((_d select _n) select 3) + _mDam)];_newD pushback _dv;};
if (count _newD < 1) then {
if (["_air", (_z getvariable "Mtype")] call SAOKINSTRING) then {
_sss = "F";
if ((_z getvariable "Mcolor") == "ColorRed") then {_sss = "E";};
[_sss,"CHOPD"] SPAWN SAOKRADIOMES;
};
_sss = "E";
if ((_z getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"TERM"] SPAWN SAOKRADIOMES;
["", "", "DES"] SPAWN SAOKVIRSOUND;_z call SAOKVZMOVESTOP;_z CALL SAOKZONED;_z CALL SAOKZONEG;_n = _z CALL SAOKZONEM;VEHZONES = VEHZONES - [_z];VEHZONESA = VEHZONESA - [_z];_z setvariable ["Mcolor","ColorGrey"];_z SPAWN {sleep 30;missionnamespace setvariable [(_this getvariable "IDCODE"),nil];_this call resFexit;deleteLocation _this;};} else {[_z,_newD] CALL SAOKZONED;};
};
_apuF = {
private ["_bol","_cm","_mm","_n","_m"];
_bol = false;
_n = _this select 0;
_m = _this select 1;

_cm = if (!isNil"_m" && {typename _m == "ARRAY"}) then {count _m} else {0};
while {_cm > 0} do {
_cm = _cm - 1;
_mm = _m select _cm;
if ({[_x, _mm select 0] call SAOKINSTRING && {{[_x, _mm select 0] call SAOKINSTRING} count ["smoke","flare"] == 0}} count _n > 0) exitWith {_bol = true;};
};
_bol
};

_aaHelp = {
private ["_cen","_z","_wp","_dt"];
_cen = locationposition _this;
_z = [];
if ((_this getvariable "Mcolor") != "ColorRed") then {
{if ((_x getvariable "Mcolor") in ["ColorBlue","ColorGreen"] && {(_x getvariable "Mtext") == " AA"}) then {_z pushback _x;};} foreach VEHZONES;
} else {
{if ((_x getvariable "Mcolor") in ["ColorRed"] && {(_x getvariable "Mtext") == " AA"}) then {_z pushback _x;};} foreach VEHZONES;
};
{if (_x call SAOKVZMOVING || {_x call SAOKISDAMAGED} || {_x CALL SAOKISLOWFUEL} || {_x call SAOKISLOWAMMO} || {[locationposition _x, (_x getvariable "Mcolor")] call SAOKNEARVZNUM > 5 && {[locationposition _x, (_x getvariable "Mcolor")," AA"] call SAOKNEARVZNUM == 1}}) then {_z = _z - [_x];if !(_x call SAOKVZMOVING || {(_x getvariable "IDCODE") in WAITSTOMOVE}) then {[_x,"Rejected Received Call"] SPAWN SAOKADDVEHZCON;};};} foreach _z;
if (count _z > 0) then {
_z = [_z,[_cen],{_input0 distance locationposition _x},"ASCEND"] call SAOKSORTBY;
_wp = [_cen,500,50,"(1 - sea)"] CALL SAOKSEEKPOS;
_z = _z select 0;
if !(surfaceiswater _wp) then {
_bol = isNil{_z getvariable "ACTIVE"};
if (_bol && {{[_x, (_z getvariable "Mtype")] call SAOKINSTRING} count ["_armor","_mech","_recon","_art"] > 0} && {locationposition _z distance _wp > 4000} && {{(_z getvariable "Mcolor") == (_x getvariable "Mcolor") && {isNil{_x getvariable "ACTIVE"}}} count CARRYZONES > 0}) exitWith {
_carrier = "";
{if ((_z getvariable "Mcolor") == (_x getvariable "Mcolor") && {isNil{_x getvariable "ACTIVE"}} && {typename _carrier == "STRING" || {_x distance _z < _carrier distance _z}}) exitWith {_carrier = _x;};} foreach CARRYZONES;
if (typename _carrier != "STRING") then {
[_carrier, _z, _wp] SPAWN SAOKCARRY;
[_z,"Called Anti-Air to be Carried"] SPAWN SAOKADDVEHZCON;
};
};
[_z, _wp] SPAWN SAOKASTARM;[_z,"Called Anti-Air"] SPAWN SAOKADDVEHZCON;
};
};
};

_airHelp = {
private ["_cen","_z","_wp","_vV"];
_cen = locationposition _this;
_vV = if ((_this getvariable "Mcolor") == "ColorRed") then {["ColorBlue","ColorGreen"]} else {["ColorRed"]};
_z = [];
_k = 0;
if ((_this getvariable "Mcolor") != "ColorRed") then {
{if ((_x getvariable "Mcolor") in ["ColorBlue","ColorGreen"] && {(_x getvariable "Mtype") in ["b_air","b_plane","b_uav","n_air","n_plane","n_uav"]}) then {_z pushback _x;};} foreach VEHZONES;
} else {
{if ((_x getvariable "Mcolor") in ["ColorRed"] && {(_x getvariable "Mtype") in ["o_air","o_plane","o_uav"]}) then {_z pushback _x;};} foreach VEHZONES;
};
{_p = locationposition _x;if (_x call SAOKVZMOVING || {_x call SAOKISDAMAGED} || {_x CALL SAOKISLOWFUEL} || {_x call SAOKISLOWAMMO} || {({[_p, _x] call SAOKNEARVZNUM > 1 && {[_p, _x," AA"] call SAOKNEARVZNUM == 0}} count _vV > 0)}) then {_z = _z - [_x];if !(_x call SAOKVZMOVING || {(_x getvariable "IDCODE") in WAITSTOMOVE}) then {
[_x,"Rejected Received Call"] SPAWN SAOKADDVEHZCON;
_sss = "F";
if ((_x  getvariable "Mcolor") == "ColorRed") then {_sss = "E";};
if (_k == 0) then {[_sss,(["CASA","SUPF"] call RETURNRANDOM)] SPAWN SAOKRADIOMES;};
_k = 1;
};};} foreach _z;
if (count _z > 0) then {
_z = [_z,[_cen],{_input0 distance locationposition _x},"ASCEND"] call SAOKSORTBY;
_wp = [_cen,500,50,"(1 - sea)"] CALL SAOKSEEKPOS;
[_z select 0, _wp] SPAWN ZoneMove;
[_z select 0,"Called Air Support"] SPAWN SAOKADDVEHZCON;
_sss = "F";
if (((_z select 0) getvariable "Mcolor") == "ColorRed") then {_sss = "E";};
[_sss,"CASR"] SPAWN SAOKRADIOMES;
sleep 5;
[_sss,"CAS"] SPAWN SAOKRADIOMES;
};
};

_blueGreen = _this select 0;
_red = _this select 1;
if ({(_x getvariable "Mtype") in ["b_air","n_air","b_plane","n_plane","b_uav","n_uav"] && {(_x getvariable "Mcolor") != "ColorGrey"}} count _blueGreen > 0 && {{(_x getvariable "Mtext") == " AA"} count _red == 0}) then {
if (count _red > 0) then {(_red call RETURNRANDOM) spawn _aaHelp;};
{if (random 0.3 < 1 && {!((_x getvariable "Mtype") in ["o_air","o_plane","o_uav"])}) then {[_x,(_blueGreen call RETURNRANDOM),"Flees Air Support"] spawn SaOkFleeF;};} foreach _red;
};
sleep 0.1;
if ({(_x getvariable "Mtype") in ["o_air","o_plane","o_uav"] && {(_x getvariable "Mcolor") != "ColorGrey"}} count _red > 0 && {{(_x getvariable "Mtext") == " AA"} count _blueGreen == 0}) then {
if (count _blueGreen > 0) then {(_blueGreen call RETURNRANDOM) spawn _aaHelp;};
{if (random 0.3 < 1 && {!((_x getvariable "Mtype") in ["b_air","n_air","b_plane","n_plane","b_uav","n_uav"])}) then {[_x,(_red call RETURNRANDOM),"Flees Air Support"] spawn SaOkFleeF;};} foreach _blueGreen;
};
sleep 0.1;
if ({(_x getvariable "Mtext") == " AA"} count _blueGreen == 0 && {{(_x getvariable "Mtype") in ["o_air","o_plane","o_uav"]} count _red == 0}) then {
if (count _red > 0) then {(_red call RETURNRANDOM) spawn _airHelp;};
};
sleep 0.1;
if ({(_x getvariable "Mtext") == " AA"} count _red == 0 && {{(_x getvariable "Mtype") in ["b_air","n_air","b_plane","n_plane","b_uav","n_uav"]} count _blueGreen == 0}) then {
if (count _blueGreen > 0) then {(_blueGreen call RETURNRANDOM) spawn _airHelp;};
};
sleep 0.1;
if ({(_x getvariable "Mtext") == " AA" && {(_x getvariable "Mcolor") != "ColorGrey"}} count _red > 0) then {
{if (random 0.3 < 1 && {(_x getvariable "Mtype") in ["b_air","n_air","b_plane","n_plane","b_uav","n_uav"]}) then {[_x,(_red call RETURNRANDOM),"Flees AntiAir"] spawn SaOkFleeF;};} foreach _blueGreen;
};
sleep 0.1;
if ({(_x getvariable "Mtext") == " AA" && {(_x getvariable "Mcolor") != "ColorGrey"}} count _blueGreen > 0) then {
{if (random 0.3 < 1 && {(_x getvariable "Mtype") in ["o_air","o_plane","o_uav"]}) then {[_x,(_blueGreen call RETURNRANDOM),"Flees AntiAir"] spawn SaOkFleeF;};} foreach _red;
};
sleep 0.1;
//
_bArt = [];
{if ((_x getvariable "Mtype") in ["b_recon","n_recon"]) exitWith {
_y = _x;
ARTYZONES = ARTYZONES - [objnull];
{if ((((_x getvariable "Mtype") in ["b_mortar","n_mortar"] && {locationposition _y distance locationposition _x < 3000}) || {(_x getvariable "Mtype") in ["b_art","n_art"]}) && {(_x getvariable "Mcolor") in ["ColorBlue","ColorGreen"]} && {!(_x call SAOKISLOWAMMO)}) then {_bArt pushback _x;};} foreach ARTYZONES;
};} foreach _blueGreen;
_rArt = [];
{if ((_x getvariable "Mtype") in ["o_recon"]) exitWith {
_y = _x;
ARTYZONES = ARTYZONES - [objnull];
{if ((((_x getvariable "Mtype") in ["o_mortar"] && {locationposition _y distance locationposition _x < 3000}) || {(_x getvariable "Mtype") in ["o_art"]}) && {(_x getvariable "Mcolor") in ["ColorRed"]} && {!(_x call SAOKISLOWAMMO)}) then {_rArt pushback _x;};} foreach ARTYZONES;
};} foreach _red;

_guardposts = _this select 2;
_gG = [];
_rG = [];
{if (getmarkercolor (_x getvariable "Gmark") == "ColorRed") then {_rG pushback _x;} else {_gG pushback _x;};sleep 0.1;} foreach _guardposts;
_camps = _this select 3;
_rC = [];
_bC = [];
{if (getmarkercolor _x == "ColorRed") then {_rC pushback _x;} else {_bC pushback _x;};sleep 0.1;} foreach _camps;
_striker = [];
for "_x" from 0 to (count (_blueGreen+_bArt)) do {_striker pushback "bG";};
for "_x" from 0 to (count (_red+_rArt)) do {_striker pushback "R";};
if (count _guardposts > 0) then {for "_x" from 0 to (count _guardposts) do {_striker pushback "G";};};
if (count _camps > 0) then {for "_x" from 0 to (count _camps) do {_striker pushback "C";};};
_striker = _striker call RETURNRANDOM; 
if (typename _striker == "ARRAY") exitWith {};
while {{_x select 1 < time} count SAOKRELO > 0} do {{if (_x select 1 < time) exitWith {SAOKRELO deleteat _foreachIndex;};sleep 0.01;} foreach SAOKRELO;sleep 0.1;};
_bo = false;
if (typename _striker == "STRING") then {if ({_x select 0 == _striker} count SAOKRELO > 0) then {_bo = true;};} else {if ({_x select 0 == (_striker getvariable "Gmark")} count SAOKRELO > 0) then {_bo = true;};};
if (_bo) exitWith {};
switch _striker do {
case "G": {
_striker = _guardposts call RETURNRANDOM; 
if (typename _striker == "ARRAY") exitWith {};
if (getmarkercolor (_striker getvariable "Gmark") == "ColorRed") then {
_kohde = _blueGreen call RETURNRANDOM;
if (typename _kohde == "ARRAY") exitWith {};
_st = [];
_skP = getposATL _striker;
if (!isNil{_striker getvariable "MG-Guard"}) then {_st pushback "I_MGgroup";_in = 1;};
if (!isNil{_striker getvariable "AA-Guard"}) then {_st pushback "I_AAgroup";_in = 1;};
if (!isNil{_striker getvariable "AT-Guard"}) then {_st pushback "I_ATgroup";_in = 1;};
if (!isNil{_striker getvariable "Sniper-Guard"}) then {_st pushback "I_Snipergroup";_in = 1;};
if (!isNil{_striker getvariable "Medic-Guard"}) then {_st pushback "I_Medicgroup";_in = 1;};
{
_st pushback (_x select 0);
sleep 0.01;
} foreach (_striker getvariable "StaticW");
_ff = _striker call _postD;
_striker = _st call RETURNRANDOM; 
if (typename _striker == "ARRAY" || {typename _kohde == "ARRAY"}) exitWith {};
_kDat = _kohde CALL SAOKZONEDR;
if (count _kDat == 0 || {count (_kDat select 0) == 0} || {typename ((_kDat select 0) select 0) != "STRING"}) exitWith {};
_kS = ((_kDat select 0) select 0) call battleodds;
_sS = _striker call battleodds;
_s = (_sS select 1);
{_s set [_foreachIndex,(_s select _foreachIndex) * _ff];} foreach _s;
_sS set [1,_s];
_odds = ((_kS select 1) select (_sS select 0)) / ((_sS select 1) select (_kS select 0));
_lf = 0;
//target moving 
_lf = _lf - (if (_kohde call SAOKVZMOVING) then {0.10} else {0});
_kDat = _kohde CALL SAOKZONEDR;
_aTT = ["smoke"];if ({[_x, (_kohde getvariable "Mtype")] call SAOKINSTRING} count ["air","plane","uav"] > 0) then {_aTT = ["flare"];};_m = [_kDat,_aTT] call _smokeF;
_smf = 1;
if (typename _m == "ARRAY") then {
[_kohde,_kDat,_m select 0,_m select 1] spawn _takeAMMO;
_smf = 0.3;
_kmp = locationposition _kohde;
_dir = [_kmp,_skP] call SAOKDIRT;
_smdis = (_kmp distance _skP) * (0.05 + random 0.05);
_smwall = [(_kmp select 0)+(sin _dir)*_smdis, (_kmp select 1)+(cos _dir)*_smdis,0];
_tt = "Smoke Cover"; if ("flare" in _aTT) then {_tt = "Flare Cover";};[_smwall, _tt, [1,1,1,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_mar1 = [_smwall,"SolidBorder","ColorWhite",(20+random 10),60,0.27] CALL SAOKCREATEMARKERA;
};
["", "", "BUM"] SPAWN SAOKVIRSOUND;
//if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)} && {random 1 < _smf}) then {
if (random 1 < (0.95 + _lf) && {random 1 < _smf}) then {
[_skP, "Unknown Fire", [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
sleep 0.2;
["", "", "FLY"] SPAWN SAOKVIRSOUND;
if (random 1 > _odds) then {
[_kohde,_kDat,0.8] spawn _kohdeDam;
[_kohde, "Critical Hit", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[_skP,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
["", "", "HITV"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Hit", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[_kohde,_kDat,0.2] spawn _kohdeDam;
[_skP,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
["", "", "HITV"] SPAWN SAOKVIRSOUND;
};
[_striker,_kohde,"ColorRed",locationposition _kohde] spawn _hintMes;
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = locationposition _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[_skP,_mis] SPAWN _fBulletL;
sleep 0.5;
["", "", "MIS"] SPAWN SAOKVIRSOUND;
};
if (_odds < 0.4) then {[_kohde,_skP] SPAWN SAOKCALLGELP;};
if (_odds < 0.1 || {_kohde call SAOKISDAMAGED} || {_kohde call SAOKISLOWAMMO}) then {[_kohde, _skP] spawn SaOkFleeF;};
} else {
_kohde = _red call RETURNRANDOM;
_st = [];
_skP = getposATL _striker;
if (!isNil{_striker getvariable "MG-Guard"}) then {_st pushback "I_MGgroup";_in = 1;};
if (!isNil{_striker getvariable "AA-Guard"}) then {_st pushback "I_AAgroup";_in = 1;};
if (!isNil{_striker getvariable "AT-Guard"}) then {_st pushback "I_ATgroup";_in = 1;};
if (!isNil{_striker getvariable "Sniper-Guard"}) then {_st pushback "I_Snipergroup";_in = 1;};
if (!isNil{_striker getvariable "Medic-Guard"}) then {_st pushback "I_Medicgroup";_in = 1;};
{
_st = _st + [(_x select 0)];
sleep 0.01;
} foreach (_striker getvariable "StaticW");
_ff = _striker call _postD;
_striker = _st call RETURNRANDOM; 
if (typename _striker == "ARRAY" || {typename _kohde == "ARRAY"}) exitWith {};
_sS = _striker call battleodds;
_s = (_sS select 1);
{_s set [_foreachIndex,(_s select _foreachIndex) * _ff];} foreach _s;
_sS set [1,_s];
_kDat = _kohde CALL SAOKZONEDR;
if (count _kDat == 0 || {count (_kDat select 0) == 0} || {typename ((_kDat select 0) select 0) != "STRING"}) exitWith {};
_kS = ((_kDat select 0) select 0) call battleodds;
_odds = ((_kS select 1) select (_sS select 0)) / ((_sS select 1) select (_kS select 0));
_lf = 0;
//target moving 
_lf = _lf - (if (_kohde call SAOKVZMOVING) then {0.10} else {0});
_kDat = _kohde CALL SAOKZONEDR;
_aTT = ["smoke"];if ({[_x, (_kohde getvariable "Mtype")] call SAOKINSTRING} count ["air","plane","uav"] > 0) then {_aTT = ["flare"];};_m = [_kDat,_aTT] call _smokeF;
_smf = 1;
if (typename _m == "ARRAY") then {
[_kohde,_kDat,_m select 0,_m select 1] spawn _takeAMMO;
_smf = 0.3;
_kmp = locationposition _kohde;
_dir = [_kmp,_skP] call SAOKDIRT;
_smdis = (_kmp distance _skP) * (0.05 + random 0.05);
_smwall = [(_kmp select 0)+(sin _dir)*_smdis, (_kmp select 1)+(cos _dir)*_smdis,0];
_tt = "Smoke Cover"; if ("flare" in _aTT) then {_tt = "Flare Cover";};[_smwall, _tt, [1,1,1,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_mar1 = [_smwall,"SolidBorder","ColorWhite",(20+random 10),60,0.27] CALL SAOKCREATEMARKERA;
};
["", "", "BUM"] SPAWN SAOKVIRSOUND;
//if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)} && {random 1 < _smf}) then {
if (random 1 < (0.95 + _lf) && {random 1 < _smf}) then {
[_skP, "Unknown Fire", [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
sleep 0.2;
["", "", "FLY"] SPAWN SAOKVIRSOUND;
if (random 1 > _odds) then {
[_kohde,_kDat,0.8] spawn _kohdeDam;
[_kohde, "Critical Hit", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[_skP,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
["", "", "HITV"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Hit", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[_kohde,_kDat,0.2] spawn _kohdeDam;
[_skP,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
["", "", "HITV"] SPAWN SAOKVIRSOUND;
};

[_striker,_kohde,"ColorGreen",locationposition _kohde] spawn _hintMes;
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = locationposition _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[_skP,_mis] SPAWN _fBulletL;
sleep 0.5;
["", "", "MIS"] SPAWN SAOKVIRSOUND;
};
if (_odds < 0.4) then {[_kohde,_skP] SPAWN SAOKCALLGELP;};
if (_odds < 0.1 || {_kohde call SAOKISDAMAGED} || {_kohde call SAOKISLOWAMMO}) then {[_kohde, _skP] spawn SaOkFleeF;};
};
};
case "C": {
_striker = _camps call RETURNRANDOM; 
if (typename _striker == "ARRAY") exitWith {};
if (getmarkercolor _striker == "ColorRed") then {
_kohde = _blueGreen call RETURNRANDOM;
_odds = 0.97;
if (typename _kohde == "ARRAY") exitWith {};
_kDat = _kohde CALL SAOKZONEDR;
_aTT = ["smoke"];if ({[_x, (_kohde getvariable "Mtype")] call SAOKINSTRING} count ["air","plane","uav"] > 0) then {_aTT = ["flare"];};_m = [_kDat,_aTT] call _smokeF;
_smf = 1;
if (typename _m == "ARRAY") then {
[_kohde,_kDat,_m select 0,_m select 1] spawn _takeAMMO;
_smf = 0.3;
_kmp = locationposition _kohde;
_dir = [_kmp,getmarkerpos _striker] call SAOKDIRT;
_smdis = (_kmp distance (getmarkerpos _striker)) * (0.05 + random 0.05);
_smwall = [(_kmp select 0)+(sin _dir)*_smdis, (_kmp select 1)+(cos _dir)*_smdis,0];
_tt = "Smoke Cover"; if ("flare" in _aTT) then {_tt = "Flare Cover";};[_smwall, _tt, [1,1,1,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_mar1 = [_smwall,"SolidBorder","ColorWhite",(20+random 10),60,0.27] CALL SAOKCREATEMARKERA;
};
["", "", "BUM"] SPAWN SAOKVIRSOUND;
//if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)} && {random 1 < _smf}) then {
[getmarkerpos _striker, "Unknown Fire", [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
if (random 1 > 0.7 && {random 1 < _smf}) then {
//hit with big damage
sleep 0.2;
["", "", "FLY"] SPAWN SAOKVIRSOUND;
if (random 1 > _odds) then {
[_kohde,_kDat,0.8] spawn _kohdeDam;
[_kohde, "Critical Hit", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[getmarkerpos _striker,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
["", "", "HITV"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Hit", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[_kohde,_kDat,0.2] spawn _kohdeDam;
[getmarkerpos _striker,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
["", "", "HITV"] SPAWN SAOKVIRSOUND;
};
["CAMP",_kohde,"ColorRed",locationposition _kohde] spawn _hintMes;
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = locationposition _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[getmarkerpos _striker,_mis] SPAWN _fBulletL;
["", "", "MIS"] SPAWN SAOKVIRSOUND;
};
if (_kohde call SAOKISDAMAGED || {_kohde call SAOKISLOWAMMO}) then {[_kohde, getmarkerpos _striker] spawn SaOkFleeF;};
} else {
_kohde = _red call RETURNRANDOM;
_odds = 0.97;
if (typename _kohde == "ARRAY") exitWith {};
_kDat = _kohde CALL SAOKZONEDR;
_aTT = ["smoke"];if ({[_x, (_kohde getvariable "Mtype")] call SAOKINSTRING} count ["air","plane","uav"] > 0) then {_aTT = ["flare"];};_m = [_kDat,_aTT] call _smokeF;
_smf = 1;
if (typename _m == "ARRAY") then {
[_kohde,_kDat,_m select 0,_m select 1] spawn _takeAMMO;
_smf = 0.3;
_kmp = locationposition _kohde;
_dir = [_kmp,getmarkerpos  _striker] call SAOKDIRT;
_smdis = (_kmp distance (getmarkerpos _striker)) * (0.05 + random 0.05);
_smwall = [(_kmp select 0)+(sin _dir)*_smdis, (_kmp select 1)+(cos _dir)*_smdis,0];
_tt = "Smoke Cover"; if ("flare" in _aTT) then {_tt = "Flare Cover";};[_smwall, _tt, [1,1,1,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_mar1 = [_smwall,"SolidBorder","ColorWhite",(20+random 10),60,0.27] CALL SAOKCREATEMARKERA;
};
["", "", "BUM"] SPAWN SAOKVIRSOUND;
//if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)} && {random 1 < _smf}) then {
[getmarkerpos _striker, "Unknown Fire", [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
if (random 1 > 0.7 && {random 1 < _smf}) then {
//hit with big damage
sleep 0.2;
["", "", "FLY"] SPAWN SAOKVIRSOUND;
if (random 1 > _odds) then {
[_kohde,_kDat,0.9] spawn _kohdeDam;
[_kohde, "Critical Hit", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[getmarkerpos _striker,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
["", "", "HITV"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Hit", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[_kohde,_kDat,0.2] spawn _kohdeDam;
[getmarkerpos _striker,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
["", "", "HITV"] SPAWN SAOKVIRSOUND;
};
["CAMP",_kohde,"ColorBlue",locationposition _kohde] spawn _hintMes;
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = locationposition _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[getmarkerpos _striker,_mis] SPAWN _fBulletL;
["", "", "MIS"] SPAWN SAOKVIRSOUND;
};
if (_kohde call SAOKISDAMAGED || {_kohde call SAOKISLOWAMMO}) then {[_kohde, getmarkerpos _striker] spawn SaOkFleeF;};
};
};
case "bG": {
_striker = (_blueGreen+_bArt) call RETURNRANDOM; 
if (typename _striker == "ARRAY") exitWith {};
if ((_striker getvariable "Mtype") in ["n_mortar","b_mortar","n_art","b_art"] && {(_striker getvariable "Mtext") == ""} && {_striker call SAOKVZMOVING}) exitWith {};
_kohde = (_red + _rG + _rC) call RETURNRANDOM;
if (_kohde in _rC) then {
_sDat = _striker CALL SAOKZONEDR;
_kS = "I_ATgroup" call battleodds;
if (count _sDat == 0 || {count (_sDat select 0) == 0} || {typename ((_sDat select 0) select 0) != "STRING"}) exitWith {};
_sS = ((_sDat select 0) select 0) call battleodds;
_kAm = _kS select 4;
_p = [];
for "_x" from 0 to (count _sDat - 1) do {_p pushback _x;};
_pi = _p call RETURNRANDOM; _p = _p - [_pi];
while {count _p > 0 && {!([_kAm,(_sDat select _pi) select 1] call _apuF)}} do {_pi = _p call RETURNRANDOM; _p = _p - [_pi];sleep 0.01;};
_ammo = "";
if (typename _pi == "ARRAY" || {isnil{(_sDat select _pi) select 1}}) exitWith {};
if (([_kAm,(_sDat select _pi) select 1] call _apuF)) then {
{
_y = _x;
{_y0 = _x select 0; if ([_y, _y0] call SAOKINSTRING && {{[_x, _y0] call SAOKINSTRING} count ["smoke","flare"] == 0}) exitWith {_ammo = _x select 0;};sleep 0.01;} foreach ((_sDat select _pi) select 1);
if (_ammo != "") exitWith {};
sleep 0.01;
} foreach _kAm;
};
if (_ammo == "") exitWith {};
[_striker,_sDat,_pi,_ammo] spawn _takeAMMO;
_odds = ((_kS select 1) select (_sS select 0)) / ((_sS select 1) select (_kS select 0));
_lf = 0;
//shooter moving 
_lf = _lf - (if (_striker call SAOKVZMOVING) then {0.15} else {0});
//damage affect hit change
[((_sDat select _pi) select 0), _ammo, "BUM"] SPAWN SAOKVIRSOUND;
if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)}) then {
//hit with big damage
[_striker, [_ammo,((_sDat select _pi) select 0)] call _ammoNAME, [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
[((_sDat select _pi) select 0), _ammo, "FLY"] SPAWN SAOKVIRSOUND;
if (random 1 > _odds) then {
[_kohde, "Very Stunned", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_sss = "E";
if ((_striker getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"MEDF"] SPAWN SAOKRADIOMES;
[locationposition _striker,getmarkerpos _kohde] SPAWN _fBulletL;
SAOKRELO pushback [_kohde,(time+120)];
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITV"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Stunned", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_sss = "E";
if ((_striker getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"MEDR"] SPAWN SAOKRADIOMES;
[locationposition _striker,getmarkerpos _kohde] SPAWN _fBulletL;
SAOKRELO pushback [_kohde,(time+60)];
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITV"] SPAWN SAOKVIRSOUND;
};
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = getmarkerpos _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[locationposition _striker,_mis] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "MIS"] SPAWN SAOKVIRSOUND;
};
};
if (_kohde in _rG) then {
_bG = [];
if (!isNil{_kohde getvariable "MG-Guard"}) then {_bG pushback "O_MGgroup";_in = 1;};
if (!isNil{_kohde getvariable "AA-Guard"}) then {_bG pushback "O_AAgroup";_in = 1;};
if (!isNil{_kohde getvariable "AT-Guard"}) then {_bG pushback "O_ATgroup";_in = 1;};
if (!isNil{_kohde getvariable "Sniper-Guard"}) then {_bG pushback "O_Snipergroup";_in = 1;};
if (!isNil{_kohde getvariable "Medic-Guard"}) then {_bG pushback "O_Medicgroup";_in = 1;};
{
_bG pushback (_x select 0);
sleep 0.01;
} foreach (_kohde getvariable "StaticW");
_ff = _kohde call _postD;
_bG = _bG call RETURNRANDOM;
if (typename _bG == "ARRAY") exitWith {};
if (typename _striker == "ARRAY") exitWith {};
_sDat = _striker CALL SAOKZONEDR;
_kS = _bG call battleodds;
_s = (_kS select 1);
{_s set [_foreachIndex,(_s select _foreachIndex) * _ff];} foreach _s;
_kS set [1,_s];
if (count _sDat == 0 || {count (_sDat select 0) == 0} || {typename ((_sDat select 0) select 0) != "STRING"}) exitWith {};
_sS = ((_sDat select 0) select 0) call battleodds;
_kAm = _kS select 4;
_p = [];
for "_x" from 0 to (count _sDat - 1) do {_p pushback _x;};
_pi = _p call RETURNRANDOM; _p = _p - [_pi];
while {count _p > 0 && {!([_kAm,(_sDat select _pi) select 1] call _apuF)}} do {_pi = _p call RETURNRANDOM; _p = _p - [_pi];sleep 0.01;};
_ammo = "";
if (typename _pi == "ARRAY" || {isnil{(_sDat select _pi) select 1}}) exitWith {};
if (([_kAm,(_sDat select _pi) select 1] call _apuF)) then {
{
_y = _x;
{_y0 = _x select 0; if ([_y, _y0] call SAOKINSTRING && {{[_x, _y0] call SAOKINSTRING} count ["smoke","flare"] == 0}) exitWith {_ammo = _x select 0;};sleep 0.01;} foreach ((_sDat select _pi) select 1);
if (_ammo != "") exitWith {};
sleep 0.01;
} foreach _kAm;
};
if (_ammo == "") exitWith {};
[_striker,_sDat,_pi,_ammo] spawn _takeAMMO;
_odds = ((_kS select 1) select (_sS select 0)) / ((_sS select 1) select (_kS select 0));
_lf = 0;
//shooter moving 
_lf = _lf - (if (_striker call SAOKVZMOVING) then {0.15} else {0});
//damage affect hit change
[((_sDat select _pi) select 0), _ammo, "BUM"] SPAWN SAOKVIRSOUND;
if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)}) then {
//hit with big damage
[_striker, [_ammo,((_sDat select _pi) select 0)] call _ammoNAME, [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
[((_sDat select _pi) select 0), _ammo, "FLY"] SPAWN SAOKVIRSOUND;

if (random 1 > _odds) then {
[_kohde, "Casultie", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_sss = "E";
if ((_striker getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"MEDF"] SPAWN SAOKRADIOMES;
["", "", "DES"] SPAWN SAOKVIRSOUND;
[locationposition _striker,getposATL _kohde] SPAWN _fBulletL;
if ({_bG == _x select 0} count (_kohde getvariable "StaticW") > 0) then {_daP = (_kohde getvariable "StaticW");{if (_bG == _x select 0) exitWith {_daP deleteat _foreachIndex;_kohde setvariable ["StaticW",_daP];};} foreach _daP;} else {
_uD = [];
{if (!isNil{_kohde getvariable _x}) then {_ud pushback _x;};sleep 0.01;} foreach ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"];
if (count _ud > 0) then {_kohde setvariable [(_ud call RETURNRANDOM),nil];[_striker,"POST",_striker getvariable "Mcolor",locationposition _striker,((_sDat select _pi) select 0),_ammo] spawn _hintMes;};  
};
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITP"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Stunned", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_sss = "E";
if ((_striker getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"MEDR"] SPAWN SAOKRADIOMES;
[locationposition _striker,getposATL _kohde] SPAWN _fBulletL;
SAOKRELO pushback [(_kohde getvariable "Gmark"),(time+60)];
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITP"] SPAWN SAOKVIRSOUND;
};
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = getposATL _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[locationposition _striker,_mis] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "MIS"] SPAWN SAOKVIRSOUND;
};

};
if (_kohde in _red) then {
if ({[_x,(_striker getvariable "Mtype")] call SAOKINSTRING} count ["plane","uav","chopper"] == 0) then {
_kohde = ([_red,_striker] call _remFarPlatoons) call RETURNRANDOM;
};
if ({[_x,(_kohde getvariable "Mtype")] call SAOKINSTRING} count ["plane","uav"] > 0 && {{[_x,(_striker getvariable "Mtype")] call SAOKINSTRING} count ["plane","uav","chopper"] == 0} && {!(["AA",(_striker getvariable "Mtext")] call SAOKINSTRING)} && {random 1 > 0.2}) exitWith {[_kohde,"Air Domination"] SPAWN SAOKADDVEHZCON;};
_ktyp = (_kohde getvariable "Mtype");
//_kohde = _red select 0;
_styp = (_striker getvariable "Mtype");
_sDat = _striker CALL SAOKZONEDR;
if ({[_x, _ktyp] call SAOKINSTRING} count ["air","plane","uav"] > 0 && {{[_x, _styp] call SAOKINSTRING} count ["art","mortar"] > 0}) exitWith {};
if (count _sDat == 0 || {count (_sDat select 0) == 0} || {typename ((_sDat select 0) select 0) != "STRING"}) exitWith {};
_sS = (((_sDat select 0) select 0) call battleodds) select 1;
{
_mar = _x;
{
_xS = (_x call battleodds) select 0;_kS = (_kohde call battleodds) select 0;if (_sS select _xS > _sS select _kS) then {_kohde = _mar;};
sleep 0.01;
} foreach ((_x CALL SAOKZONEDR) CALL APUFF);
sleep 0.01;
} foreach _red;
if (typename _striker == "ARRAY" || {typename _kohde == "ARRAY"}) exitWIth {};
_kDat = _kohde CALL SAOKZONEDR;
_kS = _kohde call battleodds;
if (count _sDat == 0 || {count (_sDat select 0) == 0} || {typename ((_sDat select 0) select 0) != "STRING"}) exitWith {};
_sS = (((_sDat select 0) select 0) call battleodds);
_kAm = _kS select 4;
_p = [];
for "_x" from 0 to (count _sDat - 1) do {_p pushback _x;};
_pi = _p call RETURNRANDOM; _p = _p - [_pi];
while {count _p > 0 && {!([_kAm,(_sDat select _pi) select 1] call _apuF)}} do {_pi = _p call RETURNRANDOM; _p = _p - [_pi];sleep 0.01;};
_ammo = "";
if (typename _pi == "ARRAY" || {isnil{(_sDat select _pi) select 1}}) exitWith {};
if (([_kAm,(_sDat select _pi) select 1] call _apuF)) then {
{
_y = _x;
{_y0 = _x select 0; if ([_y, _y0] call SAOKINSTRING && {{[_x, _y0] call SAOKINSTRING} count ["smoke","flare"] == 0}) exitWith {_ammo = _x select 0;};sleep 0.01;} foreach ((_sDat select _pi) select 1);
if (_ammo != "") exitWith {};
sleep 0.01;
} foreach _kAm;
};
if (_ammo == "") exitWith {};
[_striker,_sDat,_pi,_ammo] spawn _takeAMMO;
_odds = ((_kS select 1) select (_sS select 0)) / ((_sS select 1) select (_kS select 0));
//hint str [_striker,_sDat,_pi,_ammo,_kohde,_kDat,_odds];
_lf = 0;
//target moving 
_lf = _lf - (if (_kohde call SAOKVZMOVING) then {0.10} else {0});
//shooter moving 
_lf = _lf - (if (_striker call SAOKVZMOVING) then {0.15} else {0});
//damage affect hit change
[((_sDat select _pi) select 0), _ammo, "BUM"] SPAWN SAOKVIRSOUND;
_aTT = ["smoke"];if ({[_x, (_kohde getvariable "Mtype")] call SAOKINSTRING} count ["air","plane","uav"] > 0) then {_aTT = ["flare"];};_m = [_kDat,_aTT] call _smokeF;
_smf = 1;
if (typename _m == "ARRAY") then {

[_kohde,_kDat,_m select 0,_m select 1] spawn _takeAMMO;
_smf = 0.3;
_kmp = locationposition _kohde;
_dir = [_kmp,locationposition _striker] call SAOKDIRT;
_smdis = (_kmp distance (locationposition _striker)) * (0.05 + random 0.05);
_smwall = [(_kmp select 0)+(sin _dir)*_smdis, (_kmp select 1)+(cos _dir)*_smdis,0];
_tt = "Smoke Cover"; if ("flare" in _aTT) then {_tt = "Flare Cover";};[_smwall, _tt, [1,1,1,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_mar1 = [_smwall,"SolidBorder","ColorWhite",(20+random 10),60,0.27] CALL SAOKCREATEMARKERA;
};
if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)} && {random 1 < _smf}) then {
//hit with big damage
[_striker, [_ammo,((_sDat select _pi) select 0)] call _ammoNAME, [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
[((_sDat select _pi) select 0), _ammo, "FLY"] SPAWN SAOKVIRSOUND;
if (random 1 > _odds) then {
[_kohde,_kDat,1] spawn _kohdeDam;
[_kohde, "Critical Hit", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[locationposition _striker,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITV"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Hit", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;

[_kohde,_kDat,0.2] spawn _kohdeDam;
[locationposition _striker,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITV"] SPAWN SAOKVIRSOUND;
};
[_striker,_kohde,(_striker getvariable "Mcolor"),locationposition _striker,((_sDat select _pi) select 0),_ammo] spawn _hintMes;
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;

_pko = locationposition _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[locationposition _striker,_mis] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "MIS"] SPAWN SAOKVIRSOUND;
};
if (_odds < 0.4) then {[_kohde,locationposition _striker] SPAWN SAOKCALLGELP;};
if (_odds < 0.1 || {_kohde call SAOKISDAMAGED} || {_kohde call SAOKISLOWAMMO}) then {[_kohde, locationposition _striker] spawn SaOkFleeF;};
};

};
case "R": {
_striker = (_red+_rArt) call RETURNRANDOM; 
if (typename _striker == "ARRAY") exitWith {};
if ((_striker getvariable "Mtype") in ["o_mortar","o_art"] && {(_striker getvariable "Mtext") == ""} && {_striker call SAOKVZMOVING}) exitWith {};
_kohde = (_blueGreen + _gG + _bC) call RETURNRANDOM;
if (_kohde in _bC) then {
_sDat = _striker CALL SAOKZONEDR;
_kS = "I_ATgroup" call battleodds;
if (count _sDat == 0 || {count (_sDat select 0) == 0} || {typename ((_sDat select 0) select 0) != "STRING"}) exitWith {};
_sS = ((_sDat select 0) select 0) call battleodds;
_kAm = _kS select 4;
_p = [];
for "_x" from 0 to (count _sDat - 1) do {_p pushback _x;};
_pi = _p call RETURNRANDOM; _p = _p - [_pi];
while {count _p > 0 && {!([_kAm,(_sDat select _pi) select 1] call _apuF)}} do {_pi = _p call RETURNRANDOM; _p = _p - [_pi];sleep 0.01;};
_ammo = "";
if (typename _pi == "ARRAY" || {isnil{(_sDat select _pi) select 1}}) exitWith {};
if (([_kAm,(_sDat select _pi) select 1] call _apuF)) then {
{
_y = _x;
{_y0 = _x select 0; if ([_y, _y0] call SAOKINSTRING && {{[_x, _y0] call SAOKINSTRING} count ["smoke","flare"] == 0}) exitWith {_ammo = _x select 0;};sleep 0.01;} foreach ((_sDat select _pi) select 1);
if (_ammo != "") exitWith {};
sleep 0.01;
} foreach _kAm;
};
if (_ammo == "") exitWith {};
[_striker,_sDat,_pi,_ammo] spawn _takeAMMO;
_odds = ((_kS select 1) select (_sS select 0)) / ((_sS select 1) select (_kS select 0));
_lf = 0;
//shooter moving 
_lf = _lf - (if (_striker call SAOKVZMOVING) then {0.15} else {0});
//damage affect hit change
[((_sDat select _pi) select 0), _ammo, "BUM"] SPAWN SAOKVIRSOUND;
if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)}) then {
//hit with big damage
[_striker, [_ammo,((_sDat select _pi) select 0)] call _ammoNAME, [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
[((_sDat select _pi) select 0), _ammo, "FLY"] SPAWN SAOKVIRSOUND;
if (random 1 > _odds) then {
[_kohde, "Very Stunned", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_sss = "E";
if ((_striker getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"MEDF"] SPAWN SAOKRADIOMES;
[locationposition _striker,getmarkerpos _kohde] SPAWN _fBulletL;
SAOKRELO pushback [_kohde,(time+120)];
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITP"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Stunned", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_sss = "E";
if ((_striker getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"MEDR"] SPAWN SAOKRADIOMES;
[locationposition _striker,getmarkerpos _kohde] SPAWN _fBulletL;
SAOKRELO pushback [_kohde,(time+60)];
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITP"] SPAWN SAOKVIRSOUND;
};
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = getmarkerpos _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[locationposition _striker,_mis] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "MIS"] SPAWN SAOKVIRSOUND;
};
};
if (_kohde in _gG) then {
_bG = [];
if (!isNil{_kohde getvariable "MG-Guard"}) then {_bG pushback "I_MGgroup";_in = 1;};
if (!isNil{_kohde getvariable "AA-Guard"}) then {_bG pushback "I_AAgroup";_in = 1;};
if (!isNil{_kohde getvariable "AT-Guard"}) then {_bG pushback "I_ATgroup";_in = 1;};
if (!isNil{_kohde getvariable "Sniper-Guard"}) then {_bG pushback "I_Snipergroup";_in = 1;};
if (!isNil{_kohde getvariable "Medic-Guard"}) then {_bG pushback "I_Medicgroup";_in = 1;};
{
_bG pushback (_x select 0);
sleep 0.01;
} foreach (_kohde getvariable "StaticW");
_ff = _kohde call _postD;
_bG = _bG call RETURNRANDOM;
if (typename _bG == "ARRAY") exitWith {};
if (typename _striker == "ARRAY") exitWith {};
_sDat = _striker CALL SAOKZONEDR;
_kS = _bG call battleodds;
_s = (_kS select 1);
{_s set [_foreachIndex,(_s select _foreachIndex) * _ff];} foreach _s;
_kS set [1,_s];
if (count _sDat == 0 || {count (_sDat select 0) == 0} || {typename ((_sDat select 0) select 0) != "STRING"}) exitWith {};
_sS = ((_sDat select 0) select 0) call battleodds;
_kAm = _kS select 4;
_p = [];
for "_x" from 0 to (count _sDat - 1) do {_p pushback _x;};
_pi = _p call RETURNRANDOM; _p = _p - [_pi];
while {count _p > 0 && {!([_kAm,(_sDat select _pi) select 1] call _apuF)}} do {_pi = _p call RETURNRANDOM; _p = _p - [_pi];sleep 0.01;};
_ammo = "";
if (typename _pi == "ARRAY" || {isnil{(_sDat select _pi) select 1}}) exitWith {};
if (([_kAm,(_sDat select _pi) select 1] call _apuF)) then {
{
_y = _x;
{_y0 = _x select 0; if ([_y, _y0] call SAOKINSTRING && {{[_x, _y0] call SAOKINSTRING} count ["smoke","flare"] == 0}) exitWith {_ammo = _x select 0;};sleep 0.01;} foreach ((_sDat select _pi) select 1);
if (_ammo != "") exitWith {};
sleep 0.01;
} foreach _kAm;
};
if (_ammo == "") exitWith {};
[_striker,_sDat,_pi,_ammo] spawn _takeAMMO;
_odds = ((_kS select 1) select (_sS select 0)) / ((_sS select 1) select (_kS select 0));
_lf = 0;
//shooter moving 
_lf = _lf - (if (_striker call SAOKVZMOVING) then {0.15} else {0});
//damage affect hit change
[((_sDat select _pi) select 0), _ammo, "BUM"] SPAWN SAOKVIRSOUND;
if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)}) then {
//hit with big damage
[_striker, [_ammo,((_sDat select _pi) select 0)] call _ammoNAME, [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
[((_sDat select _pi) select 0), _ammo, "FLY"] SPAWN SAOKVIRSOUND;

if (random 1 > _odds) then {
[_kohde, "Casultie", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_sss = "E";
if ((_striker getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"MEDF"] SPAWN SAOKRADIOMES;
["", "", "DES"] SPAWN SAOKVIRSOUND;
[locationposition _striker,getposATL _kohde] SPAWN _fBulletL;
if ({_bG == _x select 0} count (_kohde getvariable "StaticW") > 0) then {_daP = (_kohde getvariable "StaticW");{if (_bG == _x select 0) exitWith {_daP deleteat _foreachIndex;_kohde setvariable ["StaticW",_daP];};sleep 0.01;} foreach _daP;} else {
_uD = [];
{if (!isNil{_kohde getvariable _x}) then {_ud pushback _x;};sleep 0.01;} foreach ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"];
if (count _ud > 0) then {_kohde setvariable [(_ud call RETURNRANDOM),nil];[_striker,"POST",_striker getvariable "Mcolor",locationposition _striker,((_sDat select _pi) select 0),_ammo] spawn _hintMes;};
};
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITP"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Stunned", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_sss = "E";
if ((_striker getvariable "Mcolor") == "ColorRed") then {_sss = "F";};
[_sss,"MEDR"] SPAWN SAOKRADIOMES;
[locationposition _striker,getposATL _kohde] SPAWN _fBulletL;
SAOKRELO pushback [(_kohde getvariable "Gmark"),(time+60)];
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITP"] SPAWN SAOKVIRSOUND;
};
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = getposATL _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[locationposition _striker,_mis] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "MIS"] SPAWN SAOKVIRSOUND;
};
};
if (_kohde in _blueGreen) then {
if ({[_x,(_striker getvariable "Mtype")] call SAOKINSTRING} count ["plane","uav","chopper"] == 0) then {
_kohde = ([_blueGreen,_striker] call _remFarPlatoons) call RETURNRANDOM;
};
if ({[_x,(_kohde getvariable "Mtype")] call SAOKINSTRING} count ["plane","uav"] > 0 && {{[_x,(_striker getvariable "Mtype")] call SAOKINSTRING} count ["plane","uav","chopper"] == 0} && {!(["AA",(_striker getvariable "Mtext")] call SAOKINSTRING)} && {random 1 > 0.2}) exitWith {[_kohde,"Air Domination"] SPAWN SAOKADDVEHZCON;};

//_kohde = _blueGreen select 0;
_ktyp = _kohde getvariable "Mtype";
_styp = _striker getvariable "Mtype";
_sDat = _striker CALL SAOKZONEDR;
if ({[_x, _ktyp] call SAOKINSTRING} count ["air","plane","uav"] > 0 && {{[_x, _styp] call SAOKINSTRING} count ["art","mortar"] > 0}) exitWith {};
if (count _sDat == 0 || {count (_sDat select 0) == 0} || {typename ((_sDat select 0) select 0) != "STRING"}) exitWith {};
_sS = (((_sDat select 0) select 0) call battleodds) select 1;
{
_mar = _x;
{
_xS = (_x call battleodds) select 0;_kS = (_kohde call battleodds) select 0;if (_sS select _xS > _sS select _kS) then {_kohde = _mar;};
sleep 0.01;
} foreach ((_x CALL SAOKZONEDR) CALL APUFF);
sleep 0.01;
} foreach _blueGreen;
if (typename _striker == "ARRAY" || {typename _kohde == "ARRAY"}) exitWith {};

_kDat = _kohde CALL SAOKZONEDR;
_kS = _kohde call battleodds;
if (count _sDat == 0 || {count (_sDat select 0) == 0} || {typename ((_sDat select 0) select 0) != "STRING"}) exitWith {};
_sS = ((_sDat select 0) select 0) call battleodds;
_kAm = _kS select 4;
_p = [];
for "_x" from 0 to (count _sDat - 1) do {_p pushback _x;};
_pi = _p call RETURNRANDOM; _p = _p - [_pi];
while {count _p > 0 && {!([_kAm,(_sDat select _pi) select 1] call _apuF)}} do {_pi = _p call RETURNRANDOM; _p = _p - [_pi];sleep 0.01;};
_ammo = "";
if (typename _pi == "ARRAY" || {isnil{(_sDat select _pi) select 1}}) exitWith {};
if (([_kAm,(_sDat select _pi) select 1] call _apuF)) then {
{
_y = _x;
{_y0 = _x select 0; if ([_y, _y0] call SAOKINSTRING && {{[_x, _y0] call SAOKINSTRING} count ["smoke","flare"] == 0}) exitWith {_ammo = _x select 0;};sleep 0.01;} foreach ((_sDat select _pi) select 1);
if (_ammo != "") exitWith {};
sleep 0.01;
} foreach _kAm;
};
if (_ammo == "") exitWith {};
[_striker,_sDat,_pi,_ammo] spawn _takeAMMO;
_odds = ((_kS select 1) select (_sS select 0)) / ((_sS select 1) select (_kS select 0));
//hint str [_striker,_sDat,_pi,_ammo,_kohde,_kDat,_odds];
//copytoclipboard str [_striker,_sDat,_pi,_ammo,_kohde,_kDat,_odds];
_lf = 0;
//target moving 
_lf = _lf - (if (_kohde call SAOKVZMOVING) then {0.10} else {0});
//shooter moving 
_lf = _lf - (if (_striker call SAOKVZMOVING) then {0.15} else {0});
//damage affect hit change
[((_sDat select _pi) select 0), _ammo, "BUM"] SPAWN SAOKVIRSOUND;
_aTT = ["smoke"];if ({[_x, _kohde getvariable "Mtype"] call SAOKINSTRING} count ["air","plane","uav"] > 0) then {_aTT = ["flare"];};_m = [_kDat,_aTT] call _smokeF;
_smf = 1;
if (typename _m == "ARRAY") then {
[_kohde,_kDat,_m select 0,_m select 1] spawn _takeAMMO;
_smf = 0.3;
_kmp = locationposition _kohde;
_dir = [_kmp,locationposition _striker] call SAOKDIRT;
_smdis = (_kmp distance (locationposition _striker)) * (0.05 + random 0.05);
_smwall = [(_kmp select 0)+(sin _dir)*_smdis, (_kmp select 1)+(cos _dir)*_smdis,0];
_tt = "Smoke Cover"; if ("flare" in _aTT) then {_tt = "Flare Cover";};[_smwall, _tt, [1,1,1,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_mar1 = [_smwall,"SolidBorder","ColorWhite",(20+random 10),60,0.27] CALL SAOKCREATEMARKERA;
};
if (random 1 > ((_sDat select _pi) select 3) && {random 1 < (0.95 + _lf)} && {random 1 < _smf}) then {
//hit with big damage
[_striker, [_ammo,((_sDat select _pi) select 0)] call _ammoNAME, [1,0.2,0.8,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"] spawn _conF;
[((_sDat select _pi) select 0), _ammo, "FLY"] SPAWN SAOKVIRSOUND;
if (random 1 > _odds) then {
[_kohde,_kDat,1] spawn _kohdeDam;
[_kohde, "Critical Hit", [1,0.2,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[locationposition _striker,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITV"] SPAWN SAOKVIRSOUND;
} else {
[_kohde, "Hit", [1,0.8,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
[_kohde,_kDat,0.2] spawn _kohdeDam;
[locationposition _striker,locationposition _kohde] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "HITV"] SPAWN SAOKVIRSOUND;
};
[_striker,_kohde,_striker getvariable "Mcolor",locationposition _striker,((_sDat select _pi) select 0),_ammo] spawn _hintMes;
//MIS HIT
} else {
[_kohde, "Mis", [0.8,1,0,1],"\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"] spawn _conF;
_pko = locationposition _kohde;
_mis = [(_pko select 0)- random 20 + 10,(_pko select 1)- random 20 + 10,0];
[locationposition _striker,_mis] SPAWN _fBulletL;
sleep 0.5;
[((_sDat select _pi) select 0), _ammo, "MIS"] SPAWN SAOKVIRSOUND;
};
if (_odds < 0.4) then {[_kohde,locationposition _striker] SPAWN SAOKCALLGELP;};
if (_odds < 0.1 || {_kohde call SAOKISDAMAGED} || {_kohde call SAOKISLOWAMMO}) then {[_kohde, locationposition _striker] spawn SaOkFleeF;};
};
};


};

};



waitUntil {sleep 1; !isNil"StartMission"};
sleep 15;
RECENTB = [];
while {true} do {
waitUntil {sleep 0.5; {(_x getvariable "Mcolor") != "ColorGrey"} count VEHZONES > 0};
_r = if (random 1 < 0.5 || {count RECENTB == 0}) then {VEHZONES call RETURNRANDOM} else {RECENTB call RETURNRANDOM};
while {(isNull _r) || {(_r getvariable "Mcolor") == "ColorGrey"}} do {RECENTB = RECENTB - [_r];_r = VEHZONES call RETURNRANDOM;};
_F = [];
_E = [];
_G = [];
_C = [];
if ((_r getvariable "Mcolor") != "ColorRed") then {_F pushback _r;} else {_E pushback _r;};
_mP = locationposition _r;
_nearbyLocations = nearestLocations [locationposition _r,["Name"], 1700];
{
if (!isNil{_x getvariable "VZ"} && {isNil{_x getvariable "ACTIVE"}} && {(_x getvariable "Mcolor") != "ColorGrey"}) then {
if ((_x getvariable "Mcolor") != "ColorRed") then {_F pushback _x;} else {_E pushback _x;};
};
} foreach _nearbyLocations - [_r];
{
_p = (_x getvariable "Post");
if (isNil{_p getvariable "ACTIVE"} && {(count (_p getvariable "StaticW") > 0 || {!isNil{_p getvariable "MG-Guard"}} || {!isNil{_p getvariable "AA-Guard"}} || {!isNil{_p getvariable "AT-Guard"}} || {!isNil{_p getvariable "Sniper-Guard"}} || {!isNil{_p getvariable "MG-Guard"}} || {!isNil{_p getvariable "Medic-Guard"}})}) then {
_G pushback (_x getvariable "Post");
};
//sleep 0.01;
} foreach (nearestLocations [_mP, ["PostG","PostR"], 1300]);

{
_C pushback (_x getvariable "Marker");
} foreach (nearestLocations [_mP, ["CampR","CampB"], 1200]);

if ((count _F > 0 && {count _E > 0}) || {count _E > 0 && {{getmarkercolor (_x getvariable "Gmark") == "ColorGreen"} count _G > 0}} || {count _F > 0 && {{getmarkercolor (_x getvariable "Gmark") == "ColorRed"} count _G > 0}}) then {
_n = [_F,_E,_G,_C] SPAWN _batteF;
{if !(_x in RECENTB) then {RECENTB pushback _x;};} foreach _F + _E;
waituntil {sleep 0.1; scriptdone _n};
sleep (random 10);
};
};


