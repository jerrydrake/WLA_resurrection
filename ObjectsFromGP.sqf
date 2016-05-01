_nP = [getposATL player] CALL NEARESTGUARDPOST;
_data = _nP getvariable "StaticO";
{
_dat = + _x;
_p = + (_x select 1);
_p set [2,0];
hint str (_nP worldToModel _p);
_di = (_nP worldToModel _p);
//_di = ((_di select 0)^2 + (_di select 1)^2)^0.5;
//_ang = ([_p,_np] call SAOKDIRT)+(direction _nP);
//if (_ang > 360) then {_ang = _ang - 360;};
_dir = (_x select 2) + direction _nP;
if (_dir > 360) then {_dir = _dir - 360;};
_dat set [2, _dir];
_dat set [1, _di];
_dat resize 3;
_data set [_foreachIndex,_dat];
} foreach _data;
//_post setvariable ["StaticO",_earlier + [[_class,getposATL _veh, direction _veh, (surfaceNormal (getposATL _veh)),_id]]];
copyToClipboard format["%1",_data];

