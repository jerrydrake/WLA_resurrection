
private ["_nn","_code"];
if (isNil"FrontLineMarkers") then {FrontLineMarkers = [];};
{deletemarker _x;} foreach FrontLineMarkers;
_nn = 0;

_code = {
private ["_mar23","_dirr","_mul","_nearestRdis","_NUMM","_bongs","_sMp","_fMp","_sM","_fM","_Xpos","_nearestR","_Rpos","_nearestForR","_FMpos","_mar","_mar2","_bList","_marks","_add","_Na","_mare","_NewMarks"];
_NUMM = 0;
_bList = [];
_marks = [];
//&& {markershape (_this select 0) == "ELLIPSE"}
if (getmarkercolor (_this select 0) == (_this select 2)) then {
_bongs = 0;
while {((count _bList) + _bongs) < {getmarkercolor _x == (_this select 3)} count AmbientZonesN} do {
sleep 0.1;
_Xpos = getmarkerpos (_this select 0);
_nearestR = ([(_this select 3),_Xpos,_bList] CALL NEARESTCAMP);
_bList set [count _bList,_nearestR];
_Rpos = getmarkerpos _nearestR;
_nearestForR = ([(_this select 2),_Rpos] CALL NEARESTCAMP);
//if (_nearestForR in _bList) exitWith {};
if (_nearestForR == (_this select 0)) then {
_FMpos = [((_Xpos select 0) + (_Rpos select 0))*0.5,((_Xpos select 1) + (_Rpos select 1))*0.5,0];
_nearestRdis = getmarkerpos ([(_this select 3),_Xpos] CALL NEARESTCAMP) distance _Xpos;
_mul = 0.45;
while {_FMpos distance _Xpos > _nearestRdis} do {
sleep 0.01;
_mul = _mul - 0.005;
_FMpos = [((_Xpos select 0) + (_Rpos select 0))*_mul,((_Xpos select 1) + (_Rpos select 1))*_mul,0];

};
_mar = format ["FrtLiM%1A%2",_NUMM,(_this select 1)];
_NUMM=_NUMM+1;
_mar2 = createMarker [_mar,_FMpos];
_mar2 setMarkerShape "ELLIPSE";
_mar2 setMarkerType "SOLID";
_mar2 setMarkerSize [100,100];
_di= [_Xpos, _Rpos] call SAOKDIRT;
_mar2 setMarkerDir (_di+90);
_mar2 setMarkerColor (_this select 2);
_mar2 setMarkerText "";
FrontLineMarkers set [count FrontLineMarkers,_mar2];
_dirr = [_Xpos, _FMpos] call SAOKDIRT;


_marks = [_marks,_mar2] CALL {
private ["_marks","_mar2","_NewMarks","_add"];
_marks = _this select 0;
_mar2 = _this select 1;
_NewMarks = [];
_add = 0;  
{
if (_add == 0 && _dirr < (_x select 1)) then {_add = 1;_NewMarks set [count _NewMarks,[_mar2, _dirr]];};
_NewMarks set [count _NewMarks,_x];
} foreach _marks;
if (_add == 0) then {_marks = + _NewMarks; _marks set [count _marks,[_mar2, _dirr]];} else {_marks = + _NewMarks;};
_marks
};
/*
_NewMarks = [];
_add = 0;
{
if (_add == 0 && _dirr < (_x select 1)) then {_add = 1;_NewMarks set [count _NewMarks,[_mar2, _dirr]];};
_NewMarks set [count _NewMarks,_x];
} foreach _marks;
if (_add == 0) then {_marks = + _NewMarks; _marks set [count _marks,[_mar2, _dirr]];} else {_marks = + _NewMarks;};
*/
} else {_bongs = _bongs + 1;};

};
_Na = [];
{_Na set [count _Na,_x select 0];} foreach _marks;
sleep 0.01;
_marks = + _Na;
if (count _marks == 1) then {
(_marks select 0) setMarkerShape "RECTANGLE";
(_marks select 0) setMarkerType "SOLID";
(_marks select 0) setMarkerSize [100,900];
};
while {count _marks > 1} do {
sleep 0.01;
_fM = _marks select 0;
_sM = _marks select 1;
_fMp = getmarkerpos _fM;
_sMp = getmarkerpos _sM;
_FMpos = [((_fMp select 0) + (_sMp select 0))*0.5,((_fMp select 1) + (_sMp select 1))*0.5,0];
_mare = format ["FrtLiMM%1B%2",_NUMM,(_this select 1)];
_NUMM=_NUMM+1;
_mar23 = createMarker [_mare,_FMpos];
_mar23 setMarkerShape "RECTANGLE";
_mar23 setMarkerType "SOLID";
_mar23 setMarkerSize [100,((_fMp distance _sMp)*0.5)];
_di= [_fMp, _sMp] call SAOKDIRT;
_mar23 setMarkerDir (_di);
_mar23 setMarkerColor (_this select 2);
_mar23 setMarkerText "";
FrontLineMarkers set [count FrontLineMarkers,_mar23];
_marks = _marks - [_fM];
};

};
};

{
_nn = _nn + 1;
[_x,_nn,"ColorBlue","ColorRed"] SPAWN _code;
_nn = _nn + 1;
[_x,_nn,"ColorRed","ColorBlue"] SPAWN _code;
} foreach AmbientZonesN;