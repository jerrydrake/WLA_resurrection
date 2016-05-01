
private ["_unit", "_g", "_nul"];
//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
sleep (random 39);
_unit = _this select 0;
if (alive _unit) then {
_g = creategroup EAST;	
[_unit] join _g;
_unit setcaptive true;
_unit stop true;
_unit setunitpos "UP";
removeAllWeapons _unit;	
//{_unit action ["dropWeapon", _unit, _x];} foreach Weapons _unit; 
//{_unit action ["dropMagazine", _unit, _x];} foreach Magazines _unit; 
sleep 1;
};
if (alive _unit) then {
_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
};
if (alive _unit) then {_nul = [_unit] SPAWN FUNKTIO_POISTANTAUTUNUT;};
