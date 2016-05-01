////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class StartDialog {
    idd = 11223;
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
	x = safeZoneX + safeZoneW - 0.8; 
	y = safeZoneY + safeZoneH - 0.4;
	h = 0.4;
	w = 0.8; 
};	
	
	class RscText_1044: RscText
{
	idc = 1044;
	text = "Click Map to Select Insertion Point"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 20 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
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
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 25 * GUI_GRID_W;
			h = 12.5 * GUI_GRID_H;

			//tooltip = "CT_MAP_MAIN"; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			showCountourInterval = 1; // Show Legend

			class Legend
			{
				x = 17 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; // Horizontal coordinates
				y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; // Vertical coordinates
				w = 9 * GUI_GRID_CENTER_W; // Width
				h = 4 * GUI_GRID_CENTER_H; // Height

				colorBackground[] = {1,1,1,0.5}; // Fill color
				
				font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
				sizeEx = 0.8 * GUI_GRID_CENTER_H; // Text size
				color[] = {0,0,0,1}; // Text color
				
			};
/*
			onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
			onDestroy = "systemChat str ['onDestroy',_this]; false";
			onSetFocus = "systemChat str ['onSetFocus',_this]; false";
			onKillFocus = "systemChat str ['onKillFocus',_this]; false";
			onKeyDown = "systemChat str ['onKeyDown',_this]; false";
			onKeyUp = "systemChat str ['onKeyUp',_this]; false";
			onMouseButtonDown = "systemChat str ['onMouseButtonDown',_this]; false";
			onMouseButtonUp = "systemChat str ['onMouseButtonUp',_this]; false";
			
			onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
			onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
			_map ctrlMapAnimAdd [1, 0.1, getMarkerPos "anim1"];
			ctrlMapAnimCommit _map;
			""StartPoint"" setmarkerpos ((_this select 0) ctrlMapScreenToWorld [(_this select 2),(_this select 3)]);
			onMouseButtonClick = """StartPoint"" setmarkerpos ((_this select 0) ctrlMapScreenToWorld [(_this select 2),(_this select 3)]); false";
			onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
*/
			onMouseButtonClick = "_p = ((_this select 0) ctrlMapScreenToWorld [(_this select 2),(_this select 3)]);if (!surfaceiswater _p) then {""StartPoint"" setmarkerpos _p} else {""StartPointSea"" setmarkerpos _p}; false";
			onMouseMoving = "";
			onMouseHolding = "";

			onDraw = "";
};	
/*	
class RscPicture_1200: RscPicture
{
	idc = 1200;
	//text = "#(argb,8,8,3)color(1,1,1,1)";
	text = "arma3WLA.paa";
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 25 * GUI_GRID_W;
	h = 12.5 * GUI_GRID_H;
};
*/

class RscText_1014: RscText
{
	idc = 1014;
	text = "Autosave"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 0.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.7 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1514: RscListbox
{
	idc = 1514;
	x = 2.1 * GUI_GRID_W + GUI_GRID_X;
	y = 2.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.7 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Mission Settings"; //--- ToDo: Localize;
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 0 * GUI_GRID_H + GUI_GRID_Y;
	w = 32.5 * GUI_GRID_W;
	h = 24.5 * GUI_GRID_H;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Difficulty"; //--- ToDo: Localize;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Ambient Life"; //--- ToDo: Localize;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 0.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1002: RscText
{
	idc = 1002;
	text = "Start Time"; //--- ToDo: Localize;
	x = 17.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1003: RscText
{
	idc = 1003;
	text = "Asset Unlocking"; //--- ToDo: Localize;
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 0.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};

class RscText_1004: RscText
{
	idc = 1004;
	text = "Team Type"; //--- ToDo: Localize;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1005: RscText
{
	idc = 1005;
	text = "Dyn Weather"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1006: RscText
{
	idc = 1006;
	text = "Respawning"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1007: RscText
{
	idc = 1007;
	text = "Insertion Type"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1008: RscText
{
	idc = 1008;
	text = "PP-Effects"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1009: RscText
{
	idc = 1009;
	text = "Identity"; //--- ToDo: Localize;
	x = 26.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1010: RscText
{
	idc = 1010;
	text = "Player Needs"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1011: RscText
{
	idc = 1011;
	text = "Life Range"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1012: RscText
{
	idc = 1012;
	text = "Constructing"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscText_1013: RscText
{
	idc = 1013;
	text = "AI Artillery"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};

class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "BEGIN";
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "BEGIN WITH ARSENAL";
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 23 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;ARSE = true;";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 12 * GUI_GRID_W + GUI_GRID_X;
	y = 2.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1502: RscListbox
{
	idc = 1502;
	x = 17.5 * GUI_GRID_W + GUI_GRID_X;
	y = 2.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1503: RscListbox
{
	idc = 1503;
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 2.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1504: RscListbox
{
	idc = 1504;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1505: RscListbox
{
	idc = 1505;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1506: RscListbox
{
	idc = 1506;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1507: RscListbox
{
	idc = 1507;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
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
class RscListbox_1509: RscListbox
{
	idc = 1509;
	x = 26.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1510: RscListbox
{
	idc = 1510;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1511: RscListbox
{
	idc = 1511;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1512: RscListbox
{
	idc = 1512;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.7 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
class RscListbox_1513: RscListbox
{
	idc = 1513;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};

