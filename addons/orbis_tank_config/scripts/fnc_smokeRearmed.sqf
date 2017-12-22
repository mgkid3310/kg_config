private _vehicle = _this select 0 select 0;
private _turretPath = [_vehicle] call ace_common_fnc_getTurretCommander;

private _maxSmoke = _vehicle getVariable ["maxSmoke", 0];
private _smokeReserve = _vehicle getVariable ["smokeReserve", 0];
private _allMagaziens = magazinesAllTurrets _vehicle;
private _turretMagazines = _allMagaziens select {_x select 1 isEqualTo _turretPath};
private _smokeCount = {(_x select 0 isEqualTo "SmokeLauncherMag") && !(_x select 2 isEqualTo 0)} count _turretMagazines;

private _numberToAdd = (_maxSmoke - _smokeCount) min (_smokeReserve + _smokeCount);
diag_log format ["orbis_debug tank smokeRearmed, _maxSmoke: %1, _smokeReserve: %2, _turretMagazines: %3, _smokeCount: %4, _numberToAdd: %5", _maxSmoke, _smokeReserve, _turretMagazines, _smokeCount, _numberToAdd];

_vehicle removeMagazinesTurret ["SmokeLauncherMag", _turretPath];
_vehicle addMagazineTurret ["SmokeLauncherMag", _turretPath, _numberToAdd];
_smokeReserve = _smokeReserve + _smokeCount - _numberToAdd;
_vehicle setVariable ["smokeReserve", _smokeReserve];

hintSilent format ["%1 reserve smoke left", _smokeReserve];
