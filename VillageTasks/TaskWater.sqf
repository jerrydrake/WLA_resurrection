
private ["_nV","_str","_mar","_mP","_marker","_Tid","_Lna","_header","_nul","_nearest","_n","_tasks","_picked","_head","_toChoose","_rewardT","_someId"];
_nV = (player CALL SAOKNEARESTVIL);
if !([(player CALL SAOKNEARESTVIL),"Task"] CALL SAOKVILCON) then {
	//CONVERSATION
	(missionnamespace getvariable "CivC") SPAWN {

		private ["_aika","_rr"];
		_aika = time + 6;
		if (!isNil{missionnamespace getvariable "LastW"}) then {
			waitUntil {sleep 0.1; player kbWasSaid [_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {_aika < time}};
		} else {sleep 6;};
		_rr = ["CivS15", "CivT6"]call RETURNRANDOM;
		[_this,player, "PlaV", _rr]SPAWN SAOKKBTELL;
	};
	_head = "Our village is short on water and we are afraid to go get more after one of our villager got shot yesterday. Could you bring us a barrel of water? We would be very gratefull.";
	_toChoose = ["I see what can I do","Sorry, I cant do that","Anything else I could do?"];
	_nul = [_head, _toChoose,"S",[["V17"],["V18"],["V13","V16","V40"]],(missionnamespace getvariable "CivC")] SPAWN FConversationDialog;
	//TASK TAKEN
	waitUntil {sleep 0.5; scriptdone _nul};
	if (isNil"LineSelected") exitWith {};
	if (LineSelected == 0) then {
		_rewardT = RewardSelected;
		RewardSelected = nil;
		_str = "Task"; 
		[_nV,_str,1] CALL SAOKVILSET;
		//_mar = format ["VilTaskM%1",NUMM];
		//NUMM=NUMM+1;

		_mP = locationposition _nV;
		_mP set [2,0];
		_mP = [(_mP select 0),(_mP select 1)+5,0];
		//_marker = [_mar,_mP, "c_unknown", [0.8,0.8], "ColorPink", "Bring barrel of water to the village"] CALL FUNKTIO_CREATEMARKER;
		"Hint: Buy from Camp, Bring with Small Truck" SPAWN HINTSAOK;
		_Tid = format ["TaskCIV%1",NUMM];
		NUMM=NUMM+1;
		_Lna = _mp CALL NEARESTLOCATIONNAME;
		_header = format ["Bring Water to %1",_Lna];
		[
		WEST, // Task owner(s)
		_Tid, // Task ID (used when setting task state, destination or description later)
		["This village is running low with water. Purchase waterbarrel in any friendly camp and bring it to the village using small truck. (shift+9 to load and unload)<br/><br/><img image='rela.jpg' width='347' height='233'/>", _header, _header], // Task description
		_mP, // Task destination
		true,			// true to set task as current upon creation
		-1,				// priority
		true,			// Notification?
		"Interact",		// 3d marker type
		false			// Shared?
		] call BIS_fnc_taskCreate;
		//NUMM=NUMM+1;
		//_someId = format ["IDSAOK%1",NUMM];
		//[_someId, "onEachFrame", {
		//	if (isNil"IC3D") exitWith {};
		//	drawIcon3D ["\A3\ui_f\data\map\groupicons\badge_gs.paa", ICONCOLORCIV, _this,1.51, 1.51, 0, (format ["Bring Water Barrel Here: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
		//}, _mP] call BIS_fnc_addStackedEventHandler;


		//TASK SUCCESSFULL
		waitUntil {sleep 10; {isNil{_x getvariable "AUTOSSA"}} count (nearestObjects [_mP, ["Land_BarrelWater_F"], 50]) > 0};
		{if (isNil{_x getvariable "AUTOSSA"}) then {_x SPAWN {sleep 3; deletevehicle _this;};};} foreach (nearestObjects [_mP, ["Land_BarrelWater_F"], 50]);
		_nV CALL SAOKVILDATREM;
		//deleteMarker _marker;
		_Lna = (getposATL player) CALL NEARESTLOCATIONNAME;
		_header = format ["NATO Bringing Water to Villagers in %1",_Lna];
		[_header, date] CALL SAOKEVENTLOG;
		_n = [_rewardT,_mP,150] SPAWN CTreward;
		_nul = [_Tid,"SUCCEEDED", true] call BIS_fnc_taskSetState;

		[] SPAWN {
			if (vehicle player != player) exitWith {};
			sleep 5;
			_actor1 = [CIVILIAN,(CIVS1 call RETURNRANDOM),150,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
			_n = [
			[getposATL player, player, _actor1],
			[],
			[
			[[[player], ["Hello there civilian, we brought a barrel of water for your village as requested"],6]]
			,[[[_actor1], "Thank you very much for bringing it for us",5]]
			,[[[_actor1], ["Some old folks were already having bad time, but this should help them"],7]]
			,[[[player], ["I hope so, well gotta go. Make sure all get their drink"],7]]
			]
			] SPAWN SAOKCUTSCENE;
			waitUntil {sleep 0.1; scriptdone _n}; 
			_nul = [_actor1,""] SPAWN FHideAndDelete;
		};
		//FRIENDLIER VILLAGE
		_nearest = (player CALL SAOKNEARESTVIL); 
		_nearest CALL SAOKIMPREL;
		//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		sleep 15;
		_n = [_Tid] CALL BIS_fnc_deleteTask;

		/////////////////////////////////////
	} else {
		//ANOTHER TASK
		if (LineSelected == 2) then {
			_mP = locationposition _nV;
			_mP set [2,0];
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
