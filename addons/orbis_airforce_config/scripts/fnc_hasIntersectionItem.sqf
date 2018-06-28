params ["_arrayA", "_arrayB"];

private _return = false;
{
	if (_x in _arrayB) exitWith {
		_return = true;
	};
} forEAch _arrayA;

_return
