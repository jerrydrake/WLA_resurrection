
private ["_scarer"];
_scarer = _this;
if (CBIRDS > 5) exitWith {
_scarer SPAWN {
private ["_scarer","_num"];
_scarer = _this;
if (!isNil{(_scarer getvariable "BirdNum")}) then {
_scarer removeEventHandler ["FiRed", (_scarer getvariable "BirdNum")];
_scarer setvariable ["BirdNum",nil];
} else {
_scarer removeAllEventHandlers "FiRed";
_scarer setvariable ["BirdNum",nil];
};

sleep 30;
if (!isNil"_scarer" && !isNull _scarer) then {
if (isNil{(_scarer getvariable "BirdNum")}) then {
_num = _scarer addEventHandler ["FiRed",{(_this select 0) SPAWN ScaredBirdsOnce;}];
_scarer setvariable ["BirdNum",_num];
};
};
};

};
CBIRDS = CBIRDS + 1;

if (!isNil{(_scarer getvariable "BirdNum")} && random 1 < 0.5) then {
_scarer SPAWN {
private ["_scarer"];
_scarer = _this;
if (!isNil{(_scarer getvariable "BirdNum")}) then {
_scarer removeEventHandler ["FiRed", (_scarer getvariable "BirdNum")];
_scarer setvariable ["BirdNum",nil];
} else {
_scarer removeAllEventHandlers "FiRed";
_scarer setvariable ["BirdNum",nil];
};

sleep 60;
if (!isNil"_scarer" && !isNull _scarer) then {
if (isNil{(_scarer getvariable "BirdNum")}) then {
_num = _scarer addEventHandler ["FiRed",{(_this select 0) SPAWN ScaredBirdsOnce;}];
_scarer setvariable ["BirdNum",_num];
};
};
};
};




for "_i" from 1 to 5 do {
(getposATL _scarer) SPAWN BirdFunc3;
};



