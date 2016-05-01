private ["_start","_LZ","_infwaypoint","_side","_dir","_chopclass","_unitclasses","_skill","_startC","_chop","_groupCT","_h","_wp1"];
//INIT
//Chopper or Plane spawn position and exit
_start = _this select 0;
//Position were infantry cargo eject
_LZ = _this select 1;
//Position were infantry head before guarding it
_infwaypoint = _this select 2;
//Chopper and infatry side
_side = _this select 3;
//Chopper or Plane direction when spawned
_dir = _this select 4;
//Chopper or Plane class
_chopclass = _this select 5;
//Chopper or Plane height when spawned. For Chopper must be under 100m (50 is good), because of the current buggy AI flying
_h = _this select 6;
//Array of unitclasses that form the infantry group. Size of the group is the amount of classes you enter
_unitclasses = _this select 7;
//Array skill range for infantry group e.g. [0.4,0.7]
_skill = _this select 8;
//Transport only one group (0) or bring more cloned inf until shot down (1). DISABLED!!!!!!!!  
//_num = _this select 9;
//Language 0 is none
//_lang = _this select 10;
_startC = [_start select 0, _start select 1, _h];
_chop = [_startC, _dir, _chopclass, _side] call SPAWNVEHICLE;
CantCommand pushback (_chop select 2);
_groupCT = [_start, _side, _unitclasses,[],[],_skill] call SpawnGroupCustom;
DONTDELGROUPS pushback _groupCT;
{_x moveincargo (_chop select 0);} foreach units _groupCT;
(_chop select 2) move _LZ;
(_chop select 2) setbehaviour "CARELESS";
(_chop select 2) allowfleeing 0;
_wp1= _groupCT addWaypoint [_infwaypoint, 0]; 
[_groupCT, 1] setWaypointType "GUARD";
(_chop select 0) flyinheight 80;
[_chop,_groupCT,_LZ,_start,_chopclass] SPAWN SAOKSHF19;
_groupCT