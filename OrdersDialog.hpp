////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class OrdersDialog {
    idd = 124141;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
	
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
	text = "Orders/Other Menu"; //--- ToDo: Localize;
	x = 10.27 * GUI_GRID_W + GUI_GRID_X;
	y = 8.56 * GUI_GRID_H + GUI_GRID_Y;
	w = 13 * GUI_GRID_W;
	h = 12.5 * GUI_GRID_H;
};
class RscCheckbox_2800: RscCheckbox
{
	idc = 2800;
	text = "Reinf"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 9.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	strings[] = 
	{
		"BLOCKED REINFORCEMENTS"
	};
	checked_strings[] = 
	{
		"ALLOWED REINFORCEMENTS"
	};
	onCheckBoxesSelChanged = "(_this select 2) CALL DESFUNC1;";
};
class RscCheckbox_2801: RscCheckbox
{
	idc = 2801;
	text = "Reinf Res"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 10.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	strings[] = 
	{
		"TEAM RESPAWN WITH YOU"
	};
	checked_strings[] = 
	{
		"TEAM STAY PUT ON RESPWN"
	};
	onCheckBoxesSelChanged = "(_this select 2) CALL DESFUNC2;";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Send Air Support Home"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "[] SPAWN F_AirHome;";
};
class RscButton_1606: RscButton
{
	idc = 1606;
	text = "Create/Return HC"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 13.4 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "_nul = [(groupSelectedUnits player), hcSelected player] SPAWN FCreateOrReturnHC;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Unstuck Selected Unit(s)"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 14.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "[] SPAWN SAOKUNSTUCKUN;";
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Delete Selected Unit(s)"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 16.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "{_nul = [_x] SPAWN FHideAndDelete;} foreach (groupSelectedUnits player);";
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "Unstuck Player"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 17.6 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "{_x setpos [(getposATL _x select 0)+10-(random 20),(getposATL _x select 1)+10-(random 20),0];_x switchmove """";} foreach [player];";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "WLA Menu"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN WLADialog;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Exit"; //--- ToDo: Localize;
	x = 18 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;";
};


};
};

