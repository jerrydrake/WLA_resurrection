private ["_Item","_price"];
_Item = if (typename _this == "STRING") then {_this} else {_this select 0};
_price = 0;
switch (_Item) do {
case "Water Barrel": {_price = 10;};

case "Relocate Exit": {_price = 100;};
case "Massive": {_price = 600;};
case "Medium": {_price = 400;};
case "Light": {_price = 200;};

case "Empty Rubberboat": {_price = 20;};
case "Empty Motorboat": {_price = 70;};
case "Empty Assault Boat": {_price = 30;};
case "Empty Speedboat MG": {_price = 120;};
case "Empty SDV": {_price = 100;};

case "Greyhawk UAV": {_price = 350;};
case "Blackfoot": {_price = 550;};
case "Littlebird": {_price = 200;};
case "Buzzard AA": {_price = 550;};
case "Buzzard CAS": {_price = 550;};
case "F/A-18 E": {_price = 550;};
case "F/A-18 F": {_price = 550;};
case "WY-55 Hellcat MG": {_price = 250;};
case "A-164 Wipeout": {_price = 620;};

case "AT-Team": {_price = 200;};
case "AA-Team": {_price = 200;};
case "INF-Team": {_price = 300;};
case "PMC-Team": {_price = 500;};
case "Motorized-Squad": {_price = 500;};
case "Paradrop-Squad": {_price = 400;};
case "Offroad MG": {_price = 150;};
case "Hunter HMG": {_price = 250;};
case "Hunter GMG": {_price = 300;};
case "Strider HMG": {_price = 300;};
case "Strider GMG": {_price = 350;};
case "Gorgon": {_price = 400;};
case "Cheetah": {_price = 400;};
case "Bobcat": {_price = 400;};
case "Slammer": {_price = 700;};
case "Scorcher": {_price = 700;};
case "Sandstorm": {_price = 600;};
case "Mortar": {_price = 300;};
case "FV-720 Mora": {_price = 450;};
case "MBT-52 Kuma": {_price = 600;};
case "Slammer UP": {_price = 750;};


case "Chopper Transport": {_price = 50;};
case "Construction Truck": {_price = 100;};
case "Marshall": {_price = 400;};
case "Panther": {_price = 450;};
case "Basic Ammo": {_price = 200;};
case "Basic Weapons": {_price = 600;};
case "Grenades": {_price = 200;};
case "Launchers": {_price = 700;};
case "Explosives": {_price = 600;};
case "Special": {_price = 600;};
case "NATO SF weapons": {_price = 1000;};
case "Russian weapons": {_price = 1000;};
case "Supply[NATO]": {_price = 40;};
case "Supply[AAF]": {_price = 40;};
case "Support[NATO]": {_price = 40;};
case "Support[AAF]": {_price = 40;};
case "VehAmmo[NATO]": {_price = 40;};
case "VehAmmo[AAF]": {_price = 40;};
case "Cargo Net": {_price = 600;};

case "Medical Truck": {_price = 30;};
case "Rearm Truck": {_price = 30;};
case "Fuel Truck": {_price = 30;};
case "Repair Truck": {_price = 30;};

case "Empty Medical Truck": {_price = 30;};
case "Empty Rearm Truck": {_price = 30;};
case "Empty Fuel Truck": {_price = 30;};
case "Empty Repair Truck": {_price = 30;};

case "Empty A-164 Wipeout": {_price = 530;};
case "Empty Blackfoot": {_price = 450;};
case "Empty AH-9": {_price = 300;};
case "Empty MH-9": {_price = 200;};
case "Empty MH-9 PMC": {_price = 200;};

case "Empty WY-55 Hellcat MG": {_price = 320;};
case "Empty WY-55 Hellcat": {_price = 220;};

case "Empty CH-49 [CONS]": {_price = 350;};
case "Empty UH-80": {_price = 300;};
case "Empty UH-80 Camo": {_price = 300;};
case "Empty Buzzard AA": {_price = 500;};
case "Empty Buzzard CAS": {_price = 500;};
case "Empty F/A-18 E": {_price = 500;};
case "Empty F/A-18 F": {_price = 500;};

case "MachineGunner": {_price = 200;};
case "Medic": {_price = 200;};
case "Sniper": {_price = 200;};
case "Engineer": {_price = 200;};
case "AA-Soldier": {_price = 200;};
case "AT-Soldier": {_price = 200;};
case "Demolition Soldier": {_price = 200;};
case "Strider": {_price = 180;};
case "Offroad FIA": {_price = 150;};
case "Empty Strider HMG": {_price = 230;};
case "Empty Strider GMG": {_price = 280;};
case "Empty Gorgon": {_price = 350;};
case "Hunter": {_price = 150;};
case "Empty Hunter HMG": {_price = 200;};
case "Empty Hunter GMG": {_price = 250;};
case "Empty Panther": {_price = 400;};
case "Empty Marshall": {_price = 350;};
case "Empty Cheetah": {_price = 400;};
case "Empty Slammer": {_price = 600;};
case "Empty Slammer UP": {_price = 630;};
case "Empty Scorcher": {_price = 500;};
case "Empty Sandstorm": {_price = 500;};

case "Empty FV-720 Mora": {_price = 400;};
case "Empty MBT-52 Kuma": {_price = 500;};

case "Mortar Team": {_price = 300;};
case "I_Mortar_01_F": {_price = 300;};
case "B_MBT_01_arty_F": {_price = 600;};
case "B_MBT_01_mlrs_F": {_price = 600;};
case "AR-2 Darter (AI)": {_price = 50;};
case "UGV Stomper (AI)": {_price = 60;};
case "UGV Stomper RCWS (AI)": {_price = 100;};
case "MQ4A Greyhawk (AI)": {_price = 350;};
case "Mine/Construction-Truck": {_price = 50;};
case "B_UAV_02_CAS_F": {_price = 350;};
case "B_Heli_Attack_01_F": {_price = 550;};
case "B_Heli_Light_01_armed_F": {_price = 200;};
case "I_Plane_Fighter_03_AA_F": {_price = 550;};
case "I_Plane_Fighter_03_CAS_F": {_price = 550;};
case "I_Heli_light_03_F": {_price = 250;};
case "B_Plane_CAS_01_F": {_price = 620;};
case "I_G_Offroad_01_armed_F": {_price = 150;};
case "B_MRAP_01_hmg_F": {_price = 250;};
case "B_MRAP_01_gmg_F": {_price = 300;};
case "I_MRAP_03_hmg_F": {_price = 300;};
case "I_MRAP_03_gmg_F": {_price = 350;};
case "I_APC_Wheeled_03_cannon_F": {_price = 400;};
case "B_APC_Tracked_01_AA_F": {_price = 400;};
case "B_APC_Tracked_01_CRV_F": {_price = 400;};
case "B_MBT_01_cannon_F": {_price = 700;};
case "I_APC_tracked_03_cannon_F": {_price = 450;};
case "I_MBT_03_cannon_F": {_price = 600;};
case "B_MBT_01_TUSK_F": {_price = 750;};
//case "Chopper Transport": {_price = 400;}; nearestObjects [player, ["Land_Communication_F"], 20];
};

if (_price == 0) then {
_class = "";
{if (getText (configfile >> "CfgVehicles" >> _x >> "displayName") == _Item) exitWith {_class = _x;};} foreach ["I_G_Van_01_transport_F","I_Mortar_01_F","B_MBT_01_mlrs_F","B_MBT_01_arty_F"] + (ARMEDSUPPORT select 2) +  (ARMEDCARRIER select 2)+(ARMEDCARRIER select 0)+(ARMEDAA select 0)+(ARMEDAA select 2)+(ARMEDAA select 3)+(ARMEDSUPPORT select 0) +(AIRARMCHOP select 0) + (AIRFIGTHER select 0) + (AIRARMCHOP select 2) + (AIRFIGTHER select 2) + (ARMEDTANKS select 0) + (ARMEDVEHICLES select 0) + (ARMEDTANKS select 2) + (ARMEDVEHICLES select 2) + (ARMEDTANKS select 3) + (ARMEDVEHICLES select 3);
switch _class do {
case "B_UAV_02_CAS_F": {_price = 350;};
case "B_Heli_Attack_01_F": {_price = 550;};
case "B_Heli_Light_01_armed_F": {_price = 200;};
case "I_Plane_Fighter_03_AA_F": {_price = 550;};
case "I_Plane_Fighter_03_CAS_F": {_price = 550;};
case "I_Heli_light_03_F": {_price = 250;};
case "B_Plane_CAS_01_F": {_price = 620;};
case "I_G_Offroad_01_armed_F": {_price = 150;};
case "B_MRAP_01_hmg_F": {_price = 250;};
case "B_MRAP_01_gmg_F": {_price = 300;};
case "I_MRAP_03_hmg_F": {_price = 300;};
case "I_MRAP_03_gmg_F": {_price = 350;};
case "I_APC_Wheeled_03_cannon_F": {_price = 400;};
case "B_APC_Tracked_01_AA_F": {_price = 400;};
case "B_APC_Tracked_01_CRV_F": {_price = 400;};
case "B_MBT_01_cannon_F": {_price = 700;};
case "I_APC_tracked_03_cannon_F": {_price = 450;};
case "I_MBT_03_cannon_F": {_price = 600;};
case "B_MBT_01_TUSK_F": {_price = 750;};
case "I_G_Van_01_transport_F": {_price = 80;};
};

if (_price == 0) then {
if (_Item in [(getText(configfile >> "CfgVehicles" >> "I_Mortar_01_F" >> "displayName"))]) then {_price = 300;};
if (_Item in [(getText(configfile >> "CfgVehicles" >> "B_MBT_01_mlrs_F" >> "displayName")),(getText(configfile >> "CfgVehicles" >> "B_MBT_01_arty_F" >> "displayName"))]) then {_price = 600;};
if (_class in ["I_Mortar_01_F"]) then {_price = 300;};
if (_class in ["B_MBT_01_mlrs_F","B_MBT_01_arty_F"]) then {_price = 600;};
if (_class in ((ARMEDCARRIER select 0)+(ARMEDCARRIER select 2))) then {_price = 100;};
if (_class in ((ARMEDSUPPORT select 0)+(ARMEDSUPPORT select 2))) then {_price = 200;};
if (_class in ((ARMEDAA select 0)+(ARMEDAA select 2))) then {_price = 400;};
if (_class in ((ARMEDSUPPORT select 0)+(ARMEDSUPPORT select 2))) then {_price = 200;};
if (_class in (AIRCARRIERCHOP select 0)+(AIRCARRIERCHOP select 2)) then {_price = 300;};
if (_class in ((AIRARMCHOP select 0)+(AIRARMCHOP select 2)+(AIRARMCHOP select 3))) then {_price = 500;};
if (_class in ((AIRFIGTHER select 0)+(AIRFIGTHER select 2)+(AIRFIGTHER select 3))) then {_price = 600;};
if (_class in ((ARMEDTANKS select 0)+(ARMEDTANKS select 2)+(ARMEDTANKS select 3))) then {_price = 650;};
if (_class in ((ARMEDVEHICLES select 0)+(ARMEDVEHICLES select 2)+(ARMEDVEHICLES select 3))) then {_price = 350;};
};
};

if (typename _this == "STRING") then {
if ("MilTower" in (missionnamespace getvariable "Progress")) then {_price = _price * 0.25;} else {
if (count (nearestObjects [player, ["Land_TTowerSmall_1_F"], 30]) > 0) then {_price = _price * 0.5; "-50% prices from nearby Antenna" SPAWN HINTSAOK;};
};
};
_price