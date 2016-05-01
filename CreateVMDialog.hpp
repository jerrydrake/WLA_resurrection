////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class CreateVMDialog {
    idd = 12453;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
	
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Cukoso)
////////////////////////////////////////////////////////
class RscPicture_1266: RscPicture
{
	idc = 1266;
	//text = "#(argb,8,8,3)color(1,1,1,1)";
	colorText[] = {1, 1, 1, 0.4};
	text="WLA.paa";
	x = safeZoneX + safeZoneW - ((1+safeZoneH)/(2.8181))*0.8; 
	y = safeZoneY + safeZoneH - ((1+safeZoneH)/(2.8181))*0.4;
	h = ((1+safeZoneH)/(2.8181))*0.4;
	w = ((1+safeZoneH)/(2.8181))*0.8; 
};	
class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Call In Platoons (Marked Vehicle Zones)"; //--- ToDo: Localize;
	x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 23.5 * GUI_GRID_W;
	h = 19 * GUI_GRID_H;
};

class RscListbox_1499: _CT_COMBO
{
	idc = 1499;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onLBSelChanged = "(lbText [1499,(lbCurSel 1499)]) CALL SAOKMZCAT;";
};

class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 10.5 * GUI_GRID_H;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Content Selection"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Category"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscText_1002: RscText
{
	idc = 1002;
	text = "Platoon Content "; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Add Vehicle"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "(lbText [1500,(lbCurSel 1500)]) CALL SAOKMZADD;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Remove Vehicle"; //--- ToDo: Localize;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "(lbCurSel 1501) CALL SAOKMZREM;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Call In"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "[(lbCurSel 1501)] CALL SAOKMZCALLIN;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "WLA Menu"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN WLADialog;";
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};

