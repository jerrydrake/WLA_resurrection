private ["_array","_unit"];
_array = _this select 0;
_unit = weapons _array + magazines _array;
copyToClipboard format["%1",_unit];
hint "Classes copied!";


