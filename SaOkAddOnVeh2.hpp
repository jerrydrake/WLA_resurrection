
class SaOkAddOnVeh2 {
    idd = 2004;
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

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Enable Addon Content - Civ/Supply Vehicles"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 37.5 * GUI_GRID_W;
	h = 23.5 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};


class RscText_1001: RscText
{
	idc = 1001;
	text = "NATO Supply"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};


class RscText_1007: RscText
{
	idc = 1007;
	text = "CSAT Supply"; //--- ToDo: Localize;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1505: RscListbox
{
	idc = 1505;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};







class RscText_1013: RscText
{
	idc = 1013;
	text = "GREEN Supply"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1510: RscListbox
{
	idc = 1510;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};


class RscText_1019: RscText
{
	idc = 1019;
	text = "Civ Vehicles"; //--- ToDo: Localize;
	x = 32.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1515: RscListbox
{
	idc = 1515;
	x = 32.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};





class RscText_1024: RscText
{
	idc = 1024;
	text = "ALL UNIT LIST"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 0.5 * GUI_GRID_H;
};
class RscListbox_1520: RscListbox
{
	idc = 1520;
	x = 1.6 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 12.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
	//onLBSelChanged = "(getText(configfile >> ""CfgVehicles"" >> (lbText [1520, _this select 1]) >> ""displayName"")) SPAWN HINTSAOK;";
};
class RscListbox_1521: RscListbox
{
	idc = 1521;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
};
class RscText_1025: RscText
{
	idc = 1025;
	text = "EDIT SIDE"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.5 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Add"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 2.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "missionnamespace setvariable [""AddIndex1520"",lbCurSel 1520];[lbCurSel 1520,lbCurSel 1521] CALL SAOKADDONVEH2ADD;closeDialog 0;[] SPAWN SAOKADDONVEH2DIA;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Remove Last"; //--- ToDo: Localize;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "missionnamespace setvariable [""AddIndex1520"",lbCurSel 1520];[lbCurSel 1521] CALL SAOKADDONVEH2REMLAST;closeDialog 0;[] SPAWN SAOKADDONVEH2DIA;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Back"; //--- ToDo: Localize;
	x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKADDONMAIN;";
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

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};

//MAIN W, SEC W, PISTOL, BACKPACK, VEST, UNIFORM, HAT, GOGGLES, CHANGE UNIT