private ["_bolFF","_orgT","_orgW","_dirL","_Sdir","_d","_NRun","_runW","_funcRun","_funcH","_start","_end","_objectType","_dir","_dirO","_obj","_objs","_bBox","_p1","_p2","_maxWidth","_maxLength","_maxHeight","_hh","_hos","_lastPos","_hole","_tt","_total","_h","_totalL","_id","_datAr","_alN","_nSd","_wTm"];

//0 runway 1 pos
_funcRun = {

private ["_bol"];
_bol = false;
if (([_this select 0, _this select 1] call BIS_fnc_inTrigger)) then {_bol = true;};
_bol
};

_funcH = {
private ["_bBox","_p1","_p2","_maxWidth","_maxLength","_max","_bol"];
_bBox = boundingBoxReal (_this select 0);
_p1 = _bBox select 0;
_p2 = _bBox select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_max = if (_maxWidth > _maxLength) then {_maxWidth} else {_maxLength};
_bol = false;
if ((_this select 1) distance (_this select 0) < _max) then {_bol = true;};
_bol 
};

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

_bolFF = if (count _this > 5) then {false} else {true};
_datAr = [];
_start = _this select 0;
_end = _this select 1;
_objectType = _this select 2;
_alN = if (count _this > 4) then {_this select 4} else {0};
_d = 0;
if (_objectType in ["Land_HBarrierWall4_F","Land_HBarrierWall6_F"]) then {_d = 180;};
_runW = [_start, (_start distance _end)] CALL _NRun;
_hole = if (count _this > 3) then {_this select 3} else {0};
_dir = ([_start, _end] call SAOKDIRT);
_dirE = _dir + 180;
while {_dirE > 360} do {_dirE = _dirE - 360;};
_dirO = _dir + 90 + _d;
_objs = [];
_lastPos = [];
if !([_runW, _start] call _funcRun) then {
_obj = createVehicle [_objectType,_start, [], 0, "CAN_COLLIDE"]; 
_obj setdir _dirO;
_hh = (boundingCenter _obj) select 2;
_bBox = boundingBoxReal _obj;
_p1 = _bBox select 0;
_p2 = _bBox select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
_start = [(_start select 0)+((sin _dir)*_maxWidth*0.5),(_start select 1)+((cos _dir)*_maxWidth*0.5),_hh];
_obj setPosWorld (atltoasl _start);
_start = [(_start select 0)+((sin _dir)*_maxWidth),(_start select 1)+((cos _dir)*_maxWidth),_hh];
_objs pushBack _obj;
_h = (_start distance _end) * 0.5;
_Sdir = 0;
_tt = 0;
_total = 0;
_totalL = _start distance _end;
_orgW = _maxWidth;
_orgT = _objectType;
_mmm = 3;
while {_totalL >= _total && {_tt < 450}} do {
_mmm = _mmm + 1;
if (_objectType == "Land_Mil_WiredFenceD_F") then {_objectType = _this select 2;_hh = _objectType call SAOKBHEI;};
if (_objectType == "Land_Mil_WiredFence_F" && {_totalL > 100} && {random 1 < 0.05}) then {_objectType = "Land_Mil_WiredFenceD_F";_hh = _objectType call SAOKBHEI;};
_tt = _tt + 1;
_total = _total + _maxWidth;
if ((_hole == 0 || {_h < (_start distance _end)}) && {!isOnRoad _start} && {!([_runW, _start] call _funcRun)}) then {
_hos = _start nearObjects ["House",20];
if (count _hos == 0) then {
_id = "N"+(format["%1",count _datAr + _alN]);
_ddd = (_dirO+_Sdir);
if (_objectType in ["Land_BagBunker_Small_F"]) then {_ddd = _ddd +_d;};
_start set [2,_hh];
_datAr append [[_objectType,(atltoasl _start), _ddd, (surfaceNormal (atltoasl _start)),_id]];
} else {
if ({[_x,_start] CALL _funcH} count _hos == 0 && {_objectType != "Land_BagBunker_Small_F"}) then {
_obj = createVehicle [_objectType,_start, [], 0, "CAN_COLLIDE"]; 
_hh = (boundingCenter _obj) select 2;
_ddd = (_dirO+_Sdir);
if (_objectType in ["Land_BagBunker_Small_F"]) then {_ddd = _ddd +_d;};
_obj setdir _ddd;
_start set [2,(boundingCenter _obj) select 2];
_obj setPosWorld (atltoasl _start);
_objs pushBack _obj;
};
};
_lastPos = [(_start select 0)+((sin (_dir+_Sdir))*_maxWidth*0.5),(_start select 1)+((cos (_dir+_Sdir))*_maxWidth*0.5),_hh];
} else {_hole = 0;_objectType = _orgT;_maxWidth = _orgW; _hh = _objectType call SAOKBHEI;};
_dirL = (_Sdir+_dir);
_nSd = 30 - random 60;
while {70 < (_Sdir + _nSd) || {-70 > (_Sdir + _nSd)}} do {_nSd = 30 - random 60;};
if (random 1 < 0.9) then {_Sdir = (_Sdir + _nSd);};
if (random 1 < 0.3 && {_mmm > 3} && {_bolFF}) then {_mmm = 0;_objectType = "Land_BagBunker_Small_F"; _maxWidth = _objectType CALL SAOKBSIZE; _hh = _objectType call SAOKBHEI;} else {
if (_objectType != "Land_BagBunker_Small_F") then {_maxWidth = _orgW;};
_objectType = _orgT; _hh = _objectType call SAOKBHEI;
};
_start = [(_start select 0)+((sin _dirL)*_maxWidth*0.5)+((sin (_Sdir+_dir))*_maxWidth*0.5),(_start select 1)+((cos _dirL)*_maxWidth*0.5)+((cos (_Sdir+_dir))*_maxWidth*0.5),_hh];
};
};

[_objs,_lastPos,_datAr]