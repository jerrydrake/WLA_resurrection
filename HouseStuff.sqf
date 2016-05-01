private ["_c","_hhh","_oBL","_hBl","_func","_curV","_cT"];
SAOKobjc = ["Land_Trophy_01_bronze_F","Land_Trophy_01_gold_F","Land_Trophy_01_silver_F","Land_Baseball_01_F","Land_Basketball_01_F","Land_Football_01_F","Land_Rugbyball_01_F","Land_Volleyball_01_F","Land_MetalBarrel_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_PortableLight_double_F","Land_PortableLight_single_F","Land_CampingChair_V2_F","Land_CampingChair_V1_folded_F","Land_CampingChair_V1_F","Land_CratesPlastic_F","Land_CratesShabby_F","Land_CratesWooden_F","Land_Sack_F","Land_Sacks_heap_F","Land_Sacks_goods_F","Land_Bricks_V2_F","Land_Bricks_V2_F","Land_Bricks_V3_F","Land_Bricks_V4_F","Land_Basket_F","Land_Cages_F","Land_WaterBarrel_F","Land_BarrelWater_grey_F","Land_BarrelWater_F","Land_BarrelTrash_F","Land_BarrelTrash_grey_F","Land_BarrelSand_grey_F","Land_BarrelSand_F","Land_BarrelEmpty_grey_F","Land_BarrelEmpty_F","Land_MetalBarrel_empty_F","MetalBarrel_burning_F","Land_MetalBarrel_F","Land_Wrench_F","Land_WoodenBox_F","Land_WheelCart_F","Land_Meter3m_F","Land_Pallets_stack_F","Land_Screwdriver_V1_F","Land_Screwdriver_V2_F","Land_Saw_F","Land_Portable_generator_F","Land_Pliers_F","Land_Pallet_vertical_F","Land_Pallet_F","Land_MultiMeter_F","Land_Hammer_F","Land_Grinder_F","Land_Gloves_F","Land_FloodLight_F","Land_File_F","Land_ExtensionCord_F","Land_DustMask_F","Land_CinderBlocks_F","Land_Axe_fire_F","Land_Axe_F","Land_DrillAku_F","Land_WoodenTable_small_F","Land_WoodenTable_large_F","Land_MapBoard_F","Land_ShelvesWooden_khaki_F","Land_ShelvesWooden_blue_F","Land_ShelvesWooden_F","Land_ShelvesMetal_F","Land_Rack_F","Land_Metal_wooden_rack_F","Land_Metal_rack_Tall_F","Land_Metal_rack_F","Land_Icebox_F","Land_TableDesk_F","Land_ChairWood_F","Land_ChairPlastic_F","Land_CashDesk_F","Land_Bench_F","Land_WaterPurificationTablets_F","Land_BottlePlastic_V2_F","Land_VitaminBottle_F","Land_TinContainer_F","Land_TacticalBacon_F","Land_SurvivalRadio_F","Land_Suitcase_F","Land_Map_unfolded_F","Land_Map_F","Land_Shovel_F","Land_SatellitePhone_F","Land_RiceBox_F","Land_PowderedMilk_F","Land_Poster_04_F","Land_BottlePlastic_V1_F","Land_BottlePlastic_V1_F","Land_Money_F","Land_Photos_V6_F","Land_Photos_V5_F","Land_Photos_V4_F","Land_Photos_V3_F","Land_Photos_V1_F","Land_Photos_V1_F","Land_PensAndPencils_F","Land_PencilYellow_F","Land_PencilRed_F","Land_PencilGreen_F","Land_PencilBlue_F","Land_PenRed_F","Land_PenBlack_F","Land_PainKillers_F","Land_Notepad_F","Land_MobilePhone_old_F","Land_MobilePhone_smart_F","Land_MetalWire_F","Land_Map_stratis_F","Land_Map_altis_F","Land_Map_blank_F","Land_Magazine_rifle_F","Land_LuggageHeap_01_F","Land_LuggageHeap_03_F","Land_Laptop_unfolded_F","Land_Laptop_F","Land_HeatPack_F","Land_HandyCam_F","Land_GasCooker_F","Land_GasCanister_F","Land_FMradio_F","Land_FireExtinguisher_F","Land_File2_F","Land_FilePhotos_F","Land_File1_F","Land_DuctTape_F","Land_DisinfectantSpray_F","Land_Defibrillator_F","Land_CerealsBox_F","Land_Canteen_F","Land_CanisterPlastic_F","Land_CanisterOil_F","Land_CanisterFuel_F","Land_CanOpener_F","Land_Can_V1_F","Land_Can_Rusty_F","Land_Can_V3_F","Land_Can_V2_F","Land_Can_Dented_F","Land_ButaneTorch_F","Land_ButaneCanister_F","Land_Bucket_painted_F","Land_Bucket_clean_F","Land_Bucket_F","Land_BloodBag_F","Land_BloodBag_F","Land_Battery_F","Land_Bandage_F","Land_BakedBeans_F","Land_Antibiotic_F","Land_Ammobox_rounds_F"];
Ctalot = [];
//_hBl = ["Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Pier_F","Land_nav_pier_m_F","Land_Cargo_HQ_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_House_V1_F"];
//_oBL = ["Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_Sleeping_bag_F"];
//nearestObjects [player, SAOKobjcB, 2];
//hint format ["Ctalot %1 SaOkHouseD %2 talot %3",count Ctalot,count SaOkHouseD,count talot];
SaOkHouseD = [];

SAOKHDATS = {
private ["_n","_b","_foreachIndex"];
_n = _this select 0;
_b = 0;
{if (_n == _x select 0) exitWith {SaOkHouseD set [_foreachIndex, _this];_b = 1;};} foreach SaOkHouseD;
if (_b == 0) then {SaOkHouseD pushBack _this;};
};
SAOKHDATL = [];
SAOKHDATR = {
private ["_dat","_forEachIndex"];
_dat = "";
if (count SaOkHouseD > 0) then {
{if ((SaOkHouseD select _x) select 0 == _this) exitWith {_dat = (SaOkHouseD select _x) select 1;};} foreach SAOKHDATL;
};
if (typename _dat == "STRING") then {
{if (_this == _x select 0) exitWith {_dat = _x select 1;
SAOKHDATL pushBack _forEachIndex;
if (count SAOKHDATL > 10) then {_deAT = SAOKHDATL deleteAt 0;};
};} foreach SaOkHouseD;
};
if (typename _dat == "STRING") then {_dat = [];};
_dat
};
_func = {
private ["_ddd","_oBL","_hBl","_posB","_obj","_n","_varN","_data","_c","_array","_ran","_Bp","_waypoints","_sizeS","_cT","_objs"];
_cT = _this select 0;
_hBl = ["Land_Cargo_HQ_V1_F","Land_Cargo_Patrol_V2_F","Land_BagBunker_Small_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_HBarrierTower_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_Pier_F","Land_nav_pier_m_F","Land_Cargo_HQ_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_House_V1_F"];
_oBL = ["Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_Sleeping_bag_F"];
if (_cT in Ctalot) exitWith {};
if (random 1 < 0.02) then {
[] SPAWN SAOKANIMALEVENT1;
};
_data = [];
Ctalot pushBack _cT;
//NEW
_objs = [];
_varN = format ["Talo%1",_cT]; 
//_cT = nearestBuilding player;
_ddd = (_varN call SAOKHDATR);
if (_cT in talot && {typename _ddd == "ARRAY"} && {count _ddd > 0}) then {
//NEW PREVIOUSLY VISITED HOUSE  
_data = + _ddd; 
if (typename _data == "ARRAY" && {count _data < 7}) then {
_c = count _data - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _data select _i;
if !((_xx select 0) in _oBL) then {
_posB = _xx select 1;
_obj = createVehicle [_xx select 0,_posB, [], 0, "NONE"]; 
if (_xx select 0 != "Land_MetalBarrel_F") then {[_obj,0] SPAWN VehLife;} else {_n = _obj SPAWN SAOKBARRELBOMBS;};
_obj setvariable ["Bpo",_posB];
_obj setPosWorld _posB;
_obj setvectorup (surfaceNormal (getPosWorld _obj));
_obj setdir (_xx select 2);
_objs pushBack _obj;
} else {
if ((_xx select 0) != "Land_Sleeping_bag_F") then {
_posB = _xx select 1;
_n = [_posB,_cT] CALL AnimCivChair;
(_n select 1) setvariable ["Bpo",_posB];
_objs pushBack (_n select 0);
_objs pushBack (_n select 1);
} else {
_posB = _xx select 1;
_n = [_posB,_cT] CALL AnimCivBed;
if (count _n == 0) exitWith {};
(_n select 1) setvariable ["Bpo",_posB];
_objs pushBack (_n select 0);
_objs pushBack (_n select 1);
};
};
sleep 0.1;
};
};
} else {
//NEW NEVER VISITED HOUSEgetPosWorld _p set [2,(boundingCenter _veh) select 2]; _veh setPosWorld (atltoasl _p);
talot pushBack _cT;
//_varN = format ["Talo%1",_cT];};
_sizeS = [3,4,5,2,1,5,5,5,3,3,3,2,1,1,1,1,1,2,2,2,2,2] call RETURNRANDOM;
_waypoints = _cT call SAOKBUILDINGPOS;
if (!(typeOf _cT in _hBl) && {{[_x, typeOf _cT] call SAOKINSTRING} count ["bunker","tower","cargo","bag","barrier"] == 0}) then {
for "_i" from 0 to _sizeS do {
		if (count _waypoints > 0) then {
		_ran = SAOKobjc call RETURNRANDOM;
		_Bp = (_waypoints call RETURNRANDOM);
		_waypoints = _waypoints - [_Bp];
		_posB = _cT buildingPos _Bp;
		if !(_ran in _oBL) then {
		_obj = createVehicle [_ran,_posB, [], 0, "CAN_COLLIDE"];
		if (_ran != "Land_MetalBarrel_F") then {[_obj,0] SPAWN VehLife;} else {_n = _obj SPAWN SAOKBARRELBOMBS;};
		//_obj setpos _posB;
		_posB set [2,(_posB select 2) + ((boundingCenter _obj) select 2)]; 
		_obj setPosWorld (atltoasl _posB);
		_obj setvariable ["Bpo",(atltoasl _posB)];
		_obj setdir (random 360);
		_obj setvectorup (surfaceNormal (getPosWorld _obj));
		_objs pushBack _obj;
		} else {
		if (_ran != "Land_Sleeping_bag_F") then {
		_n = [_posB,_cT] CALL AnimCivChair;
		(_n select 1) setvariable ["Bpo",_posB];
		_objs pushBack (_n select 0);
		(_n select 0) setvariable ["MunT",(_n select 1)];
		_objs pushBack (_n select 1);
		} else {
		_n = [_posB,_cT] CALL AnimCivBed;
		if (count _n == 0) exitWith {};
		(_n select 1) setvariable ["Bpo",_posB];
		_objs pushBack (_n select 0);
		_objs pushBack (_n select 1);
		};
		};
		};
		sleep 0.1;
};
};
};
waitUntil {sleep 2; player distance _cT > HITEMDIS};
//OLD HOUSE DATA SAVED
_data = [];
_varN = format ["Talo%1",_cT]; 
{if (!isNull _x && {!(typeof _x iskindof "man")}) then {
if (!isNil{_x getvariable "Bpo"}) then {_data pushBack [typeoF _x, (_x getvariable "Bpo"), direction _x];};
_x setvariable ["Bpo",nil];_x spawn SAOKDELETE;} else {
if (!isNil{_x getvariable "CivNo"} || {!(typeof _x iskindof "man")}) then {
_x spawn SAOKDELETE;
} else {
if (!isNil{_x getvariable "MunT"}) then {(_x getvariable "MunT") setvariable ["Bpo",nil];};
};
};sleep 0.01;} foreach _objs;
if (_ct in talot) then {[_varN,_data] call SAOKHDATS;};
//{_x spawn SAOKDELETE;sleep 0.01;} foreach _objs;
//Ctalot = Ctalot - [_ct];
{if (_x == _ct) exitWith {_nn = Ctalot deleteAt _foreachIndex};sleep 0.01;} foreach Ctalot;
};

sleep 5;
//_cT = nearestBuilding player;
talot = [];
while {true} do {
//VILLAGE CHANGED REMOVE OLD VILLAGE HOUSE DATA BIS_fnc_buildingPositions
SaOkHouseD = [];
SAOKHDATL = [];
talot = [];
_curV = [getposATL player] CALL SAOKNEARVILP;
while {_curV distance ([getposATL player] CALL SAOKNEARVILP) < 10} do {
waitUntil {sleep 2;vehicle player == player};
_hhh = (nearestObjects [player, ["house"], HITEMDIS]);
_c = count _hhh - 1;
for "_i" from 0 to _c do {
if (!((_hhh select _i) in Ctalot) && {!isNull (_hhh select _i)}) then {
_bol = true;
if (typeof (_hhh select _i) in BADBUILDING) then {_bol = false;} else {
if !((_hhh select _i) CALL SAOKISBUILDING) then {BADBUILDING pushback (typeof (_hhh select _i));_bol = false;};
};
if (_bol) then {
[_hhh select _i] SPAWN _func; 
};
};
sleep 0.1;
};
sleep 0.5;
};
};
