
private ["_nul"];
deletevehicle SleepTrig; 
task0 settaskstate "CANCELLED"; 
_nul=[objNull, ObjNull, task0, "CANCELLED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";
deletemarker "sleepM";
CLICKED=true;

