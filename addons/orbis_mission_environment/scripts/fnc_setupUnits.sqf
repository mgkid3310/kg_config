#include "script_settings.sqf"

private _objectSide = _this select 1;
private _objectFaction = _this select 2;
private _availFactions = [_objectFaction];

/* private _objectSide = switch (_objectSide) do {
	case west: {east};
	case east: {west};
	case resistance: {""};
	case civilian: {east};
	default {""}; 
};
private _objectFaction = switch (_objectFaction) do {
	case west: {selectRandom _bluFactions};
	case east: {selectRandom _opfFactions};
	case resistance: {""};
	case civilian: {""};
	default {""}; 
}; */

// array of [_configEntry, _configName, _price]
orbis_mission_planeArray = [];
orbis_mission_heliArray = [];
orbis_mission_tankArray = [];
orbis_mission_vehicleArray = [];
orbis_mission_infArray = [];
orbis_mission_transport = [];
orbis_mission_truckArray = [];

if (_objectFaction in ["rhs_faction_msv", "rhs_faction_vdv"]) then {
	_availFactions append ["rhs_faction_tv"];

	// orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "JS_JC_SU35"), "JS_JC_SU35", 120];
	orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "rhs_mig29s_vvs"), "rhs_mig29s_vvs", PLANE_POINT];
	// orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Su25SM_KH29_vvs"), "RHS_Su25SM_KH29_vvs", PLANE_POINT];
	// orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Su25SM_CAS_vvs"), "RHS_Su25SM_CAS_vvs", PLANE_POINT];
	// orbis_mission_planeArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Su25SM_Cluster_vvs"), "RHS_Su25SM_Cluster_vvs", PLANE_POINT];

	orbis_mission_heliArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi24P_CAS_vvs"), "RHS_Mi24P_CAS_vvs", HELI_POINT];
	orbis_mission_heliArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi24P_AT_vvs"), "RHS_Mi24P_AT_vvs", HELI_POINT];
	orbis_mission_heliArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi24V_UPK23_vvs"), "RHS_Mi24V_UPK23_vvs", HELI_POINT];
	orbis_mission_heliArray pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi24V_FAB_vvs"), "RHS_Mi24V_FAB_vvs", HELI_POINT];

	orbis_mission_tankArray pushBack [(configFile >> "CfgVehicles" >> "rhs_t80u"), "rhs_t80u", TANK_POINT];
	orbis_mission_tankArray pushBack [(configFile >> "CfgVehicles" >> "rhs_t90a_tv"), "rhs_t90a_tv", TANK_POINT];

	orbis_mission_vehicleArray pushBack [(configFile >> "CfgVehicles" >> "rhs_btr80a_msv"), "rhs_btr80a_msv", VEHICLE_POINT];
	orbis_mission_vehicleArray pushBack [(configFile >> "CfgVehicles" >> "rhs_btr80a_vdv"), "rhs_btr80a_vdv", VEHICLE_POINT];

	orbis_mission_transport pushBack [(configFile >> "CfgVehicles" >> "RHS_Mi8mt_vdv"), "RHS_Mi8mt_vdv", 0];
	orbis_mission_truckArray pushBack [(configFile >> "CfgVehicles" >> "rhs_btr70_msv"), "rhs_btr70_msv", 0];
};

/* if (_availFactions in ["rhs_faction_usarmy_d", "rhs_faction_usmc_d"]) then {
	_availFactions append ["rhs_faction_usaf"];
}; */

/* _availFactions = _availFactions apply {toLower _x};
for "_i" from 0 to (count (configFile >> "CfgVehicles") - 1) do {
	private _config = (configFile >> "CfgVehicles") select _i;
	private _faction = toLower getText (_config >> "faction");
	private _vehicleclass = toLower getText (_config >> "vehicleclass");
	if ((_faction in _availFactions) && (count (getArray (_config >> "magazines")) > 0)) then {
		switch (_vehicleclass) do {
			case "armored": {orbis_mission_tankArray pushBack [_config, configName _config, TANK_POINT]};
			case "car": {orbis_mission_vehicleArray pushBack [_config, configName _config, VEHICLE_POINT]};
			default {};
		};
	};
}; */

for "_i" from 0 to (count (configFile >> "CfgGroups" >> _objectSide >> _objectFaction) - 1) do {
	private _category = (configFile >> "CfgGroups" >> _objectSide >> _objectFaction) select _i;
	for "_j" from 0 to (count _category - 1) do {
		private _group = _category select _j;
		private _isInf = true;
		for "_k" from 0 to (count _group - 1) do {
			private _unit = getText ((_group select _k) >> "vehicle");
			if !(toLower getText (configFile >> "CfgVehicles" >> _unit >> "category") isEqualTo "men") then {
				_isInf = false;
			};
		};
		if (_isInf) then {
			orbis_mission_infArray pushBack [_group, configName _group, (count _group) * INF_POINT];
		};
	};
};

// orbis_mission_infArray = MCC_MWGroupArrayMen apply {[configFile >> "CfgGroups" >> _objectSide >> _objectFaction, _x select 0, (_x select 1) * INF_POINT]};

orbis_mission_unitArray = [orbis_mission_planeArray, orbis_mission_heliArray, orbis_mission_tankArray, orbis_mission_vehicleArray , orbis_mission_infArray];
orbis_mission_unitTotal = orbis_mission_planeArray + orbis_mission_heliArray + orbis_mission_tankArray + orbis_mission_vehicleArray + orbis_mission_infArray;
orbis_mission_unitConfig = orbis_mission_unitTotal apply {_x select 0};
orbis_mission_unitList = orbis_mission_unitTotal apply {_x select 1};
orbis_mission_unitPrice = orbis_mission_unitTotal apply {_x select 2};
