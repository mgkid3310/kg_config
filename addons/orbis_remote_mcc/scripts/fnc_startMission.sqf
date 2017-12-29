/* [
	[_wholeMap, _totalEnemyUnits,  _minObjectivesDistance, _maxObjectivesDistance, _weatherChange, _preciseMarkers, _playMusic],
	[_enemySide, _enemyfaction, _sidePlayer, _factionPlayer, _civFaction],
	[_obj1, _obj2, _obj3],
	[_isCQB, _isCiv, _armor, _vehicles, _stealth, _isIED, _isAS, _isSB, _isRoadblocks, _animals],
	[_reinforcement, _artillery]
] call MCC_fnc_MWinitMission; */

// ["mccRequest", [player]] call CBA_fnc_globalEvent;

params ["_player"];

if !(isServer) exitWith {};

private _misisonLocation = true; // true: any location
private _totalEnemyUnits = 200; // dummy number

private _bluFactions = ["rhs_faction_usarmy_d", "rhs_faction_usmc_d"];
private _opfFactions = ["rhs_faction_msv", "rhs_faction_vdv"];

private _sidePlayer = side _player;
private _factionPlayer = faction _player;
private _enemySide = [west, east] select (_sidePlayer isEqualTo west);
private _enemyfaction = [_bluFactions, _opfFactions] select (_sidePlayer isEqualTo west) call BIS_fnc_selectRandom;
private _civFaction = "CIV_F";

private _objectsArray = ["None", "None", "None"];
for "_i" from 0 to 2 do {
	_objectsArray set [_i, ["Destroy Vehicle","Destroy AA","Destroy Artillery","Destroy Weapon Cahce","Destroy Fuel Depot","Secure HVT","Kill HVT","Acquire Intel","Download Intel"] call BIS_fnc_selectRandom];
};

[
	[_misisonLocation, _totalEnemyUnits,  100, 1000, false, true, 2],
	[_enemySide, _enemyfaction, _sidePlayer, _factionPlayer, _civFaction],
	_objectsArray,
	[true, true, true, true, false, false, false, false, true, false],
	[3, 3]
] call MCC_fnc_MWinitMission;
