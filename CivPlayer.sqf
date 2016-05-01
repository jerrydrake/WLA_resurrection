private ["_p2","_p1","_ps","_uniforms","_bp","_Vest","_itS","_itP","_da","_pP","_hat","_uni","_typeOf","_we","_uI","_vI","_t","_mag","_mag2","_boll","_bolll","_nul","_forEachIndex","_n","_capBol","_ok","_pM","_rmusic","_c1","_c2","_c3","_c4","_c5","_c6","_c7","_d1","_d2","_mar6","_someId"];
//START
sleep (random 0.2);
_boll = true;
_bolll = false;
if (typename _this == "ARRAY" && {locationposition (["ColorBlue"] CALL NEARESTCAMP) distance vehicle player < 20}) exitWith {SAOKBUT = nil;};
if (typename _this == "ARRAY" && {!isNil"CIVMODE"}) exitWith {"You are already in civilian mode, you can reset away from it by visiting any friendly camp and pressing ALT+Y - near the flag" SPAWN HINTSAOK;SAOKBUT = nil;};
if (typename _this == "ARRAY") then {
if (!isNil"IFENABLED") exitWith {SAOKBUT = nil;};
if (isNil"StartMission") then {_boll = false;};
sleep (random 0.1);
_ps = getposASL player;
_p1 = [_ps select 0,_ps select 1,(_ps select 2) + 0.6];
_p2 = [_ps select 0,_ps select 1,(_ps select 2) + 6.6];
if (count _this == 0) then {
if (nearestbuilding player distance player > 10 || {!(lineIntersects [_p1,_p2])} || {{side _x == EAST && {_x distance vehicle player < 100} && {[player, _x] CALL FUNKTIO_LOS}} count allUnits > 0}) exitWith {hint "You need to be inside house and unseen by CSAT to turn into civilian";_bolll = true;};
};
} else {_boll = false;};
if (_bolll) exitWith {};
CIVMODE = true;
SAOKBUT = nil;
if (_boll) then {
titlecut ["","black out",1];
sleep 1;
};
{_nul = [_x] SPAWN FHideAndDelete;} foreach units group player - [player];
player setcaptive true;
_vI = vestItems player;
_uI = uniformItems player;
_bp = Backpack player;
_mag = primaryWeaponMagazine player;
_mag2 = secondaryWeaponMagazine player;
removeBackpack player;
_we = + (weapons player);
if (handgunWeapon player != "") then {_we = _we - [handgunWeapon player];};
_pM = handgunMagazine player;
_typeOf = typeOf player;
_uni = uniform player;
_hat = headgear player;
_pP = getposATL player;
_da= damage player;
_Vest = Vest player;
_itP = if (!isNil{primaryWeaponItems player}) then {primaryWeaponItems player} else {[]};
_itS = if (!isNil{secondaryWeaponItems player}) then {secondaryWeaponItems player} else {[]};
removeallweapons player;
removeHeadgear player;
removeVest player;
removeUniform player; 
player addGoggles (["G_Tactical_Black","G_Tactical_Clear"]call RETURNRANDOM);
//_uniforms = ["U_C_Poor_1","U_C_Poloshirt_tricolour","U_C_Poloshirt_stripped","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Poloshirt_burgundy","U_C_Poloshirt_Blue","U_C_HunterBody_grn","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_tricolour","U_C_Poloshirt_redwhite","U_C_Poloshirt_stripped"];
_uniforms = ["U_Rangemaster","U_Competitor","U_BG_Guerilla3_1","U_BG_Guerilla3_2","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_C_Poor_1","U_C_Journalist","U_NikosAgedBody"];
[player,(_uniforms call RETURNRANDOM)] CALL SAOKADDUNIFORM;
if (random 1 < 0.4) then {player addHeadgear (["H_Watchcap_sgg","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_blk","H_TurbanO_blk","H_StrawHat_dark","H_StrawHat","H_Hat_tan","H_Hat_grey","H_Hat_checker","H_Hat_camo","H_Hat_brown","H_Hat_Blue","H_Cap_tan","H_Cap_Red","H_Cap_oli","H_Cap_grn_BI","H_Cap_grn","H_Cap_blu_SPECOPS","H_Cap_blu","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_blk_CMMG","H_Cap_blk","H_Booniehat_tan","H_Booniehat_mcamo","H_Booniehat_khk","H_Booniehat_indp","H_Booniehat_grn","H_Booniehat_dirty","H_Booniehat_dgtl","H_Beret_Red","H_Beret_ocamo","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF","H_Beret_blk_POLICE","H_Beret_blk","H_BandMask_reaper","H_BandMask_khk","H_BandMask_demon","H_BandMask_blk","H_Bandanna_surfer","H_Bandanna_sgg","H_Bandanna_mcamo","H_Bandanna_khk","H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_camo","H_MilCap_mcamo","H_MilCap_ocamo","H_Cap_blu","H_Cap_brn_SERO","H_Cap_Red"] call RETURNRANDOM);};
player addBackpack "C_Bergen_grn";
clearMagazineCargo BackpackContainer player;
clearWeaponCargo BackpackContainer player;
clearItemCargo BackpackContainer player;
player addVest "V_Press_F";
clearMagazineCargo VestContainer player;
clearWeaponCargo VestContainer player;
clearItemCargo VestContainer player;
(backpackContainer player) addweaponcargo [(["hgun_PDW2000_snds_F","hgun_PDW2000_Holo_snds_F"] call RETURNRANDOM),1];
(backpackContainer player) addmagazinecargo ["30Rnd_9x21_Mag",5];
//hgun_PDW2000_snds_F hgun_PDW2000_Holo_snds_F  30Rnd_9x21_Mag  16Rnd_9x21_Mag 
player addweapon "hgun_Pistol_heavy_01_snds_F";
player addmagazine "11Rnd_45ACP_Mag";
player addmagazine "11Rnd_45ACP_Mag";
player addmagazine "11Rnd_45ACP_Mag";
player addmagazine "11Rnd_45ACP_Mag";
player addmagazine "SatchelCharge_Remote_Mag";
player addmagazine "SatchelCharge_Remote_Mag";
player addmagazine "SatchelCharge_Remote_Mag";
//player addmagazine "APERSMine_Range_Mag";
//player addmagazine "APERSTripMine_Wire_Mag"; ["FR_Helios_StealthIV"] SPAWN MusicP;
sleep 2;
_rmusic = ["FR_Helios_StealthIV","FR_Helios_StealthII","FR_Helios_Stealth","FR_Helios_Intro"]call RETURNRANDOM;
[_rmusic] SPAWN MusicP;
[["WLA","UnderCoverMode"]] call BIS_fnc_advHint;
if (_boll) then {
titlecut ["","black in",2];
};
//hint format ["%1 %2 %3",handgunWeapon player,weapons player,getweaponCargo backpackContainer player];
//HAVE NOT ALLOWED WEAPON
_c1 = {
private ["_bol","_wP","_cWs","_wC","_n","_cA","_ws","_ns"];
_bol = false;
_wP = + (weapons player);
_cWs = [];
if (!isNull (backpackContainer player)) then {
_wC = getweaponCargo (backpackContainer player);
_ws = _wC select 0;
_ns = _wC select 1;
_cA = (count _ws) - 1;
while {_cA >= 0} do {
_n = _ns select _cA;
while {_n > 0} do {_n = _n - 1;_cWs pushback (_ws select _cA);};
_cA = _cA - 1;
};
};
{_wP = _wP - [_x];} foreach _cWs;
_vP = vehicle player;
if (_vP == player || {_vP != player && {driver _vP != player}}) then {
if (count _wP > 0 || {!(uniform player in _this)} || {!(vest player in ["","V_Press_F"])}) then {_bol = true;};
};
_bol
};
//VISIT CSAT CAMP {gettext (configfile >> "CfgWeapons" >> _x >> "Cursor") != "hgun"}
_c2 = {
private ["_bol"];
_bol = false;
if ((locationposition (["ColorRed"] CALL NEARESTCAMP) distance vehicle player < 50 || {([player,"ColorRed"] CALL NEARESTGUARDPOST) distance vehicle player < 50}) && {side _x == EAST && {_x distance vehicle player < 100} && {[player, _x] CALL FUNKTIO_LOS}} count allUnits > 0) then {_bol = true;};
_bol
};
//RETURN TO BASE
_c3 = {
private ["_bol"];
_bol = false;
if ((!isNil"EXITUNDEC" && {locationposition (["ColorBlue"] CALL NEARESTCAMP) distance vehicle player < 20}) || {getmarkerpos _this distance player < 3}) then {_bol = true;};
_bol
};

//WRONG VEHICLE 
_c4 = {
private ["_bol","_vB"];
_bol = false;
_vB = (vehicle player);
if (_vB != player && {((toString [(toArray (typeof _vB)) select 0] != "C" && {!((typeof _vB) in ["B_Heli_Light_01_F","I_G_Van_01_transport_F"])}) || {_vB in BVEHI})}) then {_bol = true;};
_bol
};

//TOO NEAR
_c5 = {
private ["_bol2","_bol","_p","_us"];
_bol = false;
_bol2 = false;
{if (!captive _x && {side _x == EAST} && {[player, _x] CALL FUNKTIO_LOS}) then {_bol2 = true;if (isNil{_x getvariable "Annoyed"}) then {_x setvariable ["Annoyed",1];} else {_x setvariable ["Annoyed",(_x getvariable "Annoyed")+1];};};} foreach ((getposATL player) nearEntities [["Man"],10]);
if (({alive _x && {!captive _x} && {side _x == EAST} && {!isNil{_x getvariable "Annoyed"}} && {(_x getvariable "Annoyed") > 4}} count ((getposATL player) nearEntities [["Man"],10]) > 0)) then {_bol = true;};
if (_bol2 && {!_bol} && {captive player}) then {
_p = ["HOSTILE: Step back!","HOSTILE: Step back, civilian!","HOSTILE: Get away!","HOSTILE: What are you trying?!","HOSTILE: Out of my sight!","HOSTILE: Hey you, back off!","HOSTILE: Move or die!"] call RETURNRANDOM;
_us = [];
{if (!captive _x && {side _x == EAST} && {[player, _x] CALL FUNKTIO_LOS}) then {_us pushBack _x;};} foreach ((getposATL player) nearEntities [["Man"],10]);
if (count _us > 0) then {[(_us call RETURNRANDOM),_p] SPAWN FUnitSay;} else {titlecut [_p,"PLAIN DOWN",2];};
};
_bol
};

//HAVE NVGOGGLES assignedItems
_c6 = {
private ["_bol"];
_bol = false;
if ("NVGoggles" in (assignedItems player)) then {
if ({[player, _x] CALL FUNKTIO_LOS && {side _x == EAST}} count ((getposATL player) nearEntities [["Man"],15]) > 0) then {_bol = true;};
};
_bol
};


//IN NOT ALLOWED CUSTOM AREA
_c7 = {
private ["_bol","_dis","_pp","_c"];
_bol = false;
_c = count FORBITTENCEN - 1;
if (_c > -1) then {
for "_i" from 0 to _c do {
private ["_cen"];
_cen = FORBITTENCEN select _i;
if (!isNil{_cen getvariable "BArea"}) then {
_dis = _cen getvariable "BArea";
_pp = _cen worldToModel (getposATL player);
if (_pp select 0 < _dis && {_pp select 1 < _dis}) then {_bol = true;};
};
};
};
_bol
};





SPWITHW = [];
_d1 = {

private ["_hostiles","_c"];
_hostiles = (getposATL player) nearEntities [["Man"],200];
_c = count _hostiles - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _hostiles select _i;
if (alive _xx && {side _xx == EAST} && {!(_xx in SPWITHW)} && {[player, _xx] CALL FUNKTIO_LOS}) then {SPWITHW pushBack _xx;};
sleep 0.05;
};
};

_d2 = {

private ["_hostiles","_c"];
_hostiles = + SPWITHW;
_c = count _hostiles - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _hostiles select _i;
if (alive _xx && {[player, _xx] CALL FUNKTIO_LOS}) exitWith {player setcaptive false;};
sleep 0.05;
};
};
_mar6 = ["CivPlayerM",getposATL player,"hd_pickup",[0.9,0.9],"ColorGreen","Exit Undercover Mode"] CALL FUNKTIO_CREATEMARKER;
_someId = format ["IDSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	_pos = getmarkerpos _this;
	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORGREEN, _pos,1.51, 1.51, 0, (format ["Exit Undercover Mode: %1m",round (_pos distance player)]), 1, SAOKFSI, "TahomaB"];
}, _mar6] call BIS_fnc_addStackedEventHandler;
waitUntil {sleep 3; locationposition (["ColorBlue"] CALL NEARESTCAMP) distance vehicle player >= 30 && {getmarkerpos _mar6 distance player > 30}};
_ok = true;
while {_ok} do {
_capBol = true;
sleep 0.1;
{if (isNil"_x" || {isNull _x} || {!alive _x}) exitWith {_deAT = SPWITHW deleteAt _forEachIndex;};} foreach SPWITHW;
sleep 0.1;
//SOME CSAT REMEMBERING PLAYER AS BADGUY
if (captive player) then {
_n = [] spawn _d2;
_capBol = false;
};
sleep 0.2;
//ADDS HOSTILES THAT IS SEEING PLAYER WHEN DETECTED
if (!captive player) then {
_n = [] spawn _d1;
};
sleep 0.2;
//Player have visible NVGoggles and CSAT soldier have LOS under 15m away
if (captive player && {[] CALL _c6}) then {player setcaptive false;_capBol = false;};
sleep 0.2;
//BAD GEAR CHECK
if (captive player && {_uniforms CALL _c1}) then {player setcaptive false;_capBol = false;};
sleep 0.2;
//INSIDE NOT ALLOWED CUSTOM LOCATION
//if (captive player && {[] CALL _c7}) then {player setcaptive false;_capBol = false;};
sleep 0.2;
//IN CSAT TERRITORY CHECK
if (captive player && {[] CALL _c2}) then {player setcaptive false;_capBol = false;};
sleep 0.4;
//IN WRONG VEHICLE CHECK
if (captive player && {[] CALL _c4}) then {player setcaptive false;_capBol = false;};
sleep 0.2; 
if (!isNil{missionnamespace getvariable "NewExitZ"}) then {_mar6 setmarkerpos (missionnamespace getvariable "NewExitZ"); missionnamespace setvariable ["NewExitZ",nil];};
sleep 0.2; 
//TOO NEAR CSAT SOLDIER
if (captive player && {vehicle player == player} && {[] CALL _c5}) then {player setcaptive false;_capBol = false;};
//BACK TO CAPTIVE 
if (!captive player && {_capBol}) then {
if (captive player) then {} else {
if ({_x distance player < 150 && {([player, _x] CALL FUNKTIO_LOS)}} count allUnits == 0) then {player setcaptive true;};
};
};
sleep 0.2;
//PLAYER EXIT UNDERCOVER MODE
if (_mar6 CALL _c3) then {_ok = false;};
};
titlecut ["","black out",1];
sleep 1;
//END
player setcaptive false;

[player,_uni] CALL SAOKADDUNIFORM;
if (!isNil"_hat") then {
player addHeadgear _hat;
};
if (!isNil"_Vest") then {
player addVest _Vest;
};
removeallweapons player;
{if (_x != "" && {isClass(configFile >> "cfgWeapons" >> _x)}) then {player addweapon _x;};} foreach _we;
if (_bp != "") then {
removeBackpack player;
player addBackpack _bp;
};
removeAllPrimaryWeaponItems player;
{
if (_x != "") then {
player addPrimaryWeaponItem _x;
};
} foreach _itP;
{
if (_x != "") then {
player addSecondaryWeaponItem _x;
};
} foreach _itS;
{
if (_x != "") then {
if (isClass(configFile >> "cfgWeapons" >> _x)) then {
player addItem _x;
} else {player addmagazine _x;};
};
} foreach _vI + _uI;
if (count _mag > 0) then {
_mag = _mag select 0;
player addmagazine _mag;
_t = 0;
while {{_mag == _x} count (magazines (player)) < 3 && {_t < 3}} do {
player addmagazine _mag;
_t = _t + 1;
};
};
if (count _mag2 > 0) then {
_mag = _mag2 select 0;
_t = 0;
while {{_mag == _x} count (magazines (player)) < 1 && {_t < 1}} do {
player addmagazine _mag;
_t = _t + 1;
};
};
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
CIVMODE = nil;
EXITUNDEC = nil;
deletemarker _mar6;
sleep 1;
titlecut ["","black in",2];
