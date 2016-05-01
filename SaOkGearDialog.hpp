
class SaOkGearDialog {
    idd = 1990;
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

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Weaponry"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 13.5 * GUI_GRID_H;
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 0.5 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class RscPicture_1201: RscPicture
{
	idc = 1201;
	text = "";
	x = 0.5 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class RscPicture_1202: RscPicture
{
	idc = 1202;
	text = "";
	x = 0.5 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Change Prim. W"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;""W"" SPAWN SAOKGEARW;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Change Sec. W"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;""S"" SPAWN SAOKGEARW;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Change Pistol"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;""P"" SPAWN SAOKGEARW;";
};


class RscFrame_1801: RscFrame
{
	idc = 1801;
	text = "Containers"; //--- ToDo: Localize;
	x = 24 * GUI_GRID_W + safezoneW * 0.1;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 20 * GUI_GRID_H;
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Change Fatigue"; //--- ToDo: Localize;
	x = 24.2 * GUI_GRID_W + safezoneW * 0.1;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.1 * GUI_GRID_W;
	h = 0.8 * GUI_GRID_H;
	action = "closeDialog 0;""F"" SPAWN SAOKGEARC;";
};
class RscPicture_1204: RscPicture
{
	idc = 1204;
	text = "";
	x = 24 * GUI_GRID_W + safezoneW * 0.1;
	y = 1 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 5.5 * GUI_GRID_H;
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "Change BackPack"; //--- ToDo: Localize;
	x = 24.2 * GUI_GRID_W + safezoneW * 0.1;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.1 * GUI_GRID_W;
	h = 0.8 * GUI_GRID_H;
	action = "closeDialog 0;""B"" SPAWN SAOKGEARC;";
};
class RscPicture_1205: RscPicture
{
	idc = 1205;
	text = "";
	x = 24 * GUI_GRID_W + safezoneW * 0.1;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
};
class RscButton_1606: RscButton
{
	idc = 1606;
	text = "Change Vest"; //--- ToDo: Localize;
	x = 24.2 * GUI_GRID_W + safezoneW * 0.1;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.1 * GUI_GRID_W;
	h = 0.8 * GUI_GRID_H;
	action = "closeDialog 0;""V"" SPAWN SAOKGEARC;";
};
class RscPicture_1206: RscPicture
{
	idc = 1206;
	text = "";
	x = 24 * GUI_GRID_W + safezoneW * 0.1;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
};




class RscFrame_1802: RscFrame
{
	idc = 1802;
	text = "Head"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Headgear"; //--- ToDo: Localize;
	x = 5 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 0.7 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKGEARH;";
};
class RscPicture_1203: RscPicture
{
	idc = 1203;
	text = "";
	x = 5* GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscButton_1612: RscButton
{
	idc = 1612;
	text = "Goggles"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 0.7 * GUI_GRID_H;
	action = "closeDialog 0;[] SPAWN SAOKGEARG;";
};
class RscPicture_1207: RscPicture
{
	idc = 1207;
	text = "";
	x = 1 * GUI_GRID_W + safezoneX + safezoneW * 0.2;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};




class RscFrame_1803: RscFrame
{
	idc = 1803;
	text = "Other"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 24.5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscButton_1607: RscButton
{
	idc = 1607;
	text = "Change Unit"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN GEARunitselection;";
};
class RscButton_1609: RscButton
{
	idc = 1609;
	text = "More Clothing"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN SAOKGEARCSHOP;";
};
class RscButton_1610: RscButton
{
	idc = 1610;
	text = "Weapon Shop"; //--- ToDo: Localize;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_n = [] SPAWN SAOKGEARWSHOP;";
};
class RscButton_1611: RscButton
{
	idc = 1611;
	text = "Gear Shop"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_n = [] SPAWN SAOKGEAROSHOP;";
};

class RscButton_1608: RscButton
{
	idc = 1608;
	text = "Exit"; //--- ToDo: Localize;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;";
};
/*
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};

//MAIN W, SEC W, PISTOL, BACKPACK, VEST, UNIFORM, HAT, GOGGLES, CHANGE UNIT