////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Pileko)
////////////////////////////////////////////////////////

class TeammateDialog {
    idd = 1231;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Team-member information"; //--- ToDo: Localize;
	x = -1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 39.5 * GUI_GRID_W;
	h = 18 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 14.5 * GUI_GRID_H;
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Name"; //--- ToDo: Localize;
	x = 0 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Condition"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscText_1003: RscText
{
	idc = 1003;
	text = "Stats"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1101;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 12 * GUI_GRID_H;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1100;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 9 * GUI_GRID_H;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
};
class RscStructuredText_1102: RscStructuredText
{
	idc = 1102;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
};
class RscText_1004: RscText
{
	idc = 1004;
	text = "Skills"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Send home"; //--- ToDo: Localize;
	x = 31.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "if (SELunit != player) then {_nul = [SELunit] SPAWN FHideAndDelete;};";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Exit"; //--- ToDo: Localize;
	x = 31.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Encourage [3]"; //--- ToDo: Localize;
	x = 31.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "pisteet = pisteet - 3;_nul = [-3, ""Encouraged Team-mate""] SPAWN PRESTIGECHANGE;if (random 1 < 0.4) then {SELunit setvariable [""Mental"",nil];SELunit setvariable [""Mental"",nil];};";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Rebuke [3]"; //--- ToDo: Localize;
	x = 31.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "pisteet = pisteet - 3;_nul = [-3, ""Rebuked Team-mate""] SPAWN PRESTIGECHANGE;if (random 1 < 0.4) then {SELunit setvariable [""Mental"",nil]; SELunit setvariable [""Relationship"",""Stressed""];};";
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Medicate [15]"; //--- ToDo: Localize;
	x = 31.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "pisteet = pisteet - 15;_nul = [-15, ""Medicated a Team-mate""] SPAWN PRESTIGECHANGE;if (random 1 < 0.4) then {SELunit setvariable [""Sickness"",nil];};";
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "Joke [2]"; //--- ToDo: Localize;
	x = 31.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "pisteet = pisteet - 2;_nul = [-2, ""Joked to Team-mate""] SPAWN PRESTIGECHANGE; if (random 1 < 0.4) then {SELunit setvariable [""Relationship"",""Happy""];};";
};


};
};

