//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
if (!alive AMMOT) exitWith {
BIS_AdvHints_THeader = "<t color='#FDD017'>NOTE:</t>";
BIS_AdvHints_TInfo = "<t color='#56A5EC'>You cant remove any </t><t color='#00FFFF'>minesfields</t><t color='#56A5EC'> because </t><t color='#00FFFF'>ammotruck</t><t color='#56A5EC'> is destroyed</t><t color='#FFFFFF'><img image='armaP3.jpg' size='6' align='right'/></t>";
BIS_AdvHints_TAction = "";
BIS_AdvHints_TBinds = "";
BIS_AdvHints_Text = call BIS_AdvHints_formatText;
BIS_AdvHints_Duration = 6;
BIS_AdvHints_Seamless = true;
BIS_AdvHints_Silent = true;
call BIS_AdvHints_showHint;
};
_mines = 0;
_nObject = nearestObject [AMMOT, "Mine"];
while {!isNull _nObject} do {deletevehicle _nObject;sleep 0.05;_mines = _mines + 1;_nObject = nearestObject [AMMOT, "Mine"];};
MINEC = MINEC + _mines;
if (_mines > 0) then {
BIS_AdvHints_THeader = "<t color='#FDD017'>UPDATE:</t>";
BIS_AdvHints_TInfo = ""+format ["<t color='#00FFFF'>%1</t>",_mines]+" <t color='#00FFFF'>Mines</t><t color='#56A5EC'> was loaded back to </t><t color='#00FFFF'>ammotruck</t><t color='#FFFFFF'><img image='armaP1.jpg' size='6' align='right'/></t>";
BIS_AdvHints_TAction = "";
BIS_AdvHints_TBinds = "";
BIS_AdvHints_Text = call BIS_AdvHints_formatText;
BIS_AdvHints_Duration = 6;
BIS_AdvHints_Seamless = true;
BIS_AdvHints_Silent = true;
call BIS_AdvHints_showHint;
} else {
BIS_AdvHints_THeader = "<t color='#FDD017'>INSTRUCTIONS:</t>";
BIS_AdvHints_TInfo = "<t color='#00FFFF'>Ammotruck</t><t color='#56A5EC'> needs to be less than </t><t color='#00FFFF'>50 meters</t><t color='#56A5EC'> away from </t><t color='#00FFFF'>mines</t><t color='#FFFFFF'><img image='armaP1.jpg' size='6' align='right'/></t>";
BIS_AdvHints_TAction = "";
BIS_AdvHints_TBinds = "";
BIS_AdvHints_Text = call BIS_AdvHints_formatText;
BIS_AdvHints_Duration = 6;
BIS_AdvHints_Seamless = true;
BIS_AdvHints_Silent = true;
call BIS_AdvHints_showHint;
};
