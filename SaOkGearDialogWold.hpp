
class SaOkGearDialogW {
    idd = 1991;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {};
    class controls {
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Duwohy)
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Pupulo)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Keseqa)
////////////////////////////////////////////////////////

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Weapon"; //--- ToDo: Localize;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 23 * GUI_GRID_W;
	h = 11.5 * GUI_GRID_H;
};
class RscFrame_1801: RscFrame
{
	idc = 1801;
	text = "Attachments"; //--- ToDo: Localize;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 8.5 * GUI_GRID_H;
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class RscPicture_1204: RscPicture
{
	idc = 1204;
	text = "";
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscPicture_1201: RscPicture
{
	idc = 1201;
	text = "";
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscPicture_1202: RscPicture
{
	idc = 1202;
	text = "";
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscPicture_1203: RscPicture
{
	idc = 1203;
	text = "";
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 13 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
	onLBSelChanged = "_kuva2 = [];{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_kuva2 = _x select 0};} foreach (missionNameSpace getvariable ""helpD"");if (typename _kuva2 == ""STRING"") then {_Wpic2 = _kuva2 CALL SaOkGearPic;ctrlSetText [1204, _Wpic2];};";
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Select"; //--- ToDo: Localize;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARWCHANGE;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Remove"; //--- ToDo: Localize;
	x = 8.2 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARWDEL;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Add"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "(lbText [1501, (lbCurSel 1501)]) CALL SAOKADDATTACHMENT;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Remove All"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "(missionNameSpace getvariable ""Wmode"") CALL SAOKREMOVEATTACHMENTS;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Back"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "closeDialog 0; _n = [] SPAWN SaOkGear;";
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

//MAIN W, SEC W, PISTOL, BACKPACK, VEST, UNIFORM, HAT, GOGGLES, CHANGE UNIT