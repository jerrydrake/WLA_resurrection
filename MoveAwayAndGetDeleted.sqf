private ["_dd","_group", "_xx", "_yy", "_end"];
_group = _this select 0;
_dd = (["Lc"] CALL DIS);
_end = [(vehicle player),_dd*1.5,_dd,"(1 - sea)"] CALL SAOKSEEKPOS;
while  {surfaceIsWater _end} do {
_end = [(vehicle player),_dd*1.5,_dd,"(1 - sea)"] CALL SAOKSEEKPOS;
sleep 5;
};
_group move _end;
_group setspeedmode "FULL";
waituntil {sleep 20; {(vehicle player) distance _x < 300} count units _group == 0};
{_x spawn SAOKDELETE;} foreach units _group;