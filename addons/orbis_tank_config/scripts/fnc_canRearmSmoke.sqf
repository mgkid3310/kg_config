private _vehicle = _this select 0;
private _turretPath = [_vehicle] call ace_common_fnc_getTurretCommander;

if !(player isEqualTo vehicle player) exitwith {false};

private _maxSmoke = _vehicle getVariable ["maxSmoke", 0];
private _smokeReserve = _vehicle getVariable ["smokeReserve", 0];
private _currentMagaziens = _vehicle magazinesTurret _turretPath;
private _smokeCount = {_x isEqualTo "SmokeLauncherMag"} count _currentMagaziens;

diag_log format ["orbis_tank_config canRearmSmoke, _maxSmoke: %1, _smokeReserve: %2, _currentMagaziens: %3, _smokeCount: %4", _maxSmoke, _smokeReserve, _currentMagaziens, _smokeCount];

if ((_maxSmoke isEqualTo 0) || (_smokeReserve isEqualTo 0)) exitwith {false};
if (_smokeCount < _maxSmoke) exitWith {true};

false
