private ["_unit"];
_unit = [(getposASL player) select 0,(getposASL player) select 1,0];
copyToClipboard format["%1",_unit];
hint "Pos copied!";
