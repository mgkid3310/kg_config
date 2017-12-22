private _vehicle = _this select 0;
private _turretPath = [_vehicle] call ace_common_fnc_getTurretCommander;

if !((alive _vehicle) && (player isEqualTo vehicle player)) exitwith {false};

private _maxSmoke = _vehicle getVariable ["maxSmoke", 0];
private _smokeReserve = _vehicle getVariable ["smokeReserve", 0];
private _allMagaziens = magazinesAllTurrets _vehicle;
private _turretMagazines = _allMagaziens select {_x select 1 isEqualTo _turretPath};
private _smokeCount = {(_x select 0 isEqualTo "SmokeLauncherMag") && !(_x select 2 isEqualTo 0)} count _turretMagazines;

diag_log format ["orbis_debug tank canRearmSmoke, _maxSmoke: %1, _smokeReserve: %2, _turretMagazines: %3, _smokeCount: %4", _maxSmoke, _smokeReserve, _turretMagazines, _smokeCount];

if ((_maxSmoke isEqualTo 0) || (_smokeReserve isEqualTo 0)) exitwith {false};
if (_smokeCount < _maxSmoke) exitWith {true};

false
