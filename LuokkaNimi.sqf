private ["_return"];
_return = "";
switch (_this) do {
case "Cargo House": {_return = "Land_Cargo_House_V1_F";};
case "Transmitter Tower 1": {_return = "Land_TTowerBig_1_F";};
case "Transmitter Tower 2": {_return = "Land_TTowerBig_2_F";};
case "Radar": {_return = "Land_Radar_F";};
case "Small Radar": {_return = "Land_Radar_Small_F";};
case "Military Offices": {_return = "Land_MilOffices_V1_F";};
case "Factory": {_return = "Land_dp_mainFactory_F";};
case "Storage": {_return = "Land_dp_smallFactory_F";};
case "Silo": {_return = "Land_dp_smallTank_F";};

case "Pallet": {_return = "Land_Pallet_F";};
case "Scaffolding": {_return = "Land_Scaffolding_F";};
case "Pow Cell": {_return = "Sign_Arrow_Direction_Blue_F";};

case "Map-Board": {_return = "MapBoard_altis_F";};
case "Chair Plastic": {_return = "Land_ChairPlastic_F";};
case "Desk": {_return = "Land_TableDesk_F";};
case "Shelves": {_return = "Land_ShelvesWooden_F";};
case "Wooden Table": {_return = "Land_WoodenTable_small_F";};
case "Camping Lantern": {_return = "Land_Camping_Light_F";};
case "Camping Table": {_return = "Land_CampingTable_F";};
case "Camping Chair": {_return = "Land_CampingChair_V1_F";};
case "Sink": {_return = "Land_Sink_F";};
case "Field Toilet": {_return = "Land_FieldToilet_F";};
case "PortableLight S": {_return = "Land_PortableLight_single_F";};
case "PortableLight D": {_return = "Land_PortableLight_double_F";};
case "Power Generator": {_return = "Land_PowerGenerator_F";};


case "Armored AA (Static)": {_return = "B_APC_Tracked_01_AA_F";};
case "Tank (Static)": {_return = "I_MBT_03_cannon_F";};
case "GL-Vehicle (Static)": {_return = "I_MRAP_03_hmg_F";};
case "MG-Vehicle (Static)": {_return = "I_MRAP_03_gmg_F";};
case "Armoded GL-Vehicle (Static)": {_return = "I_APC_tracked_03_cannon_F";};
case "Antenna": {_return = "Land_TTowerSmall_1_F";};
case "Gear Storage": {_return = "Land_TBox_F";};

case "House Wall": {_return = "Land_Shoot_House_Wall_Long_F";};
case "Military Wall": {_return = "Land_Mil_WallBig_4m_F";};
case "Wired Fence": {_return = "Land_Mil_WiredFence_F";};
//"trench_mg1","trench_mg2","trench_tank1","trench_big1","trench_mortar"
case "Tank Trench": {_return = "trench_tank1";};
case "Big Trench": {_return = "trench_big1";};
case "MG Trench": {_return = "trench_mg1";};
case "MG Trench 2": {_return = "trench_mg2";};
case "Mortar Trench": {_return = "trench_mortar";};
case "Cargo Bunker": {_return = ["Land_Cargo_House_V2_F","Land_Cargo_House_V3_F"]call RETURNRANDOM;};
case "Big Steel Bunker": {_return = ["Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F"]call RETURNRANDOM;};
case "Steel Tower Bunker": {_return = ["Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F"]call RETURNRANDOM;};
case "Concrete Wall": {_return = "Land_CncWall4_F";};
case "Tower Bunker": {_return = ["Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F"]call RETURNRANDOM;};
case "Long BagFence": {_return = "Land_BagFence_Long_F";};
case "Round BagFence": {_return = "Land_BagFence_Round_F";};
case "Small BagBunker": {_return = "Land_BagBunker_Small_F";};
case "H-Barrier 3": {_return = "Land_HBarrier_3_F";};
case "H-Barrier 5": {_return = "Land_HBarrier_5_F";};
case "Big H-Barrier": {_return = "Land_HBarrierBig_F";};
case "StorageBox": {_return = "Box_IND_Wps_F";};
case "Large BagBunker": {_return = "Land_BagBunker_Large_F";};
case "Tower BagBunker": {_return = "Land_BagBunker_Tower_F";};
case "H Barrier Tower": {_return = "Land_HBarrierTower_F";};
case "CamoNet": {_return = "CamoNet_BLUFOR_F";};
case "CamoNet Open": {_return = "CamoNet_BLUFOR_open_F";};
case "CamoNet Vehicle": {_return = "CamoNet_BLUFOR_big_F";};
case "H-Barrier Wall": {_return = "Land_HBarrierWall4_F";};
case "HeliPad": {_return = "Land_HelipadSquare_F";};

case "Razorwire": {_return = "Land_Razorwire_F";};
case "Safety Barrier": {_return = "Land_Crash_barrier_F";};
case "AA-Guard": {_return = "AA-Guard";};
case "AT-Guard": {_return = "AT-Guard";};
case "Sniper-Guard": {_return = "Sniper-Guard";};
case "Medic-Guard": {_return = "Medic-Guard";};
case "MG-Guard": {_return = "MG-Guard";};
case "BarGate": {_return = "Land_BarGate_F";};
case "WaterBarrel": {_return = "Land_BarrelWater_F";};

case "AT-Launcher": {_return = "I_static_AT_F";if (!isNil"IFENABLED") then {_return = "LIB_Pak40";};};
case "AA-Launcher": {_return = "I_static_AA_F";if (!isNil"IFENABLED") then {_return = "LIB_FlaK_38";};};
case "HMG-weapon": {_return = "I_HMG_01_F";};
case "HMG-weapon (High)": {_return = "I_HMG_01_high_F";};
case "HMG-weapon (A)": {_return = "I_HMG_01_A_F";};
case "GMG-weapon": {_return = "I_GMG_01_F";};
case "GMG-weapon (High)": {_return = "I_GMG_01_high_F";};
case "GMG-weapon (A)": {_return = "I_GMG_01_A_F";};
case "Mortar": {_return = "I_Mortar_01_F";};

case "Halogen Lamp": {_return = "Land_LampHalogen_F";};


case "Tent": {
_return = "Land_TentDome_F";
if (!isNil"IFENABLED") then {_return = "Land_TentA_F";};
};

case "FirePlace": {_return = "FirePlace_burning_F";};

};
_return

//["I_medic_F","I_Sniper_F","I_Soldier_AT_F","I_Soldier_AA_F"]