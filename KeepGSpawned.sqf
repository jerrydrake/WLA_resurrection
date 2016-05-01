private ["_dd","_g"];
//LISÄÄ
if (count _this == 0) then {
_dd = (["Lb"] CALL DIS);
_g = [];
{
_G pushback _x;_x setvariable ["KeepG",true];
} foreach (nearestLocations [player, ["PostG","PostR"], _dd]);
if (!isNil{missionnamespace getvariable "KeepGs"}) then {_g = _g + (missionnamespace getvariable "KeepGs");};
missionnamespace setvariable ["KeepGs",_g];
} else {
//POISTA
if (!isNil{missionnamespace getvariable "KeepGs"}) then {
{_x setvariable ["KeepG",nil];} foreach (missionnamespace getvariable "KeepGs");
missionnamespace setvariable ["KeepGs",nil];
};
};