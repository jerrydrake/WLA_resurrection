SAOKNEARESTFL = {
private ["_pos","_n"];
_pos = if (typename _this == "ARRAY") then {_this} else {
if (typename _this == "STRING") then {getmarkerpos _this} else {locationposition _this}
};
_n = if (count SAOKFLMs > 0) then {SAOKFLMs call RETURNRANDOM} else {""};
{if (getmarkerpos _x distance _pos < getmarkerpos _n distance _pos) then {_n = _x;};
if (getmarkerpos _n distance _pos < 4000) exitWith {};
} foreach SAOKFLMs;
_n
};

SAOKFLMs = [];
SAOKLINEMAR = {
private ["_mar","_mar2"];
if (surfaceiswater (_this select 0)) exitWith {};
_mar = format ["FrntLM%1",NUMM];
NUMM=NUMM+1;
_mar2 = createMarker [_mar,(_this select 0)];
_mar2 setMarkerShape "RECTANGLE";
_mar2 setMarkerType "SOLID";
_mar2 setMarkerSize [120,90];
_mar2 setMarkerDir (_this select 1);
_mar2 setMarkerColor "ColorIndependent";
_mar2 setMarkerAlpha 0.4;
//_mar2 setMarkerText "";
SAOKFLMs pushBack _mar2;
};

SAOKLINES = {
private ["_factor","_nG","_nC","_ang","_center","_radius","_degrees","_start","_start2","_ma","_camp","_nCr","_gP","_c","_radi","_nGC","_nGg","_nGr"];
if (!isNil"SAOKFLPROG") exitWith {};
_factor = SAOKMAPSIZE / 30000;
SAOKFLPROG = 1;
{deletemarker _x;} foreach SAOKFLMs;
SAOKFLMs = [];
_p = SAOKMAPSIZE*0.5;
_ca = (nearestLocations [[_p,_p,0], ["CampB","CampR"], SAOKMAPSIZE*0.7]);
_c = count _ca - 1;
for "_i" from 0 to _c do {
_camp = (_ca select _i) getvariable "Marker";
if (getmarkercolor _camp == "ColorBlue") then {
_center = getmarkerpos _camp;
_ang = 0;
_radius = 4000*_factor;
// 80 -> 120
_degrees=(atan (120 / _radius))*2;
_start = [(_center select 0)+((sin _ang)*_radius),(_center select 1)+((cos _ang)*_radius),0];
_ma = 360 - _degrees;
while {_ang < _ma} do {
_nC = (["ColorBlue",_start] CALL NEARESTCAMP) getvariable "Marker";
if (isNil"_nC") exitWith {};
if (_nC == _camp) then {
_nG = [_start] CALL RETURNGUARDPOST;
_nGC = getmarkercolor (_nG getvariable "Gmark");
_nGg = [_start,"ColorGreen"] CALL RETURNGUARDPOST;
//_nGC != "ColorGreen" || {_nG distance _start > 2000}
if (!isNil"_nGg" && {_nGg distance _start > (2000*_factor)}) then {
if (_start distance _center > (locationposition (["ColorRed",_start] CALL NEARESTCAMP)) distance _start) then {
_radi = ((_center distance _start) + (_start distance (locationposition (["ColorRed",_start] CALL NEARESTCAMP)))) * 0.5;
_start2 = [(_center select 0)+((sin _ang)*_radi),(_center select 1)+((cos _ang)*_radi),0];
if (!isNil"_nGC" && {_nGC == "ColorRed"} && {_nG distance _center < _nG distance _start2}) then {
_radi = ((_center distance _start2) + (_start2 distance _nG)) * 0.5;
_start2 = [(_center select 0)+((sin _ang)*_radi),(_center select 1)+((cos _ang)*_radi),0];
[_start2,_ang] SPAWN SAOKLINEMAR;
} else {
[_start2,_ang] SPAWN SAOKLINEMAR;
};
} else {
[_start,_ang] SPAWN SAOKLINEMAR;
};
};
};
_ang = _ang + _degrees;
_start = [(_center select 0)+((sin _ang)*_radius),(_center select 1)+((cos _ang)*_radius),0];
//sleep 0.001;
};
};
sleep 0.001;
};
//GuardPosts (_x getvariable "Gmark")

_p = SAOKMAPSIZE * 0.5;
_gpu = (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
_c = count _gpu - 1;
for "_i" from 0 to _c do {
_gP = (_gpu select _i) getvariable "Post";
_center = getposATL _gP;
_ang = 0;
_radius = 2000*_factor;
// 80 -> 120
_degrees= (atan (120 / _radius))*2;
_start = [(_center select 0)+((sin _ang)*_radius),(_center select 1)+((cos _ang)*_radius),0];
_ma = 360 - _degrees;
while {_ang < _ma} do {
_nC = locationposition (["ColorBlue",_start] CALL NEARESTCAMP);
_nCr = locationposition (["ColorRed",_start] CALL NEARESTCAMP);
if (_nC distance _start > (4000*_factor)) then {
_nG = [_start] CALL RETURNGUARDPOST;
_nGg = [_start,"ColorGreen"] CALL RETURNGUARDPOST;
_nGr = [_start,"ColorRed"] CALL RETURNGUARDPOST;
// && {(_nG == _gP || {getmarkercolor (_nG getvariable "Gmark") == "ColorRed"} || {_gP distance _start < _nG distance _start})}
if (_nGg == _gP) then {
if (_nCr distance _start < (4000*_factor)) then {
_radi = ((_center distance _start) + (_start distance _nCr)) * 0.5;
//if (_radi > 2000) then {_radi = (_center distance _nCr) * 0.5;};
_start2 = [(_center select 0)+((sin _ang)*_radi),(_center select 1)+((cos _ang)*_radi),0];
if (_nGr distance _start2 < _gP distance _start2) then {
_radi = ((_center distance _start) + (_start distance _nGr)) * 0.5;
//while {_radi > _center distance _nGr} do {_radi = _radi * 0.8;};
_start2 = [(_center select 0)+((sin _ang)*_radi),(_center select 1)+((cos _ang)*_radi),0];
};
[_start2,_ang] SPAWN SAOKLINEMAR;
} else {
if (_nGr distance _start < (2000*_factor)) then {
//_dirTo = [_gP, _nGr] call SAOKDIRT;
_radi = ((_center distance _start) + (_start distance _nGr)) * 0.5;
_start2 = [(_center select 0)+((sin _ang)*_radi),(_center select 1)+((cos _ang)*_radi),0];
[_start2,_ang] SPAWN SAOKLINEMAR;
} else {
[_start,_ang] SPAWN SAOKLINEMAR;
};
};
};
};
_ang = _ang + _degrees;
_start = [(_center select 0)+((sin _ang)*_radius),(_center select 1)+((cos _ang)*_radius),0];
//sleep 0.001;
};
sleep 0.001;
};
//hint format ["%1",count SAOKFLMs];
SAOKFLPROG = nil;
};

SAOKFLF = {
private ["_abs","_range","_a","_b"];
_range = if (vehicle _a distance _b < 20) then {_abs >= 90 && {_abs <= 270}} else {_abs >= 60 && {_abs <= 240}};
};
