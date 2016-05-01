
private ["_scarer"];
_scarer = _this;
//LOOP
while {!isNil"_scarer" && {!isNull _scarer}} do {
sleep (7+(random 19));
if (speed _scarer > 5) then {(getposATL _scarer) SPAWN BirdFunc2;};
};



