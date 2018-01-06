["mccRequest", {_this spawn orbis_mcc_fnc_startMission;}] call CBA_fnc_addEventHandler;

if (isClass (configFile >> "CfgPatches" >> "mcc_sandbox")) exitWith {
	MCC_fnc_MWObjectiveIntel = compile preprocessFileLineNumbers 'orbis_remote_mcc\scripts\fnc_MWObjectiveIntel.sqf';
};

["MCC", "interactionKey", ["Interaction", "Interact with objects/units in MCC"], {if (missionNameSpace getVariable ["MCC_interaction",false] && (isnull curatorcamera)) then {[false] call MCC_fnc_CBAInteractionKeybind}}, {[true] call MCC_fnc_CBAInteractionKeybind}, [219, [false,false,false]],false] call cba_fnc_addKeybind;
[] call MCC_fnc_bdCreateManual;

// run JIP functions
private _mccJIPfunctions = missionNamespace getVariable ["mcc_jip_functions", []];
{
	(_x select 0) spawn (_x select 1);
} forEach _mccJIPfunctions;
