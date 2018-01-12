#include "script_settings.sqf"
diag_log format ["orbis_mission_environment missionLoop run time: %1", time];

params ["_timeOld", "_points", "_factionArray"];
_factionArray params ["_playerSide", "_objectSide", "_objectFaction"];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
private _playerCountInit = missionNamespace getVariable ["playerCountInit", _playerCount];
_points = _points + (time - _timeOld) * _playerCount * POINT_MULTIPLIER;
diag_log format ["orbis_mission_environment missionLoop points: %1", _points];

// set up units array
private _playerSidePlanes = (entities "Plane") select {(side _x isEqualTo _playerSide) && (alive _x)};
private _playerSidehelis = (entities "Helicopter") select {(side _x isEqualTo _playerSide) && (alive _x)};
private _playerSidetanks = (entities "Tank") select {(side _x isEqualTo _playerSide) && (alive _x)};
private _playerSidevehicles = (entities "Car") select {(side _x isEqualTo _playerSide) && (alive _x)};
private _playerSideinfs = (entities "Man") select {(side _x isEqualTo _playerSide) && (alive _x)};

// update threat assessment
private _airThreat = missionNamespace getVariable ["airThreat", 0];
private _groundThreat = missionNamespace getVariable ["groundThreat", 0];
_airThreat = _airThreat + (time - _timeOld) * ((count _playerSidePlanes * PLANE_SCORE) + (count _playerSidehelis * HELI_SCORE));
_groundThreat = _groundThreat + (time - _timeOld) * ((count _playerSidetanks * TANK_SCORE) + (count _playerSidevehicles * VEHICLE_SCORE) + (count _playerSideinfs * INF_SCORE));
private _totalThreat = _airThreat + _groundThreat;
missionNamespace setVariable ["airThreat", _airThreat];
missionNamespace setVariable ["groundThreat", _groundThreat];
diag_log format ["orbis_mission_environment missionLoop airThreat: %1, groundThreat: %2", _airThreat, _groundThreat];

// define if local or total warfare
private _combatIsLocal = missionNamespace getVariable ["combatIsLocal", true];
if (_combatIsLocal && (random [LOCAL_MAX - LOCAL_STD, LOCAL_MAX, LOCAL_MAX + LOCAL_STD] < _totalThreat)) then {
	_combatIsLocal = false;
};
missionNamespace setVariable ["combatIsLocal", _combatIsLocal];
diag_log format ["orbis_mission_environment missionLoop combatIsLocal: %1", _combatIsLocal];

// calculate point distribution
private _pointRatio = [1, 1, 1, 1, 1];
if (_combatIsLocal) then {
	_pointRatio = [_points] call orbis_mission_fnc_pointLocal;
} else {
	_pointRatio = [_points] call orbis_mission_fnc_pointTotal;
};
private _pointRatioSum = 0;
{
	_pointRatioSum = _pointRatioSum + _value;
} forEach _pointRatioSum;
_pointRatio = _pointRatio apply {_x / _pointRatioSum};
private _pointDistribution = _pointRatio apply {_x * _points};
_points = 0;
diag_log format ["orbis_mission_environment missionLoop pointDistribution: %1", _pointDistribution];

// get spawn location
private _missionCenterPos = missionNamespace getVariable ["missionCenterPos", [0, 0, 0]];
private _missionAreaRadius = missionNamespace setVariable ["missionAreaRadius", 500];
private _missionPlayerPos = missionNamespace setVariable ["missionPlayerPos", [0, 0, 0]];
private _locationNames = ["NameCity", "NameCityCapital", "NameVillage", "NameLocal", "Hill", "Mount", "Airport"];

private _missionToPlayer = _missionCenterPos getDir _missionPlayerPos;
private _dirMax = _missionToPlayer + 45;
private _missionToPlane = _dirMax + (time random 270);
if (_missionToPlane >= 360) then {
	_missionToPlane = _missionToPlane - 360;
};
private _planeLoaction = (_missionCenterPos getPos [40000, _missionToPlane]) set [2, 1000];
private _groundLocation = getPos selectRandom (nearestLocations [_missionPlayerPos, _locationNames, 50000] select {(getPos _x distance _missionCenterPos > _missionAreaRadius) && (getPos _x distance _missionCenterPos < (_missionAreaRadius * 3)) && (getPos _x distance _missionPlayerPos > 2000)});

// spawn reinforcing units
private _spawnGroups = [];

while {{(_x select 2) <= _pointDistribution select 0} count orbis_mission_planeArray > 0} do { // plane
	private _thisSpawn = selectRandom (orbis_mission_planeArray select {_x <= _pointDistribution select 0});
	private _spawnLocation = [[_planeLoaction, 300]] call BIS_fnc_randomPos;
	private _group = createGroup _objectSide;
	private _vehicle = _group createUnit [_thisSpawn select 1, _spawnLocation, [], 0, "NONE"];
	_vehicle flyInHeight (300 + time random 1500);
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
	private _spawnLocation = _groundLocation findEmptyPosition [0, 1000];
	private _group = [_spawnLocation, _objectSide, _thisSpawn select 0] call BIS_fnc_spawnGroup;
	_spawnGroups pushBack _group;

	_pointDistribution set [4, (_pointDistribution select 4) - (_thisSpawn select 2)];
};

// return leftover points
diag_log format ["orbis_mission_environment missionLoop pointLeftover: %1", _pointDistribution];
{
	_points = _points + (_x * RETURN_RATIO);
	_pointDistribution set [_forEachIndex, _x * (1 - RETURN_RATIO)];
} forEach _pointDistribution;

// add waypoint to AO
{
	_x addWaypoint [_missionCenterPos, _missionAreaRadius];
} forEach _spawnGroups;

// pause script for a moment
private _sleepTime = 300 + (time random 600); // 5 ~ 15 min
diag_log format ["orbis_mission_environment missionLoop sleepTime: %1", _sleepTime];
sleep _sleepTime;

// check if objects are still running
private _objects = entities [[], ["Logic"], true] select {typeOf _x isEqualTo "MCC_ModuleObjective_F"};
private _isRunning = !(_objects apply {!(_x getVariable ["RscAttributeTaskState", ""] in ["Succeeded", "Failed"])} isEqualTo []);
diag_log format ["orbis_mission_environment missionLoop isRunning: %1", _isRunning];

if (_isRunning) then { // start the next loop or end & set weather changes
	[time, _points, _factionArray] spawn orbis_mission_fnc_missionLoop;
} else {
	missionNamespace setVariable ["misisonLoopRunning", false, true];

	// weather change
	private _weatherMaintain = sleep (300 + (time random 300)); // 5 ~ 10 min
	diag_log format ["orbis_mission_environment missionLoop weatherMaintain: %1", _weatherMaintain];
	sleep _weatherMaintain;
	private _weather = missionNamespace getVariable ["missionWeather", "sunny"];
	private _weatherRandomTime = 300 + (time random 1800);
	diag_log format ["orbis_mission_environment missionLoop weatherRandomTime: %1", _weatherRandomTime];
	switch ([_weather, ""] selectRandomWeighted [0.5, 0.5]) do { 
		case "sunny": {
			_weatherRandomTime setOvercast 0.0;
			_weatherRandomTime setRain 0.0;
			10 setRainbow 0;
		};
		case "cloudy": {
			_weatherRandomTime setOvercast 0.2;
			_weatherRandomTime setRain 0.0;
			10 setRainbow 0;
		};
		case "rainy": {
			_weatherRandomTime setOvercast 0.2;
			_weatherRandomTime setRain 0.0;
			sleep _weatherRandomTime;
			30 setRainbow 1;
		};
		case "thunderstorm": {
			_weatherRandomTime setOvercast 0.2;
			_weatherRandomTime setRain 0.0;
			sleep _weatherRandomTime;
			30 setRainbow 1;
		};
		default {};
	};
};
