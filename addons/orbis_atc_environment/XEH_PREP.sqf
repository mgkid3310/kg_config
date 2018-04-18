// _this addAction ["Watch ATC Radar Screen", "_this call orbis_atc_fnc_radarScreenOn;", nil, 1, true, true, "", "!(_target getVariable ["orbis_atcRadarOn"])", 5];

orbis_atc_fnc_atcRadarLoop = compile preProcessFileLineNumbers "orbis_atc_environment\scripts\fnc_atcRadarLoop.sqf";
orbis_atc_fnc_createMarkers = compile preProcessFileLineNumbers "orbis_atc_environment\scripts\fnc_createMarkers.sqf"
orbis_atc_fnc_radarScreenOn = compile preProcessFileLineNumbers "orbis_atc_environment\scripts\fnc_radarScreenOn.sqf";
orbis_atc_fnc_updateMarkerSpacing = compile preProcessFileLineNumbers "orbis_atc_environment\scripts\fnc_updateMarkerSpacing.sqf";
