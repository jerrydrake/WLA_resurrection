private ["_blueGreen","_Red","_guardposts","_camps","_bG","_r","_bGMs","_rMs","_Lna","_header","_F","_E","_G","_C","_mt","_in","_hint","_odds","_na","_hint2","_HEADLIN","_CEN"];
_HEADLIN = _this select 0;
_CEN = _this select 1;
_F = [];
_E = [];
_G = [];
_C = if (count _this > 3) then {_this select 3} else {[]};
_nearbyLocations = nearestLocations [_CEN,["Name"], 1700];
{
if (!isNil{_x getvariable "VZ"} && {isNil{_x getvariable "ACTIVE"}}  && {(_x getvariable "Mcolor") != "ColorGrey"}) then {
if ((_x getvariable "Mcolor") != "ColorRed") then {_F pushback _x;} else {_E pushback _x;};
};
} foreach _nearbyLocations;
{
if (isNil{(_x getvariable "Post") getvariable "ACTIVE"}) then {
_G pushback (_x getvariable "Post");
};
} foreach (nearestLocations [_CEN, ["PostG","PostR"], 1700]);

{
_C pushback (_x getvariable "Marker");
} foreach (nearestLocations [_CEN, ["CampR","CampB"], 1700]);

//MARKER ARRAYS
_blueGreen = _F;
_red = _E;
_guardposts = _G;
_camps = _C;
//TEST ZONE
//CLASSES IN THOSE && FIGHT MARKERS
_bG = [];
_r = [];
_bGMs = [];
_rMs = [];
{_mt = (_x getvariable "Mtype"); _bG = _bG + ((_x CALL SAOKZONEDR) CALL APUFF);{_bGMs pushback _mt;} foreach ((_x CALL SAOKZONEDR) CALL APUFF);} foreach _blueGreen;
{_mt = (_x getvariable "Mtype"); _r = _r + ((_x CALL SAOKZONEDR) CALL APUFF);{_rMs pushback _mt;} foreach ((_x CALL SAOKZONEDR) CALL APUFF);} foreach _red;
/////////
{
private ["_mText"];
_mText = if (random 1 < 0.5) then {"_motor_inf"} else {"_inf"};
if (typename _x == "ARRAY") then {
if (count _x == 2) then {
_bG pushback (_x select 0);_bGMs pushback (_x select 1);
} else {
_r pushback (_x select 0);_rMs pushback (_x select 1);
};
} else {
if (_x == "INFB" || {_x == "INFR"} || {_x == "INFI"}) then {
if (_x == "INFI") then {_bG set [count _bG, "I_Infantry"];_bGMs set [count _bGMs, ("n"+_mText)];};
if (_x == "INFB") then {_bG = _bG + ["B_Infantry"];_bGMs = _bGMs + [("b"+_mText)];};
if (_x == "INFR") then {_r set [count _r,"O_Infantry"];_rMs set [count _rMs, ("o"+_mText)];};
} else {
if (getmarkercolor _x == "ColorRed") then {
_r set [count _r,"O_Infantry"];_rMs set [count _rMs, ("o"+_mText)];
} else {
_bG set [count _bG, "I_Infantry"];_bGMs set [count _bGMs, ("n"+_mText)];
};
};
};
} foreach _camps;

///////////
{
private ["_mText"];
_mText = if (random 1 < 0.5) then {"_motor_inf"} else {"_inf"};
if ((getmarkercolor (_x getvariable "Gmark")) == "ColorRed") then {
_in = 0;
if (!isNil{_x getvariable "MG-Guard"}) then {_r set [count _r, "O_MGgroup"];_in = 1;};
if (!isNil{_x getvariable "AA-Guard"}) then {_r set [count _r, "O_AAgroup"];_in = 1;};
if (!isNil{_x getvariable "AT-Guard"}) then {_r set [count _r, "O_ATgroup"];_in = 1;};
if (!isNil{_x getvariable "Sniper-Guard"}) then {_r set [count _r, "O_Snipergroup"];_in = 1;};
if (!isNil{_x getvariable "Medic-Guard"}) then {_r set [count _r, "O_Medicgroup"];_in = 1;};
if (_in == 1) then {_rMs set [count _rMs, ("o"+_mText)];};
{
_r set [count _r, (_x select 0)];_rMs set [count _rMs,"o_installation"];
} foreach (_x getvariable "StaticW");
} else {
_in = 0;
if (!isNil{_x getvariable "MG-Guard"}) then {_bG set [count _bG, "I_MGgroup"];_in = 1;};
if (!isNil{_x getvariable "AA-Guard"}) then {_bG set [count _bG, "I_AAgroup"];_in = 1;};
if (!isNil{_x getvariable "AT-Guard"}) then {_bG set [count _bG, "I_ATgroup"];_in = 1;};
if (!isNil{_x getvariable "Sniper-Guard"}) then {_bG set [count _bG, "I_Snipergroup"];_in = 1;};
if (!isNil{_x getvariable "Medic-Guard"}) then {_bG set [count _bG, "I_Medicgroup"];_in = 1;};
if (_in == 1) then {_bGMs set [count _bGMs, ("n"+_mText)];};
{
_bG pushback (_x select 0);_bGMs set [count _bGMs,"n_installation"];
} foreach (_x getvariable "StaticW");
};
} foreach _guardposts;
/////////
//VASTAKKAIN o_unknown
_Lna = _CEN CALL NEARESTLOCATIONNAME;
_header = format [" near %1",_Lna];

_hint = "<t color='#FFCC66'>" + format ["<img size='1.4' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"]+" "+_HEADLIN + format [" [%1]",toUpper(_Lna)]+"</t>" + "<br/>";
{_hint = _hint + format ["<img size='1.4' color='#00FF00' image='%1'/>",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach _bGMs;
if (count (_this select 2) > 0) then {_hint = _hint + " N x" + format ["<img size='1.3' color='#00FF00' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "n_unknown" >> "icon"))];};
_hint = _hint + "<br/>"+" vs "+"<br/>";
{_hint = _hint + format ["<img size='1.4' color='#ff0000' image='%1'/>",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach _rMs;
if (count (_this select 2) == 0) then {_hint = _hint + " N x" + format ["<img size='1.3' color='#ff0000' image='%1'/>",(getText (configfile >> "CfgMarkers" >> "o_unknown" >> "icon"))];};
//<img src='%1' width='2' height='2'>
//<img size='0.5' color='#00FF00' image='%1'/>
//hint parseText _hint;
[_hint] SPAWN SAOKBOXHINT;
_hint2 = "<br/>"+ "<br/>"+ "<t color='#FFCC66'>" + "Expected Forces"+"</t>" + "<br/>"+ "<br/>";
{
_odds = _x call battleodds;
_na = if (_odds select 3 != "") then {_odds select 3} else {(getText (configfile >> "CfgVehicles" >> _x >> "displayName"))};
_hint2 = _hint2 + format ["%1",_na] +"<br/>";
} foreach _bG;
if (count (_this select 2) > 0) then {_hint2 = _hint2 + "1-3 friendly vehicles and infanty teams";};
_hint2 = _hint2 +"<br/>"+" vs "+"<br/>"+"<br/>";
{
_odds = _x call battleodds;
_na = if (_odds select 3 != "") then {_odds select 3} else {(getText (configfile >> "CfgVehicles" >> _x >> "displayName"))};
_hint2 = _hint2 + format ["%1",_na] +"<br/>";
} foreach _r;
if (count (_this select 2) == 0) then {_hint2 = _hint2 + "1-3 unknown hostile vehicles and infanty teams";};

[_hint2,(if (!isnil"_bGMs") then {_bGMs} else {[]}),(if (!isnil"_rMs") then {_rMs} else {[]})]
