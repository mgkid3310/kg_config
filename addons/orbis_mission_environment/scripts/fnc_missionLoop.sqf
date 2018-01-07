params ["_timeOld", "_points", "_mccArray"];
_mccArray params ["_arrayGeneral", "_arraySides", "_arrayObjectives", "_arrayDefines", "_arrayAssets"];

missionNamespace setVariable ["misisonLoopRunning", true, true];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
private _playerCountInit = missionNamespace getVariable ["playerCountInit", _playerCount];
_points = _points + (time - _timeOld) * _playerCount; // 600 points / player / 10min

// count player-side forces
private _playerSideObjects = entities select {side _x isEqualTo (_arraySides select 2) && alive _x};

private _planeUnits = _playerSideObjects select {_x isKindOf "Plane"};
private _heliUnits = _playerSideObjects select {_x isKindOf "Helicopter"};
private _tankUnits = _playerSideObjects select {_x isKindOf "Tank"};
private _vehicleUnits = _playerSideObjects select {_x isKindOf "Car"};
private _infUnits = _playerSideObjects select {_x isKindOf "Man"};
private _playerSideUnits = [_planeUnits, _heliUnits, _tankUnits, _vehicleUnits, _infUnits];

private _planeCount = count _planeUnits;
private _heliCount = count _heliUnits;
private _tankCount = count _tankUnits;
private _vehicleCount = count _vehicleUnits;
private _infCount = count _infUnits;

// update threat assessment
private _airThreat = missionNamespace getVariable ["airThreat", 0];
private _groundThreat = missionNamespace getVariable ["groundThreat", 0];
_airThreat = _airThreat + (time - _timeOld) * ((_planeCount * PLANE_SCORE) + (_heliCount * HELI_SCORE));
_groundThreat = _groundThreat + (time - _timeOld) * ((_tankCount * TANK_SCORE) + (_vehicleCount * VEHICLE_SCORE) + (_infCount * INF_SCORE));
missionNamespace setVariable ["airThreat", _airThreat];
missionNamespace setVariable ["groundThreat", _groundThreat];

// update player-side dead units
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
private _unitScores = [PLANE_SCORE, HELI_SCORE, TANK_SCORE, VEHICLE_SCORE, INF_SCORE];
private _totalSpawns = missionNamespace getVariable ["totalSpawns", [0, 0, 0, 0, 0]];
private _spawnedCount = 0;
{
	_spawnedCount = _spawnedCount + _x;
} forEach _totalSpawns;
private _spawnRatio = _totalSpawns apply {_x / _spawnedCount};

{ // add kill scores
	_x set [0, _x + _planeKills select {_x select 1 isEqualTo _forEachIndex}];
	_x set [1, _x + _heliKills select {_x select 1 isEqualTo _forEachIndex}];
	_x set [2, _x + _tankKills select {_x select 1 isEqualTo _forEachIndex}];
	_x set [3, _x + _vehicleKills select {_x select 1 isEqualTo _forEachIndex}];
	_x set [4, _x + _infKills select {_x select 1 isEqualTo _forEachIndex}];
} forEach _scoreNamspace;

{ // add cooperative kill socres
	private _ratio = _spawnRatio select _forEachIndex;
	_x set [0, _x + (_planeUnkwownKills * _ratio)];
	_x set [1, _x + (_heliUnkwownKills * _ratio)]];
	_x set [2, _x + (_tankUnkwownKills * _ratio)]];
	_x set [3, _x + (_vehicleUnkwownKills * _ratio)]];
	_x set [4, _x + (_infUnkwownKills * _ratio)]];
} forEach _scoreNamspace;

private _scores = _scoreNamspace apply {[(_x select 0) * PLANE_SCORE + (_x select 1) * HELI_SCORE, (_x select 2) * TANK_SCORE + (_x select 3) * VEHICLE_SCORE + (_x select 4) * INF_SCORE]};

// calculate optimal point distribution


// add triggers to player-side units
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
