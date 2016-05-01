
private ["_li","_r","_id","_l","_post","_earlier","_p","_data","_c","_ob","_nul"];
if (isNil{missionnamespace getvariable "DrawFF"}) exitWith {};
_p = missionnamespace getvariable "DrawFF";
_data = [_p select 1,_p select 2,_p select 0,0] CALL FUNKTIO_DrawFenceV;
if (count (_data select 0) == 0) exitWith {};
_c = (_p select 0) CALL CONSCOST;
_c = _c*(count (_data select 0))+_c*(count (_data select 2));
if (pisteet >= _c) then {
pisteet = pisteet - _c; 
_post = [_p select 1] CALL RETURNGUARDPOST;
_earlier = +(_post getvariable "StaticO");
_l = [];
_r = count _earlier;
{
_ob = _x;
_id = "N"+(format["%1",_r]);
_l set [count _l, [_p select 0,getposATL _ob, direction _ob, (surfaceNormal (getposATL _ob)),_id]];
[_post, [_ob,_id]] CALL SAOKCONSADDO;
_r = _r + 1;
} foreach (_data select 0);
_post setvariable ["StaticO",(_earlier + _l)];
_earlier = +(_post getvariable "StaticO");
_r = count _earlier;
_li = [];
{
_id = (format ["N%1",(count _li + _r)]);
_li set [count _li, [_x select 0,_x select 1,_x select 2,_x select 3,_id]];
_pos = _x select 1;
_obj = createVehicle [_x select 0, _pos, [], 0, "CAN_COLLIDE"]; 
_wTm = _obj worldToModel _pos;
_obj setpos [(_pos select 0)+(_wTm select 0),(_pos select 1)+(_wTm select 1),0];
_obj setdir (_x select 2);
_obj setvectorup (_x select 3);
if ((_x select 0) in ["Box_IND_Wps_F"]) then {
_nul = [_obj,_post getvariable "CrateC"] SPAWN FLoadCrate;
_obj setvariable ["AmCrate",1];
_obj setvariable ["CCCrate",1];
};
if ((_x select 0) in ["Land_BarGate_F"]) then {
	_obj allowdamage false;
	//ANIMATED BAR GATE
	_nul = _obj SPAWN {
	while {!isNull _this} do {  
	waitUntil {sleep 1; {player in crew _x} count (_this nearEntities [["Car"],30]) > 0};  
	_this animate ["Door_1_rot", 1];  
	waitUntil {sleep 1; {player in crew _x} count (_this nearEntities [["Car"],30]) == 0}; 
	_this animate ["Door_1_rot", 0];  
	};  
	};
	///////////////////
};
if (isNil{_post getvariable "ObjectsNow"}) then {_post setvariable ["ObjectsNow",[[_obj,_id]]];} else {_oldD = _post getvariable "ObjectsNow";_post setvariable ["ObjectsNow",(_oldD+[[_obj,_id]])];};

} foreach (_data select 2);
_post setvariable ["StaticO",(_earlier + _li)];
missionnamespace setvariable ["DrawFF",nil];
_nul = [-_c, "Construction"] SPAWN PRESTIGECHANGE;
} else {
{deletevehicle _x} foreach (_data select 0);
"Not enough prestige" SPAWN HINTSAOK;
};