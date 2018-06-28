#include "define_medical.hpp"
#include "script_component.hpp"

params ["_unit", "_part"];

private _sam = _target getVariable [QGVAR(orbis_orthopedicCast), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
private _damage = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];
_damage set [_part, (_damage select _part) + (_sam select _part select 1)];
_sam = _sam set [_part, [0, 0]];
_target setVariable [QGVAR(bodyPartStatus), _damage, true];
_target setVariable [QGVAR(orbis_orthopedicCast), _sam, true];

[_target] call FUNC(handleDamage_advancedSetDamage);
