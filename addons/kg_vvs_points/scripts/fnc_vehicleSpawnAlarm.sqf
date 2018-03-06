params ["_spawner", "_displayName", "_cost", "_pointLeft"];

if (_spawner isEqualTo player) exitWith {};
hint format ["%1 have spawned a %2 with %3 pts\n%4 points left", name _spawner, _displayName, _cost, _pointLeft];
