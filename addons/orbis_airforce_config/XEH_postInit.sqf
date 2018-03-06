["toggleSmoke", {_this spawn orbis_airforce_fnc_toggleSmoke;}] call CBA_fnc_addEventHandler;

[
	"ace_pylons_setPylonLoadOutEvent", 
	{
		_this spawn {
			params ["_aircraft", "_pylonIndex", "_pylon", "_turret"];
			sleep 0.1;
			switch (typeOf _aircraft) do {
				case ("FIR_F15K"): {
					private _isForcedRear = [["FIR_F15E_AGM_HP", "FIR_F15E_SDB_HP", "FIR_F15E_AG_HP", "FIR_F15E_AG2000_HP"], getArray (configFile >> "CfgMagazines" >> _pylon >> "hardpoints")] call orbis_airforce_fnc_hasIntersectionItem;
					_aircraft setPylonLoadOut [_pylonIndex, _pylon, true, [_turret, [0]] select _isForcedRear];
				};
				case ("JS_JC_FA18F"): {
					private _isForcedRear = [["FIR_SH_AG_HP"], getArray (configFile >> "CfgMagazines" >> _pylon >> "hardpoints")] call orbis_airforce_fnc_hasIntersectionItem;
					_aircraft setPylonLoadOut [_pylonIndex, _pylon, true, [_turret, [0]] select _isForcedRear];
				};
			};
		};
	}
] call CBA_fnc_addEventHandler;

[] spawn {
	while {hasInterface} do {
		if ((vehicle player != player) && (isNull (uiNamespace getVariable ["ace_laser_display", displayNull]))) then {
			[player] call ace_laser_fnc_showVehicleHud;
		};
		private _frameNo = diag_frameNo;
		waitUntil {diag_frameNo > _frameNo};
	};
};
