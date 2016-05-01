if (vehicle player != player || {currentWeapon player != ""} || {!isNil{missionnamespace getvariable "Striking"}}) exitWith {};
missionnamespace setvariable ["Striking",1];
_ani = "AwopPercMstpSgthWnonDnon_end";
_h = ((eyepos player) select 2)-((getposASL player) select 2);
_bol = false;
if (_h >= 1.4) then {
player playmovenow _ani;
_dir = direction player;
_pp = getposATL player;
_p = [(_pp select 0)+((sin _dir)*1),(_pp select 1)+((cos _dir)*1),0];
_u = (_p nearEntities [["Man"],1]);
sleep 0.1;
_rs = ["hit1","hit2","hit3","hit4","hit5","hit6","hit7","hit8","hit9","hit10","hit12","hit13","hit14","hit15","hit16"];
sleep 1.2;

if (isNil{missionnamespace getvariable "SaOkHealed"}) then {
{if (!isPlayer _x && {alive player} && {!([player, _x] CALL FUNKTIO_LOS)} && {([_x, player] CALL FUNKTIO_LOS)}) exitWith {_x setdamage 1;[player,(_rs call RETURNRANDOM)] SPAWN SAOKSAY3D;_bol = true;};} foreach _u;
};
};
missionnamespace setvariable ["Striking",nil];
sleep 0.5;
//PLAYER SEEN PUNCHING SOMEONE
if (_bol && {captive player}) then {
_hostiles = (getposATL player) nearEntities [["Man"],50];
_c = count _hostiles - 1;
for "_i" from 0 to _c do {
private ["_xx"];
_xx = _hostiles select _i;
if (alive _xx && {side _xx == EAST} && {!(_xx in SPWITHW)} && {[player, _xx] CALL FUNKTIO_LOS}) then {SPWITHW pushBack _xx;};
sleep 0.05;
};
};
