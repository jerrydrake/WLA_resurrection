private["_pos", "_class", "_roina", "_rrr", "_posM", "_name", "_mar2", "_mar3", "_veh"];

_pos = _this select 0;
_class = _this select 1;

if (_class == "") then {
	_class = _this select 3;
};

_veh = createVehicle["B_Parachute_02_F", [_pos select 0, _pos select 1, 80], [], 0, "NONE"];
_roina = createVehicle[_class, [_pos select 0, _pos select 1, 75], [], 0, "NONE"];

if (_class in ["rhsusf_weapon_crate", "rhsusf_spec_weapons_crate", "rhsusf_launcher_crate", "rhsusf_gear_crate", "rhsusf_mags_crate", "rhs_weapon_crate", "rhs_spec_weapons_crate", "rhs_launcher_crate", "rhs_gear_crate", "rhs_mags_crate", "Box_mas_ru_rifle_Wps_F", "Box_mas_us_rifle_Wps_F", "Box_NATO_WpsSpecial_F", "Box_NATO_AmmoOrd_F", "Box_NATO_WpsLaunch_F", "Box_NATO_Grenades_F", "Box_NATO_Wps_F", "Box_NATO_Ammo_F"]) then {
	_roina addWeaponCargo["Rangefinder", 1];
	_roina addWeaponCargo["Laserdesignator", 1];
	_roina addmagazineCargo["Laserbatteries", 1];
	//_roina addWeaponCargo ["B_UavTerminal",1];
};

if (_class == "I_G_Van_01_transport_F") then {
	_roina setvariable["Minetruck", 1];
};
_roina setdir(random 360);
_rrr = [0, 0, 0];

if (_class iskindof "ReammoBox_F") then {
	_rrr = [0, 0, -1];
};
_roina attachTo[_veh, _rrr];
_roina setvariable["AmCrate", 1];

if (_class iskindof "LandVehicle") then {
	AddIdVeh pushBack _roina;
};

[_roina] SPAWN
{
	private["_maxTime", "_smoke", "_roina"];
	_roina = _this select 0;
	sleep 5;
	_maxTime = 14;
	while {!isNil "_roina" && {!isNull _roina} && {{vehicle _x distance _roina < 15} count(units(group player)) == 0} && {_maxTime > 0}} do {
		_smoke = createVehicle["SmokeShellOrange", (getposATL _roina), [], 0, "NONE"];
		_smoke attachTo[_roina, [0, 0, 0.2]];
		sleep 19;
		_maxTime = _maxTime - 1;
		if (!isNull _smoke) then {
			deletevehicle _smoke;
		};
	};
};

if (daytime < 5 || {daytime > 21}) then {
	[_roina] SPAWN
	{
		private["_exp", "_roina"];
		_roina = _this select 0;
		sleep 5;
		waitUntil {sleep 5;isNil "_roina" || {isNull _roina} || {(getposATL _roina) select 2 < 1.5}};
		if (!isNil "_roina" && {!isNull _roina}) then {
			_exp = createVehicle["Chemlight_Blue", (getposATL _roina), [], 0, "NONE"];
			sleep 600;
			if (!isNil "_exp") then {
				deletevehicle _exp;
			};
		};
	};
};

sleep 5;
_aika = time + 90;
waitUntil {sleep 0.2;([_roina, _veh] call SAOKCOLLISION) || {(getposATL _roina select 2) < 2} || {(getposASL _roina select 2) < 2} || {_aika < time}};
detach _roina;
sleep 10;
deletevehicle _veh;

if (count _this > 2) then {
	_posM = [(getposATL _roina select 0) + 25 - (random 50), (getposATL _roina select 1) + 25 - (random 50), 0];
	NUMM = NUMM + 1;
	_name = format["Gearmar%1", NUMM];
	_mar2 = createMarker[_name, _posM];
	_mar2 setMarkerShape "ELLIPSE";
	_mar2 setMarkerBrush "DIAGGRID";
	_mar2 setMarkerSize[25, 25];
	_mar2 setMarkerColor "ColorOrange";
	NUMM = NUMM + 1;
	_name = format["Gearmar%1", NUMM];
	_mar3 = createMarker[_name, _posM];
	_mar3 setMarkerShape "ICON";
	_mar3 setMarkerType "mil_triangle";
	_mar3 setMarkerSize[0.5, 0.5];
	_mar3 setMarkerColor "ColorBlack";
	_mar3 setMarkerText "Dropped Supply-Crate";
	[_mar2, _mar3] SPAWN
	{
		sleep 900; {deletemarker _x;} foreach _this;
	};
};

if (_class isKindOf "Car") then {
	sleep 1200;
	if (!isNull _roina) then {
		waitUntil {sleep 30;vehicle player distance _roina > 700};
	};
	if (!isNull _roina) then {
		_roina setvariable["AmCrate", nil];
	};
};