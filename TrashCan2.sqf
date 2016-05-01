private ["_velocity","_timeA"];
if (true || {speed _this > 3}) then {


_this setvariable ["Trasher",nil];
_velocity = velocity _this;
_timeA = time + 0.5;
while {!(_velocity isEqualTo [0,0,0]) && {_timeA < time}} do {_velocity = velocity _this;};


{
detach _x; 
_x setvelocity [(_velocity select 0)*0.5- 2 +random 4,(_velocity select 1)*0.5- 2 +random 4,(_velocity select 2)*0.5+1+random 1];
_x setvariable ["Truck",nil];
_x setvariable ["AUTOSSA",nil];
} foreach (_this getvariable "CrateOBJs");

_this setvariable ["CrateOBJs",nil];
_this setvariable ["Crates",nil];
_this setvariable ["CrateFull",nil];
_this removeAllEventHandlers "hit";
};
