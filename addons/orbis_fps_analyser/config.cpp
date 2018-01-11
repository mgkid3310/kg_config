class CfgPatches {
	class orbis_fps_analyser {
		name = "Orbis FPS Analyser";
		author = "Orbis2358";
		requiredVersion = 0.1;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
	};
};

class Extended_PostInit_EventHandlers {
	class orbis_fps_analyser {
		init = "call compile preProcessFileLineNumbers 'orbis_fps_analyser\XEH_postInit.sqf'";
	};
};
