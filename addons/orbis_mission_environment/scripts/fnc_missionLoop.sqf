#include "unitSetup.sqf"

params ["_timeOld", "_points", "_mccArray"];
_mccArray params ["_arrayGeneral", "_arraySides", "_arrayObjectives", "_arrayDefines", "_arrayAssets"];

missionNamespace setVariable ["misisonLoopRunning", true, true];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
private _playerCountInit = missionNamespace getVariable ["playerCountInit", _playerCount];
_points = _points + (time - _timeOld) * _playerCount; // 600 points / player / 10min

// set up units array
private _playerSideEntities = entities select {side _x isEqualTo (_arraySides select 2) && alive _x};
private _playerSidePlanes = _playerSideEntities select {_x isKindOf "Plane"};
private _playerSidehelis = _playerSideEntities select {_x isKindOf "Helicopter"};
private _playerSidetanks = _playerSideEntities select {_x isKindOf "Tank"};
private _playerSidevehicles = _playerSideEntities select {_x isKindOf "Car"};
private _playerSideinfs = _playerSideEntities select {_x isKindOf "Man"};
private _playerSideUnits = [_playerSidePlanes, _playerSidehelis, _playerSidetanks, _playerSidevehicles, _playerSideinfs];

private _objectSideEntities = entities select {side _x isEqualTo (_arraySides select 0) && alive _x};
private _objectSidePlanes = _objectSideEntities select {_x isKindOf "Plane"};
private _objectSidehelis = _objectSideEntities select {_x isKindOf "Helicopter"};
private _objectSidetanks = _objectSideEntities select {_x isKindOf "Tank"};
private _objectSidevehicles = _objectSideEntities select {_x isKindOf "Car"};
private _objectSideinfs = _objectSideEntities select {_x isKindOf "Man"};
private _objectSideUnits = [_objectSidePlanes, _objectSidehelis, _objectSidetanks, _objectSidevehicles, _objectSideinfs];

// update dead units
private _deadUnits = missionNamespace getVariable ["deadUints", []];
private _planeKills = _deadUnits select {_x select 0 isEqualTo 0};
private _heliKills = _deadUnits select {_x select 0 isEqualTo 1};
private _tankKills = _deadUnits select {_x select 0 isEqualTo 2};
private _vehicleKills = _deadUnits select {_x select 0 isEqualTo 3};
private _infKills = _deadUnits select {_x select 0 isEqualTo 4};

private _unkwownKills = _deadUnits select {_x select 1 isEqualTo -1};
private _planeUnkwownKills = _unkwownKills select {_x select 0 isEqualTo 0};
private _heliUnkwownKills = _unkwownKills select {_x select 0 isEqualTo 1};
private _tankUnkwownKills = _unkwownKills select {_x select 0 isEqualTo 2};
private _vehicleUnkwownKills = _unkwownKills select {_x select 0 isEqualTo 3};
private _infUnkwownKills = _unkwownKills select {_x select 0 isEqualTo 4};
missionNamespace setVariable ["deadUints", []];

// update score assessment
private _scoreNamspace = missionNamespace getVariable ["scoreNamespace", [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]];
private _totalSpawns = missionNamespace getVariable ["totalSpawns", [0, 0, 0, 0, 0]];
private _spawnedCount = 0;
{
	_spawnedCount = _spawnedCount + _x;
} forEach _totalSpawns;
private _spawnRatio = _totalSpawns apply {_x / _spawnedCount};

{
	_x set [0, _x + _planeKills select {_x select 1 isEqualTo _forEachIndex}];
	_x set [1, _x + _heliKills select {_x select 1 isEqualTo _forEachIndex}];
	_x set [2, _x + _tankKills select {_x select 1 isEqualTo _forEachIndex}];
	_x set [3, _x + _vehicleKills select {_x select 1 isEqualTo _forEachIndex}];
	_x set [4, _x + _infKills select {_x select 1 isEqualTo _forEachIndex}];
} forEach _scoreNamspace;

missionNamespace setVariable ["scoreNamespace", _scoreNamspace];
private _scores = _scoreNamspace apply {[(_x select 0) * PLANE_SCORE + (_x select 1) * HELI_SCORE, (_x select 2) * TANK_SCORE + (_x select 3) * VEHICLE_SCORE + (_x select 4) * INF_SCORE]};

// update threat assessment
private _airThreat = missionNamespace getVariable ["airThreat", 0];
private _groundThreat = missionNamespace getVariable ["groundThreat", 0];
_airThreat = _airThreat + (time - _timeOld) * ((count _playerSidePlanes * PLANE_SCORE) + (count _playerSidehelis * HELI_SCORE));
_groundThreat = _groundThreat + (time - _timeOld) * ((count _playerSidetanks * TANK_SCORE) + (count _playerSidevehicles * VEHICLE_SCORE) + (count _playerSideinfs * INF_SCORE));
missionNamespace setVariable ["airThreat", _airThreat];
missionNamespace setVariable ["groundThreat", _groundThreat];

// calculate score/point effectiveness
private _pointsUsed = missionNamespace getVariable ["pointsUsed", [0, 0, 0, 0, 0]];
private _scoreEffectiveness = [0, 0, 0, 0, 0];
for "_i" from 0 to 4 do {
	if !(_pointsUsed select _i isEqualTo 0) then {
		_scoreEffectiveness set [_i, (_scores select _i) / (_pointsUsed select _i)];
	};
};

// update power assessment
private _aaPower = 0;
private _agPower = 0;
{
	_aaPower = _aaPower + (count _x) * (_scores select _forEachIndex select 0);
	_agPower = _agPower + (count _x) * (_scores select _forEachIndex select 1);
} forEach _objectSideUnits;

// calculate optimal point distribution
private _

// add killed triggers to units
{
	private _units = _x;
	private _typeNumber = _forEachIndex;
	{
		if (_x getVariable ["unitTypeNumber", -1] < 0) then {
			_x setVariable ["unitTypeNumber", _typeNumber, true];
			_x addEventHandler ["killed", {_this call orbis_mission_fnc_unitKilled}];
		};
	} forEach _units;
} forEach _playerSideUnits;

{
	private _units = _x;
	private _typeNumber = _forEachIndex;
	{
		if (_x getVariable ["unitTypeNumber", -1] < 0) then {
			_x setVariable ["unitTypeNumber", _typeNumber, true];
			_x addEventHandler ["killed", {_this call orbis_mission_fnc_unitKilled}];
		};
	} forEach _units;
} forEach _objectSideUnits;

// pause script for a moment
sleep 600;

// check if objects are still running
private _objects = entities [[], ["Logic"], true] select {_x typeOf "MCC_ModuleObjective_F"};
private _isRunning = _objects apply {!(_x getVariable ["RscAttributeTaskState", ""] in ["Succeeded", "Failed"])} isEqualTo [];

if (_isRunning) then { // start the next loop or end & set weather changes
	[time, _points, _mccArray] spawn orbis_mission_fnc_missionLoop;
} else {
	missionNamespace setVariable ["misisonLoopRunning", false, true];

	// weather change
	sleep (300 + (time random 300));
	missionNamespace getVariable ["timeAndWeather", ["day", "sunny"]] params ["_time", "_weather"];
	private _randomTime = 300 + (time random 1800);
	switch ([_weather, ""] selectRandomWeighted [0.5, 0.5]) do { 
		case "sunny": {
			_randomTime setOvercast 0.0;
			_randomTime setRain 0.0;
			10 setRainbow 0;
		};
		case "cloudy": {
			_randomTime setOvercast 0.2;
			_randomTime setRain 0.0;
			10 setRainbow 0;
		};
		case "rainy": {
			_randomTime setOvercast 0.2;
			_randomTime setRain 0.0;
			sleep _randomTime;
			30 setRainbow 1;
		};
		case "thunderstorm": {
			_randomTime setOvercast 0.2;
			_randomTime setRain 0.0;
			sleep _randomTime;
			30 setRainbow 1;
		};
		default {};
	};
};
