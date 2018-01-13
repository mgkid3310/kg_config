// define unit scores
#define PLANE_SCORE 10
#define HELI_SCORE 5
#define TANK_SCORE 5
#define VEHICLE_SCORE 3
#define INF_SCORE 1

// point settings
#define POINT_MULTIPLIER 1 // 300 points / 10player / 10min // 0.05
#define PLANE_POINT 100
#define HELI_POINT 50
#define TANK_POINT 50
#define VEHICLE_POINT 30
#define INF_POINT 5
orbis_misison_pointsGeneral = [PLANE_POINT, HELI_POINT, TANK_POINT, VEHICLE_POINT, INF_POINT];

#define RETURN_RATIO 0

// commander settings
orbis_mission_commanderList = [["basic", 1]];
orbis_misison_basicCommander = [1, 1, 1, 1, 1];
orbis_mission_commanderArray = [orbis_misison_basicCommander];

// other settings
#define LOCAL_MAX 216000 // 60pts * 60min
#define LOCAL_STD 36000 // 60pts * 10min
