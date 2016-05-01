////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class VillageDialog {
    idd = -1;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Numiri)
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
	text = "Village Menu"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 13.5 * GUI_GRID_H;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "Hello stranger, what business do you have in mind?"; //--- ToDo: Localize;
	x = 20 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Specialty[30]/Vehicle[20]/Bribe[400]"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 19.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 9.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Buy"; //--- ToDo: Localize;
	x = 19 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "(lbText [1500,(lbCurSel 1500)]) SPAWN OSTAMASSA;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Exit"; //--- ToDo: Localize;
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "WLA"; //--- ToDo: Localize;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN WLADialog;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Recruit"; //--- ToDo: Localize;
	x = 19 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;1 SPAWN SAOKUSHOPD;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
