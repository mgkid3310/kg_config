private _playerArray = [];
{
	private _side = "";
	{
		if (_x in allPlayers) exitWith {
			_side = side _x;
		};
	} forEach units _x;
	if !(_side isEqualTo "") then {
		_playerArray pushBack [_x, _side, (units _x) select {isPlayer _x}];
	};
} forEach allGroups;

private _text = endl + "Players List";
{
	private _group = _x;
	_text = _text + endl + endl + format ["%1, %2", _side, groupId (_group select 0)];
	{
		_text = _text + endl;
		if (leader (_group select 0) isEqualTo leader _x) then {
			_text = _text + format ["Leader: %1", name _x];
		} else {
			_text = _text + format ["Member: %1", name _x];
		};
	} forEach (_group select 2);
} forEach _playerArray;

diag_log _text;
