private ["_group","_pos","_c","_array","_waypoints","_building","_sHou","_nul"];
if (pisteet >= 200) then {
pisteet = pisteet - 200;
"Cash" SPAWN SAOKPLAYSOUND;
_nul = [-200, "Received Team-mate"] SPAWN PRESTIGECHANGE;
_pos = getposATL vehicle player;
_group = [ [(_pos select 0) + 50 - (random 100),(_pos select 1) + 50 - (random 100),0], WEST, [_this select 0],[],[],[0.6,0.9]] call SpawnGroupCustom;
{if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};} foreach units _group;

//_houses =  [getposATL leader _group,100];

{
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
} foreach [leader _group];


{
_c = 0;
_building = objNull;
_sHou = [(_pos select 0) + 100 - (random 200), (_pos select 1) + 100 - (random 200), 0];
_building = nearestBuilding _sHou;
_waypoints = _building call SAOKBUILDINGPOS;
if (count _waypoints > 0) then {
_pos = _building buildingPos (_waypoints call RETURNRANDOM);
_x setpos _pos;
};
} foreach units _group;

units _group join player;
} else {
if (pisteet < 200) then {
(format ["%1 more prestige value needed to receive new team-mate", 200 - pisteet]) SPAWN HINTSAOK;
} else {

};
};

