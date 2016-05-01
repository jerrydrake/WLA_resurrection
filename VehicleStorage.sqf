
//CHECK CarRemoval.sqf
SaOkVehicleData = [];
AddIdVeh = [];
//0 ID 1 CLASS 2 POS 3 DIR 4 FUEL 5 DAMAGE 6 MINETRUCK OR NOT hint format ["%1 %2",count SaOkVehicleData,count AddIdVeh];

[] SPAWN {
private ["_idV","_ar","_deAT","_forEachIndex","_veh","_vehs"];
waitUntil {sleep 1; !isNil"StartMission"};
_idV = (count SaOkVehicleData) + 1;
while {true} do {
sleep 2;
{if (isNil{_x getvariable "VehID"}) then {_x setvariable ["VehID",_idV]; _idV = _idV + 1;};AddIdVeh = AddIdVeh - [_x];sleep 0.01;} foreach AddIdVeh;
_vehs = [];
{
if (vehicle _x != _x && {isNil{_x getvariable "VehID"}} && {!((vehicle _x) in _vehs)} && {!(typeOf (vehicle _x) in ["LIB_61k","LIB_Zis3","LIB_BM37","SearchLight_SU","SearchLight_GER","LIB_Pak40","LIB_Flakvierling_38","LIB_FlaK_38","I_static_AT_F","I_static_AA_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_F","I_GMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_F","O_HMG_01_high_F","O_GMG_01_F","O_GMG_01_high_F"])}) then {
_vehs pushBack (vehicle _x);
};
sleep 0.1;
} foreach units group player;
sleep 1;
{
_veh = _x;
if (alive _x) then {
if (isNil{_veh getvariable "VehID"}) then {_veh setvariable ["VehID",_idV]; _idV = _idV + 1;};
if (!isNil{_veh getvariable "VehID"}) then {
if ({_x select 0 == (_veh getvariable "VehID")} count SaOkVehicleData > 0) then {
if((SaOkVehicleData select ((count SaOkVehicleData) - 1)) select 0 != _veh getvariable "VehID") then {
{
if (_x select 0 == _veh getvariable "VehID") exitWith {
_ar = + _x;
_deAT = SaOkVehicleData deleteAt _forEachIndex;
SaOkVehicleData pushBack _ar;
};
};
sleep 0.01;
} foreach SaOkVehicleData;
};
};
};
sleep 0.01;
} foreach _vehs;
sleep 0.1;
};
};



[] SPAWN {
private ["_c","_deAT"];
while {true} do {
sleep 2;
_c = count SaOkVehicleData - 1;
for "_i" from 0 to _c do {
private ["_id","_car","_bol","_xx"];
if (count SaOkVehicleData > _i) then {
_xx = SaOkVehicleData select _i;
_id = _xx select 0;
if (!isNil"_id") then {
if ({_x getvariable "VehID" == _id} count vehicles == 0 && {player distance (_xx select 2) < 700}) then {
_bol = false;
if (count ((_xx select 2) nearEntities [["Air", "Car", "LandVehicle"], 10]) == 0) then {_bol = true;};
_car = createVehicle [_xx select 1,_xx select 2, [], 0, "form"];
if (_bol) then {_car setpos (_xx select 2);};
_car setdir (_xx select 3);
_car setfuel (_xx select 4);
_car setdamage (_xx select 5);
_car setvariable ["VehID",_id];
//if ((_xx select 6) == 1) then {_car setvariable ["MineTruck",1];};
CARS pushBack _car;
};
} else {_deAT = SaOkVehicleData deleteAt _i;};
sleep 0.1;
};
};
};
};


