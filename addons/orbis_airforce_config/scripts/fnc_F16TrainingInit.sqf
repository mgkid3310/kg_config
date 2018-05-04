params ["_vehicle"];

_vehicle animate ["hp2_hide", 1];
_vehicle animate ["hp3_hide", 1];
_vehicle animate ["hp7_hide", 1];
_vehicle animate ["hp8_hide", 1];

_vehicle addEventHandler ["Killed", {[_this select 0, "off"] spawn orbis_airforce_fnc_toggleSmoke;}];

[_vehicle] spawn orbis_airforce_fnc_F16TrainingLoop;
[_vehicle] spawn orbis_airforce_fnc_F16TrainingPostInit;
