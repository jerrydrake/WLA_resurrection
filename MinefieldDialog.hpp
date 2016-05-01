////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Tuhycy)
////////////////////////////////////////////////////////

class MinefieldDialog {
    idd = -1;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Minefield Creating System"; //--- ToDo: Localize;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 20.5 * GUI_GRID_W;
	h = 14.5 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Abort"; //--- ToDo: Localize;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	action = "closeDialog 0;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Build Minefield"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	action = "MINEVAR = true;closeDialog 0;";
};
class RscListbox_1500: RscListbox
{
	idc = 113;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
};
class RscListbox_1501: RscListbox
{
	idc = 114;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
};
class RscListbox_1502: RscListbox
{
	idc = 115;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Range"; //--- ToDo: Localize;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Amount "; //--- ToDo: Localize;
	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscText_1002: RscText
{
	idc = 1002;
	text = "Type"; //--- ToDo: Localize;
	x = 17 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};

};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
