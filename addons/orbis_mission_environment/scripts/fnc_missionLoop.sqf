params ["_timeOld", "_points", "_mccArray"];
_mccArray params ["_arrayGeneral", "_arraySides", "_arrayObjectives", "_arrayDefines", "_arrayAssets"];

missionNamespace setVariable ["misisonLoopRunning", true, true];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
private _playerCountInit = missionNamespace getVariable ["playerCountInit", _playerCount];
_points = _points + (time - _timeOld) * _playerCount; // 600 points / player / 10min

private _playerSideObjects = entities select {side _x isEqualTo (_arraySides select 2) && alive _x};
private _planeCount = _playerSideObjects count {_x isKindOf "Plane"};
private _heliCount = _playerSideObjects count {_x isKindOf "Helicopter"};
private _tankCount = _playerSideObjects count {_x isKindOf "Tank"};
private _vehicleCount = _playerSideObjects count {_x isKindOf "Car"};
private _infCount = _playerSideObjects count {_x isKindOf "Man"};

private _airThreat = missionNamespace getVariable ["airThreat", 0];
private _groundThreat = missionNamespace getVariable ["groundThreat", 0];
_airThreat = _airThreat + (time - _timeOld) * (_planeCount * 10 + _heliCount * 3);
_groundThreat = _groundThreat + (time - _timeOld) * (_tankCount * 10 + _vehicleCount * 2 + _infCount);
missionNamespace setVariable ["airThreat", _airThreat];
missionNamespace setVariable ["groundThreat", _groundThreat];



sleep 10;

private _objects = entities [[], ["Logic"], true] select {_x typeOf "MCC_ModuleObjective_F"};
private _isRunning = _objects apply {!(_x getVariable ["RscAttributeTaskState", ""] in ["Succeeded", "Failed"])} isEqualTo [];

if (_isRunning) then {
	[time, _points, _mccArray] spawn orbis_mission_fnc_missionLoop;
} else {
	missionNamespace setVariable ["misisonLoopRunning", false, true];
};
