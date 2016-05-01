private ["_ok"];
sleep (random 0.05);
if (dialog) exitWith {};
disableserialization;
_ok = createDialog "LightsDialog"; 
