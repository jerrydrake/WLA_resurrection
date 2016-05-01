
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
	text = "Weapon Selection"; //--- ToDo: Localize;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 28 * GUI_GRID_W;
	h = 16.5 * GUI_GRID_H;
};
class RscFrame_1801: RscFrame
{
	idc = 1801;
	text = "Attachments"; //--- ToDo: Localize;
	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5 * GUI_GRID_W;
	h = 13.5 * GUI_GRID_H;
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
	//onLBDrop = "if ((_this select 3) == 1500) then {_n = [] CALL SAOKGEARREMWMAGS;(((_this select 4)select 0)select 0) CALL SAOKGEARADDWMAGS;(((_this select 4)select 0)select 0) CALL SAOKGEARWCHANGE;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;}; false";
};
class RscPicture_1204: RscPicture
{
	idc = 1204;
	text = "";
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 11 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscStructuredText_1102: RscStructuredText
{
	idc = 1102;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
/*
class RscPicture_1201: RscPicture
{
	idc = 1201;
	text = "";
	x = 21.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscPicture_1202: RscPicture
{
	idc = 1202;
	text = "";
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscPicture_1203: RscPicture
{
	idc = 1203;
	text = "";
	x = 23 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 3 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
*/
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 16 * GUI_GRID_W;
	h = 9 * GUI_GRID_H;
	//canDrag = 1; // 1 (true) to allow item dragging 1400
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.4)";
	onLBSelChanged = "_kuva2 = [];{if ((lbText [1500, (lbCurSel 1500)]) == _x select 1) exitWith {_kuva2 = _x select 0};} foreach (missionNameSpace getvariable ""helpD"");if (typename _kuva2 == ""STRING"") then {_Wpic2 = _kuva2 CALL SaOkGearPic;ctrlSetText [1204, _Wpic2];};";
	onMouseButtonDblClick = "_n = [] CALL SAOKGEARREMWMAGS;(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARADDWMAGS;(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARWCHANGE;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW; false";
	};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 10 * GUI_GRID_W;
	h = 3.5 * GUI_GRID_H;
	sizeEx ="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	onMouseButtonDblClick = "(lbText [1501, (lbCurSel 1501)]) CALL SAOKADDATTACHMENT;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;false";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Equip Weapon"; //--- ToDo: Localize;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 18.6 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "_n = [] CALL SAOKGEARREMWMAGS;(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARADDWMAGS;(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARWCHANGE;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "Unequip Weapon"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 18.6 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.7 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "_n = [] CALL SAOKGEARREMWMAGS;[] CALL SAOKGEARWDEL;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1607: RscButton
{
	idc = 1607;
	text = "Reammo Weapon"; //--- ToDo: Localize;
	x = 11 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.7 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "[] CALL SAOKGEARADDWMAGS;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "Destroy Weapon"; //--- ToDo: Localize;
	x = 4 * GUI_GRID_W + GUI_GRID_X;
	y = 20.0 * GUI_GRID_H + GUI_GRID_Y;
	w = 6.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "(lbText [1500, (lbCurSel 1500)]) CALL SAOKGEARWDES;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1606: RscButton
{
	idc = 1606;
	text = "Destroy Attachment"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 17.4 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "(lbText [1501, (lbCurSel 1501)]) CALL SAOKDESTROYATTACHMENTS; closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Attach"; //--- ToDo: Localize;
	x = 21 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "(lbText [1501, (lbCurSel 1501)]) CALL SAOKADDATTACHMENT;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Unattach All"; //--- ToDo: Localize;
	x = 26 * GUI_GRID_W + GUI_GRID_X;
	y = 16 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
	action = "(missionNameSpace getvariable ""Wmode"") CALL SAOKREMOVEATTACHMENTS;closeDialog 0;(missionNameSpace getvariable ""Wmode"") SPAWN SAOKGEARW;";
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Back to Gear Menu"; //--- ToDo: Localize;
	x = 22.5 * GUI_GRID_W + GUI_GRID_X;
	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.5 * GUI_GRID_W;
	h = 1.2 * GUI_GRID_H;
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