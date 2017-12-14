params ["_charge"];
private _buildingsArray = nearestObjects [_charge, ["Building"], 50];

{
	private _doorsNo = getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "numberOfDoors");
	for "_i" from 1 to _doorsNo do {
		private _pos = _building selectionPosition (format ["Door_%1_trigger", _i]);
		private _doorPos = _building modelToWorld _pos;

		if (_doorPos distance _charge < 0.5) then {
			_building setVariable [format ["bis_disabled_Door_%1", _i], 0, true];
			_building animate [format ["door_%1_rot", _i], 1];
		};
	};
} forEach _buildingsArray;
