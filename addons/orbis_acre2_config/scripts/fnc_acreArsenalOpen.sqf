private _unit = acre_player;

private _radio343 = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc343", "configName _x == 'weapons'"] select 0);
private _radio148 = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc148", "configName _x == 'weapons'"] select 0);
private _radio152 = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc152", "configName _x == 'weapons'"] select 0);
private _radio117f = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc117f", "configName _x == 'weapons'"] select 0);
private _radio77 = getArray (configProperties [configFile >> "CfgPatches" >> "acre_sys_prc77", "configName _x == 'weapons'"] select 0);
private _radioList = [_radio343 select 0, _radio148 select 0, _radio152 select 0, _radio117f select 0, _radio77 select 0];
private _radioArray = [_radio343, _radio148, _radio152, _radio117f, _radio77];

private _invContainers = [uniformContainer _unit, vestContainer _unit, backpackContainer _unit];
private _invItems = _invContainers apply {itemCargo _x};
private _radioCargo = [[[], [], [], [], []], [[], [], [], [], []], [[], [], [], [], []]];

for "_j" from 0 to 2 do {
	private _radioCargoNow = _radioCargo select _j;
	for "_i" from 0 to 4 do {
		private _radioCargoCurrent = _radioCargoNow select _i;
		{
			if (_x in (_radioArray select _i)) then {
				_radioCargoCurrent pushback _x;
			};
		} forEach (_invItems select _j);

		if (!(_radioCargoCurrent isEqualTo [])) then {
			{
				if (_x in (_radioArray select _i)) then {
					[unit, _j, "remove", (_radioList select 0)] call orbis_fnc_modifyInventory;
					[unit, _j, "add", (_radioList select 0)] call orbis_fnc_modifyInventory;
				};
			} foreach _radioCargoCurrent;
		};
		_radioCargoNow set [_i, _radioCargoCurrent];
	};
	_radioCargo set [_j, _radioCargoNow];
};

hint format ["%1", _radioCargo];

_unit setVariable ["radioTemp", _radioCargo];
isRadioStop = True;
