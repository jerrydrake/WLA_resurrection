
class SaOkGearDialogUniShop {
    idd = 1995;
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

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Get Clothing"; //--- ToDo: Localize;
	x = 9.7 * GUI_GRID_W + GUI_GRID_X;
	y = 9.34 * GUI_GRID_H + GUI_GRID_Y;
	w = 20 * GUI_GRID_W;
	h = 10.5 * GUI_GRID_H;
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 10.5 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 7 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 18 * GUI_GRID_W + GUI_GRID_X;
	y = 10 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 9.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
	onLBSelChanged = "_item =[];{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");_Wpic = _item CALL SaOkGearPic;ctrlSetText [1200, _Wpic];";
	onMouseButtonDblClick = "_n = [(lbText [1500, (lbCurSel 1500)]),((lbCurSel 1501)+1)] SPAWN SAOKGEARCSHOPBUY;false";
	};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 2.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	onMouseButtonDblClick = "_n = [(lbText [1500, (lbCurSel 1500)]),((lbCurSel 1501)+1)] SPAWN SAOKGEARCSHOPBUY;false";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Get"; //--- ToDo: Localize; SAOKGEARCSHOPBUY
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 2.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "_n = [(lbText [1500, (lbCurSel 1500)]),((lbCurSel 1501)+1)] SPAWN SAOKGEARCSHOPBUY;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Exit"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 2.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "CSHOPISSA=nil;closeDialog 0; _n = [] SPAWN SaOkGear;";
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
};
};

//MAIN W, SEC W, PISTOL, BACKPACK, VEST, UNIFORM, HAT, GOGGLES, CHANGE UNIT