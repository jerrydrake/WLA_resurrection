
private ["_mP","_nG","_pKer","_factories","_power","_pier","_lisays","_nul","_state","_cond","_nearest","_num","_msg","_disp","_fM","_fP","_Lna","_textL","_mar","_mker","_fromPows","_vP","_gP","_cons","_pRcamp","_nPp","_nPs","_npSS","_n","_dir","_dN","_col","_val","_s","_jaa","_d","_v","_c","_AAdistance"];
switch (_this) do {
case 0 : {
{
if (isNil{(_x getvariable "BirdVeh")}) then {
_nul = _x SPAWN ScaredBirds;
_x setvariable ["BirdVeh",true];
};
sleep 0.2;
} foreach (player nearEntities [["LandVehicle"],1000]);
sleep 1;
{
if (count units _x == 0) then {deleteGroup _x;};
sleep 0.01;
} forEach allGroups - DONTDELGROUPS;
};

case 1 : {

{
_xx = _x;
if ({_xx == _x select 0} count AMBbattles == 0) then {
_mP = getmarkerpos _x;
_nG = [_mP] CALL RETURNGUARDPOST;
_textL = " Power Plant";
_mar = "loc_Power";
if (_x in PierMarkers) then {
_dat = (worldname CALL SAOKMAPDATA); 
_isWater = (_dat select 6);
_textL = " Pier";_mar = "loc_Quay";
if !(_isWater) then {_textL = " Passage";_mar = "loc_BusStop";};
};
if (_x in StoMarkers) then {_textL = " Storage";_mar = "n_service";};
if (getmarkercolor _x !=  "ColorGreen" && {getmarkercolor (_nG getvariable "Gmark") == "ColorGreen"} && {_mP distance _nG < 150} && {(count (_nG getvariable "StaticW") > 0 || {!isNil{_nG getvariable "MG-Guard"}} || {!isNil{_nG getvariable "AA-Guard"}} || {!isNil{_nG getvariable "AT-Guard"}} || {!isNil{_nG getvariable "Sniper-Guard"}} || {!isNil{_nG getvariable "MG-Guard"}} || {!isNil{_nG getvariable "Medic-Guard"}})}) then {_x setmarkercolor "ColorGreen";(format [" <img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> _mar >> "icon"))]+_textL+" enabled") SPAWN HINTSAOK2;};
};
sleep 0.1;
} foreach PierMarkers + StoMarkers + PowMarkers;
{
_xx = _x;
if ({_xx == _x select 0} count AMBbattles == 0) then {
_mP = getmarkerpos _x;
_nG = [_mP] CALL RETURNGUARDPOST;
if (getmarkercolor _x !=  "ColorGreen" && {getmarkercolor (_nG getvariable "Gmark") == "ColorGreen"} && {[_nG] CALL SAOKNEARVILRELA == "Friendly"} && {_mP distance _nG < 150} && {(count (_nG getvariable "StaticW") > 0 || {!isNil{_nG getvariable "MG-Guard"}} || {!isNil{_nG getvariable "AA-Guard"}} || {!isNil{_nG getvariable "AT-Guard"}} || {!isNil{_nG getvariable "Sniper-Guard"}} || {!isNil{_nG getvariable "MG-Guard"}} || {!isNil{_nG getvariable "Medic-Guard"}})}) then {_x setMarkerType "u_installation";_x setmarkercolor "ColorGreen"; (format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Stack" >> "icon"))]+"Factory enabled") SPAWN HINTSAOK2;};
};
sleep 0.1;
} foreach FacMarkers;

};
case 2 : {
if ({getmarkercolor _x == "ColorGreen"} count FacMarkers == 0 && {isNil{missionnamespace getvariable "FacTask"}} && {"ResHelp" in (missionnamespace getvariable "Progress")}) then {[] SPAWN {

private ["_nearest","_Tid","_nul","_n"];
missionnamespace setvariable ["FacTask",1];
_Tid = format ["TaskPres%1",NUMM];
NUMM=NUMM+1;
_nearest = FacMarkers select 0;
{if ((getmarkerpos _nearest distance player) > (getmarkerpos _x distance player)) then {_nearest = _x;};sleep 0.1;} foreach FacMarkers;
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["We need to capture any factory, on the island, in order to create resources to use in this war. To do that we need to build manned guardpost close to the factory and make sure locals are friendly at us, to operate the factory for us.<br/><br/><img image='factory.jpg' width='360' height='202.5'/>", "Take Control of Factory", "Take Control of Factory"], // Task description
(getmarkerpos _nearest), // Task destination
"CREATED"
] call SAOKCRTASK;
waitUntil {sleep 15;{getmarkercolor _x == "ColorGreen"} count FacMarkers > 0};
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
missionnamespace setvariable ["FacTask",nil];
};
};
sleep 0.1;
if ({getmarkercolor _x == "ColorGreen"} count PowMarkers == 0 && {isNil{missionnamespace getvariable "PowTask"}}&& {"ResHelp" in (missionnamespace getvariable "Progress")}) then {[] SPAWN {
private ["_nearest","_Tid","_nul","_n"];
missionnamespace setvariable ["PowTask",1];
_Tid = format ["TaskPres%1",NUMM];
NUMM=NUMM+1;
_nearest = PowMarkers select 0;
{if ((getmarkerpos _nearest distance player) > (getmarkerpos _x distance player)) then {_nearest = _x;};sleep 0.1;} foreach PowMarkers;
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["We need to have control of Power Plant in order to run factories that create resources to use in this war. Manned guardpost need to be built near the plant. (Can be any Power Plant located in the island)<br/><br/><img image='arma3power.jpg' width='360' height='202.5'/>", "Take Control of Power Plant", "Take Control of Power Plant"], // Task description
(getmarkerpos _nearest), // Task destination
"CREATED"  ] call SAOKCRTASK;
waitUntil {sleep 15;{getmarkercolor _x == "ColorGreen"} count PowMarkers > 0};
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
missionnamespace setvariable ["PowTask",nil];
};
};
sleep 0.1;
if ({getmarkercolor _x == "ColorGreen"} count PierMarkers == 0 && {isNil{missionnamespace getvariable "PierTask"}}&& {"ResHelp" in (missionnamespace getvariable "Progress")}) then {[] SPAWN {
private ["_nearest","_Tid","_nul","_n"];
missionnamespace setvariable ["PierTask",1];
_Tid = format ["TaskPres%1",NUMM];
NUMM=NUMM+1;
_nearest = PierMarkers select 0;
{if ((getmarkerpos _nearest distance player) > (getmarkerpos _x distance player)) then {_nearest = _x;};sleep 0.1;} foreach PierMarkers;
_dat = (worldname CALL SAOKMAPDATA); 
_isWater = (_dat select 6);
_taskD = ["Without a pier we cant fight this war with needed assets. Manned guardpost need to be built near the pier.  (Can be any Pier located on the map)<br/><br/><img image='arma3pier.jpg' width='360' height='202.5'/>", "Take Control of Pier", "Take Control of Pier"];
if !(_isWater) then {
_taskD = ["Without a passage we cant fight this war with needed assets. Manned guardpost need to be built near the passage.  (Can be any passage located on the map)<br/><br/><img image='arma3pier.jpg' width='360' height='202.5'/>", "Take Control of Passage", "Take Control of Passage"];
};
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
_taskD, // Task description
(getmarkerpos _nearest), // Task destination
"CREATED"  ] call SAOKCRTASK;
waitUntil {sleep 15;{getmarkercolor _x == "ColorGreen"} count PierMarkers > 0};
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
missionnamespace setvariable ["PierTask",nil];
};
};
sleep 0.1;
if ({getmarkercolor _x == "ColorGreen"} count StoMarkers == 0 && {isNil{missionnamespace getvariable "StorTask"}}&& {"ResHelp" in (missionnamespace getvariable "Progress")}) then {
[] SPAWN {
private ["_nearest","_Tid","_nul","_n"];
missionnamespace setvariable ["StorTask",1];
_Tid = format ["TaskPres%1",NUMM];
NUMM=NUMM+1;
_nearest = StoMarkers select 0;
{if ((getmarkerpos _nearest distance player) > (getmarkerpos _x distance player)) then {_nearest = _x;};sleep 0.1;} foreach StoMarkers;
[
WEST, // Task owner(s)
_Tid, // Task ID (used when setting task state, destination or description later)
["Having storage for our use is not vital but may give us small advantage. Manned guardpost need to be built near the storage area. <br/><br/><img image='arma3storage.jpg' width='360' height='202.5'/>", "Take Control of Storage", "Take Control of Storage"], // Task description
(getmarkerpos _nearest), // Task destination
"CREATED"  ] call SAOKCRTASK;
waitUntil {sleep 15;{getmarkercolor _x == "ColorGreen"} count StoMarkers > 0};
_nul = [_Tid,"SUCCEEDED"] call SAOKCOTASK;
sleep 15;
_n = [_Tid] CALL BIS_fnc_deleteTask;
missionnamespace setvariable ["StorTask",nil];
};
};
sleep 0.1;
// SaOK_factories SaOK_power SaOK_pier SaOK_stor
_pKer = 0.1;
_factories = ({getmarkercolor _x == "ColorGreen"} count FacMarkers)+({getmarkercolor _x == "ColorPink"} count FacMarkers)*0.5;
SaOK_factories = _factories;
_power = ({getmarkercolor _x == "ColorGreen"} count PowMarkers) + ({getmarkercolor _x == "ColorPink"} count PowMarkers)*0.5;
SaOK_power = _power;
_pier = ({getmarkercolor _x == "ColorGreen"} count PierMarkers) + ({getmarkercolor _x == "ColorPink"} count PierMarkers)*0.5;
SaOK_pier = _pier;
SaOK_stor = (({getmarkercolor _x == "ColorGreen"} count StoMarkers) + ({getmarkercolor _x == "ColorPink"} count StoMarkers)*0.5);
_mker = 0;
while {_factories > 0} do {
if (_power >= 0.25 && {_pier >= 0.125}) then {_mker = _mker + 0.5; _power = _power - 0.25;_pier = _pier - 0.125;};
_factories = _factories - 0.5;
FACRES = FACRES + 0.05;
sleep 0.1;
};
_pKer = _pKer + (0.4*_mker*(1 + SaOK_stor*0.1)*SUPF);
//POWS
_fromPows = 0;

_p = SAOKMAPSIZE * 0.5;
{
_pp = _x getvariable "Post";
if (!isNil{(_pp getvariable "PowCells")}) then {
{if ((_x select 1) != "") then {_fromPows = _fromPows + 5;};sleep 0.01;} foreach (_pp getvariable "PowCells");
};
sleep 0.01;
} foreach (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]);
//
_lisays = (35/DIFLEVEL)*_pKer+_fromPows;
pisteet = pisteet + _lisays;
_nul = [_lisays, "Time Bonus"] SPAWN PRESTIGECHANGE;
sleep 1;
([(player CALL SAOKNEARESTVIL),"M"] CALL SAOKVILRET) setMarkerColor ((player CALL SAOKNEARVILRELA) CALL SAOKRELTOCOLOR);
sleep 1;


_c = count AIRFIELDLOCATIONS - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = AIRFIELDLOCATIONS select _i;
_mP = getmarkerpos _xx; 
_nG = ([_mP] CALL RETURNGUARDPOST); 
if (_nG distance _mP < 500) then {
_c = getmarkercolor (_nG getvariable "Gmark");
_xx setmarkercolor _c;
};
};
};

case 3 : {
_cond = false;
_nearest = (player CALL SAOKNEARESTVIL); 
_state = [_nearest, "A"] CALL SAOKVILRET;
if ([_nearest,"A"] CALL SAOKVILCON && {REINF} && {((count (units (group player)))+MINEUNITS) < 5} && {isNil"AutoReplac"} && {vehicle player == player} && {!surfaceIsWater (getposATL player)}) then {
if (_state == "Friendly") then {_cond = true;} else {REINFSTATE="BLOCKED";};
};
if ("USHelp" in (missionnamespace getvariable "Progress")) then {_cond = true;};

if (_cond && {isNil"AutoReplac"} && {REINF} && {((count (units (group player)))+MINEUNITS) < 5} && {vehicle player == player} && {!surfaceIsWater (getposATL player)} ) then {_nul = [] SPAWN FUNKTIO_REINF;};
//random attacks
//_nul = [] SPAWN FUNKTIO_IL3;
if (CBIRDS > 0) then {CBIRDS = CBIRDS - 1;}; 
};

case 4 : {
};

case 5 : {
private ["_lva","_c"];
_vP = vehicle player;
_gP = group player;
_cons = if (typeof _vP in CONSVEHCLAS) then {". Can Construct: "+(format ["%1x prices",([] CALL SAOKCONSRATE)])} else {""};
if (_vP != player && {missionnamespace getvariable "LastVeh" != _vP} && {!(typeof _vP iskindof "Air")}) then {missionnamespace setvariable ["LastVeh", _vP];(((format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> typeof _vP >> "picture"))])+" This vehicle can be used now to gather gear with Y-key")+_cons) SPAWN HINTSAOK2;};
sleep 1;
if (player isFlashlightOn (weapons player select 0)) then {_gP enableGunLights "forceOn";} else {_gP enableGunLights "forceOff";};
};

case 6 : {
private ["_lva","_c","_da"];
_da = ["O_diver_TL_F","O_diver_F","O_diver_exp_F"];
if (vehicle player != player) exitWith {};
{
if (isNil{_x getvariable "DAPPED"} && {alive _x} && {group _x != group player}) then {
_x setvariable ["DAPPED",true];
if (!(typeOf _x in _da)) then {
if (random 1 < 0.2) then {
_num = _x addEventHandler ["FiRed",{(_this select 0) SPAWN ScaredBirdsOnce;}];
_x setvariable ["BirdNum",_num];
};
}; 
};
sleep 0.1;
} foreach (player nearEntities [["Man"],500]);
};
case 7 : {

	while {true} do {
	waitUntil {sleep 0.1;player == player && {alive player}};
	17 cutRsc ["MyRscTitle","PLAIN"];
	disableSerialization;
	_disp = uiNamespace getVariable "d_MyRscTitle";
	while {alive player && {!isNull _disp} && {!isNil"_disp"}} do {
		_msg = "<t color='#FF9900'>" + format ["<img size='1.2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"]+ "HC Groups|"+"</t>";
		_msg = _msg + (if (count (hcAllGroups player) == 0) then {"<t color='#FF0033'>" + format["%1",count (hcAllGroups player)] +"</t>"} else {format["<t color='#FFCC99'>%1</t>",count (hcAllGroups player)]});
		sleep 0.1;
		if (isNil"CIVMODE") then {
		_msg = _msg + "<t color='#FF9900'>" + "  Reinforcements|"+"</t>";	
		if (isNil"AutoReplac") then {
		if (REINFSTATE == "Stand By") then {
		_msg = _msg + "<t color='#003399'>" + REINFSTATE +"</t>";
		};
		if (REINFSTATE == "MIA") then {
		_msg = _msg + "<t color='#990000'>" + REINFSTATE +"</t>";
		};
		if (REINFSTATE == "BLOCKED") then {
		_msg = _msg + "<t color='#FF3366'>" + REINFSTATE +"</t>";
		};
		if (REINFSTATE == "En Route") then {
		_msg = _msg + "<t color='#66CC33'>" + REINFSTATE +"</t>";
		};
		} else {
		_msg = _msg + "<t color='#FF0033'>SET OFF</t>";
		};
		} else {
		_msg = _msg + "<t color='#FF9900'>" + "  Undercover Mode|"+"</t>";	
		if (captive player) then {
		_msg = _msg + "<t color='#339900'>UNDETECTED</t>";
		} else {
		_msg = _msg + "<t color='#FF0033'>IN DANGER</t>";
		};
		};
		_msg = _msg + "<t color='#FF9900'>" + "  TIP|"+"</t>";
		_msg = _msg + "<t color='#FFCC99'>" + RANDOMTIP +"</t>";
		(_disp displayCtrl 301) ctrlSetStructuredText parseText _msg;
		sleep 1;
	};
	};
};
case 8 : {
	//SaOK_factories SaOK_power SaOK_pier SaOK_stor
	disableSerialization;
	_dat = (worldname CALL SAOKMAPDATA); 
	_isWater = (_dat select 6);
	_but = "Pier|</t>";
	if !(_isWater) then {_but = "Passage|</t>";};
	_f = "<br/>"+ (format ["<t color='#FFCC99'><img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Stack" >> "icon"))])+"Factory|</t>"+("FAC" CALL SAOKRCOL);
	_f2 ="<br/>"+ (format ["<t color='#FFCC99'><img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Power" >> "icon"))])+"Power|</t>"+("POW" CALL SAOKRCOL);
	_f3 = "<br/>"+ (format ["<t color='#FFCC99'><img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Quay" >> "icon"))])+_but+("PIE" CALL SAOKRCOL);
	_f4 = "<br/>"+ (format ["<t color='#FFCC99'><img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "n_service" >> "icon"))])+"Storage|</t>"+("STO" CALL SAOKRCOL);
	_f5 = "<t color='#FF9900'>" + format ["<img size='1.2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"]+"Prestige|"+"</t>";
	_f6 = "<t color='#FFCC99'>%1</t>";
	while {true} do {
	waitUntil {sleep 0.1;alive player};
	19 cutRsc ["MyRscTitle4","PLAIN"];
	_disp = uiNamespace getVariable "d4_MyRscTitle";
	while {alive player && {!isNull _disp} && {!isNil"_disp"}} do {
		_msg = _f5;
		_msg = _msg + (format [_f6,floor pisteet]);
		if (vehicle player == player) then {
		sleep 0.1;
		_msg = _msg + _f + str SaOK_factories + "</t>";
		sleep 0.1;
		_msg = _msg + _f2 + str SaOK_power + "</t>";
		sleep 0.1;
		_msg = _msg + _f3 + str SaOK_pier + "</t>";
		sleep 0.1;
		_msg = _msg + _f4 + str SaOK_stor + "</t>";
		};
		(_disp displayCtrl 304) ctrlSetStructuredText parseText _msg;
		sleep 1;
	};
	};
};
case 9 : {
//icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa";
	private ["_nearest","_disp","_f","_nameA","_msg"];
	disableSerialization;
	_msg = format ["<img size='1.2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa"]+ " Talk (SHIFT+Y/Z)";
	while {{leader _x != player && {side _x != EAST} && {behaviour _x != "COMBAT"} && {[_x,player] CALL FUNKTIO_LOS}} count ((getposATL player) nearEntities [["Man"],7]) > 0 || {{leader _x != player && {!isNil{(_x getvariable "SaOkSurrendeRed")}} && {[_x,player] CALL FUNKTIO_LOS}} count ((getposATL player) nearEntities [["Man"],7]) > 0}} do {
	sleep 1;
	_disp = uiNamespace getVariable "d6_MyRscTitle";
	29 cutRsc ["MyRscTitle6","PLAIN"];
	while {alive player && {!isNil"_disp"} && {!isNull _disp} && {({leader _x != player && {behaviour _x != "COMBAT"} && {isNil{_x getvariable "NoTalkative"}} && {[_x,player] CALL FUNKTIO_LOS}} count ((getposATL player) nearEntities [["Civilian","SoldierWB","SoldierGB"],7]) > 0  || {{leader _x != player && {!isNil{(_x getvariable "SaOkSurrendeRed")}} && {isNil{_x getvariable "NoTalkative"}} && {[_x,player] CALL FUNKTIO_LOS}} count ((getposATL player) nearEntities [["SoldierEB"],7]) > 0})}} do {		
		(_disp displayCtrl 306) ctrlSetStructuredText parseText _msg;
		sleep 1;
	};
	};
	29 cutText ["","PLAIN"];
};
case 10 : {
	private ["_f12","_f11","_f10","_f9","_f8","_f7","_f6","_f5","_f4","_f3","_f2","_f","_dF","_s","_nAir","_nearest","_disp","_f","_nameA","_msg","_nCamp","_pnCamp","_snCamp","_nVilla"];
	_nearest = [] CALL NEARESTPLACE;
	_nPp = if (typename _nearest == "STRING") then {getmarkerpos _nearest} else {locationposition _nearest};
	_nPs = if (typename _nearest == "STRING") then {getmarkersize _nearest} else {size _nearest};
	_npSS = (_nPs select 0)+100;
	_f = "<t color='#FF9900'>" +format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Bunker" >> "icon"))]+ " Camp Status"+"</t>" + "<br/>";
	_f2 = "<t color='#FF9900'>" +"Defenses|"+"</t>"+"<t color='#FFCC99'>";
	_f3 = "<t color='#FF9900'>" +"Status|"+"</t>"+"<t color='#FFCC99'>";
	_f4 = "<br/>"+ "<t color='#FF9900'>" + format ["<img size='1.2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> "loc_Tourism" >> "icon"))];
	_f5 = "<t color='#FF9900'>" + "Relationship|" +"</t>" + "<t color='#FFCC99'>";
	_f6 = "<t color='#FF9900'>" + "Specialty|" +"</t>" + "<t color='#FFCC99'>";
	_f7 = "<br/>"+ "<t color='#FF9900'>"+format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Stack" >> "icon"))]+" Factory Status" +"</t>" + "<br/>";
	_f8 = "<t color='#FF9900'>" + "Condition|" +"</t>" + "<t color='#FFCC99'>";
	_f9 = "<t color='#FF9900'>" +"Defenses|"+"</t>"+"<t color='#FFCC99'>";
	_f10 = "<br/>"+ "<t color='#FF9900'>" +format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "respawn_air" >> "icon"))]+" Airfield Status" +"</t>" + "<br/>";
	_f11 = "<t color='#FF9900'>" + "Condition|" +"</t>" + "<t color='#FFCC99'>";
	_f12 = "<t color='#FF9900'>" +"Defenses|"+"</t>"+"<t color='#FFCC99'>";
	if (vehicle player distance _nPp < _npSS) then {
	while {(_nPp distance ("" CALL NEARESTPLACE) < 10) && {vehicle player distance _nPp < _npSS}} do {
	waitUntil {sleep 0.1; player == player && {alive player}};
	18 cutRsc ["MyRscTitle3","PLAIN"];
	disableSerialization;
	_disp = uiNamespace getVariable "d3_MyRscTitle";
	_Lna = player CALL NEARESTLOCATIONNAME;
	_dF = "Low";
	_s = 21;
	while {alive player && {!isNull _disp} && {!isNil"_disp"} && {(_nPp distance ("" CALL NEARESTPLACE) < 10)} && {vehicle player distance _nPp < _npSS}} do {
		_msg = "";
		_nCamp = ([] CALL NEARESTCAMP) getvariable "Marker";
		_pnCamp = getmarkerpos _nCamp;
		_snCamp = (getmarkersize _nCamp select 0)+100;
		if (vehicle player distance _pnCamp < _snCamp) then {
		if (_s > 20) then {_dF = (_pnCamp CALL SAOKRETURNDEFENSES);_s = 0;};
		_s = _s + 1;
		if !(_nCamp in VisitedCamps) then {VisitedCamps pushBack _nCamp;};
		sleep 0.1;
		_msg = _f;
		_msg = _msg + _f2 +(if (getmarkercolor _nCamp == "ColorRed") then {"Unknown"} else {
		if ((getposATL ([_pnCamp] CALL RETURNGUARDPOST)) distance _pnCamp > _snCamp) then {"Low"} else {_dF};
		})+"</t>" + "<br/>";
		if (getmarkercolor _nCamp != "ColorRed") then {_msg = _msg +_f3 +(if (_nCamp CALL SAOKISCAMPDANGER) then {"In Danger"} else {"Aware"})+"</t>"+ "<br/>"};
		_msg = _msg + (if (getmarkercolor _nCamp != "ColorRed") then {"SHIFT+1"+ "<br/>"} else {""})+ "<br/>";
		}; 
		_nVilla = (player CALL SAOKNEARESTVIL);
		if (vehicle player distance (locationposition _nVilla) < (size _nVilla select 0)) then {
		_msg = _msg + _f4 + _Lna +"</t>" + "<br/>";
		_msg = _msg + _f5 +(player CALL SAOKNEARVILRELA)+"</t>" + "<br/>";
		_msg = _msg + _f6 +(if !([_nearest,"B"] CALL SAOKVILCON) then {"None"} else {[_nearest, "B"] CALL SAOKVILRET})+"</t>"+ "<br/>";
		_msg = _msg + "SHIFT+1"+ "<br/>";
		}; 
		sleep 0.1;
		//FacMarkers  loc_Stack loc_Tourism
		_fP = getmarkerpos ([] CALL NEARESTFACTORY);
		if (vehicle player distance _fP < 100) then {
		_fM = FacMarkers select 0;
		{if (_fP distance getmarkerpos _fM > _fP distance getmarkerpos _x) then {_fM = _x;};sleep 0.01;} foreach FacMarkers;
		if (getmarkercolor _fM != "ColorRed") then {
		_msg = _msg + _f7;
		_msg = _msg + _f8 +(if (player CALL SAOKNEARVILRELA != "Friendly") then {"Not operative - relationship too poor"} else {"Operative"})+"</t>" + "<br/>";
		_msg = _msg + _f9 +(if ((getposATL ([_fP] CALL RETURNGUARDPOST)) distance _fP > 250) then {"None"} else {"Guarded"})+"</t>" + "<br/>";
		};
		}; 
		sleep 0.1;
		_nAir = getmarkerpos ([] CALL NEARESTAIRFIELD);
		_pRcamp = locationposition (["ColorRed"] CALL NEARESTCAMP);
		if (vehicle player distance _nAir < 200) then {
		_msg = _msg + _f10;
		_msg = _msg + _f11 +(if (getmarkercolor ([] CALL NEARESTAIRFIELD) != "ColorGreen") then {"Not operative (Secure with guardpost)"} else {"Operative"})+"</t>" + "<br/>";
		_msg = _msg + _f12 +(if ((getposATL ([_nAir] CALL RETURNGUARDPOST)) distance _nAir > 450) then {"None"} else {"Guarded"})+"</t>" + "<br/>";
		_msg = _msg + "<t color='#FFCC99'>"+(if (_nAir distance _pRcamp < 800) then {""} else {"SHIFT+1"})+"</t>" + "<br/>";
		};
		(_disp displayCtrl 303) ctrlSetStructuredText parseText _msg;
		sleep 1;
	};
	};
	};
	18 cutText ["","PLAIN"];
};
case 11 : {
	_AAdistance = DIFLEVEL * 4;
	_dd = {
	private ["_dN","_dir"];
	_dN = "NW";
	_dir = _this;
	if (_dir < 0) then {_dir = _dir + 360;};
	if (_dir > 360) then {_dir = _dir - 360;};
	if (_dir < 22.5 || {_dir > 337.5}) then {_dN = "N";};
	if (_dir >= 22.5 && {_dir < 67.5}) then {_dN = "NE";};
	if (_dir >= 67.5 && {_dir < 112.5}) then {_dN = "E";};
	if (_dir >= 112.5 && {_dir < 157.5}) then {_dN = "SE";};
	if (_dir >= 157.5 && {_dir < 202.5}) then {_dN = "S";};
	if (_dir >= 202.5 && {_dir < 247.5}) then {_dN = "SW";};
	if (_dir >= 247.5 && {_dir < 292.5}) then {_dN = "W";};
	_dN
	};
	while {true} do {
	waitUntil {sleep 0.5; alive player};
	39 cutRsc ["MyRscTitle7","PLAIN"];
	disableSerialization;
	_disp = uiNamespace getVariable "d7_MyRscTitle";
	while {alive player && {!isNull _disp} && {!isNil"_disp"}} do {
	_msg = "";
	if (isNil"AAclose" || {!isNil"IFENABLED"} || {{_x in ([] CALL SAOKRETURNPROG)} count ["RadarS","Radar"] > 0}) then {
	_v = (player nearEntities [["LandVehicle","Air"],1200]);
	_c = count _v - 1;
	_vP = vehicle player;
	for "_i" from 0 to _c do {
	private ["_xx"];
	_xx = _v select _i;
	_n = 1;
	if !(typeof _xx iskindof "ParachuteBase") then {_n = 0;};
	if (alive _xx && {count crew _xx > _n} && {side ((crew _xx) call RETURNRANDOM) == EAST} && {!(typeof _xx iskindof "StaticWeapon")} && {round (speed _xx) > 0}) then {
	_d = _vP distance _xx;
	_jaa = 0.01;
	_dir = round ([player, _xx] call SAOKDIRT);
	_dN =  _dir call _dd;
	_col = "<t color='#A0A0A0'>";
	_val = 2;
	_s = "km";
	if (_d >= 1000) then {_col = "<t color='#F8F8F8'>"; _val = (round ((_vP distance _xx) * _jaa)) * 0.1;};
	if (_d < 1000) then {_s = "m";_jaa = 1;_col = "<t color='#FFFF33'>";_val = round ((_vP distance _xx) * _jaa);};
	if (_d < 750) then {_s = "m";_jaa = 1;_col = "<t color='#FFCC00'>";_val = round ((_vP distance _xx) * _jaa);_xx forcespeed -1;};
	if (_d < 250) then {_s = "m";_jaa = 1;_col = "<t color='#FF3300'>";_val = round ((_vP distance _xx) * _jaa);if (DIFLEVEL < 1 && {typeof _xx isKindOf "LandVehicle"}) then {_xx forcespeed 3;};};
	_msg = _msg + _col + _dN + " "+ format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> typeof _xx >> "picture"))] + (format [" %1%3, %2km/h",_val, round (speed _xx),_s])+"</t>"+" "; 
	};
	sleep 0.1;
	};
	} else {_msg = "               <t color='#FF3300'>" + format [" <img size='1.2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> "B_UAV_02_CAS_F" >> "picture"))]+"UAV intel unavailable, CSAT AA"+format [" <img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "o_art" >> "icon"))]+" within "+(format ["%1",_AAdistance])+"km radius</t>"};
	(_disp displayCtrl 307) ctrlSetStructuredText parseText _msg;
	sleep 1;
	};
	};
};
};