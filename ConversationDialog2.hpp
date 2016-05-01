////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Tuhycy)
////////////////////////////////////////////////////////

class ConversationDialog2 {
    idd = 0232;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {

class _CT_PROGRESS
{
			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = 888; // Control identification (without it, the control won't be displayed)
			type = CT_PROGRESS; // Type
			style = ST_LEFT; // Style
			default = 0; // Control selected by default (only one within a display can be used)
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
			//idd = -1;
			x = 1 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; // Horizontal coordinates
			y = 21.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; // Vertical coordinates
			w = 15 * GUI_GRID_CENTER_W; // Width
			h = 0.5 * GUI_GRID_CENTER_H; // Height

			texture = "#(argb,8,8,3)color(1,1,1,1)"; // Bar texture
			colorBar[] = {1,1,1,1}; // Bar color
			colorFrame[] = {0,0,0,1}; // Frame color

			//tooltip = "CT_PROGRESS"; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			//onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
			//onDestroy = "systemChat str ['onDestroy',_this]; false";
};
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 0.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 21 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 39 * GUI_GRID_CENTER_W;
	h = 4.5 * GUI_GRID_CENTER_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 1 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 22.0 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 32.5 * GUI_GRID_CENTER_W;
	h = 2.5 * GUI_GRID_CENTER_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Speak"; //--- ToDo: Localize;
	x = 34.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 23 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 4 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
	action = "closeDialog 0;";
};
};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
