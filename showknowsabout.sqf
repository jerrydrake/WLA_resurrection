_unit = _this select 0;
while {alive _unit} do {sleep 5; 
{
//if (behaviour leader _x  == "COMBAT") then {hint format ["%1 %2", (_x knowsabout _unit), behaviour leader _x];};
hint format ["%1 %2", (_x knowsabout _unit), behaviour leader _x];
} foreach HeliGroups;
};