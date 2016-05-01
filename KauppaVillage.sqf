
private ["_ok"];
if (!dialog) then {
disableserialization;
_ok = createDialog "VillageDialog"; 
lbAdd [1500, "Set SPLTY Medical"];
lbAdd [1500, "Set SPLTY AA-Guard"];
lbAdd [1500, "Set SPLTY AT-Guard"];
lbAdd [1500, "Set SPLTY MG-Guard"];
lbAdd [1500, "Bribe"];if (count _this == 0 && {isNil"IFENABLED"}) then {
lbAdd [1500, "Buy PickUp"];
lbAdd [1500, "Buy QuadBike"];
lbAdd [1500, "Buy Hatchback"];
lbAdd [1500, "Buy Sport Hatchback"];
lbAdd [1500, "Buy SUV"];
lbAdd [1500, "Buy Truck"];};
lbSetCurSel [1500, 0];
};
if ((player CALL SAOKNEARVILRELA) != "Friendly") then {ctrlEnable [1603, false];};
