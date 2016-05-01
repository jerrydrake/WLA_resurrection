private ["_cost","_text","_current","_myDisplay","_ok","_nul","_occ","_f"];
sleep (random 0.05);
if (!dialog) then {
[["WLA","CallSupport"]] call BIS_fnc_advHint;
_f = {
_class = "";
switch (_this) do {
case "Greyhawk UAV": {_class = "B_UAV_02_CAS_F";};
case "Blackfoot": {_class = "B_Heli_Attack_01_F";};
case "Littlebird": {_class = "B_Heli_Light_01_armed_F";};
case "Buzzard AA": {_class = "I_Plane_Fighter_03_AA_F";};
case "Buzzard CAS": {_class = "I_Plane_Fighter_03_CAS_F";};
case "F/A-18 E": {_class = "JS_JC_FA18E";};
case "F/A-18 F": {_class = "JS_JC_FA18F";};
case "WY-55 Hellcat MG": {_class = "I_Heli_light_03_F";};
case "Offroad MG": {_class = "I_G_Offroad_01_armed_F";};
case "Hunter HMG": {_class = "B_MRAP_01_hmg_F";};
case "Hunter GMG": {_class = "B_MRAP_01_gmg_F";};
case "Strider HMG": {_class = "I_MRAP_03_hmg_F";};
case "Strider GMG": {_class = "I_MRAP_03_gmg_F";};
case "Marshall": {_class = "B_APC_Wheeled_01_cannon_F";};
case "Panther": {_class = "B_APC_Tracked_01_rcws_F";};
case "Gorgon": {_class = "I_APC_Wheeled_03_cannon_F";};
case "Bobcat": {_class = "B_APC_Tracked_01_CRV_F";};
case "Cheetah": {_class = "B_APC_Tracked_01_AA_F";};
case "Slammer": {_class = "B_MBT_01_cannon_F";};
case "Slammer UP": {_class = "B_MBT_01_TUSK_F";};
case "Scorcher": {_class = "B_MBT_01_arty_F";};
case "Sandstorm": {_class = "B_MBT_01_mlrs_F";};
case "FV-720 Mora": {_class = "I_APC_tracked_03_cannon_F";};
case "MBT-52 Kuma": {_class = "I_MBT_03_cannon_F";};
case "Construction Truck": {_class = "I_G_Van_01_transport_F";};
case "A-164 Wipeout": {_class = "B_Plane_CAS_01_F";};
case "Rearm Truck": {
_class = "B_Truck_01_ammo_F";
if (!isNil"IFENABLED") then {
_class = "lib_opelblitz_ammo";
};
};
case "Fuel Truck": {
_class = "B_Truck_01_fuel_F";
if (!isNil"IFENABLED") then {
_class = "LIB_opelblitz_fuel";
};
};
case "Medical Truck": {
_class = "B_Truck_01_medical_F";
if (!isNil"IFENABLED") then {
_class = "LIB_opelblitz_ambulance";
};
};
case "Repair Truck": {
_class = "B_Truck_01_Repair_F";
if (!isNil"IFENABLED") then {
_class = "LIB_opelblitz_parm";
};
};
};
if (_class == "") then {
{if (getText (configfile >> "CfgVehicles" >> _x >> "displayName") == _this) exitWith {_class = _x;};} foreach ["I_G_Van_01_transport_F"] + +(ARMEDAA select 2)+ +(ARMEDAA select 0)+ (ARMEDAA select 3)+(ARMEDCARRIER select 0)+(AIRARMCHOP select 0) + (AIRFIGTHER select 0) + (AIRARMCHOP select 2) + (AIRFIGTHER select 2) + (ARMEDTANKS select 0) + (ARMEDVEHICLES select 0) + (ARMEDTANKS select 2) + (ARMEDVEHICLES select 2) + (ARMEDTANKS select 3) + (ARMEDVEHICLES select 3);
};
_class
};


disableserialization;
_ok = createDialog "SupportDialog"; 
_myDisplay = findDisplay 1235;
if ("MilOff" in ([] CALL SAOKRETURNPROG) || {{getmarkercolor _x == "ColorGreen"} count AIRFIELDLOCATIONS > 0}) then {lbAdd [1500, "Air Support"];};
if ("ResHelp" in (missionnamespace getvariable "Progress")) then {
lbAdd [1500, "Land Support"]; 
lbAdd [1500, "Infantry Support"]; 
};
//if ("USHelp" in (missionnamespace getvariable "Progress")) then {lbAdd [1500, "Artillery"];};
lbAdd [1500, "Gear Drop"]; 
if ("USHelp" in (missionnamespace getvariable "Progress")) then {lbAdd [1500, "Support"];};
lbAdd [1500, "Diversions"]; 
lbAdd [1500, "Vehicles [Para]"]; 
lbAdd [1500, "Teammates [Para]"]; 
if (!isNil"CIVMODE") then {lbAdd [1500, "Undercover"];};
if (isNil"IFENABLED" && {("GreenHelp" in (missionnamespace getvariable "Progress") || {"USHelp" in (missionnamespace getvariable "Progress")} || {"MilOff" in (missionnamespace getvariable "Progress")})}) then {
lbAdd [1500, "Transport"];
};
lbSetCurSel [1500, 0];
sleep 0.1;
_current = "";
_added = [];
while {dialog} do {
	if (_current != (lbText [1500, (lbCurSel 1500)])) then {
	_added = [];
	_current = (lbText [1500, (lbCurSel 1500)]);
	lbClear 1501;
	if ((lbText [1500, (lbCurSel 1500)]) == "Undercover") then {
	lbAdd [1501, "Relocate Exit"];
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Diversions") then {
	lbAdd [1501, "Massive"];
	lbAdd [1501, "Medium"];
	lbAdd [1501, "Light"];
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Air Support") then {
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRARMCHOP select 0);
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRFIGTHER select 0);
	if (isClass(configFile >> "cfgVehicles" >> "JS_JC_FA18E")) then {
	lbAdd [1501, "F/A-18 E"];
	lbAdd [1501, "F/A-18 F"];
	};
	
	if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRARMCHOP select 2);
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (AIRFIGTHER select 2);
	};
	lbSetCurSel [1501, 0];
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Infantry Support") then {
	lbAdd [1501, "AT-Team"];
	lbAdd [1501, "AA-Team"];
	lbAdd [1501, "INF-Team"];
	if (isClass(configFile >> "cfgWeapons" >> "U_PMC_GTShirt_DJeans")) then {
	lbAdd [1501, "PMC-Team"];
	};
	lbAdd [1501, "Motorized-Squad"];
	lbAdd [1501, "Paradrop-Squad"];
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Land Support") then {
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 3)+(ARMEDAA select 3);
	if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 2)+(ARMEDAA select 2);
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDTANKS select 2)+(ARMEDAA select 2);
	};
	if ("USHelp" in (missionnamespace getvariable "Progress")) then {
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 0)+(ARMEDAA select 0);
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDTANKS select 0)+(ARMEDAA select 0);
	};
	lbSetCurSel [1501, 0];
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Artillery") then {
	lbAdd [1501, "Scorcher"];
	lbAdd [1501, "Sandstorm"];
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Gear Drop") then {
	
	lbAdd [1501, "Basic Ammo"];
	lbAdd [1501, "Basic Weapons"];
	lbAdd [1501, "Grenades"];
	lbAdd [1501, "Launchers"];
	lbAdd [1501, "Explosives"];
	lbAdd [1501, "Special"];
	lbAdd [1501, "Cargo Net"];
	lbAdd [1501, "Supply[NATO]"]; 
	lbAdd [1501, "Supply[AAF]"]; 
	lbAdd [1501, "Support[NATO]"]; 
	lbAdd [1501, "Support[AAF]"];
	lbAdd [1501, "VehAmmo[NATO]"]; 
	lbAdd [1501, "VehAmmo[AAF]"]; 
	
	//"Box_FIA_Ammo_F","Box_FIA_Wps_F","Box_FIA_Support_F",
	
	if (isClass(configFile >> "cfgVehicles" >> "Box_mas_us_rifle_Wps_F")) then {
	lbAdd [1501, "NATO SF weapons"];
	lbAdd [1501, "Russian weapons"];
	};
	lbSetCurSel [1501, 0];
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Support") then {
	lbAdd [1501, "Medical Truck"];
	lbAdd [1501, "Fuel Truck"];
	lbAdd [1501, "Repair Truck"];
	lbAdd [1501, "Rearm Truck"];
	lbSetCurSel [1501, 0];
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Transport") then {
	if ("GreenHelp" in (missionnamespace getvariable "Progress") || {"USHelp" in (missionnamespace getvariable "Progress")} || {"MilOff" in (missionnamespace getvariable "Progress")}) then {lbAdd [1501, "Chopper Transport"];};
	lbSetCurSel [1501, 0];
	};
	
	if ((lbText [1500, (lbCurSel 1500)]) == "Vehicles [Para]") then {
	if (!isNil"IFENABLED") then {
	lbAdd [1501, getText (configfile >> "CfgVehicles" >> "Lib_sdkfz251" >> "displayName")];
	_added set [count _added, "Lib_sdkfz251"];
	} else {
	lbAdd [1501, getText (configfile >> "CfgVehicles" >> "I_G_Van_01_transport_F" >> "displayName")];
	};
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach (ARMEDVEHICLES select 0)+(ARMEDCARRIER select 0);
	};
	
	if ((lbText [1500, (lbCurSel 1500)]) == "Teammates [Para]") then {
	{if !(_x in _added) then {lbAdd [1501, getText (configfile >> "CfgVehicles" >> _x >> "displayName")];_added set [count _added, _x];};} foreach FRIENDC1 + FRIENDC3;
	};
	
	};
	_text = "Price: ";
	_cost = if ((lbText [1500, (lbCurSel 1500)]) == "Teammates [Para]") then {200} else {((lbText [1501, (lbCurSel 1501)]) CALL SUPPORTCOST)};
	if ((lbText [1500, (lbCurSel 1500)]) == "Vehicles [Para]") then {_cost = _cost*1.3;};
	_text = _text + (format ["%1",_cost]) +"<br/>";
	_occ = (lbText [1501, (lbCurSel 1501)]) call _f;
	//hint format ["%1",_picR];
	_picR = "";
	if (_occ != "") then {_picR = (getText (configfile >> "CfgVehicles" >> _occ >> "picture"));_text = _text + (format ["<img size='3.0' color='#33CCFF' image='%1'/>",_picR]) +"<br/>";} else {
	if ((lbText [1500, (lbCurSel 1500)]) == "Gear Drop") then {_picR = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa";_text = _text + (format ["<img size='3.0' color='#33CCFF' image='%1'/>",_picR]) +"<br/>";};
	if ((lbText [1500, (lbCurSel 1500)]) in ["Land Support","Transport","Undercover","Diversions","Support"]) then {_picR = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa";_text = _text + (format ["<img size='3.0' color='#33CCFF' image='%1'/>",_picR]) +"<br/>";};
	};
	if (_picR == "") then {_text = _text + (format ["<img size='3.0' color='#33CCFF' image='%1'/>","\A3\ui_f\data\map\markers\nato\b_inf.paa"]) +"<br/>";};
	(_myDisplay displayCtrl 1100) ctrlSetStructuredText parseText _text;
	if (!isNil"OSTAOBJEKTI") exitWith {
	if ((lbText [1500, (lbCurSel 1500)]) == "Diversions") then {[_cost,(lbText [1501, (lbCurSel 1501)])] SPAWN FDiversions;};
	if ((lbText [1500, (lbCurSel 1500)]) == "Air Support") then {[_cost,(lbText [1501, (lbCurSel 1501)])] SPAWN FAirSupport;};
	if ((lbText [1500, (lbCurSel 1500)]) in ["Land Support","Infantry Support"]) then {[_cost,(lbText [1501, (lbCurSel 1501)])] SPAWN FLandSupport;};
	if ((lbText [1500, (lbCurSel 1500)]) in ["Artillery"]) then {[_cost,(lbText [1501, (lbCurSel 1501)])] SPAWN FLandSupport;};
	if ((lbText [1500, (lbCurSel 1500)]) == "Gear Drop") then {[_cost,(lbText [1501, (lbCurSel 1501)])] SPAWN FGearSupport;};
	if ((lbText [1500, (lbCurSel 1500)]) == "Support") then {[_cost,(lbText [1501, (lbCurSel 1501)])] SPAWN FSupport;};
	if ((lbText [1500, (lbCurSel 1500)]) in ["Vehicles [Para]"]) then {[_cost,(lbText [1501, (lbCurSel 1501)])] SPAWN FGearSupport;};
	if ((lbText [1500, (lbCurSel 1500)]) == "Teammates [Para]") then {
	_unitC = "";
	{if (getText (configfile >> "CfgVehicles" >> _x >> "displayName") == (lbText [1501, (lbCurSel 1501)])) then {_unitC = _x;};} foreach FRIENDC1 + FRIENDC3;
	if (_unitC != "") then {
	if (pisteet >= _cost) then {
	pisteet = pisteet - _cost;
	"Cash" SPAWN SAOKPLAYSOUND;
	_nul = [-_cost, "Received Team-mate"] SPAWN PRESTIGECHANGE;
	_bs = 0.47;
	[_unitC,_bs,"PARA"] SPAWN SAOKUADD;
	} else {(format ["%1 more prestige value needed to receive new team-mate", _cost - pisteet]) SPAWN HINTSAOK;};
	};
	};
	if ((lbText [1500, (lbCurSel 1500)]) == "Undercover") then {
	leader player sidechat ("Wolf to Base, I would need my soldier gear back. Can you bring those closer? Over");
	_v = ["JinN46","JinN47"]call RETURNRANDOM;
	[player,player, "PlaV", _v]SPAWN SAOKKBTELL;
	sleep 6;
	[WEST,"HQ"] sidechat ("Roger that, Wolf. You will find those from house not very far. Check your map. Out");
	pisteet = pisteet - 100;
	_nul = [-100, "New Exit Zone"] SPAWN PRESTIGECHANGE;
	_waypoints = [];
	_range = 500;
	while {count _waypoints == 0} do {
	_pos = getposATL player;
	_sHou = [(_pos select 0)+ _range - (random _range)*2, (_pos select 1)+ _range - (random _range)*2, 0];
	_building = nearestBuilding _sHou;
	_waypoints = [];
	_c = 0;
	_array = _building buildingPos _c;
	while {!(_array isEqualTo [0,0,0]) && {_c < 20}} do {	
	_waypoints pushBack _c;
	_c = _c + 1;
	_array = _building buildingPos _c;
	};
	if (count _waypoints > 0) then {missionnamespace setvariable ["NewExitZ",(_building buildingPos (_waypoints select 0))];};
	_range = _range + 100;
	sleep 0.1;
	};
	
	};
	if ((lbText [1501, (lbCurSel 1501)]) == "Chopper Transport") then {
	if (isNil{missionnamespace getvariable "Chopped"}) then {
	pisteet = pisteet - _cost;
	"Cash" SPAWN SAOKPLAYSOUND;
	_nul = [-_cost, "Support Call"] SPAWN PRESTIGECHANGE;
	_nul = [player] SPAWN FChopperTransportP;
	_v = ["JinN1","JinN2"]call RETURNRANDOM;
	[player,player, "PlaV", _v]SPAWN SAOKKBTELL;
	} else {"You cant call new chopper transport before receiving the earlier called chopper" SPAWN HINTSAOK;};
	};
	};
	sleep 0.1;
};
if (dialog) then {closeDialog 0;};
OSTAOBJEKTI=nil;
};







