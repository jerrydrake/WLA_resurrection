private ["_pos","_cl","_vel","_veh","_y","_xx","_z"];

_pos = _this select 0;
_cl = _this select 1;
_vel = _this select 2;
_veh = createVehicle [_cl, _pos, [], 0, "CAN_COLLIDE"];
_veh setpos _pos;


_y = random 1;
_xx = random 1;
_z = random 1;

_veh setvectorUp [_y, _xx, _z];

sleep 0.05;
_veh setvelocity [(_vel select 0)*1.1,(_vel select 1)*1.1,abs ((_vel select 2)*1.1)+0.5];
[_veh] SPAWN {sleep 35; deletevehicle (_this select 0);};

