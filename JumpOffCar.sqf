//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

private ["_xx","_yy"];
sleep 3;
_xx = _this select 0;
_yy = _this select 1;
_yy forcespeed 0;
sleep 2;
sleep (random 4);
unassignvehicle _xx;
//_xx action ["eject",_yy];
_xx action ["GetOut",vehicle _xx];

