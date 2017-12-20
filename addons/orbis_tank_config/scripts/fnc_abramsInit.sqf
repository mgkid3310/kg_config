params ["_vehicle"];

// init smoke reload
private _maxSmoke = {_x isEqualTo "SmokeLauncherMag"} count getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret" >> "Turrets" >> "CommanderOptics" >> "magazines");
_vehicle setVariable ["maxSmoke", _maxSmoke];
_vehicle setVariable ["smokeReserve", _maxSmoke * 6];

// add smoke reload action
private _action = [
"reloadSmoke",
"Reload Smoke",
"",
{[_this select 0] call orbis_tank_fnc_rearmSmokeScreen},
{[_this select 0] call orbis_tank_fnc_canRearmSmoke},
{},
[],
[0, 0, 0],
10
] call ace_interact_menu_fnc_createAction;

[
_vehicle,
0,
["ACE_MainActions"],
_action
] call ace_interact_menu_fnc_addActionToObject; 

/* private ["_eraNumber", "_isGone"];
waitUntil {
	_eraNumber = 1;
	_isGone = false;
	while {isClass (configfile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> format ["era_%1_hitpoint", _eraNumber])} do {
		if (_vehicle getHitPointDamage format ["era_%1_hitpoint", _eraNumber] isEqualTo 1) exitWith {
			_isGone = true;
		};
	};
	_isGone
};

_vehicle setHit ["HitHull", 0.6]; */

[_vehicle] spawn {
	private _vehicle = _this select 0;
	private _alertAmmotypes = ["ShellBase", "RocketBase", "MissileBase"];
	while {alive _vehicle} do {
		if (player in _vehicle) then {
			private _nearObjects = _vehicle nearObjects 100;
			_nearAmmos = _nearObjects select {
				private _ammo = _x;
				{
					if (typeOf _ammo isKindOf [_x, configFile >> "CfgAmmo"]) exitWith {
						true
					};
					false
				} forEach _alertAmmotypes;
			};
			{
				if (((_x distance _vehicle) / (speed _x / 3.6) < 0.2) && (_x getRelDir _vehicle < 45 || _x getRelDir _vehicle < 315)) exitWith {
					["RHSUSF_Error_High", 0.5, 2] spawn orbis_tank_fnc_repeatSound;
					sleep 2;
				};
			} forEach _nearAmmos;
		};

		private _frameNo = diag_frameNo;
		waitUntil {diag_frameNo > _frameNo};
	};
};
