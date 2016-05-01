
class SaOkGearDialogOtherShop {
    idd = 2592;
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

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Vymohy)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Pihivy)
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Tedula)
////////////////////////////////////////////////////////

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Gear Shop"; //--- ToDo: Localize;
	x = 4.31 * GUI_GRID_W + GUI_GRID_X;
	y = 6.33 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 15.5 * GUI_GRID_H;
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
	onLBSelChanged = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEAROITEMS;";
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 12.2 * GUI_GRID_H + GUI_GRID_Y;
	w = 17 * GUI_GRID_W;
	h = 8.6 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.25)";
	onLBSelChanged = "_item =[];{if ((lbText [1501, (lbCurSel 1501)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");if ((lbText [1500, (lbCurSel 1500)]) != ""Magazines"" && {typename _item == ""STRING""}) then {if ((lbText [1500, (lbCurSel 1500)]) == ""Backpacks"") then {_item = [_item];};if ((lbText [1500, (lbCurSel 1500)]) == ""Glasses"") then {_item = [_item,""""];};_Wpic = _item CALL SaOkGearPic;ctrlSetText [1200, _Wpic];} else {ctrlSetText [1200, """"];};";
	onMouseButtonDblClick = "_item =[];{if ((lbText [1501, (lbCurSel 1501)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");[(lbText [1500, (lbCurSel 1500)]),_item,((lbCurSel 1502)+1)] CALL SAOKGEAROBUY;false";
	};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Category"; //--- ToDo: Localize;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Selection"; //--- ToDo: Localize;
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 0.5 * GUI_GRID_H;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 19 * GUI_GRID_W + GUI_GRID_X;
	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscListbox_1502: RscListbox
{
	idc = 1502;
	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
};
class RscText_1002: RscText
{
	idc = 1002;
	text = "Amount"; //--- ToDo: Localize;
	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 0.5 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Buy"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "_item =[];{if ((lbText [1501, (lbCurSel 1501)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");[(lbText [1500, (lbCurSel 1500)]),_item,((lbCurSel 1502)+1)] CALL SAOKGEAROBUY;";
	
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Exit"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "CSHOPISSA=nil;closeDialog 0;_n = [] SPAWN SaOkGear;";
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