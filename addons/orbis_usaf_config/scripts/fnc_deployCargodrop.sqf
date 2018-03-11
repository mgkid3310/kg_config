params ["_cargo", "_carrier"];

private _offset = -14;
private _position = _carrier worldToModelVisual [getPosATL _cargo select 0, getPosATL _cargo select 1, (getPosATL _cargo select 2) - ((_cargo worldToModelVisual (getPosATL _cargo)) select 2)];

_cargo disableCollisionWith _carrier;
while {_position select 1 > _offset} do {
	_position = _position vectorDiff [0, 0.30, 0];
	private _vector = [_cargo, _carrier] call KK_fnc_vectorDirAndUpRelative;
	_cargo attachTo [_carrier, _position];
	_cargo setVectorDirAndUp _vector;
	sleep 0.01;
};
detach _cargo;

private _chute = "B_Parachute_02_F" createVehicle [0, 0, 100];
_chute setposASL (getPosASL _cargo);
_chute setVelocity (velocity _cargo);
_cargo attachTo [_chute, [0, 0, -5]];

waitUntil {(getPos _cargo select 2 < 1) && (vectorMagnitude velocity _cargo < 1)};

detach _cargo;
_cargo enableCollisionWith _carrier;
