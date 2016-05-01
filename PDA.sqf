private ["_tV","_vP","_player","_hitwhere","_damage","_source","_pic","_text","_n"];
_damage = 0;
LastHit = nil;
if (isNil{missionnamespace getvariable "SaOkHealed"}) then {
_player = _this select 0;
_hitwhere = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_n = 0;
_vP = vehicle player;
_tV = typeof _vP;
if (_vP != player && {alive _vP} && {((_tV isKindOf "Air" && {((getposATL _vP) select 2) > 2} && {_source != _vP}) || {{_tV isKindOf _x} count ["Tank","LandVehicle"] > 0})}) then {
_damage = damage player + 0.1;
if (_damage >= 0.9) then {
_damage = damage player; 
}; 
} else {
//["BIS_fnc_setObjectVar_object1","<NULL-object>"]
if ((str _source) in ["BIS_fnc_setObjectVar_object1","<NULL-object>"]) then {
_damage = damage player + 0.1;
[] SPAWN BIS_fnc_damagePulsing;
[(3+random 10)] SPAWN BIS_fnc_bloodEffect;
[player,_damage] SPAWN BIS_fnc_dirtEffect;
if (_damage >= 0.9) then {
_damage = damage player; 
};
} else {
_n = 1;
if (_damage * PLSTREGHT < 0.01) then {_damage = damage player + 0.01;} else {_damage = damage player + (_damage * PLSTREGHT);};
if (_damage >= 0.9) then {
_n = 2;
_damage = 0; 
//if (isNil{missionnamespace getvariable "SaOkHealed"}) then {[] SPAWN FPlayerDamage;};
_pic = "";
if (typeof _source isKindof "Man") then {
_pic = format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "o_inf" >> "icon"))];
};
if (typeof _source isKindof "Man" || {typeof _source isKindof "Car"}) then {
_text = getText (configfile >> "CfgVehicles" >> typeof _source >> "displayName");
if (!(typeof _source isKindof "Man") && {!(getText(configfile >> "CfgVehicles" >> typeof _source >> "picture") in ["","pictureThing","pictureStaticObject"])}) then {
_pic = format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> typeof _source >> "picture"))];
if (DIFLEVEL < 2 && {count crew _source > 0} && {side ((crew _source) select 0) == EAST}) then {missionnamespace setvariable ["VehKill",1];};
} else {_text = _text + " (" + (name _source)+")";};
if (isNil{missionnamespace getvariable "SaOkHealed"}) then {[("You were killed by " + _pic + " "+ _text)] SPAWN FPlayerDamage;};
} else {
if (isNil{missionnamespace getvariable "SaOkHealed"}) then {[""] SPAWN FPlayerDamage;};
};
if (rating player < 0) then {
player addrating ((abs (rating player))+2500); 
(group player) selectLeader player;
};
};
};
};
};
if (_damage >= 0.9) then {
_damage = damage player; 
};
_damage