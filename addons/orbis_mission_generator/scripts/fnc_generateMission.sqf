private _playerNum = count (allPlayers - entities "HeadlessClient_F");
private _sides = [west];

private _mainMissionID = [_sides] call orbis_missions_createTaskMain;
[_mainMissionID, _sides] call orbis_missions_CreateTaskSide;
[_mainMissionID, _sides] call orbis_missions_createEnemyMain;
[_mainMissionID, _sides] call orbis_misisons_startReinforcement;
