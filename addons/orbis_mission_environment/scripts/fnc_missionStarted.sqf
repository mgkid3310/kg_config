#include "script_settings.sqf"
diag_log format ["orbis_mission_environment missionStarted run time: %1", time];

if (missionNamespace getVariable ["misisonLoopRunning", false]) exitWith {};
missionNamespace setVariable ["misisonLoopRunning", true, true];

private _playerCount = count (allPlayers - entities "HeadlessClient_F");
missionNamespace setVariable ["playerCountInit", _playerCount, true];

// weather setup
private _weatherChance = [["sunny", 0.5], ["cloudy", 0.2], ["rainy", 0.2], ["thunderstorm", 0.1]];
private _weather = (_weatherChance apply {_x select 0}) selectRandomWeighted (_weatherChance apply {_x select 1});
private _weatherRandomTime = 300 + (time random 1800); // 5 ~ 35 min
diag_log format ["orbis_mission_environment missionLoop weatherRandomTime: %1", _weatherRandomTime];
switch (_weather) do { 
	case "sunny": {
		_weatherRandomTime setOvercast 0.0;
		_weatherRandomTime setRain 0.0;
		10 setRainbow 0;
	};
	case "cloudy": {
		_weatherRandomTime setOvercast 0.6;
		_weatherRandomTime setRain 0.0;
		10 setRainbow 0;
	};
	case "rainy": {
		_weatherRandomTime setOvercast 0.8;
		_weatherRandomTime setRain 0.3;
		10 setRainbow 0;
	};
	case "thunderstorm": {
		_weatherRandomTime setOvercast 1.0;
		_weatherRandomTime setRain 0.6;
		10 setRainbow 0;
	};
	default {};
};
missionNamespace setVariable ["missionWeather", _weather, true];
diag_log format ["orbis_mission_environment missionStarted weather: %1", _weather];

private _sleepTime = 300 + (time random 0); // 30 ~ 45 min // 1800 + (time random 900);
diag_log format ["orbis_mission_environment missionStarted sleepTime: %1", _sleepTime];
sleep _sleepTime;

// setup enemy commander type
private _commander = (orbis_mission_commanderList apply {_x select 0}) selectRandomWeighted (orbis_mission_commanderList apply {_x select 1});
private _commanderTendency = orbis_mission_commanderArray select (orbis_mission_commanderList apply {_x select 0} find _commander);
missionNamespace setVariable ["commanderTendency", _commanderTendency];

(_this select 3) call orbis_mission_fnc_setupUnits;
missionNamespace setVariable ["missionCenterPos", _this select 0];
missionNamespace setVariable ["missionAreaRadius", _this select 1];
missionNamespace setVariable ["missionPlayerPos", getPos (_this select 2)];
missionNamespace setVariable ["missionStartTime", time];
[time, 0, _this select 3] spawn orbis_mission_fnc_missionLoop;
