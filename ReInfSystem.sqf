//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
private ["_at3","_at2","_at1","_me","_table","_classes","_c","_bbo2","_xx","_yy","_pos","_group","_start","_ran","_nul","_tank","_Spos","_st","_dir","_number","_bbo"];
if (!isNil"CIVMODE") exitWith {};
REINF=false;
_group = objNull;
//hint "Reinforcements are send for you, see their updating location on map";
REINFSTATE = "En Route";
_c=0;
_classes = [];
_table = [FRIENDC1,FRIENDC2,FRIENDC3,FRIENDC4] call RETURNRANDOM;
while {_c < 4} do {
sleep 0.5;	
_c = _c + 1;	
//_random = round(random (count _table - 1));
_classes pushback (_table call RETURNRANDOM);
};
_pos = getposATL vehicle player;
if (!("USHelp" in (missionnamespace getvariable "Progress"))) then {
if (vehicle player distance ([getposATL player] CALL SAOKNEARVILP) < 400) then {
//FOOT (randomly own driven vehicle)
_xx = random 700;
_yy = 700 - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_start = [_pos] CALL SAOKNEARVILP;
while  {surfaceIsWater _start || {{_start distance _x < 500} count VarBlackListF > 0} || {player distance _start < 500}} do {
_xx = random 700;
_yy = 700 - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_pos = getposATL player;
_start = [(_pos select 0) + _xx,(_pos select 1) + _yy,0];
sleep 1;
};
_group = [_start, WEST, _classes,[],[],[0.9,1.0]] call SpawnGroupCustom;
{_x setUnitRank (["PRIVATE", "CORPORAL", "SERGEANT"] call RETURNRANDOM);} foreach units _group;
if (isNil"NORANWEES") then {
{
if (random 1 < 0.7) then {_nul = [_x, [0,1] call RETURNRANDOM] SPAWN FUNKTIO_NATORUS;};
sleep 0.1;
} foreach units _group; 
};
{_x setvariable ["DAPPED",true];} foreach units _group;
[_group] SPAWN {
private ["_group","_pos","_pos2","_st"];
_group = _this select 0;
while {{alive _x} count units _group > 0 && {leader _group != player}} do {
_pos = getposATL leader _group;
sleep 120;
if ({alive _x} count units _group > 0 && {leader _group != player} && {(getposATL leader _group) distance _pos < 40}) then {
_pos2 = [((getposATL vehicle player) select 0)+200-(random 400),((getposATL vehicle player) select 1)+200-(random 400),0];
while {surfaceIsWater _pos2} do {_pos2 = [((getposATL vehicle player) select 0)+200-(random 400),((getposATL vehicle player) select 1)+200-(random 400),0];sleep 1;};
{_x setpos _pos2;} foreach units _group;
};
};
};
if (!("USHelp" in (missionnamespace getvariable "Progress"))) then {{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;sleep 0.1;} foreach units _group;};
DONTDELGROUPS = DONTDELGROUPS + [_group];
_group setVariable ["ReInf", true];
_nul = [_group,"ColorBlue"," REINF","b_inf"] SPAWN FUNKTIO_GM2;  
_pos = getposATL player;
_group move _pos;
sleep 0.5;

while {(((leader _group distance player > 100) || {(leader _group distance _pos > 100)}) && {({alive _x} count units _group > 0)}) || {((getposATL (vehicle leader _group) select 2) > 0.5 && {({alive _x} count units _group > 0)})}} do {sleep 20;_pos = getposATL player;_group move _pos;if (!isNil"CIVMODE") exitWith {REINF=true;};};
if (!isNil"CIVMODE") exitWith {REINFSTATE = "Stand By"; {_x spawn SAOKDELETE;} foreach units _group;REINF=true;};
if ({alive _x} count units _group > 0) then {{if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};[_x] join player;} foreach units _group;REINFSTATE = "Stand By";} else {REINFSTATE = "MIA";};
DONTDELGROUPS = DONTDELGROUPS - [_group];
} else {
//LAND VEHICLE
_tank = ["B_G_Offroad_01_F","B_G_Offroad_01_F","C_Offroad_01_F"]+(["C",2] CALL VEHARRAY);
if (!isNil"IFENABLED") then {_tank = (["C",2] CALL VEHARRAY);};	
_tank = _tank call RETURNRANDOM;
if (_tank in ["B_MRAP_01_F","I_MRAP_03_F"]) then {_classes = [_table call RETURNRANDOM,_table call RETURNRANDOM,_table call RETURNRANDOM];};

//START POS  _di= [_start, getposATL _obj] call SAOKDIRT;
_Spos = [_pos] CALL SAOKNEARVILP;
_Spos = [_Spos, 100,0,"(1 - houses) * (1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_dir = [_Spos, player] call SAOKDIRT;
_params = [_Spos, _pos, _pos, WEST, 0, _tank,_classes,[0.9,1.0],0];
_isWpos = [player, 1800, 900] CALL SAOKSEARCHPOS;
if (surfaceiswater _isWpos) then {
_tank = ["B_Boat_Armed_01_minigun_F","B_Boat_Transport_01_F"] call RETURNRANDOM; 
_LZ = [_isWpos,_pos] CALL SAOKSEEKSHORE;  
_isWpos = _isWpos CALL SAOKCORRECTSEASTART;
_params = [_isWpos, _LZ, _pos, WEST, 0, _tank,_classes,[0.9,1.0],0,""];
};
_group = _params CALL FUNKTIO_LandTransportF;
_number = 0;
{_x setUnitRank (["PRIVATE", "CORPORAL", "SERGEANT"] call RETURNRANDOM);} foreach units _group;
if (isNil"NORANWEES") then {
{
if (random 1 < 0.7) then {_nul = [_x, [0,1] call RETURNRANDOM] SPAWN FUNKTIO_NATORUS;};
sleep 0.1;
} foreach units _group; 
};
{_x setvariable ["DAPPED",true];} foreach units _group;
DONTDELGROUPS = DONTDELGROUPS + [_group];
_group setVariable ["ReInf", true];
_nul = [_group,"ColorBlue"," REINF","b_motor_inf"] SPAWN FUNKTIO_GM2; 
_pos = getposATL player;
if (!("USHelp" in (missionnamespace getvariable "Progress"))) then {{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;sleep 0.1;} foreach units _group;};
while {(((leader _group distance player > 100) || {(leader _group distance _pos > 100)}) && {(count units _group > 0)}) || {((getposATL (vehicle leader _group) select 2) > 0.5 && {({alive _x} count units _group > 0)})}} do {sleep 20;_pos = getposATL player;_group move _pos;if (!isNil"CIVMODE") exitWith {REINF=true;};};
if (!isNil"CIVMODE") exitWith {REINFSTATE = "Stand By"; {_x spawn SAOKDELETE;} foreach units _group;REINF=true;};
if (!isNil"_group" && {{alive _x} count units _group > 0}) then {{if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};[_x] join player;} foreach units _group;REINFSTATE = "Stand By";} else {REINFSTATE = "MIA";};
DONTDELGROUPS = DONTDELGROUPS - [_group];
};


} else {

if (vehicle player distance (locationposition (["ColorBlue"] CALL NEARESTCAMP)) < 400) then {
//FOOT
_xx = random (700);
_yy = 700 - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_start = locationposition (["ColorBlue"] CALL NEARESTCAMP);
while  {surfaceIsWater _start || {{_start distance _x < 500} count VarBlackListF > 0} || {player distance _start < 400}} do {
sleep 1;
_xx = random (700);
_yy = 700 - _xx;
if (random 1 < 0.5) then {_xx = _xx*(-1)};
_yy = _yy*(-1);
_start = [(getposATL player select 0) + _xx,(getposATL player select 1) + _yy,0];
};
_group = [_start, WEST, _classes,[],[],[0.9,1.0]] call SpawnGroupCustom;
{_x setUnitRank (["PRIVATE", "CORPORAL", "SERGEANT"] call RETURNRANDOM);} foreach units _group;
if (isNil"NORANWEES") then {
{
if (random 1 < 0.7) then {_nul = [_x, [0,1] call RETURNRANDOM] SPAWN FUNKTIO_NATORUS;};
sleep 0.1;
} foreach units _group; 
};
{_x setvariable ["DAPPED",true];} foreach units _group;
[_group] SPAWN {
private ["_group","_pos","_pos2","_st"];
_group = _this select 0;
while {{alive _x} count units _group > 0 && {leader _group != player}} do {
_pos = getposATL leader _group;
sleep 120;
if ({alive _x} count units _group > 0 && {leader _group != player} && {(getposATL leader _group) distance _pos < 40}) then {

_pos2 = [((getposATL vehicle player) select 0)+200-(random 400),((getposATL vehicle player) select 1)+200-(random 400),0];
while {surfaceIsWater _pos2} do {_pos2 = [((getposATL vehicle player) select 0)+200-(random 400),((getposATL vehicle player) select 1)+200-(random 400),0];sleep 1;};

{_x setpos _pos2;} foreach units _group;
};
};
};
//if (isNil"ReInfUSA") then {{_nul = [_x,[]] SPAWN ConvertToArmedCivilian;} foreach units _group;};
DONTDELGROUPS pushback _group;
_group setVariable ["ReInf", true];
_nul = [_group,"ColorBlue"," REINF","b_inf"] SPAWN FUNKTIO_GM2; 
_pos = getposATL player;
_group move _pos;
sleep 0.5;





while {(((leader _group distance player > 100) || {(leader _group distance _pos > 100)}) && {(count units _group > 0)}) || {((getposATL (vehicle leader _group) select 2) > 0.5 && {(count units _group > 0)})}} do {sleep 20;_pos = getposATL player;_group move _pos;if (!isNil"CIVMODE") exitWith {};};
if (!isNil"CIVMODE") exitWith {REINFSTATE = "Stand By"; {_x spawn SAOKDELETE;} foreach units _group;REINF=true;};
if (count units _group > 0) then {{if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};[_x] join player;} foreach units _group;REINFSTATE = "Stand By";} else {REINFSTATE = "MIA";};
DONTDELGROUPS = DONTDELGROUPS - [_group];

} else {
_Spos = locationposition (["ColorBlue"] CALL NEARESTCAMP);
if ((random 1 < 0.5 || {_Spos distance player > 4000}) && {isNil"IFENABLED"}) then {
//CHOPPER
_ran = (["AIRC",0] CALL VEHARRAY)+(["AIRC",2] CALL VEHARRAY);
_ran = _ran call RETURNRANDOM;
_group = [(getmarkerpos "WestChopStart"), _pos, _pos, WEST, 40, _ran, 50,_classes,[0.9,1.0],0,1] CALL FUNKTIO_ChopperTransportF;
_number = 0;
{_x setUnitRank (["PRIVATE", "CORPORAL", "SERGEANT"] call RETURNRANDOM);} foreach units _group;
if (isNil"NORANWEES") then {
{
if (random 1 < 0.7) then {_nul = [_x, [0,1] call RETURNRANDOM] SPAWN FUNKTIO_NATORUS;};
sleep 0.1;
} foreach units _group; 
};
{_x setvariable ["DAPPED",true];} foreach units _group;
[_group] SPAWN {
{_x allowdamage false;} foreach units (_this select 0);
waitUntil {sleep 1; vehicle (leader (_this select 0)) == (leader (_this select 0)) || {count units (_this select 0) == 0}};
{_x allowdamage true;} foreach units (_this select 0);
};
DONTDELGROUPS = DONTDELGROUPS + [_group];
_group setVariable ["ReInf", true];
_nul = [_group,"ColorBlue"," REINF","b_mech_inf"] SPAWN FUNKTIO_GM2; 
_pos = getposATL player;
} else {
//LAND VEHICLE
_tank = (["C",2] CALL VEHARRAY)+(["C",0] CALL VEHARRAY);
if (!isNil"IFENABLED") then {_tank = (["C",2] CALL VEHARRAY)+(["C",0] CALL VEHARRAY);};	
_tank = _tank call RETURNRANDOM;
if (_tank in ["B_MRAP_01_F","I_MRAP_03_F"]) then {_classes = [_classes select 0,_classes select 1,_classes select 2];};
//START POS  _di= [_start, getposATL _obj] call SAOKDIRT;
_Spos = locationposition (["ColorBlue"] CALL NEARESTCAMP);
_Spos = [_Spos, 100,0,"(1 - houses) * (1 - sea) * (1 + meadow)",""] CALL SAOKSEEKPOS;
_dir = [_Spos, player] call SAOKDIRT;

_params = [_Spos, getposATL vehicle player, getposATL vehicle player, WEST, 0, _tank,_classes,[0.9,1.0],0];
_isWpos = [player, 1800, 900] CALL SAOKSEARCHPOS;
if (surfaceiswater _isWpos) then {
_tank = ["B_Boat_Armed_01_hmg_F","B_Boat_Transport_01_F"] call RETURNRANDOM; 
_LZ = [_isWpos,getposATL vehicle player] CALL SAOKSEEKSHORE;  
_isWpos = _isWpos CALL SAOKCORRECTSEASTART;
_params = [_isWpos, _LZ, getposATL vehicle player, WEST, 0, _tank,_classes,[0.9,1.0],0,""];
};
_group = _params CALL FUNKTIO_LandTransportF;
_number = 0;
{_x setvariable ["DAPPED",true];} foreach units _group;
DONTDELGROUPS = DONTDELGROUPS + [_group];
_group setVariable ["ReInf", true];
_nul = [_group,"ColorBlue"," REINF","b_motor_inf"] SPAWN FUNKTIO_GM2; 
_pos = getposATL player;
};
};

while {(((leader _group distance player > 100) || {(leader _group distance _pos > 100)}) && {({!isNull _x && {alive _x}} count units _group > 0)}) || {((getposATL (vehicle leader _group) select 2) > 0.5 && {({!isNull _x && {alive _x}} count units _group > 0)})}} do {
sleep 20;
_pos = getposATL player;
_group move _pos;
if (!isNil"CIVMODE") exitWith {REINF=true;};
};
if (!isNil"CIVMODE") exitWith {REINFSTATE = "Stand By"; {_x spawn SAOKDELETE;} foreach units _group;REINF=true;};
if (count units _group > 0) then {{if (!isNil"TeDam" && {isNil{_x getvariable "TeDam"}}) then {_x setvariable ["TeDam",1];_eh = _x addEventHandler ["HandleDamage", {_this call SADAME}];_eh = _x addEventHandler ["Explosion", {_this call SADAME}];};[_x] join player;} foreach units _group;REINFSTATE = "Stand By";} else {REINFSTATE = "MIA";};
DONTDELGROUPS = DONTDELGROUPS - [_group];
};

REINF=true;
