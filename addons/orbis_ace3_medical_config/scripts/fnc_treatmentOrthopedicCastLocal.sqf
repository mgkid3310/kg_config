#include "define_medical.hpp"
#include "script_component.hpp"

params ["_target", "_item", "_selectionName"];

//If we're not already tracking vitals, start:
[_target] call FUNC(addVitalLoop);

private _part = [_selectionName] call FUNC(selectionNameToNumber);

// private _cast = _target getVariable [QGVAR(orbis_orthopedicCast), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
private _damage = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];

// _cast set [_part, [CBA_missionTime, _damage select _part]];
_dagage set [_part, 0];
// _target setVariable [QGVAR(orbis_orthopedicCast), _sam, true];
_target setVariable [QGVAR(bodyPartStatus), _dagage, true];

[_target] call FUNC(handleDamage_advancedSetDamage);
