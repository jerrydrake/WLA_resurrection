private ["_ran","_pos","_dam","_wp","_pP","_nul"];
_ran = "Sound_Alarm2"; 
_pos = getposATL (_this select 0);
_dam = damage (_this select 0);
(_this select 0) setvariable  ["WithAlarm",true];
waitUntil {sleep 0.5; _dam < damage (_this select 0) || {vehicle player distance (_this select 0) > 210}};
if (count (crew (_this select 0)) == 0 && {vehicle player distance (_this select 0) < 210}) then {
_nul = (_this select 0) SPAWN FCarAlarmLights;
{
if (leader _x distance _pos < 200) then {
_n = _x SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_pP = getposATL (_this select 0);
_wp = _x addWaypoint [[(_pP select 0) + 50 - (random 100),(_pP select 1) + 50 - (random 100),0], 0];
};
sleep 0.1;
} foreach Pgroups;
{
if (leader _x distance _pos < 200) then {
_n = _x SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_pP = getposATL (_this select 0);
_wp = _x addWaypoint [[(_pP select 0) + 50 - (random 100),(_pP select 1) + 50 - (random 100),0], 0];
};
sleep 0.1;
} foreach FriendlyInf;
sleep 20;
};
(_this select 0) setvariable  ["WithAlarm",nil];