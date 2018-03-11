private _vehicle = _this select 0;
private _weaponOld = _this select 1 select 0;
private _magazinesOld = _this select 1 select 1;
private _weaponNew = _this select 2 select 0;
private _magazinesNew = _this select 2 select 1;
private _turretPath = param [3, 0];

if !(_magazinesOld isEqualType []) then {
	_magazinesOld = [_magazinesOld];
};
if !(_magazinesNew isEqualType []) then {
	_magazinesNew = [_magazinesNew];
};

if (_turretPath isEqualType []) then {
	while {alive _vehicle} do {
		if (_weaponOld in (_vehicle weaponsTurret _turretPath)) then {
			{
				_vehicle removeMagazinesTurret [_x, _turretPath];
			} forEach _magazinesOld;
			_vehicle removeWeaponTurret [_weaponOld, _turretPath];
			_vehicle addWeaponTurret [_weaponNew, _turretPath];
			{
				_vehicle addMagazineTurret [_x, _turretPath];
			} forEach _magazinesNew;
		};

		private _frameNo = diag_frameNo;
		waitUntil {diag_frameNo > _frameNo};
	};
} else {
	while {alive _vehicle} do {
		if (_vehicle hasWeapon _weaponOld) then {
			{
				_vehicle removeMagazines _x;
			} forEach _magazinesOld;
			_vehicle removeWeapon _weaponOld;
			_vehicle addWeapon _weaponNew;
			{
				_vehicle addMagazine _x;
			} forEach _magazinesNew;
		};

		private _frameNo = diag_frameNo;
		waitUntil {diag_frameNo > _frameNo};
	};
};
