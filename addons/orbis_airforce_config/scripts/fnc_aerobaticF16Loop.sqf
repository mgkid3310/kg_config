private _vehicle = _this select 0;

while {alive _vehicle} do {
	if (_vehicle hasWeapon "FIR_M61A2") then {
		_vehicle removeWeapon "FIR_M61A2";
		_vehicle removeMagazines "FIR_M61A2_511rnd_M";
		_vehicle removeMagazines "FIR_240rnd_CMFlare_Chaff_Magazine";
		_vehicle addMagazines ["FIR_240rnd_CMFlare_Chaff_Magazine", 4];
	};

	private _frameNo = diag_frameNo;
	waitUntil {diag_frameNo > _frameNo};
};
