class RscDisplayFixedArsenal {
	onLoad = "['onLoad', _this, 'RscDisplayFixedArsenal', 'GUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); [] call orbis_fnc_acreArsenalOpen";
	onUnload = "['onUnload', _this, 'RscDisplayFixedArsenal', 'GUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); [] call orbis_fnc_acreArsenalExit";
};
