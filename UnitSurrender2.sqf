//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

_unit = _this select 0;
if (alive _unit) then {_unit setcaptive true;
_unit stop true;
_unit setunitpos "UP";
removeAllWeapons _unit;	
sleep 1;};
if (alive _unit) then {
_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
};
