private ["_cl","_dPos","_velocity","_nul","_timeA"];
if (vehicle (_this select 1) != _this select 1) then {
(_this select 0) removeAllEventHandlers "hit";

_velocity = velocity (_this select 2);
_timeA = time + 0.5;
while {!(_velocity isEqualTo [0,0,0]) && {_timeA < time}} do {_velocity = velocity (_this select 2);};

//hint format ["%1",_velocity];
_cl = ["Land_Bucket_F","Land_Can_Dented_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_CanisterPlastic_F","Land_ExtensionCord_F","Land_Gloves_F","Land_Grinder_F","Land_Hammer_F","Land_MultiMeter_F","Land_BottlePlastic_V1_F","Land_Pliers_F","Land_Suitcase_F","Land_SurvivalRadio_F","Land_Meter3m_F","Land_Wrench_F","Land_DrillAku_F"];


for "_i" from 0 to 7 do {
_dPos = (_this select 0) modelToWorld [-0.5+(random 1),-1-(random 2),0.2];
_nul = [_dPos, (_cl call RETURNRANDOM),_velocity ,vehicle (_this select 1)] SPAWN FUNKTIO_ThrowObject2;
};
};
