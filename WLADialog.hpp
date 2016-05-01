////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class WLaDialog {
    idd = 32144;
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

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Zinupe)
////////////////////////////////////////////////////////
class RscPicture_1266: RscPicture
{
	idc = 1266;
	//text = "#(argb,512,512,1)r2t(rendertarget4,1.0)"; 
	//colorText[] = {1, 1, 1, 0.4};
	colorText[] = {1, 1, 1, 1};
	text="WLA.paa";
	x = safeZoneX + safeZoneW - ((1+safeZoneH)/(2.8181))*0.8; 
	y = safeZoneY + safeZoneH - ((1+safeZoneH)/(2.8181))*0.4;
	h = ((1+safeZoneH)/(2.8181))*0.4;
	w = ((1+safeZoneH)/(2.8181))*0.8;  
};	
/*
class CT_HTML_22012: _CT_HTML
{
	idc = 22012;
	x = 18 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
*/
class IGUIBack_2202: IGUIBack
{
	idc = 2202;
	x = 23.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscCheckbox_2801: RscCheckbox
{
	idc = 2801;
	text = "aRearm"; //--- ToDo: Localize;
	x = 23.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	strings[] = 
	{
		"manualRearm"
	};
	checked_strings[] = 
	{
		"autoRearm"
	};
	onCheckBoxesSelChanged = "if ((_this select 2) == 1) then {_nn = [] SPAWN SAOKREAMMODE;} else {if (isNil""REARMMODEVAR"") exitWith {};REARMMODEVAR = nil;""Teammates rearm only when ordered"" SPAWN HINTSAOK;};";
};
class IGUIBack_2201: IGUIBack
{
	idc = 2201;
	x = 18 * GUI_GRID_W + GUI_GRID_X;
	y = 3.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscCheckbox_2800: RscCheckbox
{
	idc = 2800;
	text = "aHeal"; //--- ToDo: Localize;
	x = 18 * GUI_GRID_W + GUI_GRID_X;
	y = 3.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	strings[] = 
	{
		"manualHeal"
	};
	checked_strings[] = 
	{
		"autoHeal"
	};
	onCheckBoxesSelChanged = "if ((_this select 2) == 1) then {_nn = [] SPAWN SAOKHEALMODE;} else {if (isNil""HEALMODEVAR"") exitWith {};HEALMODEVAR = nil;""Teammates heal each other only when ordered"" SPAWN HINTSAOK;};";
};
class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "WLA Main Menu"; //--- ToDo: Localize;
	x = 10.64 * GUI_GRID_W + GUI_GRID_X;
	y = 4.92 * GUI_GRID_H + GUI_GRID_Y;
	w = 30 * GUI_GRID_W;
	h = 15 * GUI_GRID_H;
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Mil Center"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN KAUPPA;";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Local Shop"; //--- ToDo: Localize;
	x = 16.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;if (player CALL NEARESTLOCATIONNAME != ""factory"") then {_nul = [] SPAWN KAUPPAVILLAGE;} else {_n = [] SPAWN SAOKFACDIA;};";
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "Call Support"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 8 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN FUNK_SupportDialog;";
};
	class RscButton_1607: RscButton
{
	idc = 1607;
	text = "Customize Gear"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN GEARunitselection;";
};
class RscButton_1608: RscButton
{
	idc = 1608;
	text = "Orders/Other Menu"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_n = [] SPAWN F_OrdersDialog;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Wait Time"; //--- ToDo: Localize; _nul = (groupSelectedUnits player) SPAWN FUNK_WaitTime;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN FUNK_WaitTime;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Fast Travel"; //--- ToDo: Localize;
	x = 16.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_n = [] SPAWN FastTravelDialog;  ";
};

class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Savegame"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 16.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "savegame;[] SPAWN FSaOkSave;";
};
class RscButton_1606: RscButton
{
	idc = 1606;
	text = "Exit"; //--- ToDo: Localize;
	x = 18 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0";
};	
class RscButton_1609: RscButton
{
	idc = 1609;
	text = "Mods"; //--- ToDo: Localize;
	x = 15.2 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 2.3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN SAOKADDONMAIN;";
};	
class RscButton_1610: RscButton
{
	idc = 1610;
	text = "Options"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.7 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;_nul = [] SPAWN SAOKWLAOPTIONS;";
};
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 22 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 13.5 * GUI_GRID_H;
};
/*
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 22 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 18.5 * GUI_GRID_W;
	h = 13.5 * GUI_GRID_H;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.95)";
};
*/
class _CT_CONTROLS_GROUP
		{
			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = CT_CONTROLS_GROUP; // Control identification (without it, the control won't be displayed)
			type = CT_CONTROLS_GROUP; // Type
			style = LB_TEXTURES; // Style
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;

			class Controls
			{
				class RscStructuredText_1100: RscStructuredText
				{
					idc = 1100;
					style = 0;
					blinkingPeriod = 0;
					x = 0;
					y = 0;
					w = 17.5 * GUI_GRID_W;
					h = 23.5 * GUI_GRID_H;
					text = "#(ai,512,512,1)perlinNoise(512,128,0,1)";
					//tooltip = "CT_CONTROLS_GROUP"; // Tooltip text
				};
			};
			// Scrollbar configuration (applied only when LB_TEXTURES style is used)
			class VScrollBar
			{
				width = 0.021; // Unknown?
				height = 0; // Unknown?
				scrollSpeed = 0.01; // Unknown?

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color

				autoScrollEnabled = 1; // 1 to enable automatic scrolling
				autoScrollDelay = 1; // Time after autoscroll is initiated
				autoScrollRewind = 1; // Repeat the autoscroll once it's finished
				autoScrollSpeed = 1; // Autoscroll speed
			};
			class HScrollBar
			{
				width = 0; // Unknown?
				height = 0.028; // Unknown?
				scrollSpeed = 0.01; // Unknown?

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};
		};

class RscListbox_1501: _CT_COMBO
{
	idc = 1501;
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onLBSelChanged = "(lbText [1501,(lbCurSel 1501)]) CALL SAOKWLATEXT;";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};

