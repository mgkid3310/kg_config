/*
 * Author: KoffeinFlummi, Glowbal
 * Callback when the treatment fails
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 * 4: Items available <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "selectionname", "classname", ["bandage"]] call ACE_medical_fnc_treatment_failure
 *
 * Public: No
 */

#include "define_medical.hpp"
#include "script_component.hpp"

params ["_args"];
_args params ["_caller", "_target", "_selectionName", "_className", "_items", "_usersOfItems"];

// Orbis config
[_caller, _target] call orbis_fnc_clearFinished;

if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
    _caller removeWeapon "ACE_FakePrimaryWeapon";
};
if (vehicle _caller == _caller) then {
    private _lastAnim = _caller getVariable [QGVAR(treatmentPrevAnimCaller), ""];
    //Don't play another medic animation (when player is rapidily treating)
    TRACE_2("Reseting to old animation", animationState player, _lastAnim);
    switch (toLower _lastAnim) do {
        case "ainvpknlmstpslaywrfldnon_medic": {_lastAnim = "AmovPknlMstpSrasWrflDnon"};
        case "ainvppnemstpslaywrfldnon_medic": {_lastAnim = "AmovPpneMstpSrasWrflDnon"};
        case "ainvpknlmstpslaywnondnon_medic": {_lastAnim = "AmovPknlMstpSnonWnonDnon"};
        case "ainvppnemstpslaywpstdnon_medic": {_lastAnim = "AinvPpneMstpSlayWpstDnon"};
        case "ainvpknlmstpslaywpstdnon_medic": {_lastAnim = "AmovPknlMstpSrasWpstDnon"};
    };
    [_caller, _lastAnim, 2] call EFUNC(common,doAnimation);
};
_caller setVariable [QGVAR(treatmentPrevAnimCaller), nil];

private _weaponSelect = (_caller getVariable [QGVAR(selectedWeaponOnTreatment), []]);
if ((_weaponSelect params [["_previousWeapon", ""]]) && {(_previousWeapon != "") && {_previousWeapon in (weapons _caller)}}) then {
    for "_index" from 0 to 299 do {
        _caller action ["SwitchWeapon", _caller, _caller, _index];
        //Just check weapon, muzzle and mode (ignore ammo in case they were reloading)
        if (((weaponState _caller) select [0,3]) isEqualTo (_weaponSelect select [0,3])) exitWith {TRACE_1("Restoring", (weaponState _caller));};
        if ((weaponState _caller) isEqualTo ["","","","",0]) exitWith {ERROR("weaponState not found");};
    };
} else {
    _caller action ["SwitchWeapon", _caller, _caller, 299];
};

{
    _x params ["_unit", "_item"];
    _unit addItem _item;
} forEach _usersOfItems;

// Record specific callback
private _config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};

private _callback = getText (_config >> "callbackFailure");
_callback = if (isNil _callback) then {
     compile _callback
} else {
    missionNamespace getVariable _callback
};
if (!(_callback isEqualType {})) then {_callback = {TRACE_1("callback was NOT code",_callback)};};

_args call _callback;
