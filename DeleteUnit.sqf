        private ["_unit"];
		
		_unit = _this select 0;
		if !(group _unit in DONTDELGROUPS) then {
		if (vehicle _unit != _unit) then {_unit action ["Eject", vehicle _unit];unassignvehicle _unit; _unit action ["GetOut",vehicle _unit];};
		waituntil {sleep 3;vehicle _unit == _unit};
        _unit removeAllMPEventHandlers "mpkilled";
        _unit removeAllMPEventHandlers "mphit";
        _unit removeAllMPEventHandlers "mprespawn";
        _unit removeAllEventHandlers "FiredNear";
        _unit removeAllEventHandlers "HandleDamage";
        _unit removeAllEventHandlers "Killed";
        _unit removeAllEventHandlers "FiRed";
        _unit removeAllEventHandlers "Local";
        //clearVehicleInit _unit;
        deleteVehicle _unit;
		};
