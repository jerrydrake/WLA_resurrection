private ["_f1","_car","_cl","_f2"];
_f1 = {
while {!isNull (_this select 0) && {alive (_this select 0)} && {(_this select 0) distance vehicle player < 400}} do {
waitUntil {sleep 1; isNull (_this select 0) || {(speed (_this select 0) > 25 && {count crew (_this select 0) > 0})} || {!alive (_this select 0)}};
sleep (random 13);
if (random 1 < 0.4) then {
//Driver throws
_dPos = (_this select 0) modelToWorld [-1,0.6,0.15];
if (!(player in (_this select 0))) then {
_nul = [_dPos, "Land_BottlePlastic_V1_F",velocity (_this select 0),(_this select 0)] SPAWN FUNKTIO_ThrowObject;
};
};
};
if (!isNull (_this select 0) ) then {
(_this select 0) setvariable ["Trasher",nil];
(_this select 0) removeAllEventHandlers "hit";
};
};
_f2 = {
while {!isNull (_this select 0) && {alive (_this select 0)} && {(_this select 0) distance vehicle player < 400}} do {
waitUntil {sleep 1; isNull (_this select 0) || {(speed (_this select 0) > 25 && {count crew (_this select 0) > 0})} || {!alive (_this select 0)}};
sleep (random 1);
if (speed (_this select 0) > 25 && {random 1 < 0.4}) then {
//Stuff drops from back
_dPos = (_this select 0) modelToWorld [0,-2,-0.1];
if (!(player in (_this select 0))) then {
_nul = [_dPos, ((_this select 1) call RETURNRANDOM),velocity (_this select 0),(_this select 0)] SPAWN FUNKTIO_ThrowObject;
};
};

};
};
//"C_Offroad_01_F"
_cl = ["Land_Bucket_F","Land_Can_Dented_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_CanisterPlastic_F","Land_ExtensionCord_F","Land_Gloves_F","Land_Grinder_F","Land_Hammer_F","Land_MultiMeter_F","Land_BottlePlastic_V1_F","Land_Pliers_F","Land_Suitcase_F","Land_SurvivalRadio_F","Land_Meter3m_F","Land_Wrench_F","Land_DrillAku_F"];
FUNKTIO_ThrowObject = compile preprocessfileLineNumbers "ThrowObject.sqf";
while {true} do {
waitUntil {sleep 5; {isNil{_x getvariable "Trasher"}} count ((getposATL vehicle player) nearEntities [["C_Offroad_01_F"],200]) > 0};
_car = _this select 0;
{
if (isNil{_x getvariable "Trasher"}) then {
_x setvariable ["Trasher",1];
_x addEventHandler ["hit",{[_this select 0,_this select 1,(vehicle (_this select 0))] SPAWN FTrashCan}];
[_x] SPAWN _f1;
[_x,_cl] SPAWN _f2;
};
sleep 0.1;
} foreach ((getposATL vehicle player) nearEntities [["C_Offroad_01_F"],200]);
sleep 5;
};