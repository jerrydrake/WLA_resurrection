private ["_f2","_f","_car","_start","_end","_side","_dire","_t1","_way1","_xx","_yy","_wp1","_posC"];
_car = _this select 0;
_start = _this select 1;
_end = _this select 2;
_side = _this select 3;
_dire = _this select 4;
_f2 = {
private ["_xx"];
_xx = _this select 0;
waituntil {sleep 5; isNull _xx || {_xx distance player > 500}}; 
if (!isNull _xx) then {
deletevehicle _xx;
};
};
_f = {
private ["_xx"];
_xx = _this select 0;
waituntil {sleep 5; count units _xx == 0}; 
deletegroup _xx;
};
_t1 = [_start,1,_car,_side] call SPAWNVEHICLE;
_nul = [(_t1 select 2),"ColorGreen"] SPAWN FUNKTIO_GM;
_way1= (_t1 select 2) addWaypoint [_end, 0]; 
(_t1 select 0) setdir _dire;
if (random 1 < 0.3) then {
_ran = CIVS1 call RETURNRANDOM;
_animal = (_t1 select 2) createUnit [_ran, _start, [], 0, "form"];
_animal moveincargo (_t1 select 0);
};
if (random 1 < 0.1) then {
_ran = CIVS1 call RETURNRANDOM;
_animal = (_t1 select 2) createUnit [_ran, _start, [], 0, "form"];
_animal moveincargo (_t1 select 0);
};
if (_side==civilian) then {(_t1 select 2) setbehaviour "CARELESS"; (_t1 select 2) allowfleeing 0;};
CARS pushBack (_t1 select 0);
_posC = getposATL  (_t1 select 0);
sleep 60;
//STUCK CHECK
if (_posC distance (_t1 select 0) < 3 && {!(player in (_t1 select 0))} && {count (crew (_t1 select 0)) > 0}) then {
_end = [(_t1 select 0),2400,500,"(1 + sea)"] CALL SAOKSEEKPOS;
while  {!surfaceIsWater _end} do {
sleep 6;
_end = [(_t1 select 0),2400,500,"(1 + sea)"] CALL SAOKSEEKPOS;
};
_n = (_t1 select 2) SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp1= (_t1 select 2) addWaypoint [_end, 0]; 
[(_t1 select 2), 1] setWaypointBehaviour "CARELESS";
};

waitUntil {sleep 10;isNil"_t1" || {isNull (_t1 select 2)} || {vehicle player distance leader (_t1 select 2) > 3000} ||  {((leader  (_t1 select 2) distance (_end)) < 50)} || {!(alive leader  (_t1 select 2))} || {(vehicle player == (_t1 select 0))} || {!(alive (_t1 select 0))}};
if (!(alive leader (_t1 select 2)) || {(vehicle player == (_t1 select 0))} || {!(alive (_t1 select 0))}) then {
{_nul = [_x] SPAWN _f2;sleep 0.1;} foreach (units (_t1 select 2));
_nul = [(_t1 select 2)] SPAWN _f;
};
while {!isNil"_t1" && {!isNull (_t1 select 2)} && {vehicle player distance (leader (_t1 select 2)) < 500 || {[(_t1 select 0),player] CALL FUNKTIO_LOS}}} do {
_end = [(_t1 select 0),2400,500,"(1 + sea)"] CALL SAOKSEEKPOS;
while  {!surfaceIsWater _end} do {
sleep 6;
_end = [(_t1 select 0),2400,500,"(1 + sea)"] CALL SAOKSEEKPOS;
};
_n = (_t1 select 2) SPAWN SAOKREMOVEWAYPOINTS; 
waitUntil {sleep 0.1; scriptdone _n};
_wp1= (_t1 select 2) addWaypoint [_end, 0]; 
waitUntil {sleep 10; isNil"_t1" || {isNull (_t1 select 2)} || {vehicle player distance (leader (_t1 select 2)) > 500} ||{((leader  (_t1 select 2) distance (_end)) < 50)} || {!(alive leader  (_t1 select 2))} || {(vehicle player == (_t1 select 0))} || {!(alive (_t1 select 0))}};
if (!(alive leader  (_t1 select 2)) || {(vehicle player == (_t1 select 0))} || {!(alive (_t1 select 0))}) then {
{_nul = [_x] SPAWN _f2;sleep 0.1;} foreach (units (_t1 select 2));
_nul = [(_t1 select 2)] SPAWN _f;
};
};

{unassignvehicle _x;[_x] ordergetin false;_x action ["GetOut",vehicle _x];sleep 0.1;} foreach units (_t1 select 2);
waitUntil {sleep 10; isNil"_t1" || {isNull (_t1 select 2)} || {vehicle leader (_t1 select 2) == leader  (_t1 select 2)} || {vehicle player distance (leader (_t1 select 2)) > 500}};
{_x spawn SAOKDELETE;sleep 0.1;} foreach [(_t1 select 0)];
{_x spawn SAOKDELETE;sleep 0.1;} foreach (units (_t1 select 2));
{deletegroup _x;sleep 0.1;} foreach [(_t1 select 2)];

MAXBOATS=MAXBOATS+1;