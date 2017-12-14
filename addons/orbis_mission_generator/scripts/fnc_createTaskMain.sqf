params ["_playerNum", "_sides"];

private _missions = missionNamespace getVariable ["orbisTasks", []];
private _taskID = (count _missions) * 100;

private _locationTypes = ["nameCityCapital", "nameCity", "nameVillage"];
private _locationsList = [];
{
	_locationsList append nearestLocations [[0, 0, 0], _x, 100000];
} forEach _locationTypes;
private _location = selectRandom (_locationsList select {[position _x, [allPlayers - entities "HeadlessClient_F"] apply {position _x}, 5000, -1] call orbis_misisons_inDistanceRange});

[_sides, "orbis_task_" + _taskID, ["You've been assigned to capture/hold this area. Do your job!", "Capture/Hold given area", "Target Area"], _location, "created", _taskID, true] call BIS_fnc_taskCreate;

missionNamespace setVariable ["orbisTasks", _missions pushback [_taskID]];

_taskID
