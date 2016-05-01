private ["_h","_c","_r","_ra","_BOM"];
_h = _this select 0;
_c = _this select 1;
_ra = _this select 2;
while {_h > 0} do {
_r = 0.5 + random 1;
_BOM = createVehicle ["R_230mm_HE",[(_c select 0) - _ra + (random _ra)*2,(_c select 1) - _ra + (random _ra)*2, 90], [], 0, "NONE"];
_BOM setVelocity [0, 0, -30];  
sleep _r;
_h = _h - _r;
};
