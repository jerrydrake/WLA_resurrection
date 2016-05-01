//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

private ["_tim","_veh"];
_veh = _this select 0;
_tim =  _this select 1;
sleep _tim;
if (typename _veh != "ARRAY") then {
waituntil {sleep 3; isNull _veh || {player distance _veh > 700}};
deletevehicle _veh;
} else {
waituntil {sleep 3; isNull  (_veh select 0) || {player distance (_veh select 0) > 700}};
{_x spawn SAOKDELETE;} foreach _veh;
};