params ["_sound", "_delay", "_repeatNum"];

private _current = 0;
while {_current < _repeatNum} do {
	playSound _sound;
	_current = _current + 1;
	sleep _delay;
};
