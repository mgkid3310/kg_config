/*
 * Author: BaerMitUmlaut
 * Handles treatment via surgical kit per frame
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *  0: Caller <OBJECT>
 *  1: Target <OBJECT>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [[bob, kevin], 5, 5] call ACE_medical_fnc_treatmentAdvanced_surgicalKit_onProgress
 *
 * Public: No
 */

#include "define_medical.hpp"
#include "script_component.hpp"

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_caller", "_target"];

private _bandagedWounds = _target getVariable [QGVAR(bandagedWounds), []];

//In case two people stitch up one patient and the last wound has already been closed we can stop already
if (count _bandagedWounds == 0) exitWith { false };

//Has enough time elapsed that we can close another wound?
if ((_totalTime - _elapsedTime) <= (((count _bandagedWounds) - 1) * 5)) then {
	_bandagedWounds deleteAt 0;
	_target setVariable [QGVAR(bandagedWounds), _bandagedWounds, true];
};

// Any body part that has no bandaged wounds is healed to full health
private _bodyStatus = _target getVariable [QGVAR(bodyPartStatus), [0, 0, 0, 0, 0, 0]];
private _index = 0;
for "_index" from 0 to 5 do {
	if (count (_bandagedWounds select {_x select 2 isEqualTo _index}) isEqualTo 0) then {
		_bodyStatus set [_index, 0];
	};
};

_target setVariable [QGVAR(bodyPartStatus), _bodyStatus, true];
[_target] call FUNC(handleDamage_advancedSetDamage);

true