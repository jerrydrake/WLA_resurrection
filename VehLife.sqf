private ["_car"];
_car = _this select 0;
if (_this select 1 == 0) then {
sleep 9;
if (count crew _car > 0) exitWith {};
_car disableAI "TARGET";
_car disableAI "AUTOTARGET";
_car disableAI "MOVE";
_car disableAI "ANIM";
_car disableAI "FSM";
_car enableSimulation false;
_car allowDamage false; 
} else {
_car enableAI "TARGET";
_car enableAI "AUTOTARGET";
_car enableAI "MOVE";
_car enableAI "ANIM";
_car enableAI "FSM";
_car enableSimulation true;
_car allowDamage true; 
};