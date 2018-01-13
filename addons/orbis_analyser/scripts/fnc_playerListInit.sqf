private _playerArray = [];
{
	_playerArray pushBack [(units _x) select {isPlayer _x}];
} forEach allGroups;

private _text = "";
{
	private _group = _x;
	_text = _text + endl + endl + format ["%1", groupId _group];
	{
		_text = _text + endl;
		if (leader _group isEqualTo leader _x) then {
			_text = _text + format ["Leader: %1", name _x];
		} else {
			_text = _text + format ["Member: %1", name _x];
		};
	} forEach _group;
} forEach _playerArray;

copyToClipboard _text;
