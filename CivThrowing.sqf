private ["_voice","_cl"];
_voice = {
private ["_v"];
_v = ["Y1","Y2","Y3","Y4","Y5","Y6","Y7","steal13","steal12","steal11","steal10","steal9","steal8","steal7","steal6"] call RETURNRANDOM;
[_this, "CivV", "CivV\sounds.bikb", ""] CALL SAOKKBTOPIC;
[_this, player, "CivV", _v] SPAWN SAOKKBTELL;
};

SAOKff = {
private ["_pos","_cl","_vel","_veh","_y","_xx","_z"];
_pos = _this select 0;
_cl = _this select 1;
_vel = _this select 2;
_veh = createVehicle [_cl, _pos, [], 0, "CAN_COLLIDE"];
_veh setvariable ["Tobj",1];
_veh disableCollisionWith (_this select 3); 
_veh setpos _pos;
_y = random 1;
_xx = random 1;
_z = random 1;
_veh setvectorUp [_y, _xx, _z];
sleep 0.05;
_veh setvelocity [(_vel select 0)*0.5- 2 +random 4,(_vel select 1)*0.5- 2 +random 4,(_vel select 2)*0.5+1+random 1];
[_veh] SPAWN {sleep 15; deletevehicle (_this select 0);};
};

SAOKffa = {
private ["_ani","_t","_upS","_h","_voice","_dPos","_dir","_speedd","_speed","_nul"];
sleep (random 4);
_voice = _this select 2;
if !(isNil{(_this select 0) getvariable "Talki"} && {[vehicle player,(_this select 0)] CALL FUNKTIO_LOS}) exitWith {};
//CIV
//1.4 up
//1 middle
_t = 1;
_upS = 4;
_ani = "AwopPercMstpSgthWnonDnon_end";
_h = ((eyepos (_this select 0)) select 2)-((getposASL (_this select 0)) select 2);
if (_h < 0.7) then {_ani = "AwopPpneMstpSgthWnonDnon_end";_t = 1; _upS = 8;};
if (_h > 0.7 && _h < 1.3) then {_t = _t + 1;_h = 1.7;};
(_this select 0) playmovenow _ani;
[(_this select 0),_voice,(_t*0.5)] SPAWN {sleep (_this select 2); (_this select 0) spawn (_this select 1);};
sleep _t;
_dPos = (_this select 0) modelToWorld [0,1,_h];
_dir = [_dPos, player] call SAOKDIRT;
_speedd =20+(random 20);
_speed = [((sin _dir)*_speedd*(0.80+random 0.4)),((cos _dir)*_speedd*(0.80+random 0.4)),(0.1+random _upS)];
_nul = [_dPos, (SAOKffb call RETURNRANDOM),_speed,(_this select 0)] SPAWN SAOKff;
};

sleep 10;
//"C_Offroad_01_F"
SAOKffb = ["Land_Baseball_01_F","Land_Basketball_01_F","Land_Football_01_F","Land_Rugbyball_01_F","Land_Volleyball_01_F","Land_CanisterFuel_F","Land_CanisterOil_F","Land_CanisterPlastic_F","Land_TacticalBacon_F","Land_CanisterPlastic_F","Land_CanisterPlastic_F","Land_CanisterPlastic_F","Land_Bucket_F","Land_Can_Dented_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_CanisterPlastic_F","Land_Grinder_F","Land_Hammer_F","Land_MultiMeter_F","Land_BottlePlastic_V1_F","Land_Pliers_F","Land_Meter3m_F","Land_Wrench_F"];
FUNKTIO_ThrowObject = compile preprocessfileLineNumbers "ThrowObject.sqf";
while {true} do {
waitUntil {sleep 10; (player CALL SAOKNEARVILRELA) in ["Hostile","Angry"] && {([getposATL player] CALL SAOKNEARVILP) distance vehicle player < 300}};
while {(player CALL SAOKNEARVILRELA) in ["Hostile","Angry"] && {([getposATL player] CALL SAOKNEARVILP) distance vehicle player < 300}} do {
// knee AwopPknlMstpSgthWrflDnon_End (start, throw) stand AwopPercMstpSgthWnonDnon_end prone AwopPpneMstpSgthWnonDnon_end
_ar = (player nearEntities [["Civilian"],30]);
_count = count _ar - 1;
if (_count >= 0) then {
for "_i" from 0 to _count do {
_xx = _ar select _i;
if (isNil{_xx getvariable "Uhkailtu"} && {isNil{_xx getvariable "Talki"}} && {isNil{_xx getvariable "CivNo"}} && {[vehicle player,_xx] CALL FUNKTIO_LOS}) then {
[_xx,[],_voice] SPAWN SAOKffa;
};
sleep 0.1;
};
};
sleep (4+(random 7));
};
};