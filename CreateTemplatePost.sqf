//[pos, dir] SPAWN CreateTemplatePost;
_p = _this select 0;
if (surfaceIsWater _p) exitWith {};
_dir = if (count _this > 1) then {_this select 1} else {random 360};
_d = [(["FUR1","CAMP1","CAMP2","CAMP3","CAMP4","POST1","POST2","WALL1"] call RETURNRANDOM),_p,_dir] CALL CreateCusObjT;
_post = _d select 0;
{
if (typeof _x in ["Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","trench_mg1","trench_mg2","trench_tank1","trench_big1","trench_mortar","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_House_V2_F","Land_Cargo_House_V3_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V2_F","Land_BagBunker_Small_F","Land_BagBunker_Large_F","Land_BagBunker_Tower_F","Land_HBarrierTower_F"]) exitWith {
_post = _x;
};
} foreach _d;
_d = _d - [_post];
_gArrR = [_post,""];
if (count _this > 3 && {_this select 3 in ["","NATO","Green"]}) then {_gArrR = [_post];};
_gArrR CALL GUARDPOST;
_post allowdamage false;
_post setvariable ["CC",1];
_post setvariable ["StaticW",[]];
_post setvariable ["StaticO",[]];
_post setvariable ["StaticOS",[]];
_post setvariable ["NotReady",1];
if (count _this > 3 && {_this select 3 in ["NATO","Green"]}) then {
_marT = _post getvariable "Gmark";
_marT setmarkertext ((_this select 3)+ " basecamp");
if (_this select 3 in ["NATO","Green"]) then {
_p = SAOKMAPSIZE * 0.5;
if ({!isNil{_x getvariable (_this select 3)}} count (nearestLocations [[_p,_p,0], ["PostG"], SAOKMAPSIZE*0.7]) == 0) then {_post setvariable [(_this select 3),1];};
};
};
sleep 0.1;
_gunP = [];
{
_class = typeof _x;
//if (_class == "Land_BagBunker_Small_F") then {_gunP pushback _x;};
_earlier = _post getvariable "StaticO";
_id = "N"+(format["%1",count _earlier]);
_p = getPosWorld _x;
_earlier append [[_class,_p, direction _x, (surfaceNormal (getPosWorld _x)),_id]];
_post setvariable ["StaticO",_earlier];
deletevehicle _x;
} foreach _d;
_ran = ["AA-Guard","AT-Guard"] call RETURNRANDOM;
{
_post setvariable [_x,1];
} foreach ["MG-Guard",_ran,"Sniper-Guard","Medic-Guard"];
_pr = 0.5;
//{if (random 1 < _pr) then {[_x select 1, _x select 2] CALL SAOKADDGUNGENERATED;};} foreach _gunP;
_post setvariable ["NotReady",nil];
sleep 10;
if (player distance _post < (["Lb"] CALL DIS)) then {sleep 1;_post CALL SAOKCONSRESETOBJ;};

