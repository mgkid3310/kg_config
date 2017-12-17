params ["_vehicle"];

private ["_eraNumber", "_isGone"];
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

_vehicle setHit ["HitHull", 0.6];
["RHSUSF_Error", 1, 4] spawn orbis_tank_fnc_repeatSound;
