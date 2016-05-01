private ["_weR","_maR"];
if (!isNil"IFENABLED") exitWith {};
removeGoggles (_this select 0); 
removeUniform (_this select 0); 
removeVest (_this select 0); 
removeHeadgear (_this select 0); 
(_this select 0) setvariable ["DAPPED",true];
(_this select 0) unassignItem "NVGoggles";
(_this select 0) removeItem "NVGoggles";
(_this select 0) unassignItem "NVGoggles_INDEP";
(_this select 0) removeItem "NVGoggles_INDEP";
(_this select 0) unassignItem "NVGoggles_OPFOR";
(_this select 0) removeItem "NVGoggles_OPFOR";
[(_this select 0),(["U_NikosBody","U_Rangemaster","U_IG_leader","U_IG_Guerilla3_2","U_IG_Guerilla3_1","U_IG_Guerilla2_3","U_IG_Guerilla2_2","U_IG_Guerilla1_1","U_C_Poor_1","U_C_Poloshirt_tricolour","U_C_Poloshirt_stripped","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Poloshirt_burgundy","U_C_Poloshirt_Blue","U_C_HunterBody_grn","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_tricolour","U_C_Poloshirt_redwhite","U_C_Poloshirt_stripped"] call RETURNRANDOM)] CALL SAOKADDUNIFORM;
if (random 1 < 0.4) then {(_this select 0) addHeadgear (["H_Watchcap_sgg","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_blk","H_TurbanO_blk","H_StrawHat_dark","H_StrawHat","H_ShemagOpen_tan","H_ShemagOpen_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_khk","H_Hat_tan","H_Hat_grey","H_Hat_checker","H_Hat_camo","H_Hat_brown","H_Hat_Blue","H_Cap_tan","H_Cap_Red","H_Cap_oli","H_Cap_grn_BI","H_Cap_grn","H_Cap_blu_SPECOPS","H_Cap_blu","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_blk_CMMG","H_Cap_blk","H_Booniehat_tan","H_Booniehat_mcamo","H_Booniehat_khk","H_Booniehat_indp","H_Booniehat_grn","H_Booniehat_dirty","H_Booniehat_dgtl","H_Beret_Red","H_Beret_ocamo","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF","H_Beret_blk_POLICE","H_Beret_blk","H_BandMask_reaper","H_BandMask_khk","H_BandMask_demon","H_BandMask_blk","H_Bandanna_surfer","H_Bandanna_sgg","H_Bandanna_mcamo","H_Bandanna_khk","H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_camo","H_MilCap_mcamo","H_MilCap_ocamo","H_Cap_blu","H_Cap_brn_SERO","H_Cap_Red"] call RETURNRANDOM);};


removeAllWeapons (_this select 0); 


_weR = SAOKps call RETURNRANDOM;
_maR = (getArray (configfile >> "CfgWeapons" >> _weR >> "magazines")) call RETURNRANDOM;
_t = 0;
while {(typename _maR == "ARRAY" || {_maR == "30Rnd_65x39_case_mag"} || {!isClass(configFile >> "cfgMagazines" >> _maR)} || {(getNumber (configfile >> "CfgMagazines" >> _maR >> "scope")) == 0}) && {_t < 7}} do {
_weR = SAOKps call RETURNRANDOM;
_maR = (getArray (configfile >> "CfgWeapons" >> _weR >> "magazines")) call RETURNRANDOM;
_t = _t + 1;
};
{if ((_this select 0) canAdd _maR) then {(_this select 0) addmagazine _maR;};sleep 0.01;} foreach [0,1,2,3,4];
(_this select 0) addweapon _weR;
sleep 1;
if (primaryWeapon (_this select 0) != "") then {(_this select 0) selectweapon (primaryWeapon (_this select 0));};


