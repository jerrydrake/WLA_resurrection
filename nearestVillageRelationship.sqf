private ["_rela","_nearest"];
_nearest = (player CALL SAOKNEARESTVIL);
if (typename _this == "ARRAY") then {_nearest = (_this select 0) CALL SAOKNEARESTVIL;};
_rela = "Neutral";
if !([_nearest,"A"] CALL SAOKVILCON) then {_rela = "Neutral";} else {_rela = [_nearest,"A"] CALL SAOKVILRET;};
_rela