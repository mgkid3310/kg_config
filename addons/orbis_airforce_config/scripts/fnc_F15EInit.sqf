private _vehicle = _this select 0;

_vehicle setVariable ["TGT_POD", "yes", true];
[_vehicle] spawn orbis_airforce_fnc_F15ELoop;
