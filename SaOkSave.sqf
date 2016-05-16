//GUARDPOSTS
private ["_mnpvars","_a","_b","_vilData","_typeF","_dir","_sO","_sW","_mar","_mcol","_fD","_col","_dd","_forEachIndex","_gData","_Bwall","_Cdata","_Vdata","_sData","_prog","_crate","_CarLisays","_wholeD","_n","_saveF","_post","_sOs","_AIt","_vars","_type","_size","_PowD","_fN","_vehClasses","_st","_star","_nameA","_f","_dGe","_ty","_mar2","_str","_Dat","_c","_used"];

disableserialization; 
if (count _this == 0) then {
	hint "Saving... Please Wait";
	"Save" SPAWN SAOKGEARANDTMSAVE;
	//SAVE
	_gData = [];
	_p = SAOKMAPSIZE * 0.5;
	{
		_post = _x getvariable "Post";
		_typeF = typeof _post;
		_dir = direction _post;
		_sOs = if (!isNil{(_post getvariable "StaticOS")}) then {_post getvariable "StaticOS"} else {[]};
		_sO = if (!isNil{(_post getvariable "StaticO")}) then {_post getvariable "StaticO"} else {[]};
		_sW = if (!isNil{(_post getvariable "StaticW")}) then {_post getvariable "StaticW"} else {[]};
		_mar = _post getvariable "Gmark";
		_mcol = if (!isnil{_mar} && {(getmarkercolor _mar) in ["ColorRed","ColorGreen","ColorBlue"]}) then {getmarkercolor _mar} else {"ColorRed"};
		_AIt = [];
		{
			if (!isNil{_post getvariable _x}) then {
				_AIt pushback _x;
			};
		} foreach ["AA-Guard","AT-Guard","MG-Guard","Sniper-Guard","Medic-Guard"];
		_vars = [];
		{if (!isNil{_post getvariable _x}) then {_vars pushback _x;};} foreach ["Basecamp","supplyDepot","IsRoadBlock","Green","NATO","CC"];
		_type = getmarkertype _mar;
		_size = getmarkersize _mar;
		_PowD = if (!isNil{_post getvariable "PowCells"}) then {_post getvariable "PowCells"} else {[]};
		_fD = [_typeF,getPosWorld _post,_dir,_mcol,_sO,_sW,_AIt,_vars,_type,_size,markertext _mar,_PowD,_sOs];
		_gData pushback _fD;
	} foreach (nearestLocations [[_p,_p,0], ["PostG","PostR"], SAOKMAPSIZE*0.7]);
	_Bwall = [];
	{
		_Bwall pushback [typeof _x, getposATL _x, direction _x, (_x getvariable "EndP")];
	} foreach ALLWalls;
	_Cdata = [];
	_p = SAOKMAPSIZE*0.5;
	{
		_mar = _x getvariable "Marker";
		_Cdata pushback [getmarkerpos _mar, getmarkertype _mar, getmarkercolor _mar,_mar];
	} foreach (nearestLocations [[_p,_p,0], ["CampB","CampR"], SAOKMAPSIZE*0.7]);
	_Vdata = [];
	{
		if (!(_x in DONTSTOREZONES) && {(_x getvariable "Mcolor") != "ColorGrey"}) then {
			_col = if ((_x getvariable "Mcolor") in ["ColorRed","ColorGreen","ColorBlue"]) then {(_x getvariable "Mcolor")} else {"ColorRed"};
			_dd = ((_x CALL SAOKZONEDR) CALL APUFF);
			if (count _dd > 0) then {
				_Vdata pushback [locationposition _x, _col,_dd,(_x getvariable "Mtype"), (_x getvariable "Mtext"),_x getvariable "ZONEDATA"];
			};
		};
	} foreach VEHZONESA;

	_sData = [];
	{
		_sdata pushback [_x, getmarkercolor _x, getmarkertype _x];
	} foreach FacMarkers + PowMarkers + StoMarkers + PierMarkers;

	_prog = if (!isNil{missionnamespace getvariable "Progress"}) then {missionnamespace getvariable "Progress"} else {[]};


	_crate = [];

	_CarLisays = + SaOkVehicleData;
	{
		private ["_car","_ok","_Mm","_newAr"];
		_car = _x;
		if (!isNil{_car getvariable "VehID"}) then {
			if (alive _car) then {
				_ok = 0;
				{
					if (_car getvariable "VehID" == _x select 0) exitWith {
						_Mm = 0;
						if (!isNil{_car getvariable "MineTruck"}) then {_Mm = 1;};
						_newAr = [_car getvariable "VehID",typeOf _car,getposATL _car, direction _car,fuel _car, damage _car, _Mm];
						_CarLisays set [_forEachIndex,_newAr];
						_ok = 1;
					};
				} foreach _CarLisays;
				if (_ok == 0) then {
					_Mm = 0;
					if (!isNil{_car getvariable "MineTruck"}) then {_Mm = 1;};
					_newAr = [_car getvariable "VehID",typeOf _car,getposATL _car, direction _car,fuel _car, damage _car, _Mm];
					_CarLisays pushback _newAr;
				};
			};
		};
	} foreach vehicles;

	_vilData = [];
	_p = SAOKMAPSIZE * 0.5;
	{
		if !(text _x in ["military","airbase","Terminal","AAC airfield"]) then {
			_a = "";
			if ([_x,"A"] CALL SAOKVILCON) then {_a = [_x,"A"] CALL SAOKVILRET;};
			_b = "";
			if ([_x,"B"] CALL SAOKVILCON) then {_b = [_x,"B"] CALL SAOKVILRET;};
			_m = [_x,"M"] CALL SAOKVILRET;
			_vilData pushback [_m,getmarkerpos _m, _a, _b,getmarkersize _m,MarkerBrush _m,MarkerAlpha _m];
		};
	} foreach (nearestLocations [[_p,_p,0], ["NameVillage","NameCity","NameCityCapital","NameLocal"], SAOKMAPSIZE*0.7]);


	_mnpvars = [];
	{if (!isNil{missionNamespace getvariable _x}) then {_mnpvars pushback [_x, missionNamespace getvariable _x];};} foreach ["UIBOXOFF","NoRadioVV","TeDam","ARTYAR","Eridanus","AMBbattles","SUPDEPOTS","CheConf","CIVMODE","CRATECLAS","IFSOVIET","IFENABLED","RHSENABLED","SPECOPSENABLED","BADBUILDING","GOODBUILDING","PID","NewRespawn","NewFatigue","ComingChapters","SaOkChapters","Autosave","EventLog","RandomEvents","MAXACTIVEV","VarDisableArty","DISVAR","MULTLIFE","GUARDLIM","PNEEDS","DIFLEVEL","AutoReplac","TeamStay","PLSTREGHT","HITEMDIS","CIdentity","CusVoiceOff","TIMMUL","ResTT","SAOKPP","FogOFF","RainyW","DisW","SAOKDYNTASKS","Bumblebeeman","CapturedAll","NORANWEES","SaOkNoAnimals","Bwalll"];
	_vehClasses = [ARMEDVEHICLES,ARMEDTANKS,ARMEDAA,ARMEDCARRIER,ARMEDSTATIC,AIRFIGTHER,AIRARMCHOP,AIRCARRIERCHOP,ENEMYC1,ENEMYC2,ENEMYC3,FRIENDC1,FRIENDC2,FRIENDC3,FRIENDC4,CIVS1,CIVVEH,ARMEDSUPPORT];
	_wholeD = [pisteet,PERSIANPRESTIGE,_gData,_Bwall,_Cdata,_Vdata,_CarLisays,_prog,CurTaskS,_sData,WalledCamp,getposATL player,CUSARRAY,date,[overcast,fog],VisitedCamps,[SaOkGearPrimW,SaOkGearSecW,SaOkGearPistol,SaOkGearHat,SaOkGearFatigue,SaOkGearVest,SaOkGearBackPack,SaOkGearAttachments,SaOkGearOther],_vehClasses,WalledOther,_vilData,[FacOwnP,StoOwnP],FACRES,_mnpvars,AlreadyDone,_insignia];
	_fN = "SaOkSaveWLA";
	if (worldname != "Altis") then {_fN = _fN + worldname;};
	profileNamespace setvariable [_fN,_wholeD];
	hint "Progress Saved Succesfully";
} else {
	//LOAD 
	SAOKRESUMEINPROG = true;
	_fN = "SaOkSaveWLA";
	if (worldname != "Altis") then {_fN = _fN + worldname;};
	if (!isNil{profileNamespace getvariable _fN}) then {
		//REMOVE OLD
		_saveF = profileNamespace getvariable _fN;
		if ({count _x > 3 && {count (toArray (_x select 3)) > 4}} count (_saveF select 4) > 10) then {
			{deletemarker (_x select 3);} foreach (_saveF select 4);
		} else {
			{
				_nameA = toArray _x;
				_f = [_nameA select 0, _nameA select 1,_nameA select 2,_nameA select 3,_nameA select 4];
				_f = toString _f;
				if (_f == "ZoneC") then {
					if (worldname != "Altis") then {deletemarker _x;} else {
						_x setMarkerSize [1,1];
						if (getmarkercolor _x == "ColorBlue") then {
							_c = createLocation ["CampB", getmarkerpos _x, 100, 100];
							_c setvariable ["Marker",_x];
						} else {
							_c = createLocation ["CampR", getmarkerpos _x, 100, 100];
							_c setvariable ["Marker",_x];
						};
					};
				};
			} foreach allMapMarkers;
		};

		//

		pisteet = _saveF select 0; 
		PERSIANPRESTIGE = _saveF select 1; 
		//GUARDPOSTS
		_c = count (_saveF select 2) - 1;
		for "_i" from 0 to _c do {
			private ["_xx","_Tower","_ar"];
			_xx = (_saveF select 2) select _i;
			_p = (_xx select 1);
			_Tower = createVehicle [(_xx select 0), (_xx select 1), [], 0, "CAN_COLLIDE"];
			if !("CC" in (_xx select 7)) then {
				_p set [2,(boundingCenter _Tower) select 2];
				_Tower setPosWorld (atltoasl _p);
			} else {_Tower setPosWorld (_xx select 1);};
			_Tower setdir (_xx select 2);
			if ((_xx select 0) in ["Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_HBarrierTower_F"]) then {_Tower setvectorup (surfaceNormal (getposATL _Tower));};
			_ar = [_Tower];
			if ((_xx select 3) != "ColorGreen") then {_ar pushback "";};
			_ar CALL GUARDPOST;
			_Tower allowdamage false;
			_Tower setvariable ["StaticW",(_xx select 5)];
			_Tower setvariable ["StaticO",(_xx select 4)];
			if (count _xx > 6) then {
				{
					_n = _x;
					if (_n == "AA-Team") then {_n = "AA-Guard";};
					if (_n == "AT-Team") then {_n = "AT-Guard";};
					if (_n == "MG-Team") then {_n = "MG-Guard";};
					if (_n == "Sniper-Team") then {_n = "Sniper-Guard";};
					if (_n == "Medic-Team") then {_n = "Medic-Guard";};
					_Tower setvariable [_n,1];
				} foreach (_xx select 6);
			} else {
				if (getmarkercolor (_Tower getvariable "Gmark") == "ColorRed") then {
					{_Tower setvariable [_x,1];} foreach ["AA-Guard","AT-Guard","MG-Guard","Sniper-Guard","Medic-Guard"];
				};
			};
			if (count _xx > 7) then {
				{_Tower setvariable [_x,1];} foreach (_xx select 7);
				(_Tower getvariable "Gmark") setmarkertype (_xx select 8);
				(_Tower getvariable "Gmark") setmarkersize (_xx select 9);
				(_Tower getvariable "Gmark") setmarkertext (_xx select 10);
			};
			if (count _xx > 11 && {(count (_xx select 11)) > 0}) then {
				_Tower setvariable ["PowCells",(_xx select 11)];
			};
			if (count _xx > 12 && {(count (_xx select 12)) > 0}) then {
				_Tower setvariable ["StaticOS",(_xx select 12)];
			};
		};
		//WALLS
		_c = count (_saveF select 3) - 1;
		for "_i" from 0 to _c do {
			private ["_xx","_obj"];
			_xx = (_saveF select 3) select _i;
			_obj = createVehicle [(_xx select 0),(_xx select 1), [], 0, "CAN_COLLIDE"]; 
			_obj setdir (_xx select 2);
			_obj setvariable ["EndP",(_xx select 3)];
			LWalls pushback _obj;
			ALLWalls pushback _obj;
		};

		//CAMPS
		_c = count (_saveF select 4) - 1;
		for "_i" from 0 to _c do {
			private ["_xx","_ps","_mar","_mar2"];
			_xx = (_saveF select 4) select _i;
			if (count _xx > 3 && {count (toArray (_xx select 3)) > 4}) then {
				NUMM=NUMM+1;
				_mar = format ["ZoneC%1",NUMM];
				_p = SAOKMAPSIZE*0.5;
				while {{_mar == (_x getvariable "Marker")} count (nearestLocations [[_p,_p,0], ["CampB","CampR"], SAOKMAPSIZE*0.7]) > 0} do {
					NUMM=NUMM+1;
					_mar = format ["ZoneC%1",NUMM];
				};
				if (count _xx > 3 && {{(_xx select 3) == (_x getvariable "Marker")} count (nearestLocations [[_p,_p,0], ["CampB","CampR"], SAOKMAPSIZE*0.7]) == 0}) then {
					_mar = (_xx select 3);
				};
				_ps = (_xx select 0);
				if (typename (_xx select 0) == "ARRAY" && {count (_xx select 0) == 3} && {!surfaceisWater _ps} && {count (nearestLocations [_ps, ["CampB","CampR"], 50]) == 0}) then {
					_col = if (typename (_xx select 2) == "STRING" && {(_xx select 2) in ["ColorRed","ColorBlue"]}) then {(_xx select 2)} else {"ColorRed"};
					_mar2 = createMarker [_mar,_ps];
					_mar2 setMarkerShape "ICON";
					_mar2 setMarkerType (_xx select 1);
					_mar2 setMarkerSize [1,1];
					_mar2 setMarkerColor _col;
					_mar2 setMarkerText "";

					if (_col == "ColorBlue") then {
						_c = createLocation ["CampB", _ps, 100, 100];
						_c setvariable ["Marker",_mar2];
					} else {
						_c = createLocation ["CampR", _ps, 100, 100];
						_c setvariable ["Marker",_mar2];
					};
				};
			};
		};

		//_wholeD = [0pisteet,1PERSIANPRESTIGE,2_gData,3_Bwall,4_Cdata,5_Vdata,6SaOkVehicleData,7_prog,8CurTaskS,9_sData,10_crate];


		//VEHICLE DATA
		SaOkVehicleData = (_saveF select 6);

		//missionnamespace setvariable ["Progress",(_saveF select 7)];
		{_x CALL SAOKADDPROG;} foreach (_saveF select 7);
		//SPAWN TASKS 

		//S POINT
		_c = count (_saveF select 9) - 1;
		for "_i" from 0 to _c do {
			private ["_xx","_n"];
			_xx = (_saveF select 9) select _i;
			_col = if (typename (_xx select 1) == "STRING" && {(_xx select 1) in ["ColorYellow","ColorRed","ColorGreen","ColorPink"]}) then {(_xx select 1)} else {"ColorYellow"};
			(_xx select 0) setmarkercolor _col; 
			(_xx select 0) setmarkertype (_xx select 2);
		};

		//WalledCamp = (_saveF select 10);
		PlayerPos = (_saveF select 11);
		CUSARRAY = (_saveF select 12);
		SaOkDate = (_saveF select 13);
		setdate SaOkDate;
		0 setovercast ((_saveF select 14) select 0);
		0 setfog ((_saveF select 14) select 1);
		if (count _saveF > 15) then {VisitedCamps = _saveF select 15;};
		if (count _saveF > 16 && {count (_saveF select 16) > 0}) then {
			_dGe = _saveF select 16;
			SaOkGearPrimW = _dGe select 0;
			SaOkGearSecW = _dGe select 1;
			SaOkGearPistol = _dGe select 2;
			SaOkGearHat = _dGe select 3;
			SaOkGearFatigue = _dGe select 4;
			SaOkGearVest = _dGe select 5;
			SaOkGearBackPack = _dGe select 6;
			SaOkGearAttachments = _dGe select 7;
			SaOkGearOther = _dGe select 8;
		};
		if (count _saveF > 17 && {count (_saveF select 17) > 0}) then {
			_dGe = _saveF select 17;
			ARMEDVEHICLES = _dGe select 0;
			ARMEDTANKS = _dGe select 1;
			ARMEDAA = _dGe select 2;
			ARMEDCARRIER = _dGe select 3;
			ARMEDSTATIC = _dGe select 4;
			AIRFIGTHER = _dGe select 5;
			AIRARMCHOP = _dGe select 6;
			AIRCARRIERCHOP = _dGe select 7;
			ENEMYC1 = _dGe select 8;
			ENEMYC2 = _dGe select 9;
			ENEMYC3 = _dGe select 10;
			FRIENDC1 = _dGe select 11;
			FRIENDC2 = _dGe select 12;
			FRIENDC3 = _dGe select 13;
			FRIENDC4 = _dGe select 14;
			CIVS1 = _dGe select 15;
			if (count _dGe > 16) then {
				CIVVEH = _dGe select 16;
				ARMEDSUPPORT = _dGe select 17;
			};
		};
		if (count _saveF > 18) then {
			WalledOther = _saveF select 18;
		};

		if (count _saveF > 19) then {
			//AmbientCiv = [];
			_Dat = _saveF select 19;
			_c = count _Dat - 1;
			for "_i" from 0 to _c do {
				private ["_xx"];
				_xx = _Dat select _i;
				_mar2 = createMarker [_xx select 0,_xx select 1];
				_mar2 setMarkerShape "ELLIPSE";
				//_mar2 setMarkerType "Empty";
				_ty = "BDiagonal";
				if (count _xx > 5) then {_ty = _xx select 5;};
				_mar2 setMarkerBrush _ty;
				_ty = 0.35;
				if (count _xx > 6) then {_ty = _xx select 6;};
				_mar2 setMarkerAlpha _ty;
				_size = [300,300];
				if (count _xx > 4) then {_size = _xx select 4;};
				_mar2 setMarkerSize _size;
				_mar2 setMarkerDir 0;
				_mar2 setMarkerColor "ColorPink";
				_mar2 setMarkerText "";
				//AmbientCiv pushback (_xx select 0);
				_loc = (getmarkerpos _mar2) CALL SAOKNEARESTVIL;
				SAOKDATAB setvariable [str _loc, [_mar2,_xx select 3,_xx select 2]];
				_str = "A";
				if (_xx select 2 != "") then {[_loc,_str,_xx select 2] CALL SAOKVILSET;_mar2 setMarkerColor ((_xx select 2) CALL SAOKRELTOCOLOR);};
				_str = "B";
				if (_xx select 3 != "") then {[_loc,_str,_xx select 3] CALL SAOKVILSET;};
			};
			//AmbientCivN = + AmbientCiv;

		};
		//[] CALL SAOKVILAD;
		if (count _saveF > 20) then {
			(_saveF select 20) SPAWN {
				waitUntil {sleep 0.1; !isnil"PAIKKAMARKERIT"};
				PAIKKAMARKERIT = nil;
				_Dat = _this;
				//FacOwnP = _Dat select 0;
				_FacOwnP = + (_Dat select 0);
				_c = count _FacOwnP - 1;
				for "_i" from 0 to _c do {
					private ["_xx"];
					_xx = _FacOwnP select _i;
					[_xx,"Fac"] CALL SAOKCREATESTPOINT;
					_vil = createLocation ["NameLocal", [(_xx select 0), (_xx select 1)-3, 0], 100, 100];
					_vil setText "factory";
					FACTORYLOCATIONS pushback _vil;
					sleep 0.1;
				};
				//StoOwnP = _Dat select 1;
				_StoOwnP = + (_Dat select 1);
				_c = count _StoOwnP - 1;
				for "_i" from 0 to _c do {
					private ["_xx"];
					_xx = _StoOwnP select _i;
					[_xx,"Sto"] CALL SAOKCREATESTPOINT;
					_vil = createLocation ["NameLocal", [(_xx select 0), (_xx select 1)-3, 0], 100, 100];
					_vil setText "storage";
					sleep 0.1;
				};
			};
		};
		if (count _saveF > 21) then {
			FACRES = _saveF select 21;
		};
		if (count _saveF > 22) then {
			{
				missionnamespace setvariable [_x select 0,_x select 1];
				if (_x select 0 == "CIdentity" && {isNil{missionnamespace getvariable "PID"}}) then {player setIdentity (_x select 1);};
				if (_x select 0 == "TIMMUL") then {setTimeMultiplier (_x select 1);};
				if (_x select 0 == "SAOKPP") then {[(_x select 1)] CALL BIS_fnc_setPPeffectTemplate;};
				if (_x select 0 == "NewFatigue") then {{_x enableFatigue false;} foreach allUnits;};
				//TIMMUL SAOKPP = (lbText [1508, (lbCurSel 1508)]); [(lbText [1508, (lbCurSel 1508)])] CALL BIS_fnc_setPPeffectTemplate;
			} foreach (_saveF select 22);
		};
		[] CALL SAOKGEARANDTMSAVE;
		sleep 10;
		//VEH ZONES
		_c = count (_saveF select 5) - 1;
		for "_i" from 0 to _c do {
			private ["_xxz","_n","_xy2"];
			_xxz = (_saveF select 5) select _i;
			_xy2 = _xxz select 2;
			if ({["med_F", _x] call SAOKINSTRING} count _xy2 == 0) then {
				_xxz set [2,_xy2];
				if ((_xxz select 0) distance [0,0,0] > 40) then {
					_n = _xxz CALL AddVehicleZone;
				};
			};
		};
		if (!isNil"CIVMODE") then {_nul = 1 SPAWN CivPlayer;};
		sleep 1;
		SAOKRESUMEINPROG = nil;
		{if (_x select 1 != "BOB") then {_x spawn (missionnamespace getvariable (_x select 1));};sleep (5 + random 10);} foreach AMBbattles;
		sleep 10;
		{
			if (ctrlType _x == 0) then {
				if (!isNil"UIBOXOFF") then {_x ctrlShow false;} else {_x ctrlShow true;};
			};
		} foreach (uinamespace getvariable "SAcont");
		_used = [];
		{
			if !(_x in _used) then {
				_used pushback _x;
				while {_x in CurTaskS} do {CurTaskS = CurTaskS - [_x];};
				if (typename _x != "ARRAY") then {
					if (!isNil{missionnamespace getvariable _x}) then {[] SPAWN (missionnamespace getvariable _x);} else {
						_n = [] execVM _x;
					};
				} else {
					if (!isNil{missionnamespace getvariable (_x select 0)}) then {[(_x select 1)] SPAWN (missionnamespace getvariable (_x select 0));} else {
						_n = [(_x select 1)] execVM (_x select 0);
					};
				};
			};
			sleep 0.1;
		} foreach (_saveF select 8);
		sleep 30;
		NOTASKNOTI = nil;
	};
	sleep 1;
	SAOKRESUMEINPROG = nil;
};