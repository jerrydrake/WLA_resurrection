private ["_blueGreen","_Red","_guardposts","_camps","_bG","_r","_bGMs","_rMs","_Lna","_header","_result","_mt","_in","_hint","_forEachIndex","_arr","_totalSR","_totalSbG","_m","_ms","_c","_Rclas","_all","_arryy","_del","_timesS","_rGGG","_typesbG","_strbG","_typesR","_strR","_raa","_odds","_na","_HEADLIN","_CEN","_ddd","_f","_n3","_nnd","_ammoDD","_n","_hil","_deAT","_ddat","_nnnnn","_guardpostsB"];
//MARKER ARRAYS
_blueGreen = _this select 0;
_red = _this select 1;
_guardposts = _this select 2;
_camps = _this select 3;
_result = "";
_HEADLIN = _this select 4;
_CEN = _this select 5;
//TEST ZONE
//CLASSES IN THOSE && FIGHT MARKERS
_bG = [];
_r = [];
_bGMs = [];
_rMs = [];
{_mt = (_x getvariable "Mtype"); _bG = _bG + ((_x CALL SAOKZONEDR) CALL APUFF);{_bGMs pushback _mt;} foreach ((_x CALL SAOKZONEDR) CALL APUFF);} foreach _blueGreen;
{_mt =(_x getvariable "Mtype"); _r = _r + ((_x CALL SAOKZONEDR) CALL APUFF);{_rMs pushback _mt;} foreach ((_x CALL SAOKZONEDR) CALL APUFF);} foreach _red;
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
//VASTAKKAIN
_Lna = _CEN CALL NEARESTLOCATIONNAME;
_header = format [" near %1",_Lna];


_hint = "<t color='#FFCC66'>" + format ["<img size='1.4' image='%1'/>","\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa"]+" "+ _HEADLIN + format [" [%1]",toUpper(_Lna)] +"</t>" + "<br/>";
{_hint = _hint + format ["<img size='1.4' color='#00FF00' image='%1'/>",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach _bGMs;
_hint = _hint + "<br/>"+" vs "+"<br/>";
{_hint = _hint + format ["<img size='1.4' color='#ff0000' image='%1'/>",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach _rMs;

_Rclas = [];
_raa = [4,2,3] call RETURNRANDOM;

_guardpostsB = [];
{if (getmarkercolor (_x getvariable "Gmark") == "ColorGreen") then {_guardpostsB set [count _guardpostsB, _x];};} foreach _guardposts;
_guardpostsR = [];
{if (getmarkercolor (_x getvariable "Gmark") == "ColorRed") then {_guardpostsR set [count _guardpostsR, _x];};} foreach _guardposts;

_postD = {
private ["_f","_c","_uk"];
_f = 0.2;
_uk = 0.2;
switch (typeof _this) do {
case "Land_BagBunker_Small_F": {_uk = 0.4;};
case "Land_HBarrierTower_F": {_uk = 0.7;};
case "Land_BagBunker_Large_F": {_uk = 0.7;};
case "Land_BagBunker_Tower_F": {_uk = 0.7;};
case "Land_Cargo_Patrol_V2_F": {_uk = 1.3;};
case "Land_Cargo_Tower_V3_F": {_uk = 1.4;};
case "Land_Cargo_HQ_V1_F": {_uk = 1.5;};
case "trench_tank1": {_uk = 1;};
case "trench_big1": {_uk = 2;};
case "trench_mg1": {_uk = 1.7;};
case "trench_mg2": {_uk = 1.7;};
case "trench_mortar": {_uk = 0.2;};
};
_f = (count (_this getvariable "StaticO"))*0.05 + _uk;
_f
};
_gPfF = 0;
{_gPfF = _gPfF + (_x call _postD);} foreach _guardpostsB;
if (count _guardpostsB > 0) then {_gPfF = _gPfF / (count _guardpostsB);};
_gPfR = 0;
{_gPfR = _gPfR + (_x call _postD);} foreach _guardpostsR;
if (count _guardpostsR > 0) then {_gPfR = _gPfR / (count _guardpostsR);};


while {_raa > 0 && {count _bGMs > 0} && {count _rMs > 0}} do {

//STREGHTS AND TYPES
_typesbG = [0,0,0,0,0,0,0,0,0];
_strbG = [0,0,0,0,0,0,0,0,0];
_typesR = [0,0,0,0,0,0,0,0,0];
_strR = [0,0,0,0,0,0,0,0,0];
{
_arr = _x call battleodds;
_k = 1;
if (_x != "") then {_k = _gPfF;};
_typesbG set [(_arr select 0), ((_typesbG select (_arr select 0))+1)];
{_strbG set [_forEachIndex, ((_strbG select _forEachIndex)+(_x*_k))];} foreach (_arr select 1);
} foreach _bG;
{
_arr = _x call battleodds;
_k = 1;
if (_x != "") then {_k = _gPfR;};
_typesR set [(_arr select 0), ((_typesR select (_arr select 0))+1)];
{_strR set [_forEachIndex, ((_strR select _forEachIndex)+(_x*_k))];} foreach (_arr select 1);
} foreach _r;
//NOLLAA EXTRAT
{if (_x == 0) then {_strR set [_forEachIndex, 0];};} foreach _typesbG;
{if (_x == 0) then {_strbG set [_forEachIndex, 0];};} foreach _typesR;


//SUMMATTU VOIMA
_totalSbG = 0;
_totalSR = 0;
{_totalSR = _totalSR + _x;} foreach _strR;
{_totalSbG = _totalSbG + _x;} foreach _strbG;
//hint format ["%1 %2",_totalSR,_totalSbG];
//TODENNAKOISYYS VOITTAJASTA
_result = "ColorRed";
if (_totalSbG != 0 && {random (_totalSR / _totalSbG) < 0.5}) then {_result = "ColorBlue";};
_raa = _raa - 1;
if (_totalSR > _totalSbG) then {
//RED 
if !(((random 1) * _totalSR) < _totalSbG) then {
//GREEN !WIN

if (count _blueGreen > 0) then {
_m = _blueGreen call RETURNRANDOM;
_ms = ((_m CALL SAOKZONEDR) CALL APUFF);
_c = (count _ms - 1);
_in = floor (random _c);
if (isNil"_in" || {_in < 0}) exitWith {};
_Rclas pushback (_ms select _in);
_hil = _ms deleteAt _in;
_deAT = [];
_ddat = _m call SAOKZONEDRNEW;
_hil = _ddat deleteAt _in;
{
_nnd = _x;
_ammoDD = _x select 1;
if (typename _ammoDD == "ARRAY") then {{if (count _x > 1 && {typename (_x select 1) == "SCALAR"}) then {_ddd = floor (random (_x select 1));_ammoDD set [_foreachIndex,[(_x select 0),_ddd]];};} foreach _ammoDD;};_nnd = _x;
while {{(_x select 1) == 0} count _ammoDD > 0} do {{if ((_x select 1) == 0) exitWith {_uii = _ammoDD deleteAt _foreachindex;};} foreach _ammoDD;};
_nnd set [1,_ammoDD];
_f = (_nnd select 2) - random 0.2;
if (_f < 0) then {_f = 0;};
_nnd set [2,_f];
_n3 =(_nnd select 3) + random 0.2;
if (_n3 > 0.8) then {_n3 = 0.8;};
_nnd set [3,_n3];
_deAT pushback _nnd;
} foreach _ddat;
if (count _ms < 1) then {_m CALL SAOKZONED;_n = _m CALL SAOKZONEM; _blueGreen = _blueGreen - [_m];missionnamespace setvariable [(_m getvariable "IDCODE"),nil];_m call resFexit;deleteLocation _m;} else {[_m,_deAT] CALL SAOKZONED;};
};
if (random 1 < 0.5 && {count _guardpostsB > 0} && {DIFLEVEL > 0.5}) then {
_timesS = [0,1,2] call RETURNRANDOM;
while {_timesS > 0} do {
_timesS = _timesS - 1;
_rGGG = _guardpostsB call RETURNRANDOM;
_all = [];
{
_all set [count _all,(_x select 0)];
} foreach (_rGGG getvariable "StaticW");
{
if (!isNil{_rGGG getvariable _x}) then {_all set [count _all,_x];};
} foreach ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"];
if (count _all > 0) then {
_del = _all call RETURNRANDOM;
if (_del in ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"]) then {
_rGGG setvariable [_del, nil];
if (_del == "MG-Guard") then {_Rclas set [count _Rclas,"I_MGgroup"];};
if (_del == "AA-Guard") then {_Rclas set [count _Rclas,"I_AAgroup"];};
if (_del == "AT-Guard") then {_Rclas set [count _Rclas,"I_ATgroup"];};
if (_del == "Sniper-Guard") then {_Rclas set [count _Rclas,"I_Snipergroup"];};
if (_del == "Medic-Guard") then {_Rclas set [count _Rclas,"I_Medicgroup"];};
} else {
_Rclas set [count _Rclas,_del];
_arryy = _rGGG getvariable "StaticW";
{
if (_del == _x select 0) exitWith {
_deAT = _arryy deleteAt _forEachIndex;
};
} foreach _arryy;
_rGGG setvariable ["StaticW",_arryy];
};
};
_rGGG setvariable ["Reset",true];
};
};
} else {
//RED !WIN
if (count _red > 0) then {
_m = _red call RETURNRANDOM;
_ms = ((_m CALL SAOKZONEDR) CALL APUFF);
_c = (count _ms - 1);
_in = floor (random _c);
if (isNil"_in" || {_in < 0}) exitWith {};
_Rclas pushback (_ms select _in);
_hil = _ms deleteAt _in;
_deAT = [];
_ddat = _m call SAOKZONEDRNEW;
_hil = _ddat deleteAt _in;
{
_nnd = _x;
_ammoDD = _x select 1;
if (typename _ammoDD == "ARRAY") then {{if (count _x > 1 && {typename (_x select 1) == "SCALAR"}) then {_ddd = floor (random (_x select 1));_ammoDD set [_foreachIndex,[(_x select 0),_ddd]];};} foreach _ammoDD;};_nnd = _x;
while {{(_x select 1) == 0} count _ammoDD > 0} do {{if ((_x select 1) == 0) exitWith {_uii = _ammoDD deleteAt _foreachindex;};} foreach _ammoDD;};
_nnd set [1,_ammoDD];
_f = (_nnd select 2) - random 0.2;
if (_f < 0) then {_f = 0;};
_nnd set [2,_f];
_n3 =(_nnd select 3) + random 0.2;
if (_n3 > 0.8) then {_n3 = 0.8;};
_nnd set [3,_n3];
_deAT pushback _nnd;
} foreach _ddat;
if (count _ms < 1) then {_m CALL SAOKZONED;_n = _m CALL SAOKZONEM; _red = _red - [_m];missionnamespace setvariable [(_m getvariable "IDCODE"),nil];_m call resFexit;deleteLocation _m;} else {[_m,_deAT] CALL SAOKZONED;};
};
};
} else {
//BLUE
if !(((random 1) * _totalSbG) < _totalSR) then {
//RED !WIN
if (count _red > 0) then {
_m = _red call RETURNRANDOM;
_ms = ((_m CALL SAOKZONEDR) CALL APUFF);
_c = (count _ms - 1);
_in = floor (random _c);
if (isNil"_in" || {_in < 0}) exitWith {};
_Rclas pushback (_ms select _in);
_hil = _ms deleteAt _in;
_deAT = [];
_ddat = _m call SAOKZONEDRNEW;
_hil = _ddat deleteAt _in;
{
_nnd = _x;
_ammoDD = _x select 1;
if (typename _ammoDD == "ARRAY") then {{if (count _x > 1 && {typename (_x select 1) == "SCALAR"}) then {_ddd = floor (random (_x select 1));_ammoDD set [_foreachIndex,[(_x select 0),_ddd]];};} foreach _ammoDD;};_nnd = _x;
while {{(_x select 1) == 0} count _ammoDD > 0} do {{if ((_x select 1) == 0) exitWith {_uii = _ammoDD deleteAt _foreachindex;};} foreach _ammoDD;};
_nnd set [1,_ammoDD];
_f = (_nnd select 2) - random 0.2;
if (_f < 0) then {_f = 0;};
_nnd set [2,_f];
_n3 =(_nnd select 3) + random 0.2;
if (_n3 > 0.8) then {_n3 = 0.8;};
_nnd set [3,_n3];
_deAT pushback _nnd;
} foreach _ddat;
if (count _ms < 1) then {_m CALL SAOKZONED;_n = _m CALL SAOKZONEM; _red = _red - [_m];missionnamespace setvariable [(_m getvariable "IDCODE"),nil];_m call resFexit;deleteLocation _m;} else {[_m,_deAT] CALL SAOKZONED;};
};
} else {
if (count _blueGreen > 0) then {
_m = _blueGreen call RETURNRANDOM;
_ms = ((_m CALL SAOKZONEDR) CALL APUFF);
_c = (count _ms - 1);
_in = floor (random _c);
if (isNil"_in" || {_in < 0}) exitWith {};
_Rclas pushback (_ms select _in);
_hil = _ms deleteAt _in;
_deAT = [];
_ddat = _m call SAOKZONEDRNEW;
_hil = _ddat deleteAt _in;
{
_nnd = _x;
_ammoDD = _x select 1;
if (typename _ammoDD == "ARRAY") then {{if (count _x > 1 && {typename (_x select 1) == "SCALAR"}) then {_ddd = floor (random (_x select 1));_ammoDD set [_foreachIndex,[(_x select 0),_ddd]];};} foreach _ammoDD;};_nnd = _x;
while {{(_x select 1) == 0} count _ammoDD > 0} do {{if ((_x select 1) == 0) exitWith {_uii = _ammoDD deleteAt _foreachindex;};} foreach _ammoDD;};
_nnd set [1,_ammoDD];
_f = (_nnd select 2) - random 0.2;
if (_f < 0) then {_f = 0;};
_nnd set [2,_f];
_n3 =(_nnd select 3) + random 0.2;
if (_n3 > 0.8) then {_n3 = 0.8;};
_nnd set [3,_n3];
_deAT pushback _nnd;
} foreach _ddat;
if (count _ms < 1) then {_m CALL SAOKZONED;_n = _m CALL SAOKZONEM; _blueGreen = _blueGreen - [_m];missionnamespace setvariable [(_m getvariable "IDCODE"),nil];_m call resFexit;deleteLocation _m;} else {[_m,_deAT] CALL SAOKZONED;};
};
if (random 1 < 0.5 && {count _guardpostsB > 0} && {DIFLEVEL > 0.5}) then {
_timesS = [0,1,2] call RETURNRANDOM;
while {_timesS > 0} do {
_timesS = _timesS - 1;
_rGGG = _guardpostsB call RETURNRANDOM;
_all = [];
{
_all set [count _all,(_x select 0)];
} foreach (_rGGG getvariable "StaticW");
{
if (!isNil{_rGGG getvariable _x}) then {_all set [count _all,_x];};
} foreach ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"];
if (count _all > 0) then {
_del = _all call RETURNRANDOM;
if (_del in ["MG-Guard","AA-Guard","AT-Guard","Sniper-Guard","Medic-Guard"]) then {
_rGGG setvariable [_del, nil];
if (_del == "MG-Guard") then {_Rclas set [count _Rclas,"I_MGgroup"];};
if (_del == "AA-Guard") then {_Rclas set [count _Rclas,"I_AAgroup"];};
if (_del == "AT-Guard") then {_Rclas set [count _Rclas,"I_ATgroup"];};
if (_del == "Sniper-Guard") then {_Rclas set [count _Rclas,"I_Snipergroup"];};
if (_del == "Medic-Guard") then {_Rclas set [count _Rclas,"I_Medicgroup"];};
} else {
_Rclas set [count _Rclas,_del];
_arryy = _rGGG getvariable "StaticW";
{
if (_del == _x select 0) exitWith {
_deAT = _arryy deleteAt _forEachIndex;
};
} foreach _arryy;
_rGGG setvariable ["StaticW",_arryy];
};
_rGGG setvariable ["Reset",true];
};
};
};
};
};
sleep 0.1;
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
};

//CLASSES IN THOSE && FIGHT MARKERS AFTER THE BATTLE
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
//TULOS 
//hint format ["%1 %2",_bGMs,_rMs];

_hint = _hint + "<t color='#FFCC66'>" + "<br/>REMAINING<br/>"+"</t>";
_nnnnn = 0;
{_hint = _hint + format ["<img size='1.4' color='#00FF00' image='%1'/>",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];_nnnnn = 1;} foreach _bGMs;
if (_nnnnn > 0) then {_hint = _hint + "<br/>";};
{_hint = _hint + format ["<img size='1.4' color='#ff0000' image='%1'/>",(getText (configfile >> "CfgMarkers" >> _x >> "icon"))];} foreach _rMs;
_hint = _hint + "<br/>";
_hint = _hint + "<t color='#FFCC66'>" + "<br/>LOSSES<br/>" +"</t>";
{
_odds = _x call battleodds;
_na = if (_odds select 3 != "") then {_odds select 3} else {(getText (configfile >> "CfgVehicles" >> _x >> "displayName"))};
if (_odds select 2 == "") then {
_hint = _hint + format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgVehicles" >> _x >> "picture"))];
} else {
_hint = _hint + format ["<img size='1.2' image='%1'/>",(getText (configfile >> "CfgMarkers" >> (_odds select 2) >> "icon"))];
};
_hint = _hint + " "+ format ["%1",_na]+"<br/>";
} foreach _Rclas;
//hint parseText _hint;
[_hint] SPAWN SAOKBOXHINT;
{
_deAT = [];
_ddat = _x call SAOKZONEDRNEW;
{
_nnd = _x;
if (typename _x == "ARRAY" && {count _x > 2}) then {
_ammoDD = _x select 1;
if (typename _ammoDD == "ARRAY") then {{if (count _x > 1 && {typename (_x select 1) == "SCALAR"}) then {_ddd = floor (random (_x select 1));_ammoDD set [_foreachIndex,[(_x select 0),_ddd]];};} foreach _ammoDD;};
while {{(_x select 1) == 0} count _ammoDD > 0} do {{if ((_x select 1) == 0) exitWith {_uii = _ammoDD deleteAt _foreachindex;};} foreach _ammoDD;};
_nnd set [1,_ammoDD];
_f = (_nnd select 2) - (random 0.2);
if (_f < 0) then {_f = 0;};
_nnd set [2,_f];
_n3 =(_nnd select 3) + (random 0.2);
if (_n3 > 0.8) then {_n3 = 0.8;};
_nnd set [3,_n3];
};
_deAT pushback _nnd;
} foreach _ddat;
if (count _deAT < 1) then {_x CALL SAOKZONED;_n = _x CALL SAOKZONEM; deletemarker _x;} else {[_x,_deAT] CALL SAOKZONED;};
} foreach _blueGreen + _red;
_result