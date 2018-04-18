class CfgPatches {
	class orbis_ace3_medical_config {
		name = "Orbis ACE3 Medical Config";
		author = "Orbis2358";
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_main", "ace_medical", "ace_medical_menu"};
		units[] = {};
		weapons[] = {};
	};
};

#include "define_medical.hpp"
#include "script_component.hpp"

#include "CfgWeapons.hpp"
#include "ACE_Medical_Treatments.hpp"
#include "CfgEventHandlers.hpp"

class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
            #include "ACE_Medical_SelfActions.hpp"
        };

        class ACE_Actions {
            #define EXCEPTIONS exceptions[] = {"isNotSwimming"};
            #include "ACE_Medical_Actions.hpp"

            // Create a consolidates medical menu for treatment while boarded
            class ACE_MainActions {
                class Medical {
                    #undef EXCEPTIONS
                    #define EXCEPTIONS exceptions[] = {"isNotInside", "isNotSwimming"};
                    #include "ACE_Medical_Actions.hpp"
                };
            };
        };
	};
};
