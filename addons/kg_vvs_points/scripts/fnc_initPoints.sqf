private _isInit = missionNamespace getVariable ["vvsPointInit", true];

if !(_isInit) then {
	private _players = count (allPlayers - entities "HeadlessClient_F")
	private _points = linearConversion [10, 30, _players, 100, 200];
	missionNamespace setVariable ["VVScoin", _points, true];
	missionNamespace setVariable ["vvsPointInit", true, true];
} else {
	systemChat "VVS points are already given!";
};
