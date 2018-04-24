private _vehicle = _this select 0;

while {alive _vehicle} do {
	private _pylons = getPylonMagazines _vehicle;
	private _fuelcount = {_x == "FIR_f15E_Fueltank_P_1rnd_M"} count _pylons;
	private _fuelLevel = 1;
	switch (_fuelcount) do {
		case 3: {
			_fuelLevel = 1;
			_vehicle animate ["fuelswitch",1];
		};
		case 2: {
			_fuelLevel = 0.8;
			_vehicle animate ["fuelswitch",1];
		};
		case 1: {
			_fuelLevel = 0.6;
			_vehicle animate ["fuelswitch",1];
		};
		case 0: {
			_fuelLevel = 0.4;
			_vehicle animate ["fuelswitch",0];
		};
	};
	_vehicle setFuel (_fuelLevel min fuel _vehicle);

	private _frameNo = diag_frameNo;
	waitUntil {diag_frameNo > _frameNo};
};
