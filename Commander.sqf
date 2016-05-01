sleep 5;
{if (!(_x in CantCommand) && {!(side (leader _x) in [EAST,CIVILIAN])} && {count units _x > 1} && {(getposATL (vehicle (leader _x)) select 2) < 2} && {!(_x in (hcAllGroups player))}) then {player hcsetgroup [_x,""];};sleep 0.1;} foreach (AllGroups-[group player]);
{if (_x in CantCommand || {typeof (vehicle leader _x) iskindof "Air"}) then {player hcRemoveGroup _x;};sleep 0.1;} foreach (hcAllGroups player);



