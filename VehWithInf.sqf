private ["_vehg","_infg"];
_vehg = _this select 0;
_infg = _this select 1;
waituntil {sleep 25; behaviour leader _vehg == "COMBAT" || {behaviour leader _infg == "COMBAT"} || {vehicle player distance (vehicle leader _vehg) > 1000}};
if (vehicle player distance (vehicle leader _vehg) > 1000) then {
{_x spawn SAOKDELETE;} foreach units _vehg + [vehicle leader _vehg];
} else {
VehicleGroups pushBack _vehg;
};
