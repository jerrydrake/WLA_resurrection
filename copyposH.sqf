private ["_unit"];
_unit = [(getposATL player) select 0,(getposATL player) select 1,(getposATL player) select 2];
copyToClipboard format["%1",_unit];
hint "Pos copied!";
