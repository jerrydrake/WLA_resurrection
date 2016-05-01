[] spawn {
_n = [];
{
_y = _x;
if (getmarkercolor _x == "ColorGreen") then {
{if (_y == _x select 0) then {_n pushback _x;};} foreach ZONEDATA;
};
} foreach VEHZONES;
copyToClipboard str _n;
};
configfile >> "CfgRadio" >> "mp_groundsupport_01_casrequested_BHQ_0"
[] spawn {
_v = [];
_count = (count (configFile / "CfgRadio")) - 1; 
while {_count > 0} do {
_v pushback (configName ((configFile / "CfgRadio") select _count));
_count = _count - 1;
};
copyToClipboard str _v;
};

[] spawn {
_nG = [getposATL player] CALL RETURNGUARDPOST;
_t = str (_nG getvariable "StaticO");
_t = _t + str (_nG getvariable "StaticW");
_t = _t + str (_nG getvariable "StaticOS");
copyToClipboard _t;
};

[] spawn {
_nCity = nearestLocation [getposATL player, "name"];
_s = str _nCity + "    ";
_nCity setposition getposATL player;
_s = _s + str _nCity;
hint _s;
};