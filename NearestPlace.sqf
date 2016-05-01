private ["_places","_picked"];
_places = ["AirC","AirC_1","AirC_2","AirC_3","AirC_4"];
_picked = (_places select 0);
_nC = [] CALL NEARESTCAMP;
{if ((getmarkerpos _picked) distance vehicle player > (getmarkerpos _x) distance vehicle player) then {_picked = _x;};} foreach ["AirC","AirC_1","AirC_2","AirC_3","AirC_4"];
_v = (player CALL SAOKNEARESTVIL);
if ((getmarkerpos _picked) distance vehicle player > (locationposition _v) distance vehicle player) then {_picked = _v;};

if (typename _picked == "STRING") then {
if ((getmarkerpos _picked) distance vehicle player > (locationposition _nC) distance vehicle player) then {_picked = _nC;};
} else {
if ((locationposition _picked) distance vehicle player > (locationposition _nC) distance vehicle player) then {_picked = _nC;};
};
if (typename _this == "STRING") then {
if (typename _picked == "STRING") then {_picked = getmarkerpos _picked;} else {_picked = locationposition _picked;};
};
_picked