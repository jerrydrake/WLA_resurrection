private ["_Pposition","_name","_mar2"];
{
if ((getmarkersize _x select 0) > 100) then {
_x setmarkersize [(getmarkersize _x select 0)-56,(getmarkersize _x select 1)-56];
} else {
Bpositions = Bpositions - [_x];
deletemarker _x;
};
sleep 0.01;
} foreach Bpositions;
_Pposition = _this select 0; 
if (!surfaceIsWater _Pposition) then {
_name = format ["Bmar%1",NUMM];
NUMM=NUMM+1;
_mar2 = createMarker [_name,_Pposition];
_mar2 setMarkerShape "ICON";
_mar2 setMarkerType "Empty";
_mar2 setMarkerSize [500,500];
_mar2 setMarkerColor "ColorBlack";
Bpositions pushBack _mar2;
};
