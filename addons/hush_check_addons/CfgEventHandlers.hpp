class Extended_PreStart_EventHandlers {
	class hush_check_addons {
		init = "call compile preProcessFileLineNumbers 'hush_check_addons\XEH_preStart.sqf'";
	};
}; 

class Extended_PreInit_EventHandlers {
	class hush_check_addons {
		init = "call compile preProcessFileLineNumbers 'hush_check_addons\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {
	class hush_check_addons {
		init = "call compile preProcessFileLineNumbers 'hush_check_addons\XEH_postInit.sqf'";
	};
};
