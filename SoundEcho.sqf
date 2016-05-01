private ["_voice","_unit","_upos","_num","_p1","_p2","_p3","_return"];
_unit = _this select 0;
_voice = _this select 1;
_upos = eyePos _unit;
//CHECK IF FAR
_num = 0;
_return = _voice;
if (vehicle _unit == _unit) then {
_p1 = [(_upos select 0),(_upos select 1),(_upos select 2) + 0.5];
_p2 = [(_upos select 0),(_upos select 1),(_upos select 2) + 6];
_p3 = [(_upos select 0),(_upos select 1),(_upos select 2) + 40];
if (!(lineIntersects [atltoasl _p1,atltoasl _p2,_unit]) && (lineIntersects [atltoasl _p1,atltoasl _p3,_unit])) then {_num = _num + 1;};
_p1 = [(_upos select 0) + 1,(_upos select 1),(_upos select 2) + 0.5];
_p2 = [(_upos select 0) + 13,(_upos select 1),(_upos select 2) + 0.5];
_p3 = [(_upos select 0) + 40,(_upos select 1),(_upos select 2) + 0.5];
if (!(lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) && (lineIntersects [atltoasl _p1,atltoasl  _p3,_unit])) then {_num = _num + 1;};
_p1 = [(_upos select 0) - 1,(_upos select 1),(_upos select 2) + 0.5];
_p2 = [(_upos select 0) - 13,(_upos select 1),(_upos select 2) + 0.5];
_p3 = [(_upos select 0) - 40,(_upos select 1),(_upos select 2) + 0.5];
if (!(lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) && (lineIntersects [atltoasl _p1,atltoasl  _p3,_unit])) then {_num = _num + 1;};
_p1 = [(_upos select 0) + 1,(_upos select 1) + 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0) + 13,(_upos select 1) + 13,(_upos select 2) + 0.5];
_p3 = [(_upos select 0) + 40,(_upos select 1) + 40,(_upos select 2) + 0.5];
if (!(lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) && (lineIntersects [atltoasl _p1,atltoasl  _p3,_unit])) then {_num = _num + 1;};
_p1 = [(_upos select 0) - 1,(_upos select 1) + 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0) - 13,(_upos select 1) + 13,(_upos select 2) + 0.5];
_p3 = [(_upos select 0) - 40,(_upos select 1) + 40,(_upos select 2) + 0.5];
if (!(lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) && (lineIntersects [atltoasl _p1,atltoasl  _p3,_unit])) then {_num = _num + 1;};
_p1 = [(_upos select 0) + 1,(_upos select 1) - 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0) + 13,(_upos select 1) - 13,(_upos select 2) + 0.5];
_p3 = [(_upos select 0) + 40,(_upos select 1) - 40,(_upos select 2) + 0.5];
if (!(lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) && (lineIntersects [atltoasl _p1,atltoasl  _p3,_unit])) then {_num = _num + 1;};
_p1 = [(_upos select 0) - 1,(_upos select 1) - 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0) - 13,(_upos select 1) - 13,(_upos select 2) + 0.5];
_p3 = [(_upos select 0) - 40,(_upos select 1) - 40,(_upos select 2) + 0.5];
if (!(lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) && (lineIntersects [atltoasl _p1,atltoasl  _p3,_unit])) then {_num = _num + 1;};
_p1 = [(_upos select 0),(_upos select 1) + 1,(_upos select 2) +0.5];
_p2 = [(_upos select 0),(_upos select 1) + 13,(_upos select 2) + 0.5];
_p3 = [(_upos select 0),(_upos select 1) + 40,(_upos select 2) + 0.5];
if (!(lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) && (lineIntersects [_p1, _p3,_unit])) then {_num = _num + 1;};
_p1 = [(_upos select 0),(_upos select 1) - 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0),(_upos select 1) - 13,(_upos select 2) + 0.5];
_p3 = [(_upos select 0),(_upos select 1) - 40,(_upos select 2) + 0.5];
if (!(lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) && (lineIntersects [_p1, _p3,_unit])) then {_num = _num + 1;};
//hint format ["Kaukausia %1",_num];
//CHECK IF CLOSE
if (_num < 2) then {
_p1 = [(_upos select 0),(_upos select 1),(_upos select 2) + 0.5];
_p2 = [(_upos select 0),(_upos select 1),(_upos select 2) + 13];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
_p1 = [(_upos select 0) + 1,(_upos select 1),(_upos select 2) + 0.5];
_p2 = [(_upos select 0) + 13,(_upos select 1),(_upos select 2) + 0.5];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
_p1 = [(_upos select 0) - 1,(_upos select 1),(_upos select 2) + 0.5];
_p2 = [(_upos select 0) - 13,(_upos select 1),(_upos select 2) + 0.5];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
_p1 = [(_upos select 0) + 1,(_upos select 1) + 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0) + 13,(_upos select 1) + 13,(_upos select 2) + 0.5];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
_p1 = [(_upos select 0) - 1,(_upos select 1) + 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0) - 13,(_upos select 1) + 13,(_upos select 2) + 0.5];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
_p1 = [(_upos select 0) + 1,(_upos select 1) - 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0) + 13,(_upos select 1) - 13,(_upos select 2) + 0.5];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
_p1 = [(_upos select 0) - 1,(_upos select 1) - 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0) - 13,(_upos select 1) - 13,(_upos select 2) + 0.5];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
_p1 = [(_upos select 0),(_upos select 1) + 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0),(_upos select 1) + 13,(_upos select 2) + 0.5];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
_p1 = [(_upos select 0),(_upos select 1) - 1,(_upos select 2) + 0.5];
_p2 = [(_upos select 0),(_upos select 1) - 13,(_upos select 2) + 0.5];

if (lineIntersects [atltoasl _p1,atltoasl  _p2,_unit]) then {_num = _num + 1;};
//hint format ["Laheisia %1",_num];
if (_num > 2) then {_return = _voice + "C";};
} else {_return = _voice + "E";};
} else {_return = _voice + "C";};
_return