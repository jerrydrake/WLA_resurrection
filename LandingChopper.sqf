




private ["_ct","_chop1","_g1","_tt"];
_chop1 = [[getposATL helistart select 0,getposATL helistart select 1,50],1,"AW159_Lynx_BAF",WEST] call SPAWNVEHICLE;
{_x setcaptive true; _x allowdamage false;} foreach ([(_chop1 select 0)] + (units (_chop1 select 2)));
(_chop1 select 2) move (position helipad1);
(_chop1 select 2)setBehaviour "Careless";
_g1 = [getposATL helistart, west,["BAF_Soldier_TL_MTP","BAF_Soldier_AR_MTP","BAF_Soldier_Medic_MTP","BAF_Soldier_Marksman_MTP","BAF_Soldier_AT_MTP"],[],[],[0.8,1.0]] call SpawnGroupCustom;

{_x moveincargo (_chop1 select 0);} foreach units _g1; 

while {!unitready leader (_chop1 select 2)} do {sleep 3;};
(_chop1 select 0) land "land";
while {(getposATL (_chop1 select 0) select 2) > 0.5} do {sleep 3;};
_tt = units _g1;
_ct = count _tt - 1;
while {_ct > -1} do {
	sleep 1;
	unassignvehicle (_tt select _ct);
	[(_tt select _ct)] ordergetin false;
	
	_ct = _ct - 1;
};	
while {({(alive _x) && (_x in (_chop1 select 0))} count units _g1) > 0} do {sleep 3;};

(_chop1 select 2) move (position helistart);
while {(_chop1 select 0) distance position helistart > 400} do {sleep 5;};
{_x spawn SAOKDELETE;} foreach ([(_chop1 select 0)] + (units (_chop1 select 2)));