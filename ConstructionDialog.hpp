
class ConstructionDialog {
    idd = 1233;
    movingEnable = false;
    objects[] = {};
	onLoad = "";
	onUnload = "if (!isNil{missionnamespace getvariable ""CurObject""} && {isNil{missionnamespace getvariable ""ConsMoved""}}) then {deletevehicle (missionnamespace getvariable ""CurObject"");missionnamespace setvariable [""CurObject"",nil];};";
    class controlsBackground {};
    class controls {
class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Construction View"; //--- ToDo: Localize;
	x = 0.5 * GUI_GRID_W + GUI_GRID_X;
	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 23.5 * GUI_GRID_H;
};
//_CT_COMBO
class RscListbox_1501: _CT_COMBO
{
	idc = 1501;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onLBSelChanged = "(lbText [1501, (lbCurSel 1501)]) CALL SAOKCONSCATHEGORY;";
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onLBSelChanged = "[] CALL SAOKCONSITEM;";
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 0.7 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
};
class _CT_SLIDER_Value1: _CT_STATIC // Slider value (see below)
		{
			idc = 1103;
			style = ST_CENTER;
			blinkingPeriod = 0;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
			fixedWidth = 0;
};
class CT_SLIDER_1901: _CT_SLIDER
{
	idc = 1901;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onSliderPosChanged = "[] SPAWN SAOKCONSSLIDER2;";
class Value // Link to a control which will show slider value
	{
				idc = 1103; // Control IDC (has to be defined ABOVE the slider control)
				format = "%.f"; // Text format, value is represented by variable %g (float) or %.f (integer)
				type = SPTPlain; // Format, can be SPTPlain or SPTPercents (multiplies the value by 100)
				colorBase[] = {1,1,1,1}; // Text color
				colorActive[] = {1,0.5,0,1}; // Text color when the slider is active
	};
};
class _CT_SLIDER_Value2: _CT_STATIC // Slider value (see below)
		{
			idc = 1102;
			style = ST_CENTER;
			blinkingPeriod = 0;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
			fixedWidth = 0;
};
class CT_SLIDER_1900: _CT_SLIDER
{
	idc = 1900;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onSliderPosChanged = "[] SPAWN SAOKCONSSLIDER;";
	class Value // Link to a control which will show slider value
	{
				idc = 1102; // Control IDC (has to be defined ABOVE the slider control)
				format = "%.f"; // Text format, value is represented by variable %g (float) or %.f (integer)
				type = SPTPlain; // Format, can be SPTPlain or SPTPercents (multiplies the value by 100)
				colorBase[] = {1,1,1,1}; // Text color
				colorActive[] = {1,0.5,0,1}; // Text color when the slider is active
	};
};

class RscFrame_1802: RscFrame
{
	idc = 1802;
	text = "Height/Direction"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};

class RscButton_1608: RscButton
{
	idc = 1608;
	text = "DelOk"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 2 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0;[([(getposATL player)] CALL RETURNGUARDPOST),player] SPAWN DELGUARDPOST;";	
};
class RscButton_1607: RscButton
{
	idc = 1607;
	text = "DelPost"; //--- ToDo: Localize;
	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "ctrlEnable [1608, true];";	
};
class RscFrame_1801: RscFrame
{
	idc = 1801;
	text = "Sidestepping"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class RscButton_1606: RscButton
{
	idc = 1606;
	text = "---->"; //--- ToDo: Localize;
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.8 * GUI_GRID_H;
	action = "_n = [([(getposATL player)] CALL RETURNGUARDPOST)] SPAWN SAOKSIDESTEP;";	
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "<----"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 0.8 * GUI_GRID_H;
	action = "_n = ([(getposATL player)] CALL RETURNGUARDPOST) SPAWN SAOKSIDESTEP;";	
};
class _CT_SLIDER_Value3: _CT_STATIC // Slider value (see below)
		{
			idc = 1101;
			style = ST_CENTER;
			blinkingPeriod = 0;
			x = 11.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0};
			fixedWidth = 0;
};
class CT_SLIDER_1902: _CT_SLIDER
{
	idc = 1902;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	onSliderPosChanged = "[] SPAWN SAOKCONSSLIDER3;";
	class Value // Link to a control which will show slider value
	{
				idc = 1101; // Control IDC (has to be defined ABOVE the slider control)
				format = "%.f"; // Text format, value is represented by variable %g (float) or %.f (integer)
				type = SPTPlain; // Format, can be SPTPlain or SPTPercents (multiplies the value by 100)
				colorBase[] = {1,1,1,1}; // Text color
				colorActive[] = {1,0.5,0,1}; // Text color when the slider is active
	};
};
class IGUIBack_2201: IGUIBack
{
	idc = 2201;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Undo Obj"; //--- ToDo: Localize; ([getposATL player] CALL RETURNGUARDPOST) setvariable [""Reset"",true];
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "_n = [([getposATL player] CALL RETURNGUARDPOST),0] SPAWN FConsUndo;";	
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Undo Gun"; //--- ToDo: Localize; ([getposATL player] CALL RETURNGUARDPOST) setvariable [""Reset"",true];
	x = 6.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "_n = [([getposATL player] CALL RETURNGUARDPOST),1] SPAWN FConsUndo;";	
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Buy"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "if (isNil""BUYING"") then {[] CALL SAOKCONSBUY;};";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Move"; //--- ToDo: Localize;
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "[] SPAWN SAOKCONSMOVEOBJ;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Exit"; //--- ToDo: Localize;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 2 * GUI_GRID_H;
	action = "closeDialog 0;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};

