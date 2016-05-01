

private ["_ok","_myDisplay"];
disableserialization;
_ok = createDialog "SaOkGearDialog"; 
_myDisplay = findDisplay 1990;
[["WLA","GearShop"]] call BIS_fnc_advHint;
sleep 0.1;
ctrlSetText [1200, (primaryWeapon VariSelectedUnit) CALL SaOkGearPic]; 
ctrlSetText [1201, (secondaryWeapon VariSelectedUnit) CALL SaOkGearPic]; 
ctrlSetText [1202, (handGunWeapon VariSelectedUnit) CALL SaOkGearPic]; 
ctrlSetText [1203, (headgear VariSelectedUnit) CALL SaOkGearPic]; 
ctrlSetText [1204, (uniform VariSelectedUnit) CALL SaOkGearPic]; 
ctrlSetText [1205, [(Backpack VariSelectedUnit)] CALL SaOkGearPic]; 
ctrlSetText [1206, (Vest VariSelectedUnit) CALL SaOkGearPic];
ctrlSetText [1207, [(goggles VariSelectedUnit),""] CALL SaOkGearPic];
//lbAdd [1500, "Hard"];
_post = [(getposATL player)] CALL RETURNGUARDPOST;
if (_post distance (getposATL player) < 50 && {{!isNil{_post getvariable _x}} count ["BaseCamp","NATO","Green"] > 0}) exitwith {};
if ({getmarkercolor _x == "ColorGreen" && {player distance (getmarkerpos _x) < 500}} count (PierMarkers + FacMarkers + AIRFIELDLOCATIONS) == 0 && {DIFLEVEL >= 0.5}) then {
ctrlEnable [1610, false];
ctrlEnable [1611, false];
};

