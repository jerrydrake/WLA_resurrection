private ["_p"];
_p = _this select 0;
if (isNil{_p getvariable "SmokeTime"}) then {_p setvariable ["SmokeTime",1];} else {_p setvariable ["SmokeTime",(_p getvariable "SmokeTime")+1];};
sleep 320;
if ((_p getvariable "SmokeTime") == 1) then {_p setvariable ["SmokeTime",nil];} else {_p setvariable ["SmokeTime",(_p getvariable "SmokeTime")-1];};