private ["_posS","_posE","_type","_dir","_dirO","_obj","_dissS","_tot","_diss","_start","_lenght","_GPos","_st"];
_posS = _this select 1;
_posE = _this select 0;
_type = _this select 2;
_obj = createVehicle [_type,_posS, [], 0, "CAN_COLLIDE"]; 
_dir = [_obj, _posE] call SAOKDIRT;
_dirO = _dir + 90;
_obj setdir _dirO;
if (!isNull _obj) then {_obj setvariable ["EndP",_posE];};
LWalls pushBack _obj;
ALLWalls pushBack _obj;
if (count _this > 3) then { 
_diss = _this select 3;
_start = _posS;
_tot = _diss;
_lenght = _posS distance _posE;
_dissS = _diss * 0.1;
while {_tot < _lenght} do {
_tot = _tot + _diss;
_start = [(_start select 0)+((sin _dir)*_diss),(_start select 1)+((cos _dir)*_diss),0];
if (([_start] CALL RETURNGUARDPOST) distance _start > 600 && {((surfaceNormal _start) select 2 > 0.99)}) then {
_GPos = [(_start select 0)+((sin _dirO)*60),(_start select 1)+((cos _dirO)*60),0]; 
_start = [_GPos,50,0,"(1 - sea)* (1 + meadow)* (1 - hills)"] CALL SAOKSEEKPOS;
_start SPAWN SAOKSHF1;
} else {_tot = _tot + _dissS;};
};

};