class CfgWeapons {
	class CannonCore;
	class SmokeLauncher;
	class RocketPods;
	class Mk82BombLauncher;

	class FIR_M61A2: CannonCore {
		magazines[] = {"FIR_M61A2_412rnd_M", "FIR_M61A2_480rnd_M", "FIR_M61A2_511rnd_M", "FIR_M61A2_578rnd_M", "FIR_M61A2_675rnd_M", "FIR_M61A2_940rnd_M", "FIR_M61A2_TWAS_511rnd_M", "FIR_M61A2_TWAS_Red_511rnd_M"};
	};

	class FIR_CMLauncher: SmokeLauncher {
		magazines[] = {"60Rnd_CMFlareMagazine", 
			"120Rnd_CMFlareMagazine", 
			"240Rnd_CMFlareMagazine", 
			"60Rnd_CMFlare_Chaff_Magazine", 
			"120Rnd_CMFlare_Chaff_Magazine", 
			"240Rnd_CMFlare_Chaff_Magazine", 
			"192Rnd_CMFlare_Chaff_Magazine", 
			"168Rnd_CMFlare_Chaff_Magazine", 
			"300Rnd_CMFlare_Chaff_Magazine", 
			"FIR_240rnd_CMFlare_Chaff_Magazine",
			"FIR_960rnd_CMFlare_Chaff_Magazine"
		};
	};

	class FIR_APKWS_Launcher: RocketPods {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
	class FIR_GBU10: Mk82BombLauncher {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
	class FIR_GBU12: Mk82BombLauncher {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
	class FIR_EGBU12: Mk82BombLauncher {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
	class FIR_GBU24: Mk82BombLauncher {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
	class FIR_GBU39: Mk82BombLauncher {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
	class FIR_GBU53: Mk82BombLauncher {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
	class FIR_GBU54: Mk82BombLauncher {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
	class FIR_PAVEWAY_IV: Mk82BombLauncher {
		ace_laser_canSelect = 1;
		ace_laser_showHud = 1;
	};
};
