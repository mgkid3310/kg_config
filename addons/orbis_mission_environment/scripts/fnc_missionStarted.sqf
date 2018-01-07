if (missionNamespace getVariable ["misisonLoopRunning", false]) exitWith {};

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
missionNamespace setVariable ["playerCountInit", _playerCount, true];

private _mccArray = _this;
_mccArray call orbis_mission_fnc_missionLoop;
