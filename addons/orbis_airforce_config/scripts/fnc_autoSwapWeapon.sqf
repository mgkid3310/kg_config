private _vehicle = _this select 0;
private _weaponOld = _this select 1 select 0;
private _magazineOld = _this select 1 select 1;
private _weaponNew = _this select 2 select 0;
private _magazineNew = _this select 2 select 1;
while {alive _vehicle} do {
	waitUntil {_weaponOld in weapons _vehicle};
	_vehicle removeWeapon _weaponOld;
	_vehicle removeMagazines _magazineOld;
	_vehicle addWeapon _weaponNew;
	_vehicle addMagazine _magazineNew;
};
