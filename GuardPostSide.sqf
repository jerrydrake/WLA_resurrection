private ["_pos","_side","_dis","_marker"];
_pos = _this select 0;
_side = _this select 1;
_dis = if (count _this > 2) then {_this select 2} else {400};
{
_post = (_x getvariable "Post");
_marker = (_post getvariable "Gmark");
if (markertext _marker == "") then {
if ((_side == "EAST" && {getmarkercolor _marker == "ColorGreen"}) || {(_side != "EAST" && {getmarkercolor _marker == "ColorRed"})}) then {
if (_side == "EAST") then {
_typ = "o_installation";
_marker setmarkercolor "ColorRed";
[_x,"ColorRed"] CALL POSTSETSIDE;
if (!isNil{_post getvariable "supplyDepot"}) then {_typ = "o_service";};
_marker setMarkerType _typ;
if (_post in activatedPost) then {_post CALL SAOKCONSCHANGESIDE;};
_marker setMarkerSize [0,0];
if (!isNil{_post getvariable "PowCells"}) then {
_ar = (_post getvariable "PowCells");
{_ar set [_foreachIndex,[_post select 0,""]];} foreach _ar;
_post setvariable ["PowCells",_ar];
};
} else  {
_typ = "n_installation";
if (!isNil{_post getvariable "supplyDepot"}) then {_typ = "n_service";};
_marker setMarkerType _typ;
_marker setmarkercolor "ColorGreen";
[_x,"ColorGreen"] CALL POSTSETSIDE;
if (_post in activatedPost) then {_post CALL SAOKCONSCHANGESIDE;};
};
};
};
} foreach(nearestLocations [_pos, ["PostG","PostR"],_dis]);
[] SPAWN SAOKLINES;