

private ["_str","_s","_nul","_nearest","_ran","_b","_n","_h","_dPos","_dir","_speedd","_speed","_ff","_didsee","_car","_objc","_t","_c","_g"];
_ff = {
private ["_pos","_vel","_veh","_yy","_xx","_zz"];
_pos = _this select 0;
_vel = _this select 2;
_veh = _this select 1;
_veh disableCollisionWith (_this select 3); 
_veh setpos _pos;
_yy = random 1;
_xx = random 1;
_zz = random 1;
_veh setvectorUp [_yy, _xx, _zz];
sleep 0.05;
_veh setvelocity [(_vel select 0)*0.5- 2 +random 4,(_vel select 1)*0.5- 2 +random 4,(_vel select 2)*0.5+1+random 1];
//[_veh] SPAWN {sleep 15; deletevehicle (_this select 0);};
};

_didsee = {
private ["_see","_nearest","_str","_s"];
_see = false;
{
if ([player,_x] CALL FUNKTIO_LOS) exitWith {
_see = true;
if !("ItemRadio" in assignedItems _x) then {_x linkItem "ItemRadio";};
if (false) then {
_s = ["steal15","steal14","steal13","steal12","steal11","steal10","steal9","steal8","steal7","steal6","steal5","steal4","steal3","steal1","steal2"]call RETURNRANDOM;
[_x, "CivV", "CivV\sounds.bikb", ""] CALL SAOKKBTOPIC;
[_x, player, "CivV", _s] SPAWN SAOKKBTELL;
} else {
//"stealV1","stealV2","stealV3","stealV4",
_s = ["CivS14","CivS13","CivS12","CivS11","CivS10","CivS9","CivS8","CivS7","CivS6","CivS5","CivS4","CivS3","CivS2","CivS1"]call RETURNRANDOM;
[_x, "ZafV", "ZafVoices\sounds.bikb", ""]CALL SAOKKBTOPIC;
[_x, player, "ZafV", _s] SPAWN SAOKKBTELL;
};
};
} foreach (player nearEntities [["Civilian"],15]);
if (_see) then {
[] SPAWN SAOKLOWERRELVIL;
_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
_header = format ["NATO Soldiers Raiding Houses in %1?",_Lna];
[_header, date] CALL SAOKEVENTLOG;
};
};

[] SPAWN SAOKRESETVEHICLE;
_car = cursorTarget;
if (count (nearestObjects [getposATL player, ["Land_Cargo_House_V1_F"], 25]) > 0 && {{typeof _car iskindof _x} count ["Car","Air","Tank","LandVehicle"] > 0} && {count crew _car == 0} && {alive _car}) exitWith {};

if (player CALL NEARESTLOCATIONNAME == "factory" && {(vehicle player) distance (getmarkerpos ([] CALL NEARESTFACTORY)) < 220}) then {
if (!isNull cursorTarget && {count crew cursorTarget == 0} && {{typeof cursorTarget iskindof _x} count ["Car","Air","Tank","LandVehicle"] > 0}) then {
_car2 = cursorTarget;
if (!isNil{_car2 getvariable "VehID"}) then {
{
if (_car2 getvariable "VehID" == _x select 0) exitWith {
_deAT = SaOkVehicleData deleteAt _forEachIndex;
};
} foreach SaOkVehicleData;
};
deletevehicle _car2; 
FACRES = FACRES + 1;
"Vehicle scrapped - Received resource point" SPAWN HINTSAOK;
};
};

//Land_Kiosk_blueking_F Land_Kiosk_gyros_F Land_Kiosk_papers_F Land_Kiosk_redburger_F 

//RESOURCE GATHERING 
if (!isNil{missionnamespace getvariable "LastVeh"} && {alive (missionnamespace getvariable "LastVeh")} && {(missionnamespace getvariable "LastVeh") distance player < 100}) then {
_g = [];
//hint format ["%1",((getposATL player) nearEntities [["ReammoBox_F","Man"],9])];
_weps = [];
_mags = [];
_backs = [];
_items = [];
_vests = [];
{
if (typeof _x == "WeaponHolderSimulated") then {
_weps append ((getWeaponCargo _x) select 0);
_mags append ((getMagazineCargo _x) select 0);
_backs append ((getBackPackCargo _x) select 0);
_items append ((getItemCargo _x) select 0);
if !("Ground" in _g) then {
_g pushBack "Ground";
};
_x CALL SAOKGATHERCRATE;_x spawn SAOKDELETE;
};
} foreach ((getposATL player) nearEntities ["All",5]);
{if ((_x distance player < 5) && {isNil{_x getvariable "GatheRed"}}) then {_g set [count _g, getText(configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName")];
_weps append (weapons _x);
_mags append (magazines _x);
_backs pushback (backpack _x);
_items append (items _x);
_vests pushback (vest _x);
_x CALL SAOKGATHERUNIT; _x setvariable ["GatheRed",1];};} foreach allDeadMen;
//5 set to 20 because of buggy supply crate
{player reveal [_x, 4];if (alive _x && {_x call SAOKGATHERCRATEB} && {cursortarget == _x}) then {_g set [count _g, getText(configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName")];_items = _items + ((getItemCargo _x) select 0);_backs = _backs + ((getBackPackCargo _x) select 0);_mags = _mags + ((getMagazineCargo _x) select 0);_weps = _weps + ((getWeaponCargo _x) select 0);_x CALL SAOKGATHERCRATE;};} foreach ((getposATL player) nearEntities [["ReammoBox_F"],20]);
{
player reveal [_x, 4];
if (alive _x && {_x call SAOKGATHERCRATEB} && {cursortarget == _x}) then {_g set [count _g, (format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> typeof _x >> "picture"))])];_items = _items + ((getItemCargo _x) select 0);_backs = _backs + ((getBackPackCargo _x) select 0);_mags = _mags + ((getMagazineCargo _x) select 0);_weps = _weps + ((getWeaponCargo _x) select 0);_x CALL SAOKGATHERCRATE;};
} foreach ((getposATL player) nearEntities [["LandVehicle"],12]);
if (count _g > 0) then {
_t = "Gear gathered from ";
_c = count _g - 1;
{
_t = _t + (format ["%1",_x]);
if (_c > 0) then {
if (_c > 1) then {
_t = _t +", ";
} else {
_t = _t +" and ";
};
};
_c = _c - 1;
} foreach _g;
[_t,_weps,_mags,_backs,_vests,_items] SPAWN HINTWEPSAOK;
};
};

_car = nearestObject [player, "Car"];
if (_car distance player < 8) then {player reveal [_car, 4];};
if (!isNull _car && {locked _car == 2} && {_car distance player < 8} && {cursortarget == _car}) then {
_s = ["breakV","breakV2"]call RETURNRANDOM;
_s SPAWN SAOKPLAYSOUND;
[_car,1] SPAWN VehLife;
sleep 2;
_nul = _car SPAWN FCarAlarmLights;
_car lock 0;
{
if ([player,_x] CALL FUNKTIO_LOS) exitWith {
[] SPAWN SAOKLOWERRELVIL;
_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
_header = format ["NATO Soldiers Seen Stealing Car in %1, Locals Loosing Hope",_Lna];
[_header, date] CALL SAOKEVENTLOG;
};
} foreach (player nearEntities [["Civilian"],15]);
};

if (!isNil{TJano} && {count (nearestObjects [getposATL player, ["Land_BarrelWater_F"], 5]) > 0}) then {
if (["TaskJano"] CALL BIS_fnc_taskExists) then {
_ran = floor (20 + (random 30));
pisteet = pisteet + _ran;
_s = ["drinking","drinking2","drinking3"]call RETURNRANDOM;
_s SPAWN SAOKPLAYSOUND;
TJano = nil;
_nul = [_ran, "Found something to drink"] SPAWN PRESTIGECHANGE;
_nul = ["TaskJano","SUCCEEDED"] call SAOKCOTASK;
"TaskJano" SPAWN {
private ["_n"];
sleep 30; _n = [_this] CALL BIS_fnc_deleteTask;};
};
};



//_objc =["Land_WoodenTable_small_F","Land_WoodenTable_large_F","Land_MapBoard_F","Land_ShelvesWooden_khaki_F","Land_ShelvesWooden_blue_F","Land_ShelvesWooden_F","Land_ShelvesMetal_F","Land_Rack_F","Land_Metal_wooden_rack_F","Land_Metal_rack_Tall_F","Land_Metal_rack_F","Land_Icebox_F","Land_TableDesk_F","Land_ChairWood_F","Land_ChairPlastic_F","Land_CashDesk_F","Land_Bench_F","Land_WaterPurificationTablets_F","Land_BottlePlastic_V2_F","Land_VitaminBottle_F","Land_TinContainer_F","Land_TacticalBacon_F","Land_SurvivalRadio_F","Land_Suitcase_F","Land_Map_unfolded_F","Land_Map_F","Land_Shovel_F","Land_SatellitePhone_F","Land_RiceBox_F","Land_PowderedMilk_F","Land_Poster_04_F","Land_BottlePlastic_V1_F","Land_BottlePlastic_V1_F","Land_Money_F","Land_Photos_V6_F","Land_Photos_V5_F","Land_Photos_V4_F","Land_Photos_V3_F","Land_Photos_V1_F","Land_Photos_V1_F","Land_PensAndPencils_F","Land_PencilYellow_F","Land_PencilRed_F","Land_PencilGreen_F","Land_PencilBlue_F","Land_PenRed_F","Land_PenBlack_F","Land_PainKillers_F","Land_Notepad_F","Land_MobilePhone_old_F","Land_MobilePhone_smart_F","Land_MetalWire_F","Land_Map_stratis_F","Land_Map_altis_F","Land_Map_blank_F","Land_Magazine_rifle_F","Land_LuggageHeap_04_F","Land_LuggageHeap_05_F","Land_LuggageHeap_01_F","Land_LuggageHeap_03_F","Land_Laptop_unfolded_F","Land_Laptop_F","Land_HeatPack_F","Land_HandyCam_F,""Land_GasCooker_F","Land_GasCanister_F","Land_FMradio_F","Land_FireExtinguisher_F","Land_File2_F","Land_FilePhotos_F","Land_File1_F","Land_DuctTape_F","Land_DisinfectantSpray_F","Land_Defibrillator_F","Land_CerealsBox_F","Land_Canteen_F","Land_CanisterPlastic_F","Land_CanisterOil_F","Land_CanisterFuel_F","Land_CanOpener_F","Land_Can_V1_F","Land_Can_Rusty_F","Land_Can_V3_F","Land_Can_V2_F","Land_Can_Dented_F","Land_ButaneTorch_F","Land_ButaneCanister_F","Land_Bucket_painted_F","Land_Bucket_clean_F","Land_Bucket_F","Land_BloodBag_F","Land_BloodBag_F","Land_Battery_F","Land_Bandage_F","Land_BakedBeans_F","Land_Antibiotic_F","Land_Ammobox_rounds_F"];
_objc =["Land_Baseball_01_F","Land_Basketball_01_F","Land_Football_01_F","Land_Rugbyball_01_F","Land_Volleyball_01_F","Land_Trophy_01_bronze_F","Land_Trophy_01_gold_F","Land_Trophy_01_silver_F","Land_File_F","Land_Axe_fire_F","Land_Axe_F","Land_WaterPurificationTablets_F","Land_BottlePlastic_V2_F","Land_VitaminBottle_F","Land_TinContainer_F","Land_TacticalBacon_F","Land_SurvivalRadio_F","Land_Suitcase_F","Land_Map_unfolded_F","Land_Map_F","Land_Shovel_F","Land_SatellitePhone_F","Land_RiceBox_F","Land_PowderedMilk_F","Land_BottlePlastic_V1_F","Land_BottlePlastic_V1_F","Land_Money_F","Land_Photos_V6_F","Land_Photos_V5_F","Land_Photos_V4_F","Land_Photos_V3_F","Land_Photos_V1_F","Land_Photos_V1_F","Land_PensAndPencils_F","Land_PencilYellow_F","Land_PencilRed_F","Land_PencilGreen_F","Land_PencilBlue_F","Land_PenRed_F","Land_PenBlack_F","Land_PainKillers_F","Land_Notepad_F","Land_MobilePhone_old_F","Land_MobilePhone_smart_F","Land_Map_stratis_F","Land_Map_altis_F","Land_Map_blank_F","Land_Magazine_rifle_F","Land_Laptop_unfolded_F","Land_Laptop_F","Land_HeatPack_F","Land_HandyCam_F,""Land_GasCooker_F","Land_GasCanister_F","Land_FMradio_F","Land_File2_F","Land_FilePhotos_F","Land_File1_F","Land_DisinfectantSpray_F","Land_Defibrillator_F","Land_CerealsBox_F","Land_Canteen_F","Land_CanisterPlastic_F","Land_CanisterOil_F","Land_CanisterFuel_F","Land_CanOpener_F","Land_Can_V1_F","Land_Can_Rusty_F","Land_Can_V3_F","Land_Can_V2_F","Land_Can_Dented_F","Land_ButaneTorch_F","Land_ButaneCanister_F","Land_Bucket_painted_F","Land_Bucket_clean_F","Land_Bucket_F","Land_BloodBag_F","Land_BloodBag_F","Land_Bandage_F","Land_BakedBeans_F","Land_Antibiotic_F","Land_Ammobox_rounds_F"];
{
_b = true;
if (typeof _x in ["Land_Trophy_01_bronze_F","Land_Trophy_01_gold_F","Land_Trophy_01_silver_F","Land_File_F","Land_Ammobox_rounds_F","Land_File2_F","Land_FilePhotos_F","Land_File1_F","Land_Map_stratis_F","Land_Map_altis_F","Land_Map_blank_F","Land_MobilePhone_old_F","Land_MobilePhone_smart_F","Land_Notepad_F","Land_Suitcase_F","Land_Map_unfolded_F","Land_Map_F","Land_Money_F","Land_Photos_V6_F","Land_Photos_V5_F","Land_Photos_V4_F","Land_Photos_V3_F","Land_Photos_V1_F","Land_Photos_V1_F","Land_Laptop_unfolded_F","Land_Laptop_F"]) then {
_ran = floor (10 + (random 70));
pisteet = pisteet + _ran;
_nul = [_ran, "Gathered Item"] SPAWN PRESTIGECHANGE;
_s = ["Cash","breakV","breakV2"]call RETURNRANDOM;
//"Cash" SPAWN SAOKPLAYSOUND;
[_s] SPAWN SAOKPLAYSOUND;
deletevehicle _x;_b = false;
_n = [] sPAWn _didsee;
};
if (["TaskNalka"] CALL BIS_fnc_taskExists && {!isNil{TNalka}}) then {
if (typeof _x in ["Land_BakedBeans_F","Land_BakedBeans_F","Land_RiceBox_F","Land_CerealsBox_F"]) then {
_ran = floor (30 + (random 70));
pisteet = pisteet + _ran;
TNalka = nil;
_s = ["eat","cateat"]call RETURNRANDOM;
_s SPAWN SAOKPLAYSOUND;
_nul = [_ran, "Found somethin to eat"] SPAWN PRESTIGECHANGE;
_nul = ["TaskNalka","SUCCEEDED"] call SAOKCOTASK;
"TaskNalka" SPAWN {
private ["_n"];
sleep 30; _n = [_this] CALL BIS_fnc_deleteTask;};
_x spawn SAOKDELETE;_b = false;
_n = [] sPAWn _didsee;
};
};
if (["TaskJano"] CALL BIS_fnc_taskExists && {!isNil{TJano}}) then {
if (typeof _x in ["Land_BottlePlastic_V2_F","Land_PowderedMilk_F","Land_BottlePlastic_V1_F","Land_Can_V1_F","Land_Can_Rusty_F","Land_Can_V3_F","Land_Can_V2_F","Land_Can_Dented_F"]) then {
_ran = floor (20 + (random 30));
pisteet = pisteet + _ran;
_s = ["drinking","drinking2","drinking3"]call RETURNRANDOM;
_s SPAWN SAOKPLAYSOUND;
TJano = nil;
_nul = [_ran, "Found something to drink"] SPAWN PRESTIGECHANGE;
_nul = ["TaskJano","SUCCEEDED"] call SAOKCOTASK;
"TaskJano" SPAWN {
private ["_n"];
sleep 30; _n = [_this] CALL BIS_fnc_deleteTask;};
_x spawn SAOKDELETE;_b = false;
_n = [] sPAWn _didsee;
};
};
if (["TaskKipea"] CALL BIS_fnc_taskExists && {!isNil{TKipea}}) then {
if (typeof _x in ["Land_VitaminBottle_F","Land_Antibiotic_F","Land_PainKillers_F"]) then {
_ran = floor (50 + (random 70));
pisteet = pisteet + _ran;
_s = ["pills","pills2"]call RETURNRANDOM;
TKipea = nil;
_s SPAWN SAOKPLAYSOUND;
_nul = [_ran, "You are feeling better"] SPAWN PRESTIGECHANGE;
_nul = ["TaskKipea","SUCCEEDED"] call SAOKCOTASK;
"TaskKipea" SPAWN {
private ["_n"];
sleep 30; _n = [_this] CALL BIS_fnc_deleteTask;};
_x spawn SAOKDELETE;_b = false;
_n = [] sPAWn _didsee;
};
};
if (_b) then {
_n = [] sPAWn _didsee;
_h = ((eyepos player) select 2)-((getposASL player) select 2);
_dPos = player modelToWorld [0,1,_h];
_dir = direction player;
_speedd =20+(random 20);
[_x,1] SPAWN VehLife;
_speed = [((sin _dir)*_speedd*(0.80+random 0.4)),((cos _dir)*_speedd*(0.80+random 0.4)),(0.1+random 4)];
_nul = [_dPos, _x,_speed,player] SPAWN _ff;
};
} foreach (nearestObjects [player,_objc, 3]);