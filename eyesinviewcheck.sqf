//head off
_f3 = {
private ["_bol","_eP","wPos"];
_bol = true;
_eP = ASLToATL (eyePos _this);  
_wPos = worldToscreen _eP;  
_wPos = _wPos select 1;
if (_wPos > 0 && {_wPos < 1}) then {_bol = false;};
_bol 
};