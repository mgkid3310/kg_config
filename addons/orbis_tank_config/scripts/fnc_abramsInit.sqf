params ["_vehicle"];

private ["_eraNumber", "_isGone"];
waitUntil {
	_eraNumber = 1;
	_isGone = false;
	while {format ["era_%1_hitpoint", _eraNumber]} do {
		_isGone = _isGone || (_vehicle getHitPointDamage format ["era_%1_hitpoint", _eraNumber] isEqualTo 1);
	};
	_isGone
};

_vehicle setHit ["HitHull", 0.6];
["RHSUSF_Error", 1, 4] spawn orbis_tank_fnc_repeatSound;
