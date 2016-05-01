private ["_side","_arr","_num","_pos","_range","_group","_sHou","_building","_c","_array","_ran","_waypoints"];
_side = _this select 0;
_arr = _this select 1;
if (_side == EAST && {isClass(configFile >> "cfgVehicles" >> "DRI_RiflemanO")}) then {_arr = ["DRI_ExplosivesO","DRI_EngineerO","DRI_RepairO","DRI_RPG7GrenadierO","DRI_MarksmanO","DRI_MedicO","DRI_AASoldierO","DRI_RPG7SoldierO","DRI_ATSoldierO","DRI_GrenadierO","DRI_AutomaticRiflemanO","DRI_MachineGunnerO","DRI_RiflemanO","DRI_SquadLeaderO"];};
_num = _this select 2;
_pos = _this select 3;
_range  = _this select 4;
_sHou = [(_pos select 0)+ _range - (random _range)*2, (_pos select 1)+ _range - (random _range)*2, 0];
_building = nearestBuilding _sHou;
_m = 0;
while {(vehicle player)distance (getposATL _building) < 200 && {_m < 10}} do {
_m = _m + 1;
_range = _range + 200;
sleep 1;
_sHou = [(_pos select 0)+ _range - (random _range)*2, (_pos select 1)+ _range - (random _range)*2, 0];
_building = nearestBuilding _sHou;
};
if !(_m < 10) exitWith {};
_waypoints = _building call SAOKBUILDINGPOS;
if (count _waypoints > 0) then {
_ran = [];
for "_i" from 0 to _num do {
_ran = _ran + [_arr call RETURNRANDOM];
};
_group = [[11000,11000,0], _side, _ran,[],[],[0.3,0.5]] call SpawnGroupCustom;
{
_pos = _building buildingPos (_waypoints call RETURNRANDOM);
_x setpos _pos;
} foreach units _group;
if (_side == EAST) then {Pgroups pushBack _group;} else {FriendlyInf pushback _group;};
if (count _this > 5 && {!isClass(configFile >> "cfgVehicles" >> "DRI_RiflemanO")}) then {_group SPAWN (_this select 5);};
{
_x setSkill ["aimingaccuracy", 0.15 + (random 0.20)];
_x setSkill ["aimingShake", 0.15 + (random 0.2)];
_x setSkill ["aimingSpeed", 0.10 + (random 0.1)];
_x setSkill ["spotDistance", 0.20 + (random 0.3)];
_x setSkill ["spotTime", 0.25 + (random 0.35)];
_x setSkill ["endurance", 0.25 + (random 0.25)];
_x setSkill ["courage", 0.15 + (random 0.35)];
_x setSkill ["reloadSpeed", 0.15 + (random 0.15)];
_x setSkill ["commanding", 0.15 + (random 0.25)];
_x setSkill ["general", 0.15 + (random 0.15)];
} foreach units _group;
};

//E.g. _nul = [EAST,ENEMYC3,4,getposATL player, 80] SPAWN InfFromHouse;

//_nul = [EAST,ENEMYC3,14,getposATL player, 80,{_this addWaypoint [getposATL player, 0]; {_c = [_x] SPAWN ConvertToArmedCivilianL;} foreach units _this;}] SPAWN InfFromHouse;