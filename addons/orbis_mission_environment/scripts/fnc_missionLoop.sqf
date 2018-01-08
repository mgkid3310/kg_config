#include "script_settings.sqf"

params ["_timeOld", "_points", "_factionArray"];
_factionArray params ["_playerSide", "_objectSide", "_objectFaction"];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
private _playerCountInit = missionNamespace getVariable ["playerCountInit", _playerCount];
_points = _points + (time - _timeOld) * _playerCount * POINT_MULTIPLIER;

// set up units array
private _playerSideEntities = entities select {(side _x isEqualTo _playerSide) && (alive _x)};
private _playerSidePlanes = _playerSideEntities select {_x isKindOf "Plane"};
private _playerSidehelis = _playerSideEntities select {_x isKindOf "Helicopter"};
private _playerSidetanks = _playerSideEntities select {_x isKindOf "Tank"};
private _playerSidevehicles = _playerSideEntities select {_x isKindOf "Car"};
private _playerSideinfs = _playerSideEntities select {_x isKindOf "Man"};
private _playerSideUnits = [_playerSidePlanes, _playerSidehelis, _playerSidetanks, _playerSidevehicles, _playerSideinfs];

private _objectSideEntities = entities select {(side _x isEqualTo _objectSide) && (alive _x)};
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
private _scoreNamspaceOld = _scoreNamspace;
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

// update power assessment
private _aaPower = 0;
private _agPower = 0;
{
	_aaPower = _aaPower + (count _x) * (_scores select _forEachIndex select 0);
	_agPower = _agPower + (count _x) * (_scores select _forEachIndex select 1);
} forEach _objectSideUnits;
private _aaPowerRatio = _aaPower / _airThreat;
private _agPowerRatio = _agPower / _groundThreat;

// calculate score/point effectiveness
private _pointsUsed = missionNamespace getVariable ["pointsUsed", [0, 0, 0, 0, 0]];
private _pointAssessment = _objectSideUnits apply {
	private _point = 0;
	{
		_point = _point + orbis_mission_unitPrice select (orbis_mission_unitList find typeOf _x);
	} forEach _x;
	_point
};
private _scoreEffectiveness = [-1, -1, -1, -1, -1];
private _scoreAverage = 0;
private _scoreCount = 0;
for "_i" from 0 to 4 do {
	if !(_pointsUsed select _i isEqualTo 0) then {
		_scoreEffectiveness set [_i, ((_scores select _i) - (_scoreNamspaceOld select _i)) / (_pointAssessment select _i)];
		_scoreAverage = _scoreAverage + ((_scores select _i) - (_scoreNamspaceOld select _i)) / (_pointAssessment select _i);
		_scoreCount = _scoreCount + 1;
	};
};
if (_scoreCount isEqualTo 0) then {
	_scoreEffectiveness = [1, 1, 1, 1, 1];
} else {
	_scoreAverage = _scoreAverage / _scoreCount;
	_scoreEffectiveness apply {if (_x < 0) then {_scoreAverage} else {_x}};
};

// calculate point distribution
private _pointRatio = _scoreEffectiveness apply {_x / (_scoreAverage * 5)};
private _pointDistribution = _pointRatio apply {_x * _points};

// get spawn location
private _missionCenterPos = missionNamespace getVariable ["missionCenterPos", [0, 0, 0]];
private _missionPlayerPos = missionNamespace setVariable ["missionPlayerPos", [0, 0, 0]];
private _locationNames = ["NameCity", "NameCityCapital", "NameVillage", "NameLocal", "Hill", "Mount", "Airport"];

private _missionToPlayer = _missionCenterPos getDir _missionPlayerPos;
private _missionToPlane = 
private _planeLoaction = [_missionCenterPos, 40000, _missionToPlane] call BIS_fnc_relPos set [2, 1000];

private _groundLocation = getPos selectRandom (nearestLocations [missionPlayerPos, _locationNames, 50000] select {(getPos _x distance missionCenterPos > 3000) && (getPos _x distance missionCenterPos < 10000) && (getPos _x distance missionPlayerPos > 2000)});

// spawn reinforcing units
private _spawnGroups = [];

while {{(_x select 2) <= _pointDistribution select 0} count orbis_mission_planeArray > 0} do { // plane
	private _thisSpawn = selectRandom (orbis_mission_planeArray select {_x <= _pointDistribution select 0});
	private _spawnLocation = [[_planeLoaction, 300]] call BIS_fnc_randomPos;
	private _group = createGroup _objectSide;
	_group createUnit [_thisSpawn select 1, _spawnLocation, [], 0, "NONE"];
	_spawnGroups pushBack _group;

	_pointDistribution set [0, (_pointDistribution select 0) - (_thisSpawn select 2)];
};

while {{(_x select 2) <= _pointDistribution select 1} count orbis_mission_heliArray > 0} do { // heli
	private _thisSpawn = selectRandom (orbis_mission_heliArray select {_x <= _pointDistribution select 1});
	private _spawnLocation = _groundLocation findEmptyPosition [0, 1000, _thisSpawn select 1]; 
	private _group = createGroup _objectSide;
	_group createUnit [_thisSpawn select 1, _spawnLocation, [], 0, "NONE"];
	_spawnGroups pushBack _group;

	_pointDistribution set [1, (_pointDistribution select 1) - (_thisSpawn select 2)];
};

while {{(_x select 2) <= _pointDistribution select 2} count orbis_mission_tankArray > 0} do { // tank
	private _thisSpawn = selectRandom (orbis_mission_tankArray select {_x <= _pointDistribution select 2});
	private _spawnLocation = _groundLocation findEmptyPosition [0, 1000, _thisSpawn select 1];
	private _group = createGroup _objectSide;
	_group createUnit [_thisSpawn select 1, _spawnLocation, [], 0, "NONE"];
	_spawnGroups pushBack _group;

	_pointDistribution set [2, (_pointDistribution select 2) - (_thisSpawn select 2)];
};

while {{(_x select 2) <= _pointDistribution select 3} count orbis_mission_vehicleArray > 0} do { // vehicle
	private _thisSpawn = selectRandom (orbis_mission_vehicleArray select {_x <= _pointDistribution select 3});
	private _spawnLocation = _groundLocation findEmptyPosition [0, 1000, _thisSpawn select 1];
	private _group = createGroup _objectSide;
	_group createUnit [_thisSpawn select 1, _spawnLocation, [], 0, "NONE"];
	_spawnGroups pushBack _group;

	_pointDistribution set [3, (_pointDistribution select 3) - (_thisSpawn select 2)];
};

while {{(_x select 2) <= _pointDistribution select 4} count orbis_mission_infArray > 0} do { // inf
	private _thisSpawn = selectRandom (orbis_mission_infArray select {_x <= _pointDistribution select 4});
	private _spawnLocation = _groundLocation findEmptyPosition [0, 1000, _thisSpawn select 3];;
	private _group = [_spawnLocation, _objectSide, _thisSpawn select 0] call BIS_fnc_spawnGroup;
	_spawnGroups pushBack _group;

	_pointDistribution set [4, (_pointDistribution select 4) - (_thisSpawn select 2)];
};

// add waypoint to AO
private _missionAreaRadius = missionNamespace setVariable ["missionAreaRadius", 500];
{
	_x addWaypoint [_missionCenterPos, _missionAreaRadius];
} forEach _spawnGroups;

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
sleep (300 + (time random 600)); // 5 ~ 15 min

// check if objects are still running
private _objects = entities [[], ["Logic"], true] select {_x typeOf "MCC_ModuleObjective_F"};
private _isRunning = _objects apply {!(_x getVariable ["RscAttributeTaskState", ""] in ["Succeeded", "Failed"])} isEqualTo [];

if (_isRunning) then { // start the next loop or end & set weather changes
	[time, _points, _factionArray] spawn orbis_mission_fnc_missionLoop;
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
