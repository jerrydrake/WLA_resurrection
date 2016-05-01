private ["_nul","_n","_id","_MAPCLICK"];
TEST_MODE = false;
BVEHI = [];
RBLOCATIONS = [];
FORBITTENCEN = [];
call compile preprocessfileLineNumbers "SaOkGearInit.sqf";
//CUTSCNS = ["Cutscenes\Cut1_Arty.sqf"];
//MISSION_ROOT = format ["mpmissions\__CUR_MP.%1\", worldName];
//"\A3\ui_f\data\map\mapcontrol\Rock_CA.paa"icon = "\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling3_CA.paa"; TahomaB
//ICONCOLOR = [0.684,0.692,0.808,0.7];
//ICONCOLORCIV = [0.772,0.212,0.528,0.7];
player kbAddTopic ["PlaV", "JinVoices\sounds.bikb", ""];
ICONCOLOR = (configfile >> "cfgmarkercolors" >> "ColorWhite" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORCIV = (configfile >> "cfgmarkercolors" >> "ColorPink" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORBLUE = (configfile >> "cfgmarkercolors" >> "ColorBlue" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORRED = (configfile >> "cfgmarkercolors" >> "ColorRed" >> "Color") call bis_fnc_colorConfigToRGBA;
ICONCOLORGREEN = (configfile >> "cfgmarkercolors" >> "ColorGreen" >> "Color") call bis_fnc_colorConfigToRGBA;
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
GUARDLIM = true;
SAOKobjcB = ["Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F","Land_PortableLight_double_F","Land_PortableLight_single_F","Land_CampingChair_V2_F","Land_CampingChair_V1_folded_F","Land_CampingChair_V1_F","Land_CratesPlastic_F","Land_CratesShabby_F","Land_CratesWooden_F","Land_Sack_F","Land_Sacks_heap_F","Land_Sacks_goods_F","Land_Bricks_V2_F","Land_Bricks_V2_F","Land_Bricks_V3_F","Land_Bricks_V4_F","Land_Basket_F","Land_Cages_F","Land_WaterBarrel_F","Land_BarrelWater_grey_F","Land_BarrelWater_F","Land_BarrelTrash_F","Land_BarrelTrash_grey_F","Land_BarrelSand_grey_F","Land_BarrelSand_F","Land_BarrelEmpty_grey_F","Land_BarrelEmpty_F","Land_MetalBarrel_empty_F","MetalBarrel_burning_F","Land_MetalBarrel_F","Land_CrabCages_F","Land_Wrench_F","Land_WorkStand_F","Land_WoodenBox_F","Land_WheelCart_F","Land_Meter3m_F","Land_Pallets_stack_F","Land_Screwdriver_V1_F","Land_Screwdriver_V2_F","Land_Saw_F","Land_Portable_generator_F","Land_Pliers_F","Land_Pallet_vertical_F","Land_Pallet_F","Land_MultiMeter_F","Land_Hammer_F","Land_Grinder_F","Land_FloodLight_F","Land_CinderBlocks_F","Land_WoodenTable_small_F","Land_WoodenTable_large_F","Land_MapBoard_F","Land_ShelvesWooden_khaki_F","Land_ShelvesWooden_blue_F","Land_ShelvesWooden_F","Land_ShelvesMetal_F","Land_Rack_F","Land_Metal_wooden_rack_F","Land_Metal_rack_Tall_F","Land_Metal_rack_F","Land_Icebox_F","Land_TableDesk_F","Land_ChairWood_F","Land_ChairPlastic_F","Land_CashDesk_F","Land_Bench_F","Land_MetalWire_F","Land_LuggageHeap_01_F","Land_LuggageHeap_03_F","Land_Laptop_unfolded_F","Land_Laptop_F","Land_HeatPack_F","Land_HandyCam_F"];
DISVAR = 1000;
DIS = compile preprocessfileLineNumbers "DIS.sqf";
HITEMDIS = 50;
RANDOMTIP = "Call Support - SHIFT + 1";
CreatePrison = compile preprocessfileLineNumbers "CreatePrison.sqf";
GearToRandom=compile preprocessfileLineNumbers "GearToRandom.sqf";
VASunitselection=compile preprocessfileLineNumbers "VASunitselection.sqf";
PlayerStill=compile preprocessfileLineNumbers "PlayerStill.sqf";
MIlunitsAICAMP= [];
VEHZONES = [];
//0 US, 1 HOSTILE, 2 GREEK, 3 LOCAL
ARMEDVEHICLES = [
["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_CRV_F"],
["O_APC_Wheeled_02_rcws_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"],
["I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_Wheeled_03_cannon_F"],
["I_G_Offroad_01_armed_F"]
];

ARMEDTANKS = [
["B_MBT_01_cannon_F"],
["O_MBT_02_cannon_F"],
["I_MBT_03_cannon_F"],
["I_G_Offroad_01_armed_F"]
];

ARMEDAA = [
["B_APC_Tracked_01_AA_F"],
["O_APC_Tracked_02_AA_F"],
["I_APC_tracked_03_cannon_F"],
["I_G_Offroad_01_armed_F"]
];

SAOKFPS = 0;
SUPF = 1;
AMBbattles = [];
FacMarkers = ["Fac6","Fac5","Fac4","Fac3","Fac2","Fac1"];
{_x setMarkerShape "ICON";_x setmarkertype "u_installation";_x setmarkersize [0.7,0.7];} foreach FacMarkers;
PowMarkers = ["Power3","Power2","Power1"];
{_x setMarkerShape "ICON";_x setmarkertype "loc_Power";_x setmarkersize [0.7,0.7];} foreach PowMarkers;
StoMarkers = ["Storage1"];
{_x setMarkerShape "ICON";_x setmarkertype "n_service";_x setmarkersize [0.7,0.7];} foreach StoMarkers;
PierMarkers = ["Pier13","Pier12","Pier11","Pier10","Pier9","Pier8","Pier7","Pier6","Pier4","Pier3","Pier2","Pier1"];
{_x setMarkerShape "ICON";_x setmarkertype "loc_Quay";_x setmarkersize [0.7,0.7];} foreach PierMarkers;
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
F_AllWeapons = compile preprocessfileLineNumbers "AllWeapons.sqf";
FLoadCrate = compile preprocessfileLineNumbers "LoadCrate.sqf";
CVZ = compile preprocessfileLineNumbers "CreateVehZones.sqf";
_nul = [] SPAWN F_AllWeapons;
missionnamespace setvariable ["Progress",[]];
[] SPAWN {
FACTORYLOCATIONS = [];
{if (text _x == "factory") then {FACTORYLOCATIONS set [count FACTORYLOCATIONS,_x];};} foreach (nearestLocations [getPosATL player, ["NameLocal"], 20000]);
};
//{_x setmarkersize [200,200];} foreach ["AirC","AirC_1","AirC_2","AirC_3","AirC_4","AirC_5"];
AIRFIELDLOCATIONS = ["AirC","AirC_1","AirC_2","AirC_3","AirC_4","AirC_5"];
{_x setMarkerColor "ColorOrange";_x setMarkerType "Empty";_x setMarkerShape "ICON";_x setmarkertype "u_installation";_x setmarkersize [0.7,0.7];} foreach AIRFIELDLOCATIONS;
//b_service
InitFuncs = compile preprocessfileLineNumbers "InitFuncs.sqf";
StealOrTake = compile preprocessfileLineNumbers "StealOrTake.sqf";
SAVECRATE=compile preprocessfileLineNumbers "SaveCrate.sqf";
IGPOS=compile preprocessfileLineNumbers "IgPos.sqf";
MusicP=compile preprocessfileLineNumbers "MusicP.sqf";
FastTravelDialog = compileFinal preprocessfileLineNumbers "FastTravelDialog.sqf";
DELGUARDPOST = compileFinal preprocessfileLineNumbers "DelGuardPost.sqf";
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
FUNKTIO_POS=compile preprocessfileLineNumbers "findPos.sqf";
RETURNRANDOM = compile preprocessfileLineNumbers "ReturnRandom.sqf";
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
FCrateDialog =compile preprocessfileLineNumbers "CrateDialog.sqf";
FMoveHCs =compile preprocessfileLineNumbers "MoveHCs.sqf";
FCIVCASULTIE =compile preprocessfileLineNumbers "CIVCASULTIE.sqf";
FENEMYCASULTIE =compile preprocessfileLineNumbers "ENEMYCASULTIE.sqf";
FSmokeSignal =compile preprocessfileLineNumbers "SmokeSignal.sqf";
FvehicleStucked2 =compile preprocessfileLineNumbers "vehicleStucked2.sqf";
FJumpOffCar =compile preprocessfileLineNumbers "JumpOffCar.sqf";
FJumpOff =compile preprocessfileLineNumbers "JumpOff.sqf";
FAmbientBattles =compile preprocessfileLineNumbers "AmbientBattles.sqf";
FAmbientRoadBlocks =compile preprocessfileLineNumbers "AmbientRoadBlocks.sqf";
FSideTasks =compile preprocessfileLineNumbers "SideTasks.sqf";
FBuyVehicle =compile preprocessfileLineNumbers "BuyVehicle.sqf";
FBuyMen =compile preprocessfileLineNumbers "BuyMen.sqf";
FHideAndDelete =compile preprocessfileLineNumbers "HideAndDelete.sqf";
FMoveAndDelete =compile preprocessfileLineNumbers "MoveAndDelete.sqf";
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
AmbientVehicleZone = compile preprocessfileLineNumbers "AmbientVehicleZone.sqf";
LightsDialog = compile preprocessfileLineNumbers "LightsDialog.sqf";
VehicleArrival = compile preprocessfileLineNumbers "VehicleArrival.sqf";
POWcell = compile preprocessfileLineNumbers "POWcell.sqf";
AnimCivChair = compile preprocessfileLineNumbers "AnimCivChair.sqf";
AnimCivBed = compile preprocessfileLineNumbers "AnimCivBed.sqf";
F_IED = compile preprocessfileLineNumbers "IED.sqf";
AmbientCiv = [];
AmbientZones = [];
AmbientCivN = [];
AmbientZonesN = [];
FORTRESSESMM = [];
CantCommand = [];
[TEST_MODE] SPAWN {
_text = "<t color='#FFFFCC'>"+"WORK IN PROGRESS:"+"</t>"+"<br/>Much more features/tasks and cinema to come through 2014. Currently there is no ending, but already hours of detailed dynamic gameplay to experience.<br/><br/>";
_text = _text + "<t color='#FE9A2E'>"+ "ps. Dont forget to rate the mission in workshop if you end up enjoying this. ;)"+"</t>";
_text = _text + "<t color='#FFFFCC'>"+ "<br/><br/>SPECIAL THANKS:"+"</t>"+ "<br/>"+"<t color='#66FF66'>"+"TAW_Tonic" +"</t>"+" for Virtual Ammobox System, which is slighty edited (with permission) to work for team-mates.";
_text = _text + "<br/>"+"<t color='#66FF66'>"+"Victor ""[FR] Helios"" Ragot" +"</t>"+" for Extra Music Tracks";
_text = _text + "<br/>"+"<t color='#66FF66'>"+"Benjamin ""Jin"" Pratt" +"</t>"+" for Voice-Acting (WIP) in Civ Conversations";
_text = _text + "<br/>"+"<t color='#66FF66'>"+"Elliott ""Snaked"" Jordan" +"</t>"+" for Voice-Acting (WIP) in Attack/Defend-events";
_text = _text + "<br/>"+"<t color='#66FF66'>"+"ss3goku0001" +"</t>"+" for Text Improvements";
//hint parseText _text; 
//hint "Mission features OFP/ARMA Soundtrack music made by Ondrej Matejka, Norbi Kovacs and Flowshot. All rights and credit for them and Bohemia Interactive Studio.\n\n 3rd party script credit from Virtual Ammobox System for TAW_Tonic, slighty edited (with permission) to work for team-mates\n\n Mission itself is Work in Progress. Much more features/tasks and cinema to come. Currently there is no ending, but already hours of dynamic gameplay to experience\n\nYou can save the game anytime by pressing 0-0-0, overwriting the earlier save";
waitUntil {sleep 1; !isNil"StartMission"};
if ("MetResContact" in (missionnamespace getvariable "Progress")) then {_nul = ["task2","SUCCEEDED"] call SAOKCOTASK;};
[] SPAWN {
sleep 5; 
_text = "<t color='#FFFFCC'>"+"IMPORTANT:"+"</t>"+"<br/>";
_text = _text + " Your mission progress can be resumed now even after changing to newer mission version or workshop loosing your saves, but you will need to use custom savegame function <t color='#66FF66'>0-0-0</t> or the savegame button in WLA Menu via <t color='#66FF66'>Shift+1</t>.";
_text = _text + "<br/><br/> When having progress saved, you can then always resume where you were by keeping progress setting as default position in the displayed start options. You no longer need to press/have resume-button in scenarious menu to continue - <t color='#66FF66'>play and restart both keep your mission progress</t> that you can only overwrite by saving again using the <t color='#66FF66'>0-0-0</t> or the savegame button in WLA Menu via <t color='#66FF66'>Shift+1</t>. You can find the same info also from map/briefing using M-key. REMEMBER TO ALWAYS TO USE CUSTOM SAVE BEFORE EXITING MISSION OR PROGRESS COULD BE LOST";
hintC format ["%1",parseText _text];
};
if (_this select 0) exitWith {};
_pPos =getposATL (vehicle player);
_start = [(_pPos select 0)+12000-(random 24000),(_pPos select 1)+12000-(random 24000),0];
while {surfaceIsWater _start} do {
_start = [(_pPos select 0)+12000-(random 24000),(_pPos select 1)+12000-(random 24000),0];
};
if (!isNil"PlayerPos" && {!(surfaceiswater PlayerPos)}) then {_start = [PlayerPos select 0,PlayerPos select 1,0];PlayerPos=nil;};
{
vehicle _x setpos _start;
} foreach units group player;
if (!isNil"CIVMODE") exitWith {
_building = nearestbuilding _start;
_waypoints = [];
_c = 0;
_array = _building buildingPos _c;
while {!(_array isEqualTo [0,0,0])} do {	
_waypoints pushBack _c;
_c = _c + 1;
_array = _building buildingPos _c;
};
if (count _waypoints > 0) then {
_pos = _building buildingPos (_waypoints call RETURNRANDOM);
player setpos _pos;
} else {
player setpos _start;
};




sleep 15;
_lahin = [0,0,0];
{
if (player distance position _x < player distance _lahin) then {_lahin = position _x;};
} foreach (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 6000]); 
_lahin = [_lahin select 0,_lahin select 1,0];
if !(["task2"] call BIS_fnc_taskCompleted) then {
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
if (isNil"IC3D") exitWith {};
drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Speak with ANY Civilian: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _lahin] call BIS_fnc_addStackedEventHandler;
["task2"] call BIS_fnc_taskSetCurrent;
_someId SPAWN {
waitUntil {sleep 1; ["task2"] call BIS_fnc_taskCompleted};
[_this, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
};
};
player kbTell [player, "PlaV", "V2"];
titletext [((name player)+": Okay, where is the closest village? We need to find the locals to find out what's happening here."),"PLAIN DOWN",1];
sleep 5;
hint "Following the task waypoint isnt often mandatory";
};
//Chopper
_startC = [(_start select 0)+2000 -(random 4000), (_start select 1)+2000 -(random 4000), 50];
_ra = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Heli_Light_01_F"];
if (isClass(configFile >> "cfgVehicles" >> "I_Heli_light_03_F")) then {_ra = _ra + ["I_Heli_light_03_F","I_Heli_light_03_unarmed_F"];};
_ra = _ra call RETURNRANDOM;
_ChopDir = [_startC, _start] call SAOKDIRT;
_chop = [_startC, _ChopDir, _ra, WEST] call SPAWNVEHICLE;
CantCommand set [count CantCommand,_chop select 2];
(_chop select 0) setcaptive true;
(_chop select 0) addWeaponCargo ["Rangefinder",1];(_chop select 0) addWeaponCargo ["Laserdesignator",1];(_chop select 0) addmagazineCargo ["Laserbatteries",1];
{_x moveincargo (_chop select 0);} foreach (units group player);
{_x allowdamage false;_x setcaptive true;} foreach (units (_chop select 2) + [(_chop select 0)]);
_st = [_start, 350,"(1 - sea) * (1 + meadow)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
while {(surfaceNormal _start) select 2 < 0.98} do {
sleep 0.2;
_st = [_start, 650,"(1 - sea) * (1 + meadow)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
};
//CHOPPER TRANSPORT
[(_chop select 2),(_chop select 0),_start] SPAWN {
_start = (_this select 2);
(_this select 0) move _start;
(_this select 0) setbehaviour "CARELESS";
(_this select 0) allowfleeing 0;
(_this select 1) flyinheight 50;
waitUntil {sleep 1; vehicle player distance _start < 700};
_pPosi = getposATL (vehicle player);
_startC = [(_pPosi select 0)+2000 -(random 4000), (_pPosi select 1)+2000 -(random 4000), 50];
while {_startC distance vehicle player < 1000} do {sleep 0.1;_startC = [(_pPosi select 0)+2000 -(random 4000), (_pPosi select 1)+2000 -(random 4000), 50];};
_ChopDir = [_startC, _start] call SAOKDIRT;
_class = ["B_Heli_Attack_01_F"];
_class = _class call RETURNRANDOM;	
_tg1 = [_startC, _ChopDir, _class, WEST] call SPAWNVEHICLE;
_posPl = [(_start select 0) + (random 200)-(random 200), (_start select 1)+ (random 200)-(random 200), 0];
_tg1wp1= (_tg1 select 2) addWaypoint [_posPl, 0]; 
[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
[(_tg1 select 2), 1] setWaypointType "GUARD";
_nul = [(_tg1 select 2), [10048.6,25343.7,0],500] SPAWN FUNKTIO_MAD;
_obj = createVehicle ["Land_HelipadEmpty_F",_start, [], 0, "NONE"]; 
waitUntil {sleep 1; unitready leader (_this select 1) || {!(player in (_this select 1))}};
player kbTell [player, "PlaV", "V1"];
titletext [((name player)+": Get ready, boys. Make sure you stay alert, anything can happen and don't get cocky just because we have a Blackfoot team helping us to secure the LZ."),"PLAIN DOWN",1];
(_this select 1) land "GET IN";
waitUntil {sleep 1; (getposATL (_this select 1) select 2) < 6 || {!(player in (_this select 1))}};
(_this select 1) animateDoor ['door_R', 1]; 
(_this select 1) animateDoor ['door_L', 1];
waitUntil {sleep 1; (getposATL (_this select 1) select 2) < 1.5 || {!(player in (_this select 1))}};
{
if (vehicle _x == (_this select 1)) then { 
 _x action ["Eject",vehicle _x];unassignvehicle _x;
};
} foreach units group player;
_nul = [(_this select 0),0,0,group player] SPAWN FSlowChopperSupportF;
sleep 9;
(_this select 1) animateDoor ['door_R', 0]; 
(_this select 1) animateDoor ['door_L', 0];
if (DIFLEVEL < 1) then {
_r = ["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"] call RETURNRANDOM;
_nul = [getposATL player,_r] SPAWN FSupportDrop;

_r = ["I_G_Van_01_transport_F"] call RETURNRANDOM;
_p = getposATL player;
_p = [(_p select 0)+25,(_p select 1)+25,0];
_nul = [_p,_r] SPAWN FSupportDrop;
} else {
_r = ["I_G_Van_01_transport_F"] call RETURNRANDOM;
_nul = [getposATL player,_r] SPAWN FSupportDrop;
};
hint "You are receiving vehicle drop from sky. You can construct guardposts/minefields with the truck. Press Shift + C or L when near it. But dont stay put for too long, enemy may surround you quickly";
sleep 30;
_lahin = [0,0,0];
{
if (player distance position _x < player distance _lahin) then {_lahin = position _x;};
} foreach (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 6000]); 
_lahin = [_lahin select 0,_lahin select 1,0];
if !(["task2"] call BIS_fnc_taskCompleted) then {
NUMM=NUMM+1;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
if (isNil"IC3D") exitWith {};
drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Speak with ANY Civilian: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _lahin] call BIS_fnc_addStackedEventHandler;
["task2"] call BIS_fnc_taskSetCurrent;
_someId SPAWN {
waitUntil {sleep 1; ["task2"] call BIS_fnc_taskCompleted};
[_this, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
};
};
player kbTell [player, "PlaV", "V2"];
titletext [((name player)+": Okay, where is the closest village? We need to find the locals to find out what's happening here."),"PLAIN DOWN",1];
sleep 5;
hint "Following the task waypoint isnt often mandatory";
};



};

STEAMV = true;
GuardPosts = [];
_nul = [] execVM "briefing.sqf";
FORTRESSESVAR = [];
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
REINFSTATE = "Stand By";
PRESTIGECHANGE = compile preprocessfileLineNumbers "PrestigeChange.sqf";


//MORE VILLAGES
[] SPAWN {
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


//UP PAR
_nul = [] spawn {
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 7 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};

};
};

//SCORE PAR
_nul = [] spawn {
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 8 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};

};
};

F_AmbientArmedCivsNEW = compile preprocessfileLineNumbers "AmbientArmedCivsNEW.sqf";
_nul = [] SPAWN F_AmbientArmedCivsNEW;

//NEAR VILLAGE/CAMP INFO
NEARESTPLACE=compile preprocessfileLineNumbers "NearestPlace.sqf";
SAOKNEARESTVIL=compile preprocessfileLineNumbers "SAOKNEARESTVIL.sqf";
NEARESTCAMP=compile preprocessfileLineNumbers "NearestCamp.sqf";
SAOKNEARVILRELA=compile preprocessfileLineNumbers "SAOKNEARVILRELA.sqf";


_nul = [] spawn {
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 10 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};
};
};

//CIVILIAN NEAR
_nul = [] spawn {
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 9 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};
};
};

//RADAR PAR
_nul = [] spawn {
waitUntil {sleep 0.1; !isNil"StartMission"};
while {true} do {
_s = 11 SPAWN InitFuncs;
waitUntil {sleep 3;scriptdone _s};
};
};


BOATPOSITIONS = ["RII1"];
FUNKTIO_AccTimeAndWeather = compile preprocessfileLineNumbers "AccTimeAndWeather.sqf";
_nul = [] SPAWN FUNKTIO_AccTimeAndWeather;


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
//places for enemy to attack (0 - NAPA, 1 - CDF, the faction under attack)
VarPlaces = [];
//allow NAPA reinforcements join to player team
VarAllowReInf = false;
//how many russian patrols (in war time)
VarPGRus = 0;
//how many enemy patrols
VarPG = 3;
//how much units in patrol (min and max)
VarPGSize =[3,4];
//enemy use chopper transport
VarTRChop = true;
//enemy send fighters
VarAIR = true;
//vehicle classes that enemy may as slow reinf . "O_MBT_02_arty_F" "O_APC_Tracked_02_AA_F" "O_MBT_02_cannon_F" "O_APC_Tracked_02_AA_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"
VarVEH = ["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"];

//if (isClass(configFile >> "cfgVehicles" >> "PCDF_SU34") ) then {VarVEH = VarVEH + ["PCDF_Offroad_DSHKM_PRSZ","PCDF_Pickup_PK_PRSZ","PCDF_UAZ_PRSZ","PCDF_UAZ_AGS30_PRSZ","PCDF_UAZ_MG_PRSZ","PCDF_UAZ_SPG9_PRSZ"];};
//~Total number of friendly units in random forest camps (reinforcements)
VarReUnits = 5;
//~Total number of enemy units in random camps/towers
VarReEnemies = 12;
//How often enemy uses artillery
VarArty = 0;
//How much NAPA friendly help (10 is full)
VarFS = 6;
//Friendly fighters
VarAIRF = false;
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


CIVILIANC = ["C_man_p_fugitive_F_afro","C_man_p_beggar_F_afro","C_man_polo_1_F_afro","C_man_polo_2_F_afro","C_man_polo_3_F_afro","C_man_polo_4_F_afro","C_man_polo_5_F_afro","C_man_polo_6_F_afro","C_man_shorts_1_F_afro","C_man_p_shorts_1_F_afro","C_man_shorts_2_F_afro","C_man_shorts_3_F_afro","C_man_shorts_4_F_afro","C_man_p_beggar_F_asia","C_man_polo_1_F_asia","C_man_polo_2_F_asia","C_man_polo_3_F_asia","C_man_polo_4_F_asia","C_man_polo_5_F_asia","C_man_polo_6_F_asia","C_man_shorts_1_F_asia","C_man_p_fugitive_F_asia","C_man_p_shorts_1_F_asia","C_man_shorts_2_F_asia","C_man_shorts_3_F_asia","C_man_shorts_4_F_asia","C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F","C_Nikos","C_Orestes","C_man_p_beggar_F_euro","C_man_polo_1_F_euro","C_man_polo_2_F_euro","C_man_polo_3_F_euro","C_man_polo_4_F_euro","C_man_polo_5_F_euro","C_man_polo_6_F_euro","C_man_shorts_1_F_euro","C_man_p_fugitive_F_euro","C_man_p_shorts_1_F_euro","C_man_shorts_2_F_euro","C_man_shorts_3_F_euro","C_man_shorts_4_F_euro"];
ENEMYC1 = ["O_Soldier_AAR_F","O_Soldier_AAA_F","O_Soldier_AAT_F","O_Soldier_A_F","O_Soldier_AR_F","O_medic_F","O_engineer_F","O_soldier_exp_F","O_Soldier_GL_F","O_soldier_M_F","O_Soldier_AA_F","O_Soldier_AT_F","O_officer_F","O_soldier_repair_F","O_Soldier_F","O_Soldier_LAT_F","O_Soldier_lite_F","O_Soldier_SL_F","O_Soldier_TL_F","O_spotter_F","O_sniper_F"];
ENEMYC2 = ["O_recon_exp_F","O_recon_JTAC_F","O_recon_M_F","O_recon_medic_F","O_recon_F","O_recon_LAT_F","O_recon_TL_F"];
ENEMYC3 = ["O_soldierU_A_F","O_soldierU_AAR_F","O_soldierU_AAT_F","O_soldierU_AAA_F","O_soldierU_AR_F","O_soldierU_medic_F","O_engineer_U_F","O_soldierU_exp_F","O_SoldierU_GL_F","O_soldierU_M_F","O_soldierU_AA_F","O_soldierU_AT_F","O_soldierU_repair_F","O_soldierU_LAT_F","O_SoldierU_SL_F","O_soldierU_TL_F"];
FRIENDC1 = ["B_soldier_AAR_F","B_soldier_AAA_F","B_soldier_AAT_F","b_sniper_f","b_spotter_f","B_Soldier_A_F","B_soldier_AR_F","B_medic_F","B_engineer_F","B_soldier_exp_F","B_Soldier_GL_F","B_soldier_M_F","B_soldier_AA_F","B_soldier_AT_F","B_soldier_repair_F","B_soldier_repair_F","B_Soldier_F","B_soldier_LAT_F","B_Soldier_lite_F","B_Soldier_SL_F","B_Soldier_TL_F"];
if (isClass(configFile >> "cfgVehicles" >> "AV_IndUs_AR")) then {FRIENDC1 = ["AV_IndUs_medic","AV_IndUs_REP","AV_IndUs_EXP","AV_IndUs_AT","AV_IndUs_Rifleman2","AV_IndUs_Rifleman","AV_IndUs_Rifleman_light","AV_IndUs_SL"];};
//FRIENDC2 = ["I_Soldier_AAR_F","I_Soldier_AAA_F","I_Soldier_AAT_F","I_Soldier_A_F","I_Soldier_AR_F","I_medic_F","I_engineer_F","I_Soldier_exp_F","I_Soldier_GL_F","I_Soldier_M_F","I_Soldier_AA_F","I_Soldier_AT_F","I_officer_F","I_Soldier_repair_F","I_soldier_F","I_Soldier_LAT_F","I_Soldier_lite_F","I_Soldier_SL_F","I_Soldier_TL_F","I_Spotter_F","I_Sniper_F"];
FRIENDC2 = ["I_G_Soldier_A_F","I_G_Soldier_AR_F","I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_officer_F","I_G_Soldier_F","I_G_Soldier_LAT_F","I_G_Soldier_lite_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F"];
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
FUNKTIO_AmbientCar = compile preprocessfileLineNumbers "AmbientCar.sqf";
//FUNKTIO_SupplyLine1 = compile preprocessfileLineNumbers "SupplyLine1.sqf";
FUNKTIO_ambientzone = compile preprocessfileLineNumbers "ambientzone.sqf";
FUNKTIO_EnemyTacticLevel = compile preprocessfileLineNumbers "EnemyTacticLevel.sqf";
FUNKTIO_AmbientFortress = compile preprocessfileLineNumbers "AmbientFortress.sqf";
//FUNKTIO_TalkToCivilians = compile preprocessfileLineNumbers "TalkToCivilians.sqf";
//FUNKTIO_TalkToSoldiers = compile preprocessfileLineNumbers "TalkToSoldiers.sqf";
FUNKTIO_AmbientHouseEffects = compile preprocessfileLineNumbers "AmbientHouseEffects.sqf";
FUNKTIO_TimedEvents = compile preprocessfileLineNumbers "Events\TimedEvents.sqf";

FUNKTIO_ambientanimals3 = compile preprocessfileLineNumbers "ambientanimals3.sqf";
FUNKTIO_ambientcivilians4 = compile preprocessfileLineNumbers "ambientcivilians4.sqf";

FUNKTIO_ambientcivilians5 = compile preprocessfileLineNumbers "ambientcivilians5NEW.sqf";


FUNKTIO_ambientReinforcements = compile preprocessfileLineNumbers "ambientReinforcements.sqf";
FUNKTIO_AmbientCamps = compile preprocessfileLineNumbers "AmbientCamps.sqf";

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

FUNKTIO_NearestPlaceMenu=compile preprocessfileLineNumbers "NearestPlaceMenu.sqf";
FUNKTIO_Commander=compile preprocessfileLineNumbers "Commander.sqf";
FUNKTIO_AmbientGuardPost=compile preprocessfileLineNumbers "AmbientGuardPost.sqf";
FUNKTIO_AmbientFortress=compile preprocessfileLineNumbers "AmbientFortress.sqf";
FUNKTIO_AmbientWalls=compile preprocessfileLineNumbers "AmbientWalls.sqf";
FUNKTIO_AfterLoading=compile preprocessfileLineNumbers "AfterLoading.sqf";
FUNKTIO_AICampBehaviourCivGlobal=compile preprocessfileLineNumbers "AICampBehaviourCivGlobal.sqf";
FUNKTIO_AICampBehaviourMILGlobal=compile preprocessfileLineNumbers "AICampBehaviourMILGlobal.sqf";
FUNKTIO_Traffic=compile preprocessfileLineNumbers "Traffic.sqf";
FUNKTIO_BattleVirtual=compile preprocessfileLineNumbers "BattleVirtual.sqf";
FUNKTIO_TrashyCar=compile preprocessfileLineNumbers "TrashyCar.sqf";
_id = addMissionEventHandler ["loaded",{_n = [] SPAWN FUNKTIO_AfterLoading;}];
_nul = [] SPAWN FUNKTIO_NearestPlaceMenu; 
_n = [] SPAWN FUNKTIO_AfterLoading;
_nul = [] SPAWN FUNKTIO_AmbientGuardPost; 
_nul = [] SPAWN FUNKTIO_AmbientFortress;
_nul = [] SPAWN FUNKTIO_ambientzone;
_nul = [] SPAWN FUNKTIO_AmbientWalls; 
_nul = [] SPAWN FAmbientRoadBlocks;
_nul = [] SPAWN FUNKTIO_AICampBehaviourCivGlobal;
_nul = [] SPAWN FUNKTIO_AICampBehaviourMILGlobal;
_nul = [] SPAWN FUNKTIO_BattleVirtual; 
_nul = [] SPAWN FUNKTIO_TrashyCar;
_nul = [] SPAWN FAmbientBattles;

_nul = [] SPAWN FUNKTIO_Traffic;
if (isNil"STEAMV") then {
//_nul = [] SPAWN FUNKTIO_AIHEAR;
};
_nul = [] SPAWN {while {true} do {
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
CarAlarm = compile preprocessfileLineNumbers "CarAlarm.sqf";
GuardPostSide = compile preprocessfileLineNumbers "GuardPostSide.sqf";
F_AmbientParkedCars = compile preprocessfileLineNumbers "AmbientParkedCars.sqf";
F_VehicleStorage = compile preprocessfileLineNumbers "VehicleStorage.sqf";
F_ScaredBirdsGroup = compile preprocessfileLineNumbers "ScaredBirdsGroup.sqf";
F_MarkerSelectedZone = compile preprocessfileLineNumbers "MarkerSelectedZone.sqf";
FUNKTIO_AmbientPersianPrestige = compile preprocessfileLineNumbers "AmbientPersianPrestige.sqf";

BISsmoke = compile preprocessfileLineNumbers "BISsmoke.sqf";
BISsmokeS = compile preprocessfileLineNumbers "BISsmokeS.sqf";
BISfire = compile preprocessfileLineNumbers "BISfire.sqf";
BISfireS = compile preprocessfileLineNumbers "BISfireS.sqf";
BISemitter = compile preprocessfileLineNumbers "BISemitter.sqf";
FireSmoke= compile preprocessfileLineNumbers "FireSmoke.sqf";
FIREVILLAGE= compile preprocessfileLineNumbers "FireVillage.sqf";
CivThrowing= compile preprocessfileLineNumbers "CivThrowing.sqf";
HouseStuff= compile preprocessfileLineNumbers "HouseStuff.sqf";
//_nul = [] SPAWN FUNKTIO_ambientguard;
_nul = [] SPAWN HouseStuff;
_nul = [] SPAWN FUNKTIO_AmbientPersianPrestige;
_nul = [] SPAWN FUNKTIO_AmbientHouseEffects;
_nul = [] SPAWN FUNKTIO_ambientcivilians4; 
_nul = [] SPAWN FUNKTIO_ambientcivilians5; 
_nul = [] SPAWN FUNKTIO_ambientReinforcements;
_nul = [] SPAWN FUNKTIO_AmbientCamps;
_nul = [] SPAWN FUNKTIO_EnemyTacticLevel;
_nul = [] SPAWN AmbientVehicleZone;

_nul = [] SPAWN FUNKTIO_ambientanimals3;
_nul = [] SPAWN FUNKTIO_TimedEvents;
_n = [] SPAWN F_AmbientParkedCars;
_n = [] SPAWN F_VehicleStorage;
_n = [] SPAWN F_ScaredBirdsGroup;
_n = [] SPAWN CivThrowing;
//Body, Ambient Vehicle and emptygroup removal. Also auto rearming near ammotruck if enabled ingame.
[] SPAWN {
waitUntil {sleep 1; !isNil"StartMission"};
sleep 10;
if (isNil"SAOKRESUME") then {
{
if (random 1 < 0.5 && {_x != "Fac5"}) then {
_st = [getmarkerpos _x, 150,"(1 - sea) * (1 + meadow)",""] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_nul = [_start,"",(15+random 25)] SPAWN CreateRoadBlock;
};
} foreach FacMarkers;
};
};

MapCommander = compileFinal preprocessfileLineNumbers "MapCommander.sqf";
[] SPAWN MapCommander;
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
_veAR = ["C_Van_01_fuel_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"];
while {true} do {
[] CALL _Pstill;
6 SPAWN InitFuncs;
2 SPAWN InitFuncs;
[] SPAWN FUNKTIO_Commander;
sleep 5;
[] SPAWN FUNKTIO_Commander;
//TASK
/*
if ({getMarkerColor _x == "ColorRed"} count [] == 0 && false) then {
_nul = ["task0","SUCCEEDED"] call SAOKCOTASK;
sleep 5;
_nul = "end1" SPAWN BIS_fnc_endMission;
};
*/
//
3 SPAWN InitFuncs;
[] SPAWN FUNKTIO_Commander;
sleep 5;
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
if (!isNil"LIIKUTAOBJEKTI") then {LIIKUTAOBJEKTI = nil;};
if (CBIRDS > 0) then {CBIRDS = CBIRDS - 1;}; 

sleep 10;
[] SPAWN FUNKTIO_Commander;
5 SPAWN InitFuncs;
4 SPAWN InitFuncs;
{if (isNil{_x getvariable "WithAlarm"} && {typeof _x in _veAR}) then {_nul = [_x] SPAWN CarAlarm;};} foreach ((getposATL player) nearEntities [["Car"],200]);
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
4 SPAWN InitFuncs;
sleep 5;
[] SPAWN FUNKTIO_Commander;
6 SPAWN InitFuncs;
1 SPAWN InitFuncs;
sleep 5;
[] SPAWN FUNKTIO_Commander;
5 SPAWN InitFuncs;
{if (isNil{_x getvariable "WithAlarm"} && {typeof _x in _veAR}) then {_nul = [_x] SPAWN CarAlarm;};} foreach ((getposATL player) nearEntities [["Car"],200]);
sleep 10;
[] SPAWN FUNKTIO_Commander;
5 SPAWN InitFuncs;
if (CBIRDS > 0) then {CBIRDS = CBIRDS - 1;}; 
4 SPAWN InitFuncs;
_nul = [getposATL vehicle player] SPAWN FUNKTIO_BlackListMarkers;
sleep 5;
[] SPAWN FUNKTIO_Commander;
6 SPAWN InitFuncs;
1 SPAWN InitFuncs;
sleep 5;
RANDOMTIP = ["Use Fist - U","Toggle 3D Icons - Shift+U","(Un)holster pistol (when civilian) - Ctrl+Y.","Change to Civ - Alt+Y","Flip/Unstuck Car - Shift+4","High Command UI - Ctrl + Space","Customize Gear near Camp/Ammo Truck","Pick up items from houses - Y","Call Support - SHIFT + 1","Open Map/Briefing - M","Tasks - J","Rest - Shift + 1","Savegame - SHIFT + 1","Minefield Creating System - Shift + L","Construction View - Shift + C","Toggle Streetlights - Press SHIFT + 7","Steal Car/Take Objects - Y","Load Crates to Truck - SHIFT + 9"] call RETURNRANDOM;
};
