
private ["_lva","_nul","_y","_b","_copy"];
//{_c = count alldead;if !(_c > 18) exitWith {};if (_c > 18) then {_x spawn SAOKDELETE;};} foreach alldead;
if (count alldeadmen > 10) then {
_copy = + alldeadmen;
_t = [] CALL SAOKSORTPLAYER;
_copy = [_copy,[_t],{_input0 distance _x},"ASCEND"] call SAOKSORTBY;
_c = count _copy - 1;
while {_c > 10} do {deletevehicle (_copy select _c); sleep 0.1;_c = _c - 1;};
};

sleep 1;

_lva = + alldeadmen;
_lva = (_lva - [player])- vehicles;
_c = count _lva - 1;
for "_i" from 0 to _c do {
    private ["_xx"];
    _xx = _lva select _i;
	if(!(_xx isKindOf "Animal")) then {
	if ((vehicle player distance _xx > 800) && {isNil {_xx getvariable "WaitingD"}}) then {
	_xx enablesimulation false;
	_xx disableAI "ANIM";
	_xx disableAI "FSM";
	_xx setvariable ["WaitingD",1];
	if (typeof _xx iskindof "SoldierEB") then {[_xx] SPAWN FENEMYCASULTIE;};
	if ({typeof _xx iskindof _x} count ["SoldierWB","SoldierGB"] > 0 && {getposATL _xx distance [0,0,0] > 0}) then {[getposATL _xx,"KIA","ColorGreen"] SPAWN SAOKCREATEMARKER;};
	_nul =[_xx] SPAWN SAOKSHF25;
	} 
	else {
	if (count CROWCOUNT  < 1 && {([] CALL FPSGOOD)} && {vehicle _xx == _xx}) then {
	[_xx] SPAWN SAOKSHF23;
	};
	//NEW FLIES
	if (count FLYCOUNT  < 1 && {([] CALL FPSGOOD)} && {vehicle _xx == _xx}) then {
	[_xx] SPAWN SAOKSHF24;
	};
	};
	};	
sleep 0.1;	
}; 
sleep 10;
{if (!alive _x && {isNil{_x getvariable "dung"}} && {!(_x in CARS)}) then {_nul = [_x] SPAWN FUNKTIO_POISTAKARRY;};sleep 0.01;} foreach vehicles;
sleep 10;
_lva = + CARS;
_c = count _lva - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _lva select _i;
if (({alive _x} count crew _xx == 0 || {!(alive driver _xx)}) && {isNil{_x getvariable "dung"}) then {_nul = [_xx] SPAWN FUNKTIO_POISTAKARRY;};
sleep 0.1;
};

