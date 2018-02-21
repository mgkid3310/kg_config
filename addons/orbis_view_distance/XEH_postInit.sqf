if (hasInterface) then {
	setViewDistance 10000;
	setObjectViewDistance [1600, 100];

	[
		"orbis_view_terrain",
		"SLIDER",
		["Terrain View Distance", "Sets terrain view distance"],
		"Orbis View Distance",
		[0, 10000, 10000, 0],
		nil,
		{
			setViewDistance _this;
		}
	] call CBA_Settings_fnc_init;

	[
		"orbis_view_object",
		"SLIDER",
		["Object View Distance", "Sets object view distance"],
		"Orbis View Distance",
		[0, 10000, 1600, 0],
		nil,
		{
			setObjectViewDistance [_this, getObjectViewDistance select 1];
		}
	] call CBA_Settings_fnc_init;

	[
		"orbis_view_shadow",
		"SLIDER",
		["Shadow View Distance", "Sets shadow view distance"],
		"Orbis View Distance",
		[0, 500, 100, 0],
		nil,
		{
			setObjectViewDistance [getObjectViewDistance select 0, _this];
		}
	] call CBA_Settings_fnc_init;
};
