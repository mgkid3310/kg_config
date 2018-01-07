private _mccArray = _this;
_mccArray params ["_arrayGeneral", "_arraySides", "_arrayObjectives", "_arrayDefines", "_arrayAssets"];

missionNamespace setVariable ["misisonLoopRunning", true, true];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
private _playerCountInit = missionNamespace getVariable ["playerCountInit", _playerCount];



private _objects = entities [[], ["Logic"], true] select {_x typeOf "MCC_ModuleObjective_F"};
private _isRunning = _objects apply {!(_x getVariable ["RscAttributeTaskState", ""] in ["Succeeded", "Failed"])} isEqualTo [];

if (_isRunning) then {
	_mccArray call orbis_mission_fnc_missionLoop;
} else {
	missionNamespace setVariable ["misisonLoopRunning", false, true];
};
