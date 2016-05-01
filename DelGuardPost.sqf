private ["_post","_player","_costT","_nul"];
_post = _this select 0;
_player = _this select 1;
if ((!isNil{_post getvariable "GCreator"} && {(_post getvariable "GCreator") == name _player}) || {true}) then {
_costT = 0;
{
_costT = _costT + ((_x select 0) CALL CONSCOST);
} foreach (_post getvariable "StaticO");
{
_costT = _costT + ((_x select 0) CALL CONSCOST);
} foreach (_post getvariable "StaticOS");
{
_costT = _costT + ((_x select 0) CALL CONSCOST);
} foreach (_post getvariable "StaticW");
pisteet = pisteet + _costT;
_nul = [_costT, "Returns"] SPAWN PRESTIGECHANGE;
_p = SAOKMAPSIZE * 0.5;
{
if (_post == _x getvariable "Post") exitWith {deletelocation _x;};
} foreach (nearestLocations [[_p,_p,0], ["PostG","PostR"], SAOKMAPSIZE*0.7]);
deletemarker (_post getvariable "Gmark");
_post CALL SAOKCONSONDELPOST;
};
 