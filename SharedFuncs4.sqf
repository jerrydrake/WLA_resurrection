SAOKADDCTRL = {
_o = if (!isNil{uinamespace getvariable "SAcont"}) then {uinamespace getvariable "SAcont"} else {[]};
_o pushback _this;
uinamespace setvariable ["SAcont",_o];
};
/*
playactions
carriedStill
Acts_SittingWounded_breath
Acts_SittingWounded_loop
Acts_SittingWounded_wave
*/
SAOKSTARTDIASET = {
switch _this do {
case "GUI Boxes": {
	if ((lbCurSel 1506) == 0) then {UIBOXOFF = 1;};
	if ((lbCurSel 1506) == 1) then {UIBOXOFF = nil;};
{
disableserialization;if (ctrlType _x == 0) then {
if (!isNil"UIBOXOFF") then {_x ctrlShow false;} else {_x ctrlShow true;};
};
} foreach (uinamespace getvariable "SAcont");
};
case "Platoon Radio": {
	if ((lbCurSel 1506) == 0) then {NoRadioVV = 1;};
	if ((lbCurSel 1506) == 1) then {NoRadioVV = nil;};
};
case "Advanced FirstAid": {
	if ((lbCurSel 1506) == 0) then {TeDam = nil;};
	if ((lbCurSel 1506) == 1) then {TeDam = 1;};
};
case "Long Walls": {
	if ((lbCurSel 1506) == 0) then {Bwalll = nil;};
	if ((lbCurSel 1506) == 1) then {Bwalll = 1;};
};
case "Asset Unlocking": {
	SAOKSARN set [0, (lbCurSel 1506)];
	if ((lbCurSel 1506) == 0) then {Zorro = 0;};
	if ((lbCurSel 1506) == 1) then {Zorro = 1;};
};
case "Player Respawning": {
	SAOKSARN set [1, (lbCurSel 1506)];
	if ((lbCurSel 1506) == 0) then {Bumblebeeman = 0; missionnamespace setvariable ["ResTT",25];};
	if ((lbCurSel 1506) == 1) then {Bumblebeeman = 0; missionnamespace setvariable ["ResTT",10];};
	if ((lbCurSel 1506) == 2) then {Bumblebeeman = 1; missionnamespace setvariable ["ResTT",nil];};
};
case "Start Time": {
	SAOKSARN set [2, (lbCurSel 1506)];
	if ((lbCurSel 1506) == 0) then {Stime = 13;};
	if ((lbCurSel 1506) == 1) then {Stime = 18;};
	if ((lbCurSel 1506) == 2) then {Stime = 0;};
	if ((lbCurSel 1506) == 3) then {Stime = 8;};
	if ((lbCurSel 1506) == 4) then {Stime = random 24;};
	if ((lbCurSel 1506) == 5) then {Stime = -1;};
};
case "Dynamic Weather": {
if ((lbCurSel 1506) == 0) then {FogOFF = nil; RainyW = nil;DisW = nil;};
if ((lbCurSel 1506) == 1) then {FogOFF = true; RainyW = nil;DisW = nil;};
if ((lbCurSel 1506) == 2) then {FogOFF = nil; RainyW = true;DisW = nil;};
if ((lbCurSel 1506) == 3) then {FogOFF = true; RainyW = nil;DisW = 1;};
if ((lbCurSel 1506) == 4) then {FogOFF = true; RainyW = nil;DisW = 2;};
};
case "Player Respawning": {
if ((lbCurSel 1506) == 0) then {missionnamespace setvariable ["NewRespawn",nil];};
if ((lbCurSel 1506) == 1) then {missionnamespace setvariable ["NewRespawn",1];};
};
case "Player Needs": {
if ((lbCurSel 1506) == 0) then {PNEEDS = true;};
if ((lbCurSel 1506) == 1) then {PNEEDS = nil;};
};
case "Constructing": {
if ((lbCurSel 1506) == 0) then {GUARDLIM = true;};
if ((lbCurSel 1506) == 1) then {GUARDLIM = false;};
};
case "Ambient Life": {
if ((lbCurSel 1506) == 0) then {MULTLIFE=2;HITEMDIS = 40;};
if ((lbCurSel 1506) == 1) then {MULTLIFE=1;HITEMDIS = 35;};
if ((lbCurSel 1506) == 2) then {MULTLIFE=0;HITEMDIS = 30;};
if ((lbCurSel 1506) == 3) then {MULTLIFE=-0.5;HITEMDIS = 25;};
};
case "Life Range": {
if ((lbCurSel 1506) == 0) then {DISVAR = 1000;};
if ((lbCurSel 1506) == 1) then {DISVAR = 1100;};
if ((lbCurSel 1506) == 2) then {DISVAR = 1200;};
if ((lbCurSel 1506) == 3) then {DISVAR = 1300;};
if ((lbCurSel 1506) == 4) then {DISVAR = 1400;};
if ((lbCurSel 1506) == 5) then {DISVAR = 1500;};
};
case "PP-Effects": {
SAOKSARN set [3, (lbCurSel 1506)];
SAOKPP = (lbText [1506, (lbCurSel 1506)]);
[(lbText [1506, (lbCurSel 1506)])] CALL BIS_fnc_setPPeffectTemplate;
};
case "AI Artillery": {
if ((lbCurSel 1506) == 0) then {VarDisableArty = nil;};
if ((lbCurSel 1506) == 1) then {VarDisableArty = true;};
};
case "Autosave": {
if ((lbCurSel 1506) == 0) then {missionnamespace setvariable ["Autosave",nil];};
if ((lbCurSel 1506) == 1) then {missionnamespace setvariable ["Autosave",60];};
if ((lbCurSel 1506) == 2) then {missionnamespace setvariable ["Autosave",45];};
if ((lbCurSel 1506) == 3) then {missionnamespace setvariable ["Autosave",30];};
if ((lbCurSel 1506) == 4) then {missionnamespace setvariable ["Autosave",15];};
};
};
};
SAOKSARN = [0,0,2,0];
SAOKSTARTDIACAT = {

private ["_c","_n","_count"];
lbClear 1506;
switch _this do {
case "Long Walls": {
lbAdd [1506, "Enabled"];
lbSetTooltip [1506,0,"CSAT is able to build long walls around their camps and factories"];
lbAdd [1506, "Disabled"];
lbSetTooltip [1506,1,"No long walls. Bit more stable FPS and less troublesome for AI"];
_c = 1;
if (isNil"Bwalll") then {_c = 0;};
lbSetCurSel [1506, _c];
};
case "GUI Boxes": {
lbAdd [1506, "Disabled"];
lbSetTooltip [1506,0,"No background boxes for UI"];
lbAdd [1506, "Enabled"];
lbSetTooltip [1506,1,"Background boxes for UI enabled for easier reading"];
_c = 1;
if (!isNil"UIBOXOFF") then {_c = 0;};
lbSetCurSel [1506, _c];
};

case "Platoon Radio": {
lbAdd [1506, "Disabled"];
lbSetTooltip [1506,0,"Platoon Radio Messages Not Voiced"];
lbAdd [1506, "Enabled"];
lbSetTooltip [1506,1,"Platoon Radio Messages Voiced on Map View"];
_c = 1;
if (!isNil"NoRadioVV") then {_c = 0;};
lbSetCurSel [1506, _c];
};
case "Advanced FirstAid": {
lbAdd [1506, "Disabled"];
lbSetTooltip [1506,0,"Team-mates get wounded normally"];
lbAdd [1506, "Enabled"];
lbSetTooltip [1506,1,"Team-mates can take more damage before dieing"];
_c = 1;
if (isNil"TeDam") then {_c = 0;};
lbSetCurSel [1506, _c];
};
case "Asset Unlocking": {
lbAdd [1506, "From Tasks"];
lbSetTooltip [1506,0,"More content comes available in support call/constructing/other during made progress in tasks"];
lbAdd [1506, "All Available"];
lbSetTooltip [1506,1,"All stuff available from start, kind of cheat mode and conflict with the mission's story"];
lbSetCurSel [1506, SAOKSARN select 0];
};
case "Player Respawning": {
lbAdd [1506, "Normal"];
lbSetTooltip [1506,0,"Full waittime, when respawning"];
lbAdd [1506, "Faster"];
lbSetTooltip [1506,1,"Shorter waittime, when respawning"];
lbAdd [1506, "Disabled"];
lbSetTooltip [1506,2,"Mission ends when dieing"];
lbSetCurSel [1506, SAOKSARN select 1];
};
case "Start Time": {
lbAdd [1506, "Night"];
lbAdd [1506, "Dawn"];
lbAdd [1506, "Mid-Day"];
lbAdd [1506, "Dusk"];
lbAdd [1506, "Random"];
lbSetCurSel [1506, SAOKSARN select 2];
};
case "Dynamic Weather": {
_n = 0;
if (!isNil"FogOFF" && {isNil"RainyW"} && {isNil"DisW"}) then {_n = 1;};
if (isNil"FogOFF" && {!isNil"RainyW"} && {isNil"DisW"}) then {_n = 2;};
if (!isNil"FogOFF" && {isNil"RainyW"} && {!isNil"DisW"} && {DisW == 1}) then {_n = 3;};
if (!isNil"FogOFF" && {isNil"RainyW"} && {!isNil"DisW"} && {DisW == 2}) then {_n = 4;};
lbAdd [1506, "Normal"];
lbSetTooltip [1506,0,"Random dynamic weather"];
lbAdd [1506, "Fog OFF"];
lbSetTooltip [1506,1,"Random dynamic weather without fog"];
lbAdd [1506, "Rainy"];
lbSetTooltip [1506,2,"Rainy dynamic weather"];
lbAdd [1506, "Cloudy(D)"];
lbSetTooltip [1506,3,"Cloudy and fixed weather"];
lbAdd [1506, "Sunny(D)"];
lbSetTooltip [1506,4,"Sunny and fixed weather"];
lbSetCurSel [1506, _n];
};
case "Player Needs": {
lbAdd [1506, "Enabled"];
lbSetTooltip [1506,0,"Blurry screen effects if getting thirsty, hungry, sleepy or sick"];
lbAdd [1506, "Disabled"];
lbSetTooltip [1506,1,"Player always in good shape. No blur effects"];
_c = 0;
if (!isNil"PNEEDS") then {_c = 0;};
if (isNil"PNEEDS") then {_c = 1;};
lbSetCurSel [1506, _c];
};
case "Constructing": {
lbAdd [1506, "LimitedForFPS"];
lbSetTooltip [1506,0,"Constructing posts have set limits to keep FPS good more likely"];
lbAdd [1506, "Freedom"];
lbSetTooltip [1506,1,"No limits when constructing, player need to keep eye on performance changes by himself"];
_c = 0;
if (GUARDLIM) then {_c = 0;};
if (!GUARDLIM) then {_c = 1;};
lbSetCurSel [1506, _c];
};

case "Ambient Life": {
lbAdd [1506, "Triple"];
lbAdd [1506, "Double"];
lbAdd [1506, "Normal"];
lbAdd [1506, "Half"];
_c = 0;
if (MULTLIFE == 2) then {_c = 0;};
if (MULTLIFE == 1) then {_c = 1;};
if (MULTLIFE == 0) then {_c = 2;};
if (MULTLIFE < 0) then {_c = 3;};
lbSetCurSel [1506, _c];
};
case "Life Range": {
lbAdd [1506, "Normal"];
lbSetTooltip [1506,0,"Enemy patrols are met close more likely, camps and posts are spawned inside smaller distance"];
lbAdd [1506, "+10%"];
lbAdd [1506, "+20%"];
lbSetTooltip [1506,2,"Enemy patrols are met less close more likely, camps and posts are spawned inside around 200-400m bigger distance. Bit more CPU demanding"];
lbAdd [1506, "+30%"];
lbAdd [1506, "+40%"];
lbAdd [1506, "+50%"];
lbSetTooltip [1506,5,"Enemy patrols are met far more likely, camps and posts are spawned inside around 500-1000m bigger distance. More CPU demanding"];
_c = 0;
if (DISVAR == 1000) then {_c = 0;};
if (DISVAR == 1100) then {_c = 1;};
if (DISVAR == 1200) then {_c = 2;};
if (DISVAR == 1300) then {_c = 3;};
if (DISVAR == 1400) then {_c = 4;};
if (DISVAR == 1500) then {_c = 5;};
lbSetCurSel [1506, _c];
};
case "PP-Effects": {
lbAdd [1506, "Default"];
_count = (count (configFile / "CfgPostProcessTemplates")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgPostProcessTemplates") select _count);
_count = _count - 1;
if (_n != "Default") then {lbAdd [1506, _n];};
};
lbSetCurSel [1506, SAOKSARN select 3];
};
case "AI Artillery": {
lbAdd [1506, "Enabled"];
lbSetTooltip [1506,0,"Enemy can call artillery and mortar strikes if there is related marked zone nearby"];
lbAdd [1506, "Disabled"];
lbSetTooltip [1506,1,"Enemy cannot call artillery and mortar strikes"];
_c = 0;
if (isNil"VarDisableArty") then {_c = 0;};
if (!isNil"VarDisableArty") then {_c = 1;};
lbSetCurSel [1506, _c];
};
case "Player Respawning": {
lbAdd [1506, "NEW for AI fix"];
lbSetTooltip [1506,0,"Enemy dont know your respawn location. Some mods may not work"];
lbAdd [1506, "OLD for Mods"];
lbSetTooltip [1506,1,"Certain mods work better, but enemy knows your respawn location"];
_c = 0;
if (isNil{missionnamespace getvariable "NewRespawn"}) then {_c = 0;};
if (!isNil{missionnamespace getvariable "NewRespawn"}) then {_c = 1;};
lbSetCurSel [1506, _c];
};
case "Autosave": {
lbAdd [1506, "Never"];
lbSetTooltip [1506,0,"Never autosaving"];
lbAdd [1506, "60min"];
lbSetTooltip [1506,1,"Creates custom savegame file that can be resumed in mission start options even if restarting mission"];
lbAdd [1506, "45min"];
lbSetTooltip [1506,2,"Creates custom savegame file that can be resumed in mission start options even if restarting mission"];
lbAdd [1506, "30min"];
lbSetTooltip [1506,3,"Creates custom savegame file that can be resumed in mission start options even if restarting mission"];
lbAdd [1506, "15min"];
lbSetTooltip [1506,4,"Creates custom savegame file that can be resumed in mission start options even if restarting mission"];
_c = 0;
if (isNil{missionnamespace getvariable "Autosave"}) then {_c = 0;};
if (!isNil{missionnamespace getvariable "Autosave"} && {missionnamespace getvariable "Autosave" == 60}) then {_c = 1;};
if (!isNil{missionnamespace getvariable "Autosave"} && {missionnamespace getvariable "Autosave" == 45}) then {_c = 2;};
if (!isNil{missionnamespace getvariable "Autosave"} && {missionnamespace getvariable "Autosave" == 30}) then {_c = 3;};
if (!isNil{missionnamespace getvariable "Autosave"} && {missionnamespace getvariable "Autosave" == 15}) then {_c = 4;};
lbSetCurSel [1506, _c];
};
};
};

SAOKWLAOPTIONS = {
private ["_ok"];
if (dialog) exitWith {};
"Changes may take time to have effect" SPAWN HINTSAOK;
disableserialization;
_ok = createDialog "WLAOptions"; 
lbAdd [1500, "Difficulty"];
lbAdd [1500, "Time Multiplier"];
lbAdd [1500, "Weather"];
lbAdd [1500, "Player Needs"];
lbAdd [1500, "Platoon Radio"];
lbAdd [1500, "GUI Boxes"];
lbAdd [1500, "Advanced FirstAid"];
lbAdd [1500, "Constructing"];
lbAdd [1500, "Ambient Life"];
lbAdd [1500, "Life Range"];
lbAdd [1500, "PP-Effects"];
lbAdd [1500, "AI Artillery"];
if (Bumblebeeman == 0) then {
lbAdd [1500, "Respawn"];
};
lbAdd [1500, "Fatigue"];
lbAdd [1500, "Autosave"];
lbAdd [1500, "Max VZones"];
lbAdd [1500, "Random Weapons AI"];
lbAdd [1500, "Animals"];
lbSetCurSel [1500, 0];
};


//MAXACTIVEV setTimeMultiplier 
SAOKWLAOPTIONSELECTED = {

private ["_n","_c","_count"];
lbClear 1501;
switch _this do {
case "GUI Boxes": {
_n = 1;
if (!isNil"UIBOXOFF") then {_n = 0;};
lbAdd [1501, "Disabled"];
lbAdd [1501, "Enabed"];
lbSetCurSel [1501, _n];
};
case "Platoon Radio": {
_n = 1;
if (!isNil"NoRadioVV") then {_n = 0;};
lbAdd [1501, "Disabled"];
lbAdd [1501, "Enabed"];
lbSetCurSel [1501, _n];
};
case "Advanced FirstAid": {
_n = 1;
if (isNil"TeDam") then {_n = 0;};
lbAdd [1501, "Disabled"];
lbAdd [1501, "Enabed"];
lbSetCurSel [1501, _n];
};
case "Weather": {
_n = 0;
if (!isNil"FogOFF" && {isNil"RainyW"} && {isNil"DisW"}) then {_n = 1;};
if (isNil"FogOFF" && {!isNil"RainyW"} && {isNil"DisW"}) then {_n = 2;};
if (!isNil"FogOFF" && {isNil"RainyW"} && {!isNil"DisW"} && {DisW == 1}) then {_n = 3;};
if (!isNil"FogOFF" && {isNil"RainyW"} && {!isNil"DisW"} && {DisW == 2}) then {_n = 4;};
lbAdd [1501, "Normal"];
lbAdd [1501, "Fog OFF"];
lbAdd [1501, "Rainy"];
lbAdd [1501, "Cloudy(D)"];
lbAdd [1501, "Sunny(D)"];
lbSetCurSel [1501, 0];
};
case "Random Weapons AI": {
lbAdd [1501, "Enabled"];
lbAdd [1501, "Disabled"];
_c = 0;
if (!isNil"NORANWEES") then {_c = 1;};
lbSetCurSel [1501, _c];
};

case "Time Multiplier": {
lbAdd [1501, "Normal"];
lbAdd [1501, "4x"];
lbAdd [1501, "10x"];
lbAdd [1501, "60x"];
_c = 0;
if (TIMMUL == 1) then {_c = 0;};
if (TIMMUL == 4) then {_c = 1;};
if (TIMMUL == 10) then {_c = 2;};
if (TIMMUL == 60) then {_c = 3;};
lbSetCurSel [1501, _c];
};
case "Max VZones": {
"How many active vehicle zones there can be at once for side, other wait in reserve state" SPAWN HINTSAOK;
lbAdd [1501, "1"];
lbAdd [1501, "2"];
lbAdd [1501, "3"];
lbAdd [1501, "4"];
lbAdd [1501, "5"];
lbAdd [1501, "6"];
_c = MAXACTIVEV - 1;
lbSetCurSel [1501, _c];
};
case "Difficulty": {
lbAdd [1501, "Hard"];
lbAdd [1501, "Challenging"];
lbAdd [1501, "Normal"];
lbAdd [1501, "Easy"];
_c = 0;
if (DIFLEVEL == 2) then {_c = 0;};
if (DIFLEVEL == 1) then {_c = 1;};
if (DIFLEVEL == 0.5) then {_c = 2;};
if (DIFLEVEL == 0.25) then {_c = 3;};
lbSetCurSel [1501, _c];
};
case "Player Needs": {
lbAdd [1501, "Enabled"];
lbAdd [1501, "Disabled"];
_c = 0;
if (!isNil"PNEEDS") then {_c = 0;};
if (isNil"PNEEDS") then {_c = 1;};
lbSetCurSel [1501, _c];
};
case "Constructing": {
lbAdd [1501, "LimitedForFPS"];
lbAdd [1501, "Freedom"];
_c = 0;
if (GUARDLIM) then {_c = 0;};
if (!GUARDLIM) then {_c = 1;};
lbSetCurSel [1501, _c];
};

case "Ambient Life": {
lbAdd [1501, "Triple"];
lbAdd [1501, "Double"];
lbAdd [1501, "Normal"];
lbAdd [1501, "Half"];
_c = 0;
if (MULTLIFE == 2) then {_c = 0;};
if (MULTLIFE == 1) then {_c = 1;};
if (MULTLIFE == 0) then {_c = 2;};
if (MULTLIFE < 0) then {_c = 3;};
lbSetCurSel [1501, _c];
};
case "Life Range": {
lbAdd [1501, "Normal"];
lbAdd [1501, "+10%"];
lbAdd [1501, "+20%"];
lbAdd [1501, "+30%"];
lbAdd [1501, "+40%"];
lbAdd [1501, "+50%"];
_c = 0;
if (DISVAR == 1000) then {_c = 0;};
if (DISVAR == 1100) then {_c = 1;};
if (DISVAR == 1200) then {_c = 2;};
if (DISVAR == 1300) then {_c = 3;};
if (DISVAR == 1400) then {_c = 4;};
if (DISVAR == 1500) then {_c = 5;};
lbSetCurSel [1501, _c];
};
case "PP-Effects": {
lbAdd [1501, "Default"];
_count = (count (configFile / "CfgPostProcessTemplates")) - 1; 
while {_count > 0} do {
_n = configName ((configFile / "CfgPostProcessTemplates") select _count);
_count = _count - 1;
if (_n != "Default") then {lbAdd [1501, _n];};
};
lbSetCurSel [1501, 0];

};
case "AI Artillery": {
lbAdd [1501, "Enabled"];
lbAdd [1501, "Disabled"];
_c = 0;
if (isNil"VarDisableArty") then {_c = 0;};
if (!isNil"VarDisableArty") then {_c = 1;};
lbSetCurSel [1501, _c];
};
case "Respawn": {
"With NEW, enemy dont know your respawn location. With OLD, certain mods work better" SPAWN HINTSAOK;
lbAdd [1501, "NEW for AI fix"];
lbAdd [1501, "OLD for Mods"];
_c = 0;
if (isNil{missionnamespace getvariable "NewRespawn"}) then {_c = 0;};
if (!isNil{missionnamespace getvariable "NewRespawn"}) then {_c = 1;};
lbSetCurSel [1501, _c];
};
case "Fatigue": {
lbAdd [1501, "Enabled"];
lbAdd [1501, "Disabled"];
_c = 0;
if (isNil{missionnamespace getvariable "NewFatigue"}) then {_c = 0;};
if (!isNil{missionnamespace getvariable "NewFatigue"}) then {_c = 1;};
lbSetCurSel [1501, _c];
};
case "Autosave": {
lbAdd [1501, "Never"];
lbAdd [1501, "60min"];
lbAdd [1501, "45min"];
lbAdd [1501, "30min"];
lbAdd [1501, "15min"];
_c = 0;
if (isNil{missionnamespace getvariable "Autosave"}) then {_c = 0;};
if (!isNil{missionnamespace getvariable "Autosave"} && {missionnamespace getvariable "Autosave" == 60}) then {_c = 1;};
if (!isNil{missionnamespace getvariable "Autosave"} && {missionnamespace getvariable "Autosave" == 45}) then {_c = 2;};
if (!isNil{missionnamespace getvariable "Autosave"} && {missionnamespace getvariable "Autosave" == 30}) then {_c = 3;};
if (!isNil{missionnamespace getvariable "Autosave"} && {missionnamespace getvariable "Autosave" == 15}) then {_c = 4;};
lbSetCurSel [1501, _c];
};
case "Animals": {
lbAdd [1501, "Enabled"];
lbAdd [1501, "Disabled"];
_c = 0;
if (isNil{missionnamespace getvariable "SaOkNoAnimals"}) then {_c = 0;};
if (!isNil{missionnamespace getvariable "SaOkNoAnimals"}) then {_c = 1;};
lbSetCurSel [1501, _c];
};

};
};

SAOKWLAOPTIONCHANGED = {
private ["_eh"];
switch (lbText [1500, (lbCurSel 1500)]) do {
case "GUI Boxes": {
if ((lbCurSel 1501) == 0) then {UIBOXOFF = 1;};
if ((lbCurSel 1501) == 1) then {UIBOXOFF = nil;};
{
disableserialization;if (ctrlType _x == 0) then {
if (!isNil"UIBOXOFF") then {_x ctrlShow false;} else {_x ctrlShow true;};
};
} foreach (uinamespace getvariable "SAcont");
};
case "Platoon Radio": { if ((lbCurSel 1501) == 0) then {NoRadioVV = 1;}; if ((lbCurSel 1501) == 1) then {NoRadioVV = nil;}; }; case "Advanced FirstAid": { if ((lbCurSel 1501) == 0) then {TeDam = nil;{_x removeAllEventHandlers "HandleDamage";_x removeAllEventHandlers "Explosion";} foreach units group player - [player];}; if ((lbCurSel 1501) == 1) then {TeDam = 1;{_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];} foreach units group player - [player];}; }; case "Animals": { if ((lbCurSel 1501) == 0) then {SaOkNoAnimals = nil;}; if ((lbCurSel 1501) == 1) then {SaOkNoAnimals = 1;}; }; case "Random Weapons AI": { if ((lbCurSel 1501) == 0) then {NORANWEES = nil;}; if ((lbCurSel 1501) == 1) then {NORANWEES = 1;}; }; case "Weather": { if ((lbCurSel 1501) == 0) then {FogOFF = nil; RainyW = nil;DisW = nil;}; if ((lbCurSel 1501) == 1) then {FogOFF = true; RainyW = nil;DisW = nil;}; if ((lbCurSel 1501) == 2) then {FogOFF = nil; RainyW = true;DisW = nil;}; if ((lbCurSel 1501) == 3) then {FogOFF = true; RainyW = nil;DisW = 1;}; if ((lbCurSel 1501) == 4) then {FogOFF = true; RainyW = nil;DisW = 2;}; }; case "Time Multiplier": { if ((lbCurSel 1501) == 0) then {TIMMUL = 1;}; if ((lbCurSel 1501) == 1) then {TIMMUL = 4;}; if ((lbCurSel 1501) == 2) then {TIMMUL = 10;}; if ((lbCurSel 1501) == 3) then {TIMMUL = 60;}; setTimeMultiplier TIMMUL; }; case "Max VZones": { MAXACTIVEV = (lbCurSel 1501) + 1; }; case "Fatigue": { if ((lbCurSel 1501) == 0) then {missionnamespace setvariable ["NewFatigue",nil]; {_x enableFatigue true;} foreach allUnits;}; if ((lbCurSel 1501) == 1) then {missionnamespace setvariable ["NewFatigue",1]; {_x enableFatigue false;} foreach allUnits;}; }; case "Respawn": { if ((lbCurSel 1501) == 0) then {missionnamespace setvariable ["NewRespawn",nil];}; if ((lbCurSel 1501) == 1) then {missionnamespace setvariable ["NewRespawn",1];}; }; case "Difficulty": { if ((lbCurSel 1501) == 0) then {DIFLEVEL = 2;PLSTREGHT = 1;}; if ((lbCurSel 1501) == 1) then {DIFLEVEL = 1;PLSTREGHT = 0.5;}; if ((lbCurSel 1501) == 2) then {DIFLEVEL = 0.5;PLSTREGHT = 0.4;}; if ((lbCurSel 1501) == 3) then {DIFLEVEL = 0.25;PLSTREGHT = 0.2;}; }; case "Player Needs": { if ((lbCurSel 1501) == 0) then {PNEEDS = true;}; if ((lbCurSel 1501) == 1) then {PNEEDS = nil;}; }; case "Constructing": { if ((lbCurSel 1501) == 0) then {GUARDLIM = true;}; if ((lbCurSel 1501) == 1) then {GUARDLIM = false;}; }; case "Ambient Life": { if ((lbCurSel 1501) == 0) then {MULTLIFE=2;HITEMDIS = 40;}; if ((lbCurSel 1501) == 1) then {MULTLIFE=1;HITEMDIS = 35;}; if ((lbCurSel 1501) == 2) then {MULTLIFE=0;HITEMDIS = 30;}; if ((lbCurSel 1501) == 3) then {MULTLIFE=-0.5;HITEMDIS = 25;}; }; case "Life Range": { if ((lbCurSel 1501) == 0) then {DISVAR = 1000;}; if ((lbCurSel 1501) == 1) then {DISVAR = 1100;}; if ((lbCurSel 1501) == 2) then {DISVAR = 1200;}; if ((lbCurSel 1501) == 3) then {DISVAR = 1300;}; if ((lbCurSel 1501) == 4) then {DISVAR = 1400;}; if ((lbCurSel 1501) == 5) then {DISVAR = 1500;}; }; case "PP-Effects": { SAOKPP = (lbText [1501, (lbCurSel 1501)]); [(lbText [1501, (lbCurSel 1501)])] CALL BIS_fnc_setPPeffectTemplate; }; case "AI Artillery": { if ((lbCurSel 1501) == 0) then {VarDisableArty = nil;}; if ((lbCurSel 1501) == 1) then {VarDisableArty = true;}; }; case "Autosave": { if ((lbCurSel 1501) == 0) then {missionnamespace setvariable ["Autosave",nil];}; if ((lbCurSel 1501) == 1) then {missionnamespace setvariable ["Autosave",60];}; if ((lbCurSel 1501) == 2) then {missionnamespace setvariable ["Autosave",45];}; if ((lbCurSel 1501) == 3) then {missionnamespace setvariable ["Autosave",30];}; if ((lbCurSel 1501) == 4) then {missionnamespace setvariable ["Autosave",15];}; }; };
};

//BIS FUNCTION
SAOKINSTRING = {
private ["_find","_string","_casesensitive","_found","_findarray","_stringarray","_findcount","_stringcount","_match","_forEachIndex"];
scriptName "instring";
_find = _this select 0;
_string = if (typename (_this select 1) == "STRING") then {_this select 1} else {str (_this select 1)};
_string = if (!isNil"_string") then {_string} else {"fsfasfas"};
_casesensitive = false;
_found = false;
_findarray = toArray _find;
_stringarray = toArray _string;
_findcount = count _findarray;
_stringcount = count _stringarray;
scopeName "main";
if (_findcount <= _stringcount) then
{
	for "_y" from 0 to (_stringcount - _findcount) do
	{
		_match = [];
		for "_i" from 0 to (_findcount - 1) do
		{
			_match pushback (_stringarray select (_y + _i));
		};
		if (_casesensitive) then
		{
			_found = true;
			{
				if (_x != (_match select _forEachIndex)) then
				{
					_found = false;
				};
			} forEach _findarray;
		}
		else
		{
			if (_find == toString _match) then
			{
				_found = true;
			};
		};
		if (_found) then {breakTo "main";};
	};
};
_found;
};

SAOKSORTBY = {
private ["_unsortedArray","_input0","_algorithm","_foreachindex"];
_unsortedArray 	= _this select 0;
{if (str _x == "No location") then {_unsortedArray = _unsortedArray - [_x];};} foreach _unsortedArray;
_input0	= (_this select 1) select 0;
_algorithm = _this select 2;
{
_unsortedArray set [_foreachindex,[(_x call _algorithm),_x]];
} foreach _unsortedArray;
_unsortedArray sort true;
{_unsortedArray set [_foreachindex, (_unsortedArray select _foreachindex) select 1];} foreach _unsortedArray;
_unsortedArray 
};


SAOKINJUICON = {

private ["_start","_someId","_mar"];
if (isPlayer _this) exitWIth {};
NUMM=NUMM+1;
_start = getposATL _this;
_someId = format ["IDINSAOK%1",NUMM];
[_someId, "onEachFrame", {
	if (isNil"IC3D") exitWith {};
	drawIcon3D ["\A3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa", ICONCOLORRED, getposATL _this,0.7, 0.7, 0, (format ["%1m",round (_this distance player)]), 1, SAOKFSI, "TahomaB"];
}, _this] call BIS_fnc_addStackedEventHandler;
_mar = format ["InjuM%1",NUMM];
NUMM=NUMM+1;
//_marker = [_mar,_start, "mil_circle", [0.3,0.3], "ColorRed", ""] CALL FUNKTIO_CREATEMARKER;
waitUntil {sleep 0.2; isNil{_this getvariable "SAwounded"} || {isNull _this} || {!alive _this}};
//deletemarker _marker;
[_someId, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
};

SADAME = {
private ["_d","_s","_ve","_b","_v","_kill"];
//["","head_hit","body"]
//hint (_this select 1);
_d = (_this select 2)*0.5;
_s = if (typename (_this select 1) == "STRING") then {(_this select 1)} else {str (_this select 1)};
_ve = 0;
_kill = false;
if (vest (_this select 0) != "" ) then {_ve = getnumber (configfile >> "CfgWeapons" >> (vest (_this select 0)) >> "ItemInfo" >> "armor");};
//LEGS?
_b = if (_d < 0.06 || {(_d > 0.48 && {_d < 0.52})}) then {false} else {true};
//GOES THROUGH VEST?
_v = if (!_b && {random 23 > _ve || {(_ve > 20 && {random 1 < 0.1})}}) then {true} else {false};
if (["leg", _s] call SAOKINSTRING || {_s == ""}) then {_s = "legs";};
if (_s in ["legs","hands"] && {_b}) then {[(_this select 0),_s,((_this select 0) getHit _s) + _d] spawn SAOKDELAYHIT;};
if ((!(_s in ["legs","hands"]) && {(((_this select 0) getHit _s) + _d) > 0.85}) || {_v}) then {
if (isNil{(_this select 0) getvariable "SAwounded"} && {vehicle (_this select 0) == (_this select 0)}) then {
(_this select 0) setvariable ["SAwounded",time];(_this select 0) spawn SAOKINJUICON;
_t = "Wounded TeamMember:"+"<br/>"+ "SPACE to revive"+"<br/>"+"U to drag / ALT+U to carry"+"<br/>"+"CTLR+U to point revive site for AI"; 
_t SPAWN HINTSAOK;(_this select 0) SPAWN SAOKWOUNDED;if (_s == "legs") then {_s = "body";};[(_this select 0),_s,0.5]spawn SAOKDELAYHIT;
} else {
if (vehicle (_this select 0) == (_this select 0) && {(((_this select 0) getvariable "SAwounded") + 2 < time || {random 1 < 0.1})}) then {
_kill = true;
(_this select 0) removeAllEventHandlers "HandleDamage";(_this select 0) removeAllEventHandlers "Explosion";
};
};
};
_d = if (_kill) then {1} else {0};
_d
};
 SAOKDELAYHIT = {
 sleep 0.05;
 (_this select 0) setHit [(_this select 1),(_this select 2)];
 };


//LEGD = LEGD + 0.1;{_x setHit ["legs",LEGD];} foreach units group player; hint str LEGD;
SAOKWOUNDED = {
if (!isNil{_this getvariable "SAwounded"} && {!isNull _this} && {alive _this}) then {
_this setcaptive true;
_this setvariable ["SAwounded",time];
if (isPlayer _this) exitWith {player playaction "Unconscious";};
{_this disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
_this switchmove ([
"Acts_LyingWounded_loop1"
,"Acts_LyingWounded_loop2"
,"Acts_LyingWounded_loop3"
,"Acts_InjuredAngryRifle01"
,"Acts_InjuredCoughRifle02"
,"Acts_InjuredLookingRifle01"
,"Acts_InjuredLookingRifle02"
,"Acts_InjuredLookingRifle03"
,"Acts_InjuredLookingRifle04"
,"Acts_InjuredLookingRifle05"
,"Acts_InjuredLyingRifle01"
,"Acts_InjuredLyingRifle02"
,"Acts_InjuredSpeakingRifle01"] call RETURNRANDOM);
_this addEventHandler ["AnimDone", {
	(_this select 0) removeAllEventHandlers "AnimDone";
	if (!isNil{(_this select 0) getvariable "movedInj"}) exitWith {};
	if (!isNil{(_this select 0) getvariable "SAwounded"} && {!isNull (_this select 0)}  && {alive (_this select 0)}) then {(_this select 0) SPAWN SAOKWOUNDED;};
}];
};
};

SAOKTREATING = {
private ["_healed","_l","_p"];
_l = {
private ["_c","_a","_r","_p"];
_c = _this select 0;
_a = _this select 1;
_r = _this select 2;
_p = [(_c select 0) + (sin _a)*_r,(_c select 1) + (cos _a)*_r,0];
_p
};
_p = [getposATL (_this getvariable "Healing"),([(_this getvariable "Healing"),_this] call SAOKDIRT), 1] CALL _l;
_this setpos _p;
_this setdir ([_this, (_this getvariable "Healing")] call SAOKDIRT);
if (!isPlayer _this && {false}) then {
{_this disableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
_this playmovenow "Acts_TreatingWounded_in";
//if (isPlayer (_this getvariable "Healing")) exitWith {(_this getvariable "Healing") playaction "Treated";};
_this addEventHandler ["AnimDone", {
	(_this select 0) removeAllEventHandlers "AnimDone";
	(_this select 0) switchmove (["Acts_TreatingWounded01","Acts_TreatingWounded02","Acts_TreatingWounded03","Acts_TreatingWounded04","Acts_TreatingWounded05","Acts_TreatingWounded06"] call RETURNRANDOM);
	(_this select 0) addEventHandler ["AnimDone", {
		(_this select 0) removeAllEventHandlers "AnimDone";
		(_this select 0) playmovenow "Acts_TreatingWounded_out";
		(_this select 0) addEventHandler ["AnimDone", {
			if (!isNil{(_this select 0) getvariable "Healing"}) then {
			_healed = ((_this select 0) getvariable "Healing");
			_healed setvariable ["SAwounded",nil];
			{_healed enableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
			_healed switchMove "";
			_healed playMove "";
			_healed setcaptive false;
			};
			(_this select 0) setvariable ["Healing",nil];
			(_this select 0) removeAllEventHandlers "AnimDone";
			(_this select 0) switchMove "";
			(_this select 0) playMove "";
			{(_this select 0) enableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
		}];
	}];
}];
} else {
_this playaction "medicother";
sleep 8;
if (!isNil{_this getvariable "Healing"}) then {
			_healed = (_this getvariable "Healing");
			_healed setvariable ["SAwounded",nil];
			{_healed enableAI _x;} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
			_healed switchMove "";
			_healed playMove "";
			_healed setcaptive false;
			_healed dofollow player;
			_healed setvariable ["Hlln",nil];
};
_this setvariable ["Healing",nil];
};
};

SAOKTITLETEXT = {
	private ["_n","_t"];
	if (isNil"SAOKCUT") then {SAOKSKIPCUT = nil;};
	if (typename _this == "ARRAY" && {count _this > 0} && {(typename (_this select 0) != "STRING" || {typename (_this select 1) != "SCALAR"})}) exitWith {};
	if (typename _this == "ARRAY" && {count _this > 0}) then {
	_n = if (!isNil{(missionnamespace getvariable "SAOKTTTEE")}) then {(missionnamespace getvariable "SAOKTTTEE")} else {[]};
	_n pushback _this;
	missionnamespace setvariable ["SAOKTTTEE",_n];
	};
	if (count (missionnamespace getvariable "SAOKTTTEE") > 1 && {count _this > 0}) exitWith {};
	with uiNamespace do {
	private ["_pic0","_pic3","_h","_n"];
	disableserialization;
	if (count (missionnamespace getvariable "SAOKTTTEE") == 0) exitWith {};
	if (count ((missionnamespace getvariable "SAOKTTTEE") select 0) != 2) exitWith {
	_n = (missionnamespace getvariable "SAOKTTTEE");
	_n deleteAT 0;
	missionnamespace setvariable ["SAOKTTTEE",_n];
	};
	_h = toUpper (((missionnamespace getvariable "SAOKTTTEE") select 0) select 0);
	_t = ((missionnamespace getvariable "SAOKTTTEE") select 0) select 1;
	if ({isNil"_x"} count [_h,_t] > 0 || {typename _h != "STRING"} || {typename _t != "SCALAR"}) exitWith {
	_n = (missionnamespace getvariable "SAOKTTTEE");
	_n deleteAT 0;
	missionnamespace setvariable ["SAOKTTTEE",_n];
	};
	 _pic0 = findDisplay 46 ctrlCreate ["RscBackground", -1];
	 _pic0 ctrlSetBackgroundColor [0,0,0.2,0.7];
     _pic0 ctrlSetPosition [0,(safeZoneY + safeZoneH)*0.55 ,0,0];
     _pic0 ctrlCommit 0;
	 _pic0 ctrlSetPosition [0,(safeZoneY + safeZoneH)*0.55,1,safeZoneH*0.08];
	 _pic0 ctrlCommit 0.2;
	 uinamespace setvariable ["TitText",[_pic0]];
     if (isNil{missionnamespace getvariable "SAOKSKIPCUT"}) then {sleep 0.2;};
	 _pic3 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	 _pic3 ctrlSetText _h;
     _pic3 ctrlSetPosition [0,(safeZoneY + safeZoneH)*0.55,1,safeZoneH*0.08];
     _pic3 ctrlCommit 0;
	 uinamespace setvariable ["TitText",[_pic0,_pic3]];
	 while {_t > 0 && {isNil"SAOKSKIPCUT"}} do {sleep 0.1;_t = _t - 0.1;};
	 _pic3 ctrlSetPosition [0,(safeZoneY + safeZoneH)*0.55,0,0];
     _pic3 ctrlCommit 0;
	 _pic0 ctrlSetPosition [0,(safeZoneY + safeZoneH)*0.55,0,0];
     _pic0 ctrlCommit 0.2;
	 if (isNil{missionnamespace getvariable "SAOKSKIPCUT"}) then {sleep 0.2;};
	 ctrlDelete _pic0;
	 ctrlDelete _pic3;
	 uinamespace setvariable ["TitText",nil];
	 _n = if (!isNil{(missionnamespace getvariable "SAOKTTTEE")}) then {(missionnamespace getvariable "SAOKTTTEE")} else {[]};
	 _n deleteAT 0;
	 missionnamespace setvariable ["SAOKTTTEE",_n];
	 if (count (missionnamespace getvariable "SAOKTTTEE") > 0) then {[] SPAWN (missionnamespace getvariable "SAOKTITLETEXT");};
	};
};

SAOKTASKHINT = {
	private ["_n","_pic"];
	if (typename _this == "ARRAY" && {count _this > 0} && {(typename (_this select 0) != "STRING" || {typename (_this select 1) != "STRING"})}) exitWith {};	
	if (count _this > 0 && {{typename _x == "STRING"} count _this == 2}) then {
	_n = if (!isNil{(missionnamespace getvariable "SAOKTASKTEE")}) then {(missionnamespace getvariable "SAOKTASKTEE")} else {[]};
	_n pushback _this;
	missionnamespace setvariable ["SAOKTASKTEE",_n];
	};
	if (count (missionnamespace getvariable "SAOKTASKTEE") > 1 && {count _this != 0}) exitWith {};
	with uiNamespace do {
	private ["_pic0","_pic1","_pic2","_pic3","_h","_t","_n"];
	disableserialization;
	if !(count (missionnamespace getvariable "SAOKTASKTEE") > 0) exitWith {};
	if (count ((missionnamespace getvariable "SAOKTASKTEE") select 0) != 2) exitWith {
	_n = (missionnamespace getvariable "SAOKTASKTEE");
	_n deleteAT 0;
	missionnamespace setvariable ["SAOKTASKTEE",_n];
	};
	_h = ((missionnamespace getvariable "SAOKTASKTEE") select 0) select 0;
	_t = ((missionnamespace getvariable "SAOKTASKTEE") select 0) select 1;
	if ({isNil"_x"} count [_h,_t] > 0 || {typename _h != "STRING"} || {typename _t != "STRING"}) exitWith {
	_n = (missionnamespace getvariable "SAOKTASKTEE");
	_n deleteAT 0;
	missionnamespace setvariable ["SAOKTASKTEE",_n];
	};
	playSound3D ["a3\Ui_f\data\Sound\CfgNotifications\scoreAdded.wss", player, false, getposATL player, 2];
	 _pic0 = findDisplay 46 ctrlCreate ["RscBackground", -1];
	 _pic0 ctrlSetBackgroundColor [0.6,0,0.4, 0.7];
     _pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2  - safeZoneH*0.02,0,0];
     _pic0 ctrlCommit 0;
	 _pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2  - safeZoneH*0.02,safeZoneW*0.12,safeZoneH*0.02];
	 _pic0 ctrlCommit 0.2;
     _pic = findDisplay 46 ctrlCreate ["RscBackground", -1];
	 _pic ctrlSetBackgroundColor [1,0.4,0, 0.7];
     _pic ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2 ,0,0];
     _pic ctrlCommit 0;
	 _pic ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2,safeZoneW*0.12,safeZoneH*0.05];
	 _pic ctrlCommit 0.2;
	 uinamespace setvariable ["Tcontrols",[_pic0,_pic]];
     sleep 0.2;
	 _pic3 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	 _pic3 ctrlSetText _h;
	 _pic3 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2 - safeZoneH*0.02,safeZoneW*0.12,safeZoneH*0.02];
	 _pic3 ctrlCommit 0;
	 _pic2 = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	 _pic2 ctrlSetText _t;
	 _pic2 ctrlSetTextColor [0.6,0,0.4,0.7];
	 _pic2 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2,safeZoneW*0.12,safeZoneH*0.05];
	 _pic2 ctrlCommit 0;
	  uinamespace setvariable ["Tcontrols",[_pic0,_pic,_pic3,_pic2]];
	 sleep 5;
	 _pic2 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2,0,0];
     _pic2 ctrlCommit 0;
	 _pic3 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2 - safeZoneH*0.02,0,0];
     _pic3 ctrlCommit 0;
	 _pic ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2,0,0];
     _pic ctrlCommit 0.2;
	 _pic0 ctrlSetPosition [safeZoneX+0.15*safeZoneW,safeZoneY + safeZoneH*0.2 - safeZoneH*0.02,0,0];
     _pic0 ctrlCommit 0.2;
	 sleep 0.2;
	 uinamespace setvariable ["Tcontrols",nil];
	 ctrlDelete _pic;
	 ctrlDelete _pic2;
	 ctrlDelete _pic0;
	 ctrlDelete _pic3;
	 _n = if (!isNil{(missionnamespace getvariable "SAOKTASKTEE")}) then {(missionnamespace getvariable "SAOKTASKTEE")} else {[]};
	 _n deleteAT 0;
	 missionnamespace setvariable ["SAOKTASKTEE",_n];
	 if (count (missionnamespace getvariable "SAOKTASKTEE") > 0) then {[] SPAWN (missionnamespace getvariable "SAOKTASKHINT");};
	};
};

SAOKTFL = {
private ["_N","_r","_ang","_center","_start1","_start2"];
_N = SAOKFLMs call RETURNRANDOM; 
_r = ["",""];
if (typename _N == "STRING") then {
_ang = MarkerDir _N;
_center = getmarkerpos _N;
//RED
_start1 = [(_center select 0)+((sin _ang)*500),(_center select 1)+((cos _ang)*500),0];
_ang = _ang + 180;
//GREEN
_start2 = [(_center select 0)+((sin _ang)*800),(_center select 1)+((cos _ang)*800),0];
if ({surfaceiswater _x} count [_start1,_start2] == 0) then {_r = [_start1,_start2];};
};
_r
};

SAOKREAMMODE = {
private ["_goRearm","_y","_pW","_pM","_mG","_m","_yy","_n"];
if (!isNIl"REARMMODEVAR" || {!isNIl"SAOKREARMINUSE"}) exitWith {};
SAOKREARMINUSE = true;
if (time > 40) then {"Teammates will rearm automatically" SPAWN HINTSAOK;};
REARMMODEVAR = true;
_goRearm = {
private ["_x2","_x1","_pW","_pM","_mG","_x3","_tt","_obj"];
_x1 = _this select 0;
if (alive _x1) then {_x1 groupChat "Run out of ammo, I try to get a weapon from that body";};
_x2 = _this select 1;
_x3 = _this select 2;
_tt = 0;
_x1 domove getposATL _x2;
while {alive _x1 && {!isNull _x1} && {!isNull _x2} && {!isNull _x3} && {_x1 distance _x2 > 3} && {isNil{_x1 getvariable "SAwounded"}}} do {_tt = _tt + 1;if (_tt > 4) then {_x1 dofollow _x1;_x1 domove getposATL _x2;_tt = 0;};sleep 5;};
if (_x1 distance _x2 <= 3 && {count weaponcargo _x3 > 0} && {isNil{_x1 getvariable "SAwounded"}}) then {
//_x1 action ["TakeWeapon", _x2, primaryWeapon _x2];
_pW = ((weaponcargo _x3) select 0);
if (gettext (configfile >> "CfgWeapons" >> _pW >> "nameSound") == "rifle") then {
if (primaryweapon _x1 != "") then {
_obj = createVehicle ["WeaponHolderSimulated",getposATL _x1, [], 0, "CAN_COLLIDE"];
_obj setpos getposATL _x1;
_obj addweaponcargo [primaryweapon _x1,1];
};
_x1 addweapon _pW;
_pM = getarray (configfile >> "CfgWeapons" >> _pW >> "magazines");
_mG = magazines _x2 + (primaryWeaponMagazine _x2);
{
if !(_x2 canAdd _x) exitWith {};
if (_x in _pM) then {
_x1 addmagazine _x;
_x2 removemagazine _x;
};
} foreach _mG;
if (alive _x1) then {_x1 groupChat "Nice, got also enough magazines. Back in business";};
deletevehicle _x3;
sleep 8;
};
};
if (!alive _x1) then {_x2 setvariable ["takenB",nil];} else {_x1 dofollow player;};
_x1 setvariable ["rearmP",nil];
};
sleep 0.5;
while {!isNil"REARMMODEVAR"} do {
{
_yy = _x;
_pW = primaryWeapon _x;
_pM = getarray (configfile >> "CfgWeapons" >> _pW >> "magazines");
_mG = magazines _x + (primaryWeaponMagazine _x);
_m = 0;
{
_y = _x;
_m = _m + ({_y == _x} count _mG);
} foreach _pM;
if (_m < 2) then {
{
_n = (getposATL _x nearEntities ["WeaponHolderSimulated", 10]);
{if (gettext (configfile >> "CfgWeapons" >> ((weaponcargo _x) select 0) >> "nameSound") != "rifle") then {_n =_n-[_x];};} foreach _n;
if (count _n > 0 && {vehicle _x == _x} && {isNil{_x getvariable "Hlln"}} && {isNil{_x getvariable "rearmP"}} && isNil{_x getvariable "takenB"} && {_x distance _yy < 120} && {isNil{_x getvariable "SAwounded"}}) exitWith {
if (unitready _x) then {
_n = [_n,[_x],{_input0 distance _x},"ASCEND"] call SAOKSORTBY;
_n = _n select 0;
_x setvariable ["takenB",1];
_yy setvariable ["rearmP",1];
[_yy,_x,_n] spawn _goRearm;
} else {[_yy,"WAITING RETURN TO FORMATION COMMAND to REARM"] SPAWN FUnitSay2;};
};
} foreach alldeadmen;
};
sleep 0.5;
} foreach units group player - [player];
sleep 10;
};
SAOKREARMINUSE = nil;
};
//"groundweaponHolder" "WeaponHolderSimulated" hint str weaponcargo ((getposATL player nearEntities ["WeaponHolderSimulated", 20])select 0);
SAOKHEALMODE = {
private ["_goHeal","_med","_y"];
if (!isNIl"HEALMODEVAR" || {!isNIl"SAOKHEALINUSE"}) exitWith {};
if (time > 40) then {"Teammates heal each other automatically" SPAWN HINTSAOK;};
HEALMODEVAR = true;
SAOKHEALINUSE = true;
_goHeal = {
private ["_x2","_x1","_tt","_s","_n","_p","_aika"];
_x1 = _this select 0;
_x2 = _this select 1;
if (!isplayer _x2) then {
_x2 groupChat "Little help here? I am bleeding but no more first aid packs";
_x1 spawn {sleep 5;_this groupChat "Dont worry, boddy. I will check your wounds";};
} else {
_x1 spawn {sleep 5;_this groupChat "Dont worry, sir. I will come to check your wounds";};
};
dostop _x2;
_tt = 0;
_x1 domove getposATL _x2;
while {{!isNull _x && {alive _x}} count [_x1,_x2] == 2 && {_x1 distance _x2 > 3} && {isNil{_x1 getvariable "SAwounded"}} && {!isNil{_x2 getvariable "Hlld"}} && {isNil{_x2 getvariable "movedInj"}}}  do {_tt = _tt + 1;dostop _x2;if (_tt > 4) then {_x1 dofollow _x1;_x1 domove getposATL _x2;_tt = 0;};sleep 5;};
if ({!isNull _x && {alive _x}} count [_x1,_x2] == 2 && {isNil{_x1 getvariable "SAwounded"}} && {!isNil{_x2 getvariable "Hlld"}} && {isNil{_x2 getvariable "movedInj"}}) then {
if (!isNil{missionnamespace getvariable "Szone"} && {!isPlayer _x2} && {(missionnamespace getvariable "Szone") distance _x2 > 10}) then {
_s = 0;
if (random 1 < 0.3 || {!(productVersion select 2 > 144)}) then {
_s = 1;
_n = [_x1,_x2,([_x2,missionnamespace getvariable "Szone"] call SAOKDIRT)] SPAWN SAOKDRAGAI;
} else {
_s = 2;
_n = [_x1,_x2,([_x2,missionnamespace getvariable "Szone"] call SAOKDIRT)] SPAWN SAOKCARRYAI;
};
sleep 0.5;
_p = (getposATL (missionnamespace getvariable "Szone"));
_x1 domove _p;
_aika = time + 30;
waitUntil {sleep 0.1; _x1 distance _p < 3 || {_aika < time} || {{!alive _x} count [_x1,_x2] > 0}};
if (_s == 1) then {_n = _x1 SPAWN SAOKDRAGAI;};
if (_s == 2) then {_n = _x1 SPAWN SAOKCARRYAI;};
sleep 1;
};
if ({alive _x} count [_x1,_x2] == 2) then {
_x1 action ["HealSoldier", _x2];
if (!isNil{_x2 getvariable "SAwounded"}) then {_x1 setvariable ["Healing", _x2];_x1 spawn SAOKTREATING;};
_x1 groupChat "There you go, you will be good as new";
sleep 8;
if (alive _x2) then {_x2 setdamage 0;};
};
if (alive _x2 && {!isplayer _x2}) then {_x2 groupChat "Thanks, brother. I am fit to fight again";};
};
_x2 dofollow _x2;
_x2 dofollow player;
_x1 dofollow player;
_x1 setvariable ["Hlln",nil];
_x2 setvariable ["Hlld",nil];
};
sleep 0.5;
while {!isNil"HEALMODEVAR"} do {
_med = [];
{
if (getnumber (configfile >> "CfgVehicles" >> typeof _x >> "attendant") == 1 && {"Medikit" in items _x} && {vehicle _x == _x} && {isNil{_x getvariable "SAwounded"}}) then {
_med pushback _x;
};
} foreach units group player - [player];
{
if ((damage _x > 0.21 || {!isNil{_x getvariable "SAwounded"}}) && {isNil{_x getvariable "Hlld"}} && {isNil{_x getvariable "movedInj"}} && {vehicle _x == _x}) then {
if (("FirstAidKit" in items _x || {_x in _med}) && {isNil{_x getvariable "SAwounded"}}) then {
_x action ["HealSoldierSelf", _x];sleep 6; _x setdamage 0;
} else {
_y = _x;
{if (alive _x && {unitready _x} && {isNil{_x getvariable "Hlln"}} && {isNil{_x getvariable "rearmP"}} && {isNil{_x getvariable "SAwounded"}} && {isNil{_x getvariable "Hlld"}} && {vehicle _x == _x} && {_y distance _x < 200}) exitWith {_x setvariable ["Hlln",1];_y setvariable ["Hlld",1];[_x,_y] SPAWN _goHeal;};} foreach _med;
sleep 0.2;
if (isNil{_x getvariable "Hlld"}) then { 
{if (alive _x && {unitready _x} && {"FirstAidKit" in items _x} && {isNil{_x getvariable "rearmP"}} && {isNil{_x getvariable "SAwounded"}} && {isNil{_x getvariable "Hlln"}} && {vehicle _x == _x} && {_y distance _x < 200}) exitWith {_x setvariable ["Hlln",1];_y setvariable ["Hlld",1];[_x,_y] SPAWN _goHeal;};} foreach (units group player - [player]);
};
};
};
sleep 0.5;
} foreach units group player - [player];
{
if (!isNil{_x getvariable "SAwounded"}) then {
_y = _x;
{if (alive _x && {unitready _x} && {isNil{_x getvariable "Hlln"}} && {isNil{_x getvariable "rearmP"}} && {isNil{_x getvariable "SAwounded"}} && {isNil{_x getvariable "Hlld"}} && {vehicle _x == _x} && {_y distance _x < 200}) exitWith {_x setvariable ["Hlln",1];_y setvariable ["Hlld",1];[_x,_y] SPAWN _goHeal;};} foreach _med;
sleep 0.2;
if (isNil{_x getvariable "Hlld"}) then { 
{if (alive _x && {unitready _x} && {"FirstAidKit" in items _x} && {isNil{_x getvariable "rearmP"}} && {isNil{_x getvariable "SAwounded"}} && {isNil{_x getvariable "Hlln"}} && {vehicle _x == _x} && {_y distance _x < 200}) exitWith {_x setvariable ["Hlln",1];_y setvariable ["Hlld",1];[_x,_y] SPAWN _goHeal;};} foreach (units group player - [player]);
};
};
sleep 0.5;
} foreach [player];
sleep 10;
};
SAOKHEALINUSE = nil;
};

//AinjPpneMstpSnonWrflDb AinjPpneMstpSnonWrflDb_release "movedInj" && {isNil{_x getvariable "movedInj"}}
SAOKDRAGAI = {

private ["_dir","_c"];
if (typename _this == "ARRAY") then { _dir = if (count _this > 2) then {_this select 2} else {(direction (_this select 0))}; (_this select 0) setvariable ["draa",(_this select 1)]; (_this select 0) switchmove ""; (_this select 0) playActionNOw "grabDrag"; (_this select 1) setdir _dir; sleep 0.1; (_this select 0) attachTo [(_this select 1), [0,1.1,0]];  (_this select 0) setVectorDirAndUp [[0, -1, 0], [0, 0, 1] ]; sleep 2; (_this select 1) setvariable ["movedInj",1]; (_this select 1) SPAWN SAOKDRAGANIM; } else { _c = _this getvariable "draa"; detach _this; _c setvariable ["movedInj",nil]; _c switchmove "AinjPpneMstpSnonWrflDb_release"; _this switchmove ""; _this setvariable ["draa",nil]; sleep 0.5; _c switchmove ""; _c SPAWN SAOKWOUNDED; };
};

SAOKCARRYAI = {
private ["_dir","_c"];
if (typename _this == "ARRAY") then {
_dir = if (count _this > 2) then {_this select 2} else {(direction (_this select 0))};
(_this select 0) setvariable ["carr",(_this select 1)];
(_this select 0) switchmove "";
(_this select 0) playActionNOw "grabCarry";
(_this select 1) switchmove "AinjPfalMstpSnonWnonDnon_carried_Up";
(_this select 1) setdir ((direction (_this select 0))+180);
(_this select 0) setpos ((_this select 1) modelToWorld [0,1,0]);
{(_this select 0) disableAI _x;} foreach ["move","fsm","target","autotarget"];
(_this select 1) setvariable ["movedInj",1];
sleep 15;
//{(_this select 0) disableAI _x;} foreach ["move","fsm","target","autotarget"];
(_this select 1) attachTo [(_this select 0), [0, 0, 0]]; 
(_this select 1) setVectorDirAndUp [[0, -1, 0], [0, 0, 1]];
(_this select 0) SPAWN SAOKCARRYANIM;
(_this select 0) setdir (_dir);
(_this select 0) switchmove "AcinPercMrunSrasWrflDf";
} else {
{_this enableAI _x;} foreach ["move","fsm","target","autotarget"];
_this switchmove "";
_c = _this getvariable "carr";
detach _c;
_c setvariable ["movedInj",nil];
_c switchmove "AinjPfalMstpSnonWrflDf_carried_fall";
_this setvariable ["carr",nil];
sleep 2;
_c switchmove "";
_c SPAWN SAOKWOUNDED;
};
};

SAOKDRAG = {
private ["_c"];
if (typename _this == "ARRAY") then {
if !(typeof (_this select 1) iskindof "Man") exitWith {};
(_this select 0) setvariable ["draa",(_this select 1)];
(_this select 0) switchmove "";
(_this select 0) playActionNOw "grabDrag";
(_this select 1) setdir (direction (_this select 0));
sleep 0.1;
(_this select 1) attachTo [(_this select 0), [0,1.1,0]]; 
(_this select 1)setVectorDirAndUp [[0, -1, 0], [0, 0, 1] ];
sleep 2;
(_this select 1) setvariable ["movedInj",1];
(_this select 1) SPAWN SAOKDRAGANIM;
} else {
_c = _this getvariable "draa";
detach _c;
_c setvariable ["movedInj",nil];
_c switchmove "AinjPpneMstpSnonWrflDb_release";
_this switchmove "";
_this setvariable ["draa",nil];
sleep 0.5;
_c switchmove "";
_c SPAWN SAOKWOUNDED;
};
};
//if (!isNil{(_this select 0) getvariable "movedInj"}) exitWith {};
//if (!isNil{(_this select 0) getvariable "SAwounded"} && {!isNull (_this select 0)}  && {alive (_this select 0)}) then {(_this select 0) SPAWN SAOKWOUNDED;};
//AinjPfalMstpSnonWrflDf_carried  AinjPfalMstpSnonWrflDf_carried_fall AinjPfalMstpSnonWrflDf_carried_dead
//if (isNil{(_this select 0) getvariable "Carr"}) then {[player,cursortarget] SPAWN SAOKCARRY;} else {player SPAWN SAOKCARRY;};
SAOKCARRYY = {
private ["_c"];
if (typename _this == "ARRAY") then {
(_this select 0) setvariable ["Carr",(_this select 1)];
(_this select 0) playActionNOw "grabCarry";
(_this select 1) switchmove "AinjPfalMstpSnonWnonDnon_carried_Up";
(_this select 1) setdir ((direction (_this select 0))+180);
(_this select 0) setpos ((_this select 1) modelToWorld [0,1,0]);
(_this select 1) setvariable ["movedInj",1];
sleep 14;
(_this select 1) attachTo [(_this select 0), [0, 0, 0]]; 
(_this select 1) setVectorDirAndUp [[0, -1, 0], [0, 0, 1]];
(_this select 0) SPAWN SAOKCARRYANIM;
} else {
_c = _this getvariable "Carr";
detach _c;
_c setvariable ["movedInj",nil];
_c switchmove "";
_this setvariable ["Carr",nil];
_c setvariable ["movedInj",nil];
_c switchmove "AinjPfalMstpSnonWrflDf_carried_fall";
_this switchmove "";
sleep 2;
_c switchmove "";
_c SPAWN SAOKWOUNDED;
};
};
SAOKDRAGANIM = {
_this switchmove "AinjPpneMstpSnonWrflDb";
};

SAOKCARRYANIM = {
private ["_carried"];
_carried = _this getvariable "Carr";
while {!isNil{_carried getvariable "movedInj"}} do {
if (abs(speed _this) > 1) then {
_carried attachTo [_this, [0.2, 0, 0]]; 
_carried setVectorDirAndUp [[0, 1, 0], [0, 0, 1]];
//_carried switchmove "";
_carried switchmove "AinjPfalMstpSnonWrflDf_carried";
waitUntil {sleep 0.1;!(abs(speed _this) > 1) || {isNil{_carried getvariable "movedInj"}}};
} else {
_carried attachTo [_this, [0.2, 0, 0]]; 
_carried setVectorDirAndUp [[0, -1, 0], [0, 0, 1]];
//_carried switchmove "";
_carried switchmove "AinjPfalMstpSnonWnonDf_carried_dead";
waitUntil {sleep 0.1;abs(speed _this) > 1 || {isNil{_carried getvariable "movedInj"}}};
};
};
};

SAOKADDSZONE = {
private ["_cP","_obj"];
_cP = screenToWorld [0.5,0.5];
if (player distance _cP < 200) then {
if (isNil{missionnamespace getvariable "Szone"}) then {
_obj = createVehicle ["Sign_Pointer_Cyan_F",_cP, [], 0, "CAN_COLLIDE"]; 
missionnamespace setvariable ["Szone",_obj];
} else {
(missionnamespace getvariable "Szone") setpos _cP;
};
} else {
if (!isNil{missionnamespace getvariable "Szone"}) then {
"Revive Safezone Deleted" SPAWN HINTSAOK;
deletevehicle (missionnamespace getvariable "Szone");
missionnamespace setvariable ["Szone",nil];
};
};
};
