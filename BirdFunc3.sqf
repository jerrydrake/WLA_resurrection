private ["_type","_st","_crowList","_end","_flockCount","_crow","_dis","_delay"];
if !([] CALL FPSGOOD) exitWith {};
_st = _this;
_st = [(_st select 0) - 135 + (random 270),(_st select 1) - 135 + (random 270),0];
_dis = _st distance _this;
_delay = _dis * 0.00294;
sleep (_delay + 0.1);
_flockCount = [1,2,3,4,5,6,7,8,9,10] call RETURNRANDOM; 
_crowList = [];
_type = ["Kestrel_Random_F","SeaGull","Kestrel_Random_F","SeaGull","Kestrel_Random_F","SeaGull"]call RETURNRANDOM; 
_end = [random SAOKMAPSIZE,random SAOKMAPSIZE,10+random 30];
while {vehicle player distance _end < 2000} do {sleep 0.1;_end = [random SAOKMAPSIZE,random SAOKMAPSIZE,10+random 30];};
//_type = "SeaGull";
for "_i" from 1 to _flockCount do {


	_crow = _type camcreate [
		(_st select 0) - 5 + (random 10),
		(_st select 1) - 5 + (random 10),
		0
	];
	_crow setDir (random 360);
	[_crow,_st, _end] SPAWN SAOKBIRDMSF;
	_crowList pushBack _crow;
};


sleep 60;
{if (!isnull _x) then {_x spawn SAOKDELETE;};} foreach _crowList;