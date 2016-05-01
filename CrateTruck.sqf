//"ReammoBox_F"

[] SPAWN {
while {true} do {
waitUntil {sleep 1; {isNil{_x getvariable "AUTOSSA"} && {isNil{_x getvariable "CCCrate"}}} count ((getposATL player) nearEntities ["ReammoBox_F", 20]) > 0 && {{isNil{_x getvariable "CrateFull"}} count ((getposATL player) nearEntities [["B_G_Van_01_transport_F","C_Van_01_transport_F","I_G_Van_01_transport_F"], 20]) > 0} && {vehicle player == player}};
_crate = objNull;
{if (isNil{_x getvariable "AUTOSSA"} && {isNil{_x getvariable "CCCrate"}}) exitWith {_crate = _x;};} foreach ((getposATL player) nearEntities ["ReammoBox_F", 22]);
_truck = ((getposATL player) nearEntities [["B_G_Van_01_transport_F","C_Van_01_transport_F","I_G_Van_01_transport_F"], 22]) select 0;
_ACT = [
(player addAction ["Load Crate to Truck", {
_crate = ((_this select 3) select 0);
_crate setvariable ["AUTOSSA",1];
_truck = ((_this select 3) select 1);
_pos = [0,-1.2,-0.4];
if (!isNil{_truck getvariable "Crates"}) then {
if (_truck getvariable "Crates" == 1) then {_pos = [0,-1.9,-0.4];_truck setvariable ["Crates",2];} else {_pos = [0,-2.7,-0.4];_truck setvariable ["CrateFull",1];"Truck is full now" SPAWN HINTSAOK;};
} else {_truck setvariable ["Crates",1];};
if (isNil{_truck getvariable "CrateOBJs"}) then {_truck setvariable ["CrateOBJs",[_crate]];} else {_truck setvariable ["CrateOBJs",((_truck getvariable "CrateOBJs")+[_crate])];};
_crate attachTo [_truck,_pos];
missionnamespace setvariable ["ClickedA",1];
},[_crate,_truck]])
];
waitUntil {sleep 0.1; !isNil{missionnamespace getvariable "ClickedA"} || {{isNil{_x getvariable "AUTOSSA"}} count ((getposATL player) nearEntities ["ReammoBox_F", 20]) == 0} || {{isNil{_x getvariable "CrateFull"}} count ((getposATL player) nearEntities [["B_G_Van_01_transport_F","C_Van_01_transport_F","I_G_Van_01_transport_F"], 20]) == 0} || {vehicle player != player}};
{player removeAction _x;} foreach _ACT;
missionnamespace setvariable ["ClickedA",nil];
};
};

[] SPAWN {

while {true} do {
waitUntil {sleep 2; {!isNil{_x getvariable "CrateOBJs"}} count ((getposATL player) nearEntities [["B_G_Van_01_transport_F","C_Van_01_transport_F","I_G_Van_01_transport_F"], 20]) > 0 && {vehicle player == player}};
_truck = vehicle player;
{if (!isNil{_x getvariable "CrateOBJs"}) exitWith {_truck = _x;};} foreach ((getposATL player) nearEntities [["B_G_Van_01_transport_F","C_Van_01_transport_F","I_G_Van_01_transport_F"], 22]);
_ACT = [
(player addAction ["Unload Crates from Truck", {
_truck = ((_this select 3) select 0);
{detach _x; 
_pos = [(getposATL _x select 0)+15-(random 30),(getposATL _x select 1)+15-(random 30),0];
while {_pos distance _truck < 10} do {_pos = [(getposATL _x select 0)+15-(random 30),(getposATL _x select 1)+15-(random 30),0];};
_x setpos _pos;
_x setvariable ["AUTOSSA",nil];
} foreach (_truck getvariable "CrateOBJs");
_truck setvariable ["CrateOBJs",nil];
_truck setvariable ["Crates",nil];
_truck setvariable ["CrateFull",nil];
},[_truck]])
];
waitUntil {sleep 0.2; {!isNil{_x getvariable "CrateOBJs"}} count ((getposATL player) nearEntities [["B_G_Van_01_transport_F","C_Van_01_transport_F","I_G_Van_01_transport_F"], 20]) == 0 || {vehicle player != player}};
{player removeAction _x;} foreach _ACT;

};


};