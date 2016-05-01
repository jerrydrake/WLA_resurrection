private ["_gP","_mode","_ar","_pB","_cost","_nul"];
_gP = _this select 0;
_mode = _this select 1;
if (_mode == 0) then {
if (!isNil{_gP getvariable "ObjectsNow"} && {count (_gP getvariable "ObjectsNow") > 0}) then {
_gp CALL SAOKCONSREMO;
} else {missionnamespace setvariable ["Arrow",nil];ctrlEnable [1606, false];ctrlEnable [1605, false];};
_post = [(getposATL player)] CALL RETURNGUARDPOST;
_preVO = "";
_ar = (_post getvariable "StaticO");
if (!isNil"_ar") then {
_c = count _ar;
_preVO = "";
if (_c > 0 && {_post distance player < 300}) then {
_c = _c - 1;
_preVO = (_ar select _c) select 0;
};
};
if !(_preVO in ["Land_HBarrierWall4_F","Field Toilet","Chair Plastic","Land_CampingChair_V1_F","Land_Mil_WiredFence_F","Land_Mil_WallBig_4m_F","Land_Shoot_House_Wall_Long_F","Land_CncWall4_F","Land_HBarrierBig_F","Land_HBarrier_5_F","Land_HBarrier_3_F","Land_BagFence_Round_F","Land_BagFence_Long_F"]) then {ctrlEnable [1606, false];ctrlEnable [1605, false];};


} else {
if (!isNil{_gP getvariable "WeaponsNow"} && {count (_gP getvariable "WeaponsNow") > 0}) then {
_gp CALL SAOKCONSREMW;
};
};

