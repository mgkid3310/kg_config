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
	private _vehicle = _this select 0;
	private _alertAmmotypes = ["ShellBase", "RocketBase", "MissileBase"];
	while (alive _vehicle) do {
		if (player in _vehicle) then {
			private _nearObjects = nearestObjects [_vehicle, _alertAmmotypes, 100];
			{
				if (((_x distance _vehicle) / (speed _x / 3.6) < 0.2) && (_x getRelDir _vehicle < 45 || _x getRelDir _vehicle < 315)) exitWith {
					["RHSUSF_Error", 1, 2] spawn orbis_tank_fnc_repeatSound;
					sleep 2;
				};
			} forEach _nearObjects;
		};

		private _frameNo = diag_frameNo;
		waitUntil {diag_frameNo > _frameNo};
	};
};
