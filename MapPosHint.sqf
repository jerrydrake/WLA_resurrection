//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
//_Stxt = parseText format
//["
//<t color='#FDD017'>INSTRUCTIONS:<br/></t><t color='#56A5EC'>Click on </t><t color='#00FFFF'>Map</t><t color='#56A5EC'> to give position for </t><t color='#00FFFF'>Minefield marker</t>
//<t color='#FFFFFF'><img image='armaP4.jpg' size='6' align='right'/></t><br/> 
//"];
//hint _Stxt; 
BIS_AdvHints_THeader =  "<t color='#FDD017'>INSTRUCTIONS:</t>";
BIS_AdvHints_TInfo = "<t color='#56A5EC'>Click on </t><t color='#00FFFF'>Map</t><t color='#56A5EC'> to give position for </t><t color='#00FFFF'>Minefield marker</t><br/><br/><t color='#FFFFFF'><img image='armaP5.jpg' size='12' align='right'/></t>";
BIS_AdvHints_TAction = "";
BIS_AdvHints_TBinds = "";
BIS_AdvHints_Text = call BIS_AdvHints_formatText;
BIS_AdvHints_Duration = 6;
BIS_AdvHints_Seamless = true;
BIS_AdvHints_Silent = true;
call BIS_AdvHints_showHint;
