private ["_change","_cause","_disp","_msg"];
_change = _this select 0;
_cause = _this select 1;
if (isNil"StartMission") exitWith {};
20 cutRsc ["MyRscTitle5","PLAIN"];
disableSerialization;
_disp = uiNamespace getVariable "d5_MyRscTitle";
_msg = if (_change > 0) then {"<t color='#33FF33'>"+"+"} else {"<t color='#FF0033'>"+"-"};
_msg = _msg + (format ["%1",_change]);
_msg = _msg + " ["+ _cause + "]</t>";
(_disp displayCtrl 305) ctrlSetStructuredText parseText _msg;
		