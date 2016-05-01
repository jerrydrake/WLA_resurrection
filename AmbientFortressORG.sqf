private ["_lva","_c","_ffnc","_ranP","_p","_clases","_house","_mar","_mar2","_nul","_current","_ranOr","_cPos"];

_ffnc = {
private ["_craa","_loc","_pos","_ran","_units","_firep","_uCo","_size","_typeOf","_obj","_ranCrate","_start","_group2","_unitrate","_icls","_classes","_pos2","_group","_nul","_own"];
_loc = _this select 0;
_pos = getmarkerpos _loc;
_uCo = 0;
_firep = [];
_units = [];
_size = [0,1,1] call RETURNRANDOM;
_craa = (CRATECLAS select 1)+(CRATECLAS select 2);
_typeOf = ["",""];
_cT = nearestBuilding _pos;
_ddd = _cT call SAOKBUILDINGPOS;
_lig = "Land_Camping_Light_F";
if (!isNil"IFENABLED") then {_lig = "FirePlace_burning_F";};	
if (count _ddd > 0 && {_size == 1}) then {
_g = _ddd call RETURNRANDOM;
_ddd = _ddd - [_g];
		//FIREPLACE
		_obj = createVehicle [_lig,_cT buildingpos _g, [], 0, "NONE"]; 
		_obj setpos (_cT buildingpos _g);
		//_obj setpos [(_cT buildingpos _g) select 0,(_cT buildingpos _g) select 1,((_cT buildingpos _g) select 2)-0.4];
		_firep pushBack _obj;
};
if (count _ddd > 0) then {
_g = _ddd call RETURNRANDOM;
_ddd = _ddd - [_g];
		//Crate
		_ranCrate = "Box_East_Grenades_F";
		if ((_this select 1) == "ColorRed") then {
		_ranCrate = (CRATECLAS select 1) call RETURNRANDOM; 
		} else {
		_ranCrate = _craa call RETURNRANDOM; 
		};
		_obj = createVehicle [_ranCrate,(_cT buildingpos _g), [], 0, "NONE"]; 
		_obj setvariable ["AmCrate",1];
		_obj setdir 0;
		//_obj setpos [(_cT buildingpos _g) select 0,(_cT buildingpos _g) select 1,((_cT buildingpos _g) select 2)-0.1];
		_obj setpos (_cT buildingpos _g);
		_firep pushBack _obj;
};		
		//Amount of units
		_uCo = 2 + floor (random 2);
		
/*
if (count (nearestObjects [_pos, ["Land_Unfinished_Building_02_F"], 10]) > 0) then {_typeOf = ["Land_Unfinished_Building_02_F",(nearestObjects [_pos, ["Land_Unfinished_Building_02_F"], 10]) select 0]};
if (count (nearestObjects [_pos, ["Land_Unfinished_Building_01_F"], 10]) > 0) then {_typeOf = ["Land_Unfinished_Building_01_F",(nearestObjects [_pos, ["Land_Unfinished_Building_01_F"], 10]) select 0]};
if (count (nearestObjects [_pos, ["Land_House_Big_02_V1_ruins_F"], 10]) > 0) then {_typeOf = ["Land_House_Big_02_V1_ruins_F",(nearestObjects [_pos, ["Land_House_Big_02_V1_ruins_F"], 10]) select 0]};
if (count (nearestObjects [_pos, ["Land_House_Big_01_V1_ruins_F"], 10]) > 0) then {_typeOf = ["Land_House_Big_01_V1_ruins_F",(nearestObjects [_pos, ["Land_House_Big_01_V1_ruins_F"], 10]) select 0]};
if (count (nearestObjects [_pos, ["Land_i_House_Big_02_V1_F"], 10]) > 0) then {_typeOf = ["Land_i_House_Big_02_V1_F",(nearestObjects [_pos, ["Land_i_House_Big_02_V1_F"], 10]) select 0]};
if (count (nearestObjects [_pos, ["Land_i_Shop_01_V1_F"], 10]) > 0) then {_typeOf = ["Land_i_Shop_01_V1_F",(nearestObjects [_pos, ["Land_i_Shop_01_V1_F"], 10]) select 0]};
if (count (nearestObjects [_pos, ["Land_i_Addon_03_V1_F"], 10]) > 0) then {_typeOf = ["Land_i_Addon_03_V1_F",(nearestObjects [_pos, ["Land_i_Addon_03_V1_F"], 10]) select 0]};
if (count (nearestObjects [_pos, ["Land_i_Stone_HouseBig_V1_F"], 10]) > 0) then {_typeOf = ["Land_i_Stone_HouseBig_V1_F",(nearestObjects [_pos, ["Land_i_Stone_HouseBig_V1_F"], 10]) select 0]};
_lig = "Land_Camping_Light_F";
if (!isNil"IFENABLED") then {_lig = "FirePlace_burning_F";};	
//hint format ["%1",_typeOf];
_craa = (CRATECLAS select 1)+(CRATECLAS select 2);
switch (_typeOf select 0) do {
	case "Land_Unfinished_Building_02_F" : {
		if (_size == 1) then {
		//FIREPLACE
		_obj = createVehicle [_lig,(_typeOf select 1) buildingpos 3, [], 0, "NONE"]; 
		//_obj setvectorup (surfaceNormal (getposATL _obj));
		_obj setpos [((_typeOf select 1) buildingpos 3) select 0,((_typeOf select 1) buildingpos 3) select 1,(((_typeOf select 1) buildingpos 3) select 2)-0.4];
		_firep pushBack _obj;
		};
		//Crate
		_ranCrate = "Box_East_Grenades_F";
		if ((_this select 1) == "ColorRed") then {
		_ranCrate = (CRATECLAS select 1) call RETURNRANDOM; 
		} else {
		_ranCrate = _craa call RETURNRANDOM; 
		};
		_obj = createVehicle [_ranCrate,(_typeOf select 1) buildingpos 2, [], 0, "NONE"]; 
		_obj setvariable ["AmCrate",1];
		_obj setdir 0;
		_obj setpos [((_typeOf select 1) buildingpos 2) select 0,((_typeOf select 1) buildingpos 2) select 1,(((_typeOf select 1) buildingpos 2) select 2)-0.1];
		_firep pushBack _obj;
		//Amount of units
		_uCo = 2 + floor (random 2);
		
	};
	case "Land_i_Stone_HouseBig_V1_F" : {
		if (_size == 1) then {
		//FIREPLACE
		_obj = createVehicle [_lig,(_typeOf select 1) buildingpos 5, [], 0, "NONE"]; 
		//_obj setvectorup (surfaceNormal (getposATL _obj));
		_obj setpos [((_typeOf select 1) buildingpos 5) select 0,((_typeOf select 1) buildingpos 5) select 1,(((_typeOf select 1) buildingpos 5) select 2)-0.25];
		_firep pushBack _obj;
		};
		//Crate
		_ranCrate = "Box_East_Grenades_F";
		if ((_this select 1) == "ColorRed") then {
		_ranCrate = (CRATECLAS select 1) call RETURNRANDOM; 
		} else {
		_ranCrate = _craa call RETURNRANDOM; 
		};
		_obj = createVehicle [_ranCrate,(_typeOf select 1) buildingpos 3, [], 0, "NONE"]; 
		_obj setvariable ["AmCrate",1];
		_obj setdir 0;
		_obj setpos [((_typeOf select 1) buildingpos 3) select 0,((_typeOf select 1) buildingpos 3) select 1,(((_typeOf select 1) buildingpos 3) select 2)-0.1];
		_firep pushBack _obj;
		//Amount of units
		_uCo = 2 + floor (random 1);
		
	};
	case "Land_i_Addon_03_V1_F" : {
		if (_size == 1) then {
		//FIREPLACE
		_obj = createVehicle [_lig,(_typeOf select 1) buildingpos 3, [], 0, "NONE"]; 
		//_obj setvectorup (surfaceNormal (getposATL _obj));
		_obj setpos [((_typeOf select 1) buildingpos 3) select 0,((_typeOf select 1) buildingpos 3) select 1,(((_typeOf select 1) buildingpos 3) select 2)-0.1];
		_firep pushBack _obj;
		};
		//Crate
		_ranCrate = "Box_East_Grenades_F";
		if ((_this select 1) == "ColorRed") then {
		_ranCrate = (CRATECLAS select 1) call RETURNRANDOM; 
		} else {
		_ranCrate = _craa call RETURNRANDOM; 
		};
		_obj = createVehicle [_ranCrate,(_typeOf select 1) buildingpos 1, [], 0, "NONE"]; 
		_obj setvariable ["AmCrate",1];
		_obj setdir 0;
		_obj setpos [((_typeOf select 1) buildingpos 1) select 0,((_typeOf select 1) buildingpos 1) select 1,(((_typeOf select 1) buildingpos 1) select 2)-0.1];
		_firep pushBack _obj;
		//Amount of units
		_uCo = 1 + floor (random 1);
		
	};
	case "Land_i_Shop_01_V1_F" : {
		if (_size == 1) then {
		//FIREPLACE
		_obj = createVehicle [_lig,(_typeOf select 1) buildingpos 3, [], 0, "NONE"]; 
		//_obj setvectorup (surfaceNormal (getposATL _obj));
		_obj setpos [((_typeOf select 1) buildingpos 3) select 0,((_typeOf select 1) buildingpos 3) select 1,(((_typeOf select 1) buildingpos 3) select 2)-0.1];
		_firep pushBack _obj;
		};
		//Crate
		_ranCrate = "Box_East_Grenades_F";
		if ((_this select 1) == "ColorRed") then {
		_ranCrate = (CRATECLAS select 1) call RETURNRANDOM; 
		} else {
		_ranCrate = _craa call RETURNRANDOM; 
		};
		_obj = createVehicle [_ranCrate,(_typeOf select 1) buildingpos 1, [], 0, "NONE"]; 
		_obj setvariable ["AmCrate",1];
		_obj setdir 0;
		_obj setpos [((_typeOf select 1) buildingpos 1) select 0,((_typeOf select 1) buildingpos 1) select 1,(((_typeOf select 1) buildingpos 1) select 2)-0.1];
		_firep pushBack _obj;
		//Amount of units
		_uCo = 2 + floor (random 1);
		
	};
	case "Land_Unfinished_Building_01_F" : {
		if (_size == 1) then {
		//FIREPLACE
		_obj = createVehicle [_lig,(_typeOf select 1) buildingpos 3, [], 0, "NONE"]; 
		//_obj setvectorup (surfaceNormal (getposATL _obj));
		_obj setpos [((_typeOf select 1) buildingpos 3) select 0,((_typeOf select 1) buildingpos 3) select 1,(((_typeOf select 1) buildingpos 3) select 2)-0.4];
		_firep pushBack _obj;
		};
		//Crate
		_ranCrate = "Box_East_Grenades_F";
		if ((_this select 1) == "ColorRed") then {
		_ranCrate = (CRATECLAS select 1) call RETURNRANDOM; 
		} else {
		_ranCrate = _craa call RETURNRANDOM; 
		};
		_obj = createVehicle [_ranCrate,(_typeOf select 1) buildingpos 2, [], 0, "NONE"]; 
		_obj setvariable ["AmCrate",1];
		_obj setdir 0;
		_obj setpos [((_typeOf select 1) buildingpos 2) select 0,((_typeOf select 1) buildingpos 2) select 1,(((_typeOf select 1) buildingpos 2) select 2)-0.1];
		_firep pushBack _obj;
		//Amount of units
		_uCo = 2 + floor (random 2);
		
	};
	case "Land_House_Big_02_V1_ruins_F" : {
		if (_size == 1) then {
		//FIREPLACE
		_obj = createVehicle [_lig,(_typeOf select 1) buildingpos 1, [], 0, "NONE"]; 
		//_obj setvectorup (surfaceNormal (getposATL _obj));
		_obj setpos [((_typeOf select 1) buildingpos 1) select 0,((_typeOf select 1) buildingpos 1) select 1,(((_typeOf select 1) buildingpos 1) select 2)-0.1];
		_firep pushBack _obj;
		};
		//Amount of units
		_uCo = 1 + floor (random 2);
		
	};
	case "Land_House_Big_01_V1_ruins_F" : {
		if (_size == 1) then {
		//FIREPLACE
		_obj = createVehicle [_lig,(_typeOf select 1) buildingpos 2, [], 0, "NONE"]; 
		//_obj setvectorup (surfaceNormal (getposATL _obj));
		_obj setpos [((_typeOf select 1) buildingpos 2) select 0,((_typeOf select 1) buildingpos 2) select 1,(((_typeOf select 1) buildingpos 2) select 2)-0.25];
		_firep pushBack _obj;
		};
		//Amount of units
		_uCo = 1 + floor (random 2);
		
	};
	case "Land_i_House_Big_02_V1_F" : {
		if (_size == 1) then {
		//FIREPLACE
		_obj = createVehicle [_lig,(_typeOf select 1) buildingpos 2, [], 0, "NONE"]; 
		//_obj setvectorup (surfaceNormal (getposATL _obj));
		_obj setpos [((_typeOf select 1) buildingpos 4) select 0,((_typeOf select 1) buildingpos 4) select 1,(((_typeOf select 1) buildingpos 4) select 2)-0.1];
		_firep pushBack _obj;
		};
		//Crate
		_ranCrate = "Box_East_Grenades_F";
		if ((_this select 1) == "ColorRed") then {
		_ranCrate = (CRATECLAS select 1) call RETURNRANDOM; 
		} else {
		_ranCrate = _craa call RETURNRANDOM; 
		};
		_obj = createVehicle [_ranCrate,(_typeOf select 1) buildingpos 8, [], 0, "NONE"]; 
		_obj setvariable ["AmCrate",1];
		_obj setdir 0;
		_obj setpos [((_typeOf select 1) buildingpos 8) select 0,((_typeOf select 1) buildingpos 8) select 1,(((_typeOf select 1) buildingpos 8) select 2)-0.1];
		_firep pushBack _obj;
		//Amount of units
		_uCo = 3 + floor (random 3);
	};
	default {
		if (_size == 1) then {
		_start = [(_pos select 0) + 15 - (random 30),(_pos select 1) + 15 - (random 30),0];
		_m = 0;
		_r = 15;
		while {_m < 10 && {(isOnRoad _start || {{_x distance _start < 20} count _firep > 0} || {surfaceIsWater _start})}} do {
		sleep 0.5;
		_m = _m + 1;
		_r = _r + 5;
		_start = [(_pos select 0) + _r - (random _r)*2,(_pos select 1) + _r - (random _r)*2,0];
		};
		_obj = createVehicle [_lig,_start, [], 0, "NONE"]; 
		_obj setvectorup (surfaceNormal (getposATL _obj));
		_firep pushBack _obj;
		};
	};
};		
_typeOf = ["",""];
if (count (nearestObjects [_pos, ["Land_Unfinished_Building_01_F"], 10]) > 0) then {_typeOf = ["Land_Unfinished_Building_01_F",(nearestObjects [_pos, ["Land_Unfinished_Building_01_F"], 10]) select 0]};
if (count (nearestObjects [_pos, ["Land_Unfinished_Building_02_F"], 10]) > 0) then {_typeOf = ["Land_Unfinished_Building_02_F",(nearestObjects [_pos, ["Land_Unfinished_Building_02_F"], 10]) select 0]};
switch (_typeOf select 0) do {
	case "Land_Unfinished_Building_01_F" : {
	//SNIPER ON ROOF (pos 9 or 10)
	if ((_this select 1) == "ColorRed") then {
	_group2 = [(_typeOf select 1) buildingpos 9, EAST, ["O_sniper_F"],[],[],[0.4,0.8]] call SpawnGroupCustom;
	leader _group2 setpos ((_typeOf select 1) buildingpos ([9] call RETURNRANDOM));
	_group2 setformdir (random 360);
	_units append (units _group2);
	} else {
	_group2 = [(_typeOf select 1) buildingpos 9, WEST, ["I_Sniper_F"],[],[],[0.4,0.8]] call SpawnGroupCustom;
	leader _group2 setpos ((_typeOf select 1) buildingpos ([9] call RETURNRANDOM));
	_group2 setformdir (random 360);
	_units append (units _group2);
	};
	
	};
	case "Land_Unfinished_Building_02_F" : {
	if ((_this select 1) == "ColorRed") then {
	_group2 = [(_typeOf select 1) buildingpos 7, EAST, ["O_sniper_F"],[],[],[0.4,0.8]] call SpawnGroupCustom;
	leader _group2 setpos ((_typeOf select 1) buildingpos 7);
	_group2 setformdir (random 360);
	_units append (units _group2);
	} else {
	_group2 = [(_typeOf select 1) buildingpos 7, WEST, ["I_Sniper_F"],[],[],[0.4,0.8]] call SpawnGroupCustom;
	leader _group2 setpos ((_typeOf select 1) buildingpos 7);
	_group2 setformdir (random 360);
	_units append (units _group2);
	};
	
	};
};	
*/
_ran = [ENEMYC1,EAST];
if ((_this select 1) == "ColorRed") then {
_ran = [[ENEMYC1,EAST],[ENEMYC2,EAST]] call RETURNRANDOM;
} else {
_ran = [[FRIENDC2,WEST]] call RETURNRANDOM;
};
_unitrate = if (_uCo > 0) then {_uCo} else {1 + floor (random 2)};
_icls = _ran select 0;
_classes = [];
for "_i" from 0 to _unitrate do {_classes pushback (_icls call RETURNRANDOM);};
_pos2 = [(_pos select 0)+20-(random 40), (_pos select 1)+20-(random 40), 0];
_group = [_pos2, _ran select 1, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
_nul = [units _group] SPAWN AICampBehaviour;
_units append (units _group);
_own = "WEST";
if (_ran select 1 == EAST) then {_own = "EAST";};
if (_ran select 1 == WEST) then {[_pos,"hd_flag","ColorGreen",0,"",300] SPAWN SAOKCREATEMARKER;};
{
_pos = [(_pos select 0)+20-(random 40),(_pos select 1)+20-(random 40),0];
[_pos,_own,700] SPAWN F_IEDmil;
if (_ran select 1 == WEST) then {[_pos,"MinefieldAP","ColorBlack",0,"",300] SPAWN SAOKCREATEMARKER;};
sleep 0.1;
} foreach [1,2,3];
if ((_this select 1) == "ColorRed" && {random 1 > 0.5}) then {
_start = [_pos,60,0,"(1 + houses) * (1 - sea)"] CALL SAOKSEEKPOS;
_start SPAWN TASK_VilPOWs;
};
waituntil {sleep 10; {!isnull _x && {alive _x} && {isNil{_x getvariable "SaOkSurrendeRed"}}} count units _group == 0 || {{_pos distance vehicle _x < 750} count ([player]) == 0}};
if ({!isnull _x && {alive _x} && {isNil{_x getvariable "SaOkSurrendeRed"}}} count units _group == 0) then {
if ((_this select 1) == "ColorRed") then {_loc setmarkercolor "ColorBlue";};
if ((_this select 1) == "ColorBlue") then {_loc setmarkercolor "ColorRed";};
};
waituntil {sleep 10; {_pos distance vehicle _x < 750} count [player] == 0};
if (random 1 > 0.6 && {count FORTRESSESMM < 40}) then {FORTRESSESVAR pushback _loc;} else {deletemarker _loc;FORTRESSESMM = FORTRESSESMM - [_loc];};
{_x spawn SAOKDELETE;sleep 0.1;} foreach _firep;
{_x spawn SAOKDELETE;sleep 0.1;} foreach _units;
};

_nVil = {
_nearestCity = nearestLocation [getposATL player, "NameCity"];
_nearestCity2 = nearestLocation [getposATL player, "NameVillage"];
_nearestCity3 = nearestLocation [getposATL player, "NameCityCapital"];
_nearestCity4 = nearestLocation [getposATL player, "NameLocal"];
_copy = [[_nearestCity,_nearestCity2,_nearestCity3,_nearestCity4],[],{player distance locationposition _x},"ASCEND"] call SAOKSORTBY;
_nP = text (_copy select 0);
[_nP,(_copy select 0)]
};

_current = [] CALL _nVil;
_ranP = [player] call RETURNRANDOM;
while {true} do {
waitUntil {sleep 5; _current select 0 != (([] CALL _nVil) select 0) || {!alive _ranP} || {isNull _ranP}}; 
_ranP = [player] call RETURNRANDOM;
_current =  [] CALL _nVil;
_cPos = locationposition (_current select 1);
_ranOr = [];
_clases = ["Land_i_Stone_HouseBig_V1_F","Land_i_Addon_03_V1_F","Land_i_Shop_01_V1_F","Land_i_House_Big_02_V1_F","Land_House_Big_01_V1_ruins_F","Land_House_Big_02_V1_ruins_F","Land_Unfinished_Building_01_F"];
_ranOr = _clases call BIS_fnc_arrayShuffle;
if ({_cPos distance getmarkerpos _x < 200} count FORTRESSESMM == 0) then {
_c = count _ranOr - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _ranOr select _i;
if ({_cPos distance getmarkerpos _x < 200} count FORTRESSESMM == 0 && {count (nearestObjects [_cPos, [_xx], 200]) > 0}) then {
_house = (nearestObjects [_cPos, [_xx], 200]) call RETURNRANDOM;
if (isNil"_house" || {typename _house != "OBJECT"}) exitWith {};
_mar = format ["FORTM%1",NUMM];
NUMM=NUMM+1;
_mar2 = createMarker [_mar,getposATL _house];
_mar2 setMarkerShape "ICON";
//_mar2 setMarkerType "Empty";
_mar2 setMarkerType "hd_flag";
_mar2 setMarkerSize [1,1];
_mar2 setMarkerColor (["ColorBlue","ColorRed","ColorRed"] call RETURNRANDOM);
_mar2 setMarkerText "";
FORTRESSESVAR pushback _mar2;
FORTRESSESMM pushback _mar2;
};
sleep 0.1;
};
};

_lva = + FORTRESSESVAR;
_c = count _lva - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _lva select _i;
if ({(getmarkerpos _xx) distance vehicle _x < 700} count ([player]) > 0) then {
FORTRESSESVAR = FORTRESSESVAR - [_xx];
_nul = [_xx, getmarkercolor _xx] SPAWN _ffnc;
};
sleep 0.1;
};

sleep 15;
};