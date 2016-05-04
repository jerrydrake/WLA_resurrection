private["_price", "_type", "_cl", "_pos", "_nul"];
_price = _this select 0;
_type = _this select 1;
_cl = "";
switch (_type) do {
    case "AFRF Ammo":
        {
            _cl = "rhs_mags_crate";
        };
    case "AFRF Gear":
    	{
    		_cl = "rhs_gear_crate";
   	 	}
    case "AFRF Launchers":
    	{
    		_cl = "rhs_launcher_crate";
   	 	}
    case "AFRF Special Weapons":
    	{
    		_cl = "rhs_spec_weapons_crate";
   	 	}
    case "AFRF Weapons":
    	{
    		_cl = "rhs_weapon_crate";
   	 	}
    case "USF Ammo":
    	{
    		_cl = "rhsusf_mags_crate";
   	 	}
    case "USF Gear":
    	{
    		_cl = "rhsusf_gear_crate";
   	 	}
    case "USF Launchers":
    	{
    		_cl = "rhsusf_launcher_crate";
   	 	}
    case "USF Special Weapons":
    	{
    		_cl = "rhsusf_spec_weapons_crate";
   	 	}
    case "USF Weapons":
    	{
    		_cl = "rhsusf_weapon_crate";
   	 	}
    case "Cargo Net":
        {
            _cl = "B_CargoNet_01_ammo_F";
        };
    case "Basic Ammo":
        {
            _cl = "Box_NATO_Ammo_F";
        };
    case "Basic Weapons":
        {
            _cl = "Box_NATO_Wps_F";
        };
    case "Grenades":
        {
            _cl = "Box_NATO_Grenades_F";
        };
    case "Launchers":
        {
            _cl = "Box_NATO_WpsLaunch_F";
        };
    case "Explosives":
        {
            _cl = "Box_NATO_AmmoOrd_F";
        };
    case "Special":
        {
            _cl = "Box_NATO_WpsSpecial_F";
        };
    case "NATO SF weapons":
        {
            _cl = "Box_mas_us_rifle_Wps_F";
        };
    case "Russian weapons":
        {
            _cl = "Box_mas_ru_rifle_Wps_F";
        };
    case "Supply[NATO]":
        {
            _cl = "B_supplyCrate_F";
        };
    case "Supply[AAF]":
        {
            _cl = "I_supplyCrate_F";
        };
    case "Support[NATO]":
        {
            _cl = "Box_NATO_Support_F";
        };
    case "Support[AAF]":
        {
            _cl = "Box_IND_Support_F";
        };
    case "VehAmmo[NATO]":
        {
            _cl = "Box_NATO_AmmoVeh_F";
        };
    case "VehAmmo[AAF]":
        {
            _cl = "Box_IND_AmmoVeh_F";
        };
    case "Construction Truck":
        {
            _cl = "I_G_Van_01_transport_F";
        };
};

if (_cl == "") then {
    {
        if (getText(configfile >> "CfgVehicles" >> _x >> "displayName") == _type) then {
            _cl = _x;
        };
    }
    foreach["I_G_Van_01_transport_F"] + (ARMEDVEHICLES select 0) + (ARMEDCARRIER select 0);
};

if (_cl == "") exitWith {};
if (pisteet >= _price) then {
    pisteet = pisteet - _price;
    "Cash"
    SPAWN SAOKPLAYSOUND;
    _nul = [-_price, "Support Call"] SPAWN PRESTIGECHANGE;
    //_trigger = _this select 0;
    //_trigger setTriggerActivation ["NONE", "PRESENT", true];

    leader player sidechat("Wolf to Base, we need more gear. Could you drop us crate of " + _type + ". Over");
    [player, player, "PlaV", "V5"] SPAWN SAOKKBTELL;
    sleep 7;
    [WEST, "HQ"] sidechat localize "STR_Sp1s1r8";
    "Radio4"
    SPAWN SAOKPLAYSOUND;
    //sleep (60 + (random 60));
    if (_type != "Construction Truck") then {
        _pos = [(getposATL player select 0) + 150 - (random 300), (getposATL player select 1) + 150 - (random 300), 0];
        while {
            surfaceIsWater _pos
        }
        do {
            sleep 5;
            _pos = [(getposATL player select 0) + 150 - (random 100), (getposATL player select 1) + 150 - (random 300), 0];
        };
        if (_cl iskindof "ReammoBox_F" || {
                true
            } || {!isNil "IFENABLED"
            }) then {
            _nul = [_pos, "", 1, _cl] SPAWN FSupportDrop;
        } else {
            _nul = [_cl, _pos] SPAWN SAOKSLINGVEH;
        };
    } else {
        if (!isNil "IFENABLED" || {
                true
            }) then {
            _nul = [getposATL player, _cl] SPAWN FSupportDrop;
        } else {
            _nul = [_cl, getposATL vehicle player] SPAWN SAOKSLINGVEH;
        };
    };
    sleep 600 + (random 300);
    //_trigger setTriggerActivation ["Echo", "PRESENT", true];
    //hint "Gear Support is available again via radio channel - Echo";
} else {
    (format["%1 more prestige value needed to order gear drop", _price - pisteet]) SPAWN HINTSAOK;
};