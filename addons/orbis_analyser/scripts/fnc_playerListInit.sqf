private _playerArray = [];
{
	_playerArray pushBack [(units _x) select {isPlayer _x}];
} forEach allUnits;

private _text = "";
{
	_text = _text + endl + endl + format ["%1", groupId _x] + endl;
	{
		_text = _text + endl + format ["[]"]
	} forEach _x;
	_text = _text + endl + endl;
} forEach _playerArray;

copyToClipboard _text;
