////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class RespawnDialog {
    idd = 52552;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
	
	////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pucufa)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Ficery)
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
	text = "Respawn Selection"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Closeby"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "RESPAWN = """"; closeDialog 0;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "More Far"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "RESPAWN = ""FAR""; closeDialog 0;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Nearest Post"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "RESPAWN = ""POST"";closeDialog 0;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Nearest Camp"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "RESPAWN = ""CAMP"";closeDialog 0;";
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Camp Wolf"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "RESPAWN = ""CAMPW"";closeDialog 0;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};

