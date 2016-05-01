//"B_G_Offroad_01_F"
private ["_cVar2","_vClass","_vRoom","_unitsG","_cU","_c","_all","_cars","_driver","_aU","_obj","_veh","_side","_end","_start","_st","_startV","_wp1"];
//_group = _this select 0;
_side = _this select 1;
_end = _this select 2;
_sC = {
private ["_bol"];
_bol = true;
if (!isNil{_x getvariable "StuckP"} && {(_x getvariable "StuckP") distance (getposATL _x) < 2}) then {_bol = false;} else {_x setvariable ["StuckP",(getposATL _x)];};
_bol
};

_start = [(_end select 0)+700-(random 1400),(_end select 1)+700-(random 1400),0];
while {surfaceiswater _start || {vehicle player distance _start < 550}} do {_start = [(_end select 0)+700-(random 1400),(_end select 1)+700-(random 1400),0]; sleep 1;};

_veh = ["B_G_Offroad_01_F",6];
switch _side do {
//VEH ZONE "O_Truck_03_covered_F","O_Truck_03_transport_F",
case EAST: {
_veh = [["O_Truck_03_transport_F",9],["O_Truck_03_covered_F",9],["B_G_Offroad_01_F",6],["B_G_Quadbike_01_F",2],["O_Truck_02_covered_F",9],["O_Truck_02_transport_F",9],["O_MRAP_02_F",3]] call RETURNRANDOM;
if (!isNil"Eridanus") then {
_veh = [];
{_veh pushback [_x, 4];} foreach ["TEI_M12_FAV_APC"];
{_veh pushback [_x, 2];} foreach ["TEI_M12_FAV_ins"];
_veh = _veh call RETURNRANDOM;
};
if (!isNil"RHSENABLED") then {
_veh = [];
{_veh pushback [_x, 8];} foreach ["rhs_gaz66_vv","rhs_gaz66_vmf","rhs_gaz66_vdv","rhs_gaz66_msv","rhs_gaz66o_vv","rhs_gaz66o_vmf","rhs_gaz66o_vdv","rhs_gaz66o_msv","RHS_Ural_Open_VV_01","RHS_Ural_Open_VMF_01","RHS_Ural_Open_VDV_01","RHS_Ural_Open_MSV_01","RHS_Ural_VV_01","RHS_Ural_VDV_01","RHS_Ural_VMF_01","RHS_Ural_MSV_01"];
{_veh pushback [_x, 4];} foreach ["rhs_tigr_vmf","rhs_tigr_3camo_vmf","rhs_tigr_ffv_3camo_vmf","rhs_tigr_ffv_vmf","rhs_uaz_vdv","rhs_uaz_vv","rhs_uaz_msv","rhs_uaz_vmf"];
_veh = _veh call RETURNRANDOM;
};
if (!isNil"CheConf") then {
_veh = [];
{_veh pushback [_x, 8];} foreach ["O_mas_cer_Truck_02_transport_F","O_mas_cer_Truck_02_covered_F"];
{_veh pushback [_x, 4];} foreach ["O_mas_cer_Offroad_01s_F","O_mas_cer_MRAP_03_F"];
_veh = _veh call RETURNRANDOM;
};
if (!isNil"IFENABLED") then {
_veh = [];
{_veh pushback [_x, 4];} foreach ["LIB_Scout_m3","Lib_SdKfz251_captuRed","lib_us6_tent","lib_us6_open"];
_veh = _veh call RETURNRANDOM;
};
};
case WEST: {
_veh = [["B_MRAP_01_F",4],["B_G_Offroad_01_F",6],["B_G_Quadbike_01_F",2],["I_MRAP_03_F",3],["I_Truck_02_covered_F",9],["I_Truck_02_transport_F",9]] call RETURNRANDOM;
if (!isNil"Eridanus") then {
_veh = [];
{_veh pushback [_x, 4];} foreach ["TEI_M813_TT","TEI_M813_TT_black","TEI_M813_TT_tan","TEI_M813_TT_snow"];
{_veh pushback [_x, 2];} foreach ["TEI_M12_FAV","TEI_M12_FAV_black","TEI_M12_FAV_snow","TEI_M12_FAV_snow"];
_veh = _veh call RETURNRANDOM;
};
if (!isNil"RHSENABLED") then {
_veh = [];
{_veh pushback [_x, 7];} foreach ["rhsusf_rg33_wd","rhsusf_rg33_d","rhsusf_rg33_wd","rhsusf_rg33_d","rhsusf_rg33_wd","rhsusf_rg33_d","rhsusf_rg33_wd","rhsusf_rg33_d","rhsusf_rg33_wd","rhsusf_rg33_d","rhsusf_rg33_wd","rhsusf_rg33_d","rhsusf_rg33_wd","rhsusf_rg33_d"];
{_veh pushback [_x, 4];} foreach ["rhsusf_m998_d_s_4dr_fulltop","rhsusf_m998_w_s_4dr_fulltop","rhsusf_m998_d_4dr_fulltop","rhsusf_m998_w_4dr_fulltop","rhsusf_m998_d_s_4dr_halftop","rhsusf_m998_w_s_4dr_halftop","rhsusf_m998_d_4dr_halftop","rhsusf_m998_w_4dr_halftop","rhsusf_m998_d_s_4dr","rhsusf_m998_w_s_4dr","rhsusf_m998_d_4dr","rhsusf_m998_w_4dr","rhsusf_m998_d_s_2dr_fulltop","rhsusf_m998_w_s_2dr_fulltop","rhsusf_m998_d_2dr_fulltop","rhsusf_m998_w_2dr_fulltop","rhsusf_m998_d_s_2dr_halftop","rhsusf_m998_w_s_2dr_halftop","rhsusf_m998_d_2dr_halftop","rhsusf_m998_w_2dr_halftop","rhsusf_m998_d_s_2dr","rhsusf_m998_w_s_2dr","rhsusf_m998_d_2dr","rhsusf_m998_w_2dr"];
_veh = _veh call RETURNRANDOM;
};
if (!isNil"CheConf") then {
_veh = [];
{_veh pushback [_x, 8];} foreach ["B_mas_cer_Truck_02_covered_F","B_mas_cer_Truck_02_transport_F"];
{_veh pushback [_x, 4];} foreach ["B_mas_cer_Offroad_01_F","B_mas_cer_MRAP_03_F"];
_veh = _veh call RETURNRANDOM;
};
if (!isNil"IFENABLED") then {
_veh = [];
{_veh pushback [_x, 8];} foreach ["LIB_opelblitz_open_y_camo","LIB_opelblitz_tent_y_camo","Lib_sdkfz251","LIB_SdKfz_7"];
{_veh pushback [_x, 4];} foreach ["LIB_kfz1","LIB_kfz1"];
_veh = _veh call RETURNRANDOM;
};
};
};
if (count _this > 3 && {count (_this select 3) > 0}) then {
_veh = _this select 3;
};
_vClass = _veh select 0;
_vRoom = _veh select 1;
_unitsG = _this select 0;
if (isNil"_unitsG" || {isNil"_side"}|| {isNil"_end"} || {count _unitsG == 0}) exitWith {};
_cU = count _unitsG;
_cVar2 = [];
_all = [];
{
private ["_c"];
if (!isNil"_x") then {
_cVar2 pushback _x;
if (count _cVar2 >= _vRoom) then {_c = + _cVar2;_all pushBack _c;_cVar2 = [];};
};
sleep 0.01;
} foreach _unitsG;
if (count _cVar2 > 0) then {_c = + _cVar2;_all pushBack _c;};
_cVar2 = nil;
_cars = [];
{
private ["_au","_st","_startV","_obj","_driver"];
_startV = [_start, 100,0,"(1 - sea) * (1 + meadow)* (1 - hills)",""] CALL SAOKSEEKPOS;
_driver = (_x select 0);
_aU = _x - [_driver];
_obj = createVehicle [_vClass,_startV, [], 0, "NONE"]; 
_cars = _cars + [_obj];
_driver moveindriver _obj;
{_x moveincargo _obj;} foreach _aU;
sleep 0.01;
} foreach _all;

{
_wp1 = group _x addWaypoint [_end, 0];
sleep 0.01;
} foreach _unitsG;
sleep 25;
waitUntil {sleep 8; {!isNull _x} count _unitsG == 0 || {{!isNil"_x"} count _unitsG == 0} || {{alive _x} count _unitsG == 0} || {{_x distance _end < 50 || behaviour _x == "COMBAT"} count _unitsG > 0} || {{_x distance _end < 30} count _cars > 0} || {{!(_x call _sC)} count _cars > 0}};
_unitsG ordergetin false;
{unassignvehicle _x;_x action ["GetOut",vehicle _x];} foreach _unitsG;
{CARS pushBack _x;_x SPAWN {waitUntil {sleep 2; isNull _this || {count crew _this == 0}};if (!isNull _this) then {[_this,0] SPAWN VehLife;};waitUntil {sleep 2; isNull _this || {count crew _this > 0}};if (!isNull _this) then {[_this,1] SPAWN VehLife;};};sleep 0.1;} foreach _cars;
if ({alive _x} count _unitsG > 0 && {count _this > 5}) then {
_nul = [_unitsG] SPAWN AICampBehaviour;
};
