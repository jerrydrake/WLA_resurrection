private ["_issue","_text","_new"];
_issue = _this select 0;
_text = "";
switch (_issue) do {
case "Revenging dead TM": {
_text = "+0.2 General" + "<br/>" + "+0.3 SpotDistance" + "<br/>" + "+0.3 SpotTime" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "SpotDistance")+0.3  < 1.3) then {((_this select 1) skill "SpotDistance")+0.3 } else {1};
(_this select 1) setSkill ["SpotDistance",_new];
_new = if (((_this select 1) skill "SpotTime")+0.3  < 1.3) then {((_this select 1) skill "SpotTime")+0.3 } else {1};
(_this select 1) setSkill ["SpotTime",_new];
_new = if (((_this select 1) skill "General")+0.2 < 1.2) then {((_this select 1) skill "General")+0.2} else {1};
(_this select 1) setSkill ["General",_new];
};
};
case "In Shock of dead TM": {
_text = "+0.2 AimingShake" + "<br/>" + "-0.2 SpotDistance" + "<br/>" + "-0.2 SpotTime" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "SpotDistance")-0.2 > 0) then {((_this select 1) skill "SpotDistance")-0.2} else {0};
(_this select 1) setSkill ["SpotDistance",_new];
_new = if (((_this select 1) skill "SpotTime")-0.2 > 0) then {((_this select 1) skill "SpotTime")-0.2} else {0};
(_this select 1) setSkill ["SpotTime",_new];
_new = if (((_this select 1) skill "AimingShake")+0.2 < 1.2) then {((_this select 1) skill "AimingShake")+0.2} else {1};
(_this select 1) setSkill ["AimingShake",_new];
};
};
case "Homesick": {
_text = "-0.2 SpotDistance" + "<br/>" + "-0.2 SpotTime" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "SpotDistance")-0.2 > 0) then {((_this select 1) skill "SpotDistance")-0.2} else {0};
(_this select 1) setSkill ["SpotDistance",_new];
_new = if (((_this select 1) skill "SpotTime")-0.2 > 0) then {((_this select 1) skill "SpotTime")-0.2} else {0};
(_this select 1) setSkill ["SpotTime",_new];
};
};
case "Worried": {
_text = "+0.2 AimingShake" + "<br/>" + "-0.2 General" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "AimingShake")+0.2 < 1.2) then {((_this select 1) skill "AimingShake")+0.2} else {1};
(_this select 1) setSkill ["AimingShake",_new];
_new = if (((_this select 1) skill "General")-0.2 > 0) then {((_this select 1) skill "General")-0.2} else {0};
(_this select 1) setSkill ["General",_new];
};
};
case "Stressed": {
_text = "+0.1 AimingShake" + "<br/>" + "-0.1 General" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "AimingShake")+0.1 < 1.1) then {((_this select 1) skill "AimingShake")+0.1} else {1};
(_this select 1) setSkill ["AimingShake",_new];
_new = if (((_this select 1) skill "General")-0.1 > 0) then {((_this select 1) skill "General")-0.1} else {0};
(_this select 1) setSkill ["General",_new];
};
};
case "Mad of your actions": {
_text = "-0.1 Courage" + "<br/>" + "-0.1 General" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "Courage")-0.1 > 0) then {((_this select 1) skill "Courage")-0.1} else {0};
(_this select 1) setSkill ["Courage",_new];
_new = if (((_this select 1) skill "General")-0.1 > 0) then {((_this select 1) skill "General")-0.1} else {0};
(_this select 1) setSkill ["General",_new];
};
};
case "Happy": {
_text = "+0.1 Courage" + "<br/>" + "+0.1 General" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "Courage")+0.1 < 1.1) then {((_this select 1) skill "Courage")+0.1} else {1};
(_this select 1) setSkill ["Courage",_new];
_new = if (((_this select 1) skill "General")+0.1 < 1.1) then {((_this select 1) skill "General")+0.1} else {1};
(_this select 1) setSkill ["General",_new];
};
};
case "Upset": {
//"General"
_text = "-0.1 Courage" + "<br/>" + "-0.1 General" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "Courage")-0.1 > 0) then {((_this select 1) skill "Courage")-0.1} else {0};
(_this select 1) setSkill ["Courage",_new];
_new = if (((_this select 1) skill "General")-0.1 > 0) then {((_this select 1) skill "General")-0.1} else {0};
(_this select 1) setSkill ["General",_new];
};
};
case "Very Upset": {
_text = "-0.3 Courage" + "<br/>" + "-0.15 General" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "Courage")-0.3 > 0) then {((_this select 1) skill "Courage")-0.3} else {0};
(_this select 1) setSkill ["Courage",_new];
_new = if (((_this select 1) skill "General")-0.15 > 0) then {((_this select 1) skill "General")-0.15} else {0};
(_this select 1) setSkill ["General",_new];
};
};
case "TiRed": {
_text = "-0.3 Endurance" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "endurance")-0.3 > 0) then {((_this select 1) skill "endurance")-0.3} else {0};
(_this select 1) setSkill ["endurance",_new];
};
};
case "Very TiRed": {
_text = "-0.6 Endurance" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "endurance")-0.6 > 0) then {((_this select 1) skill "endurance")-0.6} else {0};
(_this select 1) setSkill ["endurance",_new];
};
};
case "Exhausted": {
_text = "-0.9 Endurance" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "endurance")-0.9 > 0) then {((_this select 1) skill "endurance")-0.9} else {0};
(_this select 1) setSkill ["endurance",_new];
};
};
case "Flu": {
_text = "-0.2 Endurance" + "<br/>" + "+0.1 Courage" + "<br/>" + "+0.15 AimingShake" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "endurance")-0.2 > 0) then {((_this select 1) skill "endurance")-0.2} else {0};
(_this select 1) setSkill ["endurance",_new];
_new = if (((_this select 1) skill "Courage")+0.1 < 1.1) then {((_this select 1) skill "endurance")+0.1} else {1};
(_this select 1) setSkill ["Courage",_new];
_new = if (((_this select 1) skill "AimingShake")+0.15 < 1.15) then {((_this select 1) skill "AimingShake")+0.15} else {1};
(_this select 1) setSkill ["AimingShake",_new];
};
};
case "Hand Injury": {
_text = "-0.3 AimingAccuracy" + "<br/>" + "+ 0.3 AimingSpeed" + "<br/>" + "-0.3 AimingShake" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "AimingAccuracy")-0.3 > 0) then {((_this select 1) skill "AimingAccuracy")-0.3} else {0};
(_this select 1) setSkill ["AimingAccuracy",_new];
_new = if (((_this select 1) skill "AimingSpeed")-0.3 > 0) then {((_this select 1) skill "AimingSpeed")-0.3} else {0};
(_this select 1) setSkill ["AimingSpeed",_new];
_new = if (((_this select 1) skill "AimingShake")+0.3 < 1.3) then {((_this select 1) skill "AimingShake")+0.3} else {1};
(_this select 1) setSkill ["AimingShake",_new];
};
};
case "Knee Problem": {
_text = "-0.5 Endurance" + "<br/>" + "-0.2 AimingAccuracy" + "<br/>";
if (count _this > 1) then {
_new = if (((_this select 1) skill "AimingAccuracy")-0.2 > 0) then {((_this select 1) skill "AimingAccuracy")-0.2} else {0};
(_this select 1) setSkill ["AimingAccuracy",_new];
_new = if (((_this select 1) skill "Endurance")-0.5 > 0) then {((_this select 1) skill "Endurance")-0.5} else {0};
(_this select 1) setSkill ["Endurance",_new];
};
};
};
if (count _this == 1) exitWith {_text};