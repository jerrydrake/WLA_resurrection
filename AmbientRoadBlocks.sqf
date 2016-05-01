


private ["_po","_n","_pP","_R"];
TOTALRO = 0;
while {true} do {
if (TOTALRO < 1) then {
_pP = getposATL player;
_po = [(_pP select 0)+1500-(random 3000), (_pP select 1)+1500-(random 3000),0];
_R = _po nearroads 400;
if (count _R > 0) then {_po = getposATL (_R call RETURNRANDOM);
if (([_po] CALL SAOKNEARVILP) distance _po > 400 && {{_po distance _x < 600} count RBLOCATIONS == 0} && {_pP distance _po > 500}) then {
if ((locationposition (["ColorRed",_po] CALL NEARESTCAMP) distance _po) < (locationposition (["ColorBlue",_po] CALL NEARESTCAMP) distance _po)) then {
if (_po distance ([getposATL player,"ColorGreen"] CALL NEARESTGUARDPOST) > 700) then {
TOTALRO = TOTALRO + 1;_n = [_po] SPAWN FCRB2;
};
};
};
};
};
sleep 30;
};
