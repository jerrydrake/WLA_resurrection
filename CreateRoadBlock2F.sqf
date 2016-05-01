//[_Roadpos] SPAWN F_GREENROADBLOCK;
private ["_p","_R","_cRoads","_rA","_rB","_di","_rCenter","_life","_rad","_p2","_data","_p2b","_p3","_o","_p2c","_p4","_gds","_ucc","_classes","_group","_nul"];
_p = _this select 0;
_nR =(_p nearroads 20);
if (count _nR == 0) exitWith {};
_R = ((_p nearroads 20) select 0);
_cRoads = roadsConnectedTo _R;
if (count _cRoads != 2) exitWith {};
_rA = getposATL (_cRoads select 0);
_rB = getposATL (_cRoads select 1);
_di = [_rB, _rA] call SAOKDIRT;

_rCenter = getposATL _R;

_life = [];
_rad = _di + 90;
_p = [(_rCenter select 0)+((sin _rad)*20),(_rCenter select 1)+((cos _rad)*20),0];
_rad = _di + 270;
_p2 = [(_rCenter select 0)+((sin _rad)*20),(_rCenter select 1)+((cos _rad)*20),0];
_ranW = ["Land_BagFence_Long_F","Land_HBarrier_3_F","Land_HBarrier_3_F"] call RETURNRANDOM;
if (!isNil"IFENABLED") then {_ranW = ["Land_fort_rampart","Land_fort_bagfence_long","Land_fort_bagfence_long","Land_Mil_WallBig_4m_F","Land_BagFence_Long_F","Land_BagFence_Long_F"] call RETURNRANDOM;};

if (count _this < 2) then {
_data = [_p,_p2,_ranW] CALL FUNKTIO_DrawFence;
_life append (_data select 0);
};

_rad = _di + 180;
_p2b = [(_rCenter select 0)+((sin _rad)*7),(_rCenter select 1)+((cos _rad)*7),0];
_rad = _di + 270;
_p3 = [(_p2b select 0)+((sin _rad)*7),(_p2b select 1)+((cos _rad)*7),0];
_post = createVehicle ["Land_BagBunker_Small_F", _p3, [], 0, "CAN_COLLIDE"];
_post setdir (_di+270);
[_post] CALL GUARDPOST;
_post setvariable ["IsRoadBlock",1];
_post allowdamage false;
_post setvariable ["CC",1];
_post setvariable ["StaticW",[]];
_post setvariable ["StaticO",[]];
_post setvariable ["StaticOS",[]];
_post setvariable ["NotReady",1];

_rad = _di + 180;
_p2c = [(_rCenter select 0)+((sin _rad)*-7),(_rCenter select 1)+((cos _rad)*-7),0];
_rad = _di + 90;
_p4 = [(_p2c select 0)+((sin _rad)*7),(_p2c select 1)+((cos _rad)*7),0];
_o = createVehicle ["Land_BagBunker_Small_F", _p4, [], 0, "CAN_COLLIDE"];
_o setdir (_di+90);
_life = _life + [_o];
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
_life pushback _o;

_nul = [_o] SPAWN {
private ["_o","_gP"];
_o = _this select 0;
_gP = (getposATL _o);
while {!isNull _o} do {  
waitUntil {sleep 1; isNull _o || {{count crew _x > 0 && (driver _x != player || {captive player && {!isNil{(driver _x) getvariable "OpenGate"}}})} count (_gP nearEntities [["Car"],30]) > 0}}; 
if (isNull _o) exitWith {};
_o animate ["Door_1_rot", 1];  
waitUntil {sleep 1; isNull _o  || {{count crew _x > 0 && (driver _x != player || {captive player && {!isNil{(driver _x) getvariable "OpenGate"}}})} count (_gP nearEntities [["Car"],30]) == 0}}; 
if (isNull _o) exitWith {};
_o animate ["Door_1_rot", 0];  
};  
};


{
_class = typeof _x;
_earlier = _post getvariable "StaticO";
_id = "N"+(format["%1",count _earlier]);
_p = getPosWorld _x;
_post setvariable ["StaticO",_earlier + [[_class,_p, direction _x, (surfaceNormal (getPosWorld _x)),_id]]];
_x spawn SAOKDELETE;
} foreach _life;
_ran = ["AA-Guard","AT-Guard"] call RETURNRANDOM;
{
_post setvariable [_x,1];
} foreach ["MG-Guard",_ran,"Sniper-Guard","Medic-Guard"];
_post setvariable ["NotReady",nil];
if (player distance _post < (["Lb"] CALL DIS)) then {_aika = time + 100; waitUntil {sleep 2; _post in activatedPost || {_aika < time}};sleep 5;_post CALL SAOKCONSRESETOBJ;};





