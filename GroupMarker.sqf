private ["_group", "_color", "_mar", "_marker"];
_group = _this select 0;
_color = _this select 1;
if (!isNil"debugi") then {
_mar = format ["LINEmar%1",NUMM];
NUMM=NUMM+1;
_marker = createMarker [_mar,getposATL leader _group];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [20, 20];
_marker setMarkerColor _color;
_marker setMarkerBrush "SOLID";
while {!isNull _group && {{!isNull _x && {alive _x}} count units _group > 0} && {!(player in (units _group))}} do {sleep 5; _marker setMarkerPos (getposATL leader _group);};
deleteMarker _marker;
};

