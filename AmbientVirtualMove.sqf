private ["_move","_c","_zone","_whereTo"];
fuelFVir = {
private ["_deAT","_ddat2","_nnd","_f","_n"];
_deAT = [];
_ddat2 = _this call SAOKZONEDRNEW;
{
_nnd = _x;
if (typename _nnd == "ARRAY" && {count _nnd > 2}) then {
_f = (_nnd select 2) - (0.01);
if (_f < 0) then {_f = 0;};
_nnd set [2,_f];
};
_deAT pushback _nnd;
} foreach _ddat2;
if (count _deAT < 1) then {_this CALL SAOKZONED;_n = _this CALL SAOKZONEM; missionnamespace setvariable [(_this getvariable "IDCODE"),nil];_this call resFexit;deleteLocation _this;} else {[_this,_deAT] CALL SAOKZONED;};
};

_move = {
private ["_c","_wpPP","_whereTo","_start","_dist","_time","_fuel","_zone","_speed","_Dx","_Dy","_perSx","_perSy","_tt"];
_c = locationposition _this;
_zone = _this;
_type = _this getvariable "Mtype";
_wpPP = _zone CALL SAOKZONEMW;
if (count _wpPP == 0 || {(_zone getvariable "Mcolor") == "ColorGrey"}) exitWith {ZONETOMOVE = ZONETOMOVE - [_zone];MOVINGJO = MOVINGJO - [_zone];};
if ({_x < 0} count (_wpPP select 0) > 0 || {(_wpPP select 0) distance [0,0,0] < 240}) exitWith {
_wpPP deleteAT 0;
_zone setvariable ["ZONEMS",_wpPP];
MOVINGJO = MOVINGJO - [_zone];
};
if ((_zone getvariable "IDCODE") in ACTIVEZ) exitWith {MOVINGJO = MOVINGJO - [_zone];};
_m = [];
if ((_zone getvariable "Mcolor")  != "ColorRed") then {
{
NUMM=NUMM+1;
_marS = format ["SELZ%2Wmar%1",NUMM,_zone];
_mar5 = [_marS,_x,"waypoint",[0.6,0.6],"ColorBlue",""] CALL FUNKTIO_CREATEMARKER;
_m pushback _mar5;
} foreach _wpPP;
};
_speed = 25;
if (_type in ["o_air","b_air","n_air"]) then {_speed = 90;};
if (_type in ["o_uav","n_uav","n_uav"]) then {_speed = 105;};
if (_type in ["b_plane","o_plane","n_plane"]) then {_speed = 125;};
if ((_zone getvariable "Mtext") == " AIR") then {_speed = 85;};
_whereTo = _wpPP select 0;
_start = locationposition _zone;
_dist = _start distance _whereTo;
_time = _dist / _speed; 
_Dx = ((_start select 0) - (_whereTo select 0));
_Dy = ((_start select 1) - (_whereTo select 1));
_c = locationposition _zone;
_fuel = 0;
if (_whereTo distance [0,0,0] > 50 && {!isNil"_time"} && {_time > 0}) then {
_perSx = _Dx / _time * 0.1;
_perSy = _Dy / _time * 0.1;
while {_time > 0 && {isNil{_zone getvariable "ACTIVE"}} && {count (_zone CALL SAOKZONEMW) > 0}} do {
_c = locationposition _zone;
_zone setposition [(_c select 0)- _perSx,(_c select 1)- _perSy,0];
sleep 0.1;
_time = _time - 0.1;
_fuel = _fuel + 0.1;
if (_fuel > 17) then {_zone call fuelFVir;_fuel = 0;};
};
} else {
_w = if (!isNil{_zone getvariable "ZONEMS"}) then {_zone getvariable "ZONEMS"} else {[]};
_w deleteAt 0;
_zone setvariable ["ZONEMS",_w];
};
sleep 0.1;
_tt = 1;
_w = if (!isNil{_zone getvariable "ZONEMS"}) then {_zone getvariable "ZONEMS"} else {[]};
{if (_x distance locationposition _zone < 10) exitWith {_w deleteAT _foreachIndex;_zone setvariable ["ZONEMS",_w];};} foreach _w;
MOVINGJO = MOVINGJO - [_zone];
{deletemarker _x;} foreach _m;
};
MOVINGJO = [];
while {true} do {
{if (isNull _x) exitWith {MOVINGJO deleteAT _foreachindex;};} foreach MOVINGJO;
{
if (isNull _x) exitWith {ZONETOMOVE deleteat _foreachIndex;};
if (!(_x in MOVINGJO) && {!((_x getvariable "IDCODE") in ACTIVEZ)}) then {MOVINGJO pushback _x;_x spawn _move;};
sleep 0.01;
} foreach ZONETOMOVE;
sleep 0.5;
};