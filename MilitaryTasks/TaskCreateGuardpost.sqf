private ["_nV","_str","_mar","_mP","_marker","_Tid","_Lna","_header","_nul","_nearest","_n","_tasks","_picked","_head","_toChoose"];
//CONVERSATION
(missionnamespace getvariable "CivC") SPAWN {
_aika = time + 4;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 3;};
_p = ["Sol8"]call RETURNRANDOM;
[_this,player, "ZafV", _p]SPAWN SAOKKBTELL;
};
_head = "We have difficulties to guard road near from here. Would need to establish guardpost, but cant get it done in near future.";
_toChoose = ["I see what can I do","Sorry, I cant do that","Anything else I could do?"];
_nul = [_head, _toChoose,"S",[["V17","JinN15"],["V18","JinN9","JinN10","JinN12"],["V13","V16","V40"]],(missionnamespace getvariable "CivC")] SPAWN FConversationDialogSol;
//TASK TAKEN
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {};
if (LineSelected == 0) then {
_n = [] SPAWN TASK_CreateGuardpost;
} else {
//ANOTHER TASK
if (LineSelected == 2) then {
_tasks = ["MilitaryTasks\TaskCreateGuardpost.sqf"] CALL SOLDIERSTASKS;
if (count _this > 0) then {_tasks = _tasks - [_this select 0];};
_picked = _tasks call RETURNRANDOM;
if (!isNil{missionnamespace getvariable "TaskChosen"} && {missionnamespace getvariable "TaskChosen" != "Random Task"}) then {_picked = missionnamespace getvariable "TaskChosen";};

_nul = [_picked] SPAWN SAOKSTARTTASK;
};
};

