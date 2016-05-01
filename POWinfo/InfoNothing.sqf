private ["_nV","_str","_mar","_mP","_marker","_Tid","_Lna","_header","_nul","_nearest","_n","_tasks","_picked","_head","_toChoose"];
//CONVERSATION
(missionnamespace getvariable "CivC") SPAWN {
_aika = time + 4;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 3;};
_p = ["Pow8"] call RETURNRANDOM;
[_this, player, "ZafV", _p] SPAWN SAOKKBTELL;
};
_head = "I wont reveal you anything. You are wasting your time";
_toChoose = ["Fine","...","I know your are lieing"];
_nul = [_head, _toChoose,"S",[["JinN36","JinN40","JinN41"],["JinN37","JinN42"],["JinN38","JinN39"]]] SPAWN FConversationDialogSur;
//TASK TAKEN
waitUntil {sleep 0.5; scriptdone _nul};
if (isNil"LineSelected") exitWith {};
if (LineSelected == 0) then {
//_n = 1 SPAWN TASK_OFFICER;
};

