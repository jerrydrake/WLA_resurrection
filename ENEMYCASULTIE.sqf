private ["_c","_mNs","_uhri","_nearest","_str","_villages"];
_uhri = _this select 0;
[getposATL _uhri,"KIA","ColorRed"] SPAWN SAOKCREATEMARKER;
if (random 1 < 0.2) then {
_nearest = _uhri CALL SAOKNEARESTVIL; 
_str = "A"; 
_mNs = [_nearest,_str] CALL SAOKVILRET;
if (isNil{_mNs}) then {
[_nearest,_str,"Friendly"] CALL SAOKVILSET;
} else {
if (_mNs == "Neutral") then {
[_nearest,_str,"Friendly"] CALL SAOKVILSET;
};
if (_mNs == "Angry") then {
[_nearest,_str,"Neutral"] CALL SAOKVILSET;
};
if (_mNs == "Hostile") then {
[_nearest,_str,"Angry"] CALL SAOKVILSET;
};
};
/*
//SOME VILLAGES MAY HEARD OF IT
_villages = [_nearest];
_nearest = [_uhri,[_nearest]] CALL SAOKNEARESTVIL; 
_villages pushBack _nearest;
_c = count _villages - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _villages select _i;
if (random 1 < 0.5) then {
_str = (_xx + "A"); 
_mNs = _str CALL SAOKVILRET;
if (isNil{_mNs}) then {
[_str,"Friendly"] CALL SAOKVILSET;
} else {
if (_mNs == "Neutral") then {
[_str,"Friendly"] CALL SAOKVILSET;
};
if (_mNs == "Angry") then {
[_str,"Neutral"] CALL SAOKVILSET;
};
if (_mNs == "Hostile") then {
[_str,"Angry"] CALL SAOKVILSET;
};
};
};
sleep 0.1;
};
*/
};
