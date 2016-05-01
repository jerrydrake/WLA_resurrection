private ["_curV","_t","_s","_varN"];
_curV = _this;
_varN = (_curV+"FF");
_curVP = getmarkerpos _curV;
if (isNil{missionnamespace getvariable _varN}) then {
missionnamespace setvariable [_varN,1];
_t = 0;
while {_t < 6} do {
_t = _t + 1;
_s = [(_curVP select 0)+100-(random 200),(_curVP select 1)+100-(random 200),0];
[_s,900,_varN] SPAWN FireSmoke;
};
};
