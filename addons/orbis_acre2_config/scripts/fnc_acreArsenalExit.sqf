private _unit = acre_player;

private _radio343 = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc343", "configName _x == 'weapons'"] select 0);
private _radio148 = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc148", "configName _x == 'weapons'"] select 0);
private _radio152 = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc152", "configName _x == 'weapons'"] select 0);
private _radio117f = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc117f", "configName _x == 'weapons'"] select 0);
private _radio77 = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc77", "configName _x == 'weapons'"] select 0);
private _radioList = [_radio343 select 0, _radio148 select 0, _radio152 select 0, _radio117f select 0, _radio77 select 0];

private _invContainers = [uniformContainer _unit, vestContainer _unit, backpackContainer _unit];
private _invItems = _invContainers apply {itemCargo _x};
private _radioCargo = _unit getVariable ["radioTemp", [[[], [], [], [], []], [[], [], [], [], []], [[], [], [], [], []]]];
private _radioCount = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]];

for "_j" from 0 to 2 do {
	private _radioCountNow = _radioCount select _j;
	for "_i" from 0 to 4 do {
		{
			if (_x isEqualTo (_radioList select _i)) then {
				_radioCountNow set [_i, (_radioCountNow select _i) + 1];
			};
		} forEach (_invItems select _j);
	};
	_radioCount set [_j, _radioCountNow];
};

for "_j" from 0 to 2 do {
	for "_i" from 0 to 4 do {
		{
			if ((count _x) < (_radioCountNow select _i)) then {
				_x deleteRange [(_radioCountNow select _i) - 1, (count _x) - (_radioCountNow select _i)];
			};
		} forEach ((_radioCargo select _j) select _i);

		if (!(((_radioCargo select _j) select _i) isEqualTo [])) then {
			{
				[unit, _j, "remove", (_radioList select _i)] call orbis_fnc_modifyInventory;
				[unit, _j, "add", (_radioList select _i)] call orbis_fnc_modifyInventory;
			} foreach ((_radioCargo select _j) select _i);
		};
	};
};

_unit setVariable ["radioTemp", [[[], [], [], [], []], [[], [], [], [], []], [[], [], [], [], []]]];
isRadioStop = False;
