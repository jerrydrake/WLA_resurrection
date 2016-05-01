////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class SentenceDialog {
    idd = -1;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
	
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Bowexo)
////////////////////////////////////////////////////////

class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 25.5 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	onLBSelChanged = "[] SPAWN SAOKSEF1;";
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 25.5 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	onLBSelChanged = "[] SPAWN SAOKSEF2;";
};
class RscListbox_1502: RscListbox
{
	idc = 1502;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 25.5 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Play"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
	action = "[] SPAWN SAOKSEF3;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Copy"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
	action = "[] SPAWN SAOKSEF4;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Extra"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};

