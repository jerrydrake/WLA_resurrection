// tasks
[
WEST, // Task owner(s)
"task0", // Task ID (used when setting task state, destination or description later)
["Your primary objective on the AO is to put an end for enemy presence by working with locals and Green Army. Once the road is more clear we will bring more forces also in and finally liberate the AO by capturing all enemy camps and making their commanders captive.<br/><br/>enemy gets, the weaker to strike back, the loss camps they have and the less factories they run to gain resources.<br/><br/><img image='house.jpg' width='346' height='233'/>", (format ["Liberate %1",worldname]), (format ["Liberate %1",worldname])], // Task description
objnull,		// Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Default",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;


[
WEST, // Task owner(s)
"task1", // Task ID (used when setting task state, destination or description later)
["Once landing safely and finding safe spot, create basecamp with 4 tents for your team, using construction truck you received at insertion (Press Shift+C when near the truck). If you lost it call new one (via Shift+1, Support Call). Once building a camp you will receive additional gear drops.<br/><br/><img image='rest2.jpg' width='345' height='208'/>", "Construct Basecamp with 4 Tents", "Construct Basecamp with 4 Tents"], // Task description
objnull,		// Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Default",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

[] SPAWN {
	waitUntil {sleep 1; !isNil"StartMission" && {isNil"SAOKRESUMEINPROG"}};
	sleep 5;
	if !("Basealku" in (missionnamespace getvariable "Progress")) then {
		_tentC = ["Land_TentDome_F"];
		if (!isNil"IFENABLED") then {_tentC = ["Land_TentDome_F","Land_TentA_F"];};
		waitUntil {sleep 4;([(getposATL player)] CALL RETURNGUARDPOST) distance player < 100 && {!isNil{(([(getposATL player)] CALL RETURNGUARDPOST) getvariable "Gmark")}} && {markertext (([(getposATL player)] CALL RETURNGUARDPOST) getvariable "Gmark") == ""} && {getmarkercolor (([(getposATL player)] CALL RETURNGUARDPOST) getvariable "Gmark") == "ColorGreen"} && {{_x select 0 in _tentC} count (([(getposATL player)] CALL RETURNGUARDPOST) getvariable "StaticO") > 3}};
		"Basealku" CALL SAOKADDPROG;
		([(getposATL player)] CALL RETURNGUARDPOST) setvariable ["Basecamp",1];
		(([(getposATL player)] CALL RETURNGUARDPOST) getvariable "Gmark") setmarkertext " Camp Wolf";
		(([(getposATL player)] CALL RETURNGUARDPOST) getvariable "Gmark") setmarkersize [1,1];
		_nul = ["task1","SUCCEEDED", true] call BIS_fnc_taskSetState;
		["Camp Wolf established", date] CALL SAOKEVENTLOG;
		if (count (units (group player)) > 1) then {
			if ({_x in (missionnamespace getvariable "Progress")} count ["GreenHelp","USHelp"] == 0) then {
				_u = units group player - [player];
				_u = _u call RETURNRANDOM;
				_g = creategroup west;
				[_u] joinsilent _g;
				_n = [
				[getposATL player, player, _u],
				[],
				[
				[[[_u], "The tents are up and ready, sir. Should we set up some more furniture and prepare barbecue for this evening?",8]]
				,[[[player], "Yes, good work, we have now a place to rest and gather resources in.",7]]
				,[[[player], "We should keep expanding this campsite during the next days to have a proper base camp.",7]]
				,[[[player], "For possible POWs, it could maybe be a wise start by creating one cell as soon as we have some guards operating here with better defenses.",9]]
				,[[[player], "And we will not have much air support before establishing a proper military office unless we capture the airfield for our use.",9]]
				]
				] SPAWN SAOKCUTSCENE;
				waitUntil {sleep 0.1; scriptdone _n}; 
				[_u] joinsilent player;
			};
		} else {

		};
	} else {_nul = ["task1","SUCCEEDED",false] call BIS_fnc_taskSetState;};

	if !("Cratealku" in (missionnamespace getvariable "Progress")) then {
		[] SPAWN {
			_start2 = [(vehicle player),1500,500,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
			_d = 1500;
			while {surfaceisWater _start2} do {
				sleep 0.1;
				_start2 = [(vehicle player),_d,500,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
				_d = _d + 400;
			};
			[
			WEST, // Task owner(s)
			"taskCrate", // Task ID (used when setting task state, destination or description later)
			["We are getting supply drops at location to have more gear to use. Better to head there with vehicle as soon as possible.", "Receive Gear Drop", "Receive Gear Drop"], // Task description
			_start2,		// Task destination
			true,			// true to set task as current upon creation
			-1,				// priority
			true,			// Notification?
			"Move",		// 3d marker type
			false			// Shared?
			] call BIS_fnc_taskCreate;

			//NUMM=NUMM+1;
			//_someId = format ["IDSAOKGD%1",NUMM];
			//[_someId, "onEachFrame", {
			//	if (isNil"IC3D") exitWith {};
			//	drawIcon3D ["\A3\ui_f\data\map\vehicleicons\iconParachute_ca.paa", ICONCOLOR, _this,1.51, 1.51, 0, (format ["Receive Gear Drop: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
			//}, _start2] call BIS_fnc_addStackedEventHandler;
			sleep 20;
			[["WLA","GearGathering"]] call BIS_fnc_advHint;
			waitUntil {sleep 4;_start2 distance player < 500};
			"Cratealku" CALL SAOKADDPROG;
			//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			"You are receiving gear drops from sky. You can move the content with Y-key to your gear storage if having last used vehicle under 100m away" SPAWN HINTSAOK;
			_pos = [(_start2 select 0)+50-(random 100),(_start2 select 1)+50-(random 100),0];
			while {surfaceIsWater _pos} do {sleep 5;_pos = [(_start2 select 0)+50-(random 100),(_start2 select 1)+50-(random 100),0];};
			_nul = [_pos,"",1,((CRATECLAS select 0) call RETURNRANDOM)] SPAWN FSupportDrop;
			sleep 1;
			if (DIFLEVEL < 1) then {
				_pos = [(_start2 select 0)+50-(random 100),(_start2 select 1)+50-(random 100),0];
				while {surfaceIsWater _pos} do {sleep 5;_pos = [(_start2 select 0)+50-(random 100),(_start2 select 1)+50-(random 100),0];};
				_nul = [_pos,"",1,((CRATECLAS select 0) call RETURNRANDOM)] SPAWN FSupportDrop;
			};
			sleep 1;
			if (DIFLEVEL < 0.5) then {
				_pos = [(_start2 select 0)+50-(random 100),(_start2 select 1)+50-(random 100),0];
				while {surfaceIsWater _pos} do {sleep 5;_pos = [(_start2 select 0)+50-(random 100),(_start2 select 1)+50-(random 100),0];};
				_nul = [_pos,"",1,((CRATECLAS select 0) call RETURNRANDOM)] SPAWN FSupportDrop;
			};
			["NATO Gear Drop", date] CALL SAOKEVENTLOG;
			_nul = ["taskCrate","SUCCEEDED", true] call BIS_fnc_taskSetState;
		};
	};

	_start = getposATL player;
	sleep 4;

	_start2 = getposATL player;
	_nearbyVZs = nearestLocations [getposATL player,["Name"], 5000];
	if ({!isNil{_x getvariable "VZ"} && {(_x getvariable "Mtext") == " AA"}} count _nearbyVZs > 0) then {
		{if (!isNil{_x getvariable "VZ"} && {(_x getvariable "Mtext") == " AA"}) exitWith {_start2 = locationposition _x;};} foreach _nearbyVZs;
	} else {
		_start2 = [(vehicle player),1500,500,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
		_d = 1500;
		while {surfaceisWater _start2} do {
			sleep 0.1;
			_start2 = [(vehicle player),_d,500,"(1 + meadow) * (1 - sea)"] CALL SAOKSEEKPOS;
			_d = _d + 400;
		};
		_n = ["H","AA",_start2,1] CALL CVZ;
	};
	if !("AAalku" in (missionnamespace getvariable "Progress")) then {
		[
		WEST, // Task owner(s)
		"taskCamp1", // Task ID (used when setting task state, destination or description later)
		["Good work, next its time to secure near surroundings area for your basecamp. Take out AA-installation and possible other zones, CSAT have placed inside the marker area. Succeeding this, will allow us to bring you some heavier tools to the camp.", "Take out nearby Anti-Air", "Take out nearby Anti-Air"], // Task description
		_start2,		// Task destination
		true,			// true to set task as current upon creation
		-1,				// priority
		true,			// Notification?
		"Defend",		// 3d marker type
		false			// Shared?
		] call BIS_fnc_taskCreate;

		//NUMM=NUMM+1;
		//_someId = format ["IDSAOK%1",NUMM];
		//[_someId, "onEachFrame", {
		//	if (isNil"IC3D") exitWith {};
		//	drawIcon3D ["\A3\Structures_F_Bootcamp\VR\Helpers\Data\VR_Symbol_launchers_CA.paa", ICONCOLOR, _this,1.51, 1.51, 0, (format ["Take out Anti-Air and Surroundings: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
		//}, _start2] call BIS_fnc_addStackedEventHandler;

		_mar = format ["TTmar%1",NUMM];
		NUMM=NUMM+1;
		_marker = createMarker [_mar,_start2];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [1000, 1000];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerBrush "FDiagonal";
		_mark = [];
		_nearbyVZs = nearestLocations [_start2,["Name"], 5000];
		{if (!isNil{_x getvariable "VZ"}) then {_mark pushback _x;};} foreach _nearbyVZs;

		waitUntil {sleep 10; {!isNull _x && {(_x getvariable "Mcolor") == "ColorRed"} && {locationposition _x distance _start2 < 1000} && {!surfaceisWater (locationposition _x)}} count _mark == 0};
		"AAalku" CALL SAOKADDPROG;
		["CSAT AA Site Taken Out", date] CALL SAOKEVENTLOG;
		//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		_nul = ["taskCamp1","SUCCEEDED", true] call BIS_fnc_taskSetState;
		pisteet = pisteet + 400;
		_nul = [400, "Enemy Zone CleaRed"] SPAWN PRESTIGECHANGE;
		deletemarker _marker;
		if (DIFLEVEL < 1) then {
			_start = [_start, 140,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
			_nul = [_start,"B_MBT_01_TUSK_F"] SPAWN FSupportDrop;
		};
		sleep 16;
		_start = [_start, 140,0,"(1 + meadow) * (1 - sea)",""] CALL SAOKSEEKPOS;
		_nul = [_start,"B_APC_Wheeled_01_cannon_F"] SPAWN FSupportDrop;
	};
};

[
WEST, // Task owner(s)
"task2", // Task ID (used when setting task state, destination or description later)
["You will not survive alone. After creating basecamp, start looking for local armed groups to work with. Ask local civilians what they know. (Shift+Y near the civilian)<br/><br/><img image='rela.jpg' width='347' height='233'/>", "Make Contact with Civilians", "Make Contact with Civilians"], // Task description
objnull,		// Task destination
true,			// true to set task as current upon creation
-1,				// priority
true,			// Notification?
"Interact",		// 3d marker type
false			// Shared?
] call BIS_fnc_taskCreate;

SAOKBRIE = {
	if !(isClass(configFile >> "cfgSounds" >> "Civ1")) then {
		_log_arty = player createDiaryRecord ["Diary", ["To enable Voices and Music","There is much voice-acting and custom music made for this mission but to allow easier mission updates, the soundfiles are now available as separate 40mb addon named WLA Sound Addon. You can get it from Steam Workshop, official thread in BI forum named - Dynamic Whole Map ArmA3 Missions by SaOk, withSix or MODDB."]];
	};
	//_log_arty = player createDiaryRecord ["Diary", ["How to Call Air-strikes/Artillery","These options are available via 0-8-X. To hit a moving target by air-strike, you need to follow it with laser-marker on. For static targets, you dont need lasermarker. Pointing a map location or a position in 3D mode is enough. Always point first then use the call.<br/><br/><img image='plane.jpg' width='400' height='263'/>"]];
	//_log_Minefield = player createDiaryRecord ["Diary", ["How to Change HC Group Behaviour","On default, High Command groups can issue attack commands to the soldiers in group. To order HC groups to keep their team members close together, Press 0-0-7. To cancel the order press it again. Created HC groups automatically follow the latest order"]];
	_log_deleteunit = player createDiaryRecord ["Diary", ["Guide: Release Stuck Units","If the team-member(s) begin to act silly are immovable, select him or them (with F1..F10) and visit Other Menu via SHIFT + 1. Repeat the process until the issue is fixed. If it dosent help, use the deleting function instead."]];
	_log_deleteunit = player createDiaryRecord ["Diary", ["Guide: Delete Selected Units","If you want to get rid of unwanted team-member(s), select him or them (with F1..F10) and visit Other Menu via SHIFT + 1. Note that deleted units cannot rejoin your group anymore."]];
	//_log_deleteunit = player createDiaryRecord ["Diary", ["Unlimited Savegame","You can save the game anytime by pressing 0-0-0, which overwrites always the earlier save. Be at safe place when doing this"]];
	_log_deleteunit = player createDiaryRecord ["Diary", ["Custom Keys","Call Mortar/Artillery: SHIFT + 6<br/>Minefield Creating System: Shift + L<br/>Construction View: Shift + C<br/>Camp Purchase Screen: SHIFT + 1<br/>VillagePurchase Screen: SHIFT + 1<br/>Talk To Civilians: SHIFT + Y (could be Z, for some keyboards)<br/>Skip Time (Resting): SHIFT + 1<br/>Support Call Menu: SHIFT + 1<br/>Toggle Streetlights: Press SHIFT + 7 (when near distribution board)<br/>Steal Car/Take Objects: Y<br/>Load Crates to Truck: SHIFT + 9<br/>Change Gear: SHIFT + 1 (when near friendly camp)<br/>Change to Civ: Alt+Y (could be Z, for some keyboards)<br/>(Un)holster pistol (when civilian): Ctrl+Y (could be Z, for some keyboards)<br/>Toggle 3D Icons: Shift+U<br/>Use Fist (when unarmed): U"]];
	_log_deleteunit = player createDiaryRecord ["Diary", ["Custom Savegame","Your mission progress can be resumed now even after changing to newer mission version or workshop loosing your saves, but you will need to use custom savegame function <t color='#66FF66'>0-0-0</t> or the savegame button in WLA Menu via <t color='#66FF66'>Shift+1</t><br/><br/> When having progress saved, you can then always resume where you were by keeping progress setting as default position in the displayed start options. You no longer need to press/have resume-button in scenarious menu to continue - <t color='#66FF66'>play and restart both keep your mission progress</t> that you can only overwrite by saving again using the <t color='#66FF66'>0-0-0</t> or the savegame button in WLA Menu via <t color='#66FF66'>Shift+1</t>. You can find the same info also from map/briefing using M-key. REMEMBER TO ALWAYS TO USE CUSTOM SAVE BEFORE EXITING MISSION OR PROGRESS COULD BE LOST"]];

	_log_Minefield = player createDiaryRecord ["Diary", ["How to Build Minefields","To build minefield follow these few simple steps: <br/>- Have vehicle with construct ability nearby<br/>- Point at ground where you want to build it while make sure that the vehicle is under 250m away<br/>- Choose groupmember(s) for minefield creating and press Shift + L. If radio-command is used without choosing, then the last group-member is sent for job<br/>- Choose preferred parameters in dialogue and press ""Accept""<br/><br/>Note: <br/>- Minefield builders are returned to your group after job is done<br/>- Unresponsive units are also returned after timeout<br/>- Currently you cant build more minefields, per session, after placing 100 mines"]];
	//_log_Group = player createDiaryRecord ["Diary", ["How to Manage High Command Groups","You are able to create High Command group(s) of selected units via Shift+1. Note that you need do be in command view (numpad Del) to do it. To return High Command group(s) to your group, select them via Crtl-Space and press 0-0-3"]];
	_log_construction = player createDiaryRecord ["Diary", ["Instructions for Constructing","You can build defences with certain vehicle listed when pressing Shift+C, each with own factor for prices.<br/><br/>Notes: <br/>- Make sure the vehicle is under 50m away from you and press Shift + C to enter construction view<br/>- Before creating an object with buy button, you can rotate/lift it with sliders and correct the position with move button<br/>-If creating wall object, its possible to use angle slider and sidestep button to create quickly attached walls in row<br/>- Once you build any fortress, its also possible to add AI Teams to guard the post. These appear automatically, you cant set their position or direction<br/>- There needs to be around 30m distance between guardposts to be allowed to add more AI teams.<br/><br/><img image='cons.jpg' width='360' height='202.5'/>"]];
	//_log_chopperT = player createDiaryRecord ["Diary", ["Chopper Transport","You can call chopper pick up anytime by pressing 0-0-9. Once the chopper is approaching it will land closer if you use smoke-grenade. You are only allowed to give waypoints for the chopper once you are in the chopper and all your team-members are in any vehicle. For some cases, you may need to use team-member deleting functions 0-0-8"]];
	//_log_medicpacks = player createDiaryRecord ["Diary", ["Medic Packs","You can carry 8 medic-packs at a time and use them by pressing 0-0-0. To resupply, rest at fireplace in US camp"]];
	_log_Commanding = player createDiaryRecord ["Diary", ["Create or Return HC group","You can form HC group of selected team-mates in Other Menu via SHIFT + 1 and return selected HC groups to your team by using the same function. Joining units cost you 100 prestige each unless returning HC group that you created yourself. Function dosent work (currently) when player or any of the selected units is in chopper or plane. Creating much HC's or making friendly HC's join to player group may lead to worse FPS."]];
	//_log_Commanding = player createDiaryRecord ["Diary", ["Commanding","Optional: You have able to command nearby friendly western groups that have more than 1 team-member that haven't assigned to defend any location. Enter the commanding UI via Ctrl+Space, exit it with the same combination"]];
	//_log_russians = player createDiaryRecord ["Diary", ["Car Bombers","Ugly but true, any civilian car that you may face, could have bomb in it. Avoid getting close of the civilian cars as good you can"]];

	//_log_rest = player createDiaryRecord ["Diary", ["Prestige Value","Prestige value can be used to receive additional support inc. air/land support, gear drop, vehicle drop, better reinforcements. Airfields, captured camps, villages are source for more assets<br/><br/><img image='airfield.jpg' width='360' height='202.5'/>"]];
	//_log_rest = player createDiaryRecord ["Diary", ["Village Relationship","Villages provide armed support with specialty if relationship have reached friendly locally. You can improve this by commiting tasks for civilians or by killing nearby enemies. Civilian casulties will lower the relationship causing conflicts at the end. Rumors spread randomly between villages - bad news faster than good news. If village specialty is medical, village is friendly and medic is alive, you can call the village medic to come aid you by pressing 5-1-1. Its better to be near the village to ensure medic's safety<br/><br/><img image='rela.jpg' width='347' height='233'/><br/><br/>"]];
	_log_rest = player createDiaryRecord ["Diary", ["Fast Traveling","You can move to any previously visited friendly camp or guardpost using fast-travel options in WLA-menu by pressing Shift+1. Whole team and the last used vehicle, if still operative, moves with you. Depending on difficulty level, fast-travel is only available in camps, guardposts (Normal) or everywhere. (Easy)"]];
	_log_rest = player createDiaryRecord ["Diary", ["Streetlights","Sometimes during night time it could be tactical advantage to cut off lights from village. Search for distribution board for a toggle. (Press Shift+7 when near this board)<br/><br/><img image='PowerA.jpg' width='385' height='269'/>"]];
	_log_rest = player createDiaryRecord ["Diary", ["Crates and Sling Loading","You are able to load crates to trucks and certains other vehicles. Move truck near the crate(s) and press SHIFT + 9 to get options to unload and load wanted crates. If using the same key combination while inside air vehicle, crate, barrel or vehicle can be sling loaded. (Slingloading is only enabled in a game version with the feature)"]];
	_log_rest = player createDiaryRecord ["Diary", ["Resting","You are able to skip time anytime through WLA-menu by clicking Shift + 1.<br/><br/><img image='rest.jpg' width='345' height='211'/>"]];
	_log_rest = player createDiaryRecord ["Diary", ["Reinforcements","When you have less than 4 team-mates, replacements is sent if nearest village is friendly at you (relationship can be improved by bribing, commiting local tasks and killing bad guys nearby). If you dont want automatic replacements you can toggle those off in WLA menu (Shift+1) -> Other menu, again if wanting them again. Its also possible to buy new men from captured camps and make HC groups to join your group (see the HC guide under) with extra cost."]];
	_log_rest = player createDiaryRecord ["Diary", ["Map Commander","You are able to give orders for icon marked friendly teams seen on map by left clicking the icon and after that giving waypoint by click on map again with shift pressed down. AAF land platoons need to stay near camp, later NATO platoons are more free to move.<br/><br/>Its possible to create own marked platoons using prestige by visiting military center near any friendly camp via Shift+1."]];
	_log_area = player createDiaryRecord ["Diary", ["Undercover Mode","You are able to go undercover with civilian clothes by using Alt+Y. When switching into civilian and avoiding CSAT attention, do not keep weapon in sight ((un)holster weapon with Ctrl+Y), you are not allowed to carry other weapons, vests or army uniform, cant have any team-mates to lead and use only civilian vehicles. It also good idea to stay away from CSAT camps/guardposts. You can return to soldier role by returning to any friendly camp.<br/><br/><img image='undercover.jpg' width='360' height='202.5'/>"]];
	_log_area = player createDiaryRecord ["Diary", ["Gear Gathering","To have more gear to select in Shift+1 Gear Menu, you can collect gear from dead bodies and crates by driving vehicle near them (under 100m away) and using Y-key (could be Z, for some keyboards). After that the gather gear appear in Shift-1 Gear Menu, that can be accessed near friendly camps and guardposts with special Gear building. Near airfields, piers and factories its also possible to buy more gear and weaponry.<br/><br/><img image='gear.jpg' width='360' height='202.5'/>"]];
	_log_rest = player createDiaryRecord ["Diary", ["Support Calls","Air, Land and Gear support can be called via WLA Menu by pressing SHIFT + 1. You have also access to command nearby friendly groups via Ctrl+Space or by clicking military icon in map view M.<br/><br/><img image='support.jpg' width='360' height='202.5'/>"]];
	_log_rest = player createDiaryRecord ["Diary", ["Prestige","To build guardposts, call support and use many other assets and functions you need prestige value that can be gathered by commiting tasks and finding items from houses.<br/><br/>For bigger timed prestige bonus you need to capture factories, powerplants and piers. Factory requires 0.5 Power Plant and 0.25 Pier to work. If you hold storage area, you will get also 10% bonus. To capture area, you need to create guardpost near it with at least one guard team or static weapon. Operating factory also requires local relationshop to be friendly.<br/><br/><img image='factory.jpg' width='360' height='202.5'/>"]];
	_log_area = player createDiaryRecord ["Diary", ["Area Information","There are civilians living on the island. They share the villages with resistance soldiers, do your best to protect the locals without compromising the operation.<br/><br/>Villages provide armed support with specialty if relationship have reached friendly locally. You can improve this by commiting tasks for civilians or by killing nearby enemies. Civilian casulties will lower the relationship causing conflicts at the end. Rumors spread randomly between villages - bad news faster than good news. If village specialty is medical, village is friendly and medic is alive, you can call the village medic to come aid you by pressing 5-1-1. Its better to be near the village to ensure medic's safety.<br/><br/><img image='rela.jpg' width='347' height='233'/><br/><br/>"]];
	_log_briefing = player createDiaryRecord ["Diary", ["Briefing","You have multiple options how to enter the AO, as recon- or standard-team transported with boat or chopper or as one man undercover-team. When reaching the AO, find local friendlies and learn what is going there. Sitrep back to us once possible.<br/><br/>There will be much tasks given to you, but at the end the only primary objective is to capture all military camps in the AO and protect them with guardposts if needed. They key is to gather much resources on the island by capturing factories and other important locations, and call in platoons from military center.<br/><br/><img image='arrival.jpg' width='360' height='202.5'/>"]];
	_log_situation = player createDiaryRecord ["Diary", ["Situation","The situation on Altis is unclear, the last reports we have indicate a CSAT invasion. The Greek government is unwilling to cooperate and refuses to share any intel they have, but is believed they are preparing an assault on the island to protect their military installations. Your team will be sent there to investigate the islands status so we know what further measures we can take while we get NATO approval to get involved.<br/><br/><img image='Situ.jpg' width='384' height='234'/>"]];
};
[] SPAWN SAOKBRIE;

