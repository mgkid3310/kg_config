class Extended_PreStart_EventHandlers {
	class kg_vvs_points {
		init = "call compile preProcessFileLineNumbers 'kg_vvs_points\XEH_preStart.sqf'";
	};
}; 

class Extended_PreInit_EventHandlers {
	class kg_vvs_points {
		init = "call compile preProcessFileLineNumbers 'kg_vvs_points\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {
	class kg_vvs_points {
		init = "call compile preProcessFileLineNumbers 'kg_vvs_points\XEH_postInit.sqf'";
	};
};
