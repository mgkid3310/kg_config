// ["mccRequest", [_player, _mccArray]] call CBA_fnc_serverEvent;

if !(isServer) exitWith {
	diag_log "orbis_remote_mcc mcc request fail: startMission not running on server";
};
if !(isClass (configFile >> "CfgPatches" >> "mcc_sandbox")) exitWith {
	diag_log "orbis_remote_mcc mcc request fail: mcc is not installed";
};

params ["_player", "_mccArray"];
diag_log format ["orbis_remote_mcc mcc requested by: %1, mccArray: %2", name _player, _mccArray];

private _enemyfaction = _mccArray select 1 select 1;
private _enemySide = _mccArray select 1 select 0;
[_enemyfaction, _enemySide] call MCC_fnc_MWCreateUnitsArray;
[_enemyfaction] call MCC_fnc_createConfigs;

_mccArray call MCC_fnc_MWinitMission;
