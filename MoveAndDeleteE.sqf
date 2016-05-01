//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

private ["_group", "_pos", "_tim"];

_group = _this select 0;
_pos = _this select 1;
_tim =  _this select 2;
sleep _tim;
//thanks kju for example
if (!isNull _group) then {
_n = _group SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 1; scriptdone _n};
_group addWaypoint [_pos, 0];
};
waituntil {sleep 3; isNil"_group" || {(leader _group) distance _pos < 400}};
if (!isNil"_group") then {
{_x spawn SAOKDELETE;} foreach [vehicle (leader _group)] + (units _group);
};