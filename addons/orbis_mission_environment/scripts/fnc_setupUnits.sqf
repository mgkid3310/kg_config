#include "script_settings.sqf"

private _objectSide = _this select 1;
private _objectFaction = _this select 2;
private _availFactions = [_objectFaction];

// array of [_configEntry, _configName, _price, _vehicleIndex (inf only)]
orbis_mission_planeArray = [];
orbis_mission_heliArray = [];
orbis_mission_tankArray = [];
orbis_mission_vehicleArray = [];
orbis_mission_infArray = [];
orbis_mission_truckArray = [];

if (_availFactions in ["rhs_faction_msv", "rhs_faction_vdv"]) then {
	// orbis_mission_planeArray pushBack ["JS_JC_SU35", 120];
	orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "rhs_mig29s_vvs"), "rhs_mig29s_vvs", PLANE_POINT];
	// orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Su25SM_KH29_vvs"), "RHS_Su25SM_KH29_vvs", PLANE_POINT];
	// orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Su25SM_CAS_vvs"), "RHS_Su25SM_CAS_vvs", PLANE_POINT];
	// orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Su25SM_Cluster_vvs"), "RHS_Su25SM_Cluster_vvs", PLANE_POINT];

	orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi24P_CAS_vvs"), "RHS_Mi24P_CAS_vvs", HELI_POINT];
	orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi24P_AT_vvs"), "RHS_Mi24P_AT_vvs", HELI_POINT];
	orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi24V_UPK23_vvs"), "RHS_Mi24V_UPK23_vvs", HELI_POINT];
	orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi24V_FAB_vvs"), "RHS_Mi24V_FAB_vvs", HELI_POINT];
};
/* if (_availFactions in ["rhs_faction_usarmy_d", "rhs_faction_usmc_d"]) then {
	_availFactions append ["rhs_faction_usaf"];
}; */

{
	private _vehicleclass = toLower getText (_x >> "vehicleclass");
	private _simulation = toLower getText (_x >> "simulation");
	if ((getText (_x >> "faction") in _availFactions) && (count (getArray (_x >> "magazines")) > 1)) then {
		switch (_vehicleclass) do {
			case "armored": {orbis_mission_tankArray pushBack [_x, configName _x, TANK_POINT]};
			case "car": {orbis_mission_vehicleArray pushBack [_x, configName _x, VEHICLE_POINT]};
			default {};
		};
	} else {
		if (_vehicleclass isEqualTo "car") then {
			orbis_mission_truckArray pushBack [configName _x, 0];
		};
	};
} forEach (configFile >> "CfgVehicles");

private _tanks = orbis_mission_tankArray apply {_x select 0};
private _vehicels = orbis_mission_vehicleArray apply {_x select 0};
private _cars = _tanks + _vehicels;
private _trucks = orbis_mission_truckArray apply {_x select 0};

{
	private _category = _x;
	{
		private _isInf = true;
		private _vehicleIndex = -1;
		{
			if (getText (configFile >> "CfgVehicles" >> (getText (_x >> "vehicle"))) in _cars) then {
				_isInf = false;
			};
			if (getText (configFile >> "CfgVehicles" >> (getText (_x >> "vehicle"))) in _trucks) then {
				_vehicleIndex = _forEachIndex;
			};
		} forEach _x;
		if (_isInf && (_vehicleIndex >= 0)) then {
			orbis_mission_infArray pushBack [_x, configName _x, (count _x - 1) * INF_POINT, _vehicleIndex];
		};
	} forEach _category;
} forEach (configFile >> "CfgGroups" >> _objectSide >> _objectFaction);

orbis_mission_unitArray = [orbis_mission_planeArray, orbis_mission_heliArray, orbis_mission_tankArray, orbis_mission_vehicleArray , orbis_mission_infArray];
orbis_mission_unitTotal = orbis_mission_planeArray + orbis_mission_heliArray + orbis_mission_tankArray + orbis_mission_vehicleArray + orbis_mission_infArray;
orbis_mission_unitConfig = orbis_mission_unitTotal apply {_x select 0};
orbis_mission_unitList = orbis_mission_unitTotal apply {_x select 1};
orbis_mission_unitPrice = orbis_mission_unitTotal apply {_x select 2};
