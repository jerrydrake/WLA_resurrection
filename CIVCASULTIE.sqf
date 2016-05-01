private ["_c","_mNs","_uhri","_killer","_nearest","_str","_villages","_nul"];
_uhri = _this select 0;
_killer = _this select 1;
[getposATL _uhri,"KIA","ColorCiv"] SPAWN SAOKCREATEMARKER;
if (isNil"_killer") exitWith {};
if (group _killer == group player) then {
//if (isNil{_killer getvariable "CKills"}) then {_killer setvariable ["CKills",1];} else {_killer setvariable ["CKills",(_killer getvariable "CKills")+1];};
};
if (side _killer == WEST) then {
if (isPlayer _killer) then {
pisteet = pisteet - 100;
_nul = [-100, "Civilian Casultie"] SPAWN PRESTIGECHANGE;
PERSIANPRESTIGE = PERSIANPRESTIGE + (1000*DIFLEVEL);
};
_nearest = (_uhri CALL SAOKNEARESTVIL); 
_Lna = name _nearest;
_header = format ["Rumors Spreading of NATO Killing Civilians in %1. Locals Demand Justice",_Lna];
[_header, date] CALL SAOKEVENTLOG;
[] SPAWN SAOKLOWERRELVIL;
//SOME VILLAGES MAY HEARD OF IT
_villages = [_nearest];
//_nearest = [_uhri,[_nearest]] CALL SAOKNEARESTVIL; 
//_villages pushBack _nearest;
_c = count _villages - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _villages select _i;
if (random 1 < 0.5) then {
_str = "A"; 
_mNs = [_xx,_str] CALL SAOKVILRET;
if (isNil{_mNs}) then {
[_xx,_str,"Angry"] CALL SAOKVILSET;
} else {
if (_mNs == "Angry") then {
[_xx,_str,"Hostile"] CALL SAOKVILSET;
} else {
if (_mNs != "Hostile") then {
[_xx,_str,"Angry"] CALL SAOKVILSET;
};
};
};
};
sleep 0.1;
};
};