private ["_group", "_color", "_mar", "_marker", "_text","_type"];
_group = _this select 0;
if (!isNil"_group") then {
_color = _this select 1;
_text = _this select 2;
_type = if (count _this > 3) then {_this select 3} else {"mil_dot"};
_mar = format ["LINEmar%1",NUMM];
NUMM=NUMM+1;
_marker = createMarker [_mar,getposATL leader _group];
_marker setMarkerShape "ICON";
_marker setMarkerTYPE _type;
_marker setMarkerSize [0.7, 0.7];
_marker setMarkerColor _color;
_marker setMarkerBrush "SOLID";
_marker setMarkerText _text;
while {!isNull _group && {{!isNull _x && {alive _x}} count units _group > 0} && {!(player in (units _group))}} do {sleep 0.1; _marker setMarkerPos (getposATL leader _group);};
deleteMarker _marker;
};


