private ["_group","_ind","_St","_Batman","_vo","_eh","_cur","_vI","_uI","_ma","_ynit","_weap","_packs","_vests","_uniF","_hats","_nul","_num","_mag","_ok"];
//if (TEST_MODE) exitWith {}; SaOkNoAnimals
FUNKTIO_PDA=compile preprocessfileLineNumbers "PDA.sqf";
FUNKTIO_PDAEX=compile preprocessfileLineNumbers "PDAEX.sqf";
FUNKTIO_PDA2=compile preprocessfileLineNumbers "PDA2.sqf";
_load = 0;
_Batman = 0;
_vo = 0;
_ind = "John_Walker";
InsT = "CHOP";
SAOKFPS = 40;
Stime = 0;
Zorro = 0;
_fN = "SaOkSaveWLA";
_op = true;
if (worldname != "Altis") then {_fN = _fN + worldname;};
if (!isNil{profileNamespace getvariable _fN}) then {
	disableserialization;
	_ok = createDialog "ResumeDialog"; 
	_op = false;
	sleep 1;
	waitUntil {sleep 0.1; !dialog};
} else {NEWG = true;};
if (!isNil"NEWG" || {_op}) then {
	[["WLA","StartOptions"]] call BIS_fnc_advHint;
	Bumblebeeman = 0; 
	missionnamespace setvariable ["ResTT",10];
	PLSTREGHT = 0.5;
	GUARDLIM = true;
	NEWG = nil;
	InsT = "BOAT";
	disableserialization;
	_ok = createDialog "StartDialog"; 
	lbAdd [1501, "Hard"];
	lbSetPicture [1501,0,"\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa"];
	lbSetTooltip [1501,0,"Low prestige income, very aggressive and very fast expanding enemy"];
	lbAdd [1501, "Challenging"];
	lbSetPicture [1501,1,"\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa"];
	lbSetTooltip [1501,1,"Quite low prestige income, aggressive and fast expanding enemy"];
	lbAdd [1501, "Normal"];
	lbSetPicture [1501,2,"\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"];
	lbSetTooltip [1501,2,"Quite deadly difficulty level already. Fast-travel also available in guardposts"];
	lbAdd [1501, "Easy"];
	lbSetPicture [1501,3,"\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa"];
	lbSetTooltip [1501,3,"Still challenging gameplay but with much prestige flow. Fast-travel, Gear and Shops available from anywhere"];
	//lbSetTooltip [1500,3,"Much Prestige Flow, Less Enemy Movement, More Time to React"]; icon = "\A3\ui_f\data\map\markers\flags\Greece_ca.paa";
	lbSetCurSel [1501, 1];
	{
		lbSetPictureColor [1501, _x, [1, 0.5, 0, 1]];
		lbSetPictureColorSelected [1501, _x, [1, 1, 1, 1]];
	} foreach [0,1,2,3];
	lbAdd [1502, "Player ID"];
	lbSetPicture [1502,0,(getText (configfile >> "CfgMarkers" >> "flag_NATO" >> "texture"))];
	lbSetTooltip [1502,0,"Use your own set identity"];
	lbAdd [1502, "Gregory Jackson"];
	lbSetPicture [1502,1,(getText (configfile >> "CfgMarkers" >> "flag_UK" >> "texture"))];
	lbAdd [1502, "Kerry Smith"];
	lbSetPicture [1502,2,(getText (configfile >> "CfgMarkers" >> "flag_USA" >> "texture"))];
	lbAdd [1502, "John Walker"];
	lbSetPicture [1502,3,(getText (configfile >> "CfgMarkers" >> "flag_USA" >> "texture"))];
	lbAdd [1502, "Kouris Anastas"];
	lbSetPicture [1502,4,(getText (configfile >> "CfgMarkers" >> "flag_Greece" >> "texture"))];
	lbAdd [1502, "Ryoichi Akaike"];
	lbSetPicture [1502,5,(getText (configfile >> "CfgMarkers" >> "flag_USA" >> "texture"))];
	lbAdd [1502, "Conan O'Connor"];
	lbSetPicture [1502,6,(getText (configfile >> "CfgMarkers" >> "flag_UK" >> "texture"))];
	lbSetCurSel [1502, 6];
	{
		lbSetPictureColor [1502, _x, [1, 1, 1, 1]];
		lbSetPictureColorSelected [1502, _x, [1, 1, 1, 1]];
	} foreach [0,1,2,3,4,5,6];
	lbAdd [1503, "Recon"];
	lbSetPicture [1503,0,"\A3\ui_f\data\map\markers\nato\b_recon.paa"];
	lbSetTooltip [1503,0,"Lead 5 men team equipped with rifle silencers"];
	lbAdd [1503, "Standard"];
	lbSetPicture [1503,1,"\A3\ui_f\data\map\markers\nato\b_inf.paa"];
	lbSetTooltip [1503,1,"Receive 3 extra men after reaching the LZ"];
	lbAdd [1503, "Undercover"];
	lbSetPicture [1503,2,"\A3\ui_f\data\map\markers\nato\n_unknown.paa"];
	lbSetTooltip [1503,2,"Begin the operation alone as civilian dressed local from random land location"];
	if (isClass(configFile >> "cfgWeapons" >> "U_PMC_GTShirt_DJeans")) then {
		lbAdd [1503, "PMC Team"];
		lbSetPicture [1503,3,"\A3\ui_f\data\map\markers\nato\n_inf.paa"];
		lbSetTooltip [1503,3,"Lead Private Military Company Team"];
	};
	if !(isClass(configFile >> "cfgWeapons" >> "U_PMC_GTShirt_DJeans")) then {lbSetCurSel [1503, 0];} else {lbSetCurSel [1503, 2];};
	{
		lbSetPictureColor [1503, _x, [1, 1, 1, 1]];
		lbSetPictureColorSelected [1503, _x, [1, 1, 1, 1]];
	} foreach [0,1,2,3];
	lbAdd [1504, "Chopper"];
	lbSetPicture [1504,0,"\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa"];
	lbSetTooltip [1504,0,"Your team is inserted to green marked location by chopper"];
	if ((worldname CALL SAOKMAPDATA) select 6) then {
		lbAdd [1504, "Boat"];
		lbSetPicture [1504,1,"\A3\boat_f\Boat_Armed_01\data\ui\Boat_Armed_01_minigun.paa"];
		lbSetTooltip [1504,1,"Your team begin in armed boat from blue marked location"];
		lbAdd [1504, "Random"];
		lbSetPicture [1504,2,"\A3\ui_f\data\map\markers\handdrawn\unknown_CA.paa"];
		lbSetTooltip [1504,2,"Mission begin randomly with chopper or boat insertion"];
	};
	lbSetCurSel [1504, 0];
	{
		lbSetPictureColor [1504, _x, [1, 0.5, 0, 1]];
		lbSetPictureColorSelected [1504, _x, [1, 1, 1, 1]];
	} foreach [0,1,2];
	if ({isClass(configFile >> "cfgVehicles" >> _x)} count ["TEI_UNSC_Army_W_Medic"] > 0) then {lbAdd [1509, "The Eridanus Insurrection"];"The Eridanus Insurrection" SPAWN SAOKMODTEMP;};
	if ({isClass(configFile >> "cfgVehicles" >> _x)} count ["rhs_msv_aa","rhsusf_army_ucp_autorifleman"] > 1) then {lbAdd [1509, "RHS Escalation"];"RHS Escalation" SPAWN SAOKMODTEMP;};
	if ({isClass(configFile >> "cfgVehicles" >> _x)} count ["LIB_GER_unterofficer"] > 0) then {lbAdd [1509, "Iron Front"];"Iron Front" SPAWN SAOKMODTEMP;lbAdd [1509, "Iron Front Fic"];};
	if ({isClass(configFile >> "cfgVehicles" >> _x)} count ["O_mas_cer_Soldier_off_F"] > 0) then {lbAdd [1509, "Chernarus Conflict"];"Chernarus Conflict" SPAWN SAOKMODTEMP;};
	if ({isClass(configFile >> "cfgVehicles" >> _x)} count ["B_mas_it_Soldier_TL_F_v"] > 0) then {lbAdd [1509, "Italian SPECOPS"];"Italian SPECOPS" SPAWN SAOKMODTEMP;};
	lbAdd [1509, "Default"];
	lbSetCurSel [1509, 0];
	lbAdd [1505, "Start Time"];
	lbAdd [1505, "Player Needs"];
	lbAdd [1505, "Player Respawning"];
	lbAdd [1505, "Platoon Radio"];
	lbAdd [1505, "Advanced FirstAid"];
	lbAdd [1505, "Dynamic Weather"];
	lbAdd [1505, "Ambient Life"];
	lbAdd [1505, "Autosave"];
	lbAdd [1505, "Asset Unlocking"];
	lbAdd [1505, "PP-Effects"];
	lbAdd [1505, "AI Artillery"];
	lbAdd [1505, "Constructing"];
	lbAdd [1505, "Life Range"];
	lbAdd [1505, "Long Walls"];
	lbSetCurSel [1505, 0];
	sleep 0.1;
	missionnamespace setvariable ["Autosave",30];
	{_x setcaptive true; _x setbehaviour "CARELESS";} foreach units group player;

	while {dialog} do {
		if ((lbCurSel 1502) == 0) then {_ind = "";};
		if ((lbCurSel 1502) == 1) then {_ind = "Gregory_Jackson";};
		if ((lbCurSel 1502) == 2) then {_ind = "Kerry_Smith";};
		if ((lbCurSel 1502) == 3) then {_ind = "John_Walker";};
		if ((lbCurSel 1502) == 4) then {_ind = "Kouris_Anastas";};
		if ((lbCurSel 1502) == 5) then {_ind = "Ryoichi_Akaike";};
		if ((lbCurSel 1502) == 6) then {_ind = "Conan_OConnor";};
		if ((lbCurSel 1504) == 0) then {InsT = "CHOP";};
		if ((lbCurSel 1504) == 1) then {InsT = "BOAT";};
		if ((lbCurSel 1504) == 2) then {InsT = ["BOAT","CHOP"]call RETURNRANDOM;};
		if ((lbCurSel 1501) == 0) then {DIFLEVEL = 2;PLSTREGHT = 1; pisteet = 100;};
		if ((lbCurSel 1501) == 1) then {DIFLEVEL = 1;PLSTREGHT = 0.5;pisteet = 200;};
		if ((lbCurSel 1501) == 2) then {DIFLEVEL = 0.5;PLSTREGHT = 0.4;pisteet = 900;};
		if ((lbCurSel 1501) == 3) then {DIFLEVEL = 0.25;PLSTREGHT = 0.2;pisteet = 1600;};
		if ((lbCurSel 1503) == 0) then {_Batman = 0;};
		if ((lbCurSel 1503) == 1) then {_Batman = 1;};
		if ((lbCurSel 1503) == 3) then {_Batman = 2;};
		if ((lbCurSel 1503) == 2) then {_Batman = 3;ctrlEnable [1601, false];} else {ctrlEnable [1601, true];};
		sleep 0.1;
	};
	if (!isNil"IFENABLED") then {
		{
			if !(["LIB", _x] call SAOKINSTRING) then  {SAOKls = SAOKls - [_x];}; 
		} foreach SAOKls;
		{
			if !(["LIB", _x] call SAOKINSTRING) then  {SAOKrs = SAOKrs - [_x];}; 
		} foreach SAOKrs;
		{
			if !(["LIB", _x] call SAOKINSTRING) then  {SAOKps = SAOKps - [_x];}; 
		} foreach SAOKps;
		[] SPAWN {
			{
				if !(["LIB", _x] call SAOKINSTRING) then  {SAOKunif = SAOKunif - [_x];}; 
				sleep 0.01;
			} foreach SAOKunif;
			{
				if !(["LIB", _x] call SAOKINSTRING) then  {SAOKvest = SAOKvest - [_x];}; 
				sleep 0.01;
			} foreach SAOKvest;
			{
				if !(["LIB", _x] call SAOKINSTRING) then  {SAOKpack = SAOKpack - [_x];}; 
				sleep 0.01;
			} foreach SAOKpack;
			{
				if !(["LIB", _x] call SAOKINSTRING) then  {SAOKitem = SAOKitem - [_x];}; 
				sleep 0.01;
			} foreach SAOKitem;
			{
				if !(["LIB", _x] call SAOKINSTRING) then  {SAOKmag = SAOKmag - [_x];}; 
				sleep 0.01;
			} foreach SAOKmag;
			{
				if !(["LIB", _x] call SAOKINSTRING) then  {SAOKhat = SAOKhat - [_x];}; 
				sleep 0.01;
			} foreach SAOKhat;
			{
				if !(["LIB", _x] call SAOKINSTRING) then  {SAOKglas = SAOKglas - [_x];}; 
				sleep 0.01;
			} foreach SAOKglas;
		};
	};

	{if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};} foreach units group player - [player];
	if (isClass(configFile >> "cfgVehicles" >> "AV_IndUs_AR") && {isNil"IFENABLED"} && {_load != 1}) then {
		_n = [player,["AV_CombatUniform_UCP"],[],[]] SPAWN GearToRandom;
		{_n = [_x,["AV_CombatUniform_UCP"],[],[]] SPAWN GearToRandom;} foreach units group player - [player];
	};
	//init.sqf 523
	if (!isNil"Eridanus" && {_load != 1}) then {
		_n = [player,["TEI_UNSC_Marine_uniform_heavy"],["TEI_UNSC_Marine_helmet"],["TEI_UNSC_Marine_vest"]] SPAWN GearToRandom;
		{_n = [_x,["TEI_UNSC_Marine_uniform_medium"],["TEI_UNSC_Marine_helmet"],["TEI_UNSC_Marine_vest"]] SPAWN GearToRandom;} foreach units group player - [player];
	};
	if (!isNil"CheConf" && {_load != 1}) then {
		_n = [player,["U_mas_cer_B_uniform"],["H_mas_cer_HelmetB"],["V_mas_cer_PlateCarrierIA1_B"]] SPAWN GearToRandom;
		_nul = [player, 1] SPAWN FUNKTIO_NATORUS;
		{_n = [_x,["U_mas_cer_B_uniform"],["H_mas_cer_HelmetB"],["V_mas_cer_PlateCarrierIA1_B"]] SPAWN GearToRandom;_nul = [_x, 1] SPAWN FUNKTIO_NATORUS;} foreach units group player - [player];
	};
	// RHS Escalation
	if (!isNil"RHSENABLED" && {isNil"IFENABLED"} && {isNil"SPECOPSENABLED"} && {_load != 1}) then {
		_n = [player,["rhs_uniform_cu_ucp"],["rhsusf_ach_helmet_headset_ucp"],["rhsusf_iotv_ucp_squadleader"]] SPAWN GearToRandom;
		_nul = [player, 1] SPAWN FUNKTIO_NATORUS;
		{_n = [_x,["rhs_uniform_cu_ucp"],["rhsusf_ach_helmet_ucp"],["rhsusf_iotv_ucp"]] SPAWN GearToRandom;_nul = [_x, 1] SPAWN FUNKTIO_NATORUS;} foreach units group player - [player];
	};
	// Italian SPECOPS
	if (!isNil "SPECOPSENABLED" && {isNil "IFENABLED"} && {_load != 1}) then {
		// Removing all gear
		removeAllItems player;
		removeAllWeapons player;
		clearWeaponCargo player;
		clearMagazineCargo player;
		removeBackpack player;
		removeVest player;
		removeHeadgear player;
		
		// Assignign Uniforms
		_uniform = ["U_mas_it_B_IndUniform1_v","U_mas_it_B_IndUniform2_v"] call BIS_fnc_selectRandom;
		_vest = "V_mas_it_PlateCarrier1_rgr_v";
		_headgear = "H_mas_it_helmet_mich_sf_v";
		_backpack = "B_Kitbag_rgr";
		player forceAddUniform _uniform;
		player addHeadgear _headgear;
		player addVest _vest;
		player addBackpack _backpack;

		// Assigning base equipment
		player addWeapon "ItemRadio";
		player addWeapon "ItemMap";
		player addWeapon "B_UavTerminal";
		player addWeapon "Laserdesignator";
		player addWeapon "rhsusf_ANPVS_15";
		player addWeapon "ItemWatch";
		player addWeapon "ItemCompass";
		player addMagazine "Laserbatteries";
		
		{ player addItemToVest "FirstAidKit"; } foreach [1,2,3,4,5];

		if (isClass(configFile >> "CfgPatches" >> "ace_main")) then {
			player addItemToUniform "ACE_MapTools";
			player addItemToUniform "ACE_Flashlight_XL50";
			{ player addItemToUniform "ACE_DefusalKit"; } foreach [1,2];
			player addItemToUniform "ACE_M26_Clacker";
			player addItemToUniform "ACE_EarPlugs";
		};

		// Giving Weapons
		player addWeapon "rhs_weap_m4_carryhandle";
		player addWeaponItem ["rhs_weap_m4_carryhandle","bipod_01_F_blk"];
		player addWeaponItem ["rhs_weap_m4_carryhandle", "rhsusf_acc_rotex5_grey"];  
		player addWeaponItem ["rhs_weap_m4_carryhandle", "optic_Hamr"];
		player addWeapon "rhsusf_weap_m1911a1";
		{ player addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag"; } foreach [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
		{ player addMagazine "rhsusf_mag_7x45acp_MHP"; } foreach [1,2,3,4,5];
		{ player addMagazine "SmokeShellGreen"; } foreach [1,2,3];
		{ player addMagazine "SmokeShellRed"; } foreach [1,2,3];
		{ player addMagazine "SmokeShellYellow"; } foreach [1,2,3];
		
		player addWeapon "rhs_weap_fgm148";
		{ player addMagazine "rhs_fgm148_magazine_AT"; } foreach [1,2];
		
		{
			_n = [_x, ["U_mas_it_B_IndUniform1_v","U_mas_it_B_IndUniform2_v"],["H_mas_it_helmet_mich_sf_v"],["V_mas_it_PlateCarrier1_rgr_v","V_mas_it_PlateCarrier2_rgr_v", "V_mas_it_PlateCarrierGL_rgr_v"]] SPAWN GearToRandom;
			_nul = [_x, 1] spawn FUNKTIO_NATORUS;
		} foreach units group player - [player];
	};

	if (!isNil"IFENABLED" && {_load != 1}) then {
		if (!isnull (BackPackContainer player)) then {removeBackpack player;};
		if (isNil"IFSOVIET") then {
			_n = [player,["U_LIB_US_Off"],["H_LIB_US_Helmet_First_lieutenant"],["V_LIB_US_Vest_Carbine_nco"],["B_LIB_US_RocketBag","B_LIB_US_Radio","B_LIB_US_MGbag","B_LIB_US_MedicBackpack","B_LIB_US_Backpack","B_LIB_US_Backpack_eng","B_LIB_US_Bandoleer"]] SPAWN GearToRandom;
		} else {
			_n = [player,["U_LIB_GER_Soldier_camo"],["H_LIB_GER_HelmetCamo"],["V_LIB_GER_VestMP40"],["B_LIB_GER_SapperBackpack","B_LIB_GER_Radio","B_LIB_GER_Panzer","B_LIB_GER_MedicBackpack","B_LIB_GER_A_frame"]] SPAWN GearToRandom;
		};
		_nul = [player, 1] SPAWN FUNKTIO_NATORUS;
		player unassignItem "NVGoggles";
		player removeItem "NVGoggles";
		{
			if (secondaryWeapon _x != "") then {_x removeweapon (secondaryWeapon _x);};
			if (!isnull (BackPackContainer _x)) then {removeBackpack _x;};
			_x unassignItem "NVGoggles";
			_x removeItem "NVGoggles";
			if (isNil"IFSOVIET") then {
				_n = [_x,["U_LIB_US_Corp"],["H_LIB_US_Helmet_Net"],["V_LIB_US_Vest_Carbine"],["B_LIB_US_RocketBag","B_LIB_US_Radio","B_LIB_US_MGbag","B_LIB_US_MedicBackpack","B_LIB_US_Backpack","B_LIB_US_Backpack_eng","B_LIB_US_Bandoleer"]] SPAWN GearToRandom;_nul = [_x, 1] SPAWN FUNKTIO_NATORUS;
			} else {
				_n = [_x,["U_LIB_GER_Soldier_camo"],["H_LIB_GER_HelmetCamo"],["V_LIB_GER_VestMP40"],["B_LIB_GER_SapperBackpack","B_LIB_GER_Radio","B_LIB_GER_Panzer","B_LIB_GER_MedicBackpack","B_LIB_GER_A_frame"]] SPAWN GearToRandom;_nul = [_x, 1] SPAWN FUNKTIO_NATORUS;
			};
		} foreach units group player - [player];
	};
} else {_load = 1;};

SAOKFPS = 40;
if (_load == 1) then {
	missionnamespace setvariable ["JustTeleported",1];SAOKRESUME = true; 
	[""] SPAWN FSaOkSave;
	[] SPAWN {
		sleep 20;
		missionnamespace setvariable ["JustTeleported",nil];
	};
};

sleep 3;
{_x setcaptive false; _x setbehaviour "AWARE";} foreach units group player;

if (_Batman == 3) then {_nul = [""] SPAWN CivPlayer;};

if (isNil"SAOKRESUME") then {
	if (_ind != "") then {player setIdentity _ind;missionnamespace setvariable ["CIdentity",_ind];} else {missionnamespace setvariable ["PID",name player];missionnamespace setvariable ["CIdentity","Gregory_Jackson"];};
};
if (_vo == 1) then {CusVoiceOff = true;};



if (Stime != 0) then {
	ChaTime = Stime;
};
Stime = nil;
sleep 1;
StartMission = true;
SStime = time + 60;
sleep 1;
if (!isNil"FogOFF") then {
	1 setFog [0,0.1,0];
};

if (Zorro == 1) then {
	{_x CALL SAOKADDPROG;} foreach ["USHelp","GreenHelp","ResHelp"];
};
Zorro = nil;
if (_load == 1) exitWith {
	waitUntil {sleep 1; !isNil"Bumblebeeman"};
	if (Bumblebeeman == 0) then {
		_eh = player addEventHandler ["HandleDamage", {_this CALL FUNKTIO_PDA}];
		_eh = player addEventHandler ["Explosion", {_this CALL FUNKTIO_PDAEX}];
	} else {
		//NO RESPAWN
		_eh = player addEventHandler ["HandleDamage", {_this CALL FUNKTIO_PDA2}];
		_eh = player addEventHandler ["Explosion", {if (((_this select 1) + damage player) > 0.9) then {player setdamage 1;};}];
	};
	SAOKSTARTDIACAT = nil;
	SAOKSTARTDIASET = nil;
	SAOKSARN = nil;
	sleep 10;
	(getposATL vehicle player) SPAWN SAOKMILANTENNA;
	{_x spawn SAOKDELETE;} foreach [c1,c2,c3,c4,c5,c6,c7,c8,c9,x1,x2,x3,x4,x5,s1,s2,s3,s4,s5,s6];
};


if (_Batman == 0) then {
	{_x addPrimaryWeaponItem "muzzle_snds_H";} foreach units group player;
};

if (_Batman == 2 && {isNil"PlayerPos"}) then {
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
		_n = [_x,_uniF,_hats,_vests] SPAWN GearToRandom;
	} foreach units group player;
};
sleep 0.5;
if (!(_Batman in [0,2,3]) && {isNil"PlayerPos"}) then {
	{
		if (random 1 < 0.8) then {_n = [_x,[],[],[]] SPAWN GearToRandom;};
	} foreach units group player; 
};
//U_B_CTRG_3 _n = [_x,["U_B_CTRG_3"],[],[]] SPAWN GearToRandom;
{ 
	if (isNil{(_x getvariable "BirdNum")}) then {
		_num = _x addEventHandler ["FiRed",{(_this select 0) SPAWN ScaredBirdsOnce;}];
		_x setvariable ["BirdNum",_num];
	};
} foreach units group player;


if ((_Batman == 2 || {_Batman == 1}) && {isNil"PlayerPos"}) then {
	waitUntil {sleep 2; vehicle player == player};
	if (_Batman == 1) then {
		_group = [getposATL player, WEST, [FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM,FRIENDC1 call RETURNRANDOM],[],[],[0.8,0.9]] call SpawnGroupCustom;
		_n = [_group,WEST,getposATL (vehicle player),["B_G_Quadbike_01_F",2]] SPAWN VehicleArrival;
		{_n = [_x,[],[],[]] SPAWN GearToRandom;if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};} foreach units _group;
		{_x setcaptive true; _x setbehaviour "CARELESS";} foreach units _group;
		[((name player)+": Watch where you aim, we should be meet team Charlie at any moment. They will join our team"),7] SPAWN SAOKTITLETEXT;
		_l = ["V35","V36"] call RETURNRANDOM;
		[player,player, "PlaV", _l]SPAWN SAOKKBTELL;
		sleep 3;
		waitUntil {sleep 3; {isNull _x || {!alive _x} || {vehicle _x == _x} || {vehicle _x distance (vehicle player) < 40}} count units _group > 0};
		{_x setcaptive false; _x setbehaviour "AWARE";} foreach units _group;
		{
			//_n = [_x,[],[],[]] SPAWN GearToRandom;
			[_x] joinsilent player;
			_x setSkill ["aimingaccuracy", 0.30 + (random 0.4)];
			_x setSkill ["aimingShake", 0.30 + (random 0.4)];
			_x setSkill ["aimingSpeed", 0.35 + (random 0.4)];
			_x setSkill ["spotDistance", 0.35 + (random 0.4)];
			_x setSkill ["spotTime", 0.4 + (random 0.35)];
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
		{_x setcaptive true; _x setbehaviour "CARELESS";if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};} foreach units _group;
		sleep 0.1;
		_weap = ["arifle_MX_MRCO_blk_pointer_F","arifle_MX_GL_blk_ACO_pointer_F"];
		_packs = ["B_Bergen_rgr_Exp"];
		_vests = ["V_TacVest_darkblck","V_PlateCarrierInd_PMC_grn","V_PlateCarrierInd_PMC_blk","V_PlateCarrier1_PMC_khki","V_PlateCarrier1_PMC_rgr","V_PlateCarrier1_PMC_blk","V_PlateCarrier1_PMC_marpat"];
		_uniF = ["U_PMC_WhtPolo_GrnPants","U_PMC_WhtPolo_BluPants","U_PMC_WhtPolo_BgPants","U_PMC_GrnPolo_BgPants","U_PMC_BrnPolo_BluPants","U_PMC_BrnPolo_BgPants","U_PMC_BluPolo_GrnPants","U_PMC_BlckPolo_BluPants","U_PMC_BlckPolo_BgPants","U_PMC_BgPolo_GrnPants","U_PMC_BluPolo_BgPants","U_PMC_BlackPoloShirt_BeigeCords","U_PMC_RedPlaidShirt_DenimCords","U_PMC_BluePlaidShirt_BeigeCords","U_PMC_WTShirt_DJeans","U_PMC_BluTShirt_SJeans","U_PMC_BlkTShirt_SJeans","U_PMC_BlkTShirt_DJeans","U_PMC_GTShirt_SJeans","U_PMC_GTShirt_DJeans"];
		_uniF = _uniF + ["U_PMC_CombatUniformLS_ChckP_BPBB","U_PMC_CombatUniformLS_ChckLR_SPBB","U_PMC_CombatUniformLS_ChckLB_GPBB","U_PMC_CombatUniformLS_ChckDBS_GPSB","U_PMC_CombatUniformLS_SSGPSB","U_PMC_CombatUniformLS_SSGPBB","U_PMC_CombatUniformLS_SSBPBB","U_PMC_CombatUniformLS_IndPBSBB","U_PMC_CombatUniformLS_GSSPBB","U_PMC_CombatUniformLS_GSBPBB","U_PMC_CombatUniformLS_BSSPSB","U_PMC_CombatUniformLS_BSSPBB","U_PMC_CombatUniformLS_BSGPSB","U_PMC_CombatUniformLS_BSGPBB","U_PMC_CombatUniformRS_ChckP_BPBB","U_PMC_CombatUniformRS_ChckLR_SPBB","U_PMC_CombatUniformRS_ChckLB_GPBB","U_PMC_CombatUniformRS_ChckDBS_GPSB","U_PMC_CombatUniformRS_SSGPSB","U_PMC_CombatUniformRS_SSGPBB","U_PMC_CombatUniformRS_SSBPBB","U_PMC_CombatUniformRS_IndPBSBB","U_PMC_CombatUniformRS_GSSPBB","U_PMC_CombatUniformRS_GSBPBB","U_PMC_CombatUniformRS_BSSPSB","U_PMC_CombatUniformRS_BSSPBB","U_PMC_CombatUniformRS_BSGPSB","U_PMC_CombatUniformRS_BSGPBB"];
		_hats = ["H_Watchcap_sgg","H_Watchcap_khk","H_Watchcap_camo","H_Watchcap_blk","H_TurbanO_blk","H_StrawHat_dark","H_StrawHat","H_ShemagOpen_tan","H_ShemagOpen_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_khk","H_Hat_tan","H_Hat_grey","H_Hat_checker","H_Hat_camo","H_Hat_brown","H_Hat_Blue","H_Cap_tan","H_Cap_Red","H_Cap_oli","H_Cap_grn_BI","H_Cap_grn","H_Cap_blu_SPECOPS","H_Cap_blu","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_blk_CMMG","H_Cap_blk","H_Booniehat_tan","H_Booniehat_mcamo","H_Booniehat_khk","H_Booniehat_indp","H_Booniehat_grn","H_Booniehat_dirty","H_Booniehat_dgtl","H_Beret_Red","H_Beret_ocamo","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF","H_Beret_blk_POLICE","H_Beret_blk","H_BandMask_reaper","H_BandMask_khk","H_BandMask_demon","H_BandMask_blk","H_Bandanna_surfer","H_Bandanna_sgg","H_Bandanna_mcamo","H_Bandanna_khk","H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_camo","H_MilCap_mcamo","H_MilCap_ocamo","H_Cap_blu","H_Cap_brn_SERO","H_Cap_Red"];
		_hats = _hats + ["H_Booniehat_DMARPAT","H_Booniehat_GCAMO","H_Booniehat_rgr","H_Capbw_tan_pmc","H_Capbw_pmc","H_Cap_pmc_headphones","H_Cap_tan_pmc","H_Cap_pmc"];
		sleep 0.1;
		[((name player)+": Watch where you aim, we should be meet team Charlie at any moment. They will join our team"),7] SPAWN SAOKTITLETEXT;
		_l = ["V35","V36"] call RETURNRANDOM;
		[player,player, "PlaV", _l]SPAWN SAOKKBTELL;
		sleep 3;
		waitUntil {sleep 3; {isNull _x || {!alive _x} || {vehicle _x == _x} || {vehicle _x distance (vehicle player) < 40}} count units _group > 0};
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
			_n = [_x,_uniF,_hats,_vests] SPAWN GearToRandom;
		} foreach units _group;
		sleep 0.1;
	};
};
if (isNil"PlayerPos") then {
	{if (handgunWeapon _x != "") then {_x removeweapon (handgunWeapon _x);};} foreach units group player - [player];
};
if (!isNil{missionnamespace getvariable "NewFatigue"}) then {{_x enableFatigue false;} foreach allUnits;};
sleep 10;

(getposATL vehicle player) SPAWN SAOKMILANTENNA;

if (isNil"SAOKRESUME" && {_Batman != 3} && {!isNil"ARSE"}) then {
	waitUntil {sleep 1; vehicle player == player};
	sleep 2;
	["Open",true] SPAWN BIS_fnc_arsenal;
	setAccTime 0.1;
	sleep 7;
	_p = getposATL player;
	waitUntil {sleep 0.1; _p distance getposATL player > 7};
	ARSE = nil;
	setAccTime 1;
};
waitUntil {sleep 1; !isNil"Bumblebeeman"};
if (Bumblebeeman == 0) then {
	_eh = player addEventHandler ["HandleDamage", {_this CALL FUNKTIO_PDA}];
	_eh = player addEventHandler ["Explosion", {_this CALL FUNKTIO_PDAEX}];
} else {
	//NO RESPAWN 
	_eh = player addEventHandler ["HandleDamage", {_this CALL FUNKTIO_PDA2}];
	_eh = player addEventHandler ["Explosion", {if (((_this select 1) + damage player) > 0.9) then {player setdamage 1;};}];
};
SAOKSTARTDIACAT = nil;
SAOKSTARTDIASET = nil;
SAOKSARN = nil;
{_x spawn SAOKDELETE;} foreach [c1,c2,c3,c4,c5,c6,c7,c8,c9,x1,x2,x3,x4,x5,s1,s2,s3,s4,s5,s6];