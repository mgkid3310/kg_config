#include "define_medical.hpp"
#include "script_component.hpp"

params ["_target", "_part"];

if !(_part isEqualType 0) then {
    _part = [_part] call FUNC(selectionNameToNumber);
};

private _sam = _target getVariable [QGVAR(orbis_samSplint), [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0]]];
private _hasSAM = ((_sam select _part) select 0) > 0;

private _damage = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];
private _hasDamage = (_damage select _part) > 0;
private _bleeding = false;
{
    if (((_x select 2) isEqualTo _part) && ((_x select 4) * (_x select 3) > 0)) exitWith {
        _bleeding = true;
    };
} forEach _openWounds;

(_hasDamage && !_hasSAM && !_bleeding)
