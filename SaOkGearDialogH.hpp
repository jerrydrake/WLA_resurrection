
class SaOkGearDialogH {
    idd = 1993;
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

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Foxora)
////////////////////////////////////////////////////////

class RscFrame_1800: RscFrame
{
	idc = 1800;
	text = "Hat Selection"; //--- ToDo: Localize;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 12.5 * GUI_GRID_W;
	h = 14.5 * GUI_GRID_H;
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 5.5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscPicture_1201: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 3 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 17 * GUI_GRID_H + GUI_GRID_Y;
	w = 11.5 * GUI_GRID_W;
	h = 6.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.3)";
	onLBSelChanged = "_item =[];{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_item = _x select 0;};} foreach (missionNameSpace getvariable ""helpD"");if (typename _item == ""STRING"") then {_Wpic = _item CALL SaOkGearPic;ctrlSetText [1201, _Wpic];} else {ctrlSetText [1201, """"];};";
	onMouseButtonDblClick = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARHCHANGE;closeDialog 0;[] SPAWN SAOKGEARH;false";
	};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Change To"; //--- ToDo: Localize;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 24 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARHCHANGE;closeDialog 0;[] SPAWN SAOKGEARH;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Back"; //--- ToDo: Localize;
	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
	y = 24 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
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

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};

//MAIN W, SEC W, PISTOL, BACKPACK, VEST, UNIFORM, HAT, GOGGLES, CHANGE UNIT