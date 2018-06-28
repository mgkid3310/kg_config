#include "define_medical.hpp"
#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (count _items == 0) exitWith {false};

private _part = [_selectionName] call FUNC(selectionNameToNumber);
if (_part == 0 || _part == 1) exitWith {false};

private _sam = _target getVariable [QGVAR(orbis_samSplint), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
if ((_sam select _part select 0) > 0) exitWith {false};

private _removeItem = _items select 0;
if (local _target) then {
    ["orbis_event_treatmentSAMSplintLocal", [_target, _removeItem, _selectionName]] call CBA_fnc_localEvent;
} else {
    ["orbis_event_treatmentSAMSplintLocal", [_target, _removeItem, _selectionName], _target] call CBA_fnc_targetEvent;
};

[_target, _removeItem] call FUNC(addToTriageCard);
[_target, "activity", "STR_kg_optic_medical_config_appliedSAMSplint", [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target, "activity_view", "STR_kg_optic_medical_config_appliedSAMSplint", [[_caller, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

true
