private ["_bol"];
_bol = false;
if (!isNil{missionnamespace getvariable "SStill"} && {((missionnamespace getvariable "SStill") select 1) > 5}) then {_bol = true;};
_bol