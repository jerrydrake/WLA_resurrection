////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class StartDialog {
    idd = 11223;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
	
class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Mission Settings"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 32 * GUI_GRID_W;
	h = 27 * GUI_GRID_H;
};	
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

class RscFrame_1802: RscFrame
{
	idc = 1802;
	text = "Click On Map to Select Insertion Point"; //--- ToDo: Localize;
	x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 14 * GUI_GRID_H;
	colorBackground[] = 
	{
		1,
		1,
		1,
		0.5
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
};	
	
class _CT_MAP_MAIN: _CT_MAP
{
			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = 888; // Control identification (without it, the control won't be displayed)
			type = CT_MAP_MAIN; // Type
			style = ST_PICTURE; // Style
			default = 0; // Control selected by default (only one within a display can be used)
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

			x = 3 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 27 * GUI_GRID_W;
			h = 12.5 * GUI_GRID_H;

			//tooltip = "CT_MAP_MAIN"; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			showCountourInterval = 1; // Show Legend

			class Legend
			{
				x = 17 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; // Horizontal coordinates
				y = 21 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; // Vertical coordinates
				w = 9 * GUI_GRID_CENTER_W; // Width
				h = 4 * GUI_GRID_CENTER_H; // Height

				colorBackground[] = {1,1,1,0.5}; // Fill color
				
				font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
				sizeEx = 0.8 * GUI_GRID_CENTER_H; // Text size
				color[] = {0,0,0,1}; // Text color
				
			};
			onMouseButtonClick = "_p = ((_this select 0) ctrlMapScreenToWorld [(_this select 2),(_this select 3)]);if (!surfaceiswater _p) then {""StartPoint"" setmarkerpos _p} else {""StartPointSea"" setmarkerpos _p}; false";
			onMouseMoving = "";
			onMouseHolding = "";
			onDraw = "";
};	

class RscText_1001: RscText
{
	idc = 1001;
	text = "Difficulty"; //--- ToDo: Localize;
	x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscListbox_1501: _CT_LISTBOX
{
	idc = 1501;
	x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};

class RscText_1002: RscText
{
	idc = 1002;
	text = "Identity"; //--- ToDo: Localize;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscListbox_1502: _CT_LISTBOX
{
	idc = 1502;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};

class RscText_1003: RscText
{
	idc = 1003;
	text = "Team Type"; //--- ToDo: Localize;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscListbox_1503: _CT_LISTBOX
{
	idc = 1503;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};

class RscText_1004: RscText
{
	idc = 1004;
	text = "Insertion Type"; //--- ToDo: Localize;
	x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscListbox_1504: _CT_LISTBOX
{
	idc = 1504;
	x = 2.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)"; 
};

class RscFrame_1801: RscFrame
{
	idc = 1801;
	text = "Other Settings"; //--- ToDo: Localize;
	x = 22 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 6 * GUI_GRID_H;
	colorBackground[] = 
	{
		1,
		1,
		1,
		0.5
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
};	
class RscListbox_1505: _CT_COMBO
{
	idc = 1505;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onLBSelChanged = "(lbText [1505, (lbCurSel 1505)]) SPAWN SAOKSTARTDIACAT;";
};
class RscListbox_1506: _CT_LISTBOX
{
	idc = 1506;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onLBSelChanged = "(lbText [1505, (lbCurSel 1505)]) SPAWN SAOKSTARTDIASET;";
};



class RscButton_1600: RscButton
{
	idc = 1600;
	text = "BEGIN";
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "BEGIN WITH ARSENAL";
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;ARSE = true;";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscListbox_1509: _CT_COMBO
{
	idc = 1509;
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = -0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onLBSelChanged = "(lbText [1509, (lbCurSel 1509)]) SPAWN SAOKMODTEMP;";
};

/*
class RscListbox_1508: RscListbox
{
	idc = 1508;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
	onLBSelChanged = "SAOKPP = (lbText [1508, (lbCurSel 1508)]); [(lbText [1508, (lbCurSel 1508)])] CALL BIS_fnc_setPPeffectTemplate;";
};
*/


};
};

