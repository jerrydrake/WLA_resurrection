/*
		0: DISPLAY - parent display. When empty, mission display is used.
		1: ARRAY - default view position in format [x,y,y] or [x,y]
		2: ARRAY - list of missions in format:
			0: ARRAY - mission position in format [x,y,y] or [x,y]
			1: CODE - expression executed when user clicks on mission icon
			2: STRING - mission name
			3: STRING - short description
			4: STRING - name of mission's player
			5: STRING - path to overview image
			6: NUMBER - size multiplier, 1 means default size
			7: ARRAY - parameters for the -on click- code; referenced from the script as (_this select 9)
		3: ARRAY - list of ORBAT groups in format:
			0: ARRAY - group position in format [x,y,y] or [x,y]
			1: CONFIG - preview CfgORBAT group
			2: CONFIG - topmost displayed CfgORBAT group
			3: ARRAY - list of allowed tags
			4: NUMBER - maximum number of displayed tiers
		4: ARRAY - list of markers revealed in strategic map (will be hidden when map is closed)
		5: ARRAY - list of custom images in format:
			0: STRING - texture path
			1: ARRAY - color in format [R,G,B,A]
			2: ARRAY - image position
			3: NUMBER - image width (in metres)
			4: NUMBER - image height (in metres)
			5: NUMBER - image angle (in degrees)
			6: STRING - text displayed next to the image
			7: BOOL - true to display shadow
		6: NUMBER - value in range <0-1> defining weather on strategic map (i.e. density of clouds)
		7: BOOL - true for night version of strategic map (darker with blue tone)
		8: NUMBER - default map scale coeficient (1 is automatic scale)
		9: BOOL - true to enable simulation while the map is opened (default: false)
*/

_art = [];
{
_art = _art + [[getposATL _x,{
if (!isNil{missionnamespace getvariable "LastVeh"}) then {
_car = (missionnamespace getvariable "LastVeh");
if (alive _car) then {
_st = [(_this select 0), 40,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_p1 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 0.3];
_p2 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 6];
_p3 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 0.3];
_p4 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 6];
_p5 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 0.3];
_p6 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 6];
_p7 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 0.3];
_p8 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 6];
while {lineIntersects [_p3, _p5] || lineIntersects [_p3, _p7] ||  lineIntersects [_p5, _p7] || lineIntersects [_p1, _p7] || lineIntersects [_p1, _p5] || lineIntersects [_p1, _p3] || lineIntersects [_p1, _p2] || lineIntersects [_p3, _p4] || lineIntersects [_p5, _p6] || lineIntersects [_p7, _p8]} do {
sleep 1;
_st = [(_this select 0), 50,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_p1 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 0.3];
_p2 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 6];
_p3 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 0.3];
_p4 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 6];
_p5 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 0.3];
_p6 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 6];
_p7 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 0.3];
_p8 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 6];
};
_car setpos _start;
};
};
_matka = (player distance (_this select 0))*0.001;
_Sti = _matka / (3 + random 3);
if (!isNil{missionnamespace getvariable "LastVeh"}) then {
_car = (missionnamespace getvariable "LastVeh");
if (alive _car) then {
_Sti = _matka / (30 + random 30);
};
};
skiptime _Sti;
_hcGroups = [];
{
if ({!isNil{_x getvariable "FromP"}}count units _x > 0) then {
_hcGroups = _hcGroups + [_x];
};
} foreach hcAllGroups player;
{
_pos = (_this select 0);
_pos = [(_pos select 0)+100-(random 200),(_pos select 1)+100-(random 200),0];
while {surfaceIsWater _pos} do {sleep 0.01;_pos = [(_pos select 0)+300-(random 600),(_pos select 1)+300-(random 600),0];};
{_x setpos [(_pos select 0)+10-(random 20),(_pos select 1)+10-(random 20),0];} foreach units _x;
} foreach _hcGroups;
{
_pos = (_this select 0);
_x setpos [(_pos select 0)+10-(random 20),(_pos select 1)+10-(random 20),0];
} foreach units group player;},"Move to Guardpost","Fast travel to this guardpost with team and the last used vehicle","","pic2.paa",1,[getposATL _x,(getposATL player)]]];
} foreach GuardPosts;

{
if (getmarkercolor _x == "ColorBlue") then {
_art = _art + [[getmarkerpos _x,{
if (!isNil{missionnamespace getvariable "LastVeh"}) then {
_car = (missionnamespace getvariable "LastVeh");
if (alive _car) then {
_st = [(_this select 0), 40,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_p1 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 0.3];
_p2 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 6];
_p3 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 0.3];
_p4 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 6];
_p5 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 0.3];
_p6 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 6];
_p7 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 0.3];
_p8 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 6];
while {lineIntersects [_p3, _p5] || lineIntersects [_p3, _p7] ||  lineIntersects [_p5, _p7] || lineIntersects [_p1, _p7] || lineIntersects [_p1, _p5] || lineIntersects [_p1, _p3] || lineIntersects [_p1, _p2] || lineIntersects [_p3, _p4] || lineIntersects [_p5, _p6] || lineIntersects [_p7, _p8]} do {
sleep 1;
_st = [(_this select 0), 50,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_p1 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 0.3];
_p2 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 6];
_p3 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 0.3];
_p4 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 6];
_p5 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 0.3];
_p6 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 6];
_p7 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 0.3];
_p8 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 6];
};
_car setpos _start;
};
};
_matka = (player distance (_this select 0))*0.001;
_Sti = _matka / (3 + random 3);
if (!isNil{missionnamespace getvariable "LastVeh"}) then {
_car = (missionnamespace getvariable "LastVeh");
if (alive _car) then {
_Sti = _matka / (30 + random 30);
};
};
skiptime _Sti;
_hcGroups = [];
{
if ({!isNil{_x getvariable "FromP"}}count units _x > 0) then {
_hcGroups = _hcGroups + [_x];
};
} foreach hcAllGroups player;
{
_pos = (_this select 0);
_pos = [(_pos select 0)+100-(random 200),(_pos select 1)+100-(random 200),0];
while {surfaceIsWater _pos} do {sleep 0.01;_pos = [(_pos select 0)+300-(random 600),(_pos select 1)+300-(random 600),0];};
{_x setpos [(_pos select 0)+10-(random 20),(_pos select 1)+10-(random 20),0];} foreach units _x;
} foreach _hcGroups;
{
_pos = (_this select 0);
_x setpos [(_pos select 0)+10-(random 20),(_pos select 1)+10-(random 20),0];
} foreach units group player;},"Move to Camp","Fast travel to this friendly camp with your team and last used vehicle","","pic2.paa",1,[getmarkerpos _x,(getposATL player)]]];
};
} foreach AmbientZonesN;

{
if ((getposATL ([getmarkerpos _x] CALL RETURNGUARDPOST)) distance (getmarkerpos _x) < 450) then {
_art = _art + [[getmarkerpos _x,{
if (!isNil{missionnamespace getvariable "LastVeh"}) then {
_car = (missionnamespace getvariable "LastVeh");
if (alive _car) then {
_st = [(_this select 0), 40,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_p1 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 0.3];
_p2 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 6];
_p3 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 0.3];
_p4 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 6];
_p5 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 0.3];
_p6 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 6];
_p7 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 0.3];
_p8 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 6];
while {lineIntersects [_p3, _p5] || lineIntersects [_p3, _p7] ||  lineIntersects [_p5, _p7] || lineIntersects [_p1, _p7] || lineIntersects [_p1, _p5] || lineIntersects [_p1, _p3] || lineIntersects [_p1, _p2] || lineIntersects [_p3, _p4] || lineIntersects [_p5, _p6] || lineIntersects [_p7, _p8]} do {
sleep 1;
_st = [(_this select 0), 50,"(1 - trees) * (1 - houses) * (1 - sea)"] CALL FUNKTIO_POS;
_start = (_st select 0) select 0;
_p1 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 0.3];
_p2 = [(_start select 0) - 5,(_start select 1)+5,(_start select 2) + 6];
_p3 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 0.3];
_p4 = [(_start select 0) + 5,(_start select 1)+5,(_start select 2) + 6];
_p5 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 0.3];
_p6 = [(_start select 0) - 5,(_start select 1)-5,(_start select 2) + 6];
_p7 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 0.3];
_p8 = [(_start select 0) + 5,(_start select 1)-5,(_start select 2) + 6];
};
_car setpos _start;
};
};
_matka = (player distance (_this select 0))*0.001;
_Sti = _matka / (3 + random 3);
if (!isNil{missionnamespace getvariable "LastVeh"}) then {
_car = (missionnamespace getvariable "LastVeh");
if (alive _car) then {
_Sti = _matka / (30 + random 30);
};
};
skiptime _Sti;
_hcGroups = [];
{
if ({!isNil{_x getvariable "FromP"}}count units _x > 0) then {
_hcGroups = _hcGroups + [_x];
};
} foreach hcAllGroups player;
{
_pos = (_this select 0);
_pos = [(_pos select 0)+100-(random 200),(_pos select 1)+100-(random 200),0];
while {surfaceIsWater _pos} do {sleep 0.01;_pos = [(_pos select 0)+300-(random 600),(_pos select 1)+300-(random 600),0];};
{_x setpos [(_pos select 0)+10-(random 20),(_pos select 1)+10-(random 20),0];} foreach units _x;
} foreach _hcGroups;
{
_pos = (_this select 0);
_x setpos [(_pos select 0)+10-(random 20),(_pos select 1)+10-(random 20),0];
} foreach units group player;},"Move to Airfield","Fast travel to this airfield with your team and last used vehicle","","pic2.paa",1,[getmarkerpos _x,(getposATL player)]]];
};
} foreach AIRFIELDLOCATIONS;


waitUntil {!isNull (findDisplay 46)};
_nul = [
findDisplay 46,
getposATL player,
_arT
] call BIS_fnc_strategicMapOpen; 