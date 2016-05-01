private ["_bol","_fuelF","_gr","_wpPP","_start","_zone","_whereTo","_speed","_marS","_mar5","_type","_c","_time","_dist","_Dx","_Dy","_perSx","_perSy","_w","_msize","_n"];
//{[_x, getposATL player] SPAWN ZoneMove;} foreach VEHZONES;
_zone = _this select 0;
if (_zone in NOMOVEZONES || {!isNil{_zone getvariable "NOMOVE"}}) exitWith {};
_start = locationposition _zone;
_type = (_zone getvariable "Mtype");
_whereTo = _this select 1;
if (isNil"_whereTo" || {_whereTo distance [0,0,0] < 240} || {{_x < 0} count _whereTo > 0}) exitWith {};
if (isNil"_whereTo" || {isNil"_zone"} || {typename _whereTo != "ARRAY"} || {!((count _whereTo) in [2,3])} || {isNil{_zone getvariable "IDCODE"}}) exitWith {};
if (!isNil{_zone getvariable "ACTIVE"} && {{_x select 0 == _zone} count ZONEMG > 0}) then {
_gr = "";
{if (_x select 0 == _zone) exitWith {_gr = _x select 1;};} foreach ZONEMG;
if (typename _gr == "GROUP" && {_gr in allgroups}) then {
{_x setWaypointType "MOVE";} foreach waypoints _gr;
_w = _gr addWaypoint [_whereTo, 0]; 
};
};
_n = [_zone,_whereTo] CALL SAOKZONEM;


