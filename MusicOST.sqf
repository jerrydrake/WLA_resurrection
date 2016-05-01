private ["_num","_track"];
//["Track01_Proteus","Track02_SolarPower","Track03_OnTheRoad","Track04_Underwater1","Track04_Underwater2","Track06_CarnHeli","Track07_ActionDark"]
_num = _this select 0;
if (isClass(configFile >> "cfgVehicles" >> "Cow01")) then {
4 fadeMusic 0;
sleep 4;
switch (_num) do {
//patrol
case 1: 
{
_track = ["07_Tactics","07_Tactics","Fallout","SkyNet","Wasteland","Walk","TheFallen","Suppression","SlowBlades","Secret","ResistanceTheme10","ResistanceTheme09","ResistanceTheme08","ResistanceTheme07","ResistanceTheme06","ResistanceTheme04","ResistanceTheme03","ResistanceTheme01b","ResistanceTheme01a","OrganWorks","Ocean","MainTheme","Hunt","Heroes","DarkSide","CasualtiesOfWar","Armor","Amen","aa_south_island","aa_rock_theme_vi","aa_rock_theme_iib","aa_rock_theme_iia","aa_ofp1_remix2","aa_north_island","aa_death_theme_ii","aa_death_theme_i","aa_death_II","aa_chorus_I","Track15_MainTheme","Track14_MainMenu","Track11_StageB_stealth","Track09_Night_percussions","Track13_StageC_negative","Track08_Night_ambient","Track01_Proteus","Track02_SolarPower","Track04_Underwater1","Track05_Underwater2","Track03_First_to_Fight","Track10_Logistics","Track13_Sharping_Knives","Track18_Ghost_Waltz","Track19_Debriefing","Track20_Badlands","Track21_Rise_Of_The_Fallen","Track26_Organ_Works","Ambient01_Cold_Wind","Ambient02_Vague_Shapes","Ambient05_Cobalt","Ambient06_Khe_Sanh_Riff","Ambient07_Manhattan","Ambient08_Reforger","EP1_Track01","EP1_Track02","EP1_Track03","EP1_Track04","EP1_Track05","EP1_Track06","EP1_Track07","EP1_Track11","EP1_Track13","EP1_Track13V","EP1_Track14"];
if (isClass(configFile >> "cfgMusic" >> "EventTrack01_F_EPA")) then {
_track = _track + ["LeadTrack01_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA"];
};
playMusic (_track call RETURNRANDOM); 
};
//fast re
case 2: 
{
_track = ["ResistanceTheme05","ResistanceTheme02","Mixdown","MarchHell","Decisions","aa_rock_theme_v","aa_rock_theme_iv","aa_rock_theme_iii","aa_ofp1_remix1","Track10_StageB_action","Track03_OnTheRoad","Track06_CarnHeli","Track12_StageC_action","Track07_ActionDark","Track05_Warpath","Track09_Movement_To_Contact","Track11_Large_Scale_Assault","Track14_Close_Quarter_Combat","Ambient04_Electronic_Warfare","EP1_Track01D","EP1_Track07D","EP1_Track13D1", "EP1_Track13D2"];
if (isClass(configFile >> "cfgMusic" >> "EventTrack01_F_EPA")) then {
_track = _track + ["LeadTrack03a_F_EPA","LeadTrack03_F_EPA","EventTrack01_F_EPA","EventTrack01a_F_EPA","EventTrack02_F_EPA","EventTrack02a_F_EPA","EventTrack03_F_EPA","EventTrack03a_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA"];
};
playMusic (_track call RETURNRANDOM);  
};
//slow re
case 3: 
{
_track = ["ResistanceTheme05","ResistanceTheme02","Mixdown","MarchHell","Decisions","aa_rock_theme_v","aa_rock_theme_iv","aa_rock_theme_iii","aa_ofp1_remix1","Track11_StageB_stealth","Track10_StageB_action","Track03_OnTheRoad","Track12_StageC_action","Track06_CarnHeli","Track07_ActionDark","Track04_Reinforcements","Track08_Harvest_Red","Track12_The_Movement","Short01_Defcon_Three","EP1_Track03D","EP1_Track08","EP1_Track09","EP1_Track10","EP1_Track12"];
if (isClass(configFile >> "cfgMusic" >> "EventTrack01_F_EPA")) then {
_track = _track + ["LeadTrack03a_F_EPA","LeadTrack03_F_EPA","EventTrack01_F_EPA","EventTrack01a_F_EPA","EventTrack02_F_EPA","EventTrack02a_F_EPA","EventTrack03_F_EPA","EventTrack03a_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA"];
};
playMusic (_track call RETURNRANDOM);  
};
//task succesfull
case 4: 
{
_track = ["07_Tactics","07_Tactics","Fallout","SkyNet","Wasteland","Walk","TheFallen","Suppression","SlowBlades","Secret","ResistanceTheme10","ResistanceTheme09","ResistanceTheme08","ResistanceTheme07","ResistanceTheme06","ResistanceTheme04","ResistanceTheme03","ResistanceTheme01b","ResistanceTheme01a","OrganWorks","Ocean","MainTheme","Hunt","Heroes","DarkSide","CasualtiesOfWar","Armor","Amen","aa_south_island","aa_rock_theme_vi","aa_rock_theme_iib","aa_rock_theme_iia","aa_ofp1_remix2","aa_north_island","aa_death_theme_ii","aa_death_theme_i","aa_death_II","aa_chorus_I","Track15_MainTheme","Track14_MainMenu","Track09_Night_percussions","Track11_StageB_stealth","Track13_StageC_negative","Track10_StageB_action","Track01_Proteus","Track02_SolarPower","Track04_Underwater1","Track05_Underwater2","Track02_Insertion","Track07_Last_Men_Standing","Track15_Morning_Sortie","Track16_Valentine","Track17_Marauder_Song","Track27_Killing_Machines","EP1_Track02","EP1_Track15"];
if (isClass(configFile >> "cfgMusic" >> "EventTrack01_F_EPA")) then {
_track = _track + ["LeadTrack01_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA"];
};
playMusic (_track call RETURNRANDOM); 
};

};
1 fadeMusic 0.55;
} else {
4 fadeMusic 0;
sleep 4;
switch (_num) do {
//patrol
case 1: 
{
_track = ["07_Tactics","07_Tactics","Fallout","SkyNet","Wasteland","Walk","TheFallen","Suppression","SlowBlades","Secret","ResistanceTheme10","ResistanceTheme09","ResistanceTheme08","ResistanceTheme07","ResistanceTheme06","ResistanceTheme04","ResistanceTheme03","ResistanceTheme01b","ResistanceTheme01a","OrganWorks","Ocean","MainTheme","Hunt","Heroes","DarkSide","CasualtiesOfWar","Armor","Amen","aa_south_island","aa_rock_theme_vi","aa_rock_theme_iib","aa_rock_theme_iia","aa_ofp1_remix2","aa_north_island","aa_death_theme_ii","aa_death_theme_i","aa_death_II","aa_chorus_I","Track15_MainTheme","Track14_MainMenu","Track11_StageB_stealth","Track09_Night_percussions","Track13_StageC_negative","Track08_Night_ambient","Track01_Proteus","Track02_SolarPower","Track04_Underwater1","Track05_Underwater2"];
if (isClass(configFile >> "cfgMusic" >> "EventTrack01_F_EPA")) then {
_track = _track + ["LeadTrack01_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA"];
};
playMusic (_track call RETURNRANDOM); 
};
//fast re
case 2: 
{
_track = ["ResistanceTheme05","ResistanceTheme02","Mixdown","MarchHell","Decisions","aa_rock_theme_v","aa_rock_theme_iv","aa_rock_theme_iii","aa_ofp1_remix1","Track10_StageB_action","Track03_OnTheRoad","Track06_CarnHeli","Track12_StageC_action","Track07_ActionDark"];
if (isClass(configFile >> "cfgMusic" >> "EventTrack01_F_EPA")) then {
_track = _track + ["LeadTrack03a_F_EPA","LeadTrack03_F_EPA","EventTrack01_F_EPA","EventTrack01a_F_EPA","EventTrack02_F_EPA","EventTrack02a_F_EPA","EventTrack03_F_EPA","EventTrack03a_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA"];
};
playMusic (_track call RETURNRANDOM);  
};
//slow re
case 3: 
{
_track = ["ResistanceTheme05","ResistanceTheme02","Mixdown","MarchHell","Decisions","aa_rock_theme_v","aa_rock_theme_iv","aa_rock_theme_iii","aa_ofp1_remix1","Track11_StageB_stealth","Track10_StageB_action","Track03_OnTheRoad","Track06_CarnHeli","Track12_StageC_action","Track07_ActionDark"];
if (isClass(configFile >> "cfgMusic" >> "EventTrack01_F_EPA")) then {
_track = _track + ["LeadTrack03a_F_EPA","LeadTrack03_F_EPA","EventTrack01_F_EPA","EventTrack01a_F_EPA","EventTrack02_F_EPA","EventTrack02a_F_EPA","EventTrack03_F_EPA","EventTrack03a_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA"];
};
playMusic (_track call RETURNRANDOM); 
};
//task succesfull
case 4: 
{
_track = ["07_Tactics","07_Tactics","Fallout","SkyNet","Wasteland","Walk","TheFallen","Suppression","SlowBlades","Secret","ResistanceTheme10","ResistanceTheme09","ResistanceTheme08","ResistanceTheme07","ResistanceTheme06","ResistanceTheme04","ResistanceTheme03","ResistanceTheme01b","ResistanceTheme01a","OrganWorks","Ocean","MainTheme","Hunt","Heroes","DarkSide","CasualtiesOfWar","Armor","Amen","aa_south_island","aa_rock_theme_vi","aa_rock_theme_iib","aa_rock_theme_iia","aa_ofp1_remix2","aa_north_island","aa_death_theme_ii","aa_death_theme_i","aa_death_II","aa_chorus_I","Track15_MainTheme","Track14_MainMenu","Track09_Night_percussions","Track11_StageB_stealth","Track13_StageC_negative","Track10_StageB_action","Track01_Proteus","Track02_SolarPower","Track04_Underwater1","Track05_Underwater2"];
if (isClass(configFile >> "cfgMusic" >> "EventTrack01_F_EPA")) then {
_track = _track + ["LeadTrack01_F_EPA","LeadTrack02_F_EPA","LeadTrack02a_F_EPA","LeadTrack02b_F_EPA"];
};
playMusic (_track call RETURNRANDOM); 
};

};
1 fadeMusic 0.55;
};
