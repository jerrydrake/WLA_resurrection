
class SaOkAddOnAirVeh {
    idd = 2002;
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
	text = "Enable Addon Content - Air Vehicles"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 31.5 * GUI_GRID_W;
	h = 23.5 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 6 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};
class RscListbox_1502: RscListbox
{
	idc = 1502;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};

class RscText_1000: RscText
{
	idc = 1000;
	text = "BLUFOR"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Fighters"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscText_1002: RscText
{
	idc = 1002;
	text = "Armed Choppers"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscText_1003: RscText
{
	idc = 1003;
	text = "Carrier Choppers"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};



class RscText_1006: RscText
{
	idc = 1006;
	text = "REDFOR"; //--- ToDo: Localize;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscText_1007: RscText
{
	idc = 1007;
	text = "Fighters"; //--- ToDo: Localize;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1505: RscListbox
{
	idc = 1505;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 6 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};
class RscText_1008: RscText
{
	idc = 1008;
	text = "Armed Choppers"; //--- ToDo: Localize;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1506: RscListbox
{
	idc = 1506;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};
class RscText_1009: RscText
{
	idc = 1009;
	text = "Carrier Choppers"; //--- ToDo: Localize;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1507: RscListbox
{
	idc = 1507;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};




class RscText_1012: RscText
{
	idc = 1012;
	text = "GREENFOR"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscText_1013: RscText
{
	idc = 1013;
	text = "Fighters"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1510: RscListbox
{
	idc = 1510;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 6 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};
class RscText_1014: RscText
{
	idc = 1014;
	text = "Armed Choppers"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1511: RscListbox
{
	idc = 1511;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};
class RscText_1015: RscText
{
	idc = 1015;
	text = "Carrier Choppers"; //--- ToDo: Localize;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1512: RscListbox
{
	idc = 1512;
	x = 25.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
};

class RscText_1024: RscText
{
	idc = 1024;
	text = "ALL VEH LIST"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1520: RscListbox
{
	idc = 1520;
	x = 1.6 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 12.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.85)";
	onLBSelChanged = "(getText(configfile >> ""CfgVehicles"" >> (lbText [1520, _this select 1]) >> ""displayName"")) SPAWN HINTSAOK;";
};
class RscListbox_1521: RscListbox
{
	idc = 1521;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
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
	h = 0.9 * GUI_GRID_H;
};
class RscListbox_1522: RscListbox
{
	idc = 1522;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
};
class RscText_1026: RscText
{
	idc = 1026;
	text = "EDIT SECT"; //--- ToDo: Localize;
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.9 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Add"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 2.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "missionnamespace setvariable [""AddIndex1520"",lbCurSel 1520];[(lbCurSel 1520),lbCurSel 1521,lbCurSel 1522] CALL SAOKADDONAIRVEHADD;closeDialog 0;[] SPAWN SAOKADDONAIRDIA;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Remove Last"; //--- ToDo: Localize;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "missionnamespace setvariable [""AddIndex1520"",lbCurSel 1520];[lbCurSel 1521,lbCurSel 1522] CALL SAOKADDONAIRVEHREMLAST;closeDialog 0;[] SPAWN SAOKADDONAIRDIA;";
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