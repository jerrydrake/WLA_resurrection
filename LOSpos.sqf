private ["_a","_b","_dirTo","_eyeD","_eyePb","_eyePa","_eyeDV","_abs","_boolean","_range"];

//who to see or not
_a = _this select 0;
if (count _a < 3) then {
_a pushback 0;
_a = ATLTOASL _a;
};
//AI to see or not
_b = _this select 1;
//if (isNil"_a" || {isNil"_b"}) exitWith {false};
_boolean = false;
if (!isNil"_a" && {!isNil"_b"}) then {
_eyeDV = eyeDirection _b;
_eyeD = ((_eyeDV select 0) atan2 (_eyeDV select 1));
if (_eyeD < 0) then {_eyeD = 360 + _eyeD};
_dirTo = [_b, _a] call SAOKDIRT;
_eyePb = eyePos _b;
_eyePa = [_a select 0, _a select 1,(_a select 2)+1];
_abs = abs(_dirTo - _eyeD); 
_range = if (_a distance _b < 20) then {_abs >= 90 && {_abs <= 270}} else {_abs >= 60 && {_abs <= 240}};
if (_range || {(lineIntersects [_eyePb, _eyePa])} || {(terrainIntersectASL [_eyePb, _eyePa])}) then {
//hintsilent "NOT IN SIGHT";
_boolean = false;
} else {
_boolean = true;
};
};
_boolean
