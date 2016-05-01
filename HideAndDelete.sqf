private ["_unit","_group","_st2","_start2"];
_unit = _this select 0;
_unit allowdamage false; 
_unit enableAI "AUTOTARGET"; 
_unit enableAI "TARGET";
_unit enableAI "MOVE";
if (count _this == 1) then {
_group = creategroup west;
[_unit] join _group;
};
_unit setunitpos "AUTO";
_unit setbehaviour "AWARE";
_start2 = [_unit, 600,0,"(1 + forest) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
group _unit move _start2;
waituntil {sleep 10;player distance _unit > 800};
deletevehicle _unit;