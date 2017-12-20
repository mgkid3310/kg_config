private _vehicle = _this select 0;
private _avail = false;

if !(player isEqualTo vehicle player) exitwith {false};

private _maxSmoke = _vehicle getVariable ["maxSmoke", 0];
private _smokeReserve = _vehicle getVariable ["smokeReserve", 0];

if (_maxSmoke != 0 && _smokeReserve != 0) then {
	_avail = true;
} else {
	_avail = false;
};

_avail
