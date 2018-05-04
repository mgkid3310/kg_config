params ["_vehicle", "_smokeMod", "_particleColor"];

_vehicle setVariable ["smokeReady", false, true];
private _smokeModOld = _vehicle getVariable ["smokeMod", "off"];
private _particleColorOld = _vehicle getVariable ["particleColor", [0, 0, 0, 0]];
private _objectFollowOld = _vehicle getVariable ["objectFollow", objNull];
private _particleSourcesOld = _vehicle getVariable ["smokeSources", []];

{
	deleteVehicle _x;
} forEach _particleSourcesOld;
deleteVehicle _objectFollowOld;

if (_smokeMod isEqualTo _smokeModOld) exitWith {
	_vehicle setVariable ["smokeReady", true, true];
};
if (_smokeMod isEqualTo "off") exitWith {
	_vehicle setVariable ["smokeMod", "off"];
	_vehicle setVariable ["particleColor", [0, 0, 0, 0]];
	_vehicle setVariable ["objectFollow", objNull];
	_vehicle setVariable ["smokeSources", []];
	_vehicle setVariable ["smokeReady", true, true];
};

sleep 0.3;

private _objectFollow = "Land_Bucket_F" createVehicleLocal (getPos _vehicle);
_objectFollow attachTo [_vehicle, [0.0, -8.0, 0.0]];
hideObject _objectFollow;

private _randomArray = [
	/*lifeTimeVar*/ 15,
	/*positionVar*/ [0.15, 0.15, 0.15],
	/*moveVelocityVar*/ [36.0, 36.0, 36.0],
	/*rotationVelocityVar*/ 0.0,
	/*sizeVar*/ 0.0,
	/*colorVar*/ [0, 0, 0, 0.05],
	/*randomDirectionPeriodVar*/ 0,
	/*randomDirectionIntensityVar*/ 0
];
private _paramsArray = [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 8, 0], "",
	/*particleType*/ "Billboard",
	/*timerPeriod*/ 1,
	/*lifeTime*/ 25,
	/*position*/ [0, 0, 0],
	/*moveVelocity*/ [0, 0, 0],
	/*rotationVelocity*/ 0,
	/*weight*/ 11.55,
	/*volume*/ 9,
	/*rubbing*/ 6,
	/*size*/ [5, 5, 5],
	/*color*/ [_particleColor],
	/*animationSpeed*/ [0.125],
	/*randomDirectionPeriod*/ 1,
	/*randomDirectionIntensity*/ 0,
	/*onTimerScript*/ "",
	/*beforeDestroyScript*/ "",
	/*this*/ _objectFollow
];

private _particleSource1 = "#particlesource" createVehicleLocal (getPos _vehicle);
_particleSource1 attachTo [_objectFollow, [0, 0, 0]];
_particleSource1 setParticleCircle [0, [0, 0, 0]];
_particleSource1 setParticleRandom _randomArray;
_particleSource1 setParticleParams _paramsArray;
_particleSource1 setDropInterval 0.01;

/* _frameNo = diag_frameNo;
waitUntil {diag_frameNo > _frameNo};

private _particleSource2 = "#particlesource" createVehicleLocal (getPos _vehicle);
_particleSource2 attachTo [_objectFollow, [0, 0, 0]];
_particleSource2 setParticleCircle [0, [0, 0, 0]];
_particleSource2 setParticleRandom _randomArray;
_particleSource2 setParticleParams _paramsArray;
_particleSource2 setDropInterval 0.003; */

_vehicle setVariable ["smokeMod", _smokeMod];
_vehicle setVariable ["particleColor", _particleColor];
_vehicle setVariable ["objectFollow", _objectFollow];
_vehicle setVariable ["smokeSources", [_particleSource1/* , _particleSource2 */]];
_vehicle setVariable ["smokeReady", true, true];
