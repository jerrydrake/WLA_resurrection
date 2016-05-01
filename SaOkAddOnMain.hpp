
class SaOkAddOnMain {
    idd = 2000;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Duwohy)
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Pupulo)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Keseqa)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Vymohy)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Qyfyqo)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Fijopa)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Hupobo)
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
	text = "Mod Main Menu"; //--- ToDo: Localize;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 26 * GUI_GRID_W;
	h = 9 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Land Vehicles"; //--- ToDo: Localize;
	x = 7 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONVEHDIA;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Land Vehicles 2"; //--- ToDo: Localize;
	x = 7 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONVEH2DIA;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Air Vehicles "; //--- ToDo: Localize;
	x = 7 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONAIRDIA;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Units"; //--- ToDo: Localize;
	x = 7 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONUNITDIA;";
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Reset Veh Zones"; //--- ToDo: Localize;
	x = 19 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "[] CALL SAOKRESETVEHZ;";
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "WLA Menu"; //--- ToDo: Localize;
	x = 23.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN WLADialog;";
};
class RscButton_1606: RscButton
{
	idc = 1606;
	text = "Save"; //--- ToDo: Localize;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 12.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "[1,1] CALL SAOKGEARSLOT;closeDialog 0;[] SPAWN SAOKADDONMAIN;";
};
class RscButton_1607: RscButton
{
	idc = 1607;
	text = "Load"; //--- ToDo: Localize;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 14.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "[1] CALL SAOKGEARSLOT;closeDialog 0;[] SPAWN SAOKADDONMAIN;";
};
class RscFrame_1801: RscFrame
{
	idc = 1801;
	text = "Slot1"; //--- ToDo: Localize;
	x = 16.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
};
class RscFrame_1802: RscFrame
{
	idc = 1802;
	text = "Slot2"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
};
class RscFrame_1803: RscFrame
{
	idc = 1803;
	text = "Slot3"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
};
class RscButton_1608: RscButton
{
	idc = 1608;
	text = "Save"; //--- ToDo: Localize;
	x = 21.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "[2,1] CALL SAOKGEARSLOT;closeDialog 0;[] SPAWN SAOKADDONMAIN;";
};
class RscButton_1609: RscButton
{
	idc = 1609;
	text = "Save"; //--- ToDo: Localize;
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 12.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "[3,1] CALL SAOKGEARSLOT;closeDialog 0;[] SPAWN SAOKADDONMAIN;";
};
class RscButton_1610: RscButton
{
	idc = 1610;
	text = "Load"; //--- ToDo: Localize;
	x = 21.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "[2] CALL SAOKGEARSLOT;closeDialog 0;[] SPAWN SAOKADDONMAIN;";
};
class RscButton_1611: RscButton
{
	idc = 1611;
	text = "Load"; //--- ToDo: Localize;
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 14.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "[3] CALL SAOKGEARSLOT;closeDialog 0;[] SPAWN SAOKADDONMAIN;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

/*

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Select Addon Section"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 15.5 * GUI_GRID_W;
	h = 7 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Land Vehicles"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.3 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONVEHDIA;";
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Other Vehicles"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 12.4 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.3 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONVEH2DIA;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Air Vehicles"; //--- ToDo: Localize;
	x = 16.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONAIRDIA;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Back to WLA"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN WLADialog;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Units"; //--- ToDo: Localize;
	x = 16.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONUNITDIA;";
};

*/
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

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};

//MAIN W, SEC W, PISTOL, BACKPACK, VEST, UNIFORM, HAT, GOGGLES, CHANGE UNIT