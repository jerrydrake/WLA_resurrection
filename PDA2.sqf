private ["_player","_hitwhere","_damage","_source"];
_player = _this select 0;
_hitwhere = _this select 1;
_damage = _this select 2;
_source = _this select 3;
//hint format ["%1",_source];
if (!isNil{_source getvariable "Tobj"}) then {
[] SPAWN BIS_fnc_damagePulsing;
[(3+random 10)] SPAWN BIS_fnc_bloodEffect;
[player,_damage] SPAWN BIS_fnc_dirtEffect;
//hint format ["%1",_source];
_damage = 0.1;
if ((damage player + _damage) >= 0.9) then {
_damage = 0; 
};
};
_damage