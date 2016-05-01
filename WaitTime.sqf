private ["_hours","_nul","_ran","_ok"];
sleep (random 0.05);
if (!dialog) then {
disableserialization;
_ok = createDialog "RestingDialog"; 
sliderSetRange [1901, 0, 12];
sliderSetPosition [1901, 0];
_hours = 0;
while {dialog} do {
_hours = sliderPosition 1901;
sleep 0.1;
};

if (_hours > 0 && {!isNil"SAOKTIMESKIP"}) then {
SAOKTIMESKIP = nil;
titlecut ["","black out",2];
{_x allowdamage false;} foreach units group player;
sleep 2;
{_x spawn {sleep (random 2); [_this,(["snore20","snore19","snore18","snore17","snore16","snore15","snore14","snore13","snore12","snore11","snore10","snore9","snore8","snore7","snore6","snore5","snore4","snore3","snore2","snore"]call RETURNRANDOM)] SPAWN SAOKSAY3D;};} foreach units group player;

if (((locationposition ([] CALL NEARESTCAMP)) distance player < 50 && {getmarkercolor (([] CALL NEARESTCAMP) getvariable "Marker") == "ColorBlue"})) then {
{
if ([_x] CALL BIS_fnc_taskExists) then {
_nul = [_x,"SUCCEEDED"] call SAOKCOTASK;
_x SPAWN {sleep 60; _n = [_this] CALL BIS_fnc_deleteTask;};
}
} foreach ["TaskNalka","TaskJano","TaskKipea"];
};
{
if ([_x] CALL BIS_fnc_taskExists) then {
TVasynyt = nil;
_ran = 10 + (random 30);
pisteet = pisteet + _ran;
_nul = [_ran, "Rested"] SPAWN PRESTIGECHANGE;
_nul = [_x,"SUCCEEDED"] call SAOKCOTASK;
_x SPAWN {sleep 60; _n = [_this] CALL BIS_fnc_deleteTask;};
}
} foreach ["TaskVasynyt"];
skiptime _hours;
sleep 1;
{if (alive _x && {vehicle _x == _x}) then {
_x SPAWN {
private ["_mats","_matP","_obj","_obj2","_bags"];
_bags = [["Land_Sleeping_bag_F","Land_Sleeping_bag_folded_F"],["Land_Sleeping_bag_blue_F","Land_Sleeping_bag_blue_folded_F"],["Land_Sleeping_bag_brown_F","Land_Sleeping_bag_brown_folded_F"]];
_mats = (_bags call RETURNRANDOM);
_matP = getposATL _this;
_obj = createVehicle [_mats select 0,_matP, [], 0, "CAN_COLLIDE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setdir (direction _this);
sleep (3+random 10);
deletevehicle _obj;
_obj = createVehicle [_mats select 1,_matP, [], 0, "CAN_COLLIDE"]; 
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setdir (random 360);
_obj2 = createVehicle ["Land_Ground_sheet_F",_matP, [], 0, "CAN_COLLIDE"]; 
_obj2 setvectorup (surfaceNormal (getposATL _obj));
_obj2 setdir (random 360);
sleep (5+random 10);
deletevehicle _obj;
deletevehicle _obj2;
};};
sleep 0.1;
} foreach (units group player);
sleep 4;
if (count CUTSCNS == 0) then {
titlecut ["","black in",4];
} else {
_prandom = CUTSCNS call RETURNRANDOM;
CUTSCNS = CUTSCNS - [_prandom];
_n = [] execVM _prandom;
waitUntil {sleep 1; scriptdone _n};
};
sleep 4;
{_x allowdamage true;} foreach units group player;
};

};

