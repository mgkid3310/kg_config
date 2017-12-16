params ["_vehicle"];

private _eraNumber = 0;
private _isGone = 0;
waitUntil {
	_eraNumber = 1;
	_isGone = 0;
	while {format ["era_%1_hitpoint", _eraNumber]} do {
		_isGone = _isGone || (_vehicle getHitPointDamage format ["era_%1_hitpoint", _eraNumber] isEqualTo 1);
	};
	_isGone
};

_vehicle setHit ["HitHull", 0.6];
private _repeat = 0;
while {_repeat < 4} do {
	playSound "RHSUSF_Error";
	_repeat = _repeat + 1;
	sleep 1;
};


