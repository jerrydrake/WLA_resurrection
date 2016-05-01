//(screenToWorld [0.5,0.5]) SPAWN SAOKLEDIT;

SAOKLEDIT = {
private ["_ok","_text"];
sleep (random 0.1);
if (dialog) exitWith {};
disableserialization;
_ok = createDialog "LightEditorDialog"; 
//lbAdd [1500, "setLightAmbient"];
lbAdd [1500, "setLightAmbient"];
lbAdd [1500, "setLightColor"];
lbAdd [1500, "setLightFlareMaxDistance"];
lbAdd [1500, "setLightFlareSize"];
lbAdd [1500, "setLightAttenuation"];
lbAdd [1500, "setLightIntensity"];
lbAdd [1500, "setLightUseFlare"];
lbSetCurSel [1500, 0];
missionnamespace setvariable ["SAOKLCAT","setLightAmbient"];
_pos = [_this select 0,_this select 1,1.5];

//Light_1 _l= "Light_1" createVehicleLocal [getposATL thisTrigger select 0,getposATL thisTrigger select 1,5];  
if (isNil"light1") then {
light1 = "#lightpoint" createVehicleLocal _pos;  
light1 setLightAmbient [1, 1, 1]; 
light1 setLightColor [1, 1, 1]; 
light1 setLightAttenuation [15,0,80,4.31918e-005];
light1 setLightIntensity 1000;
light1 setLightUseFlare true;
light1 setLightFlareSize 10; 
light1 setLightFlareMaxDistance 100;
light1 setLightDayLight true;
//
missionnamespace setvariable ["SAOKLPARA",[15,0,80,4.31918e-005,1000,true,10,100, 1, 1, 1, 1, 1, 1]];
};
};

SAOKLCOPYCLIP = {
private ["_a"];
_a = missionnamespace getvariable "SAOKLPARA";
_text = format["
_light1 = ""#lightpoint"" createVehicleLocal _pos;  
_light1 setLightAmbient [%9, %10, %11]; 
_light1 setLightColor [%12, %13, %14]; 
_light1 setLightAttenuation [%1,%2,%3,%4];
_light1 setLightIntensity %5;
_light1 setLightUseFlare %6;
_light1 setLightFlareSize %7; 
_light1 setLightFlareMaxDistance %8;
_light1 setLightDayLight true;
",_a select 0,_a select 1,_a select 2,_a select 3,_a select 4,_a select 5,_a select 6,_a select 7,_a select 8,_a select 9,_a select 10,_a select 11,_a select 12,_a select 13];
copyToClipboard _text;
hint "copied";
};

//(sliderPosition 1900)
SAOKLSLIDERC = {
private ["_cur","_curP"];
_cur = missionnamespace getvariable "SAOKLCAT";
_curP = missionnamespace getvariable "SAOKLPARA";
switch _this do {
case 1: {
switch _cur do {
case "setLightAmbient": {
_curP set [8,(sliderPosition 1900)];
};
case "setLightColor": {
_curP set [11,(sliderPosition 1900)];
};
case "setLightFlareMaxDistance": {
_curP set [7,(sliderPosition 1900)];
};
case "setLightFlareSize": {
_curP set [6,(sliderPosition 1900)];
};
case "setLightIntensity": {
_curP set [4,(sliderPosition 1900)];
};
case "setLightUseFlare": {
sliderSetRange [1900, 0, 1];
_c = false;
if ((sliderPosition 1900) > 0.5) then {_c = true;};
_curP set [5,_c];
};
case "setLightAttenuation": {
_curP set [0,(sliderPosition 1900)];
};
};
};
case 2: {
switch _cur do {
case "setLightAttenuation": {
_curP set [1,(sliderPosition 1901)];
};
case "setLightAmbient": {
_curP set [9,(sliderPosition 1901)];
};
case "setLightColor": {
_curP set [12,(sliderPosition 1901)];
};
};
};
case 3: {
switch _cur do {
case "setLightAttenuation": {
_curP set [2,(sliderPosition 1902)];
};
case "setLightAmbient": {
_curP set [10,(sliderPosition 1902)];
};
case "setLightColor": {
_curP set [13,(sliderPosition 1902)];
};
};
};
case 4: {
switch _cur do {
case "setLightAttenuation": {
_curP set [3,(sliderPosition 1903)];
};
};
};
};
missionnamespace setvariable ["SAOKLPARA",_curP];
light1 setLightAttenuation [_curP select 0,_curP select 1,_curP select 2,_curP select 3];
light1 setLightIntensity (_curP select 4);
light1 setLightUseFlare (_curP select 5);
light1 setLightFlareSize (_curP select 6); 
light1 setLightFlareMaxDistance (_curP select 7);
light1 setLightAmbient [(_curP select 8), (_curP select 9), (_curP select 10)]; 
light1 setLightColor [(_curP select 11),(_curP select 12),(_curP select 13)]; 
};

SAOKLVALC = {
missionnamespace setvariable ["SAOKLCAT",_this];
_curP = missionnamespace getvariable "SAOKLPARA";
switch (_this) do {
case "setLightFlareMaxDistance": {
sliderSetRange [1900, 0, 1000];
sliderSetPosition [1900, _curP select 7];
};
case "setLightFlareSize": {
sliderSetRange [1900, 0, 10];
sliderSetPosition [1900, _curP select 6];
};
case "setLightIntensity": {
sliderSetRange [1900, 0, 10000];
sliderSetPosition [1900, _curP select 4];
};
case "setLightUseFlare": {
sliderSetRange [1900, 0, 1];
_c = 0;
if (_curP select 5) then {_c = 1;};
sliderSetPosition [1900, _c];
};
case "setLightAttenuation": {
sliderSetRange [1900, 0, 100];
sliderSetPosition [1900, _curP select 0];
sliderSetRange [1901, 0, 100];
sliderSetPosition [1901, _curP select 1];
sliderSetRange [1902, 0, 100];
sliderSetPosition [1902, _curP select 2];
sliderSetRange [1903, 0, 100];
sliderSetPosition [1903, _curP select 3];
};
case "setLightAmbient": {
sliderSetRange [1900, 0, 1];
sliderSetPosition [1900, _curP select 8];
sliderSetRange [1901, 0, 1];
sliderSetPosition [1901, _curP select 9];
sliderSetRange [1902, 0, 1];
sliderSetPosition [1902, _curP select 10];
};
case "setLightColor": {
sliderSetRange [1900, 0, 1];
sliderSetPosition [1900, _curP select 11];
sliderSetRange [1901, 0, 1];
sliderSetPosition [1901, _curP select 12];
sliderSetRange [1902, 0, 1];
sliderSetPosition [1902, _curP select 13];
};
};
};