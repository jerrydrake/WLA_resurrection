private ["_num","_track"];
//["Track01_Proteus","Track02_SolarPower","Track03_OnTheRoad","Track04_Underwater1","Track04_Underwater2","Track06_CarnHeli","Track07_ActionDark"]
_num = _this select 0;
if (!isNil"DONTCMUSIC") exitWith {};
if (_num == 3) exitWith {};
if (isClass(configFile >> "cfgVehicles" >> "Cow01")) then {
4 fadeMusic 0;
sleep 4;
switch (_num) do {
//patrol
//["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"]
case 1: 
{
_track = ["LeadTrack03_F_Bootcamp","LeadTrack02_F_Bootcamp","FR_Helios_StealthIV","FR_Helios_CalmIII","FR_Helios_CutsceneII","FR_Helios_Cutscene","FR_Helios_CalmII","FR_Helios_Calm","FR_Helios_StealthII","FR_Helios_SettlersII","FR_Helios_SettlersIII","FR_Helios_Stealth","FR_Helios_Settlers","FR_Helios_Intro","LeadTrack01_F_Curator","LeadTrack04_F_EPC","LeadTrack06b_F_EPC","LeadTrack06_F_EPC","LeadTrack03_F_EPC","LeadTrack01_F_EPC","EventTrack01_F_EPC","BackgroundTrack03_F_EPC","BackgroundTrack04_F_EPC","BackgroundTrack02_F_EPC","LeadTrack01_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA","Fallout","SkyNet","Wasteland","Track15_MainTheme","Track14_MainMenu","Track11_StageB_stealth","Track09_Night_percussions","Track13_StageC_negative","Track08_Night_ambient","Track01_Proteus","Track02_SolarPower","Track04_Underwater1","Track05_Underwater2","Track03_First_to_Fight","Track10_Logistics","Track13_Sharping_Knives","Track18_Ghost_Waltz","Track19_Debriefing","Track20_Badlands","Track21_Rise_Of_The_Fallen","Track26_Organ_Works","Ambient01_Cold_Wind","Ambient02_Vague_Shapes","Ambient05_Cobalt","Ambient06_Khe_Sanh_Riff","Ambient07_Manhattan","Ambient08_Reforger","EP1_Track01","EP1_Track02","EP1_Track03","EP1_Track04","EP1_Track05","EP1_Track06","EP1_Track07","EP1_Track11","EP1_Track13","EP1_Track13V","EP1_Track14"];
if (isClass(configFile >> "cfgMusic" >> "LeadTrack03a_F_EPB")) then {
_track = _track + ["LeadTrack03a_F_EPB","LeadTrack03_F_EPB","LeadTrack02a_F_EPB","LeadTrack02b_F_EPB","LeadTrack02_F_EPB","LeadTrack01a_F_EPB","LeadTrack01_F_EPB","EventTrack02_F_EPB","EventTrack01a_F_EPB","EventTrack01_F_EPB","BackgroundTrack01_F_EPB","AmbientTrack01_F_EPB"];
};
if (isClass(configFile >> "cfgMusic" >> "IFTrack14")) then {
_track = _track + ["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"];
};
_picked = (_track call RETURNRANDOM);
if !(isClass(configFile >> "cfgMusic" >> _picked)) exitWith {_nul = [1] SPAWN MusicT;};
playMusic _picked; 
};
//fast re
case 2: 
{
_track = ["FR_Helios_BattleIII","FR_Helios_BattleII","FR_Helios_Battle","LeadTrack05_F_EPC","LeadTrack02_F_EPC","EventTrack03_F_EPC","EventTrack02b_F_EPC","EventTrack02_F_EPC","BackgroundTrack01_F_EPC","LeadTrack03a_F_EPA","LeadTrack03_F_EPA","EventTrack01_F_EPA","EventTrack01a_F_EPA","EventTrack02_F_EPA","EventTrack02a_F_EPA","EventTrack03_F_EPA","EventTrack03a_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA","Track10_StageB_action","Track03_OnTheRoad","Track06_CarnHeli","Track12_StageC_action","Track07_ActionDark","Track05_Warpath","Track09_Movement_To_Contact","Track11_Large_Scale_Assault","Track14_Close_Quarter_Combat","Ambient04_Electronic_Warfare","EP1_Track01D","EP1_Track07D","EP1_Track13D1", "EP1_Track13D2"];
if (isClass(configFile >> "cfgMusic" >> "LeadTrack03a_F_EPB")) then {
_track = _track + ["LeadTrack04_F_EPB","EventTrack04a_F_EPB","EventTrack04_F_EPB","EventTrack03a_F_EPB","EventTrack03_F_EPB","EventTrack02a_F_EPB"];
};
if (isClass(configFile >> "cfgMusic" >> "IFTrack14")) then {
_track = _track + ["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"];
};
_picked = (_track call RETURNRANDOM);
if !(isClass(configFile >> "cfgMusic" >> _picked)) exitWith {_nul = [2] SPAWN MusicT;};
playMusic _picked; 
};
//slow re
case 3: 
{
_track = ["FR_Helios_BattleIII","FR_Helios_BattleII","FR_Helios_Battle","LeadTrack05_F_EPC","LeadTrack02_F_EPC","EventTrack03_F_EPC","EventTrack02b_F_EPC","EventTrack02_F_EPC","BackgroundTrack01_F_EPC","LeadTrack03a_F_EPA","LeadTrack03_F_EPA","EventTrack01_F_EPA","EventTrack01a_F_EPA","EventTrack02_F_EPA","EventTrack02a_F_EPA","EventTrack03_F_EPA","EventTrack03a_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA","Track11_StageB_stealth","Track10_StageB_action","Track03_OnTheRoad","Track12_StageC_action","Track06_CarnHeli","Track07_ActionDark","Track04_Reinforcements","Track08_Harvest_Red","Track12_The_Movement","Short01_Defcon_Three","EP1_Track03D","EP1_Track08","EP1_Track09","EP1_Track10","EP1_Track12"];
if (isClass(configFile >> "cfgMusic" >> "LeadTrack03a_F_EPB")) then {
_track = _track + ["LeadTrack04_F_EPB","EventTrack04a_F_EPB","EventTrack04_F_EPB","EventTrack03a_F_EPB","EventTrack03_F_EPB","EventTrack02a_F_EPB"];
};
if (isClass(configFile >> "cfgMusic" >> "IFTrack14")) then {
_track = _track + ["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"];
};
_picked = (_track call RETURNRANDOM);
if !(isClass(configFile >> "cfgMusic" >> _picked)) exitWith {_nul = [3] SPAWN MusicT;};
playMusic _picked; 
};
//task succesfull
case 4: 
{
_track = ["LeadTrack03_F_Bootcamp","LeadTrack02_F_Bootcamp","FR_Helios_StealthIV","FR_Helios_CalmIII","FR_Helios_CutsceneII","FR_Helios_Cutscene","FR_Helios_CalmII","FR_Helios_Calm","FR_Helios_StealthII","FR_Helios_SettlersII","FR_Helios_SettlersIII","FR_Helios_Stealth","FR_Helios_Settlers","FR_Helios_Intro","LeadTrack01_F_Curator","LeadTrack04_F_EPC","LeadTrack06b_F_EPC","LeadTrack06_F_EPC","LeadTrack03_F_EPC","LeadTrack01_F_EPC","EventTrack01_F_EPC","BackgroundTrack03_F_EPC","BackgroundTrack04_F_EPC","BackgroundTrack02_F_EPC","LeadTrack01_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA","Fallout","SkyNet","Wasteland","Track15_MainTheme","Track14_MainMenu","Track09_Night_percussions","Track11_StageB_stealth","Track13_StageC_negative","Track10_StageB_action","Track01_Proteus","Track02_SolarPower","Track04_Underwater1","Track05_Underwater2","Track02_Insertion","Track07_Last_Men_Standing","Track15_Morning_Sortie","Track16_Valentine","Track17_Marauder_Song","Track27_Killing_Machines","EP1_Track02","EP1_Track15"];
if (isClass(configFile >> "cfgMusic" >> "LeadTrack03a_F_EPB")) then {
_track = _track + ["LeadTrack03a_F_EPB","LeadTrack03_F_EPB","LeadTrack02a_F_EPB","LeadTrack02b_F_EPB","LeadTrack02_F_EPB","LeadTrack01a_F_EPB","LeadTrack01_F_EPB","EventTrack02_F_EPB","EventTrack01a_F_EPB","EventTrack01_F_EPB","BackgroundTrack01_F_EPB","AmbientTrack01_F_EPB"];
};
if (isClass(configFile >> "cfgMusic" >> "IFTrack14")) then {
_track = _track + ["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"];
};
_picked = (_track call RETURNRANDOM);
if !(isClass(configFile >> "cfgMusic" >> _picked)) exitWith {_nul = [4] SPAWN MusicT;};
playMusic _picked; 
};

};
1 fadeMusic 0.40;
} else {
4 fadeMusic 0;
sleep 4;
switch (_num) do {
//patrol
case 1: 
{
_track = ["LeadTrack03_F_Bootcamp","LeadTrack02_F_Bootcamp","FR_Helios_StealthIV","FR_Helios_CalmIII","FR_Helios_CutsceneII","FR_Helios_Cutscene","FR_Helios_CalmII","FR_Helios_Calm","FR_Helios_StealthII","FR_Helios_SettlersII","FR_Helios_SettlersIII","FR_Helios_Stealth","FR_Helios_Settlers","FR_Helios_Intro","LeadTrack01_F_Curator","LeadTrack04_F_EPC","LeadTrack06b_F_EPC","LeadTrack06_F_EPC","LeadTrack03_F_EPC","LeadTrack01_F_EPC","EventTrack01_F_EPC","BackgroundTrack03_F_EPC","BackgroundTrack04_F_EPC","BackgroundTrack02_F_EPC","LeadTrack01_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA","Fallout","SkyNet","Wasteland","Track15_MainTheme","Track14_MainMenu","Track11_StageB_stealth","Track09_Night_percussions","Track13_StageC_negative","Track08_Night_ambient","Track01_Proteus","Track02_SolarPower","Track04_Underwater1","Track05_Underwater2"];
if (isClass(configFile >> "cfgMusic" >> "LeadTrack03a_F_EPB")) then {
_track = _track + ["LeadTrack03a_F_EPB","LeadTrack03_F_EPB","LeadTrack02a_F_EPB","LeadTrack02b_F_EPB","LeadTrack02_F_EPB","LeadTrack01a_F_EPB","LeadTrack01_F_EPB","EventTrack02_F_EPB","EventTrack01a_F_EPB","EventTrack01_F_EPB","BackgroundTrack01_F_EPB","AmbientTrack01_F_EPB"];
};
if (isClass(configFile >> "cfgMusic" >> "IFTrack14")) then {
_track = _track + ["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"];
};
_picked = (_track call RETURNRANDOM);
if !(isClass(configFile >> "cfgMusic" >> _picked)) exitWith {_nul = [1] SPAWN MusicT;};
playMusic _picked; 
};
//fast re
case 2: 
{
_track = ["FR_Helios_BattleIII","FR_Helios_BattleII","FR_Helios_Battle","LeadTrack05_F_EPC","LeadTrack02_F_EPC","EventTrack03_F_EPC","EventTrack02b_F_EPC","EventTrack02_F_EPC","BackgroundTrack01_F_EPC","LeadTrack03a_F_EPA","LeadTrack03_F_EPA","EventTrack01_F_EPA","EventTrack01a_F_EPA","EventTrack02_F_EPA","EventTrack02a_F_EPA","EventTrack03_F_EPA","EventTrack03a_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA","Track10_StageB_action","Track03_OnTheRoad","Track06_CarnHeli","Track12_StageC_action","Track07_ActionDark"];
if (isClass(configFile >> "cfgMusic" >> "LeadTrack03a_F_EPB")) then {
_track = _track + ["LeadTrack04_F_EPB","EventTrack04a_F_EPB","EventTrack04_F_EPB","EventTrack03a_F_EPB","EventTrack03_F_EPB","EventTrack02a_F_EPB"];
};
if (isClass(configFile >> "cfgMusic" >> "IFTrack14")) then {
_track = _track + ["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"];
};
_picked = (_track call RETURNRANDOM);
if !(isClass(configFile >> "cfgMusic" >> _picked)) exitWith {_nul = [2] SPAWN MusicT;};
playMusic _picked; 
};
//slow re
case 3: 
{
_track = ["FR_Helios_BattleIII","FR_Helios_BattleII","FR_Helios_Battle","LeadTrack05_F_EPC","LeadTrack02_F_EPC","EventTrack03_F_EPC","EventTrack02b_F_EPC","EventTrack02_F_EPC","BackgroundTrack01_F_EPC","LeadTrack03a_F_EPA","LeadTrack03_F_EPA","EventTrack01_F_EPA","EventTrack01a_F_EPA","EventTrack02_F_EPA","EventTrack02a_F_EPA","EventTrack03_F_EPA","EventTrack03a_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA","Track11_StageB_stealth","Track10_StageB_action","Track03_OnTheRoad","Track06_CarnHeli","Track12_StageC_action","Track07_ActionDark"];
if (isClass(configFile >> "cfgMusic" >> "LeadTrack03a_F_EPB")) then {
_track = _track + ["LeadTrack04_F_EPB","EventTrack04a_F_EPB","EventTrack04_F_EPB","EventTrack03a_F_EPB","EventTrack03_F_EPB","EventTrack02a_F_EPB"];
};
if (isClass(configFile >> "cfgMusic" >> "IFTrack14")) then {
_track = _track + ["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"];
};
_picked = (_track call RETURNRANDOM);
if !(isClass(configFile >> "cfgMusic" >> _picked)) exitWith {_nul = [3] SPAWN MusicT;};
playMusic _picked; 
};
//task succesfull
case 4: 
{
_track = ["LeadTrack03_F_Bootcamp","LeadTrack02_F_Bootcamp","FR_Helios_StealthIV","FR_Helios_CalmIII","FR_Helios_CutsceneII","FR_Helios_Cutscene","FR_Helios_CalmII","FR_Helios_Calm","FR_Helios_StealthII","FR_Helios_SettlersII","FR_Helios_SettlersIII","FR_Helios_Stealth","FR_Helios_Settlers","FR_Helios_Intro","LeadTrack01_F_Curator","LeadTrack04_F_EPC","LeadTrack06b_F_EPC","LeadTrack06_F_EPC","LeadTrack03_F_EPC","LeadTrack01_F_EPC","EventTrack01_F_EPC","BackgroundTrack03_F_EPC","BackgroundTrack04_F_EPC","BackgroundTrack02_F_EPC","LeadTrack01_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA","Fallout","SkyNet","Wasteland","Track15_MainTheme","Track14_MainMenu","Track09_Night_percussions","Track11_StageB_stealth","Track13_StageC_negative","Track10_StageB_action","Track01_Proteus","Track02_SolarPower","Track04_Underwater1","Track05_Underwater2"];
if (isClass(configFile >> "cfgMusic" >> "LeadTrack03a_F_EPB")) then {
_track = _track + ["LeadTrack03a_F_EPB","LeadTrack03_F_EPB","LeadTrack02a_F_EPB","LeadTrack02b_F_EPB","LeadTrack02_F_EPB","LeadTrack01a_F_EPB","LeadTrack01_F_EPB","EventTrack02_F_EPB","EventTrack01a_F_EPB","EventTrack01_F_EPB","BackgroundTrack01_F_EPB","AmbientTrack01_F_EPB"];
};
if (isClass(configFile >> "cfgMusic" >> "IFTrack14")) then {
_track = _track + ["IFTrack14","IFTrack13","IFTrack12","IFTrack11","IFTrack10","IFTrack09","IFTrack08","IFTrack07","IFTrack06","IFTrack05","IFTrack04","IFTrack03","IFTrack02","IFTrack01","IF_OldTrack6","IF_OldTrack5","IF_OldTrack4","IF_OldTrack3","IF_OldTrack2","IF_OldTrack1"];
};
_picked = (_track call RETURNRANDOM);
if !(isClass(configFile >> "cfgMusic" >> _picked)) exitWith {_nul = [4] SPAWN MusicT;};
playMusic _picked; 
};

};
1 fadeMusic 0.40;
};
