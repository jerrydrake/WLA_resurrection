		private ["_masterFunc","_dd","_picked"];
		_masterFunc = {
		private ["_dd","_size","_picked","_pos","_firep","_start","_obj","_cl","_sizeA"];
		_picked = _this select 0;
		_pos = locationposition _picked;
		_sizeA = ((size _picked) select 0);
		_dd = (["Ld"] CALL DIS);
		//fireplaces
		_firep = [];
		_size = floor (_sizeA*0.004);
		if (_size == 0) then {_size = 1;};
		for "_i" from 0 to _size do {
		if ([_pos] CALL SAOKNEARVILRELA in ["Hostile","Angry"] && {random 1 < 0.8}) then {
		} else {
		_start = [_pos,_sizeA,0,"(1 - sea)"] CALL SAOKSEEKPOS;
		_cl = ["MetalBarrel_burning_F","FirePlace_burning_F"] call RETURNRANDOM;
		_obj = createVehicle [_cl,_start, [], 0, "NONE"]; 
		_obj setvectorup (surfaceNormal (getposATL _obj));
		_firep pushBack _obj;
		};
		sleep 0.1;
		};
		{_x setvariable ["AmCrate",1];sleep 0.1;} foreach _firep;
		sleep 10;
		waituntil {sleep 10; vehicle player distance _pos > _dd};
		{_x setvariable ["AmCrate",nil];sleep 0.1;} foreach _firep;
		{_x spawn SAOKDELETE;sleep 0.1;} foreach _firep;
		AmbientH = AmbientH - [_picked];
		};
		
		waitUntil {sleep 1; !isNil"StartMission"};
		sleep 15;
		//waitUntil {sleep 1; count AmbientCiv > 0};
		sleep 3;
		AmbientH = [];
while {true} do {
		sleep 6;
		//waituntil {sleep 2; {vehicle player distance (getmarkerpos _x) < 900} count AmbientH > 0};

		//{_mP = getmarkerpos _x;if (_mP distance vehicle player < 900 && {([_mP] CALL SAOKNEARVILRELA) in ["Hostile","Angry"]}) then {_x CALL FIREVILLAGE;};} foreach AmbientCiv;
		_dd = (["Ld"] CALL DIS);
		{
		if !(_x in AmbientH) then {
		[_x] SPAWN _masterFunc;
		AmbientH pushBack _x;
		};
		sleep 0.5;
		} foreach (nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital","NameLocal"], _dd]);
};




