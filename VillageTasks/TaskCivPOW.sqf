private["_nV", "_str", "_nul", "_nearest", "_mar", "_home", "_mP", "_marker", "_Tid", "_ran", "_group", "_civ", "_n", "_tasks", "_picked", "_head", "_toChoose", "_rewardT", "_someId", "_Lna", "_header"];
_nV = (player CALL SAOKNEARESTVIL);
_mP = locationposition _nV;
_mP set[2, 0];
_str = "Task";
if !([_nV, _str] CALL SAOKVILCON) then {
	//CONVERSATION
	(missionnamespace getvariable "CivC") SPAWN {

		private["_aika"];
		_aika = time + 6;
		if (!isNil {
				missionnamespace getvariable "LastW"
			}) then {
			waitUntil {
				sleep 0.1;
				player kbWasSaid[_this, "PlaV", (missionnamespace getvariable "LastW"), 3] || {
					_aika < time
				}
			};
		} else {
			sleep 6;
		};
		[_this, player, "PlaV", "CivT1"] SPAWN SAOKKBTELL;
	};
	_head = "Our community leader was taken as prisoner two days ago. Persian took him to their camp. If you save his life, we would own a soul for you";
	_toChoose = ["I see what can I do", "Sorry, I cant do that", "Anything else I could do?"];
	_nul = [_head, _toChoose, "S", [
		["V17"],
		["V18"],
		["V41"]
	], (missionnamespace getvariable "CivC")] SPAWN FConversationDialog;
	//TASK TAKEN
	waitUntil {
		sleep 0.5;
		scriptdone _nul
	};
	if (isNil "LineSelected" || {
			getmarkercolor((["ColorRed"] CALL NEARESTCAMP) getvariable "Marker") != "ColorRed"
		} || {
			surfaceisWater(locationposition(["ColorRed"] CALL NEARESTCAMP))
		}) exitWith {};
	if (LineSelected == 0) then {
		_rewardT = RewardSelected;
		RewardSelected = nil;
		_str = "Task";
		[_nV, _str, 1] CALL SAOKVILSET;
		//_mar = format["VilTaskM%1", NUMM];
		//NUMM = NUMM + 1;
		_home = _mP;
		_mP = locationposition(["ColorRed"] CALL NEARESTCAMP);
		_mP = [(_mP select 0), (_mP select 1) + 5, 0];
		//_marker = [_mar, _mP, "c_unknown", [0.8, 0.8], "ColorPink", "Find and free civilian held in this camp"] CALL FUNKTIO_CREATEMARKER;
		_Tid = format["TaskCIV%1", NUMM];
		NUMM = NUMM + 1;
		[
			WEST, 			// Task owner(s)
			_Tid, 			// Task ID (used when setting task state, destination or description later)
			["Rescue civilian POW that is held in this hostile camp.<br/><br/><img image='rela.jpg' width='347' height='233'/>", "Release Civilian POW", "Release Civilian POW"], // Task description
			_mP, 			// Task destination
			true,			// true to set task as current upon creation
			-1,				// priority
			true,			// Notification?
			"Defend",		// 3d marker type
			false			// Shared?
		] call BIS_fnc_taskCreate;
		
		//_someId = format["IDSAOK%1", NUMM];
		//[_someId, "onEachFrame", {
		//	if (isNil "IC3D") exitWith {};
		//	drawIcon3D[MISSION_ROOT + "pics\Res.paa", ICONCOLORCIV, _this, 1.51, 1.51, 0, (format["Release Civilian POW: %1m", round(_this distance player)]), 1, SAOKFSI, "TahomaB"];
		//}, _mP] call BIS_fnc_addStackedEventHandler;
		
		//hint "Hint: Use construction truck near the village";
		_ran = CIVS1 call RETURNRANDOM;
		_group = creategroup civilian;
		_civ = _group createUnit[_ran, locationposition(["ColorRed"] CALL NEARESTCAMP), [], 0, "form"];
		_civ setvariable["CivNo", 1];
		DONTDELGROUPS = DONTDELGROUPS + [_group];
		_civ allowfleeing 0;
		_civ setbehaviour "CARELESS";
		_civ disableAI "MOVE";
		waitUntil {
			sleep 6;
			!alive _civ || {
				_civ distance vehicle player < 20
			}
		};
		_civ enableAI "MOVE";
		_civ setspeedmode "FULL";
		_civ setbehaviour "AWARE";
		if (vehicle player == player && {
				alive _civ
			}) then {
			_n = [
				[getposATL player, player, _civ],
				[],
				[
					[
						[
							[_civ],
							["Thank you, I though I was dead"], 5
						]
					],
					[
						[
							[player], "No, problem. You better get out of here now. There might be more bad guys lurking nearby", 9
						]
					],
					[
						[
							[_civ], "I will, thanks", 3
						]
					]
				]
			] SPAWN SAOKCUTSCENE;
			waitUntil {
				sleep 0.1;
				scriptdone _n
			};
		};
		_civ domove _home;
		_civ SPAWN {
			waitUntil {
				sleep 10;
				_this distance vehicle player > 700
			};
			deletevehicle _this;
		};
		//TASK SUCCESSFULL
		waitUntil {
			sleep 6;
			!alive _civ || {
				_civ distance(locationposition(["ColorRed"] CALL NEARESTCAMP)) > 50
			}
		};
		DONTDELGROUPS = DONTDELGROUPS - [_group];
		_str = "Task";
		_nV CALL SAOKVILDATREM;
		//deleteMarker _marker;
		if (alive _civ) then {
			_Lna = _home CALL NEARESTLOCATIONNAME;
			_header = format["Villager Rescued From CSAT Camp Near %1", _Lna];
			[_header, date] CALL SAOKEVENTLOG;
			_n = [_rewardT, _home, 150] SPAWN CTreward;
			_nul = [_Tid, "SUCCEEDED", true] call BIS_fnc_taskSetState;
			_nul = [4] SPAWN MusicT;
			//FRIENDLIER VILLAGE
			_nearest = (player CALL SAOKNEARESTVIL);
			_nearest CALL SAOKIMPREL;
			/////////////////////////////////////
		} else {
			_nul = [_Tid, "FAILED", true] call BIS_fnc_taskSetState;
			//FAILED TASK
			["ScoreRemoved", ["Civilian POW died", 40]] call SAOKNOTIFI;
		};
		//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		sleep 15;
		_n = [_Tid] CALL BIS_fnc_deleteTask;
	} else {
		//ANOTHER TASK
		if (LineSelected == 2) then {
			_tasks = ["VillageTasks\TaskCrate.sqf", "VillageTasks\TaskCivPOW.sqf", "VillageTasks\TaskEscort.sqf"];
			if ({
					isNil {
						_x getvariable "Ghost"
					}
				}
				count(nearestObjects[_mP, ["Land_BarrelWater_F"], 50]) == 0) then {
				_tasks = _tasks + ["VillageTasks\TaskWater.sqf"];
			};
			if (count((getposATL player) nearEntities[["C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Hatchback_01_sport_F", "C_Hatchback_01_F", "C_Offroad_01_F", "C_Quadbike_01_F"], 50]) > 0) then {
				_tasks = _tasks + ["VillageTasks\TaskRepair.sqf"];
			};
			if ({
					getmarkercolor _x == "ColorRed" && {
						getmarkerpos _x distance vehicle player < 300
					} && {
						{
							alive _x && {
								side _x == EAST
							}
						}
						count(getmarkerpos _x nearEntities[["Man"], 80]) > 0
					}
				}
				count FORTRESSESMM > 0) then {
				_tasks = ["VillageTasks\TaskFortress.sqf"];
			};
			if !((_mP) distance(getposATL([_mP] CALL RETURNGUARDPOST)) < 500) then {
				_tasks = _tasks + ["VillageTasks\TaskGuardPost.sqf"];
			};
			if (count _this > 0) then {
				_tasks = _tasks - [_this select 0];
			};
			_picked = _tasks call RETURNRANDOM;
			if (!isNil {
					missionnamespace getvariable "TaskChosen"
				} && {
					missionnamespace getvariable "TaskChosen" != "Random Task"
				}) then {
				_picked = missionnamespace getvariable "TaskChosen";
			};
			_nul = [_picked] SPAWN SAOKSTARTTASK;
		};
	};

} else {
	"You havent completed previous task yet for this village"
	SPAWN HINTSAOK;
};