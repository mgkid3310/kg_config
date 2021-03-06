private _vehicle = _this select 0;
private _turretPath = [_vehicle] call ace_common_fnc_getTurretCommander;

if !((alive _vehicle) && (player isEqualTo vehicle player)) exitwith {false};

private _maxSmokeMags = _vehicle getVariable ["maxSmokeMags", 0];
private _smokeReserve = _vehicle getVariable ["smokeReserve", 0];
private _allMagaziens = magazinesAllTurrets _vehicle;
private _turretMagazines = _allMagaziens select {_x select 1 isEqualTo _turretPath};
private _fullMagNumber = {(_x select 0 isEqualTo "SmokeLauncherMag") && (_x select 2 isEqualTo 2)} count _turretMagazines;

if ((_maxSmokeMags isEqualTo 0) || (_smokeReserve isEqualTo 0)) exitwith {false};
if (_fullMagNumber < _maxSmokeMags) exitWith {true};

false
