
class SlingDialog {
    idd = 14335;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Vebeda)
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
	text = "SlingLoad"; //--- ToDo: Localize;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 21.5 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "On Ground"; //--- ToDo: Localize;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Attached (Max 1)"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 6 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.0)";
	canDrag = 1; // 1 (true) to allow item dragging 1400
	onLBDrop = "if ((_this select 3) == 1501) then {(((_this select 4)select 0)select 0) SPAWN SAOKSLINGREM;}; false";
	onMouseButtonDblClick = "(lbCurSel 1500) SPAWN SAOKSLINGADD;false";

};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.1)";
	canDrag = 1; // 1 (true) to allow item dragging 1400
	onLBDrop = "if ((_this select 3) == 1500) then {(((_this select 4)select 0)select 0) SPAWN SAOKSLINGADD;}; false";
	onMouseButtonDblClick = "(lbCurSel 1501) SPAWN SAOKSLINGREM;false";

};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Add"; //--- ToDo: Localize;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbCurSel 1500) SPAWN SAOKSLINGADD;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Remove"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbCurSel 1501) SPAWN SAOKSLINGREM;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Exit"; //--- ToDo: Localize;
	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};