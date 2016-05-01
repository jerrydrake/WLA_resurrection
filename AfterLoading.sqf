private ["_all","_keyDown"];
waituntil {!(IsNull (findDisplay 46))};
//(findDisplay 46) displayRemoveAllEventHandlers "KeyDown"; 
if (!isNil{missionnamespace getvariable "SaOkKeys"}) then {
{(findDisplay 46) displayRemoveEventHandler ["KeyDown",_x];} foreach (missionnamespace getvariable "SaOkKeys");
};
if (!isNil{missionnamespace getvariable "SaOkKeys2"}) then {
{(findDisplay 46) displayRemoveEventHandler ["KeyUp",_x];} foreach (missionnamespace getvariable "SaOkKeys2");
};
_all = [];
_all2 = [];
waitUntil {sleep 0.1; !isNil"StartMission"};
LIIKUTAOBJEKTI = nil;
missionnamespace setvariable ["ConsMoved",nil];
waituntil {sleep 0.1;!(IsNull (findDisplay 46))};
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyUp", "SkeyIsDown = nil;"];
_all2 pushback _keydown;
//MINEFIELD Shift+L
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x26} && {!dialog} && {isNil""LIIKUTAOBJEKTI""}) then {_nul = (groupSelectedUnits player) SPAWN FUNK_MinefieldInit;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//CONSTRUCT Shift+C 
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {if (!isNil"SkeyIsDown") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x2E} && {!dialog}) then {
if (isNil"LIIKUTAOBJEKTI") then {
_nn = player SPAWN FUNK_ConstructionDialog;
} else {
missionnamespace setvariable ["MovingObj",nil];
};
} else {SkeyIsDown = nil;};}];
_all pushback _keydown;
//WLA Menu (SHIFT + 1)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x02} && {!dialog} && {isNil""LIIKUTAOBJEKTI""}) then {_nul = [] SPAWN WLADialog;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//TALK TO CIVILIAN (SHIFT + Y)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {isNil""SAOKCUT""} && {_this select 1 == 0x15} && {({[_x,player] CALL FUNKTIO_LOS} count ((getposATL player) nearEntities [[""Civilian""],7]) > 0)} && {!dialog} && {isNil""LIIKUTAOBJEKTI""}) then {_nul = [] SPAWN CONVERSATIONWITHCIVILIANS;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//TALK TO SURRENDERED (SHIFT + Y)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {isNil""SAOKCUT""} && {_this select 1 == 0x15} && {({leader _x != player && {!isNil{(_x getvariable ""SaOkSurrendeRed"")}} && {isNil{(_x getvariable ""NoTalkative"")}} && {[_x,player] CALL FUNKTIO_LOS}} count ((getposATL player) nearEntities [[""Man""],7]) > 0)} && {!dialog} && {isNil""LIIKUTAOBJEKTI""}) then {_nul = [] SPAWN CONVERSATIONWITHSURRENDERED;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//TALK TO SOLDIER (SHIFT + Y)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {isNil""SAOKCUT""} && {_this select 1 == 0x15} && {({leader _x != player && {side _x != EAST && {side _x != CIVILIAN}}&& {isNil{(_x getvariable ""NoTalkative"")}} && {[_x,player] CALL FUNKTIO_LOS}} count ((getposATL player) nearEntities [[""Man""],7]) > 0)} && {!dialog} && {isNil""LIIKUTAOBJEKTI""}) then {_nul = [] SPAWN CONVERSATIONWITHSOLDIERS;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//Arty Shift+6
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x07} && {!dialog} && {vehicle player == player} && {isNil""LIIKUTAOBJEKTI""}) then {_nul = (screenToWorld [0.5,0.5]) SPAWN ARTYDIALOG;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//TEamCam Shift+8
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x09} && {!dialog} && {isNil""LIIKUTAOBJEKTI""}) then {_nul = [] SPAWN SAOKTEAMCAMDIA;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//Street Lights Shift+7
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x08} && {!dialog} && {nearestObject [player, ""Land_spp_Transformer_F""] distance player < 10} && {vehicle player == player} && {isNil""LIIKUTAOBJEKTI""}) then {_nul = [] SPAWN LightsDialog;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//Break in Car Y
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (!(_this select 2) && {!(_this select 3)} && {!(_this select 4)} && {_this select 1 == 0x15} && {vehicle player == player}) then {_nul = [] SPAWN StealOrTake;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//Crate Shift+9
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x0A} && {!dialog} && {isNil""LIIKUTAOBJEKTI""}) then {
if !(typeof vehicle player isKindOf ""Air"") then {
_nul = [] SPAWN FCrateDialog;
} else {
_nul = [] SPAWN SAOKSLINGDIA;
};
} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
 //FLIP VEHICLE Shift+4
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x05}) then {_nul = [] SPAWN F_CorrectCar;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//Holster Weapon (CTRL + Y)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 3 && {!isNil{CIVMODE}} && {_this select 1 == 0x15}) then {_nul = [] SPAWN ToggleW;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//SHOW 3D ICONS SHIFT+U
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 2 && {_this select 1 == 0x16}) then {if (isNil""IC3D"") then {IC3D = true;} else {IC3D = nil;};} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//CHANGE TO CIV (ALT + Y)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 4 && {_this select 1 == 0x15} && {isNil""SAOKBUT""}) then {
SAOKBUT = true;
_nul = [] SPAWN CivPlayer;
if (locationposition ([""ColorBlue""] CALL NEARESTCAMP) distance vehicle player < 20) then {EXITUNDEC = true;};
} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//CTRL + R
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if ((_this select 3) && {!(_this select 2)} && {_this select 1 == 0x13}) then {_n = player spawn SAOKREPACKAMMO;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//SPACE
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if (_this select 1 == 0x39) then {if (!isNil""SAOKCUT"") then {SAOKSKIPCUT = true;};missionnamespace setvariable [""SAOKTTTEE"",[]];if (cursortarget distance player < 2 && !isNil{cursortarget getvariable ""SAwounded""}) then {player setvariable [""Healing"",cursortarget];_nn = player spawn SAOKTREATING;};} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//Place Safe Revive Zone CTRL+U
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if ((_this select 3) && {!(_this select 2)} && {_this select 1 == 0x16}) then {_n = [] spawn SAOKADDSZONE;} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//CARRY ALT+U
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;if ((_this select 4) && {!(_this select 2)} && {_this select 1 == 0x16}) then {
if (productVersion select 2 > 144) then {
if (!isNil{player getvariable ""carr""} && {isNil{player getvariable ""draa""}}) exitWith {
_n = player SPAWN SAOKCARRYY;
};
if (cursortarget distance player < 2 && !isNil{cursortarget getvariable ""SAwounded""} && {isNil{player getvariable ""carr""}} && {isNil{player getvariable ""draa""}}) exitWith {
_n = [player,cursortarget] SPAWN SAOKCARRYY;
};
} else {""Carrying requires newer game version"" SPAWN HINTSAOK;};
} else {SkeyIsDown = nil;};"];
_all pushback _keydown;
//U (drag)
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "
if (!isNil""SkeyIsDown"") exitWith {};SkeyIsDown = true;
if (!(_this select 4) && {!(_this select 3)} && {!(_this select 2)} && {_this select 1 == 0x16}) then {
if (!isNil{player getvariable ""draa""} && {isNil{player getvariable ""carr""}}) exitWith {
_n = player SPAWN SAOKDRAG;
};
if (cursortarget distance player < 2 && !isNil{cursortarget getvariable ""SAwounded""} && {isNil{player getvariable ""draa""}} && {isNil{player getvariable ""carr""}}) exitWith {
_n = [player,cursortarget] SPAWN SAOKDRAG;
};
_n = [] SPAWN FPlayerFist;_n = [] SPAWN SAOKYELLTOSURRENDER;
} else {SkeyIsDown = nil;
};
"];
_all pushback _keydown;

missionnamespace setvariable ["SaOkKeys",_all];
missionnamespace setvariable ["SaOkKeys2",_all2];

