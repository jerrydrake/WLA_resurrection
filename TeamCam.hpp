////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class TeamCamDialog {
    idd = 4455;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
	
	////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pucufa)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Ficery)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Zinupe)
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Jeciwo)
////////////////////////////////////////////////////////

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Team Monitoring"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 36 * GUI_GRID_W;
	h = 22 * GUI_GRID_H;
	
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "#(argb,512,512,1)r2t(rendertarget4,1.0)"; 
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	colorText[] = {1, 1, 1, 1};
};
class RscPicture_1201: RscPicture
{
	idc = 1201;
	text = "#(argb,512,512,1)r2t(rendertarget5,1.0)"; 
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	colorText[] = {1, 1, 1, 1};
};
class RscPicture_1202: RscPicture
{
	idc = 1202;
	text = "#(argb,512,512,1)r2t(rendertarget6,1.0)"; 
	x = 22 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	colorText[] = {1, 1, 1, 1};
};
class RscPicture_1203: RscPicture
{
	idc = 1203;
	text = "#(argb,512,512,1)r2t(rendertarget7,1.0)"; 
	x = 22 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	colorText[] = {1, 1, 1, 1};
};
class RscListbox_1498: _CT_COMBO
{
	idc = 1498;
	x = 22 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onLBSelChanged = "SAOKPIPP = [(lbData [1498,(lbCurSel 1498)]),(lbCurSel 1498)];[(lbText [1500,(lbCurSel 1500)]),""4"",1] SPAWN SAOTEAMCAM;";
};
class RscListbox_1499: _CT_COMBO
{
	idc = 1499;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onLBSelChanged = "SAOKPIPM = (lbCurSel 1499);[(lbText [1500,(lbCurSel 1500)]),""4"",1] SPAWN SAOTEAMCAM;";
};
class RscListbox_1500: _CT_COMBO
{
	idc = 1500;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onLBSelChanged = "[(lbText [1500,(lbCurSel 1500)]),""4""] SPAWN SAOTEAMCAM;";
};
class RscListbox_1501: _CT_COMBO
{
	idc = 1501;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onLBSelChanged = "[(lbText [1501,(lbCurSel 1501)]),""5""] SPAWN SAOTEAMCAM;";
};
class RscListbox_1502: _CT_COMBO
{
	idc = 1502;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onLBSelChanged = "[(lbText [1502,(lbCurSel 1502)]),""6""] SPAWN SAOTEAMCAM;";
};
class RscListbox_1503: _CT_COMBO
{
	idc = 1503;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onLBSelChanged = "[(lbText [1503,(lbCurSel 1503)]),""7""] SPAWN SAOTEAMCAM;";
};
class RscCheckbox_2800: RscCheckbox
{
	idc = 2800;
	text = "SidePIP"; //--- ToDo: Localize;
	x = 17.2 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	strings[] = 
	{
		"S-PIP OFF"
	};
	checked_strings[] = 
	{
		"S-PIP ON"
	};
	onCheckBoxesSelChanged = "if ((_this select 2) == 0) then {SAPIPCAM = nil;}; [(lbText [1500,(lbCurSel 1500)]),""4"",1] SPAWN SAOTEAMCAM;";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Exit"; //--- ToDo: Localize;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};

