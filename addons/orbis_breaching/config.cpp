class CfgPatches {
	class orbis_breaching {
		name = "Orbis Breaching";
		author = "Orbis2358";
		requiredVersion = 0.1;
		requiredAddons[] = {"ace_explosives"};
		units[] = {"orbis_breaching_explosive"};
		weapons[] = {};
	};
};

#include "CfgEventHandlers.hpp"

class CfgAmmo {
	class PipeBombBase;
	class DemoCharge_Remote_Ammo: PipeBombBase {};

	class orbis_breaching_ammo: DemoCharge_Remote_Ammo {
		ace_explosives_magazine = "orbis_braching_magazine";
		hit = 30;
        indirectHit = 30;
        indirectHitRange = 1;
	};
};

class CfgMagazines {
	class CA_Magazine;
	class SatchelCharge_Remote_Mag: CA_Magazine {};
	class DemoCharge_Remote_Mag: SatchelCharge_Remote_Mag {};

	class orbis_braching_magazine: DemoCharge_Remote_Mag {
		displayName = "Breaching Charge";
		ace_explosives_SetupObject = "orbis_breaching_explosive";
	};
};

class CfgVehicles {
	class ACE_Explosives_Place;
	class ACE_Explosives_Place_DemoCharge: ACE_Explosives_Place {};

	class orbis_breaching_explosive: ACE_Explosives_Place_DemoCharge {
		displayName = "Breaching Charge";
		class EventHandlers {
			killed = "_this spawn orbis_breaching_fnc_explosiveActivated";
		};
	};
};
