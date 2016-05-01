
private ["_list"];
_list = (getposATL player) nearEntities [["Air", "Car", "Tank"], 15];
{if (count crew _x == 0) then {
_x setpos [getposATL _x select 0,getposATL _x select 1,0.3];
_x setvectorUp [0,0,1];
};} foreach _list;

_list = (getposATL player) nearEntities [["Ship"], 15];
{
if (count crew _x == 0) then {
_dir = ([player, _x] call SAOKDIRT);
_x setpos [(getposATL _x select 0)+((sin _dir)*3),(getposATL _x select 1)+((cos _dir)*3),0.3];
_x setvectorUp [0,0,1];
};
} foreach _list;
