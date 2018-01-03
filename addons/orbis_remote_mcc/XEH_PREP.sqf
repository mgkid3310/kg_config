orbis_mcc_fnc_startMission = compile preprocessFileLineNumbers 'orbis_remote_mcc\scripts\fnc_startMission.sqf';

// mcc functions
if (isServer) then {
	MCC_fnc_MWObjectiveIntel = compile preprocessFileLineNumbers 'orbis_remote_mcc\scripts\fnc_MWObjectiveIntel.sqf';
} else {
	MCC_fnc_pickItem = compile preprocessFileLineNumbers 'orbis_remote_mcc\scripts\fnc_pickItem.sqf';
	MCC_fnc_pickItem_general = compile preprocessFileLineNumbers 'orbis_remote_mcc\scripts\fnc_pickItem_general.sqf';
	MCC_fnc_setVehicleInit = compile preprocessFileLineNumbers 'orbis_remote_mcc\scripts\fnc_setVehicleInit.sqf';
};
