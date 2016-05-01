private ["_gP","_mode","_ar","_pB","_cost","_nul"];
_gP = _this select 0;
_mode = _this select 1;
if (_mode == 0) then {
_ar = + (_gP getvariable "StaticO");
if (count _ar > 0) then {
_pB = (_ar select ((count _ar) - 1)) select 0;
_cost = _pB CALL CONSCOST;
pisteet = pisteet + _cost;
_nul = [_cost, "Returns"] SPAWN PRESTIGECHANGE;
_ar = [_ar,((count _ar) - 1)] call SAOKREMINDEX;
_gP setvariable ["StaticO",_ar];	
if (isNil{_gP getvariable "DelO"}) then {_gP setvariable ["DelO",1];} else {_gP setvariable ["DelO",1+(_gP getvariable "DelO")];};
};
} else {
_ar = + (_gP getvariable "StaticW");
if (count _ar > 0) then {
_pB = (_ar select ((count _ar) - 1)) select 0;
_cost = _pB CALL CONSCOST;
pisteet = pisteet + _cost;
_nul = [_cost, "Returns"] SPAWN PRESTIGECHANGE;
_ar = [_ar,((count _ar) - 1)] call SAOKREMINDEX;
_gP setvariable ["StaticW",_ar];	
if (isNil{_gP getvariable "DelW"}) then {_gP setvariable ["DelW",1];} else {_gP setvariable ["DelW",1+(_gP getvariable "DelW")];};
};
};

//(([getposATL player] CALL RETURNGUARDPOST) getvariable "StaticO")