private ["_c","_ffdd","_foreachIndex","_copy","_ffaa"];
//POW FUNCTIONS
SAOKHAVECELL = {
private ["_bol","_post"];
_bol = false;
_post = if (count _this == 0) then {[getposATL player,"ColorGreen"] CALL NEARESTGUARDPOST} else {_this select 0};
if (!isNil{(_post getvariable "Post") getvariable "PowCells"} && {{(_x select 1) == ""} count ((_post getvariable "Post") getvariable "PowCells") > 0}) then {_bol = true;};
_bol
};
SAOKNEARESTGPWITHPOWROOM = {
private ["_return","_okPosts"];
_okPosts = [];
_p = SAOKMAPSIZE * 0.5;
{if ([_x] CALL SAOKHAVECELL) then {_okPosts pushBack _x;};} foreach (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
_t = [] CALL SAOKSORTPLAYER;
_okPosts = [_okPosts,[_t],{_input0 distance locationposition _x},"ASCEND"] call SAOKSORTBY;
_return = "";
if (count _okPosts > 0) then {_return = (_okPosts select 0) getvariable "Post";};
_return
};

// ([getposATL player,"ColorGreen"] CALL NEARESTGUARDPOST) SPAWN SAOKFREEPOWS;
SAOKFREEPOWS = {
private ["_p","_ar","_Nar","_post","_nul"];
_post = _this;
if (!isNil{_post getvariable "PowCells"}) then {
if (_post in activatedPost) then {
_ar = (_post getvariable "PowCells");
{
if (count _x > 3) then {
_p = getposATL (_x select 3); 
(_x select 3) setpos [(_p select 0) + 10, _p select 1, 0];
(_x select 3) enableAI "MOVE"; 
(_x select 3) setcaptive false;
_nul = [(_x select 3),""] SPAWN FHideAndDelete;
};
sleep 0.01;
} foreach _ar;
_Nar = [];
{_Nar pushBack [_x select 0, ""];} foreach _ar;
_post setvariable ["PowCells",_Nar];
} else {
_ar = (_post getvariable "PowCells");
_Nar = [];
{_Nar pushBack [_x select 0, ""];} foreach _ar;
_post setvariable ["PowCells",_Nar];
};
};
};
//POW FUNCTIONS END

SAOKCONSSPAWNWEP = {
private ["_bthi","_v","_sidee","_classes","_obj","_crew","_typ","_group","_marker","_post","_oldD"];
_v = [];
_sidee = WEST;
_bthi = (_this select 0);
_typ = (_bthi select 0);
_post = (_this select 2);
_marker  = (_this select 1);
_classes = FRIENDC4 call RETURNRANDOM;
_v = [];
if (!isNil"IFENABLED") then {
if (_typ in ["B_HMG_01_A_F","I_HMG_01_A_F"]) then {_typ = "O_HMG_01_A_F";};
if (_typ in ["B_GMG_01_A_F","I_GMG_01_A_F"]) then {_typ = "O_GMG_01_A_F";};
if (_typ in ["I_HMG_01_high_F","I_GMG_01_high_F","I_static_AT_F","I_static_AA_F"]) then {_typ = "O_GMG_01_A_F";};
};
if (getmarkercolor _marker == "ColorRed") then {
_sidee = EAST;
_classes = ENEMYC1 call RETURNRANDOM;
if (_typ in ["LIB_Pak40"]) then {_typ = "LIB_Zis3";};
if (_typ in ["LIB_FlaK_38"]) then {_typ = "LIB_61k";};
if (_typ in ["B_HMG_01_A_F","I_HMG_01_A_F"]) then {_typ = "O_HMG_01_A_F";};
if (_typ in ["B_GMG_01_A_F","I_GMG_01_A_F"]) then {_typ = "O_GMG_01_A_F";};
if (_typ in ["B_APC_Tracked_01_AA_F"]) then {_typ = "O_APC_Tracked_02_AA_F";};
if (_typ in ["I_MBT_03_cannon_F"]) then {_typ = "O_MBT_02_cannon_F";};
if (_typ in ["I_MRAP_03_hmg_F"]) then {_typ = "O_MRAP_02_hmg_F";};
if (_typ in ["I_MRAP_03_gmg_F"]) then {_typ = "O_MRAP_02_gmg_F";};
if (_typ in ["I_APC_tracked_03_cannon_F"]) then {_typ = "O_APC_Wheeled_02_rcws_F";};
if (!isNil"RHSENABLED" || {!isNil"IFENABLED"} || {!isNil"CheConf"} || {!isNil"Eridanus"}) then {
if (_typ in ["O_APC_Tracked_02_AA_F"]) then {_typ = (ARMEDAA select 1) call RETURNRANDOM;};
if (_typ in ["O_MBT_02_cannon_F"]) then {_typ = (ARMEDTANKS select 1) call RETURNRANDOM;};
if (_typ in ["O_MRAP_02_hmg_F"]) then {_typ = (ARMEDVEHICLES select 1) call RETURNRANDOM;};
if (_typ in ["O_MRAP_02_gmg_F"]) then {_typ = (ARMEDVEHICLES select 1) call RETURNRANDOM;};
if (_typ in ["O_APC_Wheeled_02_rcws_F"]) then {_typ = (ARMEDVEHICLES select 1) call RETURNRANDOM;};
};
} else {
if (!isNil"RHSENABLED" || {!isNil"IFENABLED"} || {!isNil"CheConf"} || {!isNil"Eridanus"}) then {
if (_typ in ["B_APC_Tracked_01_AA_F"]) then {_typ = (ARMEDAA select 0) call RETURNRANDOM;};
if (_typ in ["I_MBT_03_cannon_F"]) then {_typ = (ARMEDTANKS select 0) call RETURNRANDOM;};
if (!isNil"CheConf" || {!isNil"Eridanus"}) then {
if (_typ in ["I_MRAP_03_hmg_F"]) then {_typ = (ARMEDVEHICLES select 0) call RETURNRANDOM;};
if (_typ in ["I_MRAP_03_gmg_F"]) then {_typ = (ARMEDVEHICLES select 0) call RETURNRANDOM;};
if (_typ in ["I_APC_tracked_03_cannon_F"]) then {_typ = (ARMEDVEHICLES select 0) call RETURNRANDOM;};
} else {
if (!isNil"RHSENABLED") then {
if (_typ in ["I_MRAP_03_hmg_F"]) then {_typ = ["rhsusf_m113_usarmy","rhsusf_m113d_usarmy"] call RETURNRANDOM;};
if (_typ in ["I_MRAP_03_gmg_F"]) then {_typ = ["rhsusf_m113_usarmy","rhsusf_m113d_usarmy"] call RETURNRANDOM;};
if (_typ in ["I_APC_tracked_03_cannon_F"]) then {_typ = ["RHS_M2A3_BUSKIII","RHS_M2A3_BUSKIII_wd","RHS_M2A3_BUSKI","RHS_M2A3_BUSKI_wd","RHS_M2A3","RHS_M2A3_wd","RHS_M2A2_BUSKI","RHS_M2A2_BUSKI_wd","RHS_M2A2","RHS_M2A2_wd"] call RETURNRANDOM;};
} else {
if (_typ in ["I_MRAP_03_hmg_F"]) then {_typ = ["Lib_Willys_MB","LIB_US_Willys_MB"] call RETURNRANDOM;};
if (_typ in ["I_MRAP_03_gmg_F"]) then {_typ = ["LIB_Scout_m3","Lib_SdKfz251_captuRed","LIB_US_Scout_m3","LIB_US_Scout_m3"] call RETURNRANDOM;};
if (_typ in ["I_APC_tracked_03_cannon_F"]) then {_typ = ((ARMEDTANKS select 2)+(ARMEDTANKS select 0)) call RETURNRANDOM;};
};
};
};
};
_obj = createVehicle [_typ, (_bthi select 1), [], 0, "NONE"]; 
_obj setvariable ["AmCrate",1];
if (isNil{_post getvariable "CC"}) then {_pos = (_bthi select 1);_pos set [2,((_pos select 2)+(_typ call SAOKBHEI))];_obj setPos _pos;} else {
_pos = (_bthi select 1);
if (count _pos < 3) then {
_hh = _typ call SAOKBHEI;
_pos set [2,_hh];_pos = atltoasl _pos;
};
_obj setPosWorld _pos;
};
_obj setdir (_bthi select 2);
_obj setvectorup (_bthi select 3);
if !((_bthi select 0) in ["O_GMG_01_A_F","O_HMG_01_A_F","B_GMG_01_A_F","B_HMG_01_A_F","I_HMG_01_A_F","I_GMG_01_A_F"]) then {
_group = [(_bthi select 1), _sidee, [_classes],[],[],[0.6,0.9]] call SpawnGroupCustom;
leader _group moveingunner _obj;
_group setbehaviour "COMBAT";
_group setformdir (_bthi select 2);
_v = [[leader _group],_obj];
if (_typ iskindof "LandVehicle") then {_obj lock true;};
} else {
createVehicleCrew _obj;
_crew = (crew _obj);
_v = [_crew,_obj];
};
if (isNil{_post getvariable "WeaponsNow"}) then {_post setvariable ["WeaponsNow",[[_v,(_bthi select 4)]]];} else {_oldD = _post getvariable "WeaponsNow";_oldD append [[_v,(_bthi select 4)]];_post setvariable ["WeaponsNow",_oldD];};
};

SAOKCONSADDO = {
private ["_post","_newdata","_nul","_vN","_oldD","_id","_nameA","_f"];
_post = _this select 0;
_newdata = _this select 1;
if (typeof (_newdata select 0) in ["Box_IND_Wps_F"]) then {
_nul = [(_newdata select 0),_post getvariable "CrateC"] SPAWN FLoadCrate;
(_newdata select 0) setvariable ["AmCrate",1];
(_newdata select 0) setvariable ["CCCrate",1];
};
if (typeof (_newdata select 0) in ["Land_BarGate_F"]) then {
	(_newdata select 0) allowdamage false;
	//ANIMATED BAR GATE
	_nul = (_newdata select 0) SPAWN SAOKSHF7;
	///////////////////
};
_vN = "ObjectsNow";
_id = _newdata select 1;
_nameA = toArray _id;
_f = [_nameA select 0, _nameA select 1];
_f = toString _f;
if (_f == "NS") then {_vN = "ObjectsNowS";};
if (isNil{_post getvariable _vN}) then {_post setvariable [_vN,[_newdata]];} else {_oldD = _post getvariable _vN;_oldD append [_newdata];_post setvariable [_vN,_oldD];};
};
SAOKCONSADDU = {
private ["_u","_f3","_post","_newdata","_junk","_marker","_sidee","_d","_postP"];
_f3 = {
private ["_post","_postP","_marker","_veh","_group","_Uc","_nul","_sidee","_rad","_ps"];
_post = _this select 0;
_postP = getposATL _post;
_marker = _this select 1;
_sidee = _this select 5;
_veh = "";
_Uc = (_this select 3);
if (getmarkercolor _marker == "ColorRed") then {_Uc = (_this select 4);};
_ps = [_postP,130,100,"(1 - sea)"] CALL SAOKSEEKPOS;
if (player distance _ps < 200) then {_ps = [getposATL player,500,350,"(1 - sea)"] CALL SAOKSEEKPOS;};
_rad = 100;
//while {surfaceiswater _ps || {player distance _ps < 200 && {[(_ps CALL SAOKATLTOASL),player] CALL FUNKTIO_LOSOBJ}}} do {_rad = _rad + 50;_ps = [_postP,_rad,100,"(1 - sea)"] CALL SAOKSEEKPOS;};
_group = [_ps, _sidee, [_Uc],[],[],[0.8,0.9]] call SpawnGroupCustom;
leader _group setvariable [(_this select 2),1];
if ((!("GreenHelp" in (missionnamespace getvariable "Progress")) && {(getmarkercolor _marker == "ColorGreen")}) || {!isNil{_post getvariable "RES"}}) then {{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;} foreach units _group;};
//if ({vehicle _x distance _postP < 450 && {isNil{_x getvariable "JustTeleported"}}} count [player] > 0) then {_n = [_group, "WEST", _postP,["B_G_Quadbike_01_F",2],_postP,""] SPAWN VehicleArrival;} else {_nul = [units _group,(nearestObjects [_postP, ["FirePlace_burning_F","Land_FirePlace_F"], 100]), [_postP, 100],[],_postP] SPAWN AICampBehaviour;};
[_veh,(units _group)]
};
_u = [];
_post = _this select 0;
_postP = getposATL _post;
_newdata = _this select 1;
_sidee = WEST;
_marker = _post getvariable "Gmark";
if (getmarkercolor _marker == "ColorRed") then {
_sidee = EAST;
};
_junk = if (isNil{_post getvariable "Junk"}) then {[]} else {_post getvariable "Junk"};
if (_newdata == "MG-Guard") then {
_a = [_post,_marker,"MG-Guard","I_Soldier_AR_F","O_Soldier_AR_F",_sidee];
if (!isNil"Eridanus") then {_a = [_post,_marker,"MG-Guard","TEI_UNSC_Army_W_Rifleman_AR","TEI_UNSC_ODST_Rifleman_AR",_sidee];};
if (!isNil"RHSENABLED") then {_a = [_post,_marker,"MG-Guard","rhsusf_army_ucp_machinegunner","rhs_msv_machinegunner",_sidee];};
if (!isNil"IFENABLED") then {_a = [_post,_marker,"MG-Guard","LIB_GER_mgunner","LIB_SOV_mgunner",_sidee];};
if (!isNil"CheConf") then {_a = [_post,_marker,"MG-Guard","I_mas_cer_Rebel_MG_F","O_mas_cer_soldier_MG_F",_sidee];};
_d = _a CALL _f3;
if (typename (_d select 0) != "STRING") then {_junk pushBack (_d select 0);};
_junk append (_d select 1);
_u append (_d select 1);
};
if (_newdata == "AA-Guard") then {
_a = [_post,_marker,"AA-Guard","I_Soldier_AA_F","O_Soldier_AA_F",_sidee];
if (!isNil"Eridanus") then {_a = [_post,_marker,"AA-Guard","TEI_UNSC_Army_W_Rifleman_AR","TEI_UNSC_ODST_Rifleman_AR",_sidee];};
if (!isNil"RHSENABLED") then {_a = [_post,_marker,"AA-Guard","rhsusf_army_ucp_aa","rhs_msv_aa",_sidee];};
if (!isNil"IFENABLED") then {_a = [_post,_marker,"AA-Guard","LIB_GER_mgunner","LIB_SOV_mgunner",_sidee];};
if (!isNil"CheConf") then {_a = [_post,_marker,"AA-Guard","I_mas_cer_Rebel_AA_F","O_mas_cer_soldier_LAA_F",_sidee];};
_d = _a CALL _f3;
if (typename (_d select 0) != "STRING") then {_junk pushBack (_d select 0);};
_junk append (_d select 1);
_u append (_d select 1);
};
if (_newdata == "AT-Guard") then {
_a = [_post,_marker,"AT-Guard","I_Soldier_AT_F","O_Soldier_AT_F",_sidee];
if (!isNil"Eridanus") then {_a = [_post,_marker,"AT-Guard","TEI_UNSC_Marine_Rifleman_AT","TEI_Ins_URF_Rifleman_AT",_sidee];};
if (!isNil"RHSENABLED") then {_a = [_post,_marker,"AT-Guard","rhsusf_army_ucp_javelin","rhs_msv_at",_sidee];};
if (!isNil"IFENABLED") then {_a = [_post,_marker,"AT-Guard","LIB_GER_AT_soldier","LIB_SOV_AT_grenadier",_sidee];};
if (!isNil"CheConf") then {_a = [_post,_marker,"AT-Guard","I_mas_cer_Rebel_LAT_F","O_mas_cer_soldier_LAT_F",_sidee];};
_d = _a CALL _f3;
if (typename (_d select 0) != "STRING") then {_junk pushBack (_d select 0);};
_junk append (_d select 1);
_u append (_d select 1);
};
if (_newdata == "Sniper-Guard") then {
_a = [_post,_marker,"Sniper-Guard","I_Sniper_F","O_Sniper_F",_sidee];
if (!isNil"Eridanus") then {_a = [_post,_marker,"Sniper-Guard","TEI_UNSC_Army_D_Sniper","TEI_Ins_URF_Sniper",_sidee];};
if (!isNil"RHSENABLED") then {_a = [_post,_marker,"Sniper-Guard","rhsusf_army_ucp_marksman","rhs_msv_marksman",_sidee];};
if (!isNil"IFENABLED") then {_a = [_post,_marker,"Sniper-Guard","LIB_GER_scout_sniper","LIB_SOV_LC_rifleman",_sidee];};
if (!isNil"CheConf") then {_a = [_post,_marker,"Sniper-Guard","I_mas_cer_Rebel_EXP_F","O_mas_cer_soldier_exp_F",_sidee];};
_d = _a CALL _f3;
if (typename (_d select 0) != "STRING") then {_junk pushBack (_d select 0);};
_junk append (_d select 1);
_u append (_d select 1);
};
if (_newdata == "Medic-Guard") then {
_a = [_post,_marker,"Medic-Guard","I_medic_F","O_medic_F",_sidee];
if (!isNil"Eridanus") then {_a = [_post,_marker,"Medic-Guard","TEI_UNSC_Army_D_Medic","TEI_Ins_URF_Medic",_sidee];};
if (!isNil"RHSENABLED") then {_a = [_post,_marker,"Medic-Guard","rhsusf_army_ucp_medic","rhs_msv_medic",_sidee];};
if (!isNil"IFENABLED") then {_a = [_post,_marker,"Medic-Guard","LIB_GER_medic","LIB_SOV_medic",_sidee];};
if (!isNil"CheConf") then {_a = [_post,_marker,"Medic-Guard","I_mas_cer_Rebel_MEDIC_F","O_mas_cer_medic_F",_sidee];};
_d = _a CALL _f3;
if (typename (_d select 0) != "STRING") then {_junk pushBack (_d select 0);};
_junk append (_d select 1);
_u append (_d select 1);
};
_post setvariable ["Junk",_junk];
_u
};
SAOKCONSADDW = {
private ["_post","_newdata","_obj","_group","_v","_crew","_classes","_oldD"];
_post = _this select 0;
//[_class,getposATL _veh, direction _veh, (surfaceNormal (getposATL _veh)),_id]
_newdata = _this select 1;
_obj = createVehicle [(_newdata select 0), (_newdata select 1), [], 0, "NONE"]; 
_obj setvariable ["AmCrate",1];
if (isNil{_post getvariable "CC"}) then {_obj setPos (_newdata select 1);} else {_obj setPosWorld (_newdata select 1);};
_obj setdir (_newdata select 2);
_obj setvectorup (_newdata select 3);
_v = [];
if !((_newdata select 0) in ["O_GMG_01_A_F","O_HMG_01_A_F","B_GMG_01_A_F","B_HMG_01_A_F","I_HMG_01_A_F","I_GMG_01_A_F"]) then {
_classes = FRIENDC4 call RETURNRANDOM;
_group = [(_newdata select 1), WEST, [_classes],[],[],[0.6,0.9]] call SpawnGroupCustom;
_group setbehaviour "COMBAT";
leader _group moveingunner _obj;
_group setformdir (_newdata select 2);
_v = [[leader _group],_obj];
if ((_newdata select 0) iskindof "LandVehicle") then {_obj lock true;};
} else {
createVehicleCrew _obj;
_crew = (crew _obj);
_v = [_crew,_obj];
};
if (isNil{_post getvariable "WeaponsNow"}) then {_post setvariable ["WeaponsNow",[[_v,(_newdata select 4)]]];} else {_oldD = _post getvariable "WeaponsNow";_oldD append [[_v,(_newdata select 4)]];_post setvariable ["WeaponsNow",_oldD];};
};

SAOKCONSREMO = {
private ["_post","_oldD","_countD","_newD","_object","_cost","_nul"];
_post = _this;
if (!isNil{_post getvariable "ObjectsNow"} && {count (_post getvariable "ObjectsNow") > 0}) then {
_oldD = _post getvariable "ObjectsNow";
_countD = count _oldD - 1;
_object = ((_oldD select _countD) select 0);
_cost = ((typeOf _object) CALL CONSCOST) * 0.6;
pisteet = pisteet + _cost;
_nul = [_cost, "Returns"] SPAWN PRESTIGECHANGE;
deletevehicle _object;
_newD = [_oldD,_countD] call SAOKREMINDEX;
_post setvariable ["ObjectsNow",_newD];
_oldD = _post getvariable "StaticO";
_newD = [_oldD,_countD] call SAOKREMINDEX;
_post setvariable ["StaticO",_newD];
} else {missionnamespace setvariable ["Arrow",nil];};
};
SAOKCONSREMW = {
private ["_vehD","_post","_oldD","_countD","_newD","_object","_cost","_nul"];
_post = _this;
if !(isNil{_post getvariable "WeaponsNow"}) then {
_oldD = _post getvariable "WeaponsNow";
_countD = count _oldD - 1;
_vehD = (_oldD select _countD) select 0;
{_x spawn SAOKDELETE;} foreach (_vehD select 0);
_object = _vehD select 1;
_cost = ((typeOf _object) CALL CONSCOST) * 0.6;
pisteet = pisteet + _cost;
_nul = [_cost, "Returns"] SPAWN PRESTIGECHANGE;
deletevehicle _object; 
_newD = [_oldD,_countD] call SAOKREMINDEX;
_post setvariable ["WeaponsNow",_newD];
_oldD = _post getvariable "StaticW";
_newD = [_oldD,_countD] call SAOKREMINDEX;
_post setvariable ["StaticW",_newD];
};
};

SAOKCONSONSPAWN = {
private ["_u","_f1","_post","_marker","_a","_dat","_xx","_c","_d","_n","_nul","_ar","_ucc","_classes","_group","_foreachindex","_br","_postP","_arriSide"];
_f1 = {
private ["_post","_obj","_nul","_thism","_pos","_h","_ar","_vN","_post","_oldD"];
_thism = _this select 0;
_post = _this select 1;
_pos = _thism select 1;
if (isNil"_pos" || {isNil"_thism"} || {{typename _x != "SCALAR"} count _pos > 0}) exitWith {};
_obj = createVehicle [(_thism select 0), _pos, [], 0, "CAN_COLLIDE"]; 
if ((_thism select 0) in ["CamoNet_OPFOR_F","CamoNet_OPFOR_open_F"]) then {_obj allowdamage false;};
_h = 0;
if (count _pos > 2) then {_h = (_pos select 2);};
if (isNil{_post getvariable "CC"}) then {_obj setPos _pos;} else {
if (count _pos < 3) then {
_hh = (_thism select 0) call SAOKBHEI;
_pos set [2,_hh];_pos = atltoasl _pos;
};
_obj setPosWorld _pos;
};
_obj setdir (_thism select 2);
if !((_thism select 0) in ["Land_BarGate_F","FirePlace_burning_F"]) then {[_obj,0] SPAWN VehLife;};
_obj setvectorup (_thism select 3);
if ((_thism select 0) in ["Box_IND_Wps_F"]) then {
_nul = [_obj,(_this select 1) getvariable "CrateC"] SPAWN FLoadCrate;
_obj setvariable ["AmCrate",1];
_obj setvariable ["CCCrate",1];
};
if ((_thism select 0) in ["Land_BarGate_F"]) then {
	_obj allowdamage false;
	_ar = [CIVILIAN, WEST];
	if (_this select 2 == "ColorRed") then {_ar = [CIVILIAN, EAST];};
	_obj setvariable ["PassSide",_ar];
	//ANIMATED BAR GATE
	_nul = _obj SPAWN SAOKSHF8;
	///////////////////
};
_vN = "ObjectsNow";
if (count _this > 2 && {_this select 2 == ""}) then {_vN = "ObjectsNowS";};
if (isNil{_post getvariable _vN}) then {
_post setvariable [_vN,[[_obj,(_thism select 4)]]];
} else {
_oldD = _post getvariable _vN;
_oldD append [[_obj,(_thism select 4)]];
_post setvariable [_vN,_oldD];
};
};
_post = _this;
_marker = _post getvariable "Gmark";

if (!isNil{_post getvariable "StaticO"}) then {
_dat = + (_post getvariable "StaticO");
_c = count _dat;
if (_c > 0) then {
_a = 0;
for "_i" from 0 to _c do {
_xx = _dat select (_i-_a);
if (isNil"_xx") then {
_a = _a + 1;
_deAT = _dat deleteAt _i;
} else {
[_xx,_post, getmarkercolor _marker] CALL _f1;
};
};
if (_a > 0) then {_post setvariable ["StaticO",_dat];};
};
};
if (!isNil{_post getvariable "StaticOS"}) then {
_dat = + (_post getvariable "StaticOS");
_c = count _dat;
if (_c > 0) then {
_a = 0;
for "_i" from 0 to _c do {
_xx = _dat select (_i-_a);
if (isNil"_xx") then {
_a = _a + 1;
_deAT = _dat deleteAt _i;
} else {
[_xx,_post,""] CALL _f1;
};
};
if (_a > 0) then {_post setvariable ["StaticOS",_dat];};
};
};
{
_d = [_x,_marker,_post] CALL SAOKCONSSPAWNWEP;
} foreach (_post getvariable "StaticW");
_u = [];
{
if (!isNil{_post getvariable _x}) then {_u append ([_post,_x] CALL SAOKCONSADDU);};
} foreach ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"];
_postP = getposATL _post;
_arriSide = if (getmarkercolor _marker == "ColorGreen") then {WEST} else {EAST};
if ({vehicle _x distance _postP < 450 && {isNil{missionnamespace getvariable "JustTeleported"}}} count [player] > 0) then {
_n = [_u, _arriSide, _postP,[],_postP,""] SPAWN VehicleArrivalA;
} else {_nul = [_u] SPAWN AICampBehaviour;};


if (!isNil{_post getvariable "PowCells"}) then {
{
_br = _x;
if (_x select 1 != "") then {
_ar = (_post getvariable "PowCells");
_ucc = [ENEMYC1,ENEMYC2] call RETURNRANDOM;
_classes = _ucc call RETURNRANDOM;
_group = [_x select 0, EAST, [_classes],[],[],[0.4,0.8]] call SpawnGroupCustom;
leader _group setpos (_x select 0);
leader _group setface (_x select 2);
_br set [3,leader _group];
_ar set [_foreachindex,_br];
_post setvariable ["PowCells",_ar];
leader _group setbehaviour "CARELESS";
leader _group setcaptive true;
leader _group disableAI "MOVE";
removeallweapons (leader _group);
(leader _group) setvariable ["PowMan",1];
removeHeadgear (leader _group);
removeVest (leader _group);
removeBackPack (leader _group);
removeUniform (leader _group);
removeAllAssignedItems (leader _group);
if (isNil{(_post getvariable "Junk")}) then {_post setvariable ["Junk",[(leader _group)]];} else {_post setvariable ["Junk",(_post getvariable "Junk")+[(leader _group)]];};
};
} foreach (_post getvariable "PowCells");
};
};

SAOKCONSCHANGESIDE = {
private ["_u","_post","_marker","_d","_n","_nul","_postP","_arriSide"];
_post = _this;
_marker = _post getvariable "Gmark";
//REM ONLY VEH
if (!isNil{(_post getvariable "WeaponsNow")}) then {
{{if (alive _x && {group _x != group player}) then {_x spawn SAOKDELETE;};} foreach crew ((_x select 0) select 1); deletevehicle ((_x select 0) select 1);} foreach (_post getvariable "WeaponsNow");
_post setvariable ["WeaponsNow",nil];
};
{
_d = [_x,_marker,_post] CALL SAOKCONSSPAWNWEP;
} foreach (_post getvariable "StaticW");
if (!isNil{_post getvariable "Junk"}) then {{if (!((typeOf _x) iskindOf "Man")) then {_x spawn SAOKDELETE;};} foreach (_post getvariable "Junk");};
_post setvariable ["Junk",[]];
_u = [];
{
if (!isNil{_post getvariable _x}) then {_u append ([_post,_x] CALL SAOKCONSADDU);};
} foreach ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"];
_postP = getposATL _post;
_arriSide = if (getmarkercolor _marker == "ColorGreen") then {WEST} else {EAST};
if ({vehicle _x distance _postP < 450 && {isNil{missionnamespace getvariable "JustTeleported"}}} count [player] > 0) then {
_n = [_u, _arriSide, _postP,[],_postP,""] SPAWN VehicleArrivalA;
} else {_nul = [_u] SPAWN AICampBehaviour;};

if (getmarkercolor _marker == "ColorRed" && {!isNil{_post getvariable "PowCells"}}) then {
_post SPAWN SAOKFREEPOWS;
};
};
//PLAYER FAR
SAOKCONSONDEL = {
private ["_post"];
_post = _this;
if (!isNil{_post getvariable "Junk"}) then {{_x spawn SAOKDELETE;} foreach (_post getvariable "Junk");};
if (!isNil{(_post getvariable "WeaponsNow")}) then {
{{_x spawn SAOKDELETE;} foreach ((_x select 0) select 0); deletevehicle ((_x select 0) select 1);} foreach (_post getvariable "WeaponsNow");
};
_post setvariable ["WeaponsNow",nil];
if (!isNil{(_post getvariable "ObjectsNow")}) then {
{deletevehicle (_x select 0);} foreach (_post getvariable "ObjectsNow");
};
_post setvariable ["ObjectsNow",nil];
if (!isNil{(_post getvariable "ObjectsNowS")}) then {
{deletevehicle (_x select 0);} foreach (_post getvariable "ObjectsNowS");
};
_post setvariable ["ObjectsNowS",nil];
};
SAOKCONSONDELPOST = {
private ["_post"];
_post = _this;
if (!isNil{_post getvariable "Junk"}) then {{_x spawn SAOKDELETE;} foreach (_post getvariable "Junk");};
if (!isNil{(_post getvariable "WeaponsNow")}) then {
{{_x spawn SAOKDELETE;} foreach ((_x select 0) select 0); deletevehicle ((_x select 0) select 1);} foreach (_post getvariable "WeaponsNow");
};
_post setvariable ["WeaponsNow",nil];
if (!isNil{(_post getvariable "ObjectsNow")}) then {
{deletevehicle (_x select 0);} foreach (_post getvariable "ObjectsNow");
};
_post setvariable ["ObjectsNow",nil];
if (!isNil{(_post getvariable "ObjectsNowS")}) then {
{deletevehicle (_x select 0);} foreach (_post getvariable "ObjectsNowS");
};
_post setvariable ["ObjectsNowS",nil];
_post setvariable ["StaticW",[]];
_post setvariable ["StaticO",[]];
_post setvariable ["StaticOS",[]];
activatedPost = activatedPost - [_post];
deletevehicle _post;
};

SAOKCONSRESETOBJ = {
private ["_f1","_post","_a","_dat","_xx","_c","_marker","_mar","_col","_typ"];
_f1 = {
private ["_post","_obj","_nul","_thism","_pos","_h","_ar","_vN","_post","_oldD","_wTm"];
_thism = _this select 0;
_post = _this select 1;
_pos = _thism select 1;
if (isNil"_pos" || {isNil"_thism"} || {{typename _x != "SCALAR"} count _pos > 0}) exitWith {};
_obj = createVehicle [(_thism select 0), _pos, [], 0, "CAN_COLLIDE"]; 
if ((_thism select 0) in ["CamoNet_OPFOR_F","CamoNet_OPFOR_open_F"]) then {_obj allowdamage false;};
if (isNil{_post getvariable "CC"}) then {_obj setPos _pos;} else {
if (count _pos < 3) then {
_hh = (_thism select 0) call SAOKBHEI;
_pos set [2,_hh];_pos = atltoasl _pos;
};
_obj setPosWorld _pos;
};
_obj setdir (_thism select 2);
if !((_thism select 0) in ["Land_BarGate_F","FirePlace_burning_F"]) then {[_obj,0] SPAWN VehLife;};
_obj setvectorup (_thism select 3);
if ((_thism select 0) in ["Box_IND_Wps_F"]) then {
_nul = [_obj,(_this select 1) getvariable "CrateC"] SPAWN FLoadCrate;
_obj setvariable ["AmCrate",1];
_obj setvariable ["CCCrate",1];
};
if ((_thism select 0) in ["Land_BarGate_F"]) then {
	_obj allowdamage false;
	_ar = [CIVILIAN, WEST];
	if (_this select 2 == "ColorRed") then {_ar = [CIVILIAN, EAST];};
	_obj setvariable ["PassSide",_ar];
	//ANIMATED BAR GATE
	_nul = _obj SPAWN SAOKSHF8;
	///////////////////
};
_vN = "ObjectsNow";
if (count _this > 2 && {_this select 2 == ""}) then {_vN = "ObjectsNowS";};
if (isNil{_post getvariable _vN}) then {_post setvariable [_vN,[[_obj,(_thism select 4)]]];} else {_oldD = _post getvariable _vN;_oldD append [[_obj,(_thism select 4)]];_post setvariable [_vN,_oldD];};
};
_post = _this;
if (isNil{_post getvariable "Gmark"}) then {
NUMM=NUMM+1;
_mar = format ["Guard%2PMM%1",NUMM,floor (random 10)];
_col = "ColorGreen";
_typ = "n_installation";
_marker = createMarker [_mar,getposATL _post];
_marker setMarkerShape "ICON";
_marker setMarkerType _typ;
_marker setMarkerSize [0,0];
_marker setMarkerColor _col;
_marker setMarkerText "";
_post setvariable ["Gmark",_mar];
};
_marker = _post getvariable "Gmark";
if (!isNil{(_post getvariable "ObjectsNow")}) then {
{deletevehicle (_x select 0);} foreach (_post getvariable "ObjectsNow");
};
_post setvariable ["ObjectsNow",nil];
if (!isNil{(_post getvariable "ObjectsNowS")}) then {
{deletevehicle (_x select 0);} foreach (_post getvariable "ObjectsNowS");
};
_post setvariable ["ObjectsNowS",nil];
if (!isNil{_post getvariable "StaticO"}) then {
_dat = + (_post getvariable "StaticO");
_c = count _dat;
if (_c > 0) then {
_a = 0;
for "_i" from 0 to _c do {
_xx = _dat select (_i-_a);
if (isNil"_xx") then {
_a = _a + 1;
_deAT = _dat deleteAt _i;
} else {
[_xx,_post,getmarkercolor _marker] CALL _f1;
};
};
if (_a > 0) then {_post setvariable ["StaticO",_dat];};
};
};
if (!isNil{_post getvariable "StaticOS"}) then {
_dat = + (_post getvariable "StaticOS");
_c = count _dat;
if (_c > 0) then {
_a = 0;
for "_i" from 0 to _c do {
_xx = _dat select (_i-_a);
if (isNil"_xx") then {
_a = _a + 1;
_deAT = _dat deleteAt _i;
} else {
[_xx,_post,""] CALL _f1;
};
};
if (_a > 0) then {_post setvariable ["StaticOS",_dat];};
};
};
};


SAOKGPcondPlayerCaptured = {
private ["_bol","_post","_dd","_sidee","_u","_units"];
_bol = false;
_post = _this select 0;
_dd = _this select 1;
_sidee = _this select 2;
_units = [];
if (!isNil{_post getvariable "Junk"}) then {
{if ((typeof _x) isKindof "Man") then {_units pushBack _x;};} foreach (_post getvariable "Junk");
};
if (random 1 < 0.1 && {{behaviour _x == "COMBAT"} count _units > 0}) then {
_u = [];
{if (alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}}) then {_u pushBack _x;};} foreach _units;
if (count _u > 0) then {
_u = _u call RETURNRANDOM;
if (side _u == EAST) then {
group _u SPAWN SAOKAISMOKEPURPLE;
} else {
group _u SPAWN SAOKAISMOKEBLUE;
};
};
};
if (!isNil{_post getvariable "WeaponsNow"}) then {
{{if ((typeof _x) isKindof "Man") then {_units pushBack _x;};} foreach ((_x select 0) select 0);} foreach (_post getvariable "WeaponsNow");
};
if ({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}}} count _units == 0 && {{_x distance _post < _dd && {((getposATL _x) select 2) < 3}} count [player] > 0} && {_sidee == EAST}) then {
_bol = true;
};
_bol 
};
SAOKGPcondFar = {
private ["_bol","_post"];
_bol = false;
_post = _this;
if (player distance _post > (["Lb"] CALL DIS)) then {_bol = true;};
_bol 
};
//_POST
SAOKGPcondEnemyClose = {
private ["_bol","_post"];
_bol = false;
_post = _this;
if ((getmarkercolor (_post getvariable "Gmark") == "ColorGreen") && {{count crew _x > 0 && {side ((crew _x) select 0) == EAST}} count (_post nearEntities [["Air", "LandVehicle"], 1000]) > 0}) then {_bol = true;};
_bol 
};



_ffdd = {
private ["_marker"];
if (!(_this in activatedPost) && {(!(_this CALL SAOKGPcondFar) || {_this CALL SAOKGPcondEnemyClose})} && {isNil{_this getvariable "NotReady"}}) then {
activatedPost pushBack _this;
_this setvariable ["ACTIVE",1];
_marker = _this getvariable "Gmark"; 
_marker setMarkerSize [0.8,0.8];
_this CALL SAOKCONSONSPAWN;
if ([] CALL FPSGOOD) then {_marker SPAWN SAOKVISITOFFICER;};
};
};

_ffaa = {
private ["_y","_n","_dd","_sidee","_marker","_tyy"];
_dd = (["Lb"] CALL DIS);
_y = _this;
if (_y CALL SAOKGPcondFar && {!(_y CALL SAOKGPcondEnemyClose)} && {isNil{_y getvariable "KeepG"}}) then {
activatedPost = activatedPost - [_y];_y setvariable ["ACTIVE",nil];
_y CALL SAOKCONSONDEL;
} else {
_sidee = WEST;
_marker = _y getvariable "Gmark";
if (getmarkercolor _marker == "ColorRed") then {
_sidee = EAST;
};
if ([_y,_dd,_sidee] CALL SAOKGPcondPlayerCaptured) then {
_tyy = "WEST";
if (_sidee == WEST) then {_tyy = "EAST";};
_n = [getposATL _y,_tyy,20] CALL GuardPostSide;
if (_tyy == "WEST" && {vehicle player distance _y < 200}) then {
[player, player, "PlaV", "V34"] SPAWN SAOKKBTELL;
[((name player)+": This guardpost seems cleared now"),5] SPAWN SAOKTITLETEXT;
};
};
};

};



activatedPost = [];
while {true} do {
if ({isPlayer _x} count [player] == 0) then {
waitUntil {sleep 10; {isPlayer _x} count [player] > 0};
};
_gg = (nearestLocations [player, ["PostG","PostR"], 3000]);
_c = count _gg - 1;
if (_c > -1) then {
for "_i" from 0 to _c do {
private ["_xx"];
_xx = (_gg select _i) getvariable "Post";
_xx SPAWN _ffdd;
sleep 0.1;
};
};
sleep 0.5;
{if (isNil"_x" || {isNull _x}) exitWith {_deAT = activatedPost deleteAt _forEachIndex;};sleep 0.1;} foreach activatedPost;
sleep 0.5;
_copy = + activatedPost;
_c = count _copy - 1;
if (_c > -1) then {
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _copy select _i;
if (!isNil"_xx" && {!isNull _xx}) then {
_xx SPAWN _ffaa;
};
sleep 0.1;
};
};
sleep 3;
};
