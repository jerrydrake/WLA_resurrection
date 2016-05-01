private ["_mar2","_name","_start2","_type","_size","_color","_text"];

_name = _this select 0;
_start2 = _this select 1;
_type = _this select 2;
_size = _this select 3;
_color = _this select 4;
_text = _this select 5;
_mar2 = createMarkerLocal [_name,_start2];
_mar2 setMarkerShapeLocal "ICON";
_mar2 setMarkerTypeLocal _type;
_mar2 setMarkerSizeLocal _size;
_mar2 setMarkerColorLocal _color;
_mar2 setMarkerTextLocal _text;
_mar2