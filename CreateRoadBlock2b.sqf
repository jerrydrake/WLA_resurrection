
private ["_p","_R","_cRoads","_rA","_rB","_di","_rCenter","_life","_rad","_p2","_data","_p2b","_p3","_o","_p2c","_p4","_gds","_ucc","_classes","_group","_nul"];
_rCenter = _this select 0;
_di = _this select 1;
_di2 = _di + 180;
_rCenter =  [(_rCenter select 0)+((sin _di2)*3),(_rCenter select 1)+((cos _di2)*3),0];

_rA = [(_rCenter select 0)+((sin _di)*2),(_rCenter select 1)+((cos _di)*2),0];
_rad = _di + 180;
_rB = [(_rCenter select 0)+((sin _rad)*2),(_rCenter select 1)+((cos _rad)*2),0];

_life = [];
_rad = _di + 90;
_p = [(_rCenter select 0)+((sin _rad)*20),(_rCenter select 1)+((cos _rad)*20),0];
_rad = _di + 270;
_p2 = [(_rCenter select 0)+((sin _rad)*20),(_rCenter select 1)+((cos _rad)*20),0];
if (count _this < 2) then {
_data = [_p,_p2,"Land_BagFence_Long_F"] CALL FUNKTIO_DrawFence;
_life = _life + (_data select 0);
};

_rad = _di + 180;
_p2b = [(_rCenter select 0)+((sin _rad)*7),(_rCenter select 1)+((cos _rad)*7),0];
_rad = _di + 270;
_p3 = [(_p2b select 0)+((sin _rad)*7),(_p2b select 1)+((cos _rad)*7),0];
_o = createVehicle ["Land_BagBunker_Small_F", _p3, [], 0, "CAN_COLLIDE"];
_o setdir (_di+270);
_life = _life + [_o];

_rad = _di + 180;
_p2c = [(_rCenter select 0)+((sin _rad)*-7),(_rCenter select 1)+((cos _rad)*-7),0];

_gds = [];
_ucc = [ENEMYC1,ENEMYC2,ENEMYC3] call RETURNRANDOM;
_classes = [_ucc call RETURNRANDOM];
_group = [_p3, EAST, _classes,[],[],[0.4,0.8]] call SpawnGroupCustom;
leader _group setpos _p3;
leader _group setunitpos "UP";
leader _group setformdir (_di+90);
_gds = _gds + [leader _group];

_life = _life + _gds;
_rad = _di + 180;
//+((sin _rad)*(-2))
_p = [(_rCenter select 0)+((sin _rad)*2),(_rCenter select 1)+((cos _rad)*2),0];
_o = createVehicle ["Land_BarGate_F", _p, [], 0, "CAN_COLLIDE"];
_wTm = _o worldToModel _p;
_o allowdamage false;
_p = [(_p select 0)+(_wTm select 0),(_p select 1)+(_wTm select 1),0];
sleep 0.5;
_o setpos _p;
_o setdir _di;
_o allowdamage false;
_life = _life + [_o];

//RAN VEH GUARD


_nul = [_o,_gds] SPAWN {
private ["_o","_gds","_gP"];
_o = _this select 0;
_gds = _this select 1;
_gP = (getposATL _o);
while {!isNull _o && {{!alive _x} count _gds == 0}} do {  
waitUntil {sleep 1; isNull _o || {{!alive _x} count _gds > 0} || {{count crew _x > 0 && (driver _x != player || {captive player && {!isNil{(driver _x) getvariable "OpenGate"}}})} count (_gP nearEntities [["Car"],30]) > 0}}; 
if (isNull _o || {{!alive _x} count _gds > 0}) exitWith {};
_o animate ["Door_1_rot", 1];  
waitUntil {sleep 1; isNull _o || {{!alive _x} count _gds > 0}  || {{count crew _x > 0 && (driver _x != player || {captive player && {!isNil{(driver _x) getvariable "OpenGate"}}})} count (_gP nearEntities [["Car"],30]) == 0}}; 
if (isNull _o || {{!alive _x} count _gds > 0}) exitWith {};
_o animate ["Door_1_rot", 0];  
};  
};


waitUntil {sleep 10; player distance _rCenter > 1500 || {{isNull _x} count _gds > 0 && {player distance _rCenter > 1000}}};
{_x spawn SAOKDELETE;} foreach _life; 
//[_someId3, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
//hint format ["%1",_cRoads]; "Land_BagBunker_Small_F" "Land_BagFence_Long_F"
