params ["_origin", "_targets", "_minRange", "_maxRange"];

if (_targets isEqualType []) then {
	_targets = [_targets];
};

private _return = true;

{
	private _distance = _origin distance _x;
	if !((_distance > _minRange) && (_maxRange < 0 || _distance < _maxRange)) exitWith {
		_return = false;
	};
} forEach _targets;

_return
