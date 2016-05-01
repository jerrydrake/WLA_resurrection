//CONVERSATION
private ["_head","_toChoose","_nul","_n"];
(missionnamespace getvariable "CivC") SPAWN {

private ["_aika"];
_aika = time + 6;
if (!isNil{missionnamespace getvariable "LastW"}) then {
waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
} else {sleep 6;};
[_this,player, "PlaV", "CivT4"]SPAWN SAOKKBTELL;
};
_head = "I see you are here to help. There is one man sitting in holding cell. He might be able to help you - I mark it in your map, watch out for persians";
_toChoose = ["Thank you, civilian"];
_nul = [_head, _toChoose,""] SPAWN FConversationDialog;
waitUntil {sleep 0.5; scriptdone _nul};
SA_TASKFR2 = compile preprocessfileLineNumbers "VillageTasks\TaskFindRes2.sqf";
_n = [] SPAWN SA_TASKFR2;
_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
_header = format ["Unknown Military Units Seen Talking to Locals near %1",_Lna];
[_header, date] CALL SAOKEVENTLOG;