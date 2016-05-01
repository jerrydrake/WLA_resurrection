
class FastTravelDialog {
    idd = 1233;
    movingEnable = false;
    objects[] = {};
	enableSimulation = 1; // 1 (true) to allow world simulation to be running in the background, 0 to freeze it
	enableDisplay = 0; // 1 (true) to allow scene rendering in the background
	//onLoad = "_this call compile preprocessFileLineNumbers 'RscTestControlTypes.sqf';";
	//onUnload = "systemChat str ['onUnload',_this]; false";
	//onChildDestroyed = "systemChat str ['onChildDestroyed',_this]; false";
    class controlsBackground {
	};
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
		class _CT_MAP_MAIN: _CT_MAP
		{
			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = 888; // Control identification (without it, the control won't be displayed)
			type = CT_MAP_MAIN; // Type
			style = ST_PICTURE; // Style
			default = 0; // Control selected by default (only one within a display can be used)
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

			x = 2 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; // Horizontal coordinates
			y = 2 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; // Vertical coordinates
			w = 38 * GUI_GRID_CENTER_W; // Width
			h = 12 * GUI_GRID_CENTER_H; // Height

			//tooltip = "CT_MAP_MAIN"; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			showCountourInterval = 1; // Show Legend

			class Legend
			{
				x = 30 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; // Horizontal coordinates
				y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; // Vertical coordinates
				w = 8 * GUI_GRID_CENTER_W; // Width
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
			onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
			onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
			onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
			_map ctrlMapAnimAdd [1, 0.1, getMarkerPos "anim1"];
			ctrlMapAnimCommit _map;
*/
			onMouseMoving = "";
			onMouseHolding = "";

			onDraw = "";
};

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Fast Travel With Team"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 1 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 40 * GUI_GRID_CENTER_W;
	h = 18 * GUI_GRID_CENTER_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 2 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 14.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 17 * GUI_GRID_CENTER_W;
	h = 4 * GUI_GRID_CENTER_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
	onLBSelChanged = "(lbText [1500, (lbCurSel 1500)]) SPAWN SAOKFASTTMAPM;";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Travel to destination"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 15.0 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 8 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
	action = "MATKUSTA=true;closeDialog 0;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Exit"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 15.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 4 * GUI_GRID_CENTER_W;
	h = 1 * GUI_GRID_CENTER_H;
	action = "closeDialog 0;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "WLA Menu"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 17.0 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 4 * GUI_GRID_CENTER_W;
	h = 1 * GUI_GRID_CENTER_H;
	action = "closeDialog 0;_nul = [] SPAWN WLADialog;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Center to Player"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = 17.0 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 8 * GUI_GRID_CENTER_W;
	h = 1 * GUI_GRID_CENTER_H;
	action = """"" SPAWN SAOKFASTTMAPM;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};