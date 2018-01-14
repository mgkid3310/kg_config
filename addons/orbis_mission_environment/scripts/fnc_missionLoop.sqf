#include "script_settings.sqf"
diag_log format ["orbis_mission_environment missionLoop run time: %1", time];

params ["_timeOld", "_points", "_pointDistribution", "_factionArray"];
_factionArray params ["_playerSide", "_objectSide", "_objectFaction"];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
_points = _points + ((time - _timeOld) * _playerCount * POINT_MULTIPLIER);
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
	_pointRatioSum = _pointRatioSum + _x;
} forEach _pointRatio;
_pointRatio = _pointRatio apply {_x / _pointRatioSum};
{
	_pointDistribution set [_forEachIndex, _x + (_points * (_pointRatio select _forEachIndex))];
} forEach _pointDistribution;
_points = 0;
diag_log format ["orbis_mission_environment missionLoop pointDistribution: %1", _pointDistribution];

// get spawn location
private _missionCenterPos = missionNamespace getVariable ["missionCenterPos", [0, 0, 0]];
private _missionAreaRadius = missionNamespace getVariable ["missionAreaRadius", 500];
private _missionPlayerPos = missionNamespace getVariable ["missionPlayerPos", [0, 0, 0]];
private _locationNames = ["NameCity", "NameCityCapital", "NameVillage", "NameLocal", "Hill", "Airport"];

private _missionToPlayer = _missionCenterPos getDir _missionPlayerPos;
private _dirMax = _missionToPlayer + 45;
private _missionToPlane = _dirMax + (time random 270);
if (_missionToPlane >= 360) then {
	_missionToPlane = _missionToPlane - 360;
};	
private _planeLoaction = [0, 0, 0];
_planeLoaction set [0, (_missionCenterPos select 0) + (30000 * cos _missionToPlane)];
_planeLoaction set [1, (_missionCenterPos select 1) + (30000 * sin _missionToPlane)];
_planeLoaction set [2, 1000];
private _groundLocationTemp = nearestLocations [_missionCenterPos, _locationNames, 30000];
private _groundLocation = [0, 0, 0];
{
	private _location = _x;
	private _position = getPos _location;
	private _isGood = false;
	if (((_position distance _missionCenterPos) > (_missionAreaRadius * 1.5)) && ((_position distance _missionPlayerPos) > 2000)/* && !(surfaceIsWater _position)*/) then {
		_isGood = true;
		{
			if ((_position distance (getPos _x)) < 2000) then {
				_isGood = false;
			};
		} forEach (allPlayers - entities "HeadlessClient_F");
	};
	if (_isGood) exitWith {
		_groundLocation = _position;
	};
} forEach _groundLocationTemp;
diag_log format ["orbis_mission_environment missionLoop planeLoaction: %1, groundLocation: %2", _planeLoaction, _groundLocation];

// spawn reinforcing units
private _groups = [];

while {{(_x select 2) <= _pointDistribution select 0} count orbis_mission_planeArray > 0} do { // plane
	private _thisSpawn = selectRandom (orbis_mission_planeArray select {(_pointDistribution select 0) >= (_x select 2)});
	private _spawnLocation = [[_planeLoaction, 300]] call BIS_fnc_randomPos;

	if (_spawnLocation isEqualTo []) exitWith {};

	private _group = createGroup _objectSide;
	private _vehicle = ([_spawnLocation, _spawnLocation getDir _missionCenterPos, _thisSpawn select 1, _group] call BIS_fnc_spawnVehicle) select 0;
	private _waypoint = _group addWaypoint [_missionCenterPos, _missionAreaRadius * 3];
	_waypoint setWaypointType "SAD";
	_group setCombatMode "RED";
	_vehicle flyInHeight (300 + time random 1500);

	_groups append [_group];
	_pointDistribution set [0, (_pointDistribution select 0) - (_thisSpawn select 2)];

	private _frameNo = diag_frameNo;
	waitUntil {diag_frameNo > _frameNo};
};

while {{(_x select 2) <= _pointDistribution select 1} count orbis_mission_heliArray > 0} do { // heli
	private _thisSpawn = selectRandom (orbis_mission_heliArray select {(_pointDistribution select 1) >= (_x select 2)});
	private _spawnLocation = _groundLocation findEmptyPosition [100, 1000, _thisSpawn select 1];

	if (_spawnLocation isEqualTo []) exitWith {};

	_spawnLocation set [2, 30];
	private _group = createGroup _objectSide;
	private _vehicle = ([_spawnLocation, _spawnLocation getDir _missionCenterPos, _thisSpawn select 1, _group] call BIS_fnc_spawnVehicle) select 0;
	private _waypoint = _group addWaypoint [_missionCenterPos, _missionAreaRadius];
	_waypoint setWaypointType "SAD";
	_group setCombatMode "RED";

	_groups append [_group];
	_pointDistribution set [1, (_pointDistribution select 1) - (_thisSpawn select 2)];

	private _frameNo = diag_frameNo;
	waitUntil {diag_frameNo > _frameNo};
};

while {{(_x select 2) <= _pointDistribution select 2} count orbis_mission_tankArray > 0} do { // tank
	private _thisSpawn = selectRandom (orbis_mission_tankArray select {(_pointDistribution select 2) >= (_x select 2)});
	private _spawnLocation = _groundLocation findEmptyPosition [100, 1000, _thisSpawn select 1];

	if (_spawnLocation isEqualTo []) exitWith {};

	private _group = createGroup _objectSide;
	private _vehicle = ([_spawnLocation, _spawnLocation getDir _missionCenterPos, _thisSpawn select 1, _group] call BIS_fnc_spawnVehicle) select 0;
	private _waypoint = _group addWaypoint [_missionCenterPos, _missionAreaRadius];
	_waypoint setWaypointType "SAD";
	_group setCombatMode "RED";

	_groups append [_group];
	_pointDistribution set [2, (_pointDistribution select 2) - (_thisSpawn select 2)];

	private _frameNo = diag_frameNo;
	waitUntil {diag_frameNo > _frameNo};
};

while {{(_x select 2) <= _pointDistribution select 3} count orbis_mission_vehicleArray > 0} do { // vehicle
	private _thisSpawn = selectRandom (orbis_mission_vehicleArray select {(_pointDistribution select 3) >= (_x select 2)});
	private _spawnLocation = _groundLocation findEmptyPosition [100, 1000, _thisSpawn select 1];

	if (_spawnLocation isEqualTo []) exitWith {};

	private _group = createGroup _objectSide;
	private _vehicle = ([_spawnLocation, _spawnLocation getDir _missionCenterPos, _thisSpawn select 1, _group] call BIS_fnc_spawnVehicle) select 0;
	private _waypoint = _group addWaypoint [_missionCenterPos, _missionAreaRadius];
	_waypoint setWaypointType "SAD";
	_group setCombatMode "RED";

	_groups append [_group];
	_pointDistribution set [3, (_pointDistribution select 3) - (_thisSpawn select 2)];

	private _frameNo = diag_frameNo;
	waitUntil {diag_frameNo > _frameNo};
};

while {{(_x select 2) <= _pointDistribution select 4} count orbis_mission_infArray > 0} do { // inf
	private _thisSpawn = selectRandom (orbis_mission_infArray select {(_pointDistribution select 4) >= (_x select 2)});
	private _thisSpawnTransport = selectRandom (orbis_mission_transport + orbis_mission_truckArray);
	private _spawnLocation = _groundLocation findEmptyPosition [100, 1000, _thisSpawnTransport select 1];

	if (_spawnLocation isEqualTo []) exitWith {};

	private _group = createGroup _objectSide;
	private _transport = ([_spawnLocation, _spawnLocation getDir _missionCenterPos, _thisSpawnTransport select 1, _group] call BIS_fnc_spawnVehicle) select 0;
	private _groupInf = [_spawnLocation, _objectSide, _thisSpawn select 0] call BIS_fnc_spawnGroup;
	{
		_x moveInCargo _transport;
	} forEach (units _groupInf);
	private _waypointTR = _group addWaypoint [_missionCenterPos, _missionAreaRadius];
	private _waypointSAD = _group addWaypoint [_missionCenterPos, _missionAreaRadius];
	private _waypointInf = _groupInf addWaypoint [_missionCenterPos, _missionAreaRadius];
	_waypointTR setWaypointType "TR UNLOAD";
	_waypointSAD setWaypointType "SAD";
	_waypointInf setWaypointType "SAD";
	_group setCombatMode "RED";
	_groupInf setCombatMode "RED";

	_groups append [_group, _groupInf];
	_pointDistribution set [4, (_pointDistribution select 4) - (_thisSpawn select 2)];

	private _frameNo = diag_frameNo;
	waitUntil {diag_frameNo > _frameNo};
};

// add spawned units to curator
{
	private _curator = _x;
	{
		_curator addCuratorEditableObjects [units _x, true];
	} forEach _groups;
} forEach allCurators;

// return leftover points
diag_log format ["orbis_mission_environment missionLoop pointLeftover: %1", _pointDistribution];
{
	_points = _points + (_x * RETURN_RATIO);
	_pointDistribution set [_forEachIndex, _x * (1 - RETURN_RATIO)];
} forEach _pointDistribution;

// pause script for a moment
private _sleepTime = 300 + (time random 600); // 5 ~ 15 min
private _timeSave = time;
diag_log format ["orbis_mission_environment missionLoop sleepTime: %1", _sleepTime];
sleep _sleepTime;

// check if objects are still running
private _objects = entities [[], ["Logic"], true] select {typeOf _x isEqualTo "MCC_ModuleObjective_F"};
private _isRunning = !(_objects apply {_x getVariable ["RscAttributeTaskState", ""] in ["Succeeded", "Failed"]} isEqualTo [true, true, true]);
diag_log format ["orbis_mission_environment missionLoop isRunning: %1", _isRunning];

if (_isRunning) then { // start the next loop or end & set weather changes
	[_timeSave, _points, _pointDistribution, _factionArray] spawn orbis_mission_fnc_missionLoop;
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
