class Extended_PreStart_EventHandlers {
	class orbis_mission_generator {
		init = "call compile preProcessFileLineNumbers 'orbis_mission_generator\XEH_preStart.sqf'";
	};
}; 

class Extended_PreInit_EventHandlers {
	class orbis_mission_generator {
		init = "call compile preProcessFileLineNumbers 'orbis_mission_generator\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {
	class orbis_mission_generator {
		init = "call compile preProcessFileLineNumbers 'orbis_mission_generator\XEH_postInit.sqf'";
	};
};
