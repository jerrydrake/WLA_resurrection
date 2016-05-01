////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.062, #Tuhycy)
////////////////////////////////////////////////////////

class MapCom {
    idd = 3333;
    movingEnable = false;
    objects[] = {};
    class controlsBackground {
	class RscFrame_1800: RscStructuredText
	{
	access = 0; 
	idc = 1800;
	text = ""; //--- ToDo: Localize;
	x = -4 * GUI_GRID_W + GUI_GRID_X;
	y = -4 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	//onMouseMoving = "hint str _this;";
	onMouseEnter = "BUM = BUM + 1;";
	onMouseExit  = "BUM = BUM - 1;";
	};
	};
    class controls {

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Santeri, v1.063, #Hyqawe)
//////////////////////////////////////////////////////// 
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Rem WPs"; //--- ToDo: Localize;
	x = 10 * GUI_GRID_W + GUI_GRID_X;
	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(missionnamespace getvariable ""CurTeam"") CALL SAOKVZMOVESTOP; closeDialog 0;";
	onMouseEnter = "BUM = BUM + 1;";
	onMouseExit  = "BUM = BUM - 1;";
	colorText[] = 
	{
		0.2,
		0.8,
		1,
		0.8
	};
	colorbackground[] = 
	{
		1,
		0,
		0.8,
		0.2
	};
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Hold Pos"; //--- ToDo: Localize;
	x = 9 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	action = "(missionnamespace getvariable ""CurTeam"") CALL SAOKVZMOVESTOP;if (isNil{(missionnamespace getvariable ""CurTeam"") getvariable ""NOMOVE""}) then {(missionnamespace getvariable ""CurTeam"") setvariable [""NOMOVE"",1];NOMORDERED pushback (missionnamespace getvariable ""CurTeam"");} else {(missionnamespace getvariable ""CurTeam"") setvariable [""NOMOVE"",nil];NOMORDERED = NOMORDERED - [(missionnamespace getvariable ""CurTeam"")];}; closeDialog 0;";
	onMouseEnter = "BUM = BUM + 1;";
	onMouseExit  = "BUM = BUM - 1;";
	colorbackground[] = 
	{
		1,
		0,
		0.8,
		0.2
	};
	colorText[] = 
	{
		0.2,
		0.8,
		1,
		0.8
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
