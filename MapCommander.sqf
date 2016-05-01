
private ["_conF","_conF2","_MAPCLICK","_funM","_n","_linesF"];
CLICKPOS = [0,0,0];
LOCPOSR = {private ["_p"];_p = locationposition (missionnamespace getvariable _this);_p};
F_funcM = {
private ["_gp","_wp","_marks","_ar","_nul","_cZ","_markers","_bl","_nCampZ","_mar","_marker","_ccc","_lastP","_n","_cZMW"];
CLICKPOS = _pos;
if (_shift && {isNil{missionnamespace getvariable "CurTeam"}} && {productVersion select 2 < 132}) then {
_gp = group player;
_n = _gp SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp = _gp addWaypoint [_pos, 0]; 
};
if !(_shift) then {
if (!isNil{missionnamespace getvariable "CurTeamMarkers"}) then {missionnamespace setvariable ["CurTeam", nil];_marks = + (missionnamespace getvariable "CurTeamMarkers");{deletemarker _x;} foreach _marks;};
_ar = "";
//uiNamespace setVariable ["_map",(findDisplay 12) displayCtrl 51];
//if (count (ctrlMapMouseOver (uiNamespace getVariable "_map")) > 1 && {(ctrlMapMouseOver (uiNamespace getVariable "_map") select 0) == "location"}) then {
_nVZ = nearestLocation [_pos, "Name"];
if (!isNil{_nVZ getvariable "VZ"} && {(_nVZ getvariable "Mcolor") in ["ColorGreen","ColorBlue"]}) then {
//_ar = (ctrlMapMouseOver (uiNamespace getVariable "_map") select 1);
_ar = _nVZ;
};
};
if (typename _ar == "LOCATION") then {
missionnamespace setvariable ["CurTeam", _ar];
_ar SPAWN {
_t = 0;
while {(dialog || {_t == 0}) && {visiblemap}} do {
_t = 1;
closeDialog 0;
_zone = (missionnamespace getvariable "CurTeam");
BUM = 0;
disableserialization;
_ok = createDialog "MapCom"; 
_myDisplay = findDisplay 3333;
_ctrl1 = _myDisplay displayCtrl 1600;
_ctrl2 = _myDisplay displayCtrl 1601;
_ctrl3 = _myDisplay displayCtrl 1800;
_mapC = (findDisplay 12) displayCtrl 51;
//_id = _myDisplay displayAddEventHandler ["MouseMoving", {if ([_this select 1,_this select 2] distance ((findDisplay 12) displayCtrl 51 posWorldToScreen (locationposition (missionnamespace getvariable "CurTeam"))) > 1.6) then {closeDialog 0;};}];
//_id = _myDisplay displayAddEventHandler ["MouseMoving", {hint format ["%1 %2",[(_this select 1),(_this select 2)],(locationposition (missionnamespace getvariable "CurTeam"))];}];
//_id = _ctrl3 ctrlAddEventHandler ["MouseEnter",{hint str _this;}];
_w = 4 * 0.025;
_h = 1 * 0.04;
if (!isNil{(missionnamespace getvariable "CurTeam") getvariable "NOMOVE"}) then {ctrlSetText [1601, "Rem Hold"];};
_p = _mapC posWorldToScreen (locationposition _zone);
_ctrl1 ctrlSetPosition [(_p select 0) + (-5.5 * 0.025 + 0),(_p select 1) + (-0.5 * 0.04 + 0), _w, _h];
_ctrl2 ctrlSetPosition [(_p select 0) +(-4.5 * 0.025 + 0),(_p select 1) + (-2 * 0.04 + 0), _w, _h];
_ctrl3 ctrlSetPosition [(_p select 0) +(-6 * 0.025 + 0),(_p select 1) + (-4 * 0.04 + 0), 8 * 0.025, 8 * 0.04];
_ctrl1 ctrlCommit 0;
_ctrl2 ctrlCommit 0;
_ctrl3 ctrlCommit 0;
sleep 0.1;
while {dialog && {visiblemap} && {str (missionnamespace getvariable "CurTeam") == str _zone} && {BUM > 0}} do {
_p = _mapC posWorldToScreen (locationposition _zone);
_ctrl1 ctrlSetPosition [(_p select 0) + (-5.5 * 0.025 + 0),(_p select 1) + (-0.5 * 0.04 + 0), _w, _h];
_ctrl2 ctrlSetPosition [(_p select 0) +(-4.5 * 0.025 + 0),(_p select 1) + (-2 * 0.04 + 0), _w, _h];
_ctrl3 ctrlSetPosition [(_p select 0) +(-6 * 0.025 + 0),(_p select 1) + (-4 * 0.04 + 0), 8 * 0.025, 8 * 0.04];
_ctrl1 ctrlCommit 0.1;
_ctrl2 ctrlCommit 0.1;
_ctrl3 ctrlCommit 0.1;
sleep 0.1;
};
if (BUM == 0) exitWith {closeDialog 0;};
};
//_myDisplay displayRemoveEventHandler ["MouseMoving",_id]; 
closeDialog 0;
};
_nul = _ar SPAWN F_MarkerSelectedZone;
} else {missionnamespace setvariable ["CurTeam", nil];};
if (!isNil{missionnamespace getvariable "CurTeam"}) then {
if (!isNil{missionnamespace getvariable "CurTeamMarkers"}) then {_marks = + (missionnamespace getvariable "CurTeamMarkers");{deletemarker _x;} foreach _marks;};
_cZ = missionnamespace getvariable "CurTeam";
_hint = "<t color='#FF00CC'>" + "<br/>PLATOON COMMAND<br/>"+"</t>";
_hint = _hint + "<t color='#33CCFF'>" +"Select Platoon| Right Click"+"<br/>";
_hint = _hint + "<t color='#33CCFF'>" +"Add WP| SHIFT+Left Click"+"<br/>";
_hint = _hint + "<t color='#FF99FF'>" +"Pathfinding is made if disallowed surface is found between"+"</t>"+"<br/>";
[_hint] SPAWN SAOKBOXHINT;
if ((_cZ getvariable "Mtype") == "n_naval" || {(_cZ getvariable "Mcolor") == "ColorBlue"}) exitWith {};
_markers = [];
_bl = [];
_nCampZ = ["ColorBlue", locationposition _cZ] CALL NEARESTCAMP;
_mar = format ["CAMPLmar%1",NUMM];
NUMM=NUMM+1;
_marker = createMarker [_mar,locationposition _nCampZ];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [4000, 4000];
_marker setMarkerColor "ColorBlack";
_marker setMarkerBrush "Border";
_markers pushBack _marker;
missionnamespace setvariable ["CurTeamMarkers",_markers];
};
if (_shift && {!isNil{missionnamespace getvariable "CurTeam"}}) then {
_cZ = missionnamespace getvariable "CurTeam";
_nCampZ = ["ColorBlue", locationposition _cZ] CALL NEARESTCAMP;
if ((_cZ getvariable "Mcolor") == "ColorGreen" && {!((_cZ getvariable "Mtype") in ["n_naval","n_plane","n_air"])} && {locationposition _nCampZ distance _pos > 4000}) exitWith {
"Too far, over 4km, from nearest green camp" SPAWN HINTSAOK;
};

_lastP = locationposition _cZ;
_cZMW = (_cZ CALL SAOKZONEMW);
if (count _cZMW > 0) then {
_ccc = count _cZMW - 1;
_lastP = _cZMW select _ccc;
};
if !((_cZ getvariable "IDCODE") in WAITSTOMOVE) then {
if (!_alt) then {
if (!([_lastP,_pos,30] CALL SAOKWATERBETWEEN) || {((_cZ getvariable "Mtype") in ["n_plane","n_air","b_plane","b_air"])}) then {
[_cZ, _pos] SPAWN ZoneMove;
} else {
if (surfaceiswater _pos && {(_cZ getvariable "Mtype") in ["n_naval","b_naval"]} || {(!surfaceiswater _pos && {!((_cZ getvariable "Mtype") in ["n_naval","b_naval"])})}) then {[_cZ, _pos] SPAWN SAOKASTARM;};
};
} else {
_cZ CALL SAOKVZMOVESTOP;
}; 
} else {"Platoon under pathfinding - try again when it have waypoints made" SPAWN HINTSAOK;};
};
};
_MAPCLICK = ["mclick1","onMapSingleClick","F_funcM"] call BIS_fnc_addStackedEventHandler;


_funM = {
private ["_ap","_foreachIndex","_col","_am","_g","_t","_sr","_d","_odds","_na","_f","_hint","_gp","_cZ","_bG","_ddaa"];
_cZ = nearestLocation [CLICKPOS, "Name"];
uiNamespace setVariable ["_map",(findDisplay 12) displayCtrl 51];
if (count (ctrlMapMouseOver (uiNamespace getVariable "_map")) > 1 && {(ctrlMapMouseOver (uiNamespace getVariable "_map") select 0) == "marker"}) then {
_m = (ctrlMapMouseOver (uiNamespace getVariable "_map") select 1);
if (getmarkercolor _m != "ColorWhite" && {markerShape _m == "ICON"}) then {_cZ = _m;};
};
if (typename _cZ == "LOCATION" && {(isNil{_cZ getvariable "VZ"} || {locationposition _cZ distance CLICKPOS > 300})}) exitWith {};
if (typename _cZ == "LOCATION" && {(_cZ getvariable "Mcolor") == "ColorRed"} && {({(_x getvariable "Mtype") in ["n_uav","b_uav","n_recon","b_recon"] && {locationposition _cZ distance locationposition _x < 2000}} count VEHZONESA == 0)}) exitWith {};
if (typename _cZ == "STRING" && {getmarkercolor _cZ == "ColorRed"} && {({(_x getvariable "Mtype") in ["n_uav","b_uav","n_recon","b_recon"] && {getmarkerpos _cZ distance locationposition _x < 2000}} count VEHZONESA == 0)}) exitWith {};
//INFO HINT
_bG = [];
_hint = "";
if (typename _cZ == "LOCATION") then {
_ddaa = (_cZ CALL SAOKZONEDRNEW);
{
if (typename _x == "ARRAY") then {
_bG pushback _x;
} else {
_ap = _ddaa select _foreachIndex; 
_bG pushback [_ap,(_ap call SAOKRETVEHAMM),1,0];
};
} foreach _ddaa;
_hint = "" +"<br/>";
{
_d = _bG select _foreachIndex;
_odds = (_x select 0) call battleodds;
_na = "<br/><t color='#FFCC99'>"+(if (_odds select 3 != "") then {_odds select 3} else {(getText (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName"))})+"</t>";
_col = "#00FF00";
if (_d select 3 > 0.1) then {_col = "#99FF00";};
if (_d select 3 > 0.3) then {_col = "#CCFF00";};
if (_d select 3 > 0.45) then {_col = "#FFFF00";};
if (_d select 3 > 0.6) then {_col = "#FF9900";};
if (_d select 3 > 0.8) then {_col = "#FF6600";};
_am = "";
if (typename (_d select 1) == "STRING") then {_am = (_d select 1);} else {
_g = 0;
_vCla = (_x select 0);
{
if (_g == 2) then {
_am = _am + "<br/>    ";_g = 0;
};
//configfile >> "CfgWeapons" >> "Gatling_30mm_Plane_CAS_01_F" >> "displayName"
//configfile >> "CfgVehicles" >> "B_Plane_CAS_01_F" >> "weapons"
//configfile >> "CfgWeapons" >> "Gatling_30mm_Plane_CAS_01_F" >> "magazines"
_mn = (getText (configfile >> "CfgMagazines" >> (_x select 0) >> "displayName"));
if (_mn == "") then {
_wps = getarray (configfile >> "CfgVehicles" >> _vCla >> "weapons");
_mag = (_x select 0);
{
if (_mag in (getarray (configfile >> "CfgWeapons" >> _x >> "magazines"))) exitWith {_mn = gettext (configfile >> "CfgWeapons" >> _x >> "displayName");};
} foreach _wps;
};
if (_mn == "") then {
_mn = (getText (configfile >> "CfgMagazines" >> (_x select 0) >> "ammo"));
};
_am = _am + _mn + "<t color='#003399'>"+(format ["x%1 ",(_x select 1)])+"</t>";_g = _g + 1;} foreach (_d select 1);
};
_f = floor ((_d select 2)*100);
_t = format [" %1<br/>",_na]+(format ["<img size='1.2' color='%2' image='%1'/>","\A3\ui_f\data\map\mapcontrol\Fuelstation_CA.paa","#FF6600"])+format ["%1<br/>", _f];
if (count _am > 0) then {_t = _t + (format ["<img size='1.2' color='%2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa","#FF6600"])+format ["%1",_am];};
if ((_cZ getvariable "Mtype") in ["n_mortar","b_mortar"]) then {
_t = format [" %1<br/>",_na];
if (count _na == 0) then {_na = "Out of Ammo";};
_t = _t +(format ["<img size='1.2' color='%2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa","#FF6600"])+format ["%1",_am];
};
if ((_cZ getvariable "Mtype") in ["n_support","b_support","n_med","b_med"]) then {
_sr = if (!isNil{_cZ getvariable "SUPRESOUR"}) then {_cZ getvariable "SUPRESOUR"} else {5};
_t = format [" %1<br/>",_na]+(format ["<img size='1.2' color='%2' image='%1'/>","\A3\ui_f\data\map\mapcontrol\Fuelstation_CA.paa","#FF6600"])+format ["%1<br/>",_f];
_t = _t +(format ["<img size='1.2' color='%2' image='%1'/>","\A3\ui_f\data\map\markers\nato\n_service.paa","#FF6600"])+format ["%1",_sr];
};
_hint = _hint + (format ["<img size='1.2' color='%2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> (_x select 0) >> "picture")),_col]) + _t +"<br/>";
} foreach _bG;
} else {
//(getText (configfile >> "CfgMarkers" >> "loc_Bunker" >> "icon"))
if (_cZ == (([getmarkerpos _cZ] CALL RETURNGUARDPOST) getvariable "Gmark")) then {

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

_gp = ([getmarkerpos _cZ] CALL RETURNGUARDPOST);
_hint = "<t color='#FFCC99'>Guardpost</t>"+"<br/>";
_d = _gp call _postD;
_hint = _hint + (format ["<img size='1.2' color='%2' image='%1'/> %3x WallBonus",(getText (configfile >> "CfgMarkers" >> "loc_Bunker" >> "icon")),"#FF6600",_d])+"<br/>";
{_hint = _hint + (format ["<img size='1.2' color='%2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> (_x select 0) >> "picture")),"#FF6600"])+" "+(getText (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName")) +"<br/>";} foreach (_gp getvariable "StaticW");
{if (!isNil{_gp getvariable _x}) then {_hint = _hint + (format ["<img size='1.2' color='%2' image='%1'/>","\A3\ui_f\data\map\markers\nato\n_inf.paa","#FF6600"])+" "+_x +"<br/>";};} foreach ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"];
if (!isNil{_gp getvariable "PowCells"}) then {_hint = _hint + (format ["<img size='1.2' color='%2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa","#FF6600"])+ format ["POWs %1 / %2",{(_x select 1) != ""} count (_gp getvariable "PowCells"),count (_gp getvariable "PowCells")] +"<br/>";};
//if (!isNil{_post getvariable "PowCells"} && {{(_x select 1) == ""} count (_post getvariable "PowCells") > 0})
};
if (_hint == "" && {getmarkercolor _cZ in ["ColorYellow","ColorOrange"]}) then {
if (getmarkertype _cZ == "u_installation" || {_cZ in AIRFIELDLOCATIONS}) then {_hint = _hint + (format ["<img size='1.2' color='%2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa","#FF6600"])+" Capture by creating guardpost with at least one purchased AI-static using Shift+C. Local relationship also needs to be friendly";};
if (getmarkertype _cZ in ["loc_Power","n_service","loc_Quay"]) then {_hint = _hint + (format ["<img size='1.2' color='%2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa","#FF6600"])+" Capture by creating guardpost with at least one purchased AI-static using Shift+C";};
};
};

//hint parseText _hint; icon = "\A3\ui_f\data\map\markers\nato\n_inf.paa";
[_hint,_cZ] SPAWN {
private ["_disp","_pos"];
68 cutRsc ["MyRscTitle11","PLAIN"];
disableSerialization;
_disp = uiNamespace getVariable "d11_MyRscTitle";
_pos = if (typename (_this select 1) == "LOCATION") then {locationposition (_this select 1)} else {getmarkerpos (_this select 1)};
(_disp displayCtrl 311) ctrlSetPosition (findDisplay 12 displayCtrl 51 ctrlMapWorldToScreen _pos);
(_disp displayCtrl 311) ctrlCommit 0;
(_disp displayCtrl 311) ctrlSetStructuredText parseText (_this select 0);
while {!isNull _disp} do {
_pos = if (typename (_this select 1) == "LOCATION") then {locationposition (_this select 1)} else {getmarkerpos (_this select 1)};
(_disp displayCtrl 311) ctrlSetPosition (findDisplay 12 displayCtrl 51 ctrlMapWorldToScreen _pos);
(_disp displayCtrl 311) ctrlCommit 0;
sleep 0.01;
};
};
};

_linesF = {
private ["_mPs","_foreachIndex","_ghgh","_y","_id","_n","_fW","_gPo","_fW2","_c","_ids","_g","_m","_bWP"];
_m = _this;
_mPs = _m CALL SAOKZONEMW;
_bWP = [];
_g = 0;
while {visibleMap && {count (_m CALL SAOKZONEMW) > 0} && {!((_m getvariable "IDCODE") in ACTIVEZ)} && {(_m getvariable "Mcolor") != "ColorGrey"}} do {
if (_g == 1) then {_mPs = _m CALL SAOKZONEMW;};
_fW2 = + (_m CALL SAOKZONEMW);
_ghgh = 1;
while {_ghgh == 1} do {
_ghgh = 0;
{_y = _x;if ({_x distance _y < 5} count _bWP > 0) exitWith {_mPs deleteat _foreachIndex;_ghgh = 1;};} foreach _mPs;
};
if (count _mPs == 0) exitWith {};
_c = count _mPs - 1;
_ids = [];
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawArrow [
		'%1' call LOCPOSR,
		%2,
		[1,0.4,0,1]
	];
",(_m getvariable "IDCODE"),_mPs select 0]];
_ids pushback _id;
_n = 0;
while {_n < _c} do {
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawLine [
		%1,
		%2,
		[1,0.4,0,1]
	];
",_mPs select _n,_mPs select (_n+1)]];
_n = _n + 1;
_ids pushback _id;
};
_fW = _m CALL SAOKZONEMW;
_gPo = locationposition _m;
_hu = 0;
while {visibleMap && {(_m getvariable "Mcolor") != "ColorGrey"} && {count (_m CALL SAOKZONEMW) > 0} && {(_mPs select 0) distance (locationposition _m) > 10} && {count _fW2 == count _fW} && {_gPo distance (_mPs select 0) >= (locationposition _m) distance (_mPs select 0)} && {!((_m getvariable "IDCODE") in ACTIVEZ)}} do {
_hu = _hu + 1;
if (_hu > 10) then {_gPo = locationposition _m;_hu = 0;};
sleep 0.1;
_fW = _m CALL SAOKZONEMW;
};
if !((_mPs select 0) distance (locationposition _m) > 10) then {_bWP pushback (_mPs select 0);};
_g = 1;
{(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _x];} foreach _ids;
};
_m setvariable ["MLINED",nil];
};
ZONECONTEXT = [];

_conF = {
private ["_id","_z","_t"];
_z = _this select 0;
_t = _this select 1;
_l = missionnamespace getvariable _z;
if (isNull _l || {(_l getvariable "Mcolor") == "ColorGrey"}) exitWith {};
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawIcon [
		'\A3\ui_f\data\map\groupicons\selector_selectedMission_ca.paa',
		[1,0.4,0,1],
		'%1' call LOCPOSR,
		31,
		31,
		0,
		'%2',
		2,
		0.04,
		'TahomaB',
		'right'
	]
",_z,_t]];
waitUntil {sleep 0.2; !visibleMap || {(_l getvariable "Mcolor") == "ColorGrey"} || {(_this select 2) < time} || {{_z == (_x select 0) && {_t == (_x select 1)}} count ZONECONTEXT == 0} || {(_l getvariable "Mcolor") in ["colorGrey","ColorGrey"]}};
(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
if ((_l getvariable "Mcolor") in ["colorGrey","ColorGrey"]) then {{if (_x select 0 == _z) exitWith {ZONECONTEXT deleteat _foreachindex;};} foreach ZONECONTEXT;};
_l setvariable ["MLINED2",nil];
};

_conF2 = {
private ["_id","_z","_t"];
_z = _this;
if ((_z getvariable "Mcolor") == "ColorGrey") exitWith {};
_t = "";
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawIcon [
		'\A3\ui_f\data\map\groupicons\selector_selectedFriendly_ca.paa',
		[0.6,0,0.4,0.8],
		'%1' call LOCPOSR,
		46,
		46,
		0,
		'%2',
		2,
		0.05,
		'TahomaB',
		'right'
	]
",(_z getvariable "IDCODE"),_t]];
waitUntil {sleep 0.2; !visibleMap || {{(_z getvariable "IDCODE") == _x} count MLINED3 == 0} || {(_z getvariable "Mcolor") == "ColorGrey"}};
(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
MLINED3 = MLINED3 - [(_z getvariable "IDCODE")];
};

_conF3 = {
private ["_id","_z","_t"];
_z = _this;
if ((_z getvariable "Mcolor") == "ColorGrey") exitWith {};
_t = "";
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawIcon [
		'\A3\ui_f\data\map\groupicons\selector_selectedFriendly_ca.paa',
		[0.2,0.8,1,0.8],
		'%1' call LOCPOSR,
		46,
		46,
		0,
		'%2',
		2,
		0.05,
		'TahomaB',
		'right'
	]
",(_z getvariable "IDCODE"),_t]];
waitUntil {sleep 0.2; !visibleMap || {{(_z getvariable "IDCODE") == _x} count MLINED3 == 0} || {(_z getvariable "Mcolor") == "ColorGrey"}};
(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
MLINED3 = MLINED3 - [(_z getvariable "IDCODE")];
};

_vzmarF = {
private ["_id","_z","_col"];
_z = _this;
if ((_z getvariable "Mcolor") != "ColorGrey") then {
_col = (_z getvariable "Mcolor") CALL SAOKVZCOL;
if (typename _col == "STRING") then {
_col = (configfile >> "cfgmarkercolors" >> (_z getvariable "Mcolor") >> "Color") call bis_fnc_colorConfigToRGBA;
};
_col set [3, 0.8];
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawIcon [
		(getText (configfile >> 'CfgMarkers' >> '%3' >> 'icon')),
		%4,
		'%1' call LOCPOSR,
		25,
		25,
		0,
		'%2',
		2,
		0.05,
		'TahomaB',
		'right'
	]
",(_z getvariable "IDCODE"),(_z getvariable "Mtext"),(_z getvariable "Mtype"),_col]];
waitUntil {sleep 0.2; !visibleMap || {isNull _z} || {(_z getvariable "Mcolor") == "ColorGrey"}};
(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
};
if (!(isNull _z) && {(_z getvariable "Mcolor") == "ColorGrey"}) then {
_col = (configfile >> "cfgmarkercolors" >> (_z getvariable "Mcolor") >> "Color") call bis_fnc_colorConfigToRGBA;
_id = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw",format ["
	(_this select 0) drawIcon [
		(getText (configfile >> 'CfgMarkers' >> '%3' >> 'icon')),
		%4,
		%1,
		25,
		25,
		0,
		'%2',
		2,
		0.05,
		'TahomaB',
		'right'
	]
",locationposition _z,(_z getvariable "Mtext"),(_z getvariable "Mtype"),_col]];
waitUntil {sleep 0.2; !visibleMap || {isNull _z}};
(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw", _id];
};
_z setvariable ["VZMARKED",nil];
};

MLINED3 = [];
while {true} do {
waitUntil {sleep 0.5; visibleMap};
_hint = "<t color='#FF00CC'>" + "<br/>PLATOON COMMAND<br/>"+"</t>";
_hint = _hint + "<t color='#33CCFF'>" +"Select Platoon| Right Click"+"<br/>";
_hint = _hint + "<t color='#33CCFF'>" +"Add WP| SHIFT+Left Click"+"<br/>";
_hint = _hint + "<t color='#FF99FF'>" +"Pathfinding is made if disallowed surface is found between"+"</t>"+"<br/>";
[_hint] SPAWN SAOKBOXHINT;
while {visibleMap} do {
{
if (!isNull _x && {isNil{_x getvariable "VZMARKED"}}) then {
_x setvariable ["VZMARKED",1];
_x SPAWN _vzmarF;
}; 
} foreach VEHZONESA;
sleep 0.1;
_n = [] SPAWN _funM;
sleep 0.1;
{
if (!((_x getvariable "Mcolor") in ["ColorRed","ColorRed","ColorGrey","colorGrey"]) && {isNil{_x getvariable "MLINED"}}) then {
_x setvariable ["MLINED",1];
_x SPAWN _linesF;
}; 
} foreach ZONETOMOVE;
sleep 0.1;
while {{_x select 2 < time} count ZONECONTEXT > 0} do {{if (_x select 2 < time) exitWith {ZONECONTEXT deleteat _foreachindex;};} foreach ZONECONTEXT;};
{
_y0 = missionnamespace getvariable (_x select 0);
_y1 = _x select 1;
if (!isNil"_y0" && {isNil{_y0 getvariable "MLINED2"}}) then {
_y0 setvariable ["MLINED2",1];
_x SPAWN _conF;
}; 
} foreach ZONECONTEXT;
sleep 0.1;
{if (isNull (missionnamespace getvariable _x) || {!(_x in WAITSTOMOVE)}) then {MLINED3 = MLINED3 - [_x];};} foreach MLINED3;
{
_y = _x;
if ({_y == _x} count MLINED3 == 0) then {
_y = missionnamespace getvariable _x;
if (isNil"_y") exitWith {WAITSTOMOVE deleteat _foreachindex;};
MLINED3 pushback _x;
_y SPAWN _conF2;
};
} foreach WAITSTOMOVE; 
{
_y = _x;
if ({(_y getvariable "IDCODE") == _x} count MLINED3 == 0) then {
if (isNil{(_y getvariable "IDCODE")}) exitWith {NOMORDERED deleteat _foreachindex;};
MLINED3 pushback (_y getvariable "IDCODE");
_y SPAWN _conF3;
};
} foreach NOMORDERED; 
sleep 0.1;
};

};

