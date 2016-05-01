
private ["_nul","_class","_center","_veh2","_veh","_timeT"];
_class = (lbText [1500, (lbCurSel 1500)]) CALL LUOKKANIMI;
_center = (screenToWorld [0.5,0.5]);
closeDialog 0;
_veh2 = createVehicle ["Sign_Arrow_Large_Pink_F", screenToWorld [0.5,0.5], [], 0, "CAN_COLLIDE"];
_veh = createVehicle ["Sign_Arrow_Large_Pink_F", screenToWorld [0.5,0.5], [], 0, "CAN_COLLIDE"];
//_bBox = boundingBoxReal (_this select 0);
_timeT = time + 20;
sleep 0.1;
while {!dialog && {_timeT > time}} do {_veh setpos (screenToWorld [0.5,0.5]);_veh setvectorup (surfaceNormal (getposATL _veh));sleep 0.02;};
if (_center distance (getposATL _veh) > 50) exitWith {deletevehicle _veh2;deletevehicle _veh;if (_timeT > time) then {_nul = [] SPAWN FUNK_ConstructionDialog;"Too long drawing >50m - Not saved" SPAWN HINTSAOK;};};
missionnamespace setvariable ["DrawFF",[_class, _center, getposATL _veh]];
deletevehicle _veh;
deletevehicle _veh2;
if (_timeT > time) then {_nul = [] SPAWN FUNK_ConstructionDialog;};