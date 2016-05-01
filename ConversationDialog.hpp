////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Tuhycy)
////////////////////////////////////////////////////////

class ConversationDialog {
    idd = 1232;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {

class RscListbox_1502: _CT_COMBO
{
	idc = 1502;
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 15 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onLBSelChanged = "missionnamespace setvariable [""TaskChosen"",(lbData [1502, lbCurSel 1502])];";
};
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 39 * GUI_GRID_W;
	h = 7.5 * GUI_GRID_H;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 32.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 22.0 * GUI_GRID_H + GUI_GRID_Y;
	w = 32.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 34.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Speak"; //--- ToDo: Localize;
	x = 34.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "Spoke=true;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Leave"; //--- ToDo: Localize;
	x = 34.5 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;";
};



};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
