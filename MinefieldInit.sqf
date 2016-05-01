//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////
private ["_array","_pos","_cc","_nul"];
_array = _this;
_pos = screenToWorld [0.5,0.5];
if (MINEC <= 0) exitWith {
"No more mines to use. WIP" SPAWN HINTSAOK;
};
if ({alive _x} count ((getposATL player) nearEntities [CONSVEHCLAS, 250]) == 0) exitWith {
"Operative Construct-vehicle needs to be under 250m away from pointed location." SPAWN HINTSAOK;
};
//_array = groupSelectedUnits player;
if (count _array == 0) then {
	_cc = count units group player;
	if (_cc > 1) then {_array = [(units group player) select (_cc - 1)];};
	};
if (count _array > 0) then { 
_nul = [_array,_pos] execVM "MineDialog.sqf";
} else {
"You need to have at leastone AI group member to create minefields" SPAWN HINTSAOK;
};
