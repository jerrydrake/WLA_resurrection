
private ["_pos","_anim","_chair","_ran","_group","_unit","_dir","_obj"];
_pos = _this select 0;
_anim = ["HubSittingChairUA_idle1","HubSittingChairUA_idle2","HubSittingChairUA_idle3","HubSittingChairUA_move1","HubSittingChairUB_idle1","HubSittingChairUB_idle2","HubSittingChairUB_idle3","HubSittingChairUB_move1","HubSittingChairUC_idle1","HubSittingChairUC_idle2","HubSittingChairUC_idle3","HubSittingChairUC_move1"]call RETURNRANDOM;
_chair = ["Land_ChairPlastic_F","Land_ChairWood_F","Land_CampingChair_V1_F"]call RETURNRANDOM;
_ran = CIVS1 call RETURNRANDOM;
_group = [[10000,10000,0], CIVILIAN, [_ran],[],[],[0.6,0.9]] call SpawnGroupCustom;
_unit = leader _group;
_dir = ([_pos, getposATL (_this select 1)] call SAOKDIRT) + 180;
_obj = createVehicle [_chair,_pos, [], 0, "CAN_COLLIDE"]; 
_obj disableCollisionWith _unit; 
_obj setpos _pos;
_obj setvectorup (surfaceNormal (getposATL _obj));
_obj setdir _dir;
if (_chair == "Land_ChairPlastic_F") then {_obj setdir (_dir + 90);};
_unit setdir (_dir+180);
_group setformdir (_dir+180);
_unit switchmove _anim;
_unit setbehaviour "CARELESS";
_unit disableAI "AUTOTARGET";
_unit disableAI "TARGET";
//_unit disableAI "FSM";
_unit disableAI "MOVE";
//_unit setpos _pos;
_unit setpos getposatl _obj;
_unit setvariable ["CivNo",1];
//_unit attachto [_obj,[0,0,0]]; 
[_unit, _obj]


//Lie Down Hepler_InjuredNon
//under vehicle HubFixingVehicleProne_idle1  InBaseMoves_repairVehiclePne