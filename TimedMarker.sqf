

private ["_pos", "_tim", "_mar", "_marker"];
_pos = _this select 0;
_tim = _this select 1;
_mar = format ["LINEmar%1",NUMM];
NUMM=NUMM+1;
_marker = createMarker [_mar,_pos];
_marker setMarkerShape "ELLIPSE";
//_marker setMarkerType "EMPTY";
_marker setMarkerSize [15, 15];
_marker setMarkerColor "ColorYellow";
_marker setMarkerBrush "SOLID";
sleep _tim;
deleteMarker _marker;

