private _vehicle = _this select 0 select 0;
private _turretPath = _vehicle call ace_common_fnc_getTurretCommander;

private _maxSmoke = _vehicle getVariable ["maxSmoke", 0];
private _smokeReserve = _vehicle getVariable ["smokeReserve", 0];
private _currentMagaziens = _vehicle magazinesTurret _turretPath;
private _smokeCount = {_x isEqualTo "SmokeLauncherMag"} count _currentMagaziens;
private _numberToAdd = 0;

if (_smokeReserve + _smokeCount < _maxSmoke) then {
	_numberToAdd = (_smokeReserve + _smokeCount) max 0;
} else {
	_numberToAdd = _maxSmoke;
};

_vehicle removeMagazinesTurret ["SmokeLauncherMag", _turretPath];
_vehicle addMagazineTurret ["SmokeLauncherMag", _turretPath, _numberToAdd];
_smokeReserve = _smokeReserve + _smokeCount - _numberToAdd;
_vehicle setVariable ["smokeReserve", _smokeReserve];

hintSilent format ["%1 reserve smoke left", _smokeReserve];
