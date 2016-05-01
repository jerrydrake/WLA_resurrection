private ["_type","_pos","_money"];
_type = _this select 0;
_pos = _this select 1;
_money = _this select 2;


if (_type in ["Passage","Factory","Pier","Storage","Power Plant"]) then {
_nr = {
private ["_m"];
_m = _this select 0;
{if (getmarkerpos _x distance player < getmarkerpos _m distance player) then {_m = _x;};} foreach _this;
_m 
};
_ar = FacMarkers;
switch (_type) do {
case "Passage": {_ar = PierMarkers;};
case "Pier": {_ar = PierMarkers;};
case "Storage": {_ar = StoMarkers;};
case "Power Plant": {_ar = PowMarkers;};
};
_m = _ar call _nr;
sleep (random 1);
if (getmarkercolor _m == "ColorYellow") then {
_m setmarkercolor "ColorPink";
("Civilians are now operating "+_type+" for you. You can still capture the pink colored "+_type+" to get bigger effect on timed prestige") SPAWN HINTSAOK;
} else {
pisteet = pisteet + _money;
_nul = [_money, "Civilians helped"] SPAWN PRESTIGECHANGE;
};
};

if (_type in ["Men"]) then {
_group = [(getposATL vehicle player), WEST, [FRIENDC4 call RETURNRANDOM,FRIENDC4 call RETURNRANDOM,FRIENDC4 call RETURNRANDOM,FRIENDC4 call RETURNRANDOM],[],[],[0.8,0.9]] call SpawnGroupCustom;
_n = [_group,WEST,(getposATL (vehicle player))] SPAWN VehicleArrival;
{_x setcaptive true; _x setbehaviour "CARELESS";} foreach units _group;
leader _group sidechat "Wolf, we heard you helped civilians in trouble. I am sending some soldiers to aid your team, will be there shortly. Out";
sleep 3;
waitUntil {sleep 3; {isNull _x || {!alive _x} || {vehicle _x == _x}} count units _group > 0};
{_x setcaptive false; _x setbehaviour "AWARE";} foreach units _group;
{if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};} foreach units _group;
{
[_x] joinsilent player;
_x setSkill ["aimingaccuracy", 0.30 + (random 0.4)];
_x setSkill ["aimingShake", 0.30 + (random 0.4)];
_x setSkill ["aimingSpeed", 0.30 + (random 0.4)];
_x setSkill ["spotDistance", 0.20 + (random 0.4)];
_x setSkill ["spotTime", 0.35 + (random 0.35)];
_x setSkill ["endurance", 0.35 + (random 0.35)];
_x setSkill ["courage", 0.35 + (random 0.35)];
_x setSkill ["reloadSpeed", 0.35 + (random 0.35)];
_x setSkill ["commanding", 0.15 + (random 0.35)];
_x setSkill ["general", 0.35 + (random 0.35)];
} foreach units _group;
};

if (isNil"_type" || {_type == "Money"}) then {
pisteet = pisteet + _money;
_nul = [_money, "Civilians helped"] SPAWN PRESTIGECHANGE;
};