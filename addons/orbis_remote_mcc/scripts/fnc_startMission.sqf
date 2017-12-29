/* [
	[_wholeMap, _totalEnemyUnits,  _minObjectivesDistance, _maxObjectivesDistance, _weatherChange, _preciseMarkers, _playMusic],
	[_enemySide, _enemyfaction, _sidePlayer, _factionPlayer, _civFaction],
	[_obj1, _obj2, _obj3],
	[_isCQB, _isCiv, _armor, _vehicles, _stealth, _isIED, _isAS, _isSB, _isRoadblocks, _animals],
	[_reinforcement, _artillery]
] call MCC_fnc_MWinitMission; */

// ["mccRequest", [player]] call CBA_fnc_globalEvent;

if !(isServer) exitWith {};
params ["_player"];

private _misisonLocation = true; // true: any location
private _totalEnemyUnits = 100; // dummy number

private _bluFactions = ["rhs_faction_usarmy_d", "rhs_faction_usmc_d"];
private _opfFactions = ["rhs_faction_msv", "rhs_faction_vdv"];

private _sidePlayer = side _player;
private _factionPlayer = faction _player;
private _enemySide = switch (_sidePlayer) do { 
	case east: {west}; 
	case west: {east}; 
	case resistance: {""};
	case civilian: {""};
	default {""}; 
};
private _enemyfaction = switch (_sidePlayer) do { 
	case east: {_bluFactions call BIS_fnc_selectRandom}; 
	case west: {_opfFactions call BIS_fnc_selectRandom}; 
	case resistance: {""};
	case civilian: {""};
	default {""}; 
};
private _civFaction = "CIV_F";
if ((_sidePlayer isEqualTo "") || (_factionPlayer isEqualTo "") || (_enemySide isEqualTo "") || (_enemyfaction isEqualTo "") || (_civFaction isEqualTo "")) exitWith {
	systemChat "orbis_remote_mcc mcc request fail: side/faction error";
	diag_log "orbis_remote_mcc mcc request fail: side/faction error";
};

private _objectsArray = ["None", "None", "None"];
for "_i" from 0 to 2 do {
	_objectsArray set [_i, ["Destroy Vehicle","Destroy AA","Destroy Artillery","Destroy Weapon Cahce","Destroy Fuel Depot","Secure HVT","Kill HVT","Acquire Intel","Download Intel"] call BIS_fnc_selectRandom];
};

private _mccArray = [
	[_misisonLocation, _totalEnemyUnits,  100, 1000, false, true, 2],
	[_enemySide, _enemyfaction, _sidePlayer, _factionPlayer, _civFaction],
	_objectsArray,
	[true, true, true, true, false, false, false, false, true, false],
	[3, 3]
];

diag_log format ["orbis_remote_mcc mcc requested: %1", _mccArray];

_mccArray call MCC_fnc_MWinitMission;
