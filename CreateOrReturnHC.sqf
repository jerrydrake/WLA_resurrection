//CREATE HC

private ["_gr","_nul","_hM"];
if (count (_this select 0) > 0) then {
if ({(typeof (vehicle _x) iskindof "Air")} count (_this select 0) > 0 || {(typeof (vehicle player) iskindof "Air")}) then {"You cant create HC group when you or any of the selected team-mates is in chopper or plane" SPAWN HINTSAOK;} else {
_gr = creategroup west;
(_this select 0) join _gr;
if ({vehicle _x == _x} count (_this select 0) == 0 && {{group (driver (vehicle _x)) == group _x} count (_this select 0) > 0}) then {
FriendlyVehicles set [count FriendlyVehicles,_gr];
} else {
FriendlyInf set [count FriendlyInf,_gr];
};
player hcsetgroup [_gr,""];
{_x setvariable ["FromP",1];} foreach units _gr;
"HC group was created and can be now ordered from Ctrl+Space view" SPAWN HINTSAOK;
};
};
//RETURN HC
if (count (_this select 1) > 0) then {
{
if !(typeof (vehicle leader _x) iskindof "Air" || {typeof (vehicle leader _x) iskindof "UGV_01_base_F"}) then {
_hM = ({isNil{_x getvariable "FromP"}} count units _x)*100;
if (_hM < pisteet) then {
pisteet = pisteet - _hM;
_nul = [-_hM, "Received Team-mates"] SPAWN PRESTIGECHANGE;
units _x joinSilent player;
} else {
"Not enough prestige. Would cost 100 per man" SPAWN HINTSAOK;
};
}; 
} foreach (_this select 1);
};
