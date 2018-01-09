diag_log format ["orbis_mission_environment missionStarted run time: %1", time];

if (missionNamespace getVariable ["misisonLoopRunning", false]) exitWith {};
missionNamespace setVariable ["misisonLoopRunning", true, true];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
missionNamespace setVariable ["playerCountInit", _playerCount, true];

// time/weather setup
private _timeChance = [["day", 0.7], ["night", 0.3]];
private _time = (_timeChance apply {_x select 0}) selectRandomWeighted (_timeChance apply {_x select 1});
/* switch (_time) do { 
	case "day": {setDate ((date set [3, 0]) set [4, 0])};
	case "night": {setDate ((date set [3, 0]) set [4, 0])};
	default {};
}; */
private _weatherChance = [["sunny", 0.5], ["cloudy", 0.2], ["rainy", 0.2], ["thunderstorm", 0.1]];
private _weather = (_weatherChance apply {_x select 0}) selectRandomWeighted (_weatherChance apply {_x select 1});
private _randomTime = 300 + (time random 1800);
switch (_weather) do { 
	case "sunny": {
		_randomTime setOvercast 0.0;
		_randomTime setRain 0.0;
		10 setRainbow 0;
	};
	case "cloudy": {
		_randomTime setOvercast 0.6;
		_randomTime setRain 0.0;
		10 setRainbow 0;
	};
	case "rainy": {
		_randomTime setOvercast 0.8;
		_randomTime setRain 0.3;
		10 setRainbow 0;
	};
	case "thunderstorm": {
		_randomTime setOvercast 1.0;
		_randomTime setRain 0.6;
		10 setRainbow 0;
	};
	default {};
};
missionNamespace setVariable ["timeAndWeather", [_time, _weather], true];
diag_log format ["orbis_mission_environment missionStarted timeAndWeather: %1", [_time, _weather]];

private _sleepTime = 1800 + (time random 1800); // 30 ~ 60 min
diag_log format ["orbis_mission_environment missionStarted sleepTime: %1", _sleepTime];
sleep _sleepTime;

(_this select 3) call orbis_mission_fnc_setupUnits;
missionNamespace setVariable ["missionCenterPos", _this select 0];
missionNamespace setVariable ["missionAreaRadius", _this select 1];
missionNamespace setVariable ["missionPlayerPos", getPos (_this select 2)];
missionNamespace setVariable ["missionStartTime", time];
[time, 0, _this select 3] spawn orbis_mission_fnc_missionLoop;
