private ["_ied","_m","_tar","_pos","_owner","_dis","_camp","_old"];
//["IEDLandBig_F","IEDLandSmall_F","IEDUrbanBig_F","IEDUrbanSmall_F"] "SatchelCharge_Remote_Ammo_Scripted"
//_m = ["IEDLandBig_F","IEDLandSmall_F","IEDUrbanBig_F","IEDUrbanSmall_F"] call RETURNRANDOM; 
//_m = ["IEDLandBig_Remote_Ammo","IEDLandSmall_Remote_Ammo","IEDUrbanBig_Remote_Ammo","IEDUrbanSmall_Remote_Ammo"] call RETURNRANDOM; 
if (!isNil"VarDisableArty") exitWith {};
_pos = _this select 0;
_owner = _this select 1;
_dis = _this select 2;
_camp = if (count _this > 3) then {_this select 3} else {""};
if (isNil"_pos" || {isNil"_camp"} || {isNil"_owner"} || {isNil"_dis"}) exitWith {};
_tar = [WEST,CIVILIAN];
if (_owner == "WEST") then {_tar = [EAST];};
_m = ["SatchelCharge_Remote_Ammo_Scripted","DemoCharge_Remote_Ammo_Scripted","ClaymoredirectionalMine_Remote_Ammo_Scripted"]call RETURNRANDOM;
_ied = createVehicle [_m, _pos, [], 0, "NONE"];
_pos = getposATL _ied;
_old = if (_camp != "") then {getmarkercolor _camp} else {""};
waitUntil {sleep 2; isNull _ied || {vehicle player distance _ied > _dis} || {!alive _ied} || {{(side _x in _tar)} count (_pos nearEntities ["Man",5]) > 0} || {_camp != "" && {_old != getmarkercolor _camp}}};
if (!alive _ied || {{(side _x in _tar)} count (_pos nearEntities ["Man",5]) > 0}) then {_ied setdamage 1;} else {deletevehicle _ied;};

