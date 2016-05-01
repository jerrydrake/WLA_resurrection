private ["_civ"];
_civ = _this select 0;
CIVIGNORE pushback _civ;
sleep 120;
CIVIGNORE = CIVIGNORE - [_civ];

