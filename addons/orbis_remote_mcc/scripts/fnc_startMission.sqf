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

private _locationNames = ["NameCity", "NameCityCapital", "NameVillage", "NameLocal", "Hill", "Mount", "Airport"];
private _misisonLocation = nearestLocations [getPos _player, _locationNames, 50000] select {getPos _x distance getPos _player > 3500} call BIS_fnc_selectRandom;
private _misisonArea = [getPos _misisonLocation, name _misisonLocation];
private _totalEnemyUnits = 100 + (count (allPlayers - entities "HeadlessClient_F") * 5);

private _bluFactions = ["rhs_faction_usarmy_d", "rhs_faction_usmc_d"];
private _opfFactions = ["rhs_faction_msv", "rhs_faction_vdv"];

private _sidePlayer = side _player;
private _factionPlayer = faction _player;
private _enemySide = switch (_sidePlayer) do { 
	case east: {west}; 
	case west: {east}; 
	case resistance: {""};
	case civilian: {east};
	default {""}; 
};
private _enemyfaction = switch (_enemySide) do { 
	case east: {_opfFactions call BIS_fnc_selectRandom}; 
	case west: {_bluFactions call BIS_fnc_selectRandom}; 
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
_objectsArray set [0, ["Secure HVT", "Acquire Intel"] call BIS_fnc_selectRandom];
_objectsArray set [1, ["Secure HVT", "Kill HVT", "Destroy Vehicle", "Destroy AA", "Destroy Artillery", "Destroy Weapon Cahce", "Destroy Fuel Depot", "Destroy Radar/Radio", "Acquire Intel"] call BIS_fnc_selectRandom];
_objectsArray set [2, ["Secure HVT", "Kill HVT", "Destroy Vehicle", "Destroy AA", "Destroy Artillery", "Destroy Weapon Cahce", "Destroy Fuel Depot", "Destroy Radar/Radio", "Acquire Intel"] call BIS_fnc_selectRandom];
// ["Secure HVT", "Kill HVT", "Destroy Vehicle", "Destroy AA", "Destroy Artillery", "Destroy Weapon Cahce", "Destroy Fuel Depot", "Destroy Radar/Radio", "Acquire Intel", "Capture Area"]

private _mccArray = [
	[_misisonArea, _totalEnemyUnits, 100, 1000, 0, true, 2],
	[_enemySide, _enemyfaction, _sidePlayer, _factionPlayer, _civFaction],
	_objectsArray,
	[true, true, true, true, false, false, false, false, true, false], // with cqb, civ, armor, vehicles, no stealth, ied, armored civ, suicide bomber, with roadblocks, no animals
	[[1, 2] call BIS_fnc_selectRandom, [0, 1] call BIS_fnc_selectRandom]
];

diag_log format ["orbis_remote_mcc mcc requested: %1", _mccArray];
[_enemyfaction, _enemySide] call MCC_fnc_MWCreateUnitsArray;
[_enemyfaction] call MCC_fnc_createConfigs;
_mccArray call MCC_fnc_MWinitMission;
