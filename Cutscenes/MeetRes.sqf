CurTaskS = CurTaskS + ["Cutscenes\MeetRes.sqf"];
_nul = [4] SPAWN MusicT;
_cl = if (isNil"IFENABLED") then {"I_G_officer_F"} else {"LIB_GER_hauptmann"};
if (!isNil"CheConf") then {_cl = "I_mas_cer_Soldier_off_F";};
if (!isNil"Eridanus") then {_cl = "TEI_UNSC_Marine_Officer";};
_actor1 = [WEST,_cl,133,[1000,1000,0],objNull] CALL FUNKTIO_SPAWNACTOR;
_actor1 setidentity "Acacius_Georgopoulos";
_n = [
[getposATL player, player, _actor1],
[],
[
[[[player], "",4]]
,[[[player], "Did you find any stored gear or do we need to keep capturing more camps?",7]]
,[[[_actor1], ["There is plenty of good gear found, we will do fine."],6]]
,[[[player], ["Do you know what have happened to green army? We haven't seen much of them."],7]]
,[[[_actor1], ["Yes, they only have few recon posts left here. We need to help them back to Altis."],8]]
,[[[_actor1], ["They are preparing to return only after some weeks unless we do some work for them, then earlier"],10]]
,[[[_actor1], ["We would need to hold at least 3 camps or 2 operative factories"],6]]
,[[[player], ["The best to get started then"],4]]
]
] SPAWN SAOKCUTSCENE;
waitUntil {sleep 0.1; scriptdone _n}; 
_n = [] SPAWN SAOKGREENREQ;
_nul = [_actor1,""] SPAWN FHideAndDelete;
CurTaskS = CurTaskS - ["Cutscenes\MeetRes.sqf"];



