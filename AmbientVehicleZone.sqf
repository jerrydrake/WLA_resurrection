private ["_noMax","_c","_dis","_func","_vZ","_AAdistance","_resF","_resFexit"];
_func = {
private ["_cc","_color","_side","_arr","_vehicles","_units","_obj","_c","_w","_ss","_obj2","_si","_star","_wpT","_forEachIndex","_wpPP","_start","_mid","_dis","_ar","_vd","_mm","_a","_m","_t","_amD","_vClas","_cWPs","_nnn","_corr","_mAF","_ved","_nul","_thezone","_ww","_dirr","_wpSS"];
//SIDE CHECK
if (isNull _this) exitWith {};
_color = _this getvariable "Mcolor";
while {_this in RESUPPEDZ} do {RESUPPEDZ = RESUPPEDZ - [_this];};
_side = if (_color == "ColorRed") then {EAST} else {WEST};
//START POS SEARCH
_star = locationposition _this;
if (((_this getvariable "Mtype") in ["o_naval","b_naval","n_naval"]) || {_this in NOMOVEZONES}) then {} else {
while {vehicle player distance _star < 800} do {
sleep 0.2;
_star = [(getposATL vehicle player),1200,800,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
};
};
_arr = _this CALL SAOKZONEDRNEW;
if (isNil"_arr" || {count _arr == 0}) exitWith {missionnamespace setvariable [(_this getvariable "IDCODE"),nil];_this call resFexit;deleteLocation  _this;};
//SPAWN
//[(typeOf _x),magazinesAmmoFull _x,fuel _x,damage _x]
_this setvariable ["ACTIVE",1];
_ww = _this CALL SAOKZONEMW;
_dirr = if (count _ww > 0) then {([locationposition _this, (_ww select 0)] call SAOKDIRT)} else {(([locationposition _this, player] call SAOKDIRT) + (75 - random 150))};
_vClas = if (typename (_arr select 0) == "STRING") then {_arr select 0} else {(_arr select 0) select 0};
_vehicles = [];
_units = [];
_wpT = "MOVE";
if (_color != "ColorRed") then {_wpT = "GUARD";};
if (_vClas isKindOf "Plane") then {_star = [_star select 0,_star select 1,600];};
if (_vClas isKindOf "Helicopter") then {_star = [_star select 0,_star select 1,100];_wpT = "LOITER";};
_vd = [_star,_dirr, _vClas,_side];
if (_this in NOMOVEZONES) then {_vd pushBack "";};
_obj = _vd call SPAWNVEHICLE;
if (_color == "ColorRed") then {CantCommand pushBack (_obj select 2);};
if (_vClas isKindOf "Plane") then {(_obj select 0) flyinheight 600;};
if (_vClas isKindOf "Helicopter") then {(_obj select 0) flyinheight 100;};
leader (_obj select 2) setRank "LIEUTENANT";
(_obj select 0) setvariable ["ZoneVehi",1];
if (typename (_arr select 0) != "STRING") then {
_amD = (_arr select 0) select 1;
if (typename _amD == "ARRAY") then {
_nnn = _vClas CALL SAOKRETVEHAMM;
{_mm = _x; if ({_mm == (_x select 0)} count _nnn > 0) then {(_obj select 0) removemagazine _x;};} foreach (magazines (_obj select 0));
{
_m = (_x select 0);
_t = {(_x select 0) == _m} count _amD;
_a = 0;
{if ((_x select 0) == _m) then {_a = _a + (_x select 1);};} foreach _amD;
_a = _a / _t;
if ((_obj select 0) canAdd (_x select 0)) then {
(_obj select 0) addmagazine (_x select 0); 
(_obj select 0) setMagazineTurretAmmo [_x select 0,_a,[0]];
};
} foreach _amD;
} else {
_mAF = magazinesAmmoFull (_obj select 0);
{_corr = + _x; _corr resize 2;_mAF set [_foreachIndex, _corr];} foreach _mAF;
 
[] SPAWN SAOKADDAMDAT;
};
if (count (_arr select 0) > 3) then {
(_obj select 0) setfuel ((_arr select 0) select 2);
(_obj select 0) setdamage ((_arr select 0) select 3);
};
} else {
_mAF = magazinesAmmoFull (_obj select 0);
{_corr = + _x; _corr resize 2;_mAF set [_foreachIndex, _corr];} foreach _mAF;
 
[] SPAWN SAOKADDAMDAT;
};
[_this, (_obj select 2)] CALL SAOKZONEG;

_vehicles pushBack (_obj select 0);
_units append (units (_obj select 2));
_c = 1;
if (_color != "ColorRed") then {(_obj select 2) setvariable ["VZoneG",1];};
{
if (_forEachIndex != 0) then {
_vClas = if (typename _x == "STRING") then {_x} else {_x select 0};
_ss = [_star,100,30,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
if (_vClas isKindOf "Plane") then {_star = [_star,150,70,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;_ss = [_star select 0,_star select 1,100];};
_vd = [_ss,_dirr,_vClas,_side];
if (_this in NOMOVEZONES) then {_vd pushBack "";};
_obj2 = _vd call SPAWNVEHICLE;
if (_vClas isKindOf "Plane") then {(_obj2 select 0) flyinheight 600;};
if (_vClas isKindOf "Helicopter") then {(_obj2 select 0) flyinheight 100;};
if (typename _x != "STRING") then {
_amD = (_x select 1);
if (typename _amD == "ARRAY") then {
_nnn = _vClas CALL SAOKRETVEHAMM;
{_mm = _x; if ({_mm == (_x select 0)} count _nnn > 0) then {(_obj2 select 0) removemagazine _x;};} foreach (magazines (_obj2 select 0));
{
_m = (_x select 0);
_t = {(_x select 0) == _m} count _amD;
_a = 0;
{if ((_x select 0) == _m) then {_a = _a + (_x select 1);};} foreach _amD;
_a = _a / _t;
if ((_obj2 select 0) canAdd (_x select 0)) then {
(_obj2 select 0) addmagazine (_x select 0); 
(_obj2 select 0) setMagazineTurretAmmo [_x select 0,_a,[0]];
};
} foreach _amD;
} else {
_mAF = magazinesAmmoFull (_obj2 select 0);
{_corr = + _x; _corr resize 2;_mAF set [_foreachIndex, _corr];} foreach _mAF;
 
[] SPAWN SAOKADDAMDAT;
};
if (count _x > 3) then {
(_obj2 select 0) setfuel (_x select 2);
(_obj2 select 0) setdamage (_x select 3);
};
} else {
_mAF = magazinesAmmoFull (_obj2 select 0);
{_corr = + _x; _corr resize 2;_mAF set [_foreachIndex, _corr];} foreach _mAF;
 
[] SPAWN SAOKADDAMDAT;
};
_units append (units (_obj2 select 2));
(_obj2 select 0) setvariable ["ZoneVehi",1];

if (_color == "ColorRed") then {CantCommand pushBack (_obj2 select 2);VehicleGroups pushBack (_obj2 select 2);};
units (_obj2 select 2) join (_obj select 2);
_vehicles pushBack (_obj2 select 0);
_c = _c + 1;
};
sleep 0.1;
} foreach _arr;
if (_side == EAST) then {(_obj select 2) setvariable ["VehG",1];
};
//MOVING OR NOT
if ((_this getvariable "Mtype") in ["n_art","b_art","n_mortar","b_mortar"]) then {ARTGROUPS pushback [_this,(_obj select 2)];};
_wpPP = [locationposition _this];
if (count (_this CALL SAOKZONEMW) > 0) then {_wpPP = _this CALL SAOKZONEMW;};
if (!isNil"_wpPP" && {!isNil"_obj"} && {!isNull (_obj select 2)} && {typename (_obj select 0) == "OBJECT"} && {!(_this in NOMOVEZONES)}) then {
(_obj select 2) setvariable ["GMar",_this];
_cc = 0;
_cWPs = count _wpPP - 1;
{
if (_x distance [0,0,0] > 50) then {
_w = (_obj select 2) addWaypoint [_x, 0]; 
//_w setWaypointStatements ["true", "if (!isNil""thisList"") then {thisList call SAOKVZFUNC1;};"];
if (_cWPs == _foreachindex) then {_w setWaypointType _wpT;};
if (_cc == 0) then {
_cc = 1;
_start = getposATL (_obj select 0);
_mid = [((_start select 0)+(_x select 0))*0.5,((_start select 1)+(_x select 1))*0.5,0];
if (_start distance _mid > 50) then {
[_mid,"mil_arrow",(_this getvariable "Mcolor"),([_start, _mid] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
};
};
};
sleep 0.1;
} foreach _wpPP;
};
if (!isnil"_units") then {
[_units,_this] SPAWN SAOKSHF9;
};
sleep 5;
//WAITUNTIL PLAYER IS FAR 
_dis = (["V"] CALL DIS); 
if ((_this getvariable "Mtype") in ["o_air","b_air","n_air","n_plane","o_uav","n_uav","n_uav","o_plane","b_plane"] || {["AIR", (_this getvariable "Mtext")] call SAOKINSTRING}) then {_dis = (["V"] CALL DIS)*2.2;};
while {vehicle player distance (locationposition _this) < _dis && {{alive _x && {vehicle _x != _x}} count units (_obj select 2) > 0}} do {
_ar = [];
if !(_this in RESUPPEDZ) then {
if (!isnil"_vehicles") then {
{
if (alive _x && {{alive _x} count crew _x > 0}) then {
_mAF = magazinesAmmoFull (vehicle _x);
{_corr = + _x; _corr resize 2;_mAF set [_foreachIndex, _corr];} foreach _mAF;
_ar pushBack [(typeOf _x),_mAF,fuel _x,damage _x];
};
} foreach _vehicles;
};
} else {
_arr = _this CALL SAOKZONEDRNEW;
{
if (count _vehicles <= _foreachIndex && {!isNull (_vehicles select _foreachIndex)} && {alive (_vehicles select _foreachIndex)}) then {
_amD = _x select 1;
_nnn = _vClas CALL SAOKRETVEHAMM;
{_mm = _x; if ({_mm == (_x select 0)} count _nnn > 0) then {(_vehicles select _foreachIndex) removemagazine _x;};} foreach (magazines (_vehicles select _foreachIndex));
_ved = (_vehicles select _foreachIndex);
{
_m = (_x select 0);
_t = {(_x select 0) == _m} count _amD;
_a = 0;
{if ((_x select 0) == _m) then {_a = _a + (_x select 1);};} foreach _amD;
_a = _a / _t;
if (_ved canAdd (_x select 0)) then {
_ved addmagazine (_x select 0); 
_ved setMagazineTurretAmmo [_x select 0,_a,[0]];
};
} foreach _amD;
};
} foreach _arr;
RESUPPEDZ = RESUPPEDZ - [_this];
};
if (count _ar > 0) then {
[_this,_ar] CALL SAOKZONED;
};
sleep 5;
};
_this setvariable ["ACTIVE",nil];
_wpSS = [];
_this setvariable ["ZONEMS",[]];
{_wpSS pushback (waypointPosition _x);} foreach waypoints (_obj select 2);
{if (_this == _x select 0) exitWith {ARTGROUPS deleteat _foreachIndex;};} foreach ARTGROUPS;
_ar = [];
if (!isnil"_vehicles") then {
{if (alive _x && {{alive _x} count crew _x > 0}) then {
_mAF = magazinesAmmoFull (vehicle _x);
{_corr = + _x; _corr resize 2;_mAF set [_foreachIndex, _corr];} foreach _mAF;
_ar pushBack [(typeOf _x),_mAF,fuel _x,damage _x];
};} foreach _vehicles;
};
_arr = [];
if (!isnil"_vehicles") then {_arr append _vehicles;};
{
if (vehicle player distance (locationposition _this) > _dis) then {
_x spawn SAOKSHF10;
} else {CARS pushback _x;};
sleep 0.1;
} foreach _arr;
_arr = [];
if (!isnil"_units") then {_arr append _units;};
{
if (vehicle player distance (locationposition _this) > _dis) then {
_x spawn SAOKSHF11;
} else {if ({alive _x} count units group _x > 0) then {_nul = [group _x] SPAWN FMoveAwayAndGetDeleted;};};
sleep 0.1;
} foreach _arr;
ACTIVEZ = ACTIVEZ - [(_this getvariable "IDCODE")];
if (count _ar > 0) then {
[_this,_ar] CALL SAOKZONED;
_si = 0.65 + (0.15*(count _ar));
//_this setMarkerSize [_si,_si];
VEHZONES pushBack _this;
if (count _wpSS > 0) then {_this setvariable ["ZONEMS",_wpSS];};
} else {
if ((_this getvariable "Mtype") in ["n_air","b_air","b_plane","n_plane"]) then {[locationposition _this, "P"] SPAWN SAOKEX1;};
if ((_this getvariable "Mtype") in ["n_support","b_support","b_med","n_med"]) then {[locationposition _this, "C"] SPAWN SAOKEX1;};
_this CALL SAOKZONED;
_this CALL SAOKZONEG;
_this setvariable ["Mcolor","ColorGrey"]; 
if (!isNil{_this getvariable "WAITINGSUP"}) then {
_thezone = _this getvariable "WAITINGSUP";
if (!isnull _thezone && {_thezone CALL SAOKVZMOVING}) then {_thezone CALL SAOKVZMOVESTOP;};
};
_this spawn SAOKSHF12;
};
};


_resF = {
private ["_arM","_mar2","_mar"];
RESERVEZONE pushBack _this;
//_this setMarkerAlpha 0.35;
_arM = format ["ZoneResM%1",_this getvariable "IDCODE"];
_mar2 = createMarker [_arM ,locationposition _this];
_mar2 setMarkerShape "ELLIPSE";
_mar2 setMarkerAlpha 0.35;
_mar2 setMarkerBrush "SolidBorder";
_mar2 setMarkerSize [200,200];
_mar2 setMarkerDir 0;
_mar2 setMarkerColor "ColorWhite"; 
_mar = format ["%1a",_arM];
_mar2 = createMarker [_mar,locationposition _this];
_mar2 setMarkerShape "ICON";
_mar2 setMarkerType "mil_box";
_mar2 setMarkerAlpha 0.45;
_mar2 setMarkerSize [0.7,0.7];
_mar2 setMarkerColor "ColorWhite";
_mar2 setMarkerText " In Reserve, Location Unknown";
[_arM,_this] SPAWN SAOKSHF13;
RESERVEAMARKS pushBack [_this getvariable "IDCODE", _arM];
};

_resFexit = {
private ["_forEachIndex","_deAT"];
{
if (_x select 0 == _this getvariable "IDCODE") exitWith {
deletemarker ((_x select 1)+"a");
deletemarker (_x select 1);
_deAT = RESERVEAMARKS deleteAt _forEachIndex;
};
} foreach RESERVEAMARKS;
RESERVEZONE = RESERVEZONE - [_this];
};

resFexit = {
private ["_forEachIndex","_deAT"];
{
if (_x select 0 == _this getvariable "IDCODE") exitWith {
deletemarker ((_x select 1)+"a");
deletemarker (_x select 1);
_deAT = RESERVEAMARKS deleteAt _forEachIndex;
};
} foreach RESERVEAMARKS;
RESERVEZONE = RESERVEZONE - [_this];
};

_noMax = {
private ["_bol","_mC"];
_bol = false;
_mC = _this getvariable "Mcolor";
if (_mC == "ColorRed") then {
if ({(missionnamespace getvariable _x) getvariable "Mcolor" == _mC} count ACTIVEZ < MAXACTIVEV) then {_bol = true;};
} else {
if (_mC in ["ColorBlue","ColorGreen"]) then {
if ({((missionnamespace getvariable _x) getvariable "Mcolor") in ["ColorBlue","ColorGreen"]} count ACTIVEZ < MAXACTIVEV) then {_bol = true;};
};
};
_bol
};

AAsM = [];
_AAdistance = DIFLEVEL * 4000;
while {true} do {
if ({(_x getvariable "Mcolor") == "ColorRed" && {locationposition _x distance vehicle player < _AAdistance}} count AAsM > 0) then {AAclose = true;} else {AAclose = nil;};
sleep 4;
_dis = (["V"] CALL DIS);
_c = count RESERVEZONE - 1;

for "_i" from 0 to _c do {
if (_i >= 0 && {count RESERVEZONE > _i} && {vehicle player distance locationposition (RESERVEZONE select _i) >= _dis}) then {
(RESERVEZONE select _i) call _resFexit;
};
};
sleep 3;
_vZ = nearestLocations [[0,0,0],["Name"], 40];
if (count _vZ > 0) then {
_c = count _vZ - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _vZ select _i;
_xx SPAWN SAOKSHF14;
sleep 0.1;
};
};
_vZ = nearestLocations [getposATL player,["Name"], (["V"] CALL DIS)*2];
if (count _vZ > 0) then {
_c = count _vZ - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _vZ select _i;
if (!isNil{_xx getvariable "VZ"} && {!((_xx getvariable "IDCODE") in ACTIVEZ)} && {_xx getvariable "MColor" != "ColorGrey"}) then {
if ((_xx getvariable "Mtext") == " AA" && {!(_xx in AAsM)}) then {AAsM pushBack _xx;};
_dis = (["V"] CALL DIS); 
if ((_xx getvariable "Mtype") in ["o_air","b_air","n_air","n_plane","o_uav","n_uav","n_uav"] || {["AIR", (_xx getvariable "Mtext")] call SAOKINSTRING}) then {_dis = (["V"] CALL DIS)*2;};
if (vehicle player distance locationposition _xx < _dis) then {
if (_xx CALL _noMax || {_xx in SZONES}) then {
_xx SPAWN _func; VEHZONES = VEHZONES - [_xx]; ACTIVEZ pushBack (_xx getvariable "IDCODE");
if (_xx in RESERVEZONE) then {_xx call _resFexit;};
} else {
if !(_xx in RESERVEZONE) then {
_xx call _resF;
};
};
};
};
sleep 0.01;
};
};
};