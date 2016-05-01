
private ["_locaDat","_talk","_score","_uppar","_UAV"];
disableserialization; 
if (!isNil{uinamespace getvariable "SAcont"}) then {
{ctrlDelete _x;} foreach (uinamespace getvariable "SAcont");
uinamespace setvariable ["SAcont",[]];
};
if (!isNil{uinamespace getvariable "TitText"}) then {
{ctrlDelete _x;} foreach (uinamespace getvariable "TitText");
uinamespace setvariable ["TitText",nil];
};
if (!isNil{uinamespace getvariable "SaHint"}) then {
{ctrlDelete _x;} foreach (uinamespace getvariable "SaHint");
uinamespace setvariable ["SaHint",nil];
};
if (!isNil{uinamespace getvariable "SaTHint"}) then {
{ctrlDelete _x;} foreach (uinamespace getvariable "SaTHint");
uinamespace setvariable ["SaTHint",nil];
};
if (!isNil{uinamespace getvariable "Tcontrols"}) then {
{ctrlDelete _x;} foreach (uinamespace getvariable "Tcontrols");
uinamespace setvariable ["Tcontrols",nil];
};
waitUntil {!isNil"REINFSTATE" && {!isNil"StartMission"}};
_locaDat = {
private ["_dF","_s","_ns","_msg","_n","_fM","_Lna","_nearest","_nPp","_nPs","_npSS","_nCamp","_pnCamp","_snCamp","_nVilla","_fP","_nAir","_pRcamp","_f","_f2","_f3","_f4","_f5","_f6","_f7","_f8","_f9","_f10","_f11","_f12","_disp"];
with uiNamespace do {
	private ["_pic0","_pic3"];
	disableserialization;
	_f = "<t color='#FF9900'>" +format ["<img size='%2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Bunker" >> "icon")),((safezoneW/(2.4242))*1.0)]+ " Camp Status"+"</t>" + "<br/>";
	_f2 = "<t color='#FF9900'>" +"Defenses|"+"</t>"+"<t color='#FFCC99'>";
	_f3 = "<t color='#FF9900'>" +"Status|"+"</t>"+"<t color='#FFCC99'>";
	_f4 = "<t color='#FF9900'>" + format ["<img size='%2' image='%1'/> ",(getText (configfile >> "CfgMarkers" >> "loc_Tourism" >> "icon")),((safezoneW/(2.4242))*1.0)];
	_f5 = "<t color='#FF9900'>" + "Relation|" +"</t>" + "<t color='#FFCC99'>";
	_f6 = "<t color='#FF9900'>" + "Special|" +"</t>" + "<t color='#FFCC99'>";
	_f7 = "<t color='#FF9900'>"+format ["<img size='%2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Stack" >> "icon")),((safezoneW/(2.4242))*1.0)]+" Factory Status" +"</t>" + "<br/>";
	_f8 = "<t color='#FF9900'>" + "Condition|" +"</t>" + "<t color='#FFCC99'>";
	_f9 = "<t color='#FF9900'>" +"Defenses|"+"</t>"+"<t color='#FFCC99'>";
	_f10 = "<t color='#FF9900'>" +format ["<img size='%2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "respawn_air" >> "icon")),((safezoneW/(2.4242))*1.0)]+" Airfield Status" +"</t>" + "<br/>";
	_f11 = "<t color='#FF9900'>" + "Condition|" +"</t>" + "<t color='#FFCC99'>";
	_f12 = "<t color='#FF9900'>" +"Defenses|"+"</t>"+"<t color='#FFCC99'>";
	_dF = "Low";
	_s = 21;
	 _pic0 = findDisplay 46 ctrlCreate ["RscBackground", -1];
	 _pic0 ctrlSetBackgroundColor [0.4,0.4,0.4,0.4];
	 //hint str (ctrlType _pic0);IC3D
	 if (!isNil"UIBOXOFF") then {_pic0 ctrlShow false;};
     _pic0 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40,0,0];
     _pic0 ctrlCommit 0;
	 _pic0 call (missionnamespace getvariable "SAOKADDCTRL");
	 _pic3 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	 _pic3 ctrlSetStructuredText parsetext "";
	 _pic3 ctrlSetFontHeight ((safezoneW/(2.4242))*0.025);
     _pic3 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40,0.085*safeZoneW,(((1+safeZoneH)/(2.8181))*0.03)*5];
     _pic3 ctrlCommit 0;
	 _pic3 call (missionnamespace getvariable "SAOKADDCTRL");
	 _npSS = 300;	
	 while {true} do {
		waitUntil {sleep 3;vehicle player distance ("" CALL (missionnamespace getvariable "NEARESTPLACE")) < _npSS && {!visiblemap} && {vehicle player == player}};
		while {vehicle player distance ("" CALL (missionnamespace getvariable "NEARESTPLACE")) < _npSS && {!visiblemap} && {vehicle player == player}} do {
		_Lna = player CALL (missionnamespace getvariable "NEARESTLOCATIONNAME");
		_nearest = [] CALL (missionnamespace getvariable "NEARESTPLACE");
		_nPp = if (typename _nearest == "STRING") then {getmarkerpos _nearest} else {locationposition _nearest};
		_nPs = if (typename _nearest == "STRING") then {getmarkersize _nearest} else {size _nearest};		
		_npSS = (_nPs select 0)+100;	
		_msg = "";
		_nCamp = ([] CALL (missionnamespace getvariable "NEARESTCAMP")) getvariable "Marker";
		_pnCamp = getmarkerpos _nCamp;
		_snCamp = (getmarkersize _nCamp select 0)+100;
		_n = 1;
		if (vehicle player distance _pnCamp < _snCamp) then {
		_n = 2.3;
		if (_s > 20) then {_dF = (_pnCamp CALL (missionnamespace getvariable "SAOKRETURNDEFENSES"));_s = 0;};
		_s = _s + 1;
		if !(_nCamp in (missionnamespace getvariable "VisitedCamps")) then {_ns = missionnamespace getvariable "VisitedCamps"; _ns pushback _nCamp; missionnamespace setvariable ["VisitedCamps",_ns];};
		_msg = _f;
		_msg = _msg + _f2 +(if (getmarkercolor _nCamp == "ColorRed") then {"Unknown"} else {
		if ((getposATL ([_pnCamp] CALL (missionnamespace getvariable "RETURNGUARDPOST"))) distance _pnCamp > _snCamp) then {"Low"} else {_dF};
		})+"</t>" + "<br/>";
		if (getmarkercolor _nCamp != "ColorRed") then {_msg = _msg +_f3 +(if (_nCamp CALL (missionnamespace getvariable "SAOKISCAMPDANGER")) then {"In Danger"} else {"Aware"})+"</t>"+ "<br/>"};
		_msg = _msg + (if (getmarkercolor _nCamp != "ColorRed") then {"SHIFT+1"+ "<br/>"} else {""})+ "<br/>";
		_msg = _msg + "<br/>";
		}; 
		_nVilla = (player CALL (missionnamespace getvariable "SAOKNEARESTVIL"));
		if (vehicle player distance (locationposition _nVilla) < _npSS) then {
		_msg = _msg + _f4 + _Lna +"</t>" + "<br/>";
		_msg = _msg + _f5 +(player CALL (missionnamespace getvariable "SAOKNEARVILRELA"))+"</t>" + "<br/>";
		_msg = _msg + _f6 +(if !([_nearest,"B"] CALL (missionnamespace getvariable "SAOKVILCON")) then {"None"} else {[_nearest, "B"] CALL (missionnamespace getvariable "SAOKVILRET")})+"</t>"+ "<br/>";
		_msg = _msg + "SHIFT+1"+ "<br/>";
		};
		//FacMarkers  loc_Stack loc_Tourism
		_fP = getmarkerpos ([] CALL (missionnamespace getvariable "NEARESTFACTORY"));
		if (vehicle player distance _fP < 100) then {
		_fM = (missionnamespace getvariable "FacMarkers") select 0;
		{if (_fP distance getmarkerpos _fM > _fP distance getmarkerpos _x) then {_fM = _x;};sleep 0.01;} foreach (missionnamespace getvariable "FacMarkers");
		if (getmarkercolor _fM != "ColorRed") then {
		_msg = _msg + _f7;
		_msg = _msg + _f8 +(if (player CALL (missionnamespace getvariable "SAOKNEARVILRELA") != "Friendly") then {"Not operative - relationship too poor"} else {"Operative"})+"</t>" + "<br/>";
		_msg = _msg + _f9 +(if ((getposATL ([_fP] CALL (missionnamespace getvariable "RETURNGUARDPOST"))) distance _fP > 250) then {"None"} else {"Guarded"})+"</t>" + "<br/>";
		};
		}; 
		_nAir = getmarkerpos ([] CALL (missionnamespace getvariable "NEARESTAIRFIELD"));
		_pRcamp = locationposition (["ColorRed"] CALL (missionnamespace getvariable "NEARESTCAMP"));
		if (vehicle player distance _nAir < 200) then {
		_msg = _msg + _f10;
		_msg = _msg + _f11 +(if (getmarkercolor ([] CALL (missionnamespace getvariable "NEARESTAIRFIELD")) != "ColorGreen") then {"Not operative (Secure with guardpost)"} else {"Operative"})+"</t>" + "<br/>";
		_msg = _msg + _f12 +(if ((getposATL ([_nAir] CALL (missionnamespace getvariable "RETURNGUARDPOST"))) distance _nAir > 450) then {"None"} else {"Guarded"})+"</t>" + "<br/>";
		_msg = _msg + "<t color='#FFCC99'>"+(if (_nAir distance _pRcamp < 800) then {""} else {"SHIFT+1"})+"</t>" + "<br/>";
		};
		if (isNil"IC3D") then {_pic3 ctrlShow false;_pic0 ctrlShow false;} else {_pic3 ctrlShow true; _pic0 ctrlShow true;if (!isNil"UIBOXOFF") then {_pic0 ctrlShow false;};};
		_pic0 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40,0.08*safeZoneW,(((1+safeZoneH)/(2.8181))*0.03)*6*_n];
		_pic0 ctrlCommit 0;
		_pic3 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40,0.08*safeZoneW,(((1+safeZoneH)/(2.8181))*0.03)*6*_n];
		_msg = (format ["<t size='%1'>",((safezoneW/(2.4242))*0.8)]) + _msg + "</t>";
		_pic3 ctrlSetStructuredText (parsetext _msg);
		_pic3 ctrlCommit 0;
		sleep 3;
		};
		waitUntil {sleep 3;_nPp distance ("" CALL (missionnamespace getvariable "NEARESTPLACE")) >= 10 || {vehicle player distance _nPp >= _npSS} || {visiblemap} || {vehicle player != player}};
		_pic3 ctrlSetStructuredText parsetext "";
		_pic3 ctrlCommit 0;
		_pic0 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40,0,0];
		_pic0 ctrlCommit 0;
	 };
	};
};
[] SPAWN _locaDat;
_talk = {
private ["_msg"];
with uiNamespace do {
	private ["_pic0","_pic3"];
	disableserialization;
	 _pic0 = findDisplay 46 ctrlCreate ["RscBackground", -1];
	 _pic0 ctrlSetBackgroundColor [0.4,0.4,0.4,0.4];
     _pic0 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40 - (((1+safeZoneH)/(2.8181))*0.05),0,0];
	  if (!isNil"UIBOXOFF") then {_pic0 ctrlShow false;};
     _pic0 ctrlCommit 0;
	 _pic0 call (missionnamespace getvariable "SAOKADDCTRL");
	 _pic3 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	 _pic3 ctrlSetStructuredText parsetext "";
	 _pic3 ctrlSetFontHeight (((1+safeZoneH)/(2.8181))*0.03);
     _pic3 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40 - (((1+safeZoneH)/(2.8181))*0.05),0.09*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)];
     _pic3 ctrlCommit 0;
	 _pic3 call (missionnamespace getvariable "SAOKADDCTRL");
	 _msg = parsetext ((format ["<t size='%1'>",((safezoneW/(2.4242))*0.9)]) + format ["<img size='%2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa",((safezoneW/(2.4242))*1.1)]+ " Shift+Y/Z" + "</t>");
	 while {true} do {
		waitUntil {sleep 3;({leader _x != player && {side _x != EAST} && {behaviour _x != "COMBAT"} && {[_x,player] CALL (missionnamespace getvariable "FUNKTIO_LOS")}} count ((getposATL player) nearEntities [["Man"],7]) > 0 || {{leader _x != player && {!isNil{(_x getvariable "SaOkSurrendeRed")}} && {[_x,player] CALL (missionnamespace getvariable "FUNKTIO_LOS")}} count ((getposATL player) nearEntities [["Man"],7]) > 0}) && {!visiblemap} && {vehicle player == player}};		
		if (isNil"IC3D") then {_pic3 ctrlShow false;_pic0 ctrlShow false;} else {_pic3 ctrlShow true; _pic0 ctrlShow true;if (!isNil"UIBOXOFF") then {_pic0 ctrlShow false;};};
		_pic0 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40 - (((1+safeZoneH)/(2.8181))*0.05),0.09*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)];
		_pic0 ctrlCommit 0;
		_pic3 ctrlSetStructuredText _msg;
		_pic3 ctrlCommit 0;
		waitUntil {sleep 3;!({leader _x != player && {side _x != EAST} && {behaviour _x != "COMBAT"} && {[_x,player] CALL (missionnamespace getvariable "FUNKTIO_LOS")}} count ((getposATL player) nearEntities [["Man"],7]) > 0 || {{leader _x != player && {!isNil{(_x getvariable "SaOkSurrendeRed")}} && {[_x,player] CALL (missionnamespace getvariable "FUNKTIO_LOS")}} count ((getposATL player) nearEntities [["Man"],7]) > 0}) || {visiblemap} || {vehicle player != player}};
		_pic3 ctrlSetStructuredText parsetext "";
		_pic3 ctrlCommit 0;
		_pic0 ctrlSetPosition [safeZoneX,(safeZoneY + safeZoneH)*0.40 - (((1+safeZoneH)/(2.8181))*0.05),0,0];
		_pic0 ctrlCommit 0;
	 };
	};
};
[] SPAWN _talk;
_score = {
	
private ["_but","_msg","_dat","_isWater","_f","_f2","_f3","_f4","_f5","_f6"];
with uiNamespace do { 	private ["_pic0","_pic3"]; 	disableserialization; 	_dat = (worldname CALL (missionnamespace getvariable "SAOKMAPDATA"));  	_isWater = (_dat select 6); 	_but = "Pier|</t>"; 	if !(_isWater) then {_but = "Passage|</t>";}; 	_f = "<br/>"+ (format ["<t color='#FFCC99'><img size='1.0' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Stack" >> "icon"))])+"Factory|</t>"+("FAC" CALL (missionnamespace getvariable "SAOKRCOL")); 	_f2 ="<br/>"+ (format ["<t color='#FFCC99'><img size='1.0' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Power" >> "icon"))])+"Power|</t>"+("POW" CALL (missionnamespace getvariable "SAOKRCOL")); 	_f3 = "<br/>"+ (format ["<t color='#FFCC99'><img size='1.0' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "loc_Quay" >> "icon"))])+_but+("PIE" CALL (missionnamespace getvariable "SAOKRCOL")); 	_f4 = "<br/>"+ (format ["<t color='#FFCC99'><img size='1.0' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "n_service" >> "icon"))])+"Storage|</t>"+("STO" CALL (missionnamespace getvariable "SAOKRCOL")); 	_f5 = "<t color='#FF9900'>" + format ["<img size='1.0' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"]+"Prestige|"+"</t>"; 	_f6 = "<t color='#FFCC99'>%1</t>"; 		_msg = _f5;
_msg = "<t size='0.8'>" + _msg + "</t>";
		_msg = _msg + (format [_f6,floor (missionnamespace getvariable "pisteet")]);
_msg = "<t size='0.8'>" + _msg + "</t>";
		_msg = _msg + _f + str (missionnamespace getvariable "SaOK_factories") + "</t>";
_msg = "<t size='0.8'>" + _msg + "</t>";

		_msg = _msg + _f2 + str (missionnamespace getvariable "SaOK_power") + "</t>";
_msg = "<t size='0.8'>" + _msg + "</t>";
		_msg = _msg + _f3 + str (missionnamespace getvariable "SaOK_pier") + "</t>";
_msg = "<t size='0.8'>" + _msg + "</t>";

		_msg = _msg + _f4 + str (missionnamespace getvariable "SaOK_stor") + "</t>"; 
	_msg = "<t size='0.8'>" + _msg + "</t>";
	 _pic0 = findDisplay 46 ctrlCreate ["RscBackground", -1];
	 _pic0 ctrlSetBackgroundColor [0.4,0.4,0.4,0.4];
     _pic0 ctrlSetPosition [safeZoneX,safeZoneY,0.075*safeZoneW,0.11*safeZoneH];
	  if (!isNil"UIBOXOFF") then {_pic0 ctrlShow false;};
     _pic0 ctrlCommit 0;
	 _pic0 call (missionnamespace getvariable "SAOKADDCTRL");
	 _pic3 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	 _pic3 ctrlSetStructuredText (parsetext _msg);
	 //_pic3 ctrlSetFontHeight (((1+safeZoneH)/(2.8181))*0.005);
     _pic3 ctrlSetPosition [safeZoneX,safeZoneY,0.1*safeZoneW,0.11*safeZoneH];
     _pic3 ctrlCommit 0;
     _pic3 call (missionnamespace getvariable "SAOKADDCTRL");
	 while {true} do { 		sleep 2; 		if (visiblemap || {vehicle player != player}) then { 		_pic3 ctrlSetStructuredText (parsetext ""); 		_pic3 ctrlCommit 0; 		_pic0 ctrlSetPosition [safeZoneX,safeZoneY,0,0];         _pic0 ctrlCommit 0; 		waitUntil {sleep 1;!visiblemap && {vehicle player == player}}; 		_pic0 ctrlSetPosition [safeZoneX,safeZoneY,0.075*safeZoneW,0.11*safeZoneH]; 		_pic0 ctrlCommit 0; 		}; 		_msg = _f5; 		_msg = _msg + (format [_f6,floor (missionnamespace getvariable "pisteet")]);
_msg = "<t size='0.8'>" + _msg + "</t>";
		_msg = _msg + _f + str (missionnamespace getvariable "SaOK_factories") + "</t>";
_msg = "<t size='0.8'>" + _msg + "</t>";
		_msg = _msg + _f2 + str (missionnamespace getvariable "SaOK_power") + "</t>";
_msg = "<t size='0.8'>" + _msg + "</t>";
		_msg = _msg + _f3 + str (missionnamespace getvariable "SaOK_pier") + "</t>";
_msg = "<t size='0.8'>" + _msg + "</t>";
		_msg = _msg + _f4 + str (missionnamespace getvariable "SaOK_stor") + "</t>";
		_msg = "<t size='0.8'>" + _msg + "</t>";
		_pic3 ctrlSetStructuredText (parsetext _msg); 		_pic3 ctrlCommit 0; 	 }; 	};
};
[] SPAWN _score;
_uppar = {
private ["_msg","_t"];
with uiNamespace do {
	private ["_pic0","_pic3"];
	disableserialization;
	_msg = "<t color='#FF9900'>" + format ["<img size='%2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa",((safezoneW/(2.4242))*1.1)]+ "HC Groups|"+"</t>"; 	_msg = _msg + (if (count (hcAllGroups player) == 0) then {"<t color='#FF0033'>" + format["%1",count (hcAllGroups player)] +"</t>"} else {format["<t color='#FFCC99'>%1</t>",count (hcAllGroups player)]}); 		if (isNil{missionnamespace getvariable "CIVMODE"}) then { 		_msg = _msg + "<t color='#FF9900'>" + "  Reinforcements|"+"</t>";	 		if (isNil{missionnamespace getvariable "AutoReplac"}) then { 		_t = (missionnamespace getvariable "REINFSTATE"); 		if (_t == "Stand By") then { 		_msg = _msg + "<t color='#003399'>" + _t +"</t>"; 		}; 		if (_t == "MIA") then { 		_msg = _msg + "<t color='#990000'>" + _t +"</t>"; 		}; 		if (_t == "BLOCKED") then { 		_msg = _msg + "<t color='#FF3366'>" + _t +"</t>"; 		}; 		if (_t == "En Route") then { 		_msg = _msg + "<t color='#66CC33'>" + _t +"</t>"; 		}; 		} else { 		_msg = _msg + "<t color='#FF0033'>SET OFF</t>"; 		}; 		} else { 		_msg = _msg + "<t color='#FF9900'>" + "  Undercover Mode|"+"</t>";	 		if (captive player) then { 		_msg = _msg + "<t color='#339900'>UNDETECTED</t>"; 		} else { 		_msg = _msg + "<t color='#FF0033'>IN DANGER</t>"; 		}; 		}; 		_msg = _msg + "<t color='#FF9900'>" + "  TIP|"+"</t>"; 		_msg = _msg + "<t color='#FFCC99'>" + (missionnamespace getvariable "RANDOMTIP") +"</t>"; 	 _pic0 = findDisplay 46 ctrlCreate ["RscBackground", -1];
		 if (!isNil"UIBOXOFF") then {_pic0 ctrlShow false;};
	 _pic0 ctrlSetBackgroundColor [0.4,0.4,0.4,0.4];      _pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH];      _pic0 ctrlCommit 0;
	_pic0 call (missionnamespace getvariable "SAOKADDCTRL");
	 _pic3 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	_msg = (format ["<t size='%1'>",((safezoneW/(2.4242))*0.9)]) + _msg + "</t>";
	 _pic3 ctrlSetStructuredText (parsetext _msg); 	 _pic3 ctrlSetFontHeight (((1+safeZoneH)/(2.8181))*0.03);      _pic3 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH];      _pic3 ctrlCommit 0;
_pic3 call (missionnamespace getvariable "SAOKADDCTRL");
	 while {true} do {
	 sleep 2;
		if (visiblemap || {vehicle player != player}) then {
		_pic3 ctrlSetStructuredText (parsetext "");
		_pic3 ctrlCommit 0;
		_pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY,0,0];
        _pic0 ctrlCommit 0;
		waitUntil {sleep 1;!visiblemap && {vehicle player == player}};
		_pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH];
		_pic0 ctrlCommit 0;
		}; 		_msg = "<t color='#FF9900'>" + format ["<img size='%2' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa",((safezoneW/(2.4242))*1.1)]+ "HC Groups|"+"</t>"; 		_msg = _msg + (if (count (hcAllGroups player) == 0) then {"<t color='#FF0033'>" + format["%1",count (hcAllGroups player)] +"</t>"} else {format["<t color='#FFCC99'>%1</t>",count (hcAllGroups player)]}); 		if (isNil{missionnamespace getvariable "CIVMODE"}) then { 		_msg = _msg + "<t color='#FF9900'>" + "  Reinforcements|"+"</t>";	 		if (isNil{missionnamespace getvariable "AutoReplac"}) then { 		_t = (missionnamespace getvariable "REINFSTATE"); 		if (_t == "Stand By") then { 		_msg = _msg + "<t color='#3366FF'>" + _t +"</t>"; 		}; 		if (_t == "MIA") then { 		_msg = _msg + "<t color='#990000'>" + _t +"</t>"; 		}; 		if (_t == "BLOCKED") then { 		_msg = _msg + "<t color='#FF3366'>" + _t +"</t>"; 		}; 		if (_t == "En Route") then { 		_msg = _msg + "<t color='#66CC33'>" + _t +"</t>"; 		}; 		} else { 		_msg = _msg + "<t color='#FF0033'>SET OFF</t>"; 		}; 		} else { 		_msg = _msg + "<t color='#FF9900'>" + "  Undercover Mode|"+"</t>";	 		if (captive player) then { 		_msg = _msg + "<t color='#339900'>UNDETECTED</t>"; 		} else { 		_msg = _msg + "<t color='#FF0033'>IN DANGER</t>"; 		}; 		}; 		_msg = _msg + "<t color='#FF9900'>" + "  TIP|"+"</t>"; 		_msg = _msg + "<t color='#FFCC99'>" + (missionnamespace getvariable "RANDOMTIP") +"</t>";
		_msg = (format ["<t size='%1'>",((safezoneW/(2.4242))*0.9)]) + _msg + "</t>";
		_pic3 ctrlSetStructuredText (parsetext _msg); 		_pic3 ctrlCommit 0; 	 };
	};
};
[] SPAWN _uppar;
_UAV = {
private ["_n","_col","_val","_s","_jaa","_d","_dir","_dN","_msg","_v","_c","_vP","_p","_AAdistance","_dd"];
with uiNamespace do {
	private ["_pic0","_pic3"];
	_AAdistance = (missionnamespace getvariable "DIFLEVEL") * 4;
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
	disableserialization;
	 _pic0 = findDisplay 46 ctrlCreate ["RscBackground", -1];
	  if (!isNil"UIBOXOFF") then {_pic0 ctrlShow false;};
	 _pic0 ctrlSetBackgroundColor [0.6,0.6,0.6,0.4];
     _p = if (vehicle player == player) then {[safeZoneX+0.15*safeZoneW,safeZoneY+(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)*2+0.01*safeZoneH]
		} else {
		[safeZoneX+0.15*safeZoneW,safeZoneY,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)*2+0.01*safeZoneH]
		};
	_pic0 ctrlSetPosition _p;
     _pic0 ctrlCommit 0;
	_pic0 call (missionnamespace getvariable "SAOKADDCTRL");
	 _pic3 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	 _pic3 ctrlSetStructuredText parsetext "";
	 _pic3 ctrlSetFontHeight (((1+safeZoneH)/(2.8181))*0.03);
     _pic3 ctrlSetPosition _p;
     _pic3 ctrlCommit 0;
	_pic3 call (missionnamespace getvariable "SAOKADDCTRL");
	 while {true} do {
		while {isNil{missionnamespace getvariable "AAclose"} || {!isNil{missionnamespace getvariable "IFENABLED"}} || {{_x in ([] CALL (missionnamespace getvariable "SAOKRETURNPROG"))} count ["RadarS","Radar"] > 0}} do {
		sleep 1;
		if (visiblemap) then {
		_pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY+(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH,0,0];
		_pic0 ctrlCommit 0;
		_pic3 ctrlSetStructuredText parsetext "";
		_pic3 ctrlCommit 0;
		waitUntil {sleep 1; !visiblemap};
		_pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY+(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)*2+0.01*safeZoneH];
		_pic0 ctrlCommit 0;
		};
		_msg = "";
		_v = (player nearEntities [["LandVehicle","Air"],1200]);
		_c = count _v - 1;
		_vP = vehicle player;
		for "_i" from 0 to _c do {
		private ["_xx"];
	_xx = _v select _i;
	_n = 1;
	if !(typeof _xx iskindof "ParachuteBase") then {_n = 0;};
	if (alive _xx && {count crew _xx > _n} && {side ((crew _xx) call (missionnamespace getvariable "RETURNRANDOM")) == EAST} && {!(typeof _xx iskindof "StaticWeapon")} && {round (speed _xx) > 0}) then {
	_d = _vP distance _xx;
	_jaa = 0.01;
	_dir = round ([player, _xx] call (missionnamespace getvariable "SAOKDIRT"));
	_dN =  _dir call _dd;
	_col = "<t color='#A0A0A0'>";
	_val = 2;
	_s = "km";
	if (_d >= 1000) then {_col = "<t color='#F8F8F8'>"; _val = (round ((_vP distance _xx) * _jaa)) * 0.1;};
	if (_d < 1000) then {_s = "m";_jaa = 1;_col = "<t color='#FFFF33'>";_val = round ((_vP distance _xx) * _jaa);};
	if (_d < 750) then {_s = "m";_jaa = 1;_col = "<t color='#FFCC00'>";_val = round ((_vP distance _xx) * _jaa);_xx forcespeed -1;};
	if (_d < 250) then {_s = "m";_jaa = 1;_col = "<t color='#FF3300'>";_val = round ((_vP distance _xx) * _jaa);if ((missionnamespace getvariable "DIFLEVEL") < 1 && {typeof _xx isKindOf "LandVehicle"}) then {_xx forcespeed 3;};};
	_msg = _msg + _col + _dN + " "+ format ["<img size='%2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> typeof _xx >> "picture")),((safezoneW/(2.4242))*1.1)] + (format [" %1%3, %2km/h",_val, round (speed _xx),_s])+"</t>"+" "; 
	};
	sleep 0.1;
	};
		_p = if (vehicle player == player) then {[safeZoneX+0.15*safeZoneW,safeZoneY+(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)*2+0.01*safeZoneH]
		} else {
		[safeZoneX+0.15*safeZoneW,safeZoneY,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)*2+0.01*safeZoneH]
		};
		if (_msg == "") then {_p set [2,0];_p set [3,0];};
		_pic0 ctrlSetPosition _p;
		_pic0 ctrlCommit 0;
		_pic3 ctrlSetPosition _p;
		_msg = (format ["<t size='%1'>",((safezoneW/(2.4242))*0.9)]) + _msg + "</t>";
		_pic3 ctrlSetStructuredText parsetext _msg;
		_pic3 ctrlCommit 0;
		};
		waitUntil {sleep 3;!(isNil{missionnamespace getvariable "AAclose"} || {visiblemap} || {!isNil{missionnamespace getvariable "IFENABLED"}} || {{_x in ([] CALL (missionnamespace getvariable "SAOKRETURNPROG"))} count ["RadarS","Radar"] > 0})};
		if (visiblemap) then {
		_pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY+(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH,0,0];
		_pic0 ctrlCommit 0;
		_pic3 ctrlSetStructuredText parsetext "";
		_pic3 ctrlCommit 0;
		waitUntil {sleep 1; !visiblemap};
		};
		_msg = "<t color='#FF3300'>" + format [" <img size='%2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> "B_UAV_02_CAS_F" >> "picture")),((safezoneW/(2.4242))*1.1)]+"UAV intel unavailable, CSAT AA"+format [" <img size='%2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "o_art" >> "icon")),((safezoneW/(2.4242))*1.1)]+" within "+(format ["%1",_AAdistance])+"km radius</t>";
		_p = if (vehicle player == player) then {
		[safeZoneX+0.15*safeZoneW,safeZoneY+(((1+safeZoneH)/(2.8181))*0.03)+0.01*safeZoneH,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)*2+0.01*safeZoneH]
		} else {
		[safeZoneX+0.15*safeZoneW,safeZoneY,0.4*safeZoneW,(((1+safeZoneH)/(2.8181))*0.05)*2+0.01*safeZoneH]
		};
		//if (_msg == "") then {_p set [2,0];_p set [3,0];};
		_pic3 ctrlSetPosition _p;
		_msg = (format ["<t size='%1'>",((safezoneW/(2.4242))*0.9)]) + _msg + "</t>";
		_pic3 ctrlSetStructuredText parsetext _msg;
		_pic3 ctrlCommit 0;
		_pic0 ctrlSetPosition _p;
		_pic0 ctrlCommit 0;
		};
	};
};
[] SPAWN _UAV;
