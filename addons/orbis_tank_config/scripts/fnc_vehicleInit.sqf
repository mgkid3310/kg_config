private _vehicle = _this select 0;
private _magazine = param [1, "SmokeLauncherMag"];

// init smoke reload
private _maxSmokeMags = {_x select 0 isEqualTo _magazine} count magazinesAllTurrets _vehicle;
private _magzineAmmoCount = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
_vehicle setVariable ["maxSmokeMags", _maxSmokeMags];
_vehicle setVariable ["smokeReserve", _maxSmokeMags * _magzineAmmoCount * 6];
_vehicle setVariable ["smokeMagazine", _magazine];
_vehicle setVariable ["smokeRounds", _magzineAmmoCount];

// add smoke reload action
private _actionSmoke = [
	"reloadSmoke",
	"Rearm Smoke",
	"",
	{[_this select 0] call orbis_tank_fnc_rearmSmokeScreen},
	{[_this select 0] call orbis_tank_fnc_canRearmSmoke},
	{},
	[],
	[0, 0, 0],
	10
] call ace_interact_menu_fnc_createAction;
private _actionFlagMain = [
	"changeFlag",
	"Change Flag",
	"",
	{},
	{true},
	{},
	[],
	[0, 0, 0],
	10
] call ace_interact_menu_fnc_createAction;
private _actionFlagRemove = [
	"removeFlag",
	"Remove Flag",
	"",
	{[_this select 0, ""] call orbis_tank_fnc_setVehicleFlag},
	{(_this select 0) getVariable ["orbis_tank_flagName", ""] !isEqualTo ""},
	{},
	[],
	[0, 0, 0],
	10
] call ace_interact_menu_fnc_createAction;
private _actionFlagRed = [
	"setRedFlag",
	"Set Red Flag",
	"",
	{[_this select 0, "\A3\Data_F\Flags\Flag_red_CO.paa"] call orbis_tank_fnc_setVehicleFlag},
	{(_this select 0) getVariable ["orbis_tank_flagName", ""] !isEqualTo "\A3\Data_F\Flags\Flag_red_CO.paa"},
	{},
	[],
	[0, 0, 0],
	10
] call ace_interact_menu_fnc_createAction;
private _actionFlagGreen = [
	"setGreenFlag",
	"Set Green Flag",
	"",
	{[_this select 0, "\A3\Data_F\Flags\Flag_green_CO.paa"] call orbis_tank_fnc_setVehicleFlag},
	{(_this select 0) getVariable ["orbis_tank_flagName", ""] !isEqualTo "\A3\Data_F\Flags\Flag_green_CO.paa"},
	{},
	[],
	[0, 0, 0],
	10
] call ace_interact_menu_fnc_createAction;
private _actionFlagBlue = [
	"setBlueFlag",
	"Set Blue Flag",
	"",
	{[_this select 0, "\A3\Data_F\Flags\Flag_blue_CO.paa"] call orbis_tank_fnc_setVehicleFlag},
	{(_this select 0) getVariable ["orbis_tank_flagName", ""] !isEqualTo "\A3\Data_F\Flags\Flag_blue_CO.paa"},
	{},
	[],
	[0, 0, 0],
	10
] call ace_interact_menu_fnc_createAction;
private _actionFlagWhite = [
	"setWhiteFlag",
	"Set White Flag",
	"",
	{[_this select 0, "\A3\Data_F\Flags\Flag_white_CO.paa"] call orbis_tank_fnc_setVehicleFlag},
	{(_this select 0) getVariable ["orbis_tank_flagName", ""] !isEqualTo "\A3\Data_F\Flags\Flag_white_CO.paa"},
	{},
	[],
	[0, 0, 0],
	10
] call ace_interact_menu_fnc_createAction;

[
	_vehicle,
	0,
	["ACE_MainActions"],
	_actionSmoke
] call ace_interact_menu_fnc_addActionToObject;
[
	_vehicle,
	0,
	["ACE_MainActions"],
	_actionFlagMain
] call ace_interact_menu_fnc_addActionToObject;
[
	_vehicle,
	0,
	["ACE_MainActions", "changeFlag"],
	_actionFlagRemove
] call ace_interact_menu_fnc_addActionToObject;
[
	_vehicle,
	0,
	["ACE_MainActions", "changeFlag"],
	_actionFlagRed
] call ace_interact_menu_fnc_addActionToObject;
[
	_vehicle,
	0,
	["ACE_MainActions", "changeFlag"],
	_actionFlagGreen
] call ace_interact_menu_fnc_addActionToObject;
[
	_vehicle,
	0,
	["ACE_MainActions", "changeFlag"],
	_actionFlagBlue
] call ace_interact_menu_fnc_addActionToObject;
[
	_vehicle,
	0,
	["ACE_MainActions", "changeFlag"],
	_actionFlagWhite
] call ace_interact_menu_fnc_addActionToObject;

// start shell alert system
[_vehicle] spawn orbis_tank_fnc_shellAlert;
