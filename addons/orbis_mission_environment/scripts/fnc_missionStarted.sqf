if (missionNamespace getVariable ["misisonLoopRunning", false]) exitWith {};

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
missionNamespace setVariable ["playerCountInit", _playerCount, true];

private _mccArray = _this;
[time, 0, _mccArray] spawn orbis_mission_fnc_missionLoop;
