["mccRequest", {_this spawn orbis_mcc_fnc_startMission;}] call CBA_fnc_addEventHandler;

// run JIP functions
private _mccJIPfunctions = missionNamespace getVariable ["mcc_jip_functions", []];
{
	(_x select 0) spawn (_x select 1);
} forEach _mccJIPfunctions;
