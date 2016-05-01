private ["_tasks"];
_tasks = ["MilitaryTasks\TaskFindOfficer.sqf","MilitaryTasks\TaskKillOfficer.sqf","MilitaryTasks\TaskCreateGuardpost.sqf","MilitaryTasks\TaskConvoy.sqf","MilitaryTasks\TaskZone.sqf"];
_p = SAOKMAPSIZE*0.5;
if (count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]) > 0 && { count (nearestLocations [[_p,_p,0], ["CampR"], SAOKMAPSIZE*0.7]) > 0}) then {_tasks append ["MilitaryTasks\TaskAttackCamp.sqf"];};
if ({isNil{(_x getvariable "Post") getvariable "Taken"}} count (nearestLocations [player, ["PostG"], 4000]) > 0) then {_tasks append ["MilitaryTasks\TaskGuardRoadBlock.sqf"];};
if (count _this > 0) then {_tasks = _tasks - [_this select 0];};
_tasks