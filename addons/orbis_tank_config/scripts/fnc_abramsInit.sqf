params ["_vehicle"];

/* private ["_eraNumber", "_isGone"];
waitUntil {
	_eraNumber = 1;
	_isGone = false;
	while {isClass (configfile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> format ["era_%1_hitpoint", _eraNumber])} do {
		if (_vehicle getHitPointDamage format ["era_%1_hitpoint", _eraNumber] isEqualTo 1) exitWith {
			_isGone = true;
		};
	};
	_isGone
};

_vehicle setHit ["HitHull", 0.6]; */

[_vehicle] spawn {
	// diag_log "orbis tank loop init";
	private _vehicle = _this select 0;
	private _alertAmmotypes = ["ShellBase", "RocketBase", "MissileBase"];
	while {alive _vehicle} do {
		// diag_log format ["orbis tank loop %1", time];
		if (player in _vehicle) then {
			private _nearObjects = _vehicle nearObjects 100;
			// diag_log format ["orbis tank near %1", _nearObjects];
			_nearAmmos = _nearObjects select {
				private _ammo = _x;
				{
					if (typeOf _ammo isKindOf [_x, configFile >> "CfgAmmo"]) exitWith {
						true
					};
					false
				} forEach _alertAmmotypes;
			};
			// diag_log format ["orbis tank ammo %1", _nearAmmos];
			{
				if (((_x distance _vehicle) / (speed _x / 3.6) < 0.2) && (_x getRelDir _vehicle < 45 || _x getRelDir _vehicle < 315)) exitWith {
					// hint "incoming";
					["RHSUSF_Error_High", 1, 2] spawn orbis_tank_fnc_repeatSound;
					sleep 2;
				};
			} forEach _nearAmmos;
		};

		private _frameNo = diag_frameNo;
		waitUntil {diag_frameNo > _frameNo};
	};
};
