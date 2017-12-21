private _vehicle = _this select 0 select 0;
private _turretPath = [_vehicle] call ace_common_fnc_getTurretCommander;

private _maxSmoke = _vehicle getVariable ["maxSmoke", 0];
private _smokeReserve = _vehicle getVariable ["smokeReserve", 0];
private _allMagaziens = magazinesAllTurrets _vehicle;
private _smokeCount = {(_x select 0 isEqualTo "SmokeLauncherMag") && (_x select 1 isEqualTo _turretPath) && !(_x select 2 isEqualTo 0)} count _allMagaziens;

private _numberToAdd = (_maxSmoke - _smokeCount) min (_smokeReserve + _smokeCount);
diag_log format ["orbis_tank_config smokeRearmed, _maxSmoke: %1, _smokeReserve: %2, _allMagaziens: %3, _smokeCount: %4, _numberToAdd: %5", _maxSmoke, _smokeReserve, _allMagaziens, _smokeCount, _numberToAdd];

_vehicle removeMagazinesTurret ["SmokeLauncherMag", _turretPath];
_vehicle addMagazineTurret ["SmokeLauncherMag", _turretPath, _numberToAdd];
_smokeReserve = _smokeReserve + _smokeCount - _numberToAdd;
_vehicle setVariable ["smokeReserve", _smokeReserve];

hintSilent format ["%1 reserve smoke left", _smokeReserve];
