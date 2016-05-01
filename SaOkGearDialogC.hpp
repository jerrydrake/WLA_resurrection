
class SaOkGearDialogC {
    idd = 1992;
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
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Lakity)
////////////////////////////////////////////////////////

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Container"; //--- ToDo: Localize;
	x = 1.95 * GUI_GRID_W + GUI_GRID_X;
	y = 11.03 * GUI_GRID_H + GUI_GRID_Y;
	w = 34 * GUI_GRID_W;
	h = 11.5 * GUI_GRID_H;
};

class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 36 * GUI_GRID_W + GUI_GRID_X;
	y = 2.05 * GUI_GRID_H + GUI_GRID_Y;
	w = 13.5 * GUI_GRID_W;
	h = 22.5 * GUI_GRID_H;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.75)";
};

class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 2 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 4.5 * GUI_GRID_H;
};
class RscPicture_1201: RscPicture
{
	idc = 1201;
	text = "";
	x = 6 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 3.5 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 2.1 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.3 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 0.9)";
	onLBSelChanged = "_item =[];{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");if (typename _item == ""STRING"" && {isClass(configFile >> ""cfgVehicles"" >> _item)}) then {_item = [_item];};_Wpic = _item CALL SaOkGearPic;ctrlSetText [1201, _Wpic];";
	onMouseButtonDblClick = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARCCHANGE;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;false";
	};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Equip"; //--- ToDo: Localize;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARCCHANGE;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;";
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Unequip"; //--- ToDo: Localize;
	x = 7.2 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARCDEL;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;";
};
class RscButton_1606: RscButton
{
	idc = 1606;
	text = "Destroy"; //--- ToDo: Localize;
	x = 11.4 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARCDES;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;";
};
class RscListbox_1502: RscListbox
{
	idc = 1502;
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
	canDrag = 1; // 1 (true) to allow item dragging 1400
	onLBDrop = "if ((_this select 3) == 1501) then {(((_this select 4)select 0)select 0) CALL SAOKADDITEM;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;}; false";
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.3)";
	onMouseButtonDblClick = "(lbText [1502, (lbCurSel 1502)]) CALL SAOKREMOVEITEM;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;false";
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
	canDrag = 1; // 1 (true) to allow item dragging
	onLBDrop = "if ((_this select 3) == 1502) then {(((_this select 4)select 0)select 0) CALL SAOKREMOVEITEM;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;}; false";
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.3)";
	onMouseButtonDblClick = "(lbText [1501, (lbCurSel 1501)]) CALL SAOKADDITEM;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;false";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Add Item"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbText [1501, (lbCurSel 1501)]) CALL SAOKADDITEM;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;";
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "Del Item"; //--- ToDo: Localize;
	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbText [1501, (lbCurSel 1501)]) CALL SAOKDELITEM;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Remove Item From Container"; //--- ToDo: Localize;
	x = 23.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 12 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbText [1502, (lbCurSel 1502)]) CALL SAOKREMOVEITEM;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Back"; //--- ToDo: Localize;
	x = 23.5 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "closeDialog 0; _n = [] SPAWN SaOkGear;";
};
class RscButton_1607: RscButton
{
	idc = 1607;
	text = "Rem Mags"; //--- ToDo: Localize;
	x = 28.5 * GUI_GRID_W + GUI_GRID_X;
	y = 21 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "_n = [] SPAWN SAOKGEARREMMAGS;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARC;";
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "Carrying In Container"; //--- ToDo: Localize;
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscText_1001: RscText
{
	idc = 1001;
	text = "Available in Storage"; //--- ToDo: Localize;
	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
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