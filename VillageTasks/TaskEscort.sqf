// This task can be started by talking with civilian and choosing the option to protect the villager


private ["_nV","_wp","_st2","_start2","_Lpos","_normal2","_home","_str","_nul","_nearest","_mar","_h","_mP","_marker","_Tid","_Lna","_header","_ran","_group","_civ","_startC","_ra","_chop","_obj","_aika","_n","_tasks","_picked","_head","_toChoose","_max","_rewardT","_someId"];
_nV = (player CALL SAOKNEARESTVIL);
_mP = locationposition _nV;
_mP set [2,0];
if !([(player CALL SAOKNEARESTVIL),"Task"] CALL SAOKVILCON) then {
	//CONVERSATION
	(missionnamespace getvariable "CivC") SPAWN {

		private ["_aika"];
		_aika = time + 6;
		if (!isNil{missionnamespace getvariable "LastW"}) then {
			waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
		} else {sleep 6;};
		[_this,player, "PlaV", "CivT3"]SPAWN SAOKKBTELL;
	};
	_head = "Enemy troops are after one of our villager that betrayed them. Could you escort with off the island? He would reveal important stuff for your commanders";
	_toChoose = ["Okay, I call chopper to pick him up","Sorry, I cant do that","Anything else I could do?"];
	_nul = [_head, _toChoose,"S",[["V9"],["V18"],["V41"]],(missionnamespace getvariable "CivC")] SPAWN FConversationDialog;
	//TASK TAKEN
	waitUntil {sleep 0.5; scriptdone _nul};
	if (isNil"LineSelected") exitWith {};
	if (LineSelected == 0) then {
		_rewardT = RewardSelected;
		RewardSelected = nil;
		_str = "Task"; 
		[_nV,_str,1] CALL SAOKVILSET;
		_home = _mP;
		_home = [_home,400,10,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
		_h = _nV;
		_mP = [(_home select 0),(_home select 1)+5,0];
		_Tid = format ["TaskCIV%1",NUMM];
		_Tid1 = format ["TaskCIV%1_P1",NUMM];
		_Tid2 = format ["TaskCIV%1_P2",NUMM];
		NUMM=NUMM+1;
		_Lna = _mP CALL NEARESTLOCATIONNAME;
		_header = format ["Escort CIV to Chopper in %1",_Lna];
		[
			WEST, // Task owner(s)
			_Tid, // Task ID (used when setting task state, destination or description later)
			["Local civilian is in trouble and will need to be protected until chopper comes to pick him up to safety.<br/><br/><img image='rela.jpg' width='347' height='233'/>", _header, _header], // Task description
			_mP,			// Task destination
			true,			// true to set task as current upon creation
			-1,				// priority
			true,			// Notification?
			"Defend",		// 3d marker type
			false			// Shared?
		] call BIS_fnc_taskCreate;

		_ran = FRIENDC4 call RETURNRANDOM;
		_group = creategroup WEST;
		_civ = _group createUnit [_ran, _home, [], 0, "form"];
		_civ setvariable ["CivNo",1];
		_civ setvariable ["NoTalkative",1];
		_civ allowfleeing 0; _civ setbehaviour "CARELESS"; _civ disableAI "MOVE";
		removeallweapons _civ;
		_civ setunitpos "MIDDLE";
		_civ setvariable ["DAPPED",true];
		DONTDELGROUPS = DONTDELGROUPS + [_group];
		
		[
			WEST, // Task owner(s)
			[_Tid1,_Tid], // Task ID (used when setting task state, destination or description later)
			["Meet the villager that shall be escorted to safety","Meet the villager", "Meet the villager"], // Task description
			_civ,		// Task destination
			true,			// true to set task as current upon creation
			-1,				// priority
			true,			// Notification?
			"Move",		// 3d marker type
			false			// Shared?
		] call BIS_fnc_taskCreate;
	
		waitUntil {sleep 3; isNull _civ || {!alive _civ} || {player distance _civ < 20} || {surfaceisWater getposATL _civ}};
		if (alive _civ) then {
			_civ setunitpos "AUTO";
			_n = [
			[getposATL player, player, _civ],
			[],
			[
			[[[_civ], ["Help me, I am in deep trouble. I need to get out of here"],6]]
			,[[[player], "Dont worry, I have called chopper to pick you away",6]]
			,[[[player], "You might not stand in open, try to seek cover until the chopper is here. We will keep watch",8]]
			,[[[_civ], "Thank you, brother. I will not forgot this",5]]
			]
			] SPAWN SAOKCUTSCENE;
			waitUntil {sleep 0.1; scriptdone _n}; 
			_nul = [_Tid1,"SUCCEEDED",true] call BIS_fnc_taskSetState;
			
			[
				WEST, // Task owner(s)
				[_Tid2,_Tid], // Task ID (used when setting task state, destination or description later)
				["Protect the villager until the escort chopper arrives","Protect the villager", "Protect the villager"], // Task description
				_civ,		// Task destination
				true,			// true to set task as current upon creation
				-1,				// priority
				true,			// Notification?
				"Defend",		// 3d marker type
				false			// Shared?
			] call BIS_fnc_taskCreate;
			
			_building = nearestBuilding (getposATL _civ);
			_waypoints = _building call SAOKBUILDINGPOS;
			if (count _waypoints > 0) then {
				_pos = _building buildingPos (_waypoints call RETURNRANDOM);
				_civ domove _pos;
			} else {
				_m = 0;
				while {count _waypoints == 0 && {_m < 5}} do {
					_m = _m + 1;
					_pos = getposATL _civ;
					_sHou = [(_pos select 0) + 40 - (random 80), (_pos select 1) + 40 - (random 80), 0];
					_building = nearestBuilding _sHou;
					_waypoints = _building call SAOKBUILDINGPOS;
					if (count _waypoints > 0) then {
						_pos = _building buildingPos (_waypoints call RETURNRANDOM);
						_civ setpos _pos;
					};
					sleep 0.5;
				};
			};
		};

		[_Tid2,_civ] CALL BIS_fnc_taskSetDestination;
		_civ setunitpos "MIDDLE";
		//hint "Hint: Use construction truck near the village";

		//ENEMY ATTACKS
		{
			_n = _x SPAWN SAOKREMOVEWAYPOINTS; 
			waitUntil {sleep 0.1; scriptdone _n};
			_wp = _x addWaypoint [[(getposATL _civ select 0) + 50 - (random 100),(getposATL _civ select 1) + 50 - (random 100),0], 0];
		} foreach  Pgroups + VehicleGroups;
		if (!isNull _civ || {alive _civ}) then {sleep 60;};
		_pat = [_home,220,50,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
		if (player distance _pat > 50) then {[_pat, [2,3]] SPAWN SAOKADDPATROL;};
		if (!isNull _civ || {alive _civ}) then {sleep 60;};
		_pat = [_home,220,50,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
		if (player distance _pat > 50) then {[_pat, [2,3]] SPAWN SAOKADDPATROL;};
		if (!isNull _civ || {alive _civ}) then {sleep 120;};
		if (alive _civ) then {
			//CHOPPER PART
			//Chopper
			if (isNil"IFENABLED") then {
				_startC = [(_start select 0)+2000 -(random 4000), (_start select 1)+2000 -(random 4000), 50];
				_ra = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Heli_Light_01_F"];
				if (isClass(configFile >> "cfgVehicles" >> "I_Heli_light_03_F")) then {_ra = _ra + ["I_Heli_light_03_F","I_Heli_light_03_unarmed_F"];};
				if (!isNil"Eridanus") then {_ra = ["TEI_Pelican_unarmed_tan","TEI_Pelican_unarmed_green","TEI_Pelican_unarmed_black"];};
				if ((!isNil"RHSENABLED") && (isNil"SPECOPSENABLED")) then {_ra = ["RHS_UH60M_d","RHS_UH60M","RHS_CH_47F_light","RHS_CH_47F"];};
				if (!isNil"SPECOPSENABLED") then {_ra = ["B_mas_it_CH_47F","B_mas_it_Heli_light_03_F","B_mas_it_Heli_Transport_02_F","B_mas_it_Heli_light_03_unarmed_F","B_mas_it_Heli_Light_01_F"];};
				if (!isNil"CheConf") then {_ra = ["B_mas_cer_MI8"];};
				_ra = _ra call RETURNRANDOM;
			};
			
			_startC = [(getmarkerpos "WestChopStart") select 0, (getmarkerpos "WestChopStart") select 1, 50];
			_chop = [_startC, 180, _ra, WEST] call SPAWNVEHICLE;
			CantCommand set [count CantCommand,_chop select 2];
			{_x allowdamage false;_x setcaptive true;} foreach (units (_chop select 2) + [(_chop select 0)]);
			//CHOPPER TRANSPORT
			(_chop select 2) move _home;
			(_chop select 2) setbehaviour "CARELESS";
			(_chop select 2) allowfleeing 0;
			(_chop select 0) flyinheight 50;
			(_chop select 0) lock true;
			waitUntil {sleep 1; isNull _civ || {!(alive _civ)} || {(_chop select 0) distance _home < 700}};
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
			waitUntil {sleep 1; unitready leader (_chop select 2) || {!(alive _civ)}};
			(_chop select 0) land "GET IN";
			_aika = time + 60;
			waitUntil {sleep 1; (getposATL (_chop select 0) select 2) < 6 || {_aika < time} || {!(alive _civ)}};
			(_chop select 0) animateDoor ['door_R', 1]; 
			(_chop select 0) animateDoor ['door_L', 1];
			waitUntil {sleep 1; (getposATL (_chop select 0) select 2) < 1.5 || {_aika < time} || {!(alive _civ)}};
			_civ setunitpos "AUTO";
			_civ enableAI "MOVE";
			_civ setspeedmode "FULL";
			_civ setbehaviour "AWARE";
			_civ assignascargo (_chop select 0);
			[_civ] ordergetin true;
			_aika = time + 200; 
			waitUntil {sleep 5; _civ in (_chop select 0) || {!(alive _civ)} || {_aika < time} || {isNull _civ}};
			if (vehicle _civ == _civ) then {
				[_civ] ordergetin false;
				_home = [getposATL _civ, 1050,0,"(1 - forest) *(1 - trees) *(1 - houses) * (1 - sea)* (1 - hills)"] CALL SAOKSEEKPOS;
				_civ domove _home;
			};
			DONTDELGROUPS = DONTDELGROUPS - [_group];
			deletevehicle _obj;
			_nul = [(_chop select 2), (getmarkerpos "WestChopStart"), 7] SPAWN FMoveAndDelete; 
			_civ SPAWN {waitUntil {sleep 10; _this distance vehicle player > 700}; deletevehicle _this;};
			//TASK SUCCESSFULL
		};
		waitUntil {sleep 6; isNull _civ || {!alive _civ} || {_civ distance _home > 150}};
		_nV CALL SAOKVILDATREM;
		if (alive _civ) then {
			_Lna = _home CALL NEARESTLOCATIONNAME;
			_header = format ["Leader of Local Protesters Moved to Safe Location from %1",_Lna];
			[_header, date] CALL SAOKEVENTLOG;
			_n = [_rewardT,_home,150] SPAWN CTreward;
			_nul = [_Tid2,"SUCCEEDED",true] call BIS_fnc_taskSetState;
			_nul = [4] SPAWN MusicT;
			//FRIENDLIER VILLAGE
			_nV CALL SAOKIMPREL;
			/////////////////////////////////////
		} else {
			_Lna = _home CALL NEARESTLOCATIONNAME;
			_header = format ["Leader of Local Protesters Have Been Killed in %1",_Lna];
			[_header, date] CALL SAOKEVENTLOG;
			_nul = [_Tid2,"FAILED",true] call BIS_fnc_taskSetState;
			PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);
			//FAILED TASK
			["ScoreRemoved",["Civilian died",40]] call SAOKNOTIFI;
		};
		sleep 15;
		_nul = [_Tid,"SUCCEEDED",true] call BIS_fnc_taskSetState;
		_n = [_Tid] CALL BIS_fnc_deleteTask;
	} else {
		//ANOTHER TASK
		if (LineSelected == 2) then {
			_tasks = ["VillageTasks\TaskCrate.sqf","VillageTasks\TaskCivPOW.sqf","VillageTasks\TaskEscort.sqf"];
			if ({isNil{_x getvariable "Ghost"}} count (nearestObjects [_mP, ["Land_BarrelWater_F"], 50]) == 0) then {_tasks = _tasks + ["VillageTasks\TaskWater.sqf"];};
			if (count ((getposATL  player) nearEntities [["C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F"], 50]) > 0) then {_tasks = _tasks + ["VillageTasks\TaskRepair.sqf"];};
			if ({getmarkercolor _x == "ColorRed" && getmarkerpos _x distance vehicle player < 300 && {alive _x && {side _x == EAST}} count (getmarkerpos _x nearEntities [["Man"],80]) > 0} count FORTRESSESMM > 0) then {_tasks = ["VillageTasks\TaskFortress.sqf"];};
			if !((_mP) distance (getposATL ([_mP] CALL RETURNGUARDPOST)) < 500) then {_tasks = _tasks + ["VillageTasks\TaskGuardPost.sqf"];};

			if (count _this > 0) then {_tasks = _tasks - [_this select 0];};
			_picked = _tasks call RETURNRANDOM;
			if (!isNil{missionnamespace getvariable "TaskChosen"} && {missionnamespace getvariable "TaskChosen" != "Random Task"}) then {_picked = missionnamespace getvariable "TaskChosen";};

			_nul = [_picked] SPAWN SAOKSTARTTASK;
		};
	};

} else {"You havent completed previous task yet for this village" SPAWN HINTSAOK;};
