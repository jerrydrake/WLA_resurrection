////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////
//DIALOG FOR CUSTOM UNIT SELECTION FOR GEAR System 
class GEARDialog {
    idd = 1212;
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
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Cyqyno)
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
	text = "Edit Gear For"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 9 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.4)";
	onLBSelChanged = "(lbText [1500,(lbCurSel 1500)]) CALL SAOKUNITSELTEXT;";
	onMouseButtonDblClick = "closeDialog 0; _n = [] SPAWN SaOkGear;_n = [] SPAWN F_SaOkGearCam; false";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Enter"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0; _n = [] SPAWN SaOkGear;_n = [] SPAWN F_SaOkGearCam;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "WLA Menu"; //--- ToDo: Localize;
	x = 18 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN WLADialog;";
};
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 0;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 16.5 * GUI_GRID_H;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 0;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 14.5 * GUI_GRID_H;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.95)";
};
class RscListbox_1501: _CT_COMBO
{
	idc = 1501;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Add Skill"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "[(lbText [1500,(lbCurSel 1500)]),(lbText [1501,(lbCurSel 1501)])] CALL SAOKADDSKILLP;(lbText [1500,(lbCurSel 1500)]) CALL SAOKUNITSELTEXT;";
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

};
};

