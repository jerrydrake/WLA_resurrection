SAOKRESREQ = {
	// This tasks requires to fight with locals to free a village. This is executed after killing Fox Crow and talking again with the freed POW. It is called from file "Cutscenes\MeetResContact.sqf". This task calls "MainTasks\Resistance2.sqf"
	CurTaskS set [count CurTaskS, "SAOKRESREQ"];
	_nVil = locationposition (player CALL SAOKNEARESTVIL);_nVil set [2,0];
	[
		WEST, // Task owner(s)
		"taskRESREQ1", // Task ID (used when setting task state, destination or description later)
		["Local resistance is badly scattered and unorganized. We need to gather more men under Georgopoulos' command. There have been armed locals in this village constantly fighting against enemy forces. If we help them against the local enemy presence, they would probably be willing to work together. Clear or make captive all enemy units inside 150m from the village center.", "Fight with Locals", "Fight with Locals"], // Task description
		_nVil,			// Task destination
		true,			// true to set task as current upon creation
		-1,				// priority
		true,			// Notification?
		"Attack",		// 3d marker type
		false			// Shared?
	] call BIS_fnc_taskCreate;
	waitUntil {sleep 5; player distance _nVil < 200};
	_pat = [_nVil,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_nVil,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_nVil,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_nVil,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x == EAST}} count (_nVil nearEntities [["Man"],150]) == 0};
	_nul = ["taskRESREQ1","SUCCEEDED",true] call BIS_fnc_taskSetState;
	_cl = if (isNil"IFENABLED") then {"I_G_Soldier_GL_F"} else {"LIB_SOV_smgunner"};
	if (!isNil"Eridanus") then {_cl = "TEI_UNSC_Marine_Grenadier";};
	_actor1 = [WEST,_cl,100,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_actor1 setidentity "Acacius_Georgopoulos";
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[player], "",4]]
	,[[[_actor1], ["Thanks for all the help, things are going as planned, but there is still something I need help from you."],10]]
	,[[[_actor1], ["To persuade even more men to join me, I will need more gear and for that capturing CSAT camp would help the most."],11]]
	,[[[player], "Sounds very risky, but we will do it. Is there any support your men could already provide?",7]]
	,[[[_actor1], ["My new mortar team will aid you, just give them coordinates where to strike"],6]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 0.1; scriptdone _n};
	"Resistance" SPAWN SAOKCHAPTERADD;
	SA_MTASKR2 = compile preprocessfileLineNumbers "MainTasks\Resistance2.sqf";
	_nul = [] SPAWN SA_MTASKR2;
	"ResHelp" CALL SAOKADDPROG;
	"Resistance support also available now in the support menu and for created guarposts you can now add static weapons and guard teams" SPAWN HINTSAOK;
	sleep 5;
	_nul = [_actor1,""] SPAWN FHideAndDelete;
	CurTaskS = CurTaskS - ["SAOKRESREQ"];
};

SAOKGREENREQ = {
	CurTaskS set [count CurTaskS, "SAOKGREENREQ"];
	[
	WEST, // Task owner(s)
	"taskGREENREQ1", // Task ID (used when setting task state, destination or description later)
	["Before Green Army is coming back, they would want us to hold at least 3 camps or 2 factories.", "GREEN: Factories or Expand", "GREEN: Factories or Expand"], // Task description
	//_start, // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_p = SAOKMAPSIZE*0.5;
	waitUntil {sleep 10; count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]) >= 3 || {{getmarkercolor _x in ["ColorPink","ColorGreen"]} count FacMarkers >= 2}};
	_nul = ["taskGREENREQ1","SUCCEEDED"] call SAOKCOTASK;
	_cl = if (isNil"IFENABLED") then {"I_G_officer_F"} else {"LIB_GER_hauptmann"};
	if (!isNil"Eridanus") then {_cl = "TEI_UNSC_Marine_Officer";};
	if (!isNil"CheConf") then {_cl = "I_mas_cer_Soldier_off_F";};
	_actor1 = [WEST,_cl,133,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_actor1 setidentity "Acacius_Georgopoulos";
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[_actor1], ["Nicely done, you have met the requirements for Green Army's return except one final task"],6]]
	,[[[player], "Okay, what task that would be?",4]]
	,[[[_actor1], ["We will need to take down all anti-air near one of the airfields on this island. These objective documents will have coordinates for the right one."],10]]
	,[[[_actor1], ["Once the AO is clear from marked CSAT platoons, Green Army will most likely storm in very quick."],8]]
	,[[[player], ["Roger that, we will recon the area and see what can be done."],7]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 0.1; scriptdone _n}; 
	SA_MTASKR1 = compile preprocessfileLineNumbers "MainTasks\Resistance1.sqf";
	_nul = [] SPAWN SA_MTASKR1;
	_nul = [_actor1,""] SPAWN FHideAndDelete;
	CurTaskS = CurTaskS - ["SAOKGREENREQ"];
};

SAOKUSREQ = {
	// This task is given from the file "Cutscenes\USSitRep.sqf". It is to gain more pisteet or more military camps. At the end it is assigned task "MainTasks\US1.sqf".
	CurTaskS set [count CurTaskS, "SAOKUSREQ"];
	[
		WEST, // Task owner(s)
		"taskUSREQ1", // Task ID (used when setting task state, destination or description later)
		["Before NATO will come in with more forces, we need to prepare the AO for them by holding at least quarter of the military camps or grow prestige value over 4000.", "NATO: Grow Prestige or Expand", "NATO: Grow Prestige or Expand"], // Task description
		objnull,		// Task destination
		true,			// true to set task as current upon creation
		-1,				// priority
		true,			// Notification?
		"Interact",		// 3d marker type
		false			// Shared?
	] call BIS_fnc_taskCreate;
	
	_p = SAOKMAPSIZE*0.5;
	waitUntil {sleep 10; pisteet > 4000 || {((( count (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7])) * 4) >=  count (nearestLocations [[_p,_p,0], ["CampR"], SAOKMAPSIZE*0.7]))}};
	_nul = ["taskUSREQ1","SUCCEEDED",true] call BIS_fnc_taskSetState;
	_actor1 = [WEST,"B_recon_JTAC_F",150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_li = "Understood, we will head to capture the two right away";
	_li2 = "Thats the spirit, good luck";
	if ({getmarkercolor _x == "ColorGreen"} count PierMarkers > 1) then {
		_li = "Actually, we already hold the piers. Just send them in";
		_li2 = "Excellent, I let the HQ know";
	};
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[_actor1], ["Lieutenant, seems like you have completed the objectives Papa Pear gave you"],8]]
	,[[[_actor1], ["Next assignment for you to do is to capture at least 2 piers for us. That makes it easier to bring our gear in"],11]]
	,[[[player], _li,6]]
	,[[[_actor1], [_li2],5]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 0.1; scriptdone _n}; 
	_nul = [_actor1,""] SPAWN FHideAndDelete;
	SA_MTASKUS1 = compile preprocessfileLineNumbers "MainTasks\US1.sqf";
	_nul = [] SPAWN SA_MTASKUS1;
	CurTaskS = CurTaskS - ["SAOKUSREQ"];
};

SAOKENDT = {
	private ["_start","_mar","_nul"];
	CurTaskS set [count CurTaskS, "SAOKENDT"];
	_nul = ["task0","SUCCEEDED"] call SAOKCOTASK;
	_start = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
	while {surfaceIsWater _start || {{_start distance _x < 800} count ISLANDPOSES > 0} || {vehicle player distance _start < 1500}} do {
		sleep 0.1;
		_start = [random SAOKMAPSIZE,random SAOKMAPSIZE,0];
	};
	[
	WEST, // Task owner(s)
	"taskEnd1", // Task ID (used when setting task state, destination or description later)
	["Lieutenant, excellent work - your successful operation on the island is over. Head to the extraction point and call pick up via 0-0-9", "Complete Operation with 0-0-9", "Complete Operation with 0-0-9"], // Task description
	_start, // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_trg = createTrigger["EmptyDetector",getPosATL player];
	_trg setTriggerArea[0,0,0,false];
	_trg setTriggerActivation["INDIA","PRESENT",false];
	_trg setTriggerStatements["this", "ENDMIS = true;", ""]; 
	_trg setTriggerText "Call Extraction";
	_mar = ["ENDmarker",_start,"mil_end",[0.8,0.8],"ColorBlack","Extraction Point - Press 0-0-9 When Here"] CALL FUNKTIO_CREATEMARKER;
	gameLogic1 globalchat (format [localize "STR_milEND1_l1",worldname]);
	sleep 11;
	player sidechat localize "STR_milEND1_l2";
	waitUntil {sleep 5; !isNil"ENDMIS"};
	_b = 0;
	if !(player distance getmarkerpos "ENDmarker" < 150) then {_b = 1;player sidechat localize "STR_milEND1_l3b";sleep 7;gameLogic1 globalchat localize "STR_milEND1_l4b";} else {player sidechat localize "STR_milEND1_l3";sleep 7;gameLogic1 globalchat localize "STR_milEND1_l4";};
	waitUntil {sleep 5; player distance getmarkerpos "ENDmarker" < 150};
	if (_b == 1) then {player sidechat localize "STR_milEND1_l3";sleep 7;gameLogic1 globalchat localize "STR_milEND1_l4";};
	_nul = ["taskEnd1","SUCCEEDED"] call SAOKCOTASK;
	sleep 10;
	_nul = "end1" SPAWN BIS_fnc_endMission;
};

SAOKFFT = {
	private ["_st","_n","_m","_mp","_t","_nul"];
	CurTaskS set [count CurTaskS, "SAOKFFT"];
	if (count SAOKFLMs == 0) exitWith {CurTaskS = CurTaskS - ["SAOKFFT"];SAOKDYNTASKS set [count SAOKDYNTASKS, ["SAOKFFT"]];};
	_m = SAOKFLMs call RETURNRANDOM;
	_mp = getmarkerpos _m;
	gameLogic1 globalchat localize "STR_milT5_l1";
	sleep 11;
	player sidechat localize "STR_milT5_l2";
	sleep 6;
	gameLogic1 globalchat localize "STR_milT5_l3";
	_t = [];
	for "_i" from 0 to 1 do {
		_st = [_mp,50,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
		_n = [_st, "ColorRed",["O_Mortar_01_F"],"o_mortar"] CALL AddVehicleZone;
		DONTSTOREZONES = DONTSTOREZONES + [_n];
		NOMOVEZONES = NOMOVEZONES + [_n];
		SZONES = SZONES + [_n];
		_t set [count _t, _n];
		_n SPAWN {
			private ["_someId"];
			NUMM=NUMM+1;
			_someId = format ["IDSAOK%1",NUMM];
			[_someId, "onEachFrame", {
				if (isNil"IC3D") exitWith {};
				drawIcon3D ["\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_placeables_CA.paa", ICONCOLORRED, getmarkerpos _this,1.51, 1.51, 0, (format ["Disable Mortar: %1m",round (getmarkerpos _this distance player)]), 1, SAOKFSI, "TahomaB"];
			}, _this] call BIS_fnc_addStackedEventHandler;
			waitUntil {sleep 2; !(_this in VEHZONESA) || {getmarkercolor _this != "ColorRed"}};
			[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
		sleep 0.1;
	};
	[
	WEST, // Task owner(s)
	"taskREFFT1", // Task ID (used when setting task state, destination or description later)
	["Resistance is asking for our assistance to deal with CSAT mortars that have been spotted on the borderline", "Disable CSAT Mortars, On Borderline", "Disable CSAT Mortars, On Borderline"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	waitUntil {sleep 4; {_x in VEHZONESA && {getmarkercolor _x == "ColorRed"}} count _t == 0};
	_nul = ["taskREFFT1","SUCCEEDED"] call SAOKCOTASK;
	CurTaskS = CurTaskS - ["SAOKFFT"];
	player sidechat localize "STR_milT5_l4";
	sleep 6;
	gameLogic1 globalchat localize "STR_milT5_l5";
	sleep 25;
	_n = ["taskREFFT1"] CALL BIS_fnc_deleteTask;
};

SAOKPIERT = {
	private ["_c","_d","_ps","_st","_obj","_nul","_start","_crate","_crates","_ranCrate","_someId","_mar2","_mar5","_someId2","_mar1","_aika","_n"];
	CurTaskS set [count CurTaskS, "SAOKPIERT"];
	sleep 30;
	_c = "";
	_p = SAOKMAPSIZE*0.5;
	{if (true) exitWith {_c = _x;};} foreach (nearestLocations [[_p,_p,0], ["CampB"], SAOKMAPSIZE*0.7]);
	if (typename _c != "STRING") exitWith {SAOKDYNTASKS set [count SAOKDYNTASKS, ["SAOKPIERT"]];};
	gameLogic1 globalchat localize "STR_milT4_l1";
	sleep 9;
	player sidechat localize "STR_milT4_l2";
	_ps = + PierMarkers;
	_ps = [_ps,[_c],{(locationposition _input0) distance getmarkerpos _x},"ASCEND"] call SAOKSORTBY;
	_ps = _ps select 0;
	_d = 40;
	_ps = [getmarkerpos _ps,_d,30,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	while {surfaceiswater _ps} do {sleep 0.1;_d = _d + 10;_ps = [_ps,_d,30,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;};
	_crates = [];
	_ranCrate = (CRATECLAS select 2)+(CRATECLAS select 3); 
	for "_i" from 0 to 3 do {
		_st = [_ps,20,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
		_obj = createVehicle [(_ranCrate call RETURNRANDOM),_st, [], 0, "NONE"]; 
		_obj setvariable ["AmCrate",1];
		_obj setdir (random 360);
		_crates set [count _crates,_obj];		
	};
	[
	WEST, // Task owner(s)
	"taskREPier", // Task ID (used when setting task state, destination or description later)
	["Resistance is asking for our assistance to deliver 4 crate shipments from pier to their camp.<br/><br/><img image='arma3pier.jpg' width='360' height='202.5'/>", "Transport 4 Crates from Pier to Camp", "Transport 4 Crates from Pier to Camp"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\vehicleicons\iconCrateWpns_ca.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Pick Up Crates Here: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _ps] call BIS_fnc_addStackedEventHandler;
	NUMM=NUMM+1;
	_mar2 = format ["Hmar%1",NUMM];
	_mar5 = [_mar2,_ps,"mil_pickup",[0.7,0.7],"ColorBlue","Pick Up Crates Here"] CALL FUNKTIO_CREATEMARKER;
	waituntil {sleep 5; {isNull _x || {!isNil{_x getvariable "AUTOSSA"}}} count _crates > 0};
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	NUMM=NUMM+1;
	_someId2 = format ["IDSAOK%1",NUMM];
	[_someId2, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Deliver Crates Here: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, getmarkerpos _c] call BIS_fnc_addStackedEventHandler;
	NUMM=NUMM+1;
	_mar1 = format ["Hmar%1",NUMM];
	_mar5 = [_mar1,getmarkerpos _c,"mil_flag",[0.7,0.7],"ColorBlue","Deliver Crates Here"] CALL FUNKTIO_CREATEMARKER;
	_aika = time + 1200;
	waituntil {sleep 5; {isNull _x || {_x distance getmarkerpos _c < 40 && {isNil{_x getvariable "AUTOSSA"}}}} count _crates == count _crates || {_aika < time}};
	{_x setvariable ["AmCrate",nil];} foreach _crates;
	{deletemarker _x;} foreach [_mar2,_mar1];
	[_someId2, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	if ({!isnull _x && {count ((getweaponcargo _x) select 0) > 0 || {count ((getmagazinecargo _x) select 0) > 0}}} count _crates > 2) then {
		player sidechat localize "STR_milT4_l3";
		_nul = ["taskREPier","SUCCEEDED"] call SAOKCOTASK;
		_start = [getmarkerpos _c,500,100,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
		[_start, "ColorBlue",[(ARMEDVEHICLES select 3)call RETURNRANDOM,(ARMEDVEHICLES select 3)call RETURNRANDOM]] CALL AddVehicleZone;
		sleep 7;
		gameLogic1 globalchat localize "STR_milT4_l4";
		CurTaskS = CurTaskS - ["SAOKPIERT"];
	} else {
		if ({isNull _x} count _crate > 2 || {_aika < time}) then {
			_nul = ["taskREPier","FAILED"] call SAOKCOTASK;
		} else {
			gameLogic1 globalchat localize "STR_milT4_l5";
			_nul = ["taskREPier","FAILED"] call SAOKCOTASK;
			CurTaskS = CurTaskS - ["SAOKPIERT"];
		};
	};
	sleep 25;
	_n = ["taskREPier"] CALL BIS_fnc_deleteTask;
};

SAOKDELINBLACK = {
	titlecut ["","black out",1];
	sleep 1;
	deletevehicle _this;
	sleep 0.5;
	titlecut ["","black in",1];
};
//if ([] CALL FPSGOOD) then {_picked SPAWN SAOKVISITOFFICER;};
SAOKVISITOFFICER = {
	if (!isNil"IFENABLED" || {random 1 > 0.2} || {player distance getmarkerpos _this < 400}) exitWith {};
	_classes = ["O_officer_F"]; 
	_s = EAST;
	if (getmarkercolor _this == "ColorRed") then {
		if (!isNil"CheConf") then {_classes = ["O_mas_cer_Soldier_off_F"];};
		if (isClass(configFile >> "cfgVehicles" >> "rhs_msv_officer")) then {_classes = ["rhs_msv_officer"];};
	} else {
		_classes = ["I_officer_F"]; 
		if (!isNil"CheConf") then {_classes = ["I_mas_cer_Soldier_off_F"];};
		_s = WEST;
	};
	_posB = getmarkerpos _this;
	_posB = [_posB,30,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	_group = [_posB, _s, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
	[_group, _posB, 40] call bis_fnc_taskPatrol;
	sleep ((random 120) + 20);
	if (alive leader _group) then {
		leader _group SPAWN SAOKCPICK;
	};
};

//TO PICK UNIT AWAY unit spawn SAOKCPICK;
SAOKCPICK = {
	//CHOPPER PART
	//Chopper
	private ["_ra","_st2","_start2","_home","_civ","_side","_startC","_chop","_obj","_aika","_nul","_pPos","_max","_d","_di"];
	_civ = _this;
	if (!isNil"IFENABLED") exitWith {_civ SPAWN SAOKDELINBLACK;};
	_side = if (!isNil{_this getvariable "NoutoSide"}) then {_this getvariable "NoutoSide"} else {side _this};
	_home = getposATL _this;
	_ra = (AIRCARRIERCHOP select 0) call RETURNRANDOM;
	if (_side==EAST || {!isNil{_civ getvariable "side"} && {_civ getvariable "side" == "E"}}) then {_ra = (AIRCARRIERCHOP select 1) call RETURNRANDOM;};
	if (!isNil{_civ getvariable "side"} && {_civ getvariable "side" == "G"}) then {_ra = (AIRCARRIERCHOP select 2) call RETURNRANDOM;};
	_pPos = getposATL _this; 
	_d = (["A"] CALL DIS)*2;
	_startC = [(_pPos select 0) + _d - (random _d)*2,(_pPos select 1) + _d - (random _d)*2,50];
	while  {_startC distance vehicle player < 1500} do {
		sleep 1;
		_pPos = getposATL _this; 
		_startC = [(_pPos select 0) + _d - (random _d)*2,(_pPos select 1) + _d - (random _d)*2,50];
	};
	_di= [_startC, _pPos] call SAOKDIRT;
	_chop = [_startC, _di, _ra, _side] call SPAWNVEHICLE;
	CantCommand set [count CantCommand,_chop select 2];
	{_x allowdamage false;_x setcaptive true;} foreach (units (_chop select 2) + [(_chop select 0)]);
	//CHOPPER TRANSPORT
	(_chop select 2) move _home;
	(_chop select 2) setbehaviour "CARELESS";
	(_chop select 2) allowfleeing 0;
	(_chop select 0) flyinheight 50;
	waitUntil {sleep 1; (_chop select 0) distance _home < 700 || {!(alive _civ)}};
	_start2 = [_home,250,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	_d = 250;
	_max = 0;
	while {(!([_start2,10] call SAOKISFLAT) || {[_start2, _ra] CALL SAOKTAKENBOX}) && {_max < 10}} do {
		_max = _max + 1;  
		sleep 0.5;
		_d = _d + 20;
		_start2 = [_home,_d,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
	};
	_obj = createVehicle ["Land_HelipadEmpty_F",_start2, [], 0, "NONE"]; 
	if (!isNil{_civ getvariable "side"} && {_civ getvariable "side" == "E"}) then {
		sleep 15;
		if (alive _civ) then {group _civ spawn SAOKAISMOKEYELLOW;};
	};
	waitUntil {sleep 1; unitready leader (_chop select 2) || {!(alive _civ)}};
	(_chop select 0) land "GET IN";
	_aika = time + 60;
	waitUntil {sleep 1; (getposATL (_chop select 0) select 2) < 6 || {_aika < time} || {!(alive _civ)}};
	(_chop select 0) animateDoor ['door_R', 1]; 
	(_chop select 0) animateDoor ['door_L', 1];
	waitUntil {sleep 1; (getposATL (_chop select 0) select 2) < 1.5 || {_aika < time} || {!(alive _civ)}};
	_n = (group _civ) SPAWN SAOKREMOVEWAYPOINTS; 
	waitUntil {sleep 1; scriptdone _n};
	_civ switchmove "";
	_civ enableAI "MOVE";
	_civ stop false;
	_civ setspeedmode "FULL";
	_civ setbehaviour "CARELESS";
	_civ allowfleeing 0;
	_civ assignascargo (_chop select 0);
	[_civ] ordergetin true;
	_aika = time + 200; 
	waitUntil {sleep 5; _civ in (_chop select 0) || {!(alive _civ)} || {_aika < time} || {isNull _civ}};
	if (vehicle _civ == _civ) then {
		[_civ] ordergetin false;
		_home = [getposATL _civ, 1050,0,"(1 - forest) *(1 - trees) *(1 - houses) * (1 - sea)* (1 - hills)"] CALL SAOKSEEKPOS;
		_civ domove _home;
	};
	deletevehicle _obj;
	if (_side == EAST) then { 
		_nul = [(_chop select 2), (getmarkerpos "WestChopStart"), 7] SPAWN FMoveAndDeleteE; 
	} else {
		_nul = [(_chop select 2), (getmarkerpos "WestChopStart"), 7] SPAWN FMoveAndDelete; 
	};
};

TERE1 = {
	private ["_start","_someId","_mar","_marker","_nul","_n"];
	CurTaskS set [count CurTaskS, "TERE1"];
	sleep (60 + random 60);
	_start = [(vehicle player),5000,2000,"(1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;
	while {surfaceiswater _start || {!(_start CALL SAOKINMAP)}} do {sleep 3; _start = [(vehicle player),5000,2000,"(1 - houses) * (1 - sea)"] CALL SAOKSEEKPOS;};
	gameLogic1 globalchat localize "STR_milT2_l1";
	sleep 10;
	player sidechat localize "STR_Sp2s1r6";
	[player,player, "PlaV","V37"]SPAWN SAOKKBTELL;
	sleep 3;
	[
	WEST, // Task owner(s)
	"taskRE1", // Task ID (used when setting task state, destination or description later)
	["You have been given an order to search Blackfoot team's crash site.", "Search Blackfoot Crashsite", "Search Blackfoot Crashsite"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Search Crashsite: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _start] call BIS_fnc_addStackedEventHandler;
	_mar = format ["MainTaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,_start, "mil_join", [0.8,0.8], "ColorBlue", "Search Blackfoot Crashsite"] CALL FUNKTIO_CREATEMARKER;

	objCHOP = createVehicle ["Land_Wreck_Heli_Attack_01_F",_start, [], 0, "NONE"]; 
	waitUntil {sleep 5; player distance _start < 10};
	player sidechat localize "STR_milT2_l2";
	sleep 6;
	gameLogic1 globalchat localize "STR_milT2_l3";
	[] SPAWN TERE2;
	deletemarker _marker;
	_nul = ["taskRE1","SUCCEEDED"] call SAOKCOTASK;
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	sleep 5;
	_n = ["taskRE1"] CALL BIS_fnc_deleteTask;
};

TERE2 = {
	private ["_actor1","_n","_nul"];
	sleep 5;
	_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[_actor1], "I saw it coming down, you know. You are too late to save those guys",9]]
	,[[[_actor1], ["They were taken and transported away many moments ago by a group of CSAT soldiers"],10]]
	,[[[player], ["Thank you for the information, villager"],6]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 0.1; scriptdone _n}; 
	_nul = [_actor1,""] SPAWN FHideAndDelete;
	sleep 5;
	player sidechat localize "STR_milT2_l4";
	sleep 6;
	gameLogic1 globalchat localize "STR_milT2_l5";
	sleep 6;
	gameLogic1 globalchat localize "STR_milT2_l6";
	sleep 6;
	player sidechat localize "STR_milT2_l7";
	[] SPAWN TERE3;
};

TERE3 = {
	private ["_random","_BOM","_nul","_start","_someId","_mar","_marker","_tarLoc","_uCar","_VarVEH","_start2","_tank","_tg1","_unitrate","_classes","_group","_mecOrNot","_tg1wp1","_wp1","_un","_aika","_c","_n"];
	_start = [objCHOP,150,100,"(1 - sea)"] CALL SAOKSEEKPOS;
	[
	WEST, // Task owner(s)
	"taskRE2", // Task ID (used when setting task state, destination or description later)
	["We are tasked to hold the crashsite until the Blackfoot is taken out by a missile", "Guard the Blackfoot Crashsite", "Guard the Blackfoot Crashsite"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Guard Crashsite from Safe Distance: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _start] call BIS_fnc_addStackedEventHandler;
	_mar = format ["MainTaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,_start, "mil_flag", [0.8,0.8], "ColorBlue", "Guard the Crashsite"] CALL FUNKTIO_CREATEMARKER;
	sleep 5;
	_tarLoc = getposATL objCHOP;
	_uCar =[ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
	_VarVEH = ARMEDVEHICLES select 1;

	_start2 = [(vehicle player),1300,900,"(1 - sea) * (1 + meadow)"] CALL SAOKSEEKPOS;

	_tank = _VarVEH call BIS_fnc_selectRandom;	
	_tg1 = [[(_start2 select 0)-30+(random 60),(_start2 select 1)-30+(random 60),0], 0, _tank, EAST] call SPAWNVEHICLE;
	(_tg1 select 0) forcespeed 4;
	_unitrate = [4,5];
	_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
	_classes = [];
	for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
	_start2 = [(vehicle player),800,600,"(1 - sea) * (1 + meadow)"] CALL SAOKSEEKPOS;
	_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
	Pgroups pushBack _group;
	VehicleGroups set [count VehicleGroups,(_tg1 select 2)];
	if (_mecOrNot == 1 && {_tank in ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"]}) then {
		{_x moveincargo (_tg1 select 0);}foreach units _group;
		_group SPAWN {waitUntil {sleep 3; {alive _x} count units _this == 0|| {behaviour (leader _this) == "COMBAT"}}; if !({alive _x} count units _this == 0) then {{unassignvehicle _x;_x action ["GetOut",vehicle _x];} foreach units _this;(units _this) ordergetin false;};};
	};

	_tarLoc = [_tarLoc,40,10,"(1 - sea) * (1 + meadow)"] CALL SAOKSEEKPOS;
	_tg1wp1= (_tg1 select 2) addWaypoint [_tarLoc, 0]; 
	[(_tg1 select 2), 1] setWaypointBehaviour "COMBAT";
	_wp1 = _group addWaypoint [_tarLoc, 0];
	[_group, 1] setWaypointCombatMode "Red";
	[_group, 1] setWaypointType "GUARD";
	_un = (units _group) + (units (_tg1 select 2));
	(_tg1 select 0) SPAWN {waitUntil {sleep 4; isNull _this ||  {player distance _this < 200}}; if (!isNull _this) then {_this forcespeed 4;};};
	sleep 200;
	_aika = time + 200;
	waitUntil {sleep 5; _aika < time || {{alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}}} count _un < 3} || {!isNil{missionnamespace getvariable "SaOkHealed"}}};
	_c = getposATL objCHOP;
	if (_aika < time) then {
		_BOM = createVehicle ["Bo_GBU12_LGB",[(_c select 0),(_c select 1), 130], [], 0, "NONE"];
		_BOM setVectorUp [0, -10, -1];
		waitUntil {sleep 1;getposATL _bom select 0 < 3};
		deletevehicle objCHOP;
		_nul = ["taskRE2","SUCCEEDED"] call SAOKCOTASK;
		pisteet = pisteet + 350;
		_nul = [350, "Blackfoot Guarded"] SPAWN PRESTIGECHANGE;
		player sidechat localize "STR_milT2_l8";
		sleep 6;
		gameLogic1 globalchat localize "STR_milT2_l10";
	} else {
		deletevehicle objCHOP;
		_nul = ["taskRE2","FAILED"] call SAOKCOTASK;
		player sidechat localize "STR_milT2_l9";
		sleep 6;
		gameLogic1 globalchat localize "STR_milT2_l11";
	};
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	deletemarker _marker;
	CurTaskS = CurTaskS - ["TERE1"];
	[] SPAWN TERE4;
	sleep 5;
	_n = ["taskRE2"] CALL BIS_fnc_deleteTask;
};

TERE4 = {
	private ["_actor1","_n","_nul"];
	CurTaskS set [count CurTaskS, "TERE4"];
	sleep 10;
	_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[_actor1], "Hey soldier, our local armed guards have managed to disarm one CSAT soldier",8]]
	,[[[_actor1], ["He might know something of the chopper crash, do you want to question him?"],9]]
	,[[[player], ["Definitely. Show me the way, villager"],6]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 0.1; scriptdone _n}; 
	_nul = [_actor1,""] SPAWN FHideAndDelete;
	[] SPAWN TERE5;
	CurTaskS = CurTaskS - ["TERE4"];
};

TERE5 = {

	private ["_n","_start","_someId","_mar","_marker","_actor1","_pA","_postOK","_nul","_aika"];
	CurTaskS set [count CurTaskS, "TERE5"];
	_n = locationposition (player CALL SAOKNEARESTVIL); _n set [2,0];
	_start = [_n,350,20,"(1 - sea) * (1+houses)"] CALL SAOKSEEKPOS;
	[
	WEST, // Task owner(s)
	"taskRE3", // Task ID (used when setting task state, destination or description later)
	["Locals have managed to take one CSAT soldier as hostage, we should question him ASAP.", "Question CSAT Captive", "Question CSAT Captive"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Question CSAT Captive: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _start] call BIS_fnc_addStackedEventHandler;
	_mar = format ["MainTaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,_start, "mil_flag", [0.8,0.8], "ColorBlue", "Question CSAT Captive"] CALL FUNKTIO_CREATEMARKER;
	waitUntil {sleep 2; player distance _start < 20};
	_actor1 = [EAST,(ENEMYC1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_actor1 SPAWN SAOKUNITSURRE;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[player], "Do you speak english? Where were our men taken from the crash-site?",8]]
	,[[[_actor1], ["I tell you nothing, you little piggies"],6]]
	,[[[player], ["Fine, we leave you here. Maybe the angry mob will make a pie of you"],8]]
	,[[[_actor1], ["Wait! Please, escort me out of here. I show you were your men are"],9]]
	,[[[player], ["Fine, but we will bring you back if you lie"],7]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 0.1; scriptdone _n}; 
	_pA = getposATl _actor1;
	//deletevehicle _actor1;
	_postOK = ([] CALL SAOKNEARESTGPWITHPOWROOM);
	if (typename _postOK != "STRING") then {
		player sidechat localize "STR_milT2_l12";
		"Use Shift+Y to move the prisoner to cell" SPAWN HINTSAOK;
	} else {
		player sidechat localize "STR_milT2_l13";
		_actor1 dofollow _actor1;
		_actor1 spawn SAOKCPICK;
	};
	sleep 7;
	gameLogic1 globalchat localize "STR_milT2_l13a";
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	deletemarker _marker;
	_nul = ["taskRE3","SUCCEEDED"] call SAOKCOTASK;
	CurTaskS = CurTaskS - ["TERE5"];
	[] SPAWN TERE6;
	sleep 5;
	_n = ["taskRE3"] CALL BIS_fnc_deleteTask;
	_aika = time + 600;
	waitUntil {sleep 5; isNil"_actor1" || {_aika < time} || {isNull _actor1} || {_pA distance _actor1 > 50}};
	if (_aika < time) then {_actor1 SPAWN SAOKDELINBLACK;gameLogic1 globalchat localize "STR_milT2_l14";};
};

TERE6 = {
	CurTaskS set [count CurTaskS, "TERE6"];
	sleep 15;
	gameLogic1 globalchat localize "STR_milT2_l15";
	sleep 7;
	player sidechat localize "STR_milT2_l16";
	_start = [(vehicle player),4000,600,"(1 + trees) * (1 + forest)"] CALL SAOKSEEKPOS;
	[
	WEST, // Task owner(s)
	"taskRE4", // Task ID (used when setting task state, destination or description later)
	["Papa Pear have got new intel of possible location where the pilots are held. We should head the immediately.", "Find Missing Pilots", "Find Missing Pilots"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Find missing Pilots inside 200m radius: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _start] call BIS_fnc_addStackedEventHandler;
	_mar = format ["MainTaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,_start, "mil_circle", [0.8,0.8], "ColorBlue", "Find missing Pilots"] CALL FUNKTIO_CREATEMARKER;
	waitUntil {sleep 5; player distance _start < 500};
	_start = [_start,200,0,"(1 + trees) * (1 + forest)"] CALL SAOKSEEKPOS;
	sleep 0.5;
	_start2 = [_start,10,0,"(1 + trees) * (1 + forest)"] CALL SAOKSEEKPOS;
	_actor1 = [WEST,"B_Helipilot_F",random 360,_start,objNull] CALL FUNKTIO_SPAWNACTOR;
	_actor2 = [WEST,"B_Helipilot_F",random 360,_start2,objNull] CALL FUNKTIO_SPAWNACTOR;
	_g = [group _actor1,group _actor2];
	DONTDELGROUPS = DONTDELGROUPS + _g;
	{
		removeallweapons _x;
		_x setcaptive true;
		_x setbehaviour "CARELESS";
		_x allowfleeing 0;
		_x disableAI "MOVE";
		_x setdamage 0.5;
	} foreach [_actor1, _actor2];
	_pat = [_start,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_start,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x == EAST}} count (_start nearEntities [["Man"],250]) == 0 || {player distance _start < 30 && {{alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x == EAST}} count (_start nearEntities [["Man"],120]) == 0}}};
	{DONTDELGROUPS = DONTDELGROUPS - [_x];} foreach _g;
	deletemarker _marker;
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	if ({!isNull _x && {alive _x}} count [_actor1, _actor2] > 0) then {
		_pic = [];
		{if (alive _x) exitWith {_pic = _x;};} foreach [_actor1, _actor2];
		if (typename _pic != "ARRAY") then {
			_n = [
			[getposATL player, player, _pic],
			[],
			[
			[[[_pic], "Thanks, mate. That was a very close call. Almost got worried when the help arrives, hehe",9]]
			,[[[_pic], ["You better have air lift coming to pick me. We pilots dont walk, hehe"],8]]
			,[[[player], ["That is funny and true. I will contact Papa Bear. Have a good trip home"],8]]
			]
			] SPAWN SAOKCUTSCENE;
			waitUntil {sleep 0.1; scriptdone _n}; 
		};
		_nul = ["taskRE4","SUCCEEDED"] call SAOKCOTASK;
		if ({!isNull _x && {alive _x}} count [_actor1, _actor2] == 2) then {
			player sidechat localize "STR_milT2_l17";
			sleep 7;
			gameLogic1 globalchat localize "STR_milT2_l18";
		} else {
			player sidechat localize "STR_milT2_l17a";
			sleep 7;
			gameLogic1 globalchat localize "STR_milT2_l18a";
		};
		{if (alive _x) then {_x SPAWN SAOKCPICK;};sleep 1;} foreach [_actor1, _actor2];
	} else {
		_nul = ["taskRE4","FAILED"] call SAOKCOTASK;
		player sidechat localize "STR_milT2_l17b";
		sleep 7;
		gameLogic1 globalchat localize "STR_milT2_l18b";
	};
	[] SPAWN TERE7;
	CurTaskS = CurTaskS - ["TERE6"];
};

TERE7 = {CurTaskS = CurTaskS + ["TERE7"];};

TEUS1 = {
	private ["_post","_nul","_actor1","_n"];
	CurTaskS set [count CurTaskS, "TEUS1"];
	_nn = 0;
	_p = SAOKMAPSIZE * 0.5;
	while {{!isNil{(_x getvariable "Post") getvariable "NATO"}} count (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) == 0 && {_nn < 10}} do {
		_nn = _nn + 1;
		if (_nn < 10) then {
			_n = ["NATO"] SPAWN SAOKSPAWNBIGCAMP;
			waitUntil {sleep 1; scriptdone _n};
		};
		sleep 2;
	};
	waitUntil {sleep 4; {!isNil{(_x getvariable "Post") getvariable "NATO"}} count(nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) > 0};
	[
	WEST, // Task owner(s)
	"taskUS3", // Task ID (used when setting task state, destination or description later)
	["You have been given an order to have meeting with Major in new NATO basecamp.", "Visit NATO basecamp", "Visit NATO basecamp"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;

	_post = "";
	_p = SAOKMAPSIZE * 0.5;
	{if (!isNil{(_x getvariable "Post") getvariable "NATO"}) exitWith {_post = (_x getvariable "Post");};} foreach (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
	waitUntil {sleep 4; player distance _post < 40};
	_nul = ["taskUS3","SUCCEEDED"] call SAOKCOTASK;
	_cl = if (isNil"IFENABLED") then {"B_officer_F"} else {"LIB_US_captain"};
	if (!isNil"Eridanus") then {_cl = "TEI_UNSC_Marine_Officer";};
	if (!isNil"CheConf") then {_cl = "B_mas_cer_Soldier_off_F";};
	_actor1 = [WEST,_cl,150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[player], "Major, you wanted to see me, sir",4]]
	,[[[_actor1], "Lieutenant, you have been doing decent job, but CSAT is getting stronger than ever",8]]
	,[[[_actor1], ["I want CSAT to pushed 3km back from this camp, before Colonel arrives. I am giving the lead for you since I have other duties to worry about"],12]]
	,[[[_actor1], ["Dont fall off your high horse or we all gonna pay ultimate price. Now go!"],5]]
	,[[[player], ["Yes sir"],3]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 2; scriptdone _n};
	_nul = [[_actor1]] SPAWN AICampBehaviour;
	sleep 5;
	_nul = [[_actor1],120] SPAWN FUNKTIO_WAD;
	[] SPAWN TEUS2;
	[] SPAWN SAOKUSEX1;
	CurTaskS = CurTaskS - ["TEUS1"];
};

TEUS2 = {
	private ["_post","_mark","_locat","_star","_classs","_n","_mar","_marker","_nul"];
	CurTaskS set [count CurTaskS, "TEUS2"];
	_nn = 0;
	_p = SAOKMAPSIZE * 0.5;
	while {{!isNil{(_x getvariable "Post") getvariable "NATO"}} count (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) == 0 && {_nn < 10}} do {
		_nn = _nn + 1;
		if (_nn < 10) then {
			_n = ["NATO"] SPAWN SAOKSPAWNBIGCAMP;
			waitUntil {sleep 1; scriptdone _n};
		};
		sleep 2;
	};
	waitUntil {sleep 4; {!isNil{(_x getvariable "Post") getvariable "NATO"}} count (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) > 0};
	_post = "";
	{if (!isNil{(_x getvariable "Post") getvariable "NATO"}) exitWith {_post = (_x getvariable "Post");};} foreach (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
	[
	WEST, // Task owner(s)
	"taskUS2", // Task ID (used when setting task state, destination or description later)
	["Major have give an important task to secure surrounding land for NATO basecamp with 3km radius.", "Secure surrounding land for NATO basecamp", "Secure surrounding land for NATO basecamp"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_locat = getposATL _post;
	sleep 1;
	_star = [_locat, 2800,1000,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
	_classs = ARMEDVEHICLES select 1;
	_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
	_n = [_star, "ColorRed",_classs] CALL AddVehicleZone;
	sleep 1;
	_star = [_locat, 2800,1000,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
	_classs = ARMEDVEHICLES select 1;
	_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
	_n = [_star, "ColorRed",_classs] CALL AddVehicleZone;
	sleep 1;
	_mark = [];
	_nearbyVZs = nearestLocations [_locat,["Name"], 3000];
	{if (!isNil{_x getvariable "VZ"}) then {_mark pushback _x;};} foreach _nearbyVZs;
	_mar = format ["TTmar%1",NUMM];
	NUMM=NUMM+1;
	_marker = createMarker [_mar,_locat];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [3000, 3000];
	_marker setMarkerColor "ColorWhite";
	_marker setMarkerBrush "SolidBorder";
	_marker setMarkerAlpha 0.3;
	waitUntil {sleep 10; {!(isNull _x) && {(_x getvariable "Mcolor") == "ColorRed"} && {locationposition _x distance _locat < 3000} && {!surfaceisWater (locationposition _x)}} count _mark == 0};
	_nul = ["taskUS2","SUCCEEDED"] call SAOKCOTASK;
	pisteet = pisteet + 1000;
	_nul = [1000, "NATO basecamp secuRed"] SPAWN PRESTIGECHANGE;
	CurTaskS = CurTaskS - ["TEUS2"];
	deletemarker _marker;
	[] SPAWN TEUS3;
};

TEUS3 = {
	private ["_post","_nul","_actor1","_n"];
	CurTaskS set [count CurTaskS, "TEUS3"];
	_nn = 0;
	_p = SAOKMAPSIZE * 0.5;
	while {{!isNil{(_x getvariable "Post") getvariable "NATO"}} count (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) == 0 && {_nn < 10}} do {
		_nn = _nn + 1;
		if (_nn < 10) then {
			_n = ["NATO"] SPAWN SAOKSPAWNBIGCAMP;
			waitUntil {sleep 1; scriptdone _n};
		};
		sleep 2;
	};
	waitUntil {sleep 4; {!isNil{(_x getvariable "Post") getvariable "NATO"}} count(nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) > 0};
	[
	WEST, // Task owner(s)
	"taskUS4", // Task ID (used when setting task state, destination or description later)
	["You have been given an order to have meeting with Major in new NATO basecamp.", "ReVisit NATO basecamp", "ReVisit NATO basecamp"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;

	_post = "";
	{if (!isNil{(_x getvariable "Post") getvariable "NATO"}) exitWith {_post = (_x getvariable "Post");};} foreach (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
	waitUntil {sleep 4; player distance _post < 40};
	_nul = ["taskUS4","SUCCEEDED"] call SAOKCOTASK;
	_cl = if (isNil"IFENABLED") then {"B_officer_F"} else {"LIB_US_captain"};
	if (!isNil"Eridanus") then {_cl = "TEI_UNSC_Marine_Officer";};
	if (!isNil"CheConf") then {_cl = "B_mas_cer_Soldier_off_F";};
	_actor1 = [WEST,_cl,150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[player], "The surrounding land is secured good, sir",5]]
	,[[[_actor1], "Excelent work, Lieutenant. You can take some rest now. I will prepare briefing for your next tasks later",11]]
	,[[[player], ["Yes sir"],3]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 2; scriptdone _n};
	_nul = [[_actor1]] SPAWN AICampBehaviour;
	sleep 5;
	_nul = [[_actor1],120] SPAWN FUNKTIO_WAD;
	CurTaskS = CurTaskS - ["TEUS3"];
	[] SPAWN TEUS4;
};

TEUS4 = {

	private ["_camps","_Radpos","_RadSite","_radar","_RadSiteF","_someId","_mar","_c","_BOM","_nul"];
	CurTaskS set [count CurTaskS, "TEUS4"];
	_camps = [];
	{_camps pushback _x;} foreach (nearestLocations [player, ["CampR"], 1800]);
	_Radpos = if (count _camps > 0) then {locationposition (_camps call RETURNRANDOM)} else {[player,7600,1800,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS};
	_RadSite = [_Radpos,600,300,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	_radar = createVehicle ["Land_Radar_Small_F",_RadSite, [], 0, "NONE"]; 
	_radar setvectorup (surfaceNormal (getposATL _radar));
	_radar setdir (random 360);
	gameLogic1 globalchat localize "STR_milT10_l1";
	sleep 7;
	player sidechat localize "STR_milT10_l2";
	[
	WEST, // Task owner(s)
	"taskUS5", // Task ID (used when setting task state, destination or description later)
	["We have got orders to find and destroy CSAT radar facility if we can.", "Find CSAT Radar", "Find CSAT Radar"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_RadSiteF = [_RadSite,500,0,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_placeables_CA.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Find Radar inside 500m radius: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _RadSiteF] call BIS_fnc_addStackedEventHandler;
	_mar = format ["TaskM%1",NUMM];
	waitUntil {sleep 4; player distance _RadSite < 50};
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	player sidechat localize "STR_milT10_l3";
	sleep 7;
	gameLogic1 globalchat localize "STR_milT10_l4";
	sleep 7;
	player sidechat localize "STR_milT10_l5";
	sleep 30;
	_c = getposATL _radar;
	_BOM = createVehicle ["Bo_GBU12_LGB",[(_c select 0),(_c select 1), 130], [], 0, "NONE"];
	_BOM setVectorUp [0, -10, -1];
	waitUntil {sleep 1;getposATL _bom select 0 < 3};
	deletevehicle _radar;
	_nul = ["taskUS5","SUCCEEDED"] call SAOKCOTASK;
	CurTaskS =  CurTaskS - ["TEUS4"];
	[] SPAWN TEUS5;
};

TEUS5 = {

	private ["_actor1","_n","_nul","_nVil","_someId","_pat"];
	CurTaskS set [count CurTaskS, "TEUS5"];
	sleep 20;
	_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[_actor1], ["Hey there, please could you help? CSAT is raiding houses in my village"],10]]
	,[[[_actor1], "We have no weapons to drive them away",5]]
	,[[[player], ["Okay, show me the way"],4]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 0.1; scriptdone _n}; 
	[
	WEST, // Task owner(s)
	"taskUS6", // Task ID (used when setting task state, destination or description later)
	["CSAT soldiers are raiding village nearby, we should help the locals to beat them away.", "Stop CSAT in Village", "Stop CSAT in Village"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_nul = [_actor1,""] SPAWN FHideAndDelete;
	_nVil = locationposition (player CALL SAOKNEARESTVIL);_nVil set [2,0];
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling2_CA.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Clear: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _nVil] call BIS_fnc_addStackedEventHandler;
	waitUntil {sleep 5; player distance _nVil < 200};
	_pat = [_nVil,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_nVil,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_nVil,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_nVil,120,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x == EAST}} count (_nVil nearEntities [["Man"],150]) == 0};
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	_nul = ["taskUS6","SUCCEEDED"] call SAOKCOTASK;
	CurTaskS =  CurTaskS - ["TEUS5"];
	[] SPAWN TEUS6;
};

TEUS6 = {

	private ["_someId","_nul","_n","_actor1","_pi","_someId2"];
	CurTaskS =  CurTaskS + ["TEUS6"];
	sleep 20;
	_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[_actor1], ["Hello, I am reporter working for AAN. Could you give me a hand?"],9]]
	,[[[_actor1], "CSAT destroyed my vehicle and I am stucked here",8]]
	,[[[player], ["Maybe, where you would need to get?"],5]]
	,[[[_actor1], "I would be picked at nearby pier, I will show you on map",8]]
	,[[[player], ["Ok, wait a minute. I will search for a suitable vehicle"],7]]
	]
	] SPAWN SAOKCUTSCENE;
	_pi = + PierMarkers;
	_t = [] CALL SAOKSORTPLAYER;
	_pi = [_pi,[_t],{_input0 distance getmarkerpos _x},"ASCEND"] call SAOKSORTBY;
	_pi = getmarkerpos (_pi select 0);
	NUMM=NUMM+1;
	_someId2 = format ["IDSAOK%1",NUMM];
	[_someId2, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Drop Reporter Here: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _pi] call BIS_fnc_addStackedEventHandler;
	[
	WEST, // Task owner(s)
	"taskUS61", // Task ID (used when setting task state, destination or description later)
	["Reporter from AAN is needing a lift to nearby pier", "Transport Reporter", "Transport Reporter"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	while {!isNull _actor1 && {alive _actor1} && {_actor1 distance _pi > 100}} do {
		if (vehicle _actor1 == _actor1) then {
			NUMM=NUMM+1;
			_someId = format ["IDSAOK%1",NUMM];
			[_someId, "onEachFrame", {
				if (isNil"IC3D") exitWith {};
				drawIcon3D ["\A3\ui_f\data\map\markers\military\pickup_CA.paa", ICONCOLORGREEN, getposATL _this,1.51, 1.51, 0, (format ["PickUp Reporter: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
			}, _actor1] call BIS_fnc_addStackedEventHandler;
			waitUntil {sleep 1; (vehicle player != player && {player distance _actor1 < 20}) || {isNull _actor1} || {!alive _actor1}};
			if !(isNull _actor1 || {!alive _actor1}) then {
				_actor1 moveincargo (vehicle player);
				[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			};
		};
		sleep 3;
	};
	waitUntil {sleep 1; speed vehicle player < 1 || {isNull _actor1} || {!alive _actor1}};
	[_someId2, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	if !(isNull _actor1 || {!alive _actor1}) then {
		unassignvehicle _actor1;
		[_actor1] ordergetin false;
		_actor1 disableAI "MOVE";
		_nul = ["taskUS61","SUCCEEDED"] call SAOKCOTASK;
		_n = [
		[getposATL player, player, _actor1],
		[],
		[
		[[[_actor1], ["Thank you very much. I can make it from here. Boat should arrive in few hours"],8]]
		,[[[player], ["No problem, be carefull while waiting"],5]]
		]
		] SPAWN SAOKCUTSCENE;
		waitUntil {sleep 0.1; scriptdone _n}; 
		_actor1 enableAI "MOVE";
		_nul = [_actor1,""] SPAWN FHideAndDelete;
	} else {_nul = ["taskUS61","FAILED"] call SAOKCOTASK;};
	CurTaskS =  CurTaskS - ["TEUS6"];
	[] SPAWN TEUS7;
};

TEUS7 = {
	CurTaskS =  CurTaskS + ["TEUS7"];
	sleep 15;
	gameLogic1 globalchat localize "STR_milT11_l1";
	sleep 7;
	player sidechat localize "STR_milT11_l2";
	_start = [(vehicle player),4000,600,"(1 + trees) * (1 + forest)"] CALL SAOKSEEKPOS;
	[
	WEST, // Task owner(s)
	"taskU7", // Task ID (used when setting task state, destination or description later)
	["Papa Pear have given us an optional task to scout marked area.", "Scout the area", "Scout the area"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\markers\military\circle_CA.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["Scout the area inside 200m radius: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _start] call BIS_fnc_addStackedEventHandler;
	_mar = format ["MainTaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,_start, "mil_circle", [0.8,0.8], "ColorBlue", "Scout the Area"] CALL FUNKTIO_CREATEMARKER;
	waitUntil {sleep 5; player distance _start < 500};
	//_start = [_start,200,0,"(1 + trees) * (1 + forest)"] CALL SAOKSEEKPOS;
	_pat = [_start,170,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_start,170,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	sleep 1;
	_pat = [_start,170,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	[_pat, [2,3]] SPAWN SAOKADDPATROL;
	waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x == EAST}} count (_start nearEntities [["Man"],250]) == 0 || {player distance _start < 30 && {{alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x == EAST}} count (_start nearEntities [["Man"],120]) == 0}}};
	deletemarker _marker;
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	pisteet = pisteet + 500;
	_nul = [500, "Area Scouted"] SPAWN PRESTIGECHANGE;
	_nul = ["taskU7","SUCCEEDED"] call SAOKCOTASK;
	player sidechat localize "STR_milT11_l3";
	sleep 7;
	gameLogic1 globalchat localize "STR_milT11_l4";
	[] SPAWN TEUS8;
	CurTaskS =  CurTaskS - ["TEUS7"];
};

TEUS8 = {
	CurTaskS =  CurTaskS + ["TEUS8"];

	//CurTaskS =  CurTaskS - ["TEUS8"];
};


TEGR1 = {
	private ["_post","_actor1","_n","_nul"];
	CurTaskS set [count CurTaskS, "TEGR1"];
	_nn = 0;
	_p = SAOKMAPSIZE * 0.5;
	_post = "";
	while {{!isNil{(_x getvariable "Post") getvariable "Green"}} count (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) == 0 && {_nn < 10}} do {
		_nn = _nn + 1;
		if (_nn < 10) then {
			_n = ["Green"] SPAWN SAOKSPAWNBIGCAMP;
			waitUntil {sleep 1; scriptdone _n};
		};
		sleep 2;
	};
	_p = SAOKMAPSIZE * 0.5;
	{if (!isNil{(_x getvariable "Post") getvariable "Green"}) exitWith {_post = (_x getvariable "Post");};} foreach (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
	[
	WEST, // Task owner(s)
	"taskGR1BB", // Task ID (used when setting task state, destination or description later)
	["Green Army have established their HQ camp. We should make a visit soon to hear their plans.", "Visit Green HQ", "Visit Green HQ"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	waitUntil {sleep 4; player distance _post < 140};
	_nul = ["taskGR1BB","SUCCEEDED"] call SAOKCOTASK;
	_cl = if (isNil"IFENABLED") then {"I_officer_F"} else {"LIB_GER_hauptmann"};
	if (!isNil"Eridanus") then {_cl = "TEI_UNSC_Marine_Officer";};
	if (!isNil"CheConf") then {_cl = "I_mas_cer_Soldier_off_F";};
	_actor1 = [WEST,_cl,150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[player], "You requested to meet me, sir?",4]]
	,[[[_actor1], "Yes, we want to thank you for the precious work you have done to help us",6]]
	,[[[_actor1], ["Without it, we couldnt have entered this island so early"],6]]
	,[[[_actor1], ["If you ever get in trouble, you can count on us to come aid you. Just call us"],7]]
	,[[[player], ["Thank you, sir"],3]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 2; scriptdone _n};
	_nul = [[_actor1]] SPAWN AICampBehaviour;
	sleep 5;
	_nul = [[_actor1],120] SPAWN FUNKTIO_WAD;
	CurTaskS = CurTaskS - ["TEGR1"];
	[] SPAWN TEGR2;
};

TEGR2 = {
	private ["_ranP","_roads","_c","_array","_gUnitP","_cT","_l","_gUnitS","_n","_actor1","_pP","_carP","_wreC","_obj","_someId","_mar","_marker","_nul","_nVil","_waypoints","_classes","_d","_Bp","_posB","_group","_gU1","_cU1"];
	CurTaskS set [count CurTaskS, "TEGR2"];
	_pP = getposATL player;
	_ranP = [(_pP select 0)+3000-(random 6000),(_pP select 1)+3000-(random 6000),0];
	_roads = (_ranP nearRoads 450);
	while {count _roads == 0} do {
		_ranP = [(_pP select 0)+3000-(random 6000),(_pP select 1)+3000-(random 6000),0];
		_roads = (_ranP nearRoads 450);
	};
	_carP = getposATL (_roads select 0);
	_wreC = "Land_Wreck_Offroad_F";
	_obj = createVehicle [_wreC,_carP, [], 0, "NONE"]; 
	_obj setvectorup (surfaceNormal (getposATL _obj));
	_obj setdir (random 360);
	gameLogic1 globalchat localize "STR_milT6_l1";
	sleep 7;
	player sidechat localize "STR_milT6_l2";
	sleep 7;
	gameLogic1 globalchat localize "STR_milT6_l3";
	sleep 5;
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\markers\military\pickup_CA.paa", ICONCOLORGREEN, _this,1.51, 1.51, 0, (format ["Assist: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _carP] call BIS_fnc_addStackedEventHandler;
	[
	WEST, // Task owner(s)
	"taskGR2a", // Task ID (used when setting task state, destination or description later)
	["Small Green Army team with broken vehicle is requesting help nearby.", "Help Green Soldiers", "Help Green Soldiers"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_mar = format ["TaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,_carP, "mil_start", [0.8,0.8], "ColorGreen", "Assist Green"] CALL FUNKTIO_CREATEMARKER;
	waitUntil {sleep 5; player distance _carP < 20};
	deletemarker _marker;
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	_nul = ["taskGR2a","SUCCEEDED"] call SAOKCOTASK;
	_actor1 = [WEST,"I_Soldier_GL_F",150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
	_n = [
	[getposATL player, player, _actor1],
	[],
	[
	[[[player], "Have you got the vehicle running yet, soldier?",4]]
	,[[[_actor1], "No, something wrong with the battery. Stopped here for picnic and now car wont start.",7]]
	,[[[_actor1], ["Sent one men to visit nearby village if he would find a new one."],6]]
	,[[[player], ["We keep you guys company until he comes back. There can be enemies crawling anywhere"],7]]
	]
	] SPAWN SAOKCUTSCENE;
	waitUntil {sleep 2; scriptdone _n};
	_nVil = locationposition ([_carP] CALL SAOKNEARESTVIL);_nVil set [2,0];
	_waypoints = [];
	_l = 60;
	_gUnitP = [(_nVil select 0)+_l-(random _l)*2,(_nVil select 1)+_l-(random _l)*2, 0];
	_cT = nearestBuilding _gUnitP;
	while {count _waypoints == 0 || {_carP distance _gUnitP < 300}} do {
		sleep 1;
		_gUnitP = [(_nVil select 0)+_l-(random _l)*2,(_nVil select 1)+_l-(random _l)*2, 0];
		_cT = nearestBuilding _gUnitP;
		_waypoints = _cT call SAOKBUILDINGPOS;
		_l = _l + 20;
	};
	_classes = ["I_Soldier_AR_F"]; _d = WEST;
	_Bp = _waypoints call RETURNRANDOM;
	_posB = _cT buildingPos _Bp;
	_group = [_posB, _d, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
	_gU1 = leader _group;
	_gU1 setpos _posB;
	_gU1 setvariable ["CantSur",1];
	DONTDELGROUPS = DONTDELGROUPS + [_group];
	_waypoints = [];
	_gUnitS = [(_nVil select 0)+_l-(random _l)*2,(_nVil select 1)+_l-(random _l)*2, 0];
	_cT = nearestBuilding _gUnitS;
	while {count _waypoints == 0 || {_carP distance _gUnitP < 300} || {_gUnitS distance _gUnitP < 200}} do {
		sleep 1;
		_gUnitS = [(_nVil select 0)+_l-(random _l)*2,(_nVil select 1)+_l-(random _l)*2, 0];
		_cT = nearestBuilding _gUnitS;
		_waypoints = _cT call SAOKBUILDINGPOS;
		_l = _l + 20;
	};
	_classes = ["O_sniper_F"]; _d = EAST;
	if (isClass(configFile >> "cfgVehicles" >> "rhs_msv_marksman")) then {_classes = ["rhs_msv_marksman"];};
	_Bp = _waypoints call RETURNRANDOM;
	_posB = _cT buildingPos _Bp;
	_group = [_posB, _d, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
	_cU1 = leader _group;
	_cU1 setpos _posB;
	DONTDELGROUPS = DONTDELGROUPS + [_group];
	sleep 15;
	gameLogic1 globalchat localize "STR_milT6_l4";
	sleep 7;
	player sidechat localize "STR_milT6_l5";
	sleep 7;
	gameLogic1 globalchat localize "STR_milT6_l6";
	_posB = [(_posB select 0)+(100 - random 200),(_posB select 1)+(100 - random 200),0];
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\Structures_F_Mark\VR\Helpers\Data\VR_Symbol_MARK_WeaponHandling3_CA.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Find and Take Out Sniper, inside 100m: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _posB] call BIS_fnc_addStackedEventHandler;
	_mar = format ["TaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,_posB, "mil_destroy", [0.8,0.8], "ColorRed", "Find and Take Out Sniper"] CALL FUNKTIO_CREATEMARKER;
	[
	WEST, // Task owner(s)
	"taskGR2b", // Task ID (used when setting task state, destination or description later)
	["Green soldier have got ambushed by CSAT sniper, which we need to find and take out.", "Find and Take Out Sniper", "Find and Take Out Sniper"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_n = ["taskGR2a"] CALL BIS_fnc_deleteTask;
	waitUntil {sleep 5; isNull _cU1 || {!alive _cU1} || {!isNil{_cU1 getvariable "SaOkSurrendeRed"}}};
	deletemarker _marker;
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	_nul = ["taskGR2b","SUCCEEDED"] call SAOKCOTASK;
	if (alive _gU1) then {
		_n = [
		[getposATL player, player, _gU1],
		[],
		[
		[[[_gU1], "Thank you, that was a close call. He almost got me with first shot but lucky I was next to building",8]]
		,[[[_gU1], "But he would have finished his job if you wouldnt have come to help. Thank you",7]]
		,[[[player], ["No problem, buddy. Lets hope there isnt more of them hiding nearby"],6]]
		]
		] SPAWN SAOKCUTSCENE;
		waitUntil {sleep 2; scriptdone _n};
	} else {
		if (isNull _actor1 || {!alive _actor1}) then {_actor1 = [WEST,"I_Soldier_GL_F",150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;};
		_n = [
		[getposATL player, player, _actor1],
		[],
		[
		[[[_actor1], "Our medical team could save our guys, but you did your best, friend",7]]
		,[[[player], ["We should have come faster, but sometimes it goes like this"],7]]
		]
		] SPAWN SAOKCUTSCENE;
		waitUntil {sleep 2; scriptdone _n};
	};

	_nul = [_actor1,""] SPAWN FHideAndDelete;
	CurTaskS = CurTaskS - ["TEGR2"];
	[] SPAWN TEGR3;
	sleep 30;
	_n = ["taskGR2b"] CALL BIS_fnc_deleteTask;
	waitUntil {sleep 10; player distance _obj > 800};
	deletevehicle _obj;
};

TEGR3 = {CurTaskS = CurTaskS + ["TEGR3"];};

TERES1 = {

	private ["_ranP","_roads","_c","_array","_gUnitS","_cT","_l","_start","_random","_actor1","_n","_nul","_pP","_carP","_nVil","_z","_arr","_someId","_mar","_marker","_waypoints","_classes","_d","_Bp","_posB","_group","_off","_unitrate","_wp1","_marS","_mar6"];
	CurTaskS = CurTaskS + ["TERES1"];
	sleep (60 + random 60);
	_pP = getposATL player;
	_ranP = [(_pP select 0)+3000-(random 6000),(_pP select 1)+3000-(random 6000),0];
	_roads = (_ranP nearRoads 450);
	while {count _roads == 0} do {
		_ranP = [(_pP select 0)+3000-(random 6000),(_pP select 1)+3000-(random 6000),0];
		_roads = (_ranP nearRoads 450);
	};
	_carP = getposATL (_roads select 0);
	_nVil = locationposition ([_carP] CALL SAOKNEARESTVIL);_nVil set [2,0];
	gameLogic1 globalchat localize "STR_milT8_l1";
	sleep 7;
	player sidechat localize "STR_milT8_l2";
	[
	WEST, // Task owner(s)
	"taskRES1a", // Task ID (used when setting task state, destination or description later)
	["Resistance is asking our help in order to take hold of CSAT officer that is believed to hide in this target village. Our job would be to take out CSAT armor near the village before joining to hunt down the officer.", "Take Out CSAT Armor", "Take Out CSAT Armor"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_start = [_nVil,400,100,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	_z = ["EAST","T",1,_start] CALL SAOKMOREVEHZONESC;
	_arr = (((_z select 0) CALL SAOKZONEDR) CALL APUFF);
	[(_z select 0),[_arr select 0]] CALL SAOKZONED;
	DONTSTOREZONES = DONTSTOREZONES + _z;
	NOMOVEZONES = NOMOVEZONES + _z;
	SZONES = SZONES + _z;
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_launchers_CA.paa", ICONCOLORRED, getmarkerpos _this,1.51, 1.51, 0, (format ["Destroy Armor: %1m",round (getmarkerpos _this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _z select 0] call BIS_fnc_addStackedEventHandler;
	_mar = format ["TaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,getmarkerpos (_z select 0), "mil_destroy", [0.8,0.8], "ColorRed", "Find and Destroy"] CALL FUNKTIO_CREATEMARKER;
	waitUntil {sleep 5; {_x in AllMapMarkers && {getmarkercolor _x == "ColorRed"}} count _z == 0};
	deletemarker _marker;
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	DONTSTOREZONES = DONTSTOREZONES - _z;
	NOMOVEZONES = NOMOVEZONES - _z;
	SZONES = SZONES - _z;
	_nul = ["taskRES1a","SUCCEEDED"] call SAOKCOTASK;
	player sidechat localize "STR_milT8_l3";
	sleep 7;
	gameLogic1 globalchat localize "STR_milT8_l4";
	[
	WEST, // Task owner(s)
	"taskRES1b", // Task ID (used when setting task state, destination or description later)
	["With the armor gone, now we need to hurry and find that CSAT officer. If we find and make him surrender before resistance take him down, we could get more out of him.", "Find CSAT Officer", "Find CSAT Officer"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_n = ["taskRES1a"] CALL BIS_fnc_deleteTask;
	_waypoints = [];
	_l = 60;
	_gUnitS = [(_nVil select 0)+_l-(random _l)*2,(_nVil select 1)+_l-(random _l)*2, 0];
	_cT = nearestBuilding _gUnitS;
	while {count _waypoints == 0 || {player distance _cT < 200}} do {
		sleep 1;
		_gUnitS = [(_nVil select 0)+_l-(random _l)*2,(_nVil select 1)+_l-(random _l)*2, 0];
		_cT = nearestBuilding _gUnitS;
		_waypoints = _cT call SAOKBUILDINGPOS;
		_l = _l + 20;
	};
	_classes = if (isNil"IFENABLED") then {["O_officer_F"]} else {["LIB_GER_hauptmann"]}; _d = EAST;
	if (!isNil"CheConf") then {_classes = ["O_mas_cer_Soldier_off_F"];};
	if (!isNil"Eridanus") then {_classes  = ["TEI_Ins_URF_Officer"];};
	if (isClass(configFile >> "cfgVehicles" >> "rhs_msv_officer")) then {_classes = ["rhs_msv_officer"];};
	_Bp = _waypoints call RETURNRANDOM;
	_posB = _cT buildingPos _Bp;
	_group = [_posB, _d, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
	_off = leader _group;
	_off setpos _posB;
	_off setvariable ["NoTalkative",1];
	DONTDELGROUPS = DONTDELGROUPS + [_group];

	_start = [_nVil,600,300,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
	while {player distance _start < 300} do {_start = [_nVil,700,300,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;};
	_unitrate = [7,8];
	_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
	_classes = [];
	for "_i" from 0 to _random do {_classes set [count _classes,FRIENDC4 call RETURNRANDOM];};
	_group = [_start, WEST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
	_wp1 = _group addWaypoint [_posB, 0];
	[_group, 1] setWaypointCombatMode "Red";
	[_group, 1] setWaypointType "GUARD";
	FriendlyInf set [count FriendlyInf,_group];
	CantCommand = CantCommand + [_group];
	_marS = format ["sdfamar%1",NUMM];
	NUMM=NUMM+1;
	_mar6 = [_marS,_start,"hd_start",[0.9,0.9],"ColorGreen","Assault Begin Here"] CALL FUNKTIO_CREATEMARKER;
	_unPo = [(getposATL _off select 0)+ 100 - random 200,(getposATL _off select 1)+ 100 - random 200,0];
	NUMM=NUMM+1;
	_someId = format ["IDSAOK%1",NUMM];
	[_someId, "onEachFrame", {
		if (isNil"IC3D") exitWith {};
		drawIcon3D ["\A3\ui_f\data\map\markers\military\unknown_CA.paa", ICONCOLORRED, _this,1.51, 1.51, 0, (format ["Find and Make Captive, inside 100m: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
	}, _unPo] call BIS_fnc_addStackedEventHandler;
	_mar = format ["TaskM%1",NUMM];
	NUMM=NUMM+1;
	_marker = [_mar,_unPo, "mil_destroy", [0.8,0.8], "ColorRed", "Find and Make Captive"] CALL FUNKTIO_CREATEMARKER;
	waitUntil {sleep 4; player distance _posB < 400};
	[getposATL _off, [2,3]] SPAWN SAOKADDPATROL;
	[getposATL _off, [2,3]] SPAWN SAOKADDPATROL;
	waitUntil {sleep 5; isNull _off || {!alive _off} || {!isNil{_off getvariable "SaOkSurrendeRed"}}};
	_nul = ["taskRES1b","SUCCEEDED"] call SAOKCOTASK;
	deletemarker _marker;
	deletemarker _mar6;
	[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	if (isNull _off || {!alive _off}) then {
		_cl = if (isNil"IFENABLED") then {"I_G_Soldier_GL_F"} else {"LIB_SOV_smgunner"};
		if (!isNil"Eridanus") then {_cl = "TEI_UNSC_Marine_Grenadier";};
		_actor1 = [WEST,_cl,150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
		_n = [
		[getposATL player, player, _actor1],
		[],
		[
		[[[_actor1], "Good thing that we got him before he espaced",6]]
		,[[[player], ["We could have got some intel from him"],7]]
		,[[[_actor1], "He wasnt going to surrender. It went how it went",7]]
		]
		] SPAWN SAOKCUTSCENE;
		waitUntil {sleep 2; scriptdone _n};
		_nul = [_actor1,""] SPAWN FHideAndDelete;
	} else {
		_n = [
		[getposATL player, player, _off],
		[],
		[
		[[[_off], "I tell you nothing, you should flee while you can",7]]
		,[[[player], ["Lets see how it goes once you get in interrigation room. I am calling a chopper to pick up away"],10]]
		]
		] SPAWN SAOKCUTSCENE;
		waitUntil {sleep 2; scriptdone _n};
		_off spawn SAOKCPICK;
	};
	_n = ["taskRES1b"] CALL BIS_fnc_deleteTask;
	CurTaskS = CurTaskS - ["TERES1"];
	[] SPAWN TERES2;
};
TERES2 = {

	private ["_actor1","_n","_nul","_nVil"];
	CurTaskS = CurTaskS + ["TERES2"];
	sleep 15;
	gameLogic1 globalchat localize "STR_milT8_l5";
	sleep 7;
	player sidechat localize "STR_milT8_l6";
	[
	WEST, // Task owner(s)
	"taskRES2", // Task ID (used when setting task state, destination or description later)
	["CSAT forces are striking soon in the village to avenge the capture of their commander. We need to protect the villagers and build guardpost in the village if possible.", "Hold the Village", "Hold the Village"], // Task description
	//[21857.4,10972.3,0], // Task destination
	true // true to set task as current upon creation
	] call SAOKCRTASK;
	_nVil = locationposition (player CALL SAOKNEARESTVIL);_nVil set [2,0];
	sleep 240;
	waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x == EAST}} count (_nVil nearEntities [["Man"],150]) == 0};
	_nul = ["taskRES2","SUCCEEDED"] call SAOKCOTASK;
	if (player distance _nVil < 400) then {
		_cl = if (isNil"IFENABLED") then {"I_G_Soldier_GL_F"} else {"LIB_SOV_smgunner"};
		if (!isNil"Eridanus") then {_cl = "TEI_UNSC_Marine_Grenadier";};
		_actor1 = [WEST,_cl,150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
		_n = [
		[getposATL player, player, _actor1],
		[],
		[
		[[[_actor1], "That went good. Thanks for staying with us",6]]
		,[[[player], ["No problem, lets hope there wont be more"],6]]

		]
		] SPAWN SAOKCUTSCENE;
		waitUntil {sleep 2; scriptdone _n};
		_nul = [_actor1,""] SPAWN FHideAndDelete;
	};
	CurTaskS = CurTaskS - ["TERES2"];
	[] SPAWN TERES3;
	sleep 30;
	_n = ["taskRES2"] CALL BIS_fnc_deleteTask;
};

TERES3 = {CurTaskS = CurTaskS + ["TERES3"];};