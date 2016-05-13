private ["_nul","_n","_id","_Pstill","_veAR"];
MISSION_ROOT = call {
	private ["_arr"];
	_arr = toArray str missionConfigFile;
	_arr resize (count _arr - 15);
	toString _arr
};
LEGD = 0;
TeDam = 1;
NOTASKNOTI = true;
SAOKDIEWISH = 0;
SAOKTTTEE = [];
SAOKTASKTEE = [];
SAOKHINTTEE = [];
SAOKPIPM = 0;
SAOKPIPP = ["LeftShoulder",0];
CARRYZONES = [];
NOMORDERED = [];
ARTYZONES = [];
ZONETOMOVE = [];
WAITSTOMOVE = [];
activatedPost = [];
SAOKFSI = 0.025;
GOODBUILDING = [];
BADBUILDING = [];
CLEANNUM = 0;
LCON1 = [];
TEST_MODE = false;
//SaOkNoAnimals = true;
CapturedAll = 0;
NOMOVEZONES = [];
DONTSTOREZONES = [];
SAOKDYNTASKS = [["SAOKENDT"],["maintasks\captureofficer.sqf"],["SAOKPIERT"]]; 
UNITSTOSUR = [];
SZONES = [];
TIMMUL = 1;
SAOKMAPSIZE = 30000;
SaOK_factories = 0;
SaOK_power = 0;
SaOK_pier = 0;
SaOK_stor = 0;
FRIENDC5 = [];
RESERVEZONE = [];
RESERVEAMARKS = [];
MAXACTIVEV = 2;
ACTIVEZ = [];
PSHOT = 0;
if (productVersion select 2 > 132) then {
	_n = [] execVM "SlingFuncs.sqf";
};

RETURNRANDOM = compile preprocessfileLineNumbers "ReturnRandom.sqf";
missionnamespace setvariable ["CurrentEvents", []];
missionnamespace setvariable ["LastVeh", objNull];
missionnamespace setvariable ["SaOkChapters", []];
missionnamespace setvariable ["ComingChapters",[]];
CONSVEHCLAS = ["O_Truck_03_covered_F","O_Truck_03_transport_F","LIB_SdKfz_7","LIB_opelblitz_open_y_camo","LIB_opelblitz_tent_y_camo","Lib_sdkfz251","Lib_SdKfz251_captuRed","lib_us6_tent","lib_us6_open","lib_zis5v","LIB_Scout_m3","LIB_US_GMC_Tent","LIB_US_GMC_Open","LIB_US_Scout_m3","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_MRAP_03_F","I_Heli_Transport_02_F","B_APC_Tracked_01_rcws_F","I_APC_Wheeled_03_cannon_F","B_APC_Wheeled_01_cannon_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_MRAP_01_F","B_Truck_01_covered_F","B_Truck_01_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","B_Truck_01_box_F","B_Truck_01_Repair_F","C_Van_01_transport_F","I_G_Van_01_transport_F","B_G_Van_01_transport_F"];
ISLANDPOSES = [[8457.1,25040.6,0],[14496.5,5928.24,0],[14512.3,6251.7,0],[13392,11876.9,0],[13565.5,12160.9,0],[16603,13573.1,0],[14262.3,13465.3,0],[13860.4,13479,0],[2363.48,9385.24,0],[2226.24,11565.4,0],[2410.57,11550,0],[7856.18,7621.15,0]];
if (worldname != "Altis") then {ISLANDPOSES = [];};
FACTORYLOCATIONS = [];
IEDNUM = 0;
FACRES = 0;
GUARDLIM = true;
VEHARRAY = compile preprocessfileLineNumbers "VehClasses.sqf";
IDNUM = 0;
BVEHI = [];
RBLOCATIONS = [];
FORBITTENCEN = [];
GUIcode = compilefinal preprocessfileLineNumbers "GUIcode.sqf";
_id = addMissionEventHandler ["loaded",{_n = [] SPAWN GUIcode;}];
_n = [] SPAWN GUIcode;
_nul = [] SPAWN compile preprocessfileLineNumbers "Sentences.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "SaOkShopInit.sqf";
call compile preprocessfileLineNumbers "TaskEvents.sqf";
call compile preprocessfileLineNumbers "TaskEvents2.sqf";
call compile preprocessfileLineNumbers "FactoryCreation.sqf";
call compile preprocessfileLineNumbers "SharedFuncs.sqf";
call compile preprocessfileLineNumbers "SharedFuncs2.sqf";
call compile preprocessfileLineNumbers "SharedFuncs3.sqf";
call compile preprocessfileLineNumbers "SharedFuncs4.sqf";
call compile preprocessfileLineNumbers "ConstructFuncs.sqf";
call compile preprocessfileLineNumbers "SaOkGearSaving.sqf";
call compile preprocessfileLineNumbers "SaOkGearInit.sqf";
call compile preprocessfileLineNumbers "SaOkAddOnInit.sqf";
call compile preprocessfileLineNumbers "LightEditorFuncs.sqf";
call compile preprocessfileLineNumbers "LightFuncs.sqf";
call compile preprocessfileLineNumbers "FrontLineFuncs.sqf";
call compile preprocessfileLineNumbers "CustomMapSettings.sqf"; 
call compile preprocessfileLineNumbers "CrateDialog.sqf";

[] SPAWN SAOKDEPOTORCALL;
[player,"PlaV", "JinVoices\sounds.bikb", ""] CALL SAOKKBTOPIC;
FUNKTIO_POS=compile preprocessfileLineNumbers "findPos.sqf";
F_SaOkGearCam = compile preprocessfileLineNumbers "SaOkGearCam.sqf";
ICONCOLOR = (configfile >> "cfgmarkercolors" >> "ColorWhite" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORCIV = (configfile >> "cfgmarkercolors" >> "ColorPink" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORBLUE = (configfile >> "cfgmarkercolors" >> "ColorBlue" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORRED = (configfile >> "cfgmarkercolors" >> "ColorRed" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORGREEN = (configfile >> "cfgmarkercolors" >> "ColorGreen" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORORANGE = (configfile >> "cfgmarkercolors" >> "ColorOrange" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORORANGE set [3,0.5];
ICONCOLORBLUE set [3,0.5];
ICONCOLORGREEN set [3,0.5];
ICONCOLORRED set [3,0.5];
ICONCOLORCIV set [3,0.5];
ICONCOLOR set [3,0.5];
IC3D = true;
CUSARRAY = [];
NUMM=0;
SaOkVehicleData = [];
CurTaskS = [];
pisteet = 0;
ALLWalls = [];
VEHZONESA = [];
UndAttackMs = [];
VisitedCamps = [];
CUTSCNS = [];
AlreadyDone = [];
SAOKobjcB = ["Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_PortableLight_double_F","Land_PortableLight_single_F","Land_CampingChair_V2_F","Land_CampingChair_V1_folded_F","Land_CampingChair_V1_F","Land_CratesPlastic_F","Land_CratesShabby_F","Land_CratesWooden_F","Land_Sack_F","Land_Sacks_heap_F","Land_Sacks_goods_F","Land_Bricks_V2_F","Land_Bricks_V2_F","Land_Bricks_V3_F","Land_Bricks_V4_F","Land_Basket_F","Land_Cages_F","Land_WaterBarrel_F","Land_BarrelWater_grey_F","Land_BarrelWater_F","Land_BarrelTrash_F","Land_BarrelTrash_grey_F","Land_BarrelSand_grey_F","Land_BarrelSand_F","Land_BarrelEmpty_grey_F","Land_BarrelEmpty_F","Land_MetalBarrel_empty_F","MetalBarrel_burning_F","Land_MetalBarrel_F","Land_CrabCages_F","Land_Wrench_F","Land_WorkStand_F","Land_WoodenBox_F","Land_WheelCart_F","Land_Meter3m_F","Land_Pallets_stack_F","Land_Screwdriver_V1_F","Land_Screwdriver_V2_F","Land_Saw_F","Land_Portable_generator_F","Land_Pliers_F","Land_Pallet_vertical_F","Land_Pallet_F","Land_MultiMeter_F","Land_Hammer_F","Land_Grinder_F","Land_FloodLight_F","Land_CinderBlocks_F","Land_WoodenTable_small_F","Land_WoodenTable_large_F","Land_MapBoard_F","Land_ShelvesWooden_khaki_F","Land_ShelvesWooden_blue_F","Land_ShelvesWooden_F","Land_ShelvesMetal_F","Land_Rack_F","Land_Metal_wooden_rack_F","Land_Metal_rack_Tall_F","Land_Metal_rack_F","Land_Icebox_F","Land_TableDesk_F","Land_ChairWood_F","Land_ChairPlastic_F","Land_CashDesk_F","Land_Bench_F","Land_MetalWire_F","Land_LuggageHeap_01_F","Land_LuggageHeap_03_F","Land_Laptop_unfolded_F","Land_Laptop_F","Land_HeatPack_F","Land_HandyCam_F"];
DISVAR = 1000;
DIS = compile preprocessfileLineNumbers "DIS.sqf";
HITEMDIS =40;
RANDOMTIP = "Call Support - SHIFT + 1";
CreateCusObjT = compile preprocessfileLineNumbers "CreateCustomPost.sqf";
CreatePrison = compile preprocessfileLineNumbers "CreatePrison.sqf";
GearToRandom=compile preprocessfileLineNumbers "GearToRandom.sqf";
GEARunitselection=compile preprocessfileLineNumbers "GEARunitselection.sqf";
PlayerStill=compile preprocessfileLineNumbers "PlayerStill.sqf";
VehLife=compile preprocessfileLineNumbers "VehLife.sqf";
MIlunitsAICAMP= [];
VEHZONES = [];
//0 US, 1 HOSTILE, 2 GREEK, 3 LOCAL
MORTARAR = [["B_Mortar_01_F"],["O_Mortar_01_F"],["I_Mortar_01_F"],["B_G_Mortar_01_F"]];

ARTYAR = [["B_MBT_01_arty_F","B_MBT_01_mlrs_F"],["O_MBT_02_arty_F"],["B_MBT_01_arty_F"],["B_MBT_01_arty_F"]];

ARMEDVEHICLES = [
["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_CRV_F","B_UGV_01_rcws_F"],
["O_APC_Wheeled_02_rcws_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"],
["I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_Wheeled_03_cannon_F","I_UGV_01_rcws_F"],
["I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"]
];

ARMEDTANKS = [
["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"],
["O_MBT_02_cannon_F"],
["I_MBT_03_cannon_F"],
["I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"]
];

ARMEDAA = [
["B_APC_Tracked_01_AA_F"],
["O_APC_Tracked_02_AA_F"],
["I_APC_tracked_03_cannon_F"],
["I_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F"]
];

ARMEDCARRIER = [
["B_Truck_01_transport_F","B_Truck_01_covered_F","B_G_Offroad_01_F","B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"],
["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_Truck_03_covered_F","O_Truck_03_transport_F","O_Truck_02_covered_F","O_Truck_02_transport_F"],
["I_Truck_02_covered_F","I_Truck_02_transport_F","I_G_Offroad_01_armed_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F"],
["B_G_Van_01_transport_F","B_G_Offroad_01_F","I_G_Van_01_transport_F","I_G_Offroad_01_armed_F","I_G_Offroad_01_F"]
];

ARMEDSTATIC = [
["B_static_AT_F","B_static_AA_F","B_HMG_01_F","B_HMG_01_high_F","B_GMG_01_F","B_GMG_01_high_F"],
["O_static_AT_F","O_static_AA_F","O_HMG_01_F","O_HMG_01_high_F","O_GMG_01_F","O_GMG_01_high_F"],
["I_static_AT_F","I_static_AA_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_F","I_GMG_01_high_F"],
["I_static_AT_F","I_static_AA_F","I_HMG_01_F","I_HMG_01_high_F","I_GMG_01_F","I_GMG_01_high_F"]
];

ARMEDSUPPORT = [
["B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_Truck_01_Repair_F"],
["O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_fuel_F","O_Truck_02_Ammo_F","O_Truck_03_repair_F","O_Truck_03_medical_F","O_Truck_03_fuel_F","O_Truck_03_ammo_F"],
["I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F","I_Truck_02_Ammo_F"]
];

CIVVEH = ["C_Van_01_fuel_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"];

AIRFIGTHER = [
["B_UAV_02_CAS_F","B_Plane_CAS_01_F"],
["O_UAV_02_F","O_Plane_CAS_02_F"],
["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"],
["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"]
];

AIRARMCHOP = [
["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"],
["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Heli_Light_02_F"],
["I_Heli_light_03_F"],
["I_Heli_light_03_F"]
];
AIRCARRIERCHOP = [
["B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F"],
["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_covered_F","O_Heli_Light_02_v2_F","O_Heli_Transport_04_covered_F"],
["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"],
["I_Heli_light_03_unarmed_F"]
];

CRATECLAS = [
["Box_NATO_Ammo_F","Box_NATO_Wps_F","Box_NATO_Grenades_F","Box_NATO_WpsLaunch_F","Box_NATO_AmmoOrd_F","Box_NATO_WpsSpecial_F"]
,["Box_East_Grenades_F","Box_East_AmmoOrd_F","Box_East_Ammo_F","Box_East_WpsSpecial_F","Box_East_Wps_F"]
,["Box_IND_Ammo_F","Box_IND_Wps_F","Box_IND_Grenades_F","Box_IND_WpsLaunch_F","Box_IND_AmmoOrd_F","Box_IND_WpsSpecial_F"]
,["Box_FIA_Ammo_F","Box_FIA_Wps_F","Box_FIA_Support_F"]
];

SAOKFPS = 0;
SUPF = 1;
if (isNil"AMBbattles") then {AMBbattles = [];};
FacOwnP = [];
FacMarkers = ["Fac6","Fac5","Fac4","Fac3","Fac2","Fac1"];

{_x setMarkerShape "ICON";_x setmarkertype "u_installation";_x setmarkersize [0.7,0.7];} foreach FacMarkers;
PowMarkers = ["Power3","Power2","Power1"];
{_x setMarkerShape "ICON";_x setmarkertype "loc_Power";_x setmarkersize [0.7,0.7];} foreach PowMarkers;
StoOwnP = [];
StoMarkers = ["Storage1"];
{_x setMarkerShape "ICON";_x setmarkertype "n_service";_x setmarkersize [0.7,0.7];} foreach StoMarkers;
PierMarkers = ["Pier13","Pier12","Pier11","Pier10","Pier9","Pier8","Pier7","Pier6","Pier4","Pier3","Pier2","Pier1"];
{_x setMarkerShape "ICON";_x setmarkertype "loc_Quay";_x setmarkersize [0.7,0.7];} foreach PierMarkers;

_boatinspos = [[2825.56,24074.4,0],[5618.7,24394.6,0],[10788,24970.3,0],[15326.4,25505.1,0],[18535.6,23706,0],[20772.4,25894.1,0],[25801.4,27368.2,0],[30306.7,23543.9,0],[27504,16078.6,0],[24989.4,11625.7,0],[25198.9,5499.71,0],[19986.4,3143.21,0],[14642.8,4872.01,0],[7910.96,5081.56,0],[5134.41,8172.44,0],[1021.97,10687.1,0],[1493.46,16135.4,0],[602.867,21321.8,0],[13961.8,10608.5,0]];

AIRFIELDLOCATIONS = ["AirC","AirC_1","AirC_2","AirC_3","AirC_4","AirC_5"];
{_x setMarkerColor "ColorOrange";_x setMarkerType "Empty";_x setMarkerShape "ICON";_x setmarkertype "u_installation";_x setmarkersize [0.7,0.7]; _x setmarkertext " Airfield";} foreach AIRFIELDLOCATIONS;

_isWater = true;
_openH = true;
if (worldname != "Altis") then {
	waitUntil {sleep 0.1;!isNil"SAOKMAPDATA"};
	_dat = (worldname CALL SAOKMAPDATA); 
	_isWater = (_dat select 6);
	_k = [];
	{
		if (count FacMarkers >= _foreachIndex) then {
			_k set [count _k, (FacMarkers select _foreachIndex)];(FacMarkers select _foreachIndex) setmarkerpos _x;
			_vil = createLocation ["NameLocal", [(_x select 0), (_x select 1)-3, 0], 100, 100];
			_vil setText "factory";
		} else {[_x,"Fac",""] CALL SAOKCREATESTPOINT;};
	} foreach (_dat select 0);
	{if !(_x in _k) then {FacMarkers = FacMarkers - [_x];deletemarker _x;};} foreach FacMarkers;
	_k = [];
	{
		if (count StoMarkers >= _foreachIndex) then {_k set [count _k, (StoMarkers select _foreachIndex)];(StoMarkers select _foreachIndex) setmarkerpos _x;} else {[_x,"Sto",""] CALL SAOKCREATESTPOINT;};
	} foreach (_dat select 1);
	{if !(_x in _k) then {StoMarkers = StoMarkers - [_x];deletemarker _x;};} foreach StoMarkers;
	_k = [];
	{
		if (count PierMarkers >= _foreachIndex) then {_k set [count _k, (PierMarkers select _foreachIndex)];(PierMarkers select _foreachIndex) setmarkerpos _x;};
	} foreach (_dat select 2);
	{if !(_x in _k) then {PierMarkers = PierMarkers - [_x];deletemarker _x;};} foreach PierMarkers;
	if !(_isWater) then {{_x setmarkertype "loc_BusStop";} foreach PierMarkers;};
	_k = [];
	{
		if (count PowMarkers >= _foreachIndex) then {_k set [count _k, (PowMarkers select _foreachIndex)];(PowMarkers select _foreachIndex) setmarkerpos _x;};
	} foreach (_dat select 3);
	{if !(_x in _k) then {PowMarkers = PowMarkers - [_x];deletemarker _x;};} foreach PowMarkers;
	_k = [];
	{
		if (count AIRFIELDLOCATIONS >= _foreachIndex) then {_k set [count _k, (AIRFIELDLOCATIONS select _foreachIndex)];(AIRFIELDLOCATIONS select _foreachIndex) setmarkerpos _x;};
	} foreach (_dat select 4);
	{if !(_x in _k) then {AIRFIELDLOCATIONS = AIRFIELDLOCATIONS - [_x];deletemarker _x;};} foreach AIRFIELDLOCATIONS;
	_boatinspos = (_dat select 5);
	SAOKMAPSIZE = (_dat select 7);
	_openH = (_dat select 8);
};

SAOKls = [];
SAOKrs = [];
SAOKps = [];
VariSelectedUnit = player;
FPlayerFist = compile preprocessfileLineNumbers "PlayerFist.sqf";
FCRB2 = compile preprocessfileLineNumbers "CreateRoadBlock2.sqf";
FCRB2b = compile preprocessfileLineNumbers "CreateRoadBlock2b.sqf";
FUnitSay = compile preprocessfileLineNumbers "UnitSay.sqf";
FSaOkSave = compile preprocessfileLineNumbers "SaOkSave.sqf";
CTreward = compile preprocessfileLineNumbers "CTreward.sqf";
FLoadCrate = compile preprocessfileLineNumbers "LoadCrate.sqf";
CVZ = compile preprocessfileLineNumbers "CreateVehZones.sqf";
CVZC = compile preprocessfileLineNumbers "CreateVehZonesC.sqf";
F_GREENROADBLOCK = compile preprocessfileLineNumbers "CreateRoadBlock2F.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AllWeapons.sqf";
missionnamespace setvariable ["Progress",[]];
[] SPAWN {
	{if (text _x == "factory") then {FACTORYLOCATIONS set [count FACTORYLOCATIONS,_x];};} foreach (nearestLocations [getPosATL player, ["NameLocal"], 20000]);
};
//{_x setmarkersize [200,200];} foreach ["AirC","AirC_1","AirC_2","AirC_3","AirC_4","AirC_5"];//b_service
InitFuncs = compile preprocessfileLineNumbers "InitFuncs.sqf";
StealOrTake = compile preprocessfileLineNumbers "StealOrTake.sqf";
SAVECRATE=compile preprocessfileLineNumbers "SaveCrate.sqf";
IGPOS=compile preprocessfileLineNumbers "IgPos.sqf";
MusicP=compile preprocessfileLineNumbers "MusicP.sqf";
FastTravelDialog = compileFinal preprocessfileLineNumbers "FastTravelDialog.sqf";
[] SPAWN compile preprocessfileLineNumbers "ArtyDialog.sqf";
DELGUARDPOST = compileFinal preprocessfileLineNumbers "DelGuardPost.sqf";

TASK_VilPOWs = compileFinal preprocessfileLineNumbers "VillageTasks\TaskVilPOWs.sqf";
TASK_AirTask1 = compileFinal preprocessfileLineNumbers "MainTasks\AirTask1.sqf";
TASK_Bobcat = compileFinal preprocessfileLineNumbers "MainTasks\UseBobcat.sqf";
TASK_Convoy = compileFinal preprocessfileLineNumbers "MainTasks\Convoy.sqf";
TASK_ClearZone = compileFinal preprocessfileLineNumbers "MainTasks\ClearZone.sqf";
TASK_GreenAirZonesArrive = compileFinal preprocessfileLineNumbers "MainTasks\GreenAirZonesArrive.sqf";
TASK_GreenZonesArrive = compileFinal preprocessfileLineNumbers "MainTasks\GreenZonesArrive.sqf";
TASK_BlueZonesArrive = compileFinal preprocessfileLineNumbers "MainTasks\BlueZonesArrive.sqf";
TaskBlackList = [];

F_CorrectCar = compileFinal preprocessfileLineNumbers "CorrectCar.sqf";
F_AIArtyVirtual = compileFinal preprocessfileLineNumbers "AIArtyVirtual.sqf";
F_AirHome = compileFinal preprocessfileLineNumbers "AirHome.sqf";
F_OrdersDialog = compileFinal preprocessfileLineNumbers "OrdersDialog.sqf";
CBIRDS = 0;
SpawnGroupCustom = compileFinal preprocessfileLineNumbers "SpawnGroupCustom.sqf"; 
FUNKTIO_DrawCircleV=compile preprocessfileLineNumbers "DrawCircleV.sqf";
FUNKTIO_DrawFenceV=compile preprocessfileLineNumbers "DrawFenceV.sqf";
FUNKTIO_DrawFenceCV=compile preprocessfileLineNumbers "DrawFenceCV.sqf";
FUNKTIO_DrawBoxV=compile preprocessfileLineNumbers "DrawBoxV.sqf";
FDraw = compile preprocessfileLineNumbers "Draw.sqf";
FDrawBuy = compile preprocessfileLineNumbers "DrawBuy.sqf";
WLADialog = compile preprocessfileLineNumbers "WLADialog.sqf";
RadioF = compile preprocessfileLineNumbers "RadioF.sqf";
IntelMarker = compile preprocessfileLineNumbers "IntelMarker.sqf";
NotBlackListed = compile preprocessfileLineNumbers "NotBlackListed.sqf";
FPSGOOD = compile preprocessfileLineNumbers "FPSGood.sqf";
BirdFunc3 = compile preprocessfileLineNumbers "BirdFunc3.sqf";
BirdFunc2 = compile preprocessfileLineNumbers "BirdFunc2.sqf";
BirdFunc1 = compile preprocessfileLineNumbers "BirdFunc1.sqf";
ScaredBirds=compile preprocessfileLineNumbers "ScaredBirds.sqf";
ScaredBirdsOnce=compile preprocessfileLineNumbers "ScaredBirdsOnce.sqf";
ScaredBirdsTank=compile preprocessfileLineNumbers "ScaredBirdsTank.sqf";
FUNKTIO_SPAWNACTOR=compile preprocessfileLineNumbers "SpawnActor.sqf";
CONSCOST=compile preprocessfileLineNumbers "ConsCost.sqf";
SUPPORTCOST=compile preprocessfileLineNumbers "SupportCost.sqf";
SPAWNVEHICLE=compile preprocessfileLineNumbers "SpawnVehicle.sqf";
NEARESTFACTORY=compile preprocessfileLineNumbers "NearestFactory.sqf";
NEARESTAIRFIELD=compile preprocessfileLineNumbers "NearestAirfield.sqf";
NEARESTGUARDPOST=compile preprocessfileLineNumbers "NearestGuardPost.sqf";
NEARESTLOCATIONNAME=compile preprocessfileLineNumbers "NearestLocationName.sqf";
FrontLineMarkersF=compile preprocessfileLineNumbers "FrontLineMarkers.sqf";
F_LightSpot =compile preprocessfileLineNumbers "LightSpot.sqf";
InfFromHouse =compile preprocessfileLineNumbers "InfFromHouse.sqf";
ConvertToArmedCivilianL =compile preprocessfileLineNumbers "ConvertToArmedCivilianL.sqf";
ConvertToArmedCivilian =compile preprocessfileLineNumbers "ConvertToArmedCivilian.sqf";
FMusic =compile preprocessfileLineNumbers "Music.sqf";
FDefendCounterAttack =compile preprocessfileLineNumbers "MainTasks\DefendCounterAttack.sqf";
FDefendFactory =compile preprocessfileLineNumbers "MainTasks\DefendFactory.sqf";
FDefendSupply =compile preprocessfileLineNumbers "MainTasks\DefendSupply.sqf";
FAttackRandom =compile preprocessfileLineNumbers "MainTasks\AttackRandom.sqf";
FDefendRandom =compile preprocessfileLineNumbers "MainTasks\DefendRandom.sqf";
FDefendBeach =compile preprocessfileLineNumbers "MainTasks\DefendBeach.sqf";
FHaloJump =compile preprocessfileLineNumbers "HaloJump.sqf";
FLandTransportToPatrol =compile preprocessfileLineNumbers "LandTransportToPatrol.sqf";
FAlarmEvents =compile preprocessfileLineNumbers "AlarmEvents.sqf";
FSupportDrop =compile preprocessfileLineNumbers "SupportDrop.sqf";
FCarAlarmLights =compile preprocessfileLineNumbers "CarAlarmLights.sqf";
FWreckOnRoad =compile preprocessfileLineNumbers "WreckOnRoad.sqf";
FSlowChopperSupport =compile preprocessfileLineNumbers "SlowChopperSupport.sqf";
FSlowChopperSupportE =compile preprocessfileLineNumbers "SlowChopperSupportE.sqf";
FSlowChopperSupportF =compile preprocessfileLineNumbers "SlowChopperSupportF.sqf";
FConsUndo =compile preprocessfileLineNumbers "ConsUndo.sqf";
FConversationDialog =compile preprocessfileLineNumbers "ConversationDialog.sqf";
FConversationDialogSol =compile preprocessfileLineNumbers "ConversationDialogSol.sqf";
FConversationDialogSur =compile preprocessfileLineNumbers "ConversationDialogSur.sqf";
FMoveHCs =compile preprocessfileLineNumbers "MoveHCs.sqf";
FCIVCASULTIE =compile preprocessfileLineNumbers "CIVCASULTIE.sqf";
FENEMYCASULTIE =compile preprocessfileLineNumbers "ENEMYCASULTIE.sqf";
FSmokeSignal =compile preprocessfileLineNumbers "SmokeSignal.sqf";
FvehicleStucked2 =compile preprocessfileLineNumbers "vehicleStucked2.sqf";
FJumpOffCar =compile preprocessfileLineNumbers "JumpOffCar.sqf";
FJumpOff =compile preprocessfileLineNumbers "JumpOff.sqf";
FSideTasks =compile preprocessfileLineNumbers "SideTasks.sqf";
FBuyVehicle =compile preprocessfileLineNumbers "BuyVehicle.sqf";
FBuyMen =compile preprocessfileLineNumbers "BuyMen.sqf";
FCreateOrReturnHC =compile preprocessfileLineNumbers "CreateOrReturnHC.sqf";
FHideAndDelete =compile preprocessfileLineNumbers "HideAndDelete.sqf";
FMoveAndDelete =compile preprocessfileLineNumbers "MoveAndDelete.sqf";
FMoveAndDeleteE =compile preprocessfileLineNumbers "MoveAndDeleteE.sqf";
ToggleW =compile preprocessfileLineNumbers "CivPToggleW.sqf";
CivPlayer =compile preprocessfileLineNumbers "CivPlayer.sqf";
FMoveAwayAndGetDeleted =compile preprocessfileLineNumbers "MoveAwayAndGetDeleted.sqf";
FSmokeAr =compile preprocessfileLineNumbers "SmokeAr.sqf";
FPlayerDamage =compile preprocessfileLineNumbers "PlayerDamage.sqf";
FAirSupport =compile preprocessfileLineNumbers "AirSupport.sqf";
FLandSupport =compile preprocessfileLineNumbers "LandSupport.sqf";
FGearSupport =compile preprocessfileLineNumbers "GearSupport.sqf";
FDiversions =compile preprocessfileLineNumbers "Diversions.sqf";
FSupport =compile preprocessfileLineNumbers "Support.sqf";
FAmbientScoutCar =compile preprocessfileLineNumbers "AmbientScoutCar.sqf";
FTrashCan =compile preprocessfileLineNumbers "TrashCan.sqf";
FTrashCan2 =compile preprocessfileLineNumbers "TrashCan2.sqf";
FClone =compile preprocessfileLineNumbers "Clone.sqf";
FChopperTransportP =compile preprocessfileLineNumbers "ChopperTransportP.sqf";

AddVehicleZone = compile preprocessfileLineNumbers "AddVehicleZone.sqf";
LightsDialog = compile preprocessfileLineNumbers "LightsDialog.sqf";
VehicleArrival = compile preprocessfileLineNumbers "VehicleArrival.sqf";
VehicleArrivalA = compile preprocessfileLineNumbers "VehicleArrivalA.sqf";
POWcell = compile preprocessfileLineNumbers "POWcell.sqf";
AnimCivChair = compile preprocessfileLineNumbers "AnimCivChair.sqf";
AnimCivBed = compile preprocessfileLineNumbers "AnimCivBed.sqf";
F_IED = compile preprocessfileLineNumbers "IED.sqf";
F_IEDmil = compile preprocessfileLineNumbers "IEDmil.sqf";
FORTRESSESMM = [];
CantCommand = [];

[TEST_MODE,_boatinspos] SPAWN {
	private ["_nul","_start","_rad","_pPos","_c","_array","_pos","_building","_waypoints","_lahin","_someId","_boatinspos","_BoatDir","_obj","_u","_p","_st","_r","_v","_n","_ra","_startC","_ChopDir","_chop"];
	_boatinspos = _this select 1;
	_pPos =getposATL (vehicle player);
	_start = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
	while {surfaceIsWater _start || {{_start distance _x < 800} count ISLANDPOSES > 0}} do {
		_start = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
	};
	"StartPoint" setmarkerpos _start;
	if (count _boatinspos > 0) then {"StartPointSea" setmarkerpos (_boatinspos call RETURNRANDOM);} else {"StartPointSea" setmarkerpos [0,0,0];};
	_boatinspos = nil;
	waitUntil {sleep 1; !isNil"StartMission" && {isNil"SAOKRESUMEINPROG"}};
	_start = getmarkerpos "StartPoint";
	deletemarker "StartPoint";
	_startSea = getmarkerpos "StartPointSea";
	deletemarker "StartPointSea";
	[["WLA","StarterTips"]] call BIS_fnc_advHint;
	if ("MetResContact" in (missionnamespace getvariable "Progress")) then {_nul = ["task2","SUCCEEDED",false] call SAOKCOTASK;};
	//HINT GUIDANCE StarterTips
	[] SPAWN {
		scriptName "HINT GUIDANCE";
		sleep 300; 
		[["WLA","CustomSaveGame"]] call BIS_fnc_advHint;
		sleep 320+(random 220); 
		[["WLA","Prestige"]] call BIS_fnc_advHint;
		sleep 320+(random 220); 
		[["WLA","OptionalTasks"]] call BIS_fnc_advHint;
		sleep 320+(random 220); 
		[["WLA","Surrendering"]] call BIS_fnc_advHint;
	};
	if (_this select 0) exitWith {SAbing = true;};
	if (!isNil"PlayerPos") then {
		_pPos = PlayerPos;
		_rad = 3000;
		while {surfaceiswater PlayerPos} do {PlayerPos = [(_pPos select 0)+ _rad -(random _rad)*2,(_pPos select 1)+_rad -(random _rad)*2,0];_rad = _rad + 1000;};
		_start = [PlayerPos select 0,PlayerPos select 1,0];
		//PlayerPos=nil;
	};

	{
		vehicle _x setpos _start;
		_x SPAWN {sleep 2; if (vehicle _this == _this) then {_this switchmove "";};};
	} foreach units group player;
	if (!isNil"CIVMODE" || {(!isNil"PlayerPos")} || {(!isNil"SAOKRESUME")}) exitWith {
		if (!isNil"CIVMODE") then {
			_building = nearestbuilding _start;
			_waypoints = _building call SAOKBUILDINGPOS;
			if (count _waypoints > 0) then {
				_pos = _building buildingPos (_waypoints call RETURNRANDOM);
				player setpos _pos;
			} else {
				player setpos _start;
			};
			SAbing = true;
		};
		SAbing = true;
		sleep 15;
		_lahin = [0,0,0];
		{
			if (player distance position _x < player distance _lahin) then {_lahin = position _x;};
		} foreach (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 9000]); 
		_lahin = [_lahin select 0,_lahin select 1,0];
		if !(["task2"] call BIS_fnc_taskCompleted) then {
			//NUMM=NUMM+1;
			//"\A3\ui_f\data\map\markers\nato\c_unknown.paa"
			//_someId = format ["IDSAOK%1",NUMM];
			//[_someId, "onEachFrame", {
			//if (isNil"IC3D") exitWith {};
			//drawIcon3D ["\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa", ICONCOLORCIV, _this, 0.9, 0.9, 0, (format ["Speak with ANY Civilian: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
			//}, _lahin] call BIS_fnc_addStackedEventHandler;
			["task2",_lahin] CALL BIS_fnc_taskSetDestination;	// Added for 1.58
			["task2"] call BIS_fnc_taskSetCurrent;
			//_someId SPAWN {
			//waitUntil {sleep 1; ["task2"] call BIS_fnc_taskCompleted};
			//[_this, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			//};
			[player,player, "PlaV", "V2"]SPAWN SAOKKBTELL;
			[((name player)+": Okay, where is the closest village? We need to find the locals to find out what's happening here."),7] SPAWN SAOKTITLETEXT;
			sleep 5;
			//"Following the task waypoint isnt often mandatory" SPAWN HINTSAOK;
		};
	};
	SAbing = true;
	if (isNil"InsT" || {InsT == "BOAT"}) then {
		// Boat insertion
		_ra = ["B_Boat_Armed_01_minigun_F", "B_G_Boat_Transport_01_F"];
		_raBoat = _ra call RETURNRANDOM;
		_BoatDir = [_startSea, getmarkerpos "Fac4"] call SAOKDIRT;
		_obj = createVehicle [_raBoat,_startSea, [], 0, "CAN_COLLIDE"];
		_obj setdir _BoatDir;
		_u = (units group player) - [player];
		//_p = _u call RETURNRANDOM;
		//_u = _u - [_p];
		//_p moveincommander _obj;
		//_p = _u call RETURNRANDOM;
		//_u = _u - [_p];
		//_p moveingunner _obj;
		player moveindriver _obj;
		{_x moveInAny _obj;} foreach _u;
		SAbing = true;
		sleep 60;
		"Insertion" SPAWN SAOKCHAPTERADD;
		[player,player, "PlaV", "V1"]SPAWN SAOKKBTELL;
		[((name player)+": Get ready, boys. Make sure you stay alert, anything can happen and don't get cocky just because we have a Gunship team helping us to secure the LZ."),10] SPAWN SAOKTITLETEXT;
		waitUntil {sleep 5; vehicle player == player && {!surfaceisWater getposATL player} && {{vehicle player distance _x < 200} count ISLANDPOSES == 0}};
		sleep 30;
		_star = [getposATL player,250,200,"(1 + sea)"] CALL SAOKSEEKPOS;
		while {surfaceisWater _star} do {
			sleep 10;
			_star = [getposATL player,250,200,"(1 + sea)"] CALL SAOKSEEKPOS;
		};
		[["WLA","Construct"]] call BIS_fnc_advHint;
		_v = ["JinN48","JinN49"]call RETURNRANDOM;
		_n = [
		[getposATL player, player, player],
		[],
		[
		[[[player], "Truck with constructing gear should be dropped for us at any moment.",8],[player,player, "PlaV", _v]]
		]
		] SPAWN SAOKCUTSCENE;
		waitUntil {sleep 1; scriptdone _n};
		_start = [vehicle player, 50,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
		_r = ["I_G_Van_01_transport_F"] call RETURNRANDOM;
		if (!isNil"IFENABLED") then {_r = ["Lib_sdkfz251"] call RETURNRANDOM;};
		_nul = [_start,_r] SPAWN FSupportDrop;
		sleep 30;
		_lahin = [0,0,0];
		{
			if (player distance position _x < player distance _lahin) then {_lahin = position _x;};
		} foreach (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 9000]); 
		_lahin = [_lahin select 0,_lahin select 1,0];
		if !(["task2"] call BIS_fnc_taskCompleted) then {
			//NUMM=NUMM+1;
			//_someId = format ["IDSAOK%1",NUMM];
			//[_someId, "onEachFrame", {
			//if (isNil"IC3D") exitWith {};
			//drawIcon3D ["\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Speak with ANY Civilian: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
			//}, _lahin] call BIS_fnc_addStackedEventHandler;
			["task2",_lahin] CALL BIS_fnc_taskSetDestination;	// Added for 1.58
			["task2"] call BIS_fnc_taskSetCurrent;
			//_someId SPAWN {
			//waitUntil {sleep 1; ["task2"] call BIS_fnc_taskCompleted};
			//[_this, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			//};
			[player,player, "PlaV", "V2"]SPAWN SAOKKBTELL;
			[((name player)+": Okay, where is the closest village? We need to find the locals to find out what's happening here."),7] SPAWN SAOKTITLETEXT;
			sleep 5;
			//"Following the task waypoint isnt often mandatory"  SPAWN HINTSAOK;
		};
	} else {
		//Chopper
		_chop = [0,0,0];
		if (isNil"IFENABLED") then {
			_startC = [(_start select 0)+2000 -(random 4000), (_start select 1)+2000 -(random 4000), 50];
			_ra = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Heli_Light_01_F"];
			if (isClass(configFile >> "cfgVehicles" >> "I_Heli_light_03_F")) then {_ra = _ra + ["I_Heli_light_03_F","I_Heli_light_03_unarmed_F"];};
			if (!isNil"Eridanus") then {_ra = ["TEI_Pelican_unarmed_tan","TEI_Pelican_unarmed_green","TEI_Pelican_unarmed_black"];};
			if ((!isNil"RHSENABLED") && (isNil"SPECOPSENABLED")) then {_ra = ["RHS_UH60M_d","RHS_UH60M","RHS_CH_47F_light","RHS_CH_47F"];};
			if (!isNil"SPECOPSENABLED") then {_ra = ["B_mas_it_CH_47F","B_mas_it_Heli_light_03_F","B_mas_it_Heli_Transport_02_F","B_mas_it_Heli_light_03_unarmed_F","B_mas_it_Heli_Light_01_F"];};
			if (!isNil"CheConf") then {_ra = ["B_mas_cer_MI8"];};
			_ra = _ra call RETURNRANDOM;
			_ChopDir = [_startC, _start] call SAOKDIRT;
			_chop = [_startC, _ChopDir, _ra, WEST] call SPAWNVEHICLE;
			CantCommand set [count CantCommand,_chop select 2];
			(_chop select 0) setcaptive true;
			(_chop select 0) addWeaponCargo ["Rangefinder",1];(_chop select 0) addWeaponCargo ["Laserdesignator",1];(_chop select 0) addmagazineCargo ["Laserbatteries",1];
			{_x moveincargo (_chop select 0);} foreach (units group player);
			SAbing = true;
			{_x allowdamage false;_x setcaptive true;} foreach (units (_chop select 2) + [(_chop select 0)]);
			_start = [_start,350,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
			_max = 0;
			while {((surfaceNormal _start) select 2 < 0.98 || {[_start, _ra] CALL SAOKTAKENBOX}) && {_max < 10}} do {
				sleep 0.2;
				_max = _max + 1;  
				_start = [_start,450,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
			};
		};
		//CHOPPER TRANSPORT
		[(_chop select 2),(_chop select 0),_start] SPAWN {
			private ["_startC","_r","_p","_nul","_lahin","_someId","_start","_pPosi","_ChopDir","_class","_tg1","_posPl","_tg1wp1","_obj","_v","_n"];
			_start = (_this select 2);
			if (isNil"IFENABLED") then {
				(_this select 0) move _start;
				(_this select 0) setbehaviour "CARELESS";
				(_this select 0) allowfleeing 0;
				(_this select 1) flyinheight 50;
				waitUntil {sleep 1; vehicle player distance _start < 700};
			};
			_pPosi = getposATL (vehicle player);
			_startC = [(_pPosi select 0)+2000 -(random 4000), (_pPosi select 1)+2000 -(random 4000), 50];
			while {_startC distance vehicle player < 1000} do {sleep 0.1;_startC = [(_pPosi select 0)+2000 -(random 4000), (_pPosi select 1)+2000 -(random 4000), 50];};
			_ChopDir = [_startC, _start] call SAOKDIRT;
			_class = ["B_Heli_Attack_01_F"];
			if (!isNil"RHSENABLED") then {_class = ["rhs_ah64d_wd","rhs_ah64d"];};
			if (!isNil"IFENABLED") then {_class = ["LIB_P47"];};
			if (!isNil"CheConf") then {_class = ["I_mas_cer_MI24"];};
			_class = _class call RETURNRANDOM;	
			_tg1 = [_startC, _ChopDir, _class, WEST] call SPAWNVEHICLE;
			_posPl = [(_start select 0) + (random 200)-(random 200), (_start select 1)+ (random 200)-(random 200), 0];
			_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
			[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
			[(_tg1 select 2), 1] setWaypointType "GUARD";
			_nul = [(_tg1 select 2), [10048.6,25343.7,0],500] SPAWN FUNKTIO_MAD;
			if (isNil"IFENABLED") then {
				_obj = createVehicle ["Land_HelipadEmpty_F",_start, [], 0, "NONE"]; 
				waitUntil {sleep 1; unitready leader (_this select 1) || {!(player in (_this select 1))}};
				[player,player, "PlaV", "V1"]SPAWN SAOKKBTELL;
				"Insertion" SPAWN SAOKCHAPTERADD;
				[((name player)+": Get ready, boys. Make sure you stay alert, anything can happen and don't get cocky just because we have a Gunship team helping us to secure the LZ."),10] SPAWN SAOKTITLETEXT;
				(_this select 1) land "GET IN";
				waitUntil {sleep 1; (getposATL (_this select 1) select 2) < 6 || {!(player in (_this select 1))}};
				(_this select 1) animateDoor ['door_R', 1]; 
				(_this select 1) animateDoor ['door_L', 1];
				waitUntil {sleep 1; (getposATL (_this select 1) select 2) < 1.5 || {!(player in (_this select 1))}};
				{
					//if (vehicle _x == (_this select 1)) then {  GetOut
					_x action ["Eject",vehicle _x];unassignvehicle _x; _x action ["GetOut",vehicle _x];
					//};
				} foreach units group player;
				sleep 5;
				if ({alive _x && {vehicle _x != _x}} count (units group player) > 0) then {"Dismount your team by pressing 4-1, after selecting the units with F1..F10" SPAWN HINTSAOK;};
				waitUntil {sleep 2; {alive _x && {vehicle _x != _x}} count (units group player) == 0};
				_nul = [(_this select 0),0,0,group player] SPAWN FSlowChopperSupportF;
				sleep 5;
				(_this select 1) animateDoor ['door_R', 0]; 
				(_this select 1) animateDoor ['door_L', 0];
				deletevehicle _obj;
			} else {
				sleep 5;
				"Insertion" SPAWN SAOKCHAPTERADD;
				[((name player)+": Be ready, boys. Make sure you stay alert, anything can happen and don't get cocky just because we have air support helping us to get started."),10] SPAWN SAOKTITLETEXT;
				sleep 5;
			};
			[["WLA","Construct"]] call BIS_fnc_advHint;
			_v = ["JinN48","JinN49"]call RETURNRANDOM;
			_n = [
			[getposATL player, player, player],
			[],
			[
			[[[player], "Truck with constructing gear should be dropped for us at any moment.",8],[player,player, "PlaV", _v]]
			]
			] SPAWN SAOKCUTSCENE;
			waitUntil {sleep 1; scriptdone _n};
			if (DIFLEVEL < 1) then {
				//_nul = [getposATL player,B_MRAP_01_gmg_F"] SPAWN FSupportDrop;
				_r = ["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"] call RETURNRANDOM;
				if (!isNil"IFENABLED") then {_r = ["Lib_sdkfz251"] call RETURNRANDOM;};
				_p = getposATL player;
				_p = [(_p select 0)+50-(random 100),(_p select 1)+50-(random 100),40];
				_nul = [_p,_r] SPAWN FSupportDrop;
				_r = ["I_G_Van_01_transport_F"] call RETURNRANDOM;
				if (!isNil"IFENABLED") then {_r = ["Lib_sdkfz251"] call RETURNRANDOM;};
				_p = getposATL player;
				_p = [(_p select 0)+50-(random 100),(_p select 1)+50-(random 100),40];
				_nul = [_p,_r] SPAWN FSupportDrop;
			} else {
				_r = ["I_G_Van_01_transport_F"] call RETURNRANDOM;
				if (!isNil"IFENABLED") then {_r = ["Lib_sdkfz251"] call RETURNRANDOM;};
				_nul = [getposATL player,_r] SPAWN FSupportDrop;
			};
			sleep 30;
			_lahin = [0,0,0];
			{
				if (player distance position _x < player distance _lahin) then {_lahin = position _x;};
			} foreach (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 9000]); 
			_lahin = [_lahin select 0,_lahin select 1,0];
			if !(["task2"] call BIS_fnc_taskCompleted) then {
				//NUMM=NUMM+1;
				//_someId = format ["IDSAOK%1",NUMM];
				//[_someId, "onEachFrame", {
				//if (isNil"IC3D") exitWith {};
				//drawIcon3D ["\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Speak with ANY Civilian: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
				//}, _lahin] call BIS_fnc_addStackedEventHandler;
				["task2",_lahin] CALL BIS_fnc_taskSetDestination;	// Added for 1.58
				["task2"] call BIS_fnc_taskSetCurrent;
				//_someId SPAWN {
				//waitUntil {sleep 1; ["task2"] call BIS_fnc_taskCompleted};
				//[_this, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				//};
				[player,player, "PlaV", "V2"]SPAWN SAOKKBTELL;
				[((name player)+": Okay, where is the closest village? We need to find the locals to find out what's happening here."),7] SPAWN SAOKTITLETEXT;
				sleep 5;
				//"Following the task waypoint isnt often mandatory"  SPAWN HINTSAOK;
			};
		};
	};


};

STEAMV = true;

SA_BRIE = compile preprocessfileLineNumbers "briefing.sqf";
_nul = [] SPAWN SA_BRIE;
FORTRESSESVAR = [];
F_ambientboat = compile preprocessfileLineNumbers "ambientboat.sqf";
AddWall = compile preprocessfileLineNumbers "AddWall.sqf";
AddFortress = compile preprocessfileLineNumbers "AddFortress.sqf";
SKILLEFFECT  = compile preprocessfileLineNumbers "SkillEffect.sqf";
GUARDPOST = compile preprocessfileLineNumbers "GuardPost.sqf";
RETURNGUARDPOST = compile preprocessfileLineNumbers "ReturnGuardPost.sqf";
LUOKKANIMI = compile preprocessfileLineNumbers "LuokkaNimi.sqf";
KAUPPA = compile preprocessfileLineNumbers "Kauppa.sqf";
KAUPPAVILLAGE = compile preprocessfileLineNumbers "KauppaVillage.sqf";
OSTAMASSA = compile preprocessfileLineNumbers "Ostamassa.sqf";
AmbientScoutCar=compile preprocessfileLineNumbers "AmbientScoutCar.sqf";
EnemySupport=compile preprocessfileLineNumbers "EnemySupport.sqf";
FriendlySupport=compile preprocessfileLineNumbers "FriendlySupport.sqf";
MusicT=compile preprocessfileLineNumbers "Music.sqf";

AICampBehaviour= compile preprocessfileLineNumbers "AICampBehaviourNEW.sqf";


CONVERSATIONWITHCIVILIANS = compile preprocessfileLineNumbers "ConversationWithCivilians.sqf";
CONVERSATIONWITHSOLDIERS = compile preprocessfileLineNumbers "ConversationWithSoldiers.sqf";
CONVERSATIONWITHSURRENDERED = compile preprocessfileLineNumbers "ConversationWithSurrendered.sqf";
SOLDIERSTASKS = compile preprocessfileLineNumbers "MilitaryTasks\SoldierTasks.sqf";
PowInfo = compile preprocessfileLineNumbers "PowInfo\PowInfo.sqf";
REINFSTATE = "Stand By";
PRESTIGECHANGE = compile preprocessfileLineNumbers "PrestigeChange.sqf";

//MORE VILLAGES
if (worldname == "Altis") then {
	[] SPAWN {

		private ["_vil","_p"];
		_vil = createLocation ["NameVillage", [3814.11,11132.7,0], 100, 100];
		_vil setText "Zacharo";
		_vil = createLocation ["NameVillage", [3996.38,12405.4,0], 100, 100];
		_vil setText "Kiparissia";
		_vil = createLocation ["NameVillage", [4731.11,10414.4,0], 100, 100];
		_vil setText "Lalas";
		_vil = createLocation ["NameVillage", [3630.57,14433.3,0], 100, 100];
		_vil setText "Foloi";
		_vil = createLocation ["NameVillage", [4688.75,14197.8,0], 100, 100];
		_vil setText "Krestena";
		_vil = createLocation ["NameVillage", [6088.86,15129.1,0], 100, 100];
		_vil setText "Oleni";
		_vil = createLocation ["NameVillage", [6775.5,15686.8,0], 100, 100];
		_vil setText "Gargaliani";
		_vil = createLocation ["NameVillage", [7754.13,16161.4,0], 100, 100];
		_vil setText "Epitalio";
		_vil = createLocation ["NameVillage", [4330.62,16606.2,0], 100, 100];
		_vil setText "Dafni";
		_vil = createLocation ["NameVillage", [5101.09,16628.5,0], 100, 100];
		_vil setText "Tolo";
		_vil = createLocation ["NameVillage", [3750.54,17823.6,0], 100, 100];
		_vil setText "Limnes";
		_vil = createLocation ["NameVillage", [17292.8,13503.9,0], 100, 100];
		_vil setText "Nemea";

		_p = getmarkerpos "fac5";
		_vil = createLocation ["NameLocal", [(_p select 0), (_p select 1)-3, 0], 100, 100];
		_vil setText "factory";
		_p = getmarkerpos "fac6";
		_vil = createLocation ["NameLocal", [(_p select 0), (_p select 1)-3, 0], 100, 100];
		_vil setText "factory";
	};
};

{
	_x setSkill ["aimingaccuracy", 0.30 + (random 0.4)];
	_x setSkill ["aimingShake", 0.30 + (random 0.4)];
	_x setSkill ["aimingSpeed", 0.30 + (random 0.4)];
	_x setSkill ["spotDistance", 0.20 + (random 0.4)];
	_x setSkill ["spotTime", 0.35 + (random 0.35)];
	_x setSkill ["endurance", 0.35 + (random 0.35)];
	_x setSkill ["courage", 0.35 + (random 0.35)];
	_x setSkill ["reloadSpeed", 0.35 + (random 0.35)];
	_x setSkill ["commanding", 0.15 + (random 0.35)];
	_x setSkill ["general", 0.35 + (random 0.35)];
} foreach units group player - [player];

/*
//UP PAR
_nul = [] spawn {
scriptName "UP PAR";
private ["_s"];
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 7 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};

};
};

//SCORE PAR
_nul = [] spawn {
scriptName "SCORE PAR";
private ["_s"];
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 8 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};

};
};
*/



//NEAR VILLAGE/CAMP INFO [SAOKNEARESTVIL,[],10] call CBA_fnc_benchmarkFunction;
NEARESTPLACE=compile preprocessfileLineNumbers "NearestPlace.sqf";
//SAOKNEARESTVIL=compile preprocessfileLineNumbers "SAOKNEARESTVILOld.sqf";
//SAOKNEARESTVILO=compile preprocessfileLineNumbers "SAOKNEARESTVILOld.sqf";
NEARESTCAMP=compile preprocessfileLineNumbers "NearestCamp.sqf";
SAOKNEARVILRELA=compile preprocessfileLineNumbers "nearestVillageRelationship.sqf";

/*
_nul = [] spawn {
private ["_s"];
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 10 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};
};
};

//CIVILIAN NEAR
_nul = [] spawn {
private ["_s"];
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 9 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};
};
};

//RADAR PAR
_s = 11 SPAWN InitFuncs;
*/


BOATPOSITIONS = ["RII1"];
_nul = [] SPAWN compile preprocessfileLineNumbers "AccTimeAndWeather.sqf";
FUNK_SupportDialog = compile preprocessfileLineNumbers "SupportDialog.sqf";
FUNK_WaitTime = compile preprocessfileLineNumbers "WaitTime.sqf";
FUNK_MinefieldInit = compile preprocessfileLineNumbers "MinefieldInit.sqf";
FUNK_ConstructionDialog = compile preprocessfileLineNumbers "ConstructionDialog.sqf";
FUNKTIO_CIVCASULTIE = compile preprocessfileLineNumbers "CIVCASULTIE.sqf";
FUNKTIO_NATORUS = compile preprocessfileLineNumbers "NatoRusWeapon.sqf";

F_KGSNED = compile preprocessfileLineNumbers "KeepGSpawned.sqf";



//ADDED LOCATIONS

//New variables for EnemyTacticLevel.fsm system
SMOKEAR = [0,0,0];
CHOPAVAIL = true;
Pgroups = [];
CantCommand = [];
HeliGroups = [];
CampGroups = [];

VehicleGroups = [];
AirGroups = [];
NAPAveh = [];
VARCoLoop = true;
GuardTanks =  [];
VarFlush = 0;
FriendlyVehicles=[];
FriendlyAir=[];
FriendlyInf=[];



REINF=true;
AICHAT = true;
CIVIGNORE = [];
//////Other new variables to handle increasing difficulty level/other changing features through mission
//MAX
EVEHMAX = 1;
FVEHMAX = 1;
FINFMAX = 1;

//how many enemy patrols
VarPG = 3;
//how much units in patrol (min and max)
VarPGSize =[3,4];
//enemy use chopper transport
VarTRChop = true;
//enemy send fighters

//vehicle classes that enemy may as slow reinf . "O_MBT_02_arty_F" "O_APC_Tracked_02_AA_F" "O_MBT_02_cannon_F" "O_APC_Tracked_02_AA_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"

//if (isClass(configFile >> "cfgVehicles" >> "PCDF_SU34") ) then {VarVEH = VarVEH + ["PCDF_Offroad_DSHKM_PRSZ","PCDF_Pickup_PK_PRSZ","PCDF_UAZ_PRSZ","PCDF_UAZ_AGS30_PRSZ","PCDF_UAZ_MG_PRSZ","PCDF_UAZ_SPG9_PRSZ"];};
//~Total number of friendly units in random forest camps (reinforcements)
VarReUnits = 5;
//~Total number of enemy units in random camps/towers
VarReEnemies = 7;
//How often enemy uses artillery
VarArty = 0;
//How much NAPA friendly help (10 is full)
VarFS = 6;
//Friendly fighters

//How much CDF friendly help (10 is full)
VarFS2 = 6;
//How much CZ friendly help
VarFS3 = 6;
//Black list for friendly spawn
VarBlackListF = [];
//Enemy resources for vehicles
VarRes = 1;
//Black list for enemy spawn
VarBlackListE = [[3076.26,2145.71,0],[2779.02,1744.79,0],[2432.54,1145.62,0]];
//Guarding civilian hunters
VarCivG = 0.5;
// Do Not Change - Variables
// init.sqf file
DIFLEVEL=1;
MULTLIFE=0;
ENEMYC1 = ["O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_A_F","O_Soldier_AR_F","O_medic_F","O_engineer_F","O_soldier_exp_F","O_Soldier_GL_F","O_soldier_M_F","O_Soldier_AT_F","O_officer_F","O_soldier_repair_F","O_Soldier_F","O_Soldier_LAT_F","O_Soldier_lite_F","O_Soldier_SL_F","O_Soldier_TL_F","O_spotter_F","O_sniper_F"];
ENEMYC2 = ["O_recon_exp_F","O_recon_JTAC_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_TL_F"];
ENEMYC3 = ["O_soldierU_A_F","O_soldierU_AAR_F","O_soldierU_AAT_F","O_soldierU_AR_F","O_soldierU_medic_F","O_engineer_U_F","O_soldierU_exp_F","O_SoldierU_GL_F","O_soldierU_M_F","O_soldierU_AT_F","O_soldierU_repair_F","O_soldierU_LAT_F","O_SoldierU_SL_F","O_soldierU_TL_F"];
FRIENDC1 = ["B_soldier_AAR_F","B_soldier_AAA_F","B_soldier_AAT_F","b_sniper_f","b_spotter_f","B_Soldier_A_F","B_soldier_AR_F","B_medic_F","B_engineer_F","B_soldier_exp_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_AA_F","B_soldier_AT_F","B_soldier_repair_F","B_soldier_repair_F","B_Soldier_F","B_soldier_LAT_F","B_Soldier_lite_F","B_Soldier_SL_F","B_Soldier_TL_F"];
if (isClass(configFile >> "cfgVehicles" >> "AV_IndUs_AR")) then {FRIENDC1 = ["AV_IndUs_medic","AV_IndUs_REP","AV_IndUs_EXP","AV_IndUs_AT","AV_IndUs_Rifleman2","AV_IndUs_Rifleman","AV_IndUs_Rifleman_light","AV_IndUs_SL"];};
FRIENDC2 = ["I_Soldier_AAR_F","I_Soldier_AAA_F","I_Soldier_AAT_F","I_Soldier_A_F","I_Soldier_AR_F","I_medic_F","I_engineer_F","I_Soldier_exp_F","I_Soldier_GL_F","I_Soldier_M_F","I_Soldier_AA_F","I_Soldier_AT_F","I_officer_F","I_Soldier_repair_F","I_soldier_F","I_Soldier_LAT_F","I_Soldier_lite_F","I_Soldier_SL_F","I_Soldier_TL_F","I_Spotter_F","I_Sniper_F"];
FRIENDC3 = ["B_recon_JTAC_F","B_recon_exp_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_recon_TL_F"];
FRIENDC4 = ["I_G_Soldier_A_F","I_G_Soldier_AR_F","I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_officer_F","I_G_Soldier_F","I_G_Soldier_LAT_F","I_G_Soldier_lite_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F"];
CIVS1 = ["C_man_p_fugitive_F_afro","C_man_p_beggar_F_afro","C_man_polo_1_F_afro","C_man_polo_2_F_afro","C_man_polo_3_F_afro","C_man_polo_4_F_afro","C_man_polo_5_F_afro","C_man_polo_6_F_afro","C_man_shorts_1_F_afro","C_man_p_shorts_1_F_afro","C_man_shorts_2_F_afro","C_man_shorts_3_F_afro","C_man_shorts_4_F_afro","C_man_p_beggar_F_asia","C_man_polo_1_F_asia","C_man_polo_2_F_asia","C_man_polo_3_F_asia","C_man_polo_4_F_asia","C_man_polo_5_F_asia","C_man_polo_6_F_asia","C_man_shorts_1_F_asia","C_man_p_fugitive_F_asia","C_man_p_shorts_1_F_asia","C_man_shorts_2_F_asia","C_man_shorts_3_F_asia","C_man_shorts_4_F_asia","C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F","C_Nikos","C_Orestes","C_man_p_beggar_F_euro","C_man_polo_1_F_euro","C_man_polo_2_F_euro","C_man_polo_3_F_euro","C_man_polo_4_F_euro","C_man_polo_5_F_euro","C_man_polo_6_F_euro","C_man_shorts_1_F_euro","C_man_p_fugitive_F_euro","C_man_p_shorts_1_F_euro","C_man_shorts_2_F_euro","C_man_shorts_3_F_euro","C_man_shorts_4_F_euro"];
TABCAR = [0];
MINEUNITS=0;
DONTDELGROUPS = [];
CARS = [];
MINEVAR=false;
MINEC = 100;
FUNKTIO_AmbientCarCIV = compile preprocessfileLineNumbers "AmbientCarCIV.sqf";
FUNKTIO_ECHO = compile preprocessfileLineNumbers "SoundEcho.sqf";
FUNKTIO_LOSOBJ = compile preprocessfileLineNumbers "LOSpos.sqf";
FUNKTIO_IGNORETIMED = compile preprocessfileLineNumbers "IgnoreTimed.sqf";
FUNKTIO_LOS = compile preprocessfileLineNumbers "LOS.sqf";
FUNKTIO_DELUNIT = compile preprocessfileLineNumbers "DeleteUnit.sqf";
FUNKTIO_REINF = compile preprocessfileLineNumbers "ReInfSystem.sqf";
FUNKTIO_VWI = compile preprocessfileLineNumbers "VehWithInf.sqf";
FUNKTIO_IL = compile preprocessfileLineNumbers "InitLoop1.sqf";
FUNKTIO_IL2 = compile preprocessfileLineNumbers "InitLoop2.sqf";
FUNKTIO_IL3 = compile preprocessfileLineNumbers "InitLoop3.sqf";
FUNKTIO_AmbientPatrol = compile preprocessfileLineNumbers "AmbientPatrol.sqf";
FUNKTIO_CREATEMARKER=compile preprocessfileLineNumbers "CreateMarker.sqf";
FUNKTIO_SPAWNACTOR=compile preprocessfileLineNumbers "SpawnActor.sqf";
FUNKTIO_WAD=compile preprocessfileLineNumbers "WaitAndDelete.sqf";
FUNKTIO_USFHR=compile preprocessfileLineNumbers "UseSmokeForHelpRequest.sqf";
FUNKTIO_AISMOKE=compile preprocessfileLineNumbers "AIsmoke.sqf";
FUNKTIO_AIFLARE=compile preprocessfileLineNumbers "AIflare.sqf";
FUNKTIO_VS=compile preprocessfileLineNumbers "vehicleStucked.sqf";
FUNKTIO_GM2=compile preprocessfileLineNumbers "GroupMarker2.sqf";
FUNKTIO_GM=compile preprocessfileLineNumbers "GroupMarker.sqf";
FUNKTIO_MAD=compile preprocessfileLineNumbers "MoveAndDelete.sqf";
FUNKTIO_MAAGD=compile preprocessfileLineNumbers "MoveAwayAndGetDeleted.sqf";
FUNKTIO_TM=compile preprocessfileLineNumbers "TimedMarker.sqf";
FUNKTIO_CL=compile preprocessfileLineNumbers "ContactLoop.sqf";
FUNKTIO_FOREST=compile preprocessfileLineNumbers "findForest.sqf";
FUNKTIO_FLY=compile preprocessfileLineNumbers "AmbientFlies.sqf";
FUNKTIO_FLY2=compile preprocessfileLineNumbers "AmbientFlies2.sqf";
FUNKTIO_POWRELEASETRY=compile preprocessfileLineNumbers "MainTasks\POWrelease.sqf";
FUNKTIO_POISTAKARRY=compile preprocessfileLineNumbers "CarRemoval.sqf";
FUNKTIO_CROW=compile preprocessfileLineNumbers "Crows.sqf";
FUNKTIO_ANTAUDU=compile preprocessfileLineNumbers "UnitSurrender.sqf"; 
FUNKTIO_POISTANTAUTUNUT=compile preprocessfileLineNumbers "SurrenderedRemoval.sqf"; 
FUNKTIO_FireSmokeEffect=compile preprocessfileLineNumbers "FireSmokeEffect.sqf"; 
FUNKTIO_FLIES=compile preprocessfileLineNumbers "Flies.sqf";
FUNKTIO_ThrowObject2 = compile preprocessfileLineNumbers "ThrowObject2.sqf";
FUNKTIO_BlackListMarkers=compile preprocessfileLineNumbers "BlackListMarkers.sqf";
FUNKTIO_LandTransport=compile preprocessfileLineNumbers "LandTransport.sqf";
FUNKTIO_LandTransportF=compile preprocessfileLineNumbers "LandTransportF.sqf";
FUNKTIO_LandTransportE=compile preprocessfileLineNumbers "LandTransportE.sqf";
FUNKTIO_ChopperTransportF=compile preprocessfileLineNumbers "ChopperTransportF.sqf";
FUNKTIO_ChopperTransport=compile preprocessfileLineNumbers "ChopperTransport.sqf";
FUNKTIO_ChopperTransportPara=compile preprocessfileLineNumbers "ChopperTransportPara.sqf";
Bpositions = [];
player addEventHandler ["FiRed",{[_this select 5,_this select 2] SPAWN FSmokeSignal;}];
// Modify freely - Variables
MAXCARS=5;
CROWCOUNT = [];
FLYCOUNT = [];
// Dont change
VarHoldT = 0;
FUNKTIO_DrawCircle=compile preprocessfileLineNumbers "DrawCircle.sqf";
FUNKTIO_DrawFence=compile preprocessfileLineNumbers "DrawFence.sqf";
FUNKTIO_DrawBox=compile preprocessfileLineNumbers "DrawBox.sqf";
FUNKTIO_Commander=compile preprocessfileLineNumbers "Commander.sqf";
FUNKTIO_AfterLoading=compile preprocessfileLineNumbers "AfterLoading.sqf";
_id = addMissionEventHandler ["loaded",{_n = [] SPAWN FUNKTIO_AfterLoading;}];
_n = [] SPAWN FUNKTIO_AfterLoading;
_nul = [] SPAWN {
	private ["_nyll","_myGroupX"];
	while {true} do {
		sleep 600;
		_nyll = 0;
		{
			if (isNull _x) then
			{	
				_nyll = _nyll + 1;
				_myGroupX = group _x;
				_x removeAllMPEventHandlers "mpkilled";
				_x removeAllMPEventHandlers "mphit";
				_x removeAllMPEventHandlers "mprespawn";
				_x removeAllEventHandlers "FiredNear";
				_x removeAllEventHandlers "HandleDamage";
				_x removeAllEventHandlers "Killed";
				_x removeAllEventHandlers "FiRed";
				_x removeAllEventHandlers "Local";

				deleteVehicle _x;
				deleteGroup _myGroupX;
				_x = nil;
			};
		} forEach allMissionObjects "";
		if (!isNil"debugi") then {hint format ["Null objects removed: %1",_nyll];};
	};
};
IORW = compile preprocessfileLineNumbers "IsOnRunway.sqf";
BattleOdds = compile preprocessfileLineNumbers "BattleOdds.sqf";
BattleVirtualCamp = compile preprocessfileLineNumbers "BattleVirtualCamp.sqf";
BattleVirtualIntel = compile preprocessfileLineNumbers "BattleVirtualIntel.sqf";
ZoneMove = compile preprocessfileLineNumbers "ZoneMove.sqf";
CreateRoadBlock = compile preprocessfileLineNumbers "CreateRoadBlock.sqf";
CreateTemplatePost = compile preprocessfileLineNumbers "CreateTemplatePost.sqf";
CreateDepot = compile preprocessfileLineNumbers "CreateDepot.sqf";
CarAlarm = compile preprocessfileLineNumbers "CarAlarm.sqf";
GuardPostSide = compile preprocessfileLineNumbers "GuardPostSide.sqf";
F_MarkerSelectedZone = compile preprocessfileLineNumbers "MarkerSelectedZone.sqf";
if (_openH) then {_nul = [] SPAWN compile preprocessfileLineNumbers "HouseStuff.sqf";};
_nul = [] SPAWN compile preprocessfileLineNumbers "PlayerEffects.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AIFuncs.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientArmedCivsNEW.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "NearestPlaceMenu.sqf"; 
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientGuardPost.sqf"; 
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientFortress.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "ambientzone.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientWalls.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientRoadBlocks.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AICampBehaviourCivGlobal.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AICampBehaviourMILGlobal.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "BattleVirtualNEW.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "TrashyCar.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientBattles.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientVirtualMove.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "Traffic.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientPersianPrestige.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientHouseEffects.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "ambientcivilians4.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "ambientcivilians5NEW.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "ambientReinforcements.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientCamps.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "EnemyTacticLevel.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "AmbientVehicleZone.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "ambientanimals3.sqf";
_nul = [] SPAWN compile preprocessfileLineNumbers "Events\TimedEvents.sqf";
_n = [] SPAWN compile preprocessfileLineNumbers "AmbientParkedCars.sqf";
_n = [] SPAWN compile preprocessfileLineNumbers "VehicleStorage.sqf";
_n = [] SPAWN compile preprocessfileLineNumbers "ScaredBirdsGroup.sqf";
_n = [] SPAWN compile preprocessfileLineNumbers "CivThrowing.sqf";
_nn = [] SPAWN SAOKHEALMODE;
_nn = [] SPAWN SAOKREAMMODE;
//Body, Ambient Vehicle and emptygroup removal. Also auto rearming near ammotruck if enabled ingame.
[] SPAWN {
	private ["_lva","_c"];
	waitUntil {sleep 1; !isNil"StartMission"};
	sleep 10;
	if (isNil"SAOKRESUME") then {
		_lva = + FacMarkers;
		_c = count _lva - 1;
		for "_i" from 0 to _c do {
			private ["_xx","_d","_st","_start","_nul"];
			_xx = _lva select _i;
			if (random 1 < 0.5 && {_xx != "Fac5"}) then {
				_start = [getmarkerpos _xx, 150,0,"(1 - sea) * (1 + meadow)* (1 - hills)",150] CALL SAOKSEEKPOS;
				_d = 150;
				sleep 0.1;
				while {!([_start,40] CALL SAOKISFLAT)} do {
					_d = _d + 30;
					_start = [getmarkerpos _xx, _d,0,"(1 - sea) * (1 + meadow)* (1 - hills)",150] CALL SAOKSEEKPOS;
					sleep 0.1;
				};
				_nul = [_start,"",(15+random 25)] SPAWN CreateRoadBlock;
			};
		};
	};
};

[] SPAWN compile preprocessfileLineNumbers "MapCommander.sqf";
missionnamespace setvariable ["SStill",[getposATL player, 0]];
_Pstill = {
	private ["_pos","_num"];
	_pos = (missionnamespace getvariable "SStill") select 0;
	_num = (missionnamespace getvariable "SStill") select 1;
	if (player distance _pos < 1000) then {
		missionnamespace setvariable ["SStill",[_pos, (_num+1)]];
	} else {
		missionnamespace setvariable ["SStill",[getposATL player, 0]];
	};
};
///////

if (!isClass(configFile >> "CfgLocationTypes" >> "CampB")) then {
	[] SPAWN {
		while {true} do {
			"MISSION REQUIRES THE LATEST WLA SOUND ADDON VERSION TO PLAY" SPAWN HINTSAOK;
			sleep 6;
			"SUBSCRIBE IT FROM WORKSHOP AND ACTIVATE IN ARMA3 LAUNCHER" SPAWN HINTSAOK;
			sleep 6;
		};
	};
};
_veAR = ["C_Van_01_fuel_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"];
_time = time;
while {true} do {
	if (!isNil{missionnamespace getvariable "Autosave"} && {((missionnamespace getvariable "Autosave")*60+_time) < time}) then {_time = time;savegame;[] SPAWN FSaOkSave;};
	[] SPAWN SAOKTRIGGETCHAP;
	[] SPAWN FUNKTIO_POWRELEASETRY;
	[] CALL _Pstill;
	6 SPAWN InitFuncs;
	2 SPAWN InitFuncs;
	5 SPAWN InitFuncs;
	[] SPAWN FUNKTIO_Commander;
	sleep 5;
	[] SPAWN FUNKTIO_Commander;
	3 SPAWN InitFuncs;
	[] SPAWN FUNKTIO_Commander;
	sleep 5;
	//if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {
	_c = ({_x in (missionnamespace getvariable "Progress")} count ["GreenHelp","USHelp","ResHelp"]) * 0.3;
	if (random 1 < _c) then {
		//CSAT FROM PIERS
		[] SPAWN SAOKMORECSAT;
	};
	6 SPAWN InitFuncs;
	5 SPAWN InitFuncs;
	[] SPAWN FUNKTIO_Commander;
	_nul = [] SPAWN FUNKTIO_IL;
	sleep 5;
	1 SPAWN InitFuncs;
	6 SPAWN InitFuncs;
	[] SPAWN FUNKTIO_Commander;
	sleep 5;
	[] SPAWN FUNKTIO_Commander;
	5 SPAWN InitFuncs;
	if (CBIRDS > 0) then {CBIRDS = CBIRDS - 1;}; 
	sleep 5;
	0 SPAWN InitFuncs;
	sleep 5;
	[] SPAWN FUNKTIO_Commander;
	5 SPAWN InitFuncs;
	{if (isNil{_x getvariable "WithAlarm"} && {typeof _x in _veAR}) then {_nul = [_x] SPAWN CarAlarm;};} foreach ((getposATL vehicle player) nearEntities [["Car"],200]);
	sleep 10;
	[] SPAWN FUNKTIO_Commander;
	6 SPAWN InitFuncs;
	5 SPAWN InitFuncs;
	if (CBIRDS > 0) then {CBIRDS = CBIRDS - 1;}; 
	_nul = [getposATL vehicle player] SPAWN FUNKTIO_BlackListMarkers;
	sleep 5;
	[] SPAWN FUNKTIO_Commander;
	1 SPAWN InitFuncs;
	sleep 5;
	[] SPAWN FUNKTIO_Commander;
	5 SPAWN InitFuncs;
	_nul = [] SPAWN FUNKTIO_IL2;
	sleep 10;
	[] SPAWN FUNKTIO_Commander;
	5 SPAWN InitFuncs;
	if (CBIRDS > 0) then {CBIRDS = CBIRDS - 1;}; 
	sleep 5;
	[] SPAWN FUNKTIO_Commander;
	6 SPAWN InitFuncs;
	1 SPAWN InitFuncs;
	sleep 5;
	[] SPAWN FUNKTIO_Commander;
	5 SPAWN InitFuncs;
	{if (isNil{_x getvariable "WithAlarm"} && {typeof _x in _veAR}) then {_nul = [_x] SPAWN CarAlarm;};} foreach ((getposATL vehicle player) nearEntities [["Car"],200]);
	sleep 10;
	[] SPAWN FUNKTIO_Commander;
	5 SPAWN InitFuncs;
	if (CBIRDS > 0) then {CBIRDS = CBIRDS - 1;}; 
	_nul = [getposATL vehicle player] SPAWN FUNKTIO_BlackListMarkers;
	sleep 5;
	[] SPAWN FUNKTIO_Commander;
	6 SPAWN InitFuncs;
	1 SPAWN InitFuncs;
	[] SPAWN SAOKLAUNCDYNTASK;
	sleep 5;
	RANDOMTIP = ["Yell to make CSAT surrender - U","Use Fist - U","Toggle 3D Icons - Shift+U","(Un)holster pistol (when civilian) - Ctrl+Y.","Change to Civ - Alt+Y","Flip/Unstuck Car - Shift+4","High Command UI - Ctrl + Space","Customize Gear near Camp/Ammo Truck","Pick up items from houses - Y","Call Support - SHIFT + 1","Open Map/Briefing - M","Tasks - J","Rest - Shift + 1","Savegame - SHIFT + 1","Minefield Creating System - Shift + L","Construction View - Shift + C","Toggle Streetlights - Press SHIFT + 7","Steal Car/Take Objects - Y","Load Crates to Truck - SHIFT + 9"] call RETURNRANDOM;
};
