params ["_vehicle", "_flag"];

_vehicle setVariable ["orbis_tank_flagName" , _flag, true];
_vehicle forceFlagTexture _flag;
