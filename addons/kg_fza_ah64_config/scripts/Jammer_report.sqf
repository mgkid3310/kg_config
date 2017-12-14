params ["_heli", "_seat", "_unit"];

private _timer = 0;

while (true) do {
	hint format ["time: %1 \nir: %2 \nrf: %3", _timer, fza_ah64_irjammer, fza_ah64_rfjammer];
	sleep 1;
	_timer = _timer + 1;
};
