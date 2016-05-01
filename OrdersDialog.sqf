private ["_b","_ok","_myDisplay"];
sleep (random 0.1);
if (dialog) exitWith {}; 
_b = false;
if (isNil{AutoReplac}) then {_b = true;};
_a = false;
if (!isNil{TeamStay}) then {_a = true;};
disableserialization;
_ok = createDialog "OrdersDialog"; 
_myDisplay = findDisplay 124141;

(_myDisplay displayCtrl 2800) ctrlSetChecked _b;
(_myDisplay displayCtrl 2801) ctrlSetChecked _a;

if (!isNil{CIVMODE}) then {
ctrlEnable [1600, false];
ctrlEnable [1606, false];
ctrlEnable [1603, false];
ctrlEnable [1604, false];
};