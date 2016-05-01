private ["_units"];
_units = _this select 0;
{
if (typename _x == "OBJECT") then {
_x SPAWN SAOKAICAMPADDF;
};
sleep 0.1;
} foreach _units;