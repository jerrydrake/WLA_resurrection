//HOLSTER WEAPON
if (handgunWeapon player != "") then {
missionnamespace setvariable ["hclass",[handgunWeapon player,handgunItems player]];
if (count handgunMagazine player > 0) then {player addmagazine ((handgunMagazine player) select 0)};
player removeweapon (handgunWeapon player);
} else {
//UNHOLSER WEAPON IF HAVING IT
if (!isNil{missionnamespace getvariable "hclass"}) then {
player addweapon ((missionnamespace getvariable "hclass") select 0);
removeAllHandgunItems player; 
{if (_x != "") then {player addHandgunItem _x;};} foreach ((missionnamespace getvariable "hclass") select 1);
missionnamespace setvariable ["hclass",nil];
};
};
