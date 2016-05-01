////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Tuhycy)
////////////////////////////////////////////////////////

class LightsDialog {
    idd = 1332;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Pirymy)
////////////////////////////////////////////////////////

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Lights"; //--- ToDo: Localize;
	x = 8 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "On"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 2 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "{_x setHit [""light_1_hitpoint"", 0];} foreach (nearestObjects [player, [""Lamps_base_F"",""Land_PowerPoleWooden_L_F""], 1000]);""Streetlight set ON inside 1km radius"" SPAWN HINTSAOK;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Off"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 2 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "{_x setHit [""light_1_hitpoint"", 0.97];} foreach (nearestObjects [player, [""Lamps_base_F"",""Land_PowerPoleWooden_L_F""], 1000]);""Streetlight set OFF inside 1km radius"" SPAWN HINTSAOK;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Exit"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////




};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
