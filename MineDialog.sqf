//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
private ["_bb","_pos","_radius","_mines","_mineT","_ok","_nul"];

if (!dialog) then {
_bb= _this select 0;
_pos= _this select 1;
{unassignvehicle _x;[_x] ordergetin false;_x action ["GetOut",vehicle _x];} foreach _bb;

_radius = 10;
_mines = 5;
_mineT = "Claymore Mine";
disableserialization;
_ok = createDialog "MinefieldDialog"; 
lbAdd [113, "10m"];
lbAdd [113, "20m"];
lbAdd [113, "30m"];
lbAdd [113, "40m"];
lbAdd [113, "50m"];
lbSetCurSel [113, 0];
lbAdd [114, "1"];
lbAdd [114, "2"];
lbAdd [114, "5"];
lbAdd [114, "10"];
lbAdd [114, "20"];
lbSetCurSel [114, 2];

lbAdd [115, "Claymore Mine"];
lbAdd [115, "APERS Bounding Mine"];
lbAdd [115, "APERS Mine"];
lbAdd [115, "APERS Tripwire Mine"];
lbAdd [115, "M6 SLAM Mine"];
lbSetCurSel [115, 0];
sleep 0.1;
while {dialog} do { 
	if ((lbCurSel 113) == 0) then {_radius = 10;};
	if ((lbCurSel 113) == 1) then {_radius = 20;};
	if ((lbCurSel 113) == 2) then {_radius = 30;};
	if ((lbCurSel 113) == 3) then {_radius = 40;};
	if ((lbCurSel 113) == 4) then {_radius = 50;};
	if (((lbCurSel 114) == 0) ) then {_mines = 1;};
	if (((lbCurSel 114) == 1) ) then {_mines = 2;};
	if (((lbCurSel 114) == 2) ) then {_mines = 5;};
	if (((lbCurSel 114) == 3) ) then {_mines = 10;};
	if (((lbCurSel 114) == 4) ) then {_mines = 20;};
	if (((lbCurSel 115) == 0) ) then {_mineT = "Claymore Mine";};
	if (((lbCurSel 115) == 1) ) then {_mineT = "APERS Bounding Mine";};
	if (((lbCurSel 115) == 2) ) then {_mineT = "APERS Mine";};
	if (((lbCurSel 115) == 3) ) then {_mineT = "APERS Tripwire Mine";};
	if (((lbCurSel 115) == 4) ) then {_mineT = "M6 SLAM Mine";};
	if (((lbCurSel 115) == 5) ) then {_mineT = "AT Mine";};
	sleep 0.1;
};
_nul = [_bb,_pos,_radius,_mines,_mineT] execFSM "BuildMineField.fsm";
};

