private ["_maksaa","_pos","_nul"];
_maksaa = if(count _this > 1) then {_this select 1} else {400};
if (pisteet >= _maksaa) then {
pisteet = pisteet - _maksaa;
"Cash" SPAWN SAOKPLAYSOUND;
_nul = [-_maksaa, "Received Vehicle"] SPAWN PRESTIGECHANGE;
_pos = getposATL vehicle player;
_cP = screenToWorld [0.5,0.5];
if (_cP distance player < 40 && {count (_cP nearObjects ["House",10]) == 0} && {count (_cP nearObjects ["Static",10]) == 0}) then {_pos = + _cP;};
_nul = [_pos,_this select 0] SPAWN FSupportDrop;
} else {
if (pisteet < _maksaa) then {
(format ["%1 more prestige value needed to receive vehicle", _maksaa - pisteet]) SPAWN HINTSAOK;
} else {

};
};

