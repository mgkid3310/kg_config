private _vehicle = _this select 0;
private _useCannon = param [1, true];
private _flare = param [2, 0];
private _turretPath = param [3, 0];

while {alive _vehicle} do {
	if (_vehicle hasWeapon "FIR_M61A2") then {
		if !(_useCannon) then {
			_vehicle removeMagazines "FIR_M61A2_511rnd_M";
			_vehicle removeMagazines "FIR_M61A2_TWAS_511rnd_M";
			_vehicle removeMagazines "FIR_M61A2_TWAS_Red_511rnd_M";

			_vehicle removeweapon "FIR_M61A2";
		};
	};

	if ((_flare isEqualType "") && ("FIR_240rnd_CMFlare_Chaff_Magazine" in (magazinesAllTurrets _vehicle apply {_x select 0}))) then {
		if (_turret isEqualType []) then {
			_vehicle removeMagazinesTurret ["FIR_240rnd_CMFlare_Chaff_Magazine", _turretPath];
			if (_flare isEqualTo "") then {
				_vehicle removeWeaponTurret ["FIR_CMLauncher", _turretPath];
			} else {
				_vehicle addMagazineTurret [_flare, _turretPath];
			};
		} else {
			_vehicle removeMagazines "FIR_240rnd_CMFlare_Chaff_Magazine";
			if (_flare isEqualTo "") then {
				_vehicle removeWeapon "FIR_CMLauncher";
			} else {
				_vehicle addMagazine _flare;
			};
		};
	};

	private _pylons = getPylonMagazines _vehicle;
	private _fuelcount = {_x == "FIR_F16C_Fueltank_P_1rnd_M"} count _pylons;
	private _fuelcount2 = {_x == "FIR_F16C_center_Fueltank_P_1rnd_M"} count _pylons;
	private _fuelLevel = 1;
	switch (_fuelcount) do {
		case 2: {
			if (_fuelcount2 == 1) then {
				_fuelLevel = 1;
				_vehicle animate ["fuelswitch", 1];
			} else {
				_fuelLevel = 0.9;
				_vehicle animate ["fuelswitch", 1];
			};
		};
		case 1: {
			if (_fuelcount2 == 1) then {
				_fuelLevel = 0.8;
				_vehicle animate ["fuelswitch", 1];
			} else {
				_fuelLevel = 0.7;
				_vehicle animate ["fuelswitch", 1];
			};
		};
		case 0: {
			if (_fuelcount2 == 1) then {
				_fuelLevel = 0.6;
				_vehicle animate ["fuelswitch", 1];
			} else {
				_fuelLevel = 0.5;
				_vehicle animate ["fuelswitch", 0];
			};
		};
	};
	_vehicle setFuel (_fuelLevel min fuel _vehicle);

	private _frameNo = diag_frameNo;
	waitUntil {diag_frameNo > _frameNo};
};
