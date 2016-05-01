private ["_gunP","_sizeT","_RR2","_pickedPosses","_ffS","_wallDS","_d","_wallD","_ff","_R","_walls","_nnn","_clcl","_benc","_ang","_radius","_start","_size","_ToP","_Tp","_r2","_Tower","_class","_earlier","_id","_forEachIndex","_p","_type","_rad","_ran","_wallT","_post","_withSpecial","_c","_fsm","_dirr","_ranng","_t","_sizeObj2","_wTm","_sizeObj","_trad","_gArrR","_marT","_ranFT","_di","_rrrr","_arO","_pr"];
//_nul = [screenToWorld [0.5,0.5],"",(150+random 25)] SPAWN CreateRoadBlock;
//"trench_tank1","trench_big1","trench_mortar","trench_mg1","trench_mg2","trench_gun1","trench_single1","trench_small1"
_p = _this select 0;
if (surfaceIsWater _p) exitWith {};
_type = _this select 1;
_rad = _this select 2;
sleep (random 5);
_pickedPosses = [];
_withSpecial = false;
if (random 1 < 0.3) then {_withSpecial = true;};
_ff = {
private ["_cc","_class","_pos","_dir","_id"];
_class = _this select 1;
_pos = _this select 2;
_dir = _this select 3;
_cc = _this select 0;
_id = "N"+(format["%1",_cc]);
[[_class,_pos, _dir, (surfaceNormal _pos),_id]]
};
_ffS = {
private ["_cc","_class","_pos","_dir","_id"];
_class = _this select 1;
_pos = _this select 2;
_dir = _this select 3;
_cc = _this select 0;
_id = "NS"+(format["%1",_cc]);
[[_class,_pos, _dir, [0,0,1],_id]]
};
_gunP = [];
_wallD = [];
_wallDS = [];
//Land_fort_bagfence_long Land_fort_rampart
_ran = ["Land_Shoot_House_Wall_Long_F","Land_HBarrier_5_F","Land_Mil_WallBig_4m_F","Land_CncWall4_F","Land_CncWall4_F","Land_HBarrierWall6_F","Land_BagFence_Long_F","Land_BagFence_Long_F","Land_HBarrier_3_F","Land_HBarrierBig_F","Land_HBarrierWall4_F"] call RETURNRANDOM;
if (!isNil"IFENABLED") then {_ran = ["Land_fort_bagfence_long","land_lib_wire_2","land_lib_wire_2","Land_fort_rampart","Land_fort_bagfence_long","Land_fort_bagfence_long","Land_Mil_WallBig_4m_F","Land_BagFence_Long_F","Land_BagFence_Long_F"] call RETURNRANDOM;};
_wallT = if (count _this > 3 && {!(_this select 3 in ["","NATO","Green"])}) then {_this select 3} else {_ran};
_R = + _p;
if (_type == "RoadB" && {count (_p nearroads 20) > 0}) then {_R = getposATL ((_p nearroads 20) select 0);}; 
_walls = [];
if (_type == "Line") then {
_dir = _this select 4;
_cen = [(_p select 0)+(sin _dir)*_rad,(_p select 1)+(cos _dir)*_rad,0];
_corner2 = [(_cen select 0)+(sin (_dir+90))*_rad*4,(_cen select 1)+(cos (_dir+90))*_rad*4,0];
_corner1 = [(_cen select 0)+(sin (_dir+90))*_rad*(-4),(_cen select 1)+(cos (_dir+90))*_rad*(-4),0];
_d = [_corner1 ,_corner2,_ran,0,0] CALL (missionnamespace getvariable "FUNKTIO_DrawFenceCV");
_walls append (_d select 0);
_wallD append (_d select 2);
} else {
if (random 1 < 0.4 || {true}) then {
_d = ([_R,_rad,_wallT,"",0] CALL FUNKTIO_DrawBoxV);
_wallD append (_d select 1);
_c = count _wallD - 1;
_c = floor (random _c);
_deAT = _wallD deleteAt _c;
//_datAr = _datAr + [[_objectType,_start, _ddd, (surfaceNormal _start),_id]]; AOKADDGUNGENERATED
{if (_x select 0 == "Land_BagBunker_Small_F") then {_gunP pushback _x;};} foreach _wallD;
_walls append (_d select 0);
{_pickedPosses pushback (_x select 1);} foreach (_d select 2);
{_pickedPosses pushback (getPosWorld _x);} foreach (_d select 0);
} else {
_fsm = [_R,_rad,_wallT,"",0] execFSM "DrawCircleV.fsm";
waitUntil {sleep 1;count (_fsm getFSMVariable "_ww") > 0};
_d = + (_fsm getFSMVariable "_ww");
_walls append (_d select 0);
_wallD append (_d select 1);
{_pickedPosses pushback (_x select 1);} foreach (_d select 2);
{_pickedPosses pushback (getPosWorld _x);} foreach (_d select 0);
_fsm setFSMVariable ["_ww", []];
};
};
_trad = _rad * 0.4;
while {_trad > 40} do {
_d = ([_R,_trad,_wallT,"",0] CALL FUNKTIO_DrawBoxV);
_wallD append (_d select 1);
_c = count _wallD - 1;
_c = floor (random _c);
_deAT = _wallD deleteAt _c;
//_datAr = _datAr + [[_objectType,_start, _ddd, (surfaceNormal _start),_id]]; AOKADDGUNGENERATED
{if (_x select 0 == "Land_BagBunker_Small_F") then {_gunP pushback _x;};} foreach _wallD;
_walls = _walls + (_d select 0);
{_pickedPosses pushback (_x select 1);} foreach (_d select 2);
{_pickedPosses pushback (getPosWorld _x);} foreach (_d select 0);
_trad = _trad * 0.4;
sleep 0.2;
};

//Land_Dome_Big_F Land_Dome_Small_F  Land_Medevac_HQ_V1_F Land_Medevac_house_V1_F Land_Device_assembled_F Land_Device_disassembled_F 

_r2 = 5;
_Tp = [(_R select 0),(_R select 1),-0.2];
while {count (_Tp nearroads 12) > 0} do {_Tp = [(_R select 0)+_r2 - (random _r2)*2,(_R select 1)+_r2 - (random _r2)*2,0];sleep 0.1;_r2 = _r2 + 5;sleep 0.1;};
_ran = ["Land_Cargo_Tower_V3_F","Land_Cargo_House_V3_F","Land_Cargo_Patrol_V2_F","Land_Cargo_HQ_V1_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_HBarrierTower_F","Land_BagBunker_Small_F"] call RETURNRANDOM;
if (!isNil"IFENABLED") then {_ran = ["trench_tank1","trench_big1","trench_mortar","trench_mg1","trench_mg2","trench_gun1","trench_single1","trench_small1","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_BagBunker_Small_F"] call RETURNRANDOM;};
_Tower = createVehicle [_ran, _Tp, [], 0, "CAN_COLLIDE"];
_sizeT = (_ran CALL SAOKBSIZE);
_Tower setpos _Tp;
_Tower setdir (random 360);
_pickedPosses pushback _p;
if (_ran in ["Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_HBarrierTower_F"]) then {_Tower setvectorup (surfaceNormal (getPosWorld _Tower));};
_gArrR = [_Tower,""];
if (count _this > 3 && {_this select 3 in ["","NATO","Green"]}) then {_gArrR = [_Tower];};
_gArrR CALL GUARDPOST;
if (_type == "RES") then {_Tower setvariable ["RES",1];};
_Tower allowdamage false;

_post = _Tower;
_post setvariable ["CC",1];
_post setvariable ["StaticW",[]];
_post setvariable ["StaticO",[]];
_post setvariable ["StaticOS",[]];
//
_post setvariable ["NotReady",1];
if (count _this > 3 && {_this select 3 in ["NATO","Green"]}) then {
_marT = _post getvariable "Gmark";
_marT setmarkertext ((_this select 3)+ " basecamp");
if (_this select 3 in ["NATO","Green"]) then {
_p = SAOKMAPSIZE * 0.5;
if ({!isNil{_x getvariable (_this select 3)}} count (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) == 0) then {_post setvariable [(_this select 3),1];};
};
};
sleep 0.1;
//WC and other stuff in circle Land_ToiletBox_F  Land_BarrelWater_F  CamoNet_OPFOR_F _sizeObj = (_ran CALL SAOKBSIZE); {_x distance _start < _sizeObj} count _pickedPosses > 0
_nnn = [1,2,3] call RETURNRANDOM;
_clcl = ["Land_FieldToilet_F","Land_ToiletBox_F"]call RETURNRANDOM;
_sizeObj = (_ran CALL SAOKBSIZE);
if (isNil"IFENABLED") then {
_dirr = random 360;
_ranng = (((_sizeObj*0.5)+random 3));
_radius = _sizeT*0.6 + (random _rad*0.5);
_start = [(_R select 0)+((sin _dirr)*_radius),(_R select 1)+((cos _dirr)*_radius),0];
_RR2 = [(_start select 0)+(sin _dirr)*_ranng,(_start select 1)+(cos _dirr)*_ranng,0];
_d = [_start,_RR2,_clcl,_nnn,(count _wallD),""] CALL FUNKTIO_DrawFenceCV;
_walls append (_d select 0);
_wallD append (_d select 2);
{_pickedPosses pushback (_x select 1);} foreach (_d select 2);
{_pickedPosses pushback (getPosWorld  _x);} foreach (_d select 0);
};
//_fsm setFSMVariable ["_ww", []];
sleep 0.1;
_nnn = [1,2,3] call RETURNRANDOM;
_clcl = ["Land_BarrelWater_F","Land_MetalBarrel_F"]call RETURNRANDOM;
if (!isNil"IFENABLED") then {_clcl = "Land_MetalBarrel_F";};
_sizeObj = (_ran CALL SAOKBSIZE);
_dirr = random 360;
_ranng = 0.5 + random 1;
_radius = _sizeT*0.6 + (random _rad*0.5);
_start = [(_R select 0)+((sin _dirr)*_radius),(_R select 1)+((cos _dirr)*_radius),0];
_RR2 = [(_start select 0)+(sin _dirr)*_ranng,(_start select 1)+(cos _dirr)*_ranng,0];
_d = [_start,_RR2,_clcl,_nnn,(count _wallD),""] CALL FUNKTIO_DrawFenceCV;
_walls append (_d select 0);
_wallD append (_d select 2);
{_pickedPosses pushback (_x select 1);} foreach (_d select 2);
{_pickedPosses pushback (getPosWorld _x);} foreach (_d select 0);
//_fsm setFSMVariable ["_ww", []];

sleep 0.1;
if (random 1 < 0.5) then {
_rrrr = [1,2,3] call RETURNRANDOM;
for "_i" from 0 to _rrrr do {
_Tp = [(_R select 0)+(sin (random 360))*(_sizeT*0.6 + random 10),(_R select 1)+(cos (random 360))*(_sizeT*0.6 + random 10),0];
if (count (_Tp nearroads 12) == 0 && {[_Tp,10] CALL SAOKISFLAT}) then {
_ranFT = ["CamoNet_OPFOR_F","CamoNet_OPFOR_open_F"] call RETURNRANDOM;
_Tower = createVehicle [_ranFT, _Tp, [], 0, "NONE"];
_di = [_Tp,_R] call SAOKDIRT;
_Tower setdir _di;
_earlier = _post getvariable "StaticO";
_id = "N"+(format["%1",count _earlier]);
_pickedPosses pushback _Tp;
_earlier append [[_ranFT,getPosWorld _Tower, _di, (surfaceNormal (getPosWorld  _Tower)),_id]];
_post setvariable ["StaticO",_earlier];
deletevehicle _Tower;
};
};

};
_size = [0,1,2,3] call RETURNRANDOM;
for "_i" from 0 to _size do {
//TABLE OR FIREPLACE with benches
_clcl = ["Land_DieselGroundPowerUnit_01_F","Land_JetEngineStarter_01_F","Land_PaperBox_closed_F","Land_PaperBox_open_empty_F","Land_Pallet_MilBoxes_F","Land_PaperBox_closed_F","Land_CampingTable_small_F","Land_CampingTable_F","Land_Campfire_F","Campfire_burning_F","Land_WoodenLog_F","Land_WoodenTable_large_F","Land_WoodenTable_small_F","Land_Pallets_stack_F"]call RETURNRANDOM;
if (!isNil"IFENABLED") then {_clcl = ["Land_PaperBox_closed_F","Land_PaperBox_open_empty_F","Land_Pallet_MilBoxes_F","Land_PaperBox_closed_F","Land_Campfire_F","Campfire_burning_F","Land_WoodenLog_F","Land_WoodenTable_large_F","Land_WoodenTable_small_F","Land_Pallets_stack_F"]call RETURNRANDOM;};
_ang = random 360;
_radius = _sizeObj*0.7 + (random 5);
_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];
_t = 0;
while {(count (_start nearObjects ["House",2]) > 0 || {surfaceisWater _start} || {count (_start nearObjects ["Static",2]) > 0} || {{_x distance _start < 2} count _pickedPosses > 0}) && {_t < 8}} do {_t = _t + 1;_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];};
_pickedPosses pushback _start;
_size = [0,1,2,3] call RETURNRANDOM;
_ang = random 360;
_ToP = + _start;
//_post _class _pos _dir
_wallD append ([(count _wallD),_clcl,_start,_ang] CALL _ff);


for "_i" from 0 to _size do {
_benc = ["Land_Sleeping_bag_brown_F","Land_Sleeping_bag_brown_folded_F","Land_Bench_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_CampingChair_V1_folded_F","Land_CampingChair_V2_F"] call RETURNRANDOM;
if (!isNil"IFENABLED") then {_benc = ["Land_Bench_F","Land_ChairWood_F"] call RETURNRANDOM;};
_ang = _ang + (30+random 60);
_radius = 1 + (random 1);
_start = [(_ToP select 0)+((sin _ang)*_radius),(_ToP select 1)+((cos _ang)*_radius),0];
_pickedPosses pushback _start;
_wallD append ([(count _wallD),_benc,_start,_ang] CALL _ff);
};
};

if (_withSpecial) then {
_clcl = ["Land_dp_smallTank_F","Land_MilOffices_V1_F","Land_Radar_Small_F","Land_TTowerBig_2_F"]call RETURNRANDOM;
if (!isNil"IFENABLED") then {_clcl = ["Land_dp_smallTank_F","Land_TTowerBig_2_F"]call RETURNRANDOM;};
_ang = random 360;
_radius = 50 + (random 30);
_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];
_t = 0;
_sizeObj2 = (_clcl CALL SAOKBSIZE);
while {(count (_start nearObjects ["House",_sizeObj2]) > 0 || {surfaceisWater _start} || {count (_start nearObjects ["Static",_sizeObj2]) > 0} || {{_x distance _start < _sizeObj2} count _pickedPosses > 0}) && {_t < 8}} do {
_t = _t + 1;
_ang = random 360;
_radius = 100;
_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];
};
if ([_start,_sizeObj2] call SAOKISFLAT) then {
_pickedPosses pushback _start;
if (_t < 8) then {_wallDS append ([(count _wallDS),_clcl,_start,_ang] CALL _ffS);};
};
};
_arO  = [];
if (_rad > 70) then {
if (isNil"IFENABLED") then {
_arO append ["Land_Communication_F","Land_Dome_Big_F","Land_Dome_Small_F","Land_Device_assembled_F","Land_Device_disassembled_F"];
};
};
if (_rad > 50) then {
if (!isNil"IFENABLED") then {
_arO append ["trench_tank1","trench_big1","trench_mortar","trench_mg1","trench_mg2","trench_gun1","trench_single1","trench_small1","Land_TTowerSmall_2_F","Land_TTowerSmall_1_F"];
} else {
_arO append ["Land_Ind_IlluminantTower","Land_Antenna","Land_Tryapka","Fuel_can","land_Staszow_map","Land_TTowerSmall_2_F","Land_TTowerSmall_1_F","Land_Medevac_HQ_V1_F","Land_Medevac_house_V1_F","Land_Device_assembled_F","Land_Device_disassembled_F"];
};
};
if (isNil"IFENABLED") then {
_arO append ["Land_Medevac_house_V1_F","Land_Device_assembled_F","Land_Device_disassembled_F"];
};
_size = count _arO - 1; 
for "_i" from 0 to _size do {
_clcl = _arO select _i;
_ang = random 360;
_radius = 20 + (random _rad);
_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];
_t = 0;
_sizeObj2 = (_clcl CALL SAOKBSIZE);
while {(count (_start nearObjects ["House",_sizeObj2]) > 0 || {surfaceisWater _start} || {count (_start nearObjects ["Static",_sizeObj2]) > 0} || {{_x distance _start < _sizeObj2} count _pickedPosses > 0}) && {_t < 14}} do {
_t = _t + 1;
_ang = random 360;
_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];
sleep 0.01;
};
if ([_start,_sizeObj2] call SAOKISFLAT) then {
_pickedPosses pushback  _start;
if (_t < 14) then {_wallDS append ([(count _wallDS),_clcl,_start,_ang] CALL _ffS);};
};
sleep 0.1;
};

_arO  = [];
if (_rad > 70) then {
if (isNil"IFENABLED") then {
_arO append ["Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_HQ_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_PowerGenerator_F","Land_Loudspeakers_F","Land_FieldToilet_F","Land_Scaffolding_F","Land_CratesWooden_F","Land_CratesWooden_F"];
} else {
_arO append ["trench_tank1","trench_big1","trench_mortar","trench_mg1","trench_mg2","trench_gun1","trench_single1","trench_small1","Land_Ind_IlluminantTower","Land_Antenna","Land_Tryapka","Fuel_can","land_Staszow_map","Land_PowerGenerator_F","Land_Loudspeakers_F","Land_Scaffolding_F","Land_CratesWooden_F","Land_CratesWooden_F"];
};
};
if (_rad > 50) then {
if (isNil"IFENABLED") then {
_arO append ["Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_Cargo_House_V1_F","Land_PowerGenerator_F","Land_Loudspeakers_F","Land_FieldToilet_F","Land_Scaffolding_F","Land_CratesWooden_F","Land_CratesWooden_F"];
} else {
_arO append ["trench_tank1","trench_big1","trench_mortar","trench_mg1","trench_mg2","trench_gun1","trench_single1","trench_small1","Land_Ind_IlluminantTower","Land_Antenna","Land_Tryapka","Fuel_can","land_Staszow_map","Land_PowerGenerator_F","Land_Loudspeakers_F","Land_Scaffolding_F","Land_CratesWooden_F","Land_CratesWooden_F"];
};
};
if (isNil"IFENABLED") then {
_arO append ["Land_Cargo_House_V1_F","Land_PowerGenerator_F","Land_Loudspeakers_F","Land_Sink_F","Land_CampingTable_F","Land_FieldToilet_F","MapBoard_altis_F","Land_CratesWooden_F"];
};
_size = count _arO - 1; 
for "_i" from 0 to _size do {
_clcl = _arO select _i;
_ang = random 360;
_radius = 20 + (random _rad);
_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];
_t = 0;
_sizeObj2 = (_clcl CALL SAOKBSIZE);
while {(count (_start nearObjects ["House",_sizeObj2]) > 0 || {surfaceisWater _start} || {count (_start nearObjects ["Static",_sizeObj2]) > 0} || {{_x distance _start < _sizeObj2} count _pickedPosses > 0}) && {_t < 14}} do {
_t = _t + 1;
_ang = random 360;
_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];
sleep 0.01;
};
if ([_start,_sizeObj2] call SAOKISFLAT) then {
_pickedPosses pushback _start;
if (_t < 14) then {_wallD append ([(count _wallD),_clcl,_start,_ang] CALL _ff);};
};
sleep 0.1;
};


if (isNil"IFENABLED") then {
_size = [0,1,2,3] call RETURNRANDOM;
for "_i" from 0 to _size do {
//RANDOM LAMPS
_clcl = ["Land_PortableLight_single_F","Land_PortableLight_double_F","Land_Camping_Light_F"]call RETURNRANDOM;
_ang = random 360;
_radius = _sizeObj*0.6 + (random 8);
_start = [(_R select 0)+((sin _ang)*_radius),(_R select 1)+((cos _ang)*_radius),0];
_pickedPosses pushback _start;
_wallD append ([(count _wallD),_clcl,_start,_ang] CALL _ff);
};

_r2 = _rad * 0.5;
if (_type == "RoadB") then {
_Tp = [(_R select 0)+_r2 - (random _rad),(_R select 1)+_r2 - (random _rad),-0.2];
while {count (_Tp nearroads 12) > 0 || {_x distance _Tp < 15} count _walls > 0} do {_Tp = [(_R select 0)+_r2 - (random _rad),(_R select 1)+_r2 - (random _rad),-0.2];sleep 0.1;_r2 = _r2 + 5 + _rad * 0.5;};
_Tower = createVehicle ["Land_Cargo_House_V1_F", _Tp, [], 0, "NONE"];
_Tower setdir (random 360);
_class = typeof _Tower;
_earlier = _post getvariable "StaticO";
_id = "N"+(format["%1",count _earlier]);
_pickedPosses pushback _Tp;
_earlier append [[_class,getPosWorld  _Tower, direction _Tower, (surfaceNormal (getPosWorld  _Tower)),_id]];
_post setvariable ["StaticO",_earlier];
deletevehicle _Tower;
};
};

for "_i" from 0 to 1 do {
_Tp = [(_R select 0)+(sin (random 360))*(_rad+10),(_R select 1)+(cos (random 360))*(_rad+10),0];
if (count (_Tp nearroads 12) == 0 && {{_x distance _Tp < 15} count _walls == 0} && {[_Tp,10] CALL SAOKISFLAT}) then {
_ranFT = ["Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_HBarrierTower_F","Land_BagBunker_Small_F"] call RETURNRANDOM;
if (!isNil"IFENABLED") then {_ranFT = ["trench_tank1","trench_big1","trench_mortar","trench_mg1","trench_mg2","trench_gun1","trench_single1","trench_small1","Land_fort_artillery_nest_EP1","land_lib_bunker_gun_l","land_lib_bunker_mg","Land_Ind_IlluminantTower","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_BagBunker_Small_F"] call RETURNRANDOM;};
_Tower = createVehicle [_ranFT, _Tp, [], 0, "NONE"];
_di = [_Tp,_R] call SAOKDIRT;
_Tower setdir _di;
_class = typeof _Tower;
_earlier = _post getvariable "StaticO";
_id = "N"+(format["%1",count _earlier]);
_pickedPosses pushback _Tp;
_earlier append [[_class,getPosWorld  _Tower, direction _Tower, (surfaceNormal (getPosWorld  _Tower)),_id]];
_post setvariable ["StaticO",_earlier];
deletevehicle _Tower;
};
};

{
_r2 = _rad * 0.5;
_Tp = [(_R select 0)+_r2 - (random _rad),(_R select 1)+_r2 - (random _rad),-0.2];
while {count (_Tp nearroads 12) > 0 || {{_x distance _Tp < 3} count _pickedPosses > 0} || {_Tp distance _R < _sizeObj*0.8}} do {_Tp = [(_R select 0)+_r2 - (random _rad),(_R select 1)+_r2 - (random _rad),-0.2];sleep 0.1;_r2 = _r2 + 5 + _rad * 0.5;};
_wallD append ([(count _wallD),_x,_Tp,(random 360)] CALL _ff);
} foreach ["Land_TentA_F","Land_TentA_F","Land_TentA_F","Land_TentA_F"];

{if (isNil"_x" || {isNull _x}) exitWith {_deAT = _walls deleteAt _forEachIndex;_x spawn SAOKDELETE;};} foreach _walls;

_earlier = _post getvariable "StaticO";
_earlier append _wallD;
_post setvariable ["StaticO",_earlier];
_earlier = _post getvariable "StaticOS";
_earlier append _wallDS;
_post setvariable ["StaticOS",_earlier];

{
_class = typeof _x;
_earlier = _post getvariable "StaticO";
_id = "N"+(format["%1",count _earlier]);
_p = getPosWorld _x;
_earlier append [[_class,_p, direction _x, (surfaceNormal (getPosWorld _x)),_id]];
_post setvariable ["StaticO",_earlier];
_x spawn SAOKDELETE;
} foreach _walls;

_ran = ["AA-Guard","AT-Guard"] call RETURNRANDOM;
{
_post setvariable [_x,1];
} foreach ["MG-Guard",_ran,"Sniper-Guard","Medic-Guard"];
_pr = 0.5;
if (_rad > 70) then {_pr = 0.3;};
if (_rad > 100) then {_pr = 0.2;};
if (_rad > 120) then {_pr = 0.1;};
{if (random 1 < _pr) then {[_x select 1, _x select 2] CALL SAOKADDGUNGENERATED;};} foreach _gunP;
_post setvariable ["NotReady",nil];
sleep 10;
if (player distance _post < (["Lb"] CALL DIS)) then {sleep 1;_post CALL SAOKCONSRESETOBJ;};

