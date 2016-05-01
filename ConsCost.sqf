private ["_Item","_price"];
_Item = _this;
_price = 5;

switch (_Item) do {

case "Cargo House": {_price = 200;};
case "Transmitter Tower 1": {_price = 3000;};
case "Transmitter Tower 2": {_price = 3000;};
case "Radar": {_price = 2000;};
case "Small Radar": {_price = 900;};
case "Military Offices": {_price = 800;};
case "Factory": {_price = 2500;};
case "Storage": {_price = 1000;};
case "Silo": {_price = 1000;};

case "Land_TTowerBig_1_F": {_price = 3000;};
case "Land_TTowerBig_2_F": {_price = 3000;};
case "Land_Radar_F": {_price = 2000;};
case "Land_Radar_Small_F": {_price = 900;};
case "Land_MilOffices_V1_F": {_price = 800;};
case "Land_dp_mainFactory_F": {_price = 2500;};
case "Land_dp_smallFactory_F": {_price = 1000;};
case "Land_dp_smallTank_F": {_price = 1000;};

case "Pallet": {_price = 3;};
case "Land_Pallet_F": {_price = 3;};
case "Scaffolding": {_price = 15;};
case "Land_Scaffolding_F": {_price = 15;};
case "Pow Cell": {_price = 200;};
case "Sign_Arrow_Direction_Blue_F": {_price = 200;};

case "Armored AA (Static)": {_price = 50;};
case "B_APC_Tracked_01_AA_F": {_price = 50;};
case "Tank (Static)": {_price = 100;};
case "I_MBT_03_cannon_F": {_price = 100;};
case "GL-Vehicle (Static)": {_price = 50;};
case "I_MRAP_03_hmg_F": {_price = 50;};
case "MG-Vehicle (Static)": {_price = 45;};
case "I_MRAP_03_gmg_F": {_price = 45;};
case "I_APC_tracked_03_cannon_F": {_price = 65;};
case "Armoded GL-Vehicle (Static)": {_price = 65;};

case "Antenna": {_price = 200;};
case "Land_TTowerSmall_1_F": {_price = 200;};

case "Gear Storage": {_price = 100;};
case "Land_TBox_F": {_price = 100;};


case "Tower Bunker": {_price = 50;};
case "Land_Cargo_Patrol_V2_F": {_price = 50;};
case "Land_Cargo_Patrol_V3_F": {_price = 50;};
case "Concrete Wall": {_price = 13;};
case "Land_CncWall4_F": {_price = 13;};
case "Big Steel Bunker": {_price = 75;};
case "Land_Cargo_HQ_V1_F": {_price = 75;};
case "Land_Cargo_HQ_V2_F": {_price = 75;};
case "Land_Cargo_HQ_V3_F": {_price = 75;};
case "Cargo Bunker": {_price = 55;};
case "Land_Cargo_House_V2_F": {_price = 55;};
case "Land_Cargo_House_V3_F": {_price = 55;};
case "Steel Tower Bunker": {_price = 120;};
case "Land_Cargo_Tower_V3_F": {_price = 120;};
case "Land_Cargo_Tower_V2_F": {_price = 120;};
case "Tank Trench": {_price = 50;};
case "trench_tank1": {_price = 50;};
case "Big Trench": {_price = 75;};
case "trench_big1": {_price = 75;};
case "MG Trench": {_price = 40;};
case "trench_mg1": {_price = 40;};
case "MG Trench 2": {_price = 25;};
case "trench_mg2": {_price = 25;};
case "Mortar Trench": {_price = 25;};
case "trench_mortar": {_price = 25;};

case "Long BagFence": {_price = 5;};
case "Land_BagFence_Long_F": {_price = 5;};
case "Round BagFence": {_price = 4;};
case "Land_BagFence_Round_F": {_price = 4;};
case "Small BagBunker": {_price = 25;};
case "Land_BagBunker_Small_F": {_price = 35;};
//"trench_mg1","trench_mg2","trench_tank1","trench_big1","trench_mortar"



case "H-Barrier 3": {_price = 7;};
case "Land_HBarrier_3_F": {_price = 7;};
case "H-Barrier 5": {_price = 12;};
case "Land_HBarrier_5_F": {_price = 12;};
case "Big H-Barrier": {_price = 20;};
case "Land_HBarrierBig_F": {_price = 20;};
case "Large BagBunker": {_price = 40;};
case "Land_BagBunker_Large_F": {_price = 40;};
case "Tower BagBunker": {_price = 40;};
case "Land_BagBunker_Tower_F": {_price = 40;};
case "H Barrier Tower": {_price = 40;};
case "Land_HBarrierTower_F": {_price = 40;};
case "Long BagFence": {_price = 40;};
case "CamoNet": {_price = 7;};
case "CamoNet_BLUFOR_F": {_price = 7;};
case "CamoNet Open": {_price = 7;};
case "CamoNet_BLUFOR_open_F": {_price = 7;};
case "CamoNet Vehicle": {_price = 7;};
case "CamoNet_BLUFOR_big_F": {_price = 7;};
case "H-Barrier Wall": {_price = 20;};
case "Land_HBarrierWall4_F": {_price = 20;};
case "Razorwire": {_price = 3;};
case "Land_Razorwire_F": {_price = 3;};
case "Safety Barrier": {_price = 3;};
case "Land_Crash_barrier_F": {_price = 3;};
case "AA-Guard": {_price = 30;};
case "AT-Guard": {_price = 25;};
case "Sniper-Guard": {_price = 20;};
case "Medic-Guard": {_price = 20;};
case "MG-Guard": {_price = 20;};
case "BarGate": {_price = 30;};
case "WaterBarrel": {_price = 5;};
case "AT-Launcher": {_price = 40;};
case "I_static_AT_F": {_price = 40;};
case "LIB_Pak40": {_price = 40;};
case "AA-Launcher": {_price = 40;};
case "I_static_AA_F": {_price = 40;};
case "LIB_FlaK_38": {_price = 40;};
case "HMG-weapon": {_price = 30;};
case "I_HMG_01_F": {_price = 30;};
case "HMG-weapon (High)": {_price = 30;};
case "I_HMG_01_high_F": {_price = 30;};
case "HMG-weapon (A)": {_price = 35;};
case "I_HMG_01_A_F": {_price = 35;};
case "GMG-weapon": {_price = 35;};
case "I_GMG_01_F": {_price = 35;};
case "GMG-weapon (High)": {_price = 35;};
case "I_GMG_01_high_F": {_price = 35;};
case "GMG-weapon (A)": {_price = 40;};
case "I_GMG_01_A_F": {_price = 40;};
case "Mortar": {_price = 40;};
case "I_Mortar_01_F": {_price = 40;};
case "Halogen Lamp": {_price = 10;};
case "Land_LampHalogen_F": {_price = 10;};
case "Tent": {_price = 5;};
case "HeliPad": {_price = 5;};
case "Land_TentDome_F": {_price = 5;};
case "FirePlace": {_price = 5;};
case "FirePlace_burning_F": {_price = 5;};
};
_price