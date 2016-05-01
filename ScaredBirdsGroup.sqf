private ["_scarer"];
//LOOP
while {true} do {
sleep (5+(random 15));
_scarer = leader (allGroups call RETURNRANDOM);
if (speed _scarer > 0) then {(getposATL _scarer) SPAWN BirdFunc2;};
};



