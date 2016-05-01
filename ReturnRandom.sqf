private ["_ret","_i","_t"];

if(typeName _this == "ARRAY" && {count _this > 0}) then
{
	_i = floor random (count _this);           //random index
	//get the element, return it
	_t = 0;
	while {isNil{_this select _i} && {_t < 10}} do {_i = floor random (count _this); _t = _t + 1;};
	_ret = _this select _i;  
	_ret
} else {
	_this
};
