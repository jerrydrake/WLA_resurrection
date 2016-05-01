private ["_player","_hitwhere","_damage","_source"];
_damage = 0;
if (isNil{missionnamespace getvariable "SaOkHealed"}) then {
_player = _this select 0;
_damage = _this select 1;
//_source = _this select 3;
_n = 0;
_vP = vehicle player;
//["BIS_fnc_setObjectVar_object1","<NULL-object>"]
// && {_source != (vehicle player)}
if (alive _vP && {_vP != player} && {typeof _vP isKindOf "Air"} && {((getposATL _vP) select 2) > 2} && {_source != _vP}) then {
_damage = damage player + 0.1;
if (_damage >= 0.9) then {
_damage = damage player; 
};
} else {
if (!(typeof (vehicle player) isKindOf "Tank") && {!(typeof (vehicle player) isKindOf "LandVehicle")}) then {
if (_damage * PLSTREGHT < 0.01) then {_damage = damage player + 0.01;} else {_damage = damage player + (_damage * PLSTREGHT);};
if (_damage >= 0.9) then {
_n = 2;
_damage = 0; 
if (isNil{missionnamespace getvariable "SaOkHealed"}) then {[] SPAWN FPlayerDamage;};
if (rating player < 0) then {
player addrating ((abs (rating player))+2500); 
(group player) selectLeader player;
};
};
} else {
_damage = damage player;
};
};
};
if (_damage >= 0.9) then {
_damage = damage player; 
};
_damage