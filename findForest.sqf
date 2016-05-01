

private ["_position","_radius","_expression","_precision","_sourcesCount","_bestplace"];

_position = _this select 0;
_radius = _this select 1;
_expression = "(1 + forest + trees) * (1 - sea) * (1 - houses)";
_precision = 7;
_sourcesCount = 1;
_bestplace = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];

_bestplace