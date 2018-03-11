params ["_carrier"];

private _cargoList =  _carrier getVariable ["cargoList", []];

{
	if (_x in attachedObjects _carrier) then {
		[_x, _carrier] spawn orbis_fnc_deployCargodrop;
	};
} forEach _cargoList;
