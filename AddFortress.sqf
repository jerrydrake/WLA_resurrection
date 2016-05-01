
private ["_mar","_mar2"];
_mar = format ["FORTM%1",NUMM];
NUMM=NUMM+1;
_mar2 = createMarker [_mar,getposATL (_this select 0)];
_mar2 setMarkerShape "ICON";
_mar2 setMarkerType "Empty";
_mar2 setMarkerSize [1,1];
_mar2 setMarkerColor (["ColorBlue","ColorRed","ColorRed"] call RETURNRANDOM);
_mar2 setMarkerText "";
FORTRESSESVAR pushBack _mar2;