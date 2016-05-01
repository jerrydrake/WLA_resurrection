
private ["_group","_ind","_St","_Zorro","_Batman","_Bumblebeeman","_vo","_eh","_cur","_vI","_uI","_ma","_ynit","_weap","_packs","_vests","_uniF","_hats","_nul","_num","_mag","_ok"];
//if (TEST_MODE) exitWith {};
if (isClass(configFile >> "cfgVehicles" >> "AV_IndUs_AR")) then {
//_ma = + (magazines player);
player AddUniform "AV_CombatUniform_UCP";
//{player addMagazine _x;} foreach _ma;
{_x spawn SAOKDELETE;} foreach units group player - [player];
_group = [getposATL player, WEST, [FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM],[],[],[0.8,0.9]] call SpawnGroupCustom;
{
_x moveincargo vehicle player;
[_x] joinsilent player;
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
} foreach units _group;
};

disableserialization;
_ok = createDialog "StartDialog"; 
lbAdd [1500, "Hard"];
lbAdd [1500, "Challenging"];
lbAdd [1500, "Normal"];
lbAdd [1500, "Easy"];
lbSetCurSel [1500, 1];
lbAdd [1501, "Triple"];
lbAdd [1501, "Double"];
lbAdd [1501, "Normal"];
lbAdd [1501, "Half"];
lbSetCurSel [1501, 2];
lbAdd [1502, "Night"];
lbAdd [1502, "Dawn"];
lbAdd [1502, "Mid-Day"];
lbAdd [1502, "Dusk"];
lbAdd [1502, "Random"];
if (!isNil{profileNamespace getvariable "SaOkSaveWLA"}) then {
lbAdd [1502, "Saved T"];
lbSetCurSel [1502, 5];
} else {
lbSetCurSel [1505, 2];
};
lbAdd [1503, "From Tasks"];
lbAdd [1503, "All Available"];
lbSetCurSel [1503, 0];
lbAdd [1504, "Recon"];
lbAdd [1504, "Standard"];
lbAdd [1504, "Undercover"];
if (isClass(configFile >> "cfgWeapons" >> "U_PMC_GTShirt_DJeans")) then {lbAdd [1504, "PMC Team"];};
if !(isClass(configFile >> "cfgWeapons" >> "U_PMC_GTShirt_DJeans")) then {lbSetCurSel [1504, 0];} else {lbSetCurSel [1504, 2];};
lbAdd [1505, "Normal"];
lbAdd [1505, "Fog OFF"];
lbAdd [1505, "Rainy"];
lbAdd [1505, "Cloudy(D)"];
lbAdd [1505, "Sunny(D)"];
lbSetCurSel [1505, 0];

lbAdd [1506, "Normal"];
lbAdd [1506, "Faster"];
lbAdd [1506, "Disabled"];
lbSetCurSel [1506, 0];

lbAdd [1507, "FPS < 40"];
lbAdd [1507, "FPS < 30"];
lbAdd [1507, "FPS < 20"];
lbAdd [1507, "FPS < 15"];
lbSetCurSel [1507, 0];
lbAdd [1508, "Enabled"];
lbAdd [1508, "Disabled"];
lbSetCurSel [1508, 0];
lbAdd [1509, "Player ID"];
lbAdd [1509, "Gregory Jackson"];
lbAdd [1509, "Kerry Smith"];
lbAdd [1509, "John Walker"];
lbAdd [1509, "Kouris Anastas"];
lbAdd [1509, "Ryoichi Akaike"];
lbAdd [1509, "Conan O'Connor"];
lbSetCurSel [1509, 6];
lbAdd [1510, "50 meters"];
lbAdd [1510, "40 meters"];
lbAdd [1510, "30 meters"];
lbSetCurSel [1510, 1];
lbAdd [1511, "Normal"];
lbAdd [1511, "+10%"];
lbAdd [1511, "+20%"];
lbAdd [1511, "+30%"];
lbAdd [1511, "+40%"];
lbAdd [1511, "+50%"];
lbSetCurSel [1511, 1];
lbAdd [1512, "LimitedForFPS"];
lbAdd [1512, "Freedom"];
lbSetCurSel [1512, 0];
lbAdd [1513, "Enabled"];
lbAdd [1513, "Disabled"];
lbSetCurSel [1513, 0];
lbAdd [1514, "New"];
_load = 0;
if (!isNil{profileNamespace getvariable "SaOkSaveWLA"}) then {
_load = 1;
lbAdd [1514, "Resume"];
lbSetCurSel [1514, 1];
} else {
lbSetCurSel [1514, 0];
};
sleep 0.1;
_St = 0;
_Zorro = 0;
_Batman = 0;
_Bumblebeeman = 0;
SAOKFPS = 40;
PLSTREGHT = 0.5;
GUARDLIM = true;
_vo = 0;
_ind = "John_Walker";

{_x setcaptive true; _x setbehaviour "CARELESS";} foreach units group player;

while {dialog} do {
	if ((lbCurSel 1513) == 0) then {VarDisableArty = nil;};
	if ((lbCurSel 1513) == 1) then {VarDisableArty = true;};
	if ((lbCurSel 1512) == 0) then {GUARDLIM = true;};
	if ((lbCurSel 1512) == 1) then {GUARDLIM = false;};
	if ((lbCurSel 1511) == 0) then {DISVAR = 1000;};
	if ((lbCurSel 1511) == 1) then {DISVAR = 1100;};
	if ((lbCurSel 1511) == 2) then {DISVAR = 1200;};
	if ((lbCurSel 1511) == 3) then {DISVAR = 1300;};
	if ((lbCurSel 1511) == 4) then {DISVAR = 1400;};
	if ((lbCurSel 1511) == 5) then {DISVAR = 1500;};
	if ((lbCurSel 1510) == 0) then {HITEMDIS = 50;};
	if ((lbCurSel 1510) == 1) then {HITEMDIS = 40;};
	if ((lbCurSel 1510) == 2) then {HITEMDIS = 30;};
	if ((lbCurSel 1509) == 0) then {_ind = "";};
	if ((lbCurSel 1509) == 1) then {_ind = "Gregory_Jackson";};
	if ((lbCurSel 1509) == 2) then {_ind = "Kerry_Smith";};
	if ((lbCurSel 1509) == 3) then {_ind = "John_Walker";};
	if ((lbCurSel 1509) == 4) then {_ind = "Kouris_Anastas";};
	if ((lbCurSel 1509) == 5) then {_ind = "Ryoichi_Akaike";};
	if ((lbCurSel 1509) == 6) then {_ind = "Conan_OConnor";};
	if ((lbCurSel 1500) == 0) then {DIFLEVEL = 2;PLSTREGHT = 1; pisteet = 100;};
	if ((lbCurSel 1500) == 1) then {DIFLEVEL = 1;PLSTREGHT = 0.5;pisteet = 200;};
	if ((lbCurSel 1500) == 2) then {DIFLEVEL = 0.5;PLSTREGHT = 0.4;pisteet = 900;};
	if ((lbCurSel 1500) == 3) then {DIFLEVEL = 0.25;PLSTREGHT = 0.2;pisteet = 1600;};
	if ((lbCurSel 1501) == 0) then {MULTLIFE=2;};
	if ((lbCurSel 1501) == 1) then {MULTLIFE=1;};
	if ((lbCurSel 1501) == 2) then {MULTLIFE=0;};
	if ((lbCurSel 1501) == 3) then {MULTLIFE=-0.5;};
	if ((lbCurSel 1502) == 0) then {_St = 13;};
	if ((lbCurSel 1502) == 1) then {_St = 18;};
	if ((lbCurSel 1502) == 2) then {_St = 0;};
	if ((lbCurSel 1502) == 3) then {_St = 8;};
	if ((lbCurSel 1502) == 4) then {_St = random 24;};
	if ((lbCurSel 1502) == 5) then {_St = -1;};
	if ((lbCurSel 1503) == 0) then {_Zorro = 0;};
	if ((lbCurSel 1503) == 1) then {_Zorro = 1;};
	if ((lbCurSel 1504) == 0) then {_Batman = 0;};
	if ((lbCurSel 1504) == 1) then {_Batman = 1;};
	if ((lbCurSel 1504) == 3) then {_Batman = 2;};
	if ((lbCurSel 1504) == 2) then {_Batman = 3;};
	if ((lbCurSel 1505) == 0) then {FogOFF = nil; RainyW = nil;};
	if ((lbCurSel 1505) == 1) then {FogOFF = true; RainyW = nil;};
	if ((lbCurSel 1505) == 2) then {FogOFF = nil; RainyW = true;};
	if ((lbCurSel 1505) == 3) then {FogOFF = true; RainyW = nil;DisW = 1;};
	if ((lbCurSel 1505) == 4) then {FogOFF = true; RainyW = nil;DisW = 2;};
	if ((lbCurSel 1506) == 0) then {_Bumblebeeman = 0; missionnamespace setvariable ["ResTT",25];};
	if ((lbCurSel 1506) == 1) then {_Bumblebeeman = 0; missionnamespace setvariable ["ResTT",10];};
	if ((lbCurSel 1506) == 2) then {_Bumblebeeman = 1;};
	if ((lbCurSel 1507) == 3) then {SAOKFPS = 15;};
	if ((lbCurSel 1507) == 0) then {SAOKFPS = 40;};
	if ((lbCurSel 1507) == 1) then {SAOKFPS = 30;};
	if ((lbCurSel 1507) == 2) then {SAOKFPS = 20;};
	if ((lbCurSel 1508) == 0) then {_vo = 0;};
	if ((lbCurSel 1508) == 1) then {_vo = 1;};
	if ((lbCurSel 1514) == 0) then {_load = 0;};
	if ((lbCurSel 1514) == 1) then {_load = 1;};
sleep 0.1;
};
if (_load == 1) then {SAOKRESUME = true; [""] SPAWN FSaOkSave;};

{_x setcaptive false; _x setbehaviour "AWARE";} foreach units group player;
if (_Batman == 3) then {_nul = [""] SPAWN CivPlayer;};

if (isNil"SAOKRESUME") then {
if (_ind != "") then {player setIdentity _ind;missionnamespace setvariable ["CIdentity",_ind];} else {missionnamespace setvariable ["CIdentity","Gregory_Jackson"];};
};
if (_vo == 1) then {CusVoiceOff = true;};
FUNKTIO_PDA=compile preprocessfileLineNumbers "PDA.sqf";
FUNKTIO_PDA2=compile preprocessfileLineNumbers "PDA2.sqf";
if (_Bumblebeeman == 0) then {
_eh = player addEventHandler ["HandleDamage", {[_this select 0,_this select 1,_this select 2,_this select 3,_this select 4] CALL FUNKTIO_PDA}];
} else {
//NO RESPAWN
_eh = player addEventHandler ["HandleDamage", {[_this select 0,_this select 1,_this select 2,_this select 3,_this select 4] CALL FUNKTIO_PDA2}];
};

if (_St != 0) then {
ChaTime = _St;
};
sleep 1;
StartMission = true;
sleep 1;
if (!isNil"FogOFF") then {
1 setFog [0,0.1,0];
};

if (_Zorro == 1) then {
_cur = (missionnamespace getvariable "Progress");
missionnamespace setvariable ["Progress",_cur + ["USHelp","GreenHelp","ResHelp"]];
};
if (isNil"DisableUAV") then {VarVEH = VarVEH + ["O_UGV_01_rcws_F"];}; 

if (_Batman == 0) then {
{_x addPrimaryWeaponItem "muzzle_snds_H";} foreach units group player;
};

if (_Batman == 2) then {
//{_x addPrimaryWeaponItem "muzzle_snds_H";_x removeItem "muzzle_snds_H";} foreach units group player;
sleep 0.1;
_weap = ["arifle_MX_MRCO_blk_pointer_F","arifle_MX_GL_blk_ACO_pointer_F"];
_packs = ["B_Bergen_rgr_Exp"];
_vests = ["V_TacVest_darkblck","V_PlateCarrierInd_PMC_grn","V_PlateCarrierInd_PMC_blk","V_PlateCarrier1_PMC_khki","V_PlateCarrier1_PMC_rgr","V_PlateCarrier1_PMC_blk","V_PlateCarrier1_PMC_marpat"];
_uniF = ["U_PMC_WhtPolo_GrnPants","U_PMC_WhtPolo_BluPants","U_PMC_WhtPolo_BgPants","U_PMC_GrnPolo_BgPants","U_PMC_BrnPolo_BluPants","U_PMC_BrnPolo_BgPants","U_PMC_BluPolo_GrnPants","U_PMC_BlckPolo_BluPants","U_PMC_BlckPolo_BgPants","U_PMC_BgPolo_GrnPants","U_PMC_BluPolo_BgPants","U_PMC_BlackPoloShirt_BeigeCords","U_PMC_RedPlaidShirt_DenimCords","U_PMC_BluePlaidShirt_BeigeCords","U_PMC_WTShirt_DJeans","U_PMC_BluTShirt_SJeans","U_PMC_BlkTShirt_SJeans","U_PMC_BlkTShirt_DJeans","U_PMC_GTShirt_SJeans","U_PMC_GTShirt_DJeans"];
_uniF = _uniF + ["U_PMC_CombatUniformLS_ChckP_BPBB","U_PMC_CombatUniformLS_ChckLR_SPBB","U_PMC_CombatUniformLS_ChckLB_GPBB","U_PMC_CombatUniformLS_ChckDBS_GPSB","U_PMC_CombatUniformLS_SSGPSB","U_PMC_CombatUniformLS_SSGPBB","U_PMC_CombatUniformLS_SSBPBB","U_PMC_CombatUniformLS_IndPBSBB","U_PMC_CombatUniformLS_GSSPBB","U_PMC_CombatUniformLS_GSBPBB","U_PMC_CombatUniformLS_BSSPSB","U_PMC_CombatUniformLS_BSSPBB","U_PMC_CombatUniformLS_BSGPSB","U_PMC_CombatUniformLS_BSGPBB","U_PMC_CombatUniformRS_ChckP_BPBB","U_PMC_CombatUniformRS_ChckLR_SPBB","U_PMC_CombatUniformRS_ChckLB_GPBB","U_PMC_CombatUniformRS_ChckDBS_GPSB","U_PMC_CombatUniformRS_SSGPSB","U_PMC_CombatUniformRS_SSGPBB","U_PMC_CombatUniformRS_SSBPBB","U_PMC_CombatUniformRS_IndPBSBB","U_PMC_CombatUniformRS_GSSPBB","U_PMC_CombatUniformRS_GSBPBB","U_PMC_CombatUniformRS_BSSPSB","U_PMC_CombatUniformRS_BSSPBB","U_PMC_CombatUniformRS_BSGPSB","U_PMC_CombatUniformRS_BSGPBB"];
_hats = ["H_Watchcap_sgg","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_blk","H_TurbanO_blk","H_StrawHat_dark","H_StrawHat","H_ShemagOpen_tan","H_ShemagOpen_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_khk","H_Hat_tan","H_Hat_grey","H_Hat_checker","H_Hat_camo","H_Hat_brown","H_Hat_Blue","H_Cap_tan","H_Cap_Red","H_Cap_oli","H_Cap_grn_BI","H_Cap_grn","H_Cap_blu_SPECOPS","H_Cap_blu","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_blk_CMMG","H_Cap_blk","H_Booniehat_tan","H_Booniehat_mcamo","H_Booniehat_khk","H_Booniehat_indp","H_Booniehat_grn","H_Booniehat_dirty","H_Booniehat_dgtl","H_Beret_Red","H_Beret_ocamo","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF","H_Beret_blk_POLICE","H_Beret_blk","H_BandMask_reaper","H_BandMask_khk","H_BandMask_demon","H_BandMask_blk","H_Bandanna_surfer","H_Bandanna_sgg","H_Bandanna_mcamo","H_Bandanna_khk","H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_camo","H_MilCap_mcamo","H_MilCap_ocamo","H_Cap_blu","H_Cap_brn_SERO","H_Cap_Red"];
_hats = _hats + ["H_Booniehat_DMARPAT","H_Booniehat_GCAMO","H_Booniehat_rgr","H_Capbw_tan_pmc","H_Capbw_pmc","H_Cap_pmc_headphones","H_Cap_tan_pmc","H_Cap_pmc"];
sleep 0.1;

{
_vI = vestItems _x;
_uI = uniformItems _x;
_ma = + (magazines _x);
_x removeweapon (handgunWeapon _x);
_x AddUniform (_uniF call RETURNRANDOM);
if !(typeof _x in ["B_recon_medic_F","B_medic_F"]) then {_x addVest (_vests call RETURNRANDOM);} else {_x addVest "V_TacVestMedic";};
if (random 1 < 0.8) then {_x addHeadgear (_hats call RETURNRANDOM);};
_ynit = _x;
{
if (isClass(configFile >> "cfgWeapons" >> _x)) then {
_ynit addItem _x;
} else {_ynit addmagazine _x;};
} foreach _vI + _uI;
//{_ynit addMagazine _x;} foreach _ma;

} foreach units group player;
};
sleep 0.5;
if (_Batman != 0 && {_Batman != 3}) then {
{
if (random 1 < 0.8) then {_nul = [_x, [0,1] call RETURNRANDOM] SPAWN FUNKTIO_NATORUS;};
} foreach units group player; 
};

{
if (isNil{(_x getvariable "BirdNum")}) then {
_num = _x addEventHandler ["FiRed",{(_this select 0) SPAWN ScaredBirdsOnce;}];
_x setvariable ["BirdNum",_num];
};
} foreach units group player;

if (_Batman == 0 && {isClass(configFile >> "cfgVehicles" >> "AV_IndUs_AR")}) then {
{
_mag = primaryWeaponMagazine _x;
if (count _mag > 0) then {
{_x addmagazine (_mag select 0);} foreach [0,1,2,3,4];
};
} foreach units group player;
};

if (_Batman == 2 || {_Batman == 1}) then {
waitUntil {sleep 2; vehicle player == player};
if (_Batman == 1) then {
_group = [getposATL player, WEST, [FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM],[],[],[0.8,0.9]] call SpawnGroupCustom;
_n = [_group,WEST,getposATL (vehicle player),["B_G_Quadbike_01_F",2]] SPAWN VehicleArrival;
{_x setcaptive true; _x setbehaviour "CARELESS";} foreach units _group;

titletext [((name player)+": Watch where you aim, we should be meet team Charlie at any moment. They will join our team"),"PLAIN DOWN",1];
_l = ["V35","V36"] call RETURNRANDOM;
player kbTell [player, "PlaV", _l];
sleep 3;
waitUntil {sleep 3; {isNull _x || {!alive _x} || {vehicle _x == _x}} count units _group > 0};
{_x setcaptive false; _x setbehaviour "AWARE";} foreach units _group;
{
_nul = [_x, [0,1] call RETURNRANDOM] SPAWN FUNKTIO_NATORUS;
[_x] joinsilent player;
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
} foreach units _group;
};
if (_Batman == 2) then {
{_x removePrimaryWeaponItem "muzzle_snds_H";_x removeItem "muzzle_snds_H";} foreach units group player;
_group = [getposATL player, WEST, [FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM],[],[],[0.8,0.9]] call SpawnGroupCustom;
{_x setcaptive true; _x setbehaviour "CARELESS";} foreach units _group;
sleep 0.1;
_weap = ["arifle_MX_MRCO_blk_pointer_F","arifle_MX_GL_blk_ACO_pointer_F"];
_packs = ["B_Bergen_rgr_Exp"];
_vests = ["V_TacVest_darkblck","V_PlateCarrierInd_PMC_grn","V_PlateCarrierInd_PMC_blk","V_PlateCarrier1_PMC_khki","V_PlateCarrier1_PMC_rgr","V_PlateCarrier1_PMC_blk","V_PlateCarrier1_PMC_marpat"];
_uniF = ["U_PMC_WhtPolo_GrnPants","U_PMC_WhtPolo_BluPants","U_PMC_WhtPolo_BgPants","U_PMC_GrnPolo_BgPants","U_PMC_BrnPolo_BluPants","U_PMC_BrnPolo_BgPants","U_PMC_BluPolo_GrnPants","U_PMC_BlckPolo_BluPants","U_PMC_BlckPolo_BgPants","U_PMC_BgPolo_GrnPants","U_PMC_BluPolo_BgPants","U_PMC_BlackPoloShirt_BeigeCords","U_PMC_RedPlaidShirt_DenimCords","U_PMC_BluePlaidShirt_BeigeCords","U_PMC_WTShirt_DJeans","U_PMC_BluTShirt_SJeans","U_PMC_BlkTShirt_SJeans","U_PMC_BlkTShirt_DJeans","U_PMC_GTShirt_SJeans","U_PMC_GTShirt_DJeans"];
_uniF = _uniF + ["U_PMC_CombatUniformLS_ChckP_BPBB","U_PMC_CombatUniformLS_ChckLR_SPBB","U_PMC_CombatUniformLS_ChckLB_GPBB","U_PMC_CombatUniformLS_ChckDBS_GPSB","U_PMC_CombatUniformLS_SSGPSB","U_PMC_CombatUniformLS_SSGPBB","U_PMC_CombatUniformLS_SSBPBB","U_PMC_CombatUniformLS_IndPBSBB","U_PMC_CombatUniformLS_GSSPBB","U_PMC_CombatUniformLS_GSBPBB","U_PMC_CombatUniformLS_BSSPSB","U_PMC_CombatUniformLS_BSSPBB","U_PMC_CombatUniformLS_BSGPSB","U_PMC_CombatUniformLS_BSGPBB","U_PMC_CombatUniformRS_ChckP_BPBB","U_PMC_CombatUniformRS_ChckLR_SPBB","U_PMC_CombatUniformRS_ChckLB_GPBB","U_PMC_CombatUniformRS_ChckDBS_GPSB","U_PMC_CombatUniformRS_SSGPSB","U_PMC_CombatUniformRS_SSGPBB","U_PMC_CombatUniformRS_SSBPBB","U_PMC_CombatUniformRS_IndPBSBB","U_PMC_CombatUniformRS_GSSPBB","U_PMC_CombatUniformRS_GSBPBB","U_PMC_CombatUniformRS_BSSPSB","U_PMC_CombatUniformRS_BSSPBB","U_PMC_CombatUniformRS_BSGPSB","U_PMC_CombatUniformRS_BSGPBB"];
_hats = ["H_Watchcap_sgg","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_blk","H_TurbanO_blk","H_StrawHat_dark","H_StrawHat","H_ShemagOpen_tan","H_ShemagOpen_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_khk","H_Hat_tan","H_Hat_grey","H_Hat_checker","H_Hat_camo","H_Hat_brown","H_Hat_Blue","H_Cap_tan","H_Cap_Red","H_Cap_oli","H_Cap_grn_BI","H_Cap_grn","H_Cap_blu_SPECOPS","H_Cap_blu","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_blk_CMMG","H_Cap_blk","H_Booniehat_tan","H_Booniehat_mcamo","H_Booniehat_khk","H_Booniehat_indp","H_Booniehat_grn","H_Booniehat_dirty","H_Booniehat_dgtl","H_Beret_Red","H_Beret_ocamo","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF","H_Beret_blk_POLICE","H_Beret_blk","H_BandMask_reaper","H_BandMask_khk","H_BandMask_demon","H_BandMask_blk","H_Bandanna_surfer","H_Bandanna_sgg","H_Bandanna_mcamo","H_Bandanna_khk","H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_camo","H_MilCap_mcamo","H_MilCap_ocamo","H_Cap_blu","H_Cap_brn_SERO","H_Cap_Red"];
_hats = _hats + ["H_Booniehat_DMARPAT","H_Booniehat_GCAMO","H_Booniehat_rgr","H_Capbw_tan_pmc","H_Capbw_pmc","H_Cap_pmc_headphones","H_Cap_tan_pmc","H_Cap_pmc"];
sleep 0.1;
_n = [_group,WEST,getposATL (vehicle player)] SPAWN VehicleArrival;
titletext [((name player)+": Watch where you aim, we should be meet team Charlie at any moment. They will join our team"),"PLAIN DOWN",1];
sleep 3;
waitUntil {sleep 3; {isNull _x || {!alive _x} || {vehicle _x == _x}} count units _group > 0};
{_x setcaptive false; _x setbehaviour "AWARE";} foreach units _group;
{
[_x] joinsilent player;
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
_vI = vestItems _x;
_uI = uniformItems _x;
_ma = + (magazines _x);
_x removeweapon (handgunWeapon _x);
_x AddUniform (_uniF call RETURNRANDOM);
if !(typeof _x in ["B_recon_medic_F","B_medic_F"]) then {_x addVest (_vests call RETURNRANDOM);} else {_x addVest "V_TacVestMedic";};
if (random 1 < 0.8) then {_x addHeadgear (_hats call RETURNRANDOM);};
_ynit = _x;

{
if (isClass(configFile >> "cfgWeapons" >> _x)) then {
_ynit addItem _x;
} else {_ynit addmagazine _x;};
} foreach _vI + _uI;
//{_ynit addMagazine _x;} foreach _ma;
if ("30Rnd_65x39_caseless_mag" in _ma) then {
_x addWeapon (_weap call RETURNRANDOM);
};
} foreach units _group;
sleep 0.1;
};
};

{if (handgunWeapon _x != "") then {_x removeweapon (handgunWeapon _x);};} foreach units group player - [player];


