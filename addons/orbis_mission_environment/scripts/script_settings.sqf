// define unit scores
#define PLANE_SCORE 10
#define HELI_SCORE 5
#define TANK_SCORE 5
#define VEHICLE_SCORE 3
#define INF_SCORE 1

// point settings
#define POINT_MULTIPLIER 0.1 // 60 points / player / 10min
#define PLANE_POINT 100
#define HELI_POINT 50
#define TANK_POINT 50
#define VEHICLE_POINT 30
#define INF_POINT 5

// units list
private _availFactions = [];

orbis_mission_planeArray = [];
orbis_mission_heliArray = [];
orbis_mission_tankArray = [];
orbis_mission_vehicleArray = [];
orbis_mission_infArray = [];

{
	if ((getText (_x >> "faction") in _availFactions) && (count (getArray (_x >> "magazines")) > 1)) then {
		private _class = toLower getText (_x >> "vehicleclass");
		private _simulation = toLower getText (_x >> "simulation");
		switch (_class) do { 
			case "air": {
				if (_simulation isEqualTo "helicopterrtd") then {
					orbis_mission_planeArray pushBack [configName _x, PLANE_POINT];
				} else {
					orbis_mission_heliArray pushBack [configName _x, HELI_POINT];
				};
			};
			case "armored": {orbis_mission_tankArray pushBack [configName _x, TANK_POINT]};
			case "car": {orbis_mission_vehicleArray pushBack [configName _x, VEHICLE_POINT]};
			default {};
		};
	};
} forEach (configFile >> "CfgVehicles");

{
	if (getText (_x >> "faction") in _availFactions) then {

	};
} forEach (configFile >> "CfgGroups");

orbis_mission_unitArray = orbis_mission_planeArray + orbis_mission_heliArray + orbis_mission_tankArray + orbis_mission_vehicleArray + orbis_mission_infArray;
orbis_mission_unitList = orbis_mission_unitArray apply {_x select 0};
orbis_mission_unitPrice = orbis_mission_unitArray apply {_x select 1};
