private _current = 0;
while {_current < (_this select 2)} do {
	playSound (_this select 0);
	_current = _current + 1;
	sleep (_this select 1);
};
