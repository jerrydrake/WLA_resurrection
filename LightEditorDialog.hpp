////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Tuhycy)
////////////////////////////////////////////////////////

class LightEditorDialog {
    idd = 6332;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Xyhaqu)
////////////////////////////////////////////////////////

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Light Editor"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 14.5 * GUI_GRID_W;
	h = 15 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
	onLBSelChanged = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKLVALC;";
};
class _CT_SLIDER_1900: _CT_SLIDER
{
	idc = 1900;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onSliderPosChanged = "1 SPAWN SAOKLSLIDERC;";
};
class _CT_SLIDER_1901: _CT_SLIDER
{
	idc = 1901;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onSliderPosChanged = "2 SPAWN SAOKLSLIDERC;";
};
class _CT_SLIDER_1902: _CT_SLIDER
{
	idc = 1902;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onSliderPosChanged = "3 SPAWN SAOKLSLIDERC;";
};
class _CT_SLIDER_1903: _CT_SLIDER
{
	idc = 1903;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	onSliderPosChanged = "4 SPAWN SAOKLSLIDERC;";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Copy"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "[] CALL SAOKLCOPYCLIP;"
};

class RscButton_1601: RscButton
{
	idc = 1601;
	text = "None"; //--- ToDo: Localize;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
