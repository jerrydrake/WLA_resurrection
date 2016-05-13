// This is one of the random generated tasks

private ["_FTFail","_F1","_condNoWEST","_time","_wp1","_tg1wp1","_posPl","_class","_random","_unitrate","_tg1","_tank","_mecOrNot","_header","_Lna","_Tid","_marS","_size","_start2","_st2","_timer","_locationA","_marrr","_uCar","_VarVEH","_ALLunits","_VEHs","_INFgroups","_VEHgroups","_RedGuardPs","_FrGuardPs","_RedCamps","_FrCamps","_tA","_text","_V","_classes","_group","_nul","_n","_ran","_ker","_C","_Zcol","_st","_star","_classs","_F","_E","_G","_num","_mP","_ResultColor","_dist","_mar5","_data","_desc","_wpPP","_mid","_someId"];


_condNoWEST = {
	private ["_bol"];
	_bol = false; 
	if ({alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {side _x != EAST && {side _x != CIVILIAN}}} count (_this nearEntities [["Man"],100]) < 2) then {_bol = true;};
	_bol
};

_F1 = {
	/*
{
VehicleGroups pushback _x;
} foreach (_this select 0);
*/
	{
		CARS pushback _x;
		_x setvariable ["EndS",1];
	} foreach (_this select 1);
	{
		Pgroups pushback _x;
	} foreach (_this select 2);
};

_FTFail = {
	_n = [getMarkerPos (_this select 0),"EAST"] CALL GuardPostSide;
	["ScoreRemoved",["Enemy attack succeeded. You lost camp",30]] call SAOKNOTIFI;
	_nul = [(_this select 1),"FAILED",true] call BIS_fnc_taskSetState;
	(_this select 0) setmarkercolor "ColorRed";
};

//INIT
_VEHgroups = [];
_INFgroups = [];
_VEHs = [];
_ALLunits = [];
_VarVEH = (ARMEDVEHICLES select 1)+(ARMEDTANKS select 1);
_uCar =[ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_marrr = (_this select 0);
_type = if (getmarkercolor _marrr == "ColorRed") then {"o_hq"} else {"n_hq"};
_marrr setMarkerType _type;
_marrr setMarkerSize [1,1];
UndAttackMs set [count UndAttackMs, _marrr]; 
_locationA = getmarkerpos (_this select 0);
_timer = time + (180 + (random 500));
_dist = 100 + (random 250);
_start2 = [_locationA, 1200,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_size = 1200;
while {{_start2 distance _x < 500} count VarBlackListE > 0 || {{_start2 distance _x < 500} count VarBlackListF > 0} || {player distance _start2 < 900} || {_start2 distance _locationA < 900}} do {
	sleep 1;
	_start2 = [_locationA, _size,0,"(1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
	_size = _size + 50;
};
//_marS = format ["LINEmar%1",NUMM];
//NUMM=NUMM+1;
_mar5 = getposATL _locationA;
if ({(_x getvariable "Mcolor") == "ColorRed" && {locationposition _x distance _mar5 < 5000}} count AAsM == 0) then {
	_wpPP = _mar5;
	_mid = [((_start2 select 0)+(_wpPP select 0))*0.5,((_start2 select 1)+(_wpPP select 1))*0.5,0];
	[[_mid],"mil_arrow","ColorRed",([_start2, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
};
[["WLA","Battle"]] call BIS_fnc_advHint;
["E","CAPS"] SPAWN SAOKRADIOMES;
_data = ["EXPECTED BATTLE",_locationA,[],[["I_static_AT_F","n_unknown"],["I_HMG_01_high_F","n_unknown"]]] CALL BattleVirtualIntel;
_ResultColor = _data select 0;
_Tid = format ["TaskBat%1",NUMM];
NUMM=NUMM+1;
_Lna = _locationA CALL NEARESTLOCATIONNAME;
_header = format ["Defend Camp near %1",_Lna];
_desc =("One of friendly camps is about to get under attack by enemy. Should we give them hand or hope their defenses is enough?"+_ResultColor);

_locationA set [2,20];

[
	WEST, // Task owner(s)
	_Tid, // Task ID (used when setting task state, destination or description later)
	[_desc, _header, _header], // Task description
	_locationA,		// Task destination
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
//	drawIcon3D ["\A3\ui_f\data\map\markers\nato\n_hq.paa", ICONCOLORBLUE, _this,1.51, 1.51, 0, (format ["DEFEND FRIENDLY CAMP: %1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
//}, _locationA] call BIS_fnc_addStackedEventHandler;

if (count _this == 1) then {
	//_ran = ["STR_Sp8t2r1","STR_Sp8t2r1a","STR_Sp8t2r1b","STR_Sp8t2r1c"] call BIS_fnc_selectRandom;
	///////////RADIO CHAT
	_RedCamps = 0;
	_RedGuardPs =0;
	_FrCamps = 0;
	_FrGuardPs =0;
	{
		if (getmarkercolor ((_x getvariable "Post") getvariable "Gmark") == "ColorRed") then {_RedGuardPs = _RedGuardPs + 1;} else {_FrGuardPs = _FrGuardPs + 1;};
	} foreach (nearestLocations [_locationA, ["PostG","PostR"], 1700]);
	{
		if ((getmarkercolor (_x getvariable "Marker")) == "ColorRed") then {_RedCamps = _RedCamps + 1;} else {_FrCamps = _FrCamps + 1;};
	} foreach (nearestLocations [_locationA, ["CampR","CampB"], 1700]);
	_text = ("Wolf, our camp near "+_Lna+" is about to get attacked by 1-3 enemy vehicles and infantry");
	[[WEST,"base"],"HQ_1"] CALL RadioF; 
	//_text = _text + (getText (configfile >> "CfgVehicles" >> _tank >> "displayName"));
	if ("o_air" in (_data select 2) || {"o_armor" in (_data select 2)} || {"o_uav" in (_data select 2)}) then {
		_text = _text + ". We also have reports of possible recent hostile";[[WEST,"base"],"HQ_2"] CALL RadioF; 
		_tA = [];
		if ("o_air" in (_data select 2)) then {_tA = _tA + ["air_support"];};
		if ("o_armor" in (_data select 2)) then {_tA = _tA + ["armor"];};
		if ("o_uav" in (_data select 2)) then {_tA = _tA + ["UAV"];};
		{[[WEST,"base"],_x] CALL RadioF;_text = _text + " "+_x; _tA = _tA - [_x]; if (count _tA == 1) then {_text = _text + " and";[[WEST,"base"],"HQ_6"] CALL RadioF;}; if (count _tA > 1) then {_text = _text + ",";};} foreach _tA;
		_text = _text + " presence in the AO that could support the attack"; [[WEST,"base"],"HQ_7"] CALL RadioF; 
	};
	if (_RedCamps > 1 || {_RedGuardPs > 0}) then {_text = _text + ". There is "; [[WEST,"base"],"HQ_8"] CALL RadioF;};
	if (_RedCamps > 1) then {
		//_text = _text + "another ";[[WEST,"base"],"Radio_1"] CALL RadioF; 
		if ((_RedCamps-1) != 1) then {_text = _text + (format ["%1",(_RedCamps-1)]);};
		_text = _text + " camp";_V = (format ["N%1",(_RedCamps-1)]);if (_V != "N1") then {[[WEST,"base"],_V] CALL RadioF;};};
	if (_RedCamps == 2) then {[[WEST,"base"],"HQ_9"] CALL RadioF;};
	if (_RedCamps > 2) then {_text = _text +"s";[[WEST,"base"],"HQ_10"] CALL RadioF;};
	if (_RedCamps > 1 && {_RedGuardPs > 0}) then {_text = _text + " and ";[[WEST,"base"],"HQ_6"] CALL RadioF;};
	if (_RedGuardPs > 0) then {if (_RedGuardPs != 1) then {_text = _text +(format ["%1",_RedGuardPs]);};
		_text = _text +" guardpost";_V = (format ["N%1",_RedGuardPs]);if (_V != "N1") then {[[WEST,"base"],_V] CALL RadioF;};};
	if (_RedGuardPs == 1) then {[[WEST,"base"],"HQ_11"] CALL RadioF;};
	if (_RedGuardPs > 1) then {_text = _text + "s";  [[WEST,"base"],"HQ_12"] CALL RadioF;};
	if (_RedCamps > 1 || {_RedGuardPs > 0}) then {_text = _text + " with hostile activity nearby that could have unknown role";[[WEST,"base"],"Radio_2"] CALL RadioF; };
	_text = _text + ".";
	BaseR globalchat _text;
	sleep 6;
	_text = "";
	if ("b_air" in (_data select 2) || {"b_armor" in (_data select 2)} || {"b_uav" in (_data select 2)} || {"n_plane" in (_data select 2)} || {"n_air" in (_data select 2)} || {"n_armor" in (_data select 2)} || {"n_uav" in (_data select 2)}) then {
		_text = _text + " We have friendly";[[WEST,"base"],"HQ_14"] CALL RadioF;
		_tA = [];
		if ("b_air" in (_data select 2) || {"n_plane" in (_data select 2)} || {"n_air" in (_data select 2)}) then {_tA = _tA + ["air_support"];};
		if ("b_armor" in (_data select 2) || {"n_armor" in (_data select 2)}) then {_tA = _tA + ["armor"];};
		if ("b_uav" in (_data select 2) || {"n_uav" in (_data select 2)}) then {_tA = _tA + ["UAV"];};
		{[[WEST,"base"], _x] CALL RadioF;_text = _text + " "+_x; _tA = _tA - [_x]; if (count _tA == 1) then {_text = _text + " and";[[WEST,"base"],"HQ_6"] CALL RadioF;}; if (count _tA > 1) then {_text = _text + ",";};} foreach _tA;
		_text = _text + " operating near the camp which should heading to help us. ";[[WEST,"base"],"HQ_15"] CALL RadioF;
	};
	if (_FrCamps > 1 || {_FrGuardPs > 0}) then {_text = _text + "To defend our assets, nearby ";[[WEST,"base"],"HQ_16"] CALL RadioF;} else {_text = _text + " We have no nearby camps or any guardposts supporting us.";[[WEST,"base"],"HQ_17"] CALL RadioF;};
	if (_FrCamps > 1) then {if ((_FrCamps-1) != 1) then {_text = _text + (format ["%1 ",(_FrCamps-1)]);};
		_text = _text + "camp";_V = (format ["N%1",(_FrCamps-1)]);if (_V != "N1") then {[[WEST,"base"],_V] CALL RadioF;};};
	if (_FrCamps == 2) then {[[WEST,"base"],"HQ_9"] CALL RadioF;};
	if (_FrCamps > 2) then {_text = _text +"s";[[WEST,"base"],"HQ_10"] CALL RadioF;};
	if (_FrCamps > 1 && {_FrGuardPs > 0}) then {_text = _text + " and ";[[WEST,"base"],"HQ_6"] CALL RadioF;};
	if (_FrGuardPs > 0) then {if (_FrGuardPs != 1) then {_text = _text +(format ["%1 ",_FrGuardPs]);}; 
		_text = _text + "guardpost";_V = (format ["N%1",_FrGuardPs]);if (_V != "N1") then {[[WEST,"base"],_V] CALL RadioF;};};
	if (_FrGuardPs == 1) then {[[WEST,"base"],"HQ_11"] CALL RadioF;};
	if (_FrGuardPs > 1) then {_text = _text + "s"; [[WEST,"base"],"HQ_12"] CALL RadioF;};
	if (_FrCamps > 1 || {_FrGuardPs > 0}) then {_text = _text + " are called to send men join the battle.";[[WEST,"base"],"HQ_18"] CALL RadioF;};

	_text = _text + " If you are unattached, we could use an extra hand here. Out.";[[WEST,"base"],"HQ_19"] CALL RadioF;
	BaseR globalchat _text;
	////////////////////////////
};

waitUntil {sleep 5; (player distance _locationA < 1400) || {_timer < time}};
if (player distance _locationA < 1400) then {
	//CLOSE
	sleep 15;
	_v = [EAST,_locationA,3000] CALL SAOKZONEVEHICLESNEARBY;
	_size = [0,0,0,0,1,1,1,2] call RETURNRANDOM;
	for "_i" from 0 to _size do {
		if (count _v > 0) then {
			_mecOrNot = [0,1] call RETURNRANDOM;
			_pickV = _v call RETURNRANDOM;
			if (count crew _pickV > 0) then {
				_VEHgroups = _VEHgroups + [group (crew _pickV select 0)];
				(group (crew _pickV select 0)) SPAWN SAOKREMOVEWAYPOINTS; 
			};
			_VEHs = _VEHs + [_pickV];
			_pickV forcespeed 3;
			_unitrate = [4,5];
			_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
			_classes = [];
			for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
			_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
			_INFgroups = _INFgroups + [_group];
			if (_mecOrNot == 1 && {typeof _pickV in ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"]}) then {
				{_x moveincargo _pickV;}foreach units _group;
				_group SPAWN {waitUntil {sleep 3; {alive _x} count units _this == 0|| {behaviour (leader _this) == "COMBAT"}}; if !({alive _x} count units _this == 0) then {{unassignvehicle _x;_x action ["GetOut",vehicle _x];} foreach units _this;(units _this) ordergetin false;};};
			};
		} else {
			_unitrate = [4,5];
			_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
			_classes = [];
			for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
			_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
			_INFgroups = _INFgroups + [_group];
		};
	};
	{_ALLunits = _ALLunits + (units _x);} foreach _VEHgroups + _INFgroups;
	waitUntil {sleep 5; _timer < time || {vehicle player distance _locationA < _dist}};
	//AIR SUPPORT
	if (random 1 < 0.3 && {_size < 1} && {([] CALL FPSGOOD)}) then {
		_class = (AIRFIGTHER select 1)+(AIRARMCHOP select 1); 
		_class = _class call RETURNRANDOM;	
		_tg1 = [[(getposATL vehicle player select 0)+2500,(getposATL vehicle player select 1)+2500,50], 0, _class, EAST] call SPAWNVEHICLE;
		_posPl = [(getposATL (vehicle player) select 0) + 100 -(random 200), (getposATL (vehicle player) select 1)+ 100 -(random 200), 0];
		_tg1wp1= (_tg1 select 2) addWaypoint [_locationA, 0]; 
		[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
		[(_tg1 select 2), 1] setWaypointType "GUARD";
		_nul = [(_tg1 select 2), [1541.39,5059.05,0],200] SPAWN FUNKTIO_MAD;
	};
	//BEGIN ATTACK
	if ({(_x getvariable "Mcolor") == "ColorRed" && {locationposition _x distance _mar5 < 5000}} count AAsM == 0) then {
		_wpPP = _mar5;
		_mid = [((_start2 select 0)+(_wpPP select 0))*0.5,((_start2 select 1)+(_wpPP select 1))*0.5,0];
		[[_mid],"mil_arrow","ColorRed",([_start2, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
	};
	{
		if (!isNil{_x getvariable "GMar"}) then {
			[_x getvariable "GMar", _locationA] SPAWN ZoneMove;
		} else {
			_tg1wp1= _x addWaypoint [_locationA, 0]; 
			[_x, 1] setWaypointBehaviour "COMBAT";
		};
	} foreach _VEHgroups;
	{
		_wp1 = _x addWaypoint [_locationA, 0];
		[_x, 1] setWaypointCombatMode "Red";
		[_x, 1] setWaypointType "GUARD";
	} foreach _INFgroups;


	_time = time + 600;
	_ran = ["STR_Sp8t2r4","STR_Sp8t2r4a","STR_Sp8t2r4b"] call BIS_fnc_selectRandom;
	BaseR globalchat localize _ran;
	_ker = (count _ALLunits)*0.2;
	waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {!(fleeing _x)}} count _ALLunits < _ker || {_time < time}  ||  {getmarkercolor _marrr ==  "ColorRed"}};
	if (getmarkercolor _marrr ==  "ColorRed") then {
		//END2 LOOSING

		[_VEHgroups,_VEHs,_INFgroups] SPAWN _F1;
		[_marrr,_Tid] SPAWN _FTFail;

		PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);
		_ran = ["STR_Sp8t2r3","STR_Sp8t2r3a","STR_Sp8t2r3b"] call BIS_fnc_selectRandom;
		BaseR globalchat localize _ran;

		//deletemarker _mar5;
	} else {
		//END C WINNING
		[_VEHgroups,_VEHs,_INFgroups] SPAWN _F1;


		["ScoreAdded",["Enemy attack didnt succeed",10]] call SAOKNOTIFI;
		_nul = [_Tid,"SUCCEEDED",true] call BIS_fnc_taskSetState;


		_ran = ["STR_Sp8t2r2","STR_Sp8t2r2a","STR_Sp8t2r2b"] call BIS_fnc_selectRandom;
		BaseR globalchat localize _ran;
		//deletemarker _mar5;
	};

} else {
	//FAR W T
	_time = time + 600;
	_ran = ["STR_Sp8t2r4","STR_Sp8t2r4a","STR_Sp8t2r4b"] call BIS_fnc_selectRandom;
	BaseR globalchat localize _ran;
	waitUntil {sleep 5; _time < time ||  {getmarkercolor _marrr ==  "ColorRed"} || {player distance _locationA < 1400}};
	if (player distance _locationA < 1400) then {
		//CLOSE
		sleep 15;
		_v = [EAST,_locationA,3000] CALL SAOKZONEVEHICLESNEARBY;
		_size = [0,0,0,0,1,1,1,2] call RETURNRANDOM;
		for "_i" from 0 to _size do {
			if (count _v > 0) then {
				_mecOrNot = [0,1] call RETURNRANDOM;
				_pickV = _v call RETURNRANDOM;
				if (count crew _pickV > 0) then {
					_VEHgroups = _VEHgroups + [group (crew _pickV select 0)];
					(group (crew _pickV select 0)) SPAWN SAOKREMOVEWAYPOINTS; 
				};
				_VEHs = _VEHs + [_pickV];
				_pickV forcespeed 3;
				_unitrate = [4,5];
				_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
				_classes = [];
				for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
				_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
				_INFgroups = _INFgroups + [_group];
				if (_mecOrNot == 1 && {typeof _pickV in ["O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F"]}) then {
					{_x moveincargo _pickV;}foreach units _group;
					_group SPAWN {waitUntil {sleep 3; {alive _x} count units _this == 0|| {behaviour (leader _this) == "COMBAT"}}; if !({alive _x} count units _this == 0) then {{unassignvehicle _x;_x action ["GetOut",vehicle _x];} foreach units _this;(units _this) ordergetin false;};};
				};
			} else {
				_unitrate = [4,5];
				_random = (_unitrate select 0) + round (random ((_unitrate select 1)-(_unitrate select 0)));
				_classes = [];
				for "_i" from 0 to _random do {_classes pushback (_uCar call RETURNRANDOM);};
				_group = [[(_start2 select 0)+40,(_start2 select 1)+30,0], EAST, _classes,[],[],[0.4,0.7]] call SpawnGroupCustom;
				_INFgroups = _INFgroups + [_group];
			};
		};
		{_ALLunits = _ALLunits + (units _x);} foreach _VEHgroups + _INFgroups;
		waitUntil {sleep 5; _timer < time || {vehicle player distance _locationA < _dist}};
		//RANDOM AIR SUPPORT 
		if (random 1 < 0.3 && {_size < 1} && {([] CALL FPSGOOD)}) then {
			_class = (AIRFIGTHER select 1)+(AIRARMCHOP select 1); 
			_class = _class call RETURNRANDOM;	
			_tg1 = [[(getposATL vehicle player select 0)+2500,(getposATL vehicle player select 1)+2500,50], 0, _class, EAST] call SPAWNVEHICLE;
			_posPl = [(getposATL (vehicle player) select 0) + 100 -(random 200), (getposATL (vehicle player) select 1)+ 100 -(random 200), 0];
			_tg1wp1= (_tg1 select 2) addWaypoint [_locationA, 0]; 
			[(_tg1 select 2), 1] setWaypointBehaviour "AWARE";
			[(_tg1 select 2), 1] setWaypointType "GUARD";
			_nul = [(_tg1 select 2), [1541.39,5059.05,0],200] SPAWN FUNKTIO_MAD;
		};
		//BEGIN ATTACK
		if ({(_x getvariable "Mcolor") == "ColorRed" && {locationposition _x distance _mar5 < 5000}} count AAsM == 0) then {
			_wpPP = _mar5;
			_mid = [((_start2 select 0)+(_wpPP select 0))*0.5,((_start2 select 1)+(_wpPP select 1))*0.5,0];
			[[_mid],"mil_arrow","ColorRed",([_start2, _wpPP] call SAOKDIRT)] SPAWN SAOKCREATEMARKER;
		};
		{
			if (!isNil{_x getvariable "GMar"}) then {
				[_x getvariable "GMar", _locationA] SPAWN ZoneMove;
			} else {
				_tg1wp1= _x addWaypoint [_locationA, 0]; 
				[_x, 1] setWaypointBehaviour "COMBAT";
			};
		} foreach _VEHgroups;
		{
			_wp1 = _x addWaypoint [_locationA, 0];
			[_x, 1] setWaypointCombatMode "Red";
			[_x, 1] setWaypointType "GUARD";
		} foreach _INFgroups;


		_time = time + 600;
		_ran = ["STR_Sp8t2r4","STR_Sp8t2r4a","STR_Sp8t2r4b"] call BIS_fnc_selectRandom;
		BaseR globalchat localize _ran;
		_ker = (count _ALLunits)*0.2;
		waitUntil {sleep 5; {alive _x && {isNil{_x getvariable "SaOkSurrendeRed"}} && {!(fleeing _x)}} count _ALLunits < _ker || {_time < time}  ||  {getmarkercolor _marrr ==  "ColorRed"}};
		if (getmarkercolor _marrr == "ColorRed") then {
			//END2
			PERSIANPRESTIGE = PERSIANPRESTIGE + (500*DIFLEVEL);
			[_VEHgroups,_VEHs,_INFgroups] SPAWN _F1;
			[_marrr,_Tid] SPAWN _FTFail;
			_ran = ["STR_Sp8t2r3","STR_Sp8t2r3a","STR_Sp8t2r3b"] call BIS_fnc_selectRandom;
			BaseR globalchat localize _ran;
			//deletemarker _mar5;
		} else {
			//END C
			[_VEHgroups,_VEHs,_INFgroups] SPAWN _F1;
			["ScoreAdded",["Enemy attack didnt succeed",10]] call SAOKNOTIFI;
			_nul = [_Tid,"SUCCEEDED",true] call BIS_fnc_taskSetState;
			_ran = ["STR_Sp8t2r2","STR_Sp8t2r2a","STR_Sp8t2r2b"] call BIS_fnc_selectRandom;
			BaseR globalchat localize _ran;
			//deletemarker _mar5;
		};

	} else {
		//FAR W T
		_num = 0.5;

		_F = [];
		_E = [];
		_G = [];
		_C = [];
		_C = _C + [["I_static_AT_F","n_unknown"],["I_HMG_01_high_F","n_unknown"]];
		_size = [0,1,2] call RETURNRANDOM;
		for "_i" from 0 to _size do {
			_C = _C + ["INFR"];
			_Zcol = "ColorRed";
			_star = [getmarkerpos _marrr, 400,0,"(1 - trees) * (1 - sea) * (1 - houses)"] CALL SAOKSEEKPOS;
			_classs = if (_Zcol == "ColorRed") then {ARMEDVEHICLES select 1} else {ARMEDVEHICLES select 2};
			_classs = [_classs call RETURNRANDOM,_classs call RETURNRANDOM];
			if (_Zcol == "ColorRed") then {
				_n = [_star, _Zcol,_classs] CALL AddVehicleZone;
			} else {
				_n = [_star, "ColorGreen",_classs,"n_armor"] CALL AddVehicleZone;
			};
		};
		_mP = getmarkerpos _marrr;
		_nearbyLocations = nearestLocations [_mP,["Name"], 1700];
		{
			if (!isNil{_x getvariable "VZ"} && {isNil{_x getvariable "ACTIVE"}} && {(_x getvariable "Mcolor") != "ColorGrey"}) then {
				if ((_x getvariable "Mcolor") != "ColorRed") then {_F pushback _x;} else {_E pushback _x;};
			};
		} foreach _nearbyLocations;
		{
			_p = _x getvariable "Post";
			if (isNil{_p getvariable "ACTIVE"}) then {
				_G pushback _p;
			};
		} foreach (nearestLocations [_mp, ["PostG","PostR"], 1700]);

		{
			_C pushback (_x getvariable "Marker");
		} foreach (nearestLocations [_mP, ["CampR","CampB"], 1700]);
		_ResultColor = [_F,_E,_G,_C,"CAMP BATTLE",_locationA] CALL BattleVirtualCamp;
		_marrr setmarkercolor _ResultColor;

		if (_ResultColor ==  "ColorRed") then {
			PERSIANPRESTIGE = PERSIANPRESTIGE + (1000*DIFLEVEL);
			[_marrr,_Tid] SPAWN _FTFail;
			_ran = ["STR_Sp8t2r3","STR_Sp8t2r3a","STR_Sp8t2r3b"] call BIS_fnc_selectRandom;
			BaseR globalchat localize _ran;
		} else {
			_nul = [_Tid,"SUCCEEDED",true] call BIS_fnc_taskSetState;
			_ran = ["STR_Sp8t2r2","STR_Sp8t2r2a","STR_Sp8t2r2b"] call BIS_fnc_selectRandom;
			BaseR globalchat localize _ran;
		};
		//deletemarker _mar5;
	};
};
{if (_marrr == _x select 0) exitWith {AMBbattles deleteAT _foreachIndex;};} foreach AMBbattles;
UndAttackMs = UndAttackMs - [_marrr];
//[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
sleep 60;
_n = [_Tid] CALL BIS_fnc_deleteTask;
