while {true} do {
sleep 60;
{
_unit = _x;
{
if (isNil{_unit getvariable (_x+"B")}) then {
_unit setvariable [(_x+"B"),_unit skill _x];
}; 
_unit setSkill [_x, _unit getvariable (_x+"B")];
} foreach ["AimingAccuracy","AimingShake","AimingSpeed","SpotDistance","SpotTime","Endurance","Courage","ReloadSpeed","Commanding","General"];
//SKILLEFFECTS
{
if (!isNil{_unit getvariable _x}) then {
[(_unit getvariable _x),_unit] CALL SKILLEFFECT;
};
} foreach ["Mental","Sickness","Relationship","TiRed"];



} foreach units group player - [player];


};

/*
_x setSkill ["aimingaccuracy", 0.10 + (random 0.4)];
_x setSkill ["aimingShake", 0.30 + (random 0.4)];
_x setSkill ["aimingSpeed", 0.10 + (random 0.4)];
_x setSkill ["spotDistance", 0.20 + (random 0.4)];
_x setSkill ["spotTime", 0.15 + (random 0.35)];
_x setSkill ["endurance", 0.15 + (random 0.35)];
_x setSkill ["courage", 0.15 + (random 0.35)];
_x setSkill ["reloadSpeed", 0.15 + (random 0.35)];
_x setSkill ["commanding", 0.15 + (random 0.35)];
_x setSkill ["general", 0.15 + (random 0.35)];
*/