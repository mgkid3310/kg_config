class CfgVehicles {
	class Helicopter;
	class fza_ah64base: Helicopter {
		unitinfotype = "UnitInfoHelicopter";
		/* weapons[] = {"CMFlareLauncher"};
		magazines[] = {"168Rnd_CMFlare_Chaff_Magazine"}; */
		enableManualFire = 0;
		class eventHandlers {
			init = "[_this select 0] execVM '\fza_ah64_controls\scripting\ah64d_init.sqf'; _this execVM '\kg_fza_ah64_config\scripts\init_additional.sqf'";
			GetIn = "_this execVM '\kg_fza_ah64_config\scripts\GetIn_config.sqf'";
		};
	};
	/* class fza_ah64d_b2e: fza_ah64base {
		weapons[] = {"CMFlareLauncher"};
		magazines[] = {"168Rnd_CMFlare_Chaff_Magazine"};
	}; */

	/* class UAV_02_F;
	class fza_ah64_jammer: UAV_02_F {
		armor = 10;
		camouflage = 1;
		threat[] = {0.800000, 1, 0.900000};
		class eventHandlers {
			init = "_this execVM '\kg_fza_ah64_config\scripts\Jammer_config.sqf'";
		};
	}; */
};
