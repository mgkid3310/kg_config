params ["_jammer"];

private _jamchance = 0;
private _randnumber = floor random 100; // 0 ~ 99

if (!(_jamchance > _randnumber)) then {
	_jammer setCaptive true;
} else {
	sleep 10;
	deleteVehicle _jammer;
};
