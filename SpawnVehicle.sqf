private ["_pos","_type","_side","_car","_dir","_mode","_height","_groupSV","_crew"];
_pos = if (!isNil{_this select 0} && {typename (_this select 0) == "ARRAY"} && {(_this select 0) distance [0,0,0] > 100}) then {_this select 0} else {[((getposATL (vehicle player)) select 0)+1000-(random 2000), ((getposATL (vehicle player)) select 1)+1000-(random 2000),0]};
_dir = _this select 1;
_type = _this select 2;
_side = _this select 3;
if (_pos distance vehicle player < 200 && {str _side == str EAST} && {count _this < 5}) then {
_pos = [(vehicle player),700,200] CALL SAOKSEARCHPOS;
_roads = (_pos nearRoads 450);
if (count _roads > 0) then {_pos = getposATL (_roads select 0);}; 
};
_mode = "NONE";
_height = if (count _pos > 2) then {_pos select 2} else {0.2};
if (_height > 0) then {_mode = "FLY";};
if (_type isKindOf "Plane" && {_height != 0}) then {_height = 600;};
_car = createVehicle [_type,_pos, [], 0, _mode];
_car setdir _dir;
createVehicleCrew _car;
_crew = (crew _car);
{
if (side _x == EAST) then {
_x setSkill ["aimingaccuracy", 0.05 + (random 0.15)];
_x setSkill ["aimingShake", 0.05 + (random 0.2)];
_x setSkill ["aimingSpeed", 0.05 + (random 0.2)];
_x setSkill ["spotDistance", 0.25 + (random 0.40)];
_x setSkill ["spotTime", 0.25 + (random 0.40)];
_x setSkill ["endurance", 0.1 + (random 0.25)];
_x setSkill ["courage", 0.15 + (random 0.35)];
_x setSkill ["reloadSpeed", 0.15 + (random 0.15)];
_x setSkill ["commanding", 0.15 + (random 0.25)];
_x setSkill ["general", 0.15 + (random 0.15)];
} else  {
_x setSkill ["aimingaccuracy", 0.30 + (random 0.3)];
_x setSkill ["aimingShake", 0.30 + (random 0.4)];
_x setSkill ["aimingSpeed", 0.30 + (random 0.4)];
_x setSkill ["spotDistance", 0.35 + (random 0.4)];
_x setSkill ["spotTime", 0.35 + (random 0.4)];
_x setSkill ["endurance", 0.35 + (random 0.35)];
_x setSkill ["courage", 0.35 + (random 0.35)];
_x setSkill ["reloadSpeed", 0.35 + (random 0.35)];
_x setSkill ["commanding", 0.15 + (random 0.35)];
_x setSkill ["general", 0.35 + (random 0.35)];
};
} foreach _crew;
_groupSV = if (!isNil"_crew" && {count _crew > 0}) then {group (_crew select 0)} else {grpNull};
if (_height > 100) then {_height = 160;};
if (_height > 90) then {_height = 50;};
if (_height > 0 && {count _this < 5}) then {_car setVelocity [_height * (sin _dir),_height * (cos _dir), 0];};
[_car, _crew, _groupSV]