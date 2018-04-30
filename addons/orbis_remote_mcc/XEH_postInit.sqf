["mccRequest", {_this call orbis_mcc_fnc_missionRequested;/* diag_log "orbis_remote_mcc mccRequest event run" */}] call CBA_fnc_addEventHandler;
// MCC_fnc_MWObjectiveIntel = compile preprocessFileLineNumbers 'orbis_remote_mcc\scripts\fnc_MWObjectiveIntel.sqf';

if !(isClass (configFile >> "CfgPatches" >> "mcc_sandbox")) then {
	["MCC", "interactionKey", ["Interaction", "Interact with objects/units in MCC"], {if (missionNameSpace getVariable ["MCC_interaction",false] && (isnull curatorcamera)) then {[false] call MCC_fnc_CBAInteractionKeybind}}, {[true] call MCC_fnc_CBAInteractionKeybind}, [219, [false,false,false]],false] call cba_fnc_addKeybind;
	[] call MCC_fnc_bdCreateManual;
};

if (isServer) then {
	// tank obj
	missionNamespace setVariable ["MCC_MWTanks", ["rhs_t90a_tv"], true];

	// AA obj
	// missionNamespace setVariable ["MCC_MWAAB", ["B_APC_Tracked_01_AA_F"], true]; // BLUFOR
	missionNamespace setVariable ["MCC_MWAAO", ["rhs_zsu234_aa"], true]; // OPFOR
	// missionNamespace setVariable ["MCC_MWAAI", ["I_APC_Wheeled_03_cannon_F"], true]; // RESISTANCE

	// Arti obj
	// missionNamespace setVariable ["MCC_MWArtilleryB", ["B_MBT_01_arty_F", "B_MBT_01_mlrs_F"], true]; // BLUFOR
	missionNamespace setVariable ["MCC_MWArtilleryO", ["rhs_2s3_tv", "rhs_2b14_82mm_vdv"], true]; // OPFOR
	// missionNamespace setVariable ["MCC_MWArtilleryI", ["I_Mortar_01_F"], true]; // RESISTANCE
};

// run JIP functions
/* private _mccJIPfunctions = missionNamespace getVariable ["mcc_jip_functions", []];
{
	(_x select 0) spawn (_x select 1);
} forEach _mccJIPfunctions; */
