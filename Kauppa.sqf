private ["_ok","_myDisplay","_text","_cost","_occ","_f"];
sleep (random 0.05);
if (!dialog) then {
_f = {
_class = "";
if (_class == "") then {
{if (_this == getText (configfile >> "CfgVehicles" >> _x >> "displayName")) exitWith {_class = _x;};} foreach ((AIRARMCHOP select 0)+(AIRFIGTHER select 0)+(AIRARMCHOP select 2)+(AIRFIGTHER select 2)+(AIRCARRIERCHOP select 0)+(AIRCARRIERCHOP select 2));
};
if (_class == "") then {
{if (_this == getText (configfile >> "CfgVehicles" >> _x >> "displayName")) exitWith {_class = _x;};} foreach ((ARMEDVEHICLES select 3)+(ARMEDTANKS select 3)+(ARMEDVEHICLES select 2)+(ARMEDTANKS select 2)+(ARMEDVEHICLES select 0)+(ARMEDTANKS select 0));
};
if (_class == "") then {
switch (_this) do {
case "Empty A-164 Wipeout": {_class = "B_Plane_CAS_01_F";};
case "Empty MH-9": {_class = "B_Heli_Light_01_F";};
case "Empty MH-9 PMC": {_class = "PMC_MH9";};
case "Empty WY-55 Hellcat": {_class = "I_Heli_light_03_unarmed_F";};
case "Empty UH-80": {_class = "B_Heli_Transport_01_F";};
case "Empty UH-80 Camo": {_class = "B_Heli_Transport_01_camo_F";};
case "Strider": {_class = "I_MRAP_03_F";};
case "Hunter": {_class = "B_MRAP_01_F";};
case "Offroad FIA": {_class = "B_G_Offroad_01_F";};

case "Scout M3": {_class = "LIB_US_Scout_m3";};
case "GMC Tent": {_class = "LIB_US_GMC_Tent";};


case "AR-2 Darter (AI)": {_class = "B_UAV_01_F";};
case "MQ4A Greyhawk (AI)": {_class = "B_UAV_02_CAS_F";};
case "Empty Blackfoot": {_class = "B_Heli_Attack_01_F";};
case "Empty AH-9": {_class = "B_Heli_Light_01_armed_F";};
case "Empty Buzzard AA": {_class = "I_Plane_Fighter_03_AA_F";};
case "Empty Buzzard CAS": {_class = "I_Plane_Fighter_03_CAS_F";};
case "Empty F/A-18 E": {_class = "JS_JC_FA18E";};
case "Empty F/A-18 F": {_class = "JS_JC_FA18F";};
case "Empty WY-55 Hellcat MG": {_class = "I_Heli_light_03_F";};
case "Empty Hunter HMG": {_class = "B_MRAP_01_hmg_F";};
case "Empty Hunter GMG": {_class = "B_MRAP_01_gmg_F";};
case "Empty Strider HMG": {_class = "I_MRAP_03_hmg_F";};
case "Empty Strider GMG": {_class = "I_MRAP_03_gmg_F";};
case "Empty Marshall": {_class = "B_APC_Wheeled_01_cannon_F";};
case "Empty Panther": {_class = "B_APC_Tracked_01_rcws_F";};
case "Empty Gorgon": {_class = "I_APC_Wheeled_03_cannon_F";};
case "Empty Bobcat": {_class = "B_APC_Tracked_01_CRV_F";};
case "Empty Cheetah": {_class = "B_APC_Tracked_01_AA_F";};
case "Empty Slammer": {_class = "B_MBT_01_cannon_F";};
case "Empty Slammer UP": {_class = "B_MBT_01_cannon_F";};
case "Empty Scorcher": {_class = "B_MBT_01_arty_F";};
case "Empty Sandstorm": {_class = "B_MBT_01_mlrs_F";};
case "Empty FV-720 Mora": {_class = "I_APC_tracked_03_cannon_F";};
case "Empty MBT-52 Kuma": {_class = "I_MBT_03_cannon_F";};
case "Empty Rearm Truck": {_class = "B_Truck_01_ammo_F";};
case "Empty Fuel Truck": {_class = "B_Truck_01_fuel_F";};
case "Empty Medical Truck": {_class = "B_Truck_01_medical_F";};
case "Empty Repair Truck": {_class = "B_Truck_01_Repair_F";};
case "Mine/Construction-Truck": {_class = "B_Truck_01_covered_F";};
case "UGV Stomper (AI)": {_class = "B_UGV_01_F";};
case "UGV Stomper RCWS (AI)": {_class = "B_UGV_01_rcws_F";};
case "Empty CH-49 [CONS]": {_class = "I_Heli_Transport_02_F";};

case "Empty Rubberboat": {_class = "C_Rubberboat";};
case "Empty Motorboat": {_class = "C_Boat_Civil_01_F";};
case "Empty Assault Boat": {_class = "B_Boat_Transport_01_F";};
case "Empty Speedboat MG": {_class = "B_Boat_Armed_01_minigun_F";};
case "Empty SDV": {_class = "B_SDV_01_F";};
};
};
_class
};
disableserialization;
_ok = createDialog "MyShop"; 
_myDisplay = findDisplay 1234;
lbAdd [1501, "Other"];
if ({vehicle player distance (getmarkerpos _x) < 50 && {getmarkercolor _x == "ColorGreen"}} count PierMarkers > 0) then {
lbAdd [1501, "Boats"];
};
lbAdd [1501, "Supplies"];
if (vehicle player distance (getmarkerpos ([] CALL NEARESTAIRFIELD)) < 200 && {getmarkercolor ([] CALL NEARESTAIRFIELD) == "ColorGreen"}) then {
if ("USHelp" in (missionnamespace getvariable "Progress")) then {
if (isNil"IFSOVIET") then {
_t = if (isNil"IFENABLED") then {"NATO Air Vehicles"} else {"US Air Vehicles"};
lbAdd [1501, _t];
};
};
if ("GreenHelp" in (missionnamespace getvariable "Progress")) then {
_t = if (isNil"IFENABLED") then {"GREEN Air Vehicles"} else {"German Air Vehicles"};
lbAdd [1501, _t];
};
};
if (vehicle player distance (locationposition (["ColorBlue"] CALL NEARESTCAMP)) < 100) then {
//OPEN SOLDIER BUTTON IFSOVIET
if (isNil"IFSOVIET") then {
_t = if (isNil"IFENABLED") then {"GUER Land Vehicles"} else {"Polish Land Vehicles"};
lbAdd [1501, _t];
};
_t = if (isNil"IFENABLED") then {"GREEN Land Vehicles"} else {"German Land Vehicles"};
lbAdd [1501, _t];
if ("USHelp" in (missionnamespace getvariable "Progress")) then {
if (isNil"IFSOVIET") then {
_t = if (isNil"IFENABLED") then {"NATO Land Vehicles"} else {"US Land Vehicles"};
lbAdd [1501, _t];
};
};

lbAdd [1501, "AI Support"];

//lbAdd [1500, "Chopper Transport"];
};
lbSetCurSel [1501, 0];

while {dialog} do {
_text = "<t size='0.8'>" + "Lieutenant, what brings you here?" + "<br/>" + "ASSET PRICE: ";
_cost = ([(lbText [1500,(lbCurSel 1500)]),""] CALL SUPPORTCOST) * 0.8;
_text = _text + (format ["%1",_cost]) +"<br/>";
_text = _text + "(None-AI Vehicles are delivered empty)<br/></t>";
_occ = (lbText [1500, (lbCurSel 1500)]) call _f;
if (_occ != "") then {_text = _text + (format ["<img size='2.7' color='#33CCFF' image='%1'/>",(getText (configfile >> "CfgVehicles" >> _occ >> "picture"))]) +"<br/>";};
(_myDisplay displayCtrl 1100) ctrlSetStructuredText parseText _text;
sleep 0.1;
};
};
