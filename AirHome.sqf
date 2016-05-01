_n = 0;
{
if (!isNil{_x getvariable "AirS"} && {{alive _x} count units _x > 0}) then {
_nul = [_x, (getmarkerpos "WestChopStart"),5] SPAWN FUNKTIO_MAD;
if (!isNull _x) then {_x setvariable ["AirS",nil];};
_n = 1;
};
sleep 0.1;
} foreach allgroups;

if (_n == 1) then {"Air support called to pull away" SPAWN HINTSAOK;} else {"You have no called air support operating currently" SPAWN HINTSAOK;};