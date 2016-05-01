
class SaOkGearDialogWepShop {
    idd = 2491;
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

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Weapon Shop"; //--- ToDo: Localize;
	x = 1 * GUI_GRID_W + GUI_GRID_X;
	y = 2 * GUI_GRID_H + GUI_GRID_Y;
	w = 30 * GUI_GRID_W;
	h = 22.2 * GUI_GRID_H;
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 5.5 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 20 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.4)";
	onLBSelChanged = "_item =[];{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");_Wpic = _item CALL SaOkGearPic;ctrlSetText [1200, _Wpic]; _item CALL SAOKGEARWMAGS;";
	onMouseButtonDblClick = "_item =[];{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");_item CALL SAOKBUYWEAPON;false";
	};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.3)";
	onMouseButtonDblClick = "_item =[];{if ((lbText [1501, (lbCurSel 1501)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD2"");[_item,(lbCurSel 1502)] CALL SAOKBUYMAG; false";
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Weapon Selection"; //--- ToDo: Localize;
	x = 1.5 * GUI_GRID_W + GUI_GRID_X;
	y = 3 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Related Magazines"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscListbox_1502: RscListbox
{
	idc = 1502;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
	onMouseButtonDblClick = "_item =[];{if ((lbText [1501, (lbCurSel 1501)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD2"");[_item,(lbCurSel 1502)] CALL SAOKBUYMAG; false";
};
class RscText_1002: RscText
{
	idc = 1002;
	text = "Amount"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Buy Weapon"; //--- ToDo: Localize;
	x = 16 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "_item =[];{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");_item CALL SAOKBUYWEAPON;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Buy Mag(s)"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 6 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "_item =[];{if ((lbText [1501, (lbCurSel 1501)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD2"");[_item,(lbCurSel 1502)] CALL SAOKBUYMAG";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Exit"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	action = "CSHOPISSA=nil;closeDialog 0;_n = [] SPAWN SaOkGear;";
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	//text = "Pricing: Weapons 100, magazines 10";
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
};
};

//MAIN W, SEC W, PISTOL, BACKPACK, VEST, UNIFORM, HAT, GOGGLES, CHANGE UNIT