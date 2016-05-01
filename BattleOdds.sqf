//values per index 0. choppers, 1. planes, 2. tanks, 3. armored vehicles, 4. cars/boats, 5. infantry, 6. mortar/static weapon, 7. arty 8. boat
private ["_type","_streght","_icon","_name"];
_type = 4;
_streght = [];
_icon = "";
_name = "";
_am = [];
switch _this do {
//SPEEDBOATS
case "I_Heli_light_03_F": {_type = 0;_streght = [3,2,2,4,6,5,2,1,6];};

case "O_Boat_Armed_01_hmg_F": {_type = 8;_streght = [3,3,2,3,5,5,5,2,5];};
case "I_Boat_Armed_01_minigun_F": {_type = 8;_streght = [3,3,2,3,5,5,5,2,5];};
case "B_Boat_Armed_01_minigun_F": {_type = 8;_streght = [3,3,2,3,5,5,5,2,5];};
//UGV
case "I_UGV_01_rcws_F": {_type = 4;_streght = [1,1,2,3,8,8,8,3,8];};
case "O_UGV_01_rcws_F": {_type = 4;_streght = [1,1,2,3,8,8,8,3,8];};
case "B_UGV_01_rcws_F": {_type = 4;_streght = [1,1,2,3,8,8,8,3,8];};
//"Greyhawk UAV"
case "O_UAV_02_CAS_F": {_type = 1;_streght = [1,1,28,28,28,1,1,28,28];};
case "I_UAV_02_CAS_F": {_type = 1;_streght = [1,1,28,28,28,1,1,28,28];};
case "B_UAV_02_CAS_F": {_type = 1;_streght = [1,1,28,28,28,1,1,28,28];};
//"Blackfoot"
case "B_Heli_Attack_01_F": {_type = 0;_streght = [5,2,17,18,19,5,5,19,19];};
case "O_Heli_Attack_02_F": {_type = 0;_streght = [5,2,17,18,19,5,5,19,19];};
case "O_Heli_Attack_02_black_F": {_type = 0;_streght = [5,2,17,18,19,5,5,19,19];};
//"Littlebird"
case "B_Heli_Light_01_armed_F": {_type = 0;_streght = [2,1,2,3,5,5,5,2,5];};
//"Buzzard AA"
case "I_Plane_Fighter_03_AA_F": {_type = 1;_streght = [27,27,4,4,2,2,2,1,2];};
//"Buzzard CAS"
case "I_Plane_Fighter_03_CAS_F": {_type = 1;_streght = [2,2,28,28,29,2,1,29,29];};

case "O_Plane_CAS_02_F": {_type = 1;_streght = [4,4,29,30,30,3,1,29,29];};

case "B_Plane_CAS_01_F": {_type = 1;_streght = [3,3,30,30,30,3,1,29,29];};

//"WY-55 Hellcat MG"
case "I_Heli_light_03_F": {_type = 0;_streght = [3,2,2,4,6,5,2,1,6];};
//"Offroad MG"
case "I_G_Offroad_01_armed_F": {_type = 4;_streght = [3,2,1,2,5,6,2,1,5];};
//"Hunter HMG"
case "B_MRAP_01_hmg_F": {_type = 4;_streght = [4,2,1,3,6,7,2,1,6];};
case "O_MRAP_02_hmg_F": {_type = 3;_streght = [4,2,1,3,6,7,2,1,6];};
//"Hunter GMG"
case "B_MRAP_01_gmg_F": {_type = 4;_streght = [1,1,3,5,8,8,3,2,8];};
case "O_MRAP_02_gmg_F": {_type = 3;_streght = [1,1,3,5,8,8,3,2,8];};
//"Strider HMG"
case "I_MRAP_03_hmg_F": {_type = 3;_streght = [4,2,1,3,6,7,2,1,6];};
//"Strider GMG"
case "I_MRAP_03_gmg_F": {_type = 3;_streght = [1,1,3,5,8,8,3,2,8];};
//"Cheetah"
case "B_APC_Tracked_01_AA_F": {_type = 3;_streght = [15,5,3,7,5,5,5,4,5];};
case "O_APC_Tracked_02_AA_F": {_type = 3;_streght = [15,5,3,7,5,5,5,4,5];};
//"Gordon"
case "I_APC_Wheeled_03_cannon_F": {_type = 3;_streght = [4,1,1,5,7,7,2,3,7];};
//"FV-720 Mora"
case "I_APC_tracked_03_cannon_F": {_type = 3;_streght = [4,1,1,5,8,8,2,4,8];};
//"Bobcat"
case "B_APC_Tracked_01_CRV_F": {_type = 2;_streght = [3,1,1,5,8,8,2,4,8];};
//"Slammer"
case "B_MBT_01_cannon_F": {_type = 2;_streght = [3,1,7,9,9,5,4,9,9];};
case "O_MBT_02_cannon_F": {_type = 2;_streght = [3,1,7,9,9,5,4,9,9];};
//"MBT-52 Kuma"
case "I_MBT_03_cannon_F": {_type = 2;_streght = [3,1,6,9,9,5,4,9,9];};
//"Marshall"
case "B_APC_Wheeled_01_cannon_F": {_type = 3;_streght = [4,1,1,4,7,7,7,2,7];};
case "O_APC_Wheeled_02_rcws_F": {_type = 3;_streght = [1,1,2,5,8,8,8,3,8];};
//"Panther"
case "B_APC_Tracked_01_rcws_F": {_type = 3;_streght = [1,1,3,6,8,8,8,4,8];};
case "O_APC_Tracked_02_cannon_F": {_type = 3;_streght = [6,4,3,6,8,8,8,4,8];};
//"Scorcher"
case "B_MBT_01_arty_F": {_type = 7;_streght = [1,1,5,7,16,23,23,3,7];};
case "O_MBT_02_arty_F": {_type = 7;_streght = [1,1,5,7,16,23,23,3,7];};
//"Sandstorm"
case "B_MBT_01_mlrs_F": {_type = 6;_streght = [1,1,5,7,16,23,23,3,7];};
//"Mortar"
case "Bobcat": {_type = 6;_streght = [1,1,3,4,5,5,4,2,5];};

////CUSTOM TYPES 
//FULLY, NO LOSS ICON/NAME
case "B_Infantry": {_type = 5;_streght = [3,3,4,4,5,5,4,4,4];_icon = "b_inf";_name = "Infanty Squad";};
case "I_Infantry": {_type = 5;_streght = [3,3,4,4,5,5,4,4,4];_icon = "n_inf";_name = "Infanty Squad";};
case "O_Infantry": {_type = 5;_streght = [3,3,4,4,5,5,4,4,4];_icon = "o_inf";_name = "Infanty Squad";};
case "B_ATgroup": {_type = 5;_streght = [1,1,7,7,7,3,3,7,8];_icon = "b_inf";_name = "AT Guard";};
case "I_ATgroup": {_type = 5;_streght = [1,1,7,7,7,3,3,7,8];_icon = "n_inf";_name = "AT Guard";};
case "O_ATgroup": {_type = 5;_streght = [1,1,7,7,7,3,3,7,8];_icon = "o_inf";_name = "AT Guard";};
case "B_AAgroup": {_type = 5;_streght = [7,6,2,3,4,3,3,3,2];_icon = "b_inf";_name = "AA Guard";};
case "I_AAgroup": {_type = 5;_streght = [7,6,2,3,4,3,3,3,2];_icon = "n_inf";_name = "AA Guard";};
case "O_AAgroup": {_type = 5;_streght = [7,6,2,3,4,3,3,3,2];_icon = "o_inf";_name = "AA Guard";};
case "B_Snipergroup": {_type = 5;_streght = [3,2,2,1,5,6,7,2,7];_icon = "b_inf";_name = "Sniper Guard";};
case "O_Snipergroup": {_type = 5;_streght = [3,2,2,1,5,6,7,2,7];_icon = "o_inf";_name = "Sniper Guard";};
case "I_Snipergroup": {_type = 5;_streght = [3,2,2,1,5,6,7,2,7];_icon = "n_inf";_name = "Sniper Guard";};
case "B_MGgroup": {_type = 5;_streght = [3,2,2,2,4,6,5,2,6];_icon = "b_inf";_name = "MG Guard";};
case "O_MGgroup": {_type = 5;_streght = [3,2,2,2,4,6,5,2,6];_icon = "o_inf";_name = "MG Guard";};
case "I_MGgroup": {_type = 5;_streght = [3,2,2,2,4,6,5,2,6];_icon = "n_inf";_name = "MG Guard";};
case "B_Medicgroup": {_type = 5;_streght = [2,1,1,1,2,2,3,2,3];_icon = "b_med";_name = "Medic Guard";};
case "O_Medicgroup": {_type = 5;_streght = [2,1,1,1,2,2,3,2,3];_icon = "o_med";_name = "Medic Guard";};
case "I_Medicgroup": {_type = 5;_streght = [2,1,1,1,2,2,3,2,3];_icon = "n_med";_name = "Medic Guard";};
//HAVE CLASS, NO LOSS ICON, BUT HAVE NAME
//MG
case "B_HMG_01_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "b_unknown";};
case "B_HMG_01_high_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "b_unknown";};
case "B_HMG_01_A_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "b_unknown";};
case "O_HMG_01_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "o_unknown";};
case "O_HMG_01_high_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "o_unknown";};
case "O_HMG_01_A_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "o_unknown";};
case "I_HMG_01_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "n_unknown";};
case "I_HMG_01_high_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "n_unknown";};
case "I_HMG_01_A_F": {_type = 6;_streght = [4,3,1,2,16,17,4,1,5];_icon = "n_unknown";};
//GL
case "B_GMG_01_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "b_unknown";};
case "B_GMG_01_high_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "b_unknown";};
case "B_GMG_01_A_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "b_unknown";};
case "O_GMG_01_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "o_unknown";};
case "O_GMG_01_high_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "o_unknown";};
case "O_GMG_01_A_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "o_unknown";};
case "I_GMG_01_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "n_unknown";};
case "I_GMG_01_high_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "n_unknown";};
case "I_GMG_01_A_F": {_type = 6;_streght = [2,1,2,4,18,18,16,2,17];_icon = "n_unknown";};
//AT
case "B_static_AT_F": {_type = 6;_streght = [1,1,17,18,19,2,2,18,18];_icon = "b_unknown";};
case "O_static_AT_F": {_type = 6;_streght = [1,1,17,18,19,2,2,18,18];_icon = "o_unknown";};
case "I_static_AT_F": {_type = 6;_streght = [1,1,17,18,19,2,2,18,18];_icon = "n_unknown";};
//AA
case "B_static_AA_F": {_type = 6;_streght = [18,16,2,3,3,2,2,2,2];_icon = "b_unknown";};
case "O_static_AA_F": {_type = 6;_streght = [18,16,2,3,3,2,2,2,2];_icon = "o_unknown";};
case "I_static_AA_F": {_type = 6;_streght = [18,16,2,3,3,2,2,2,2];_icon = "n_unknown";};
//MORTAR
case "B_Mortar_01_F": {_type = 6;_streght = [1,1,2,3,15,16,16,2,3];_icon = "b_mortar";};
case "O_Mortar_01_F": {_type = 6;_streght = [1,1,2,3,15,16,16,2,3];_icon = "o_mortar";};
case "I_Mortar_01_F": {_type = 6;_streght = [1,1,2,3,15,16,16,2,3];_icon = "n_mortar";};
case "B_G_Mortar_01_F": {_type = 6;_streght = [1,1,2,3,15,16,16,2,3];_icon = "n_mortar";};
};

if (_this in ["O_Heli_Transport_04_F","O_Heli_Transport_04_medevac_black_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_black_F","O_Heli_Transport_04_repair_F","O_Heli_Transport_04_fuel_black_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_ammo_black_F","O_Heli_Transport_04_ammo_F"]) then {
_type = 0;_streght = [1,1,1,1,1,1,1,1,1];
};

if (count _streght == 0) then {
if ({_this in _x} count ARMEDVEHICLES > 0) then {_type = 3;_streght = [4,1,1,4,7,7,7,2,7];};
if ({_this in _x} count ARMEDTANKS > 0) then {_type = 2;_streght = [3,1,7,9,9,5,4,9,9];};
if ({_this in _x} count ARMEDAA > 0) then {_type = 3;_streght = [15,5,3,7,5,5,5,4,5];};
if ({_this in _x} count AIRFIGTHER > 0) then {_type = 1;_streght = [2,2,28,28,29,2,1,29,29];};
if ({_this in _x} count AIRARMCHOP > 0) then {_type = 0;_streght = [5,2,27,28,29,5,5,29,29];};
};

if (count _streght == 0) then {_streght = [0.01,0.01,0.01,0.01,0.01,0.1,0.1,0.1,0.1];};

switch _type do {
case 0: {_am = ["AA","MINUGUN"];};
case 1: {_am = ["AA","MINUGUN"];};
case 2: {_am = ["AT","Bo_","LGB","DAR","MISSILE"];};
case 3: {_am = ["AT","Bo_","LGB","HE","AMOS","GPS","MP","DAR","MISSILE","BELT"];};
case 4: {_am = ["AT","Bo_","LGB","HE","AP","AMOS","GPS","MP","MINUGUN","DAR","MISSILE","BELT"];};
case 5: {_am = ["MG","HE","AP","AMOS","GPS","MP","MINUGUN","DAR","BELT"];};
case 6: {_am = ["MG","Bo_","LGB","HE","AP","AMOS","GPS","MP","MINUGUN","DAR","MISSILE","BELT"];};
case 7: {_am = ["AT","Bo_","LGB","AMOS","GPS","DAR","MISSILE"];};
case 8: {_am = ["AT","Bo_","LGB","AMOS","GPS","MP","MINUGUN","DAR","MISSILE","BELT"];};
};
//values per index 0. choppers, 1. planes, 2. tanks, 3. armored vehicles, 4. cars/boats, 5. infantry, 6. mortar/static weapon, 7. arty 8. boat
//if (_type == -1) then {hint format ["%1"]}
[_type,_streght,_icon,_name,_am]