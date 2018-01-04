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
private _misisonLocation = selectRandom (nearestLocations [getPos _player, _locationNames, 50000] select {getPos _x distance getPos _player > 3500});
private _misisonArea = [getPos _misisonLocation, text _misisonLocation];
private _totalEnemyUnits = 100 + (count (allPlayers - entities "HeadlessClient_F") * 5);

private _bluFactions = ["rhs_faction_usarmy_d", "rhs_faction_usmc_d"];
private _opfFactions = ["rhs_faction_msv", "rhs_faction_vdv"];

private _sidePlayer = side _player;
private _factionPlayer = faction _player;
private _enemySide = switch (_sidePlayer) do {
	case west: {east};
	case east: {west};
	case resistance: {""};
	case civilian: {east};
	default {""}; 
};
private _enemyfaction = switch (_enemySide) do {
	case west: {selectRandom _bluFactions};
	case east: {selectRandom _opfFactions};
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
private _objectData = [
	["Secure HVT", 1], ["Kill HVT", 0.6], 
	["Destroy Vehicle", 0.3], ["Destroy AA", 0.3], ["Destroy Artillery", 0.3], 
	["Destroy Weapon Cahce", 0.3], ["Destroy Fuel Depot", 0.3], ["Destroy Radar/Radio", 0.3], 
	["Acquire Intel", 1], ["Download Intel", 1], 
	["Capture Area", 0], ["Disarm IED", 1]
];
private _objectList = _objectData apply {_x select 0};
private _objectChance = _objectData apply {_x select 1};
_objectsArray set [0, selectRandom ["Secure HVT", "Acquire Intel", "Download Intel", "Disarm IED"]];
_objectsArray set [1, _objectList selectRandomWeighted _objectChance];
_objectsArray set [2, _objectList selectRandomWeighted _objectChance];

private _mccArray = [
	[_misisonArea, _totalEnemyUnits, 300, 1000, 0, true, 2],
	[_enemySide, _enemyfaction, _sidePlayer, _factionPlayer, _civFaction],
	_objectsArray,
	[true, true, true, true, false, false, false, false, true, false], // with cqb, civ, armor, vehicles, no stealth, ied, armored civ, suicide bomber, with roadblocks, no animals
	[[1, 2] call BIS_fnc_selectRandom, [0, 1] call BIS_fnc_selectRandom]
];

diag_log format ["orbis_remote_mcc mcc requested: %1", _mccArray];

[_enemyfaction, _enemySide] call MCC_fnc_MWCreateUnitsArray;
[_enemyfaction] call MCC_fnc_createConfigs;
_mccArray call MCC_fnc_MWinitMission;
