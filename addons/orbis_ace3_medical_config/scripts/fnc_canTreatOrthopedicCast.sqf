#include "define_medical.hpp"
#include "script_component.hpp"

private _target = _this select 0;
private _part = _this select 1;
private _openOnly = param [2, false];

if !(_part isEqualType 0) then {
    _part = [_part] call FUNC(selectionNameToNumber);
};

private _openWounds = _target getVariable [QGVAR(openWounds), []];
private _bandagedWounds = [];
if !(_openOnly) then {
    _bandagedWounds = _target getVariable [QGVAR(bandagedWounds), []];
};

private _hasWound = false;
{
    if ((_x select 2) isEqualTo _part) exitWith {
        _hasWound = true;
    };
} forEach (_openWounds append _bandagedWounds);

private _damage = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];
private _hasDamage = (_damage select _part) > 0;

(_hasDamage && !_hasWound)
