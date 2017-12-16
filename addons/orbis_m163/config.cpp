
class CfgPatches {

	class M163_VADS {
		units[] = {"M163_Machbet_US", "M163_Machbet_USMC", "M163A1_US", "M163A1_USMC"};
		weapons[] = {"TGW_M168"};
		requiredVersion = 1.540000;
		requiredAddons[] = {"rhsusf_c_airweapons", "rhsusf_c_m113"};
		version = "2011-11-09";
		authors[] = {"Xeno426"};
		fileName = "M163_VADS.pbo";
	};
};

/* class CfgMods {

	class M163_VADS {
		name = "M163 VADS";
		picture = "mod.paa";
		action = "http://thegamewardens.net";
	};
};

class CfgAddons {

	class M163_VADS {
		list = {"M163 VADS"};
	};
}; */
/*extern*/ class RscText;

class RscIGUIText: RscText {
};

class RscOpticsText: RscText {
};

class RscOpticsValue: RscOpticsText {
};

class RscInGameUI {

	class TGW_RscUnitInfo_Machbet_gunner {
		idd = 300;
		controls[] = {"CA_Distance", "CA_Compass", "CA_Heading", "CA_BalisticComputer", "CA_BallRange", "CA_LaserMarker", "CA_WeaponZeroingText", "CA_WeaponZeroing"};

		class CA_WeaponZeroingText: RscIGUIText {
			idc = 169;
			style = 0;
			x = "(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y = "0.095 + SafeZoneY";
			w = 0.214000;
			h = 0.039000;
			SizeEx = 0.034000;
			text = "$STR_DISP_ZEROING";
		};

		class CA_WeaponZeroing: RscIGUIText {
			idc = 168;
			style = 1;
			x = "(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y = "0.095 + SafeZoneY";
			w = 0.214000;
			h = 0.039000;
			SizeEx = 0.034000;
		};

		class CA_Distance: RscOpticsValue {
			idc = 151;
			x = 0.438000;
			y = 0.908000;
			w = 0.123000;
			style = 2;
		};

		class CA_LaserMarker: RscOpticsText {
			idc = 158;
			x = 0.270000;
			y = 0.908000;
			w = 0.154000;
			text = "LASE TRGT";
		};

		class CA_BallRange: RscOpticsValue {
			idc = 164;
			x = 0.626000;
			y = 0.908000;
			w = 0.300000;
		};

		class CA_BalisticComputer: RscOpticsText {
			idc = 165;
			x = 0.594000;
			y = 0.908000;
			text = "*";
			sizeEx = 0.060000;
		};

		class CA_Compass: RscOpticsText {
			idc = 155;
			x = 0;
			y = 0.700000;
			w = 0.300000;
			h = 0.050000;
		};

		class CA_Heading: RscOpticsText {
			idc = 156;
			x = 0;
			y = 0.750000;
			w = 0.300000;
			h = 0.050000;
		};
	};

	class TGW_RscUnitInfo_Vulcan_gunner {
		idd = 300;
		controls[] = {"CA_Distance", "CA_Compass", "CA_Heading", "CA_BallRange", "CA_WeaponZeroingText", "CA_WeaponZeroing"};

		class CA_WeaponZeroingText: RscIGUIText {
			idc = 169;
			style = 0;
			x = "(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y = "0.095 + SafeZoneY";
			w = 0.214000;
			h = 0.039000;
			SizeEx = 0.034000;
			text = "$STR_DISP_ZEROING";
		};

		class CA_WeaponZeroing: RscIGUIText {
			idc = 168;
			style = 1;
			x = "(SafeZoneW + SafeZoneX) - (1 - 0.761)";
			y = "0.095 + SafeZoneY";
			w = 0.214000;
			h = 0.039000;
			SizeEx = 0.034000;
		};

		class CA_Distance: RscOpticsValue {
			idc = 151;
			x = 0.438000;
			y = 0.908000;
			w = 0.123000;
			style = 2;
		};

		class CA_LaserMarker: RscOpticsText {
			idc = 158;
			x = 0.270000;
			y = 0.908000;
			w = 0.154000;
			text = "LASE TRGT";
		};

		class CA_BallRange: RscOpticsValue {
			idc = 164;
			x = 0.626000;
			y = 0.908000;
			w = 0.300000;
		};

		class CA_BalisticComputer: RscOpticsText {
			idc = 165;
			x = 0.594000;
			y = 0.908000;
			text = "*";
			sizeEx = 0.060000;
		};

		class CA_Compass: RscOpticsText {
			idc = 155;
			x = 0;
			y = 0.700000;
			w = 0.300000;
			h = 0.050000;
		};

		class CA_Heading: RscOpticsText {
			idc = 156;
			x = 0;
			y = 0.750000;
			w = 0.300000;
			h = 0.050000;
		};
	};
};

class CfgMovesBasic {
	/*extern*/ class DefaultDie;

	class ManActions {
		M113_Driver = "M113_Driver";
		M113_DriverOut = "M113_DriverOut";
		M163_Gunner = "M163_Gunner";
		M163_GunnerOut = "M163_GunnerOut";
	};
};

class CfgMovesMaleSdr: CfgMovesBasic {

	class States {
		/*extern*/ class Crew;

		class KIA_M113_Driver: DefaultDie {
			actions = "DeadActions";
			file = "M163_VADS\Data\Anim\KIA_M113_Driver.rtm";
			connectTo[] = {"DeadState", 0.100000};
			speed = 0.500000;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
		};

		class M113_Driver: Crew {
			file = "M163_VADS\Data\Anim\M113_Driver.rtm";
			interpolateTo[] = {"KIA_M113_Driver", 1};
		};

		class KIA_M113_DriverOut: DefaultDie {
			actions = "DeadActions";
			file = "M163_VADS\Data\Anim\KIA_M113_DriverOut.rtm";
			connectTo[] = {"DeadState", 0.100000};
			speed = 0.500000;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
		};

		class M113_DriverOut: Crew {
			file = "M163_VADS\Data\Anim\M113_DriverOut.rtm";
			interpolateTo[] = {"KIA_M113_DriverOut", 1};
		};

		class KIA_M163_Gunner: DefaultDie {
			actions = "DeadActions";
			file = "M163_VADS\Data\Anim\KIA_M163_Gunner.rtm";
			connectTo[] = {"DeadState", 0.100000};
			speed = 0.500000;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
		};

		class M163_Gunner: Crew {
			file = "M163_VADS\Data\Anim\M163_Gunner.rtm";
			interpolateTo[] = {"KIA_M163_Gunner", 1};
		};

		class M163_GunnerOut: M163_Gunner {
			file = "M163_VADS\Data\Anim\M163_Gunner.rtm";
		};
	};
};

class CfgVehicles {
	/*extern*/ class LandVehicle;

	class Tank: LandVehicle {
		/*extern*/ class NewTurret;
		/*extern*/ class Sounds;
		/*extern*/ class HitPoints;
	};

	class Tank_F: Tank {

		class Turrets {

			class MainTurret: NewTurret {

				class Turrets {
					/*extern*/ class CommanderOptics;
				};
			};
		};
		/*extern*/ class CommanderOptics;
		/*extern*/ class AnimationSources;
		/*extern*/ class ViewPilot;
		/*extern*/ class ViewOptics;
		/*extern*/ class ViewCargo;
		/*extern*/ class HeadLimits;

		class HitPoints: HitPoints {
			/*extern*/ class HitHull;
			/*extern*/ class HitEngine;
			/*extern*/ class HitLTrack;
			/*extern*/ class HitRTrack;
		};

		class Sounds: Sounds {
			/*extern*/ class Engine;
			/*extern*/ class Movement;
		};
	};

	class APC_Tracked_02_base_F: Tank_F {
		/*extern*/ class EventHandlers;
	};

	class rhsusf_m113tank_base: APC_Tracked_02_base_F {
		class AnimationSources: AnimationSources {};
		class Turrets: Turrets {};
	};

	class M163A1_Base: rhsusf_m113tank_base {
		scope = 0;
		displayName = "$STR_DN_VULCAN";
		accuracy = 0.300000;
		cost = 1000000;
		vehicleClass = "rhs_vehclass_apc_wd";
		model = "M163_VADS\M163_Vulcan";
		picture = "\M163_VADS\Data\ico\picture_vulcan_ca.paa";
		Icon = "\M163_VADS\Data\ico\icomap_vulcan_CA.paa";
		mapSize = 6;
		armor = 200;
		irScanRangeMin = 10;
		irScanRangeMax = 4000;
		irScanGround = 0;
		gunnerCanSee = 31;
		hasCommander = 0;
		driverForceOptics = 0;
		supplyRadius = 0;
		memoryPointExhaust = "vyfuk start";
		memoryPointExhaustDir = "vyfuk konec";
		selectionBrakeLights = "brzdove svetlo";

		class Turrets: Turrets {

			class MainTurret: MainTurret {
				radarType = 4;
				outGunnerMayFire = 1;
				forceHideGunner = 1;
				viewGunnerInExternal = 1;
				weapons[] = {"TGW_M168"};
				magazines[] = {"TGW_1100Rnd_20mm_M246", "TGW_1100Rnd_20mm_M246"};
				minElev = -5;
				maxElev = 80;
				minTurn = -360;
				maxTurn = 360;
				gunnerAction = "M163_GunnerOut";
				gunnerInAction = "M163_Gunner";
				gunnerOpticsModel = "\ca\weapons\2Dscope_RUAA8";
				gunnerOpticsEffect[] = {"TankGunnerOptics1", "OpticsBlur2", "OpticsCHAbera3"};
				turretInfoType = "TGW_RscUnitInfo_Vulcan_gunner";
				discreteDistance[] = {200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000};
				discreteDistanceInitIndex = 2;

				class ViewOptics {
					initAngleX = 0;
					minAngleX = -30;
					maxAngleX = 30;
					initAngleY = 0;
					minAngleY = -100;
					maxAngleY = 100;
					initFov = 0.420000;
					minFov = 0.120000;
					maxFov = 0.640000;
					visionMode[] = {"Normal", "NVG"};
				};
			};
		};
		threat[] = {1, 0.500000, 0.950000};
		typicalCargo[] = {"SoldierWCrew", "SoldierWCrew"};
		transportSoldier = 0;
		transportMaxMagazines = 0;
		transportMaxWeapons = 0;
		viewDriverShadow = 1;

		class AnimationSources: AnimationSources {

			class Cannon {
				source = "revolving";
				weapon = "TGW_M168";
			};
		};

		/* class Damage {
			tex[] = {};
			mat[] = {"M163_VADS\data\detailmapy\m163_01_metal.rvmat", "M163_VADS\data\detailmapy\m163_01_metal_damage.rvmat", "M163_VADS\data\detailmapy\m163_01_metal_destruct.rvmat", "M163_VADS\data\detailmapy\m163_02_metal.rvmat", "M163_VADS\data\detailmapy\m163_02_metal_damage.rvmat", "M163_VADS\data\detailmapy\m163_02_metal_destruct.rvmat", "Ca\Tracked_E\M113\Data\m113_track.rvmat", "Ca\Tracked_E\M113\Data\m113_track.rvmat", "Ca\Tracked_E\M113\Data\m113_track_destruct.rvmat", "Ca\Tracked_E\M113\Data\cargo.rvmat", "Ca\Tracked_E\M113\Data\cargo.rvmat", "Ca\Tracked_E\M113\Data\cargo_destruct.rvmat", "Ca\Tracked_E\M113\Data\walls.rvmat", "Ca\Tracked_E\M113\Data\walls.rvmat", "M163_VADS\data\walls_destruct.rvmat", "Ca\Ca_E\data\default.rvmat", "Ca\Ca_E\data\default.rvmat", "Ca\Ca_E\data\default_destruct.rvmat"};
		}; */
		// driverOpticsModel = "\ca\Tracked\optika_tank_driver";
		driverAction = "M113_DriverOut";
		driverInAction = "M113_Driver_EP1";

		class ViewPilot: ViewPilot {
			minAngleY = -80;
			maxAngleY = 80;
			minAngleX = -45;
		};

		class Library {
			libTextDesc = "$STR_LIB_VULCAN";
		};
		hiddenSelections[] = {"camo1", "camo2"};
		hiddenSelectionsTextures[] = {"\M163_VADS\data\m163_vulcan_01_co.paa", "\M163_VADS\data\m163_vulcan_02_co.paa"};

		class NVGMarkers {

			class NVGMarker01 {
				name = "nvg_marker";
				color[] = {0.030000, 0.003000, 0.003000, 1};
				ambient[] = {0.003000, 0.000300, 0.000300, 1};
				brightness = 0.001000;
				blinking = 1;
			};
		};

		class Reflectors {

			class Reflector {
				color[] = {0.800000, 0.800000, 1.000000, 1.000000};
				ambient[] = {0.070000, 0.070000, 0.070000, 1.000000};
				position = "l svetlo";
				direction = "konec L svetla";
				hitpoint = "l svetlo";
				selection = "l svetlo";
				size = 0.600000;
				brightness = 2;
			};

			class Reflector2 {
				color[] = {0.800000, 0.800000, 1.000000, 1.000000};
				ambient[] = {0.070000, 0.070000, 0.070000, 1.000000};
				position = "p svetlo";
				direction = "konec P svetla";
				hitpoint = "p svetlo";
				selection = "p svetlo";
				size = 0.600000;
				brightness = 2;
			};
		};
	};

	class M163A1_US: M163A1_Base {
		scope = 2;
		side = 1;
		faction = "rhs_faction_usarmy_wd";
		crew = "rhsusf_army_ocp_crewman";
		typicalCargo[] = {"rhsusf_army_ocp_crewman", "rhsusf_army_ocp_crewman"};
		hiddenSelectionsTextures[] = {"\M163_VADS\data\m163_vulcan_desert_01_co.paa", "\M163_VADS\data\m163_vulcan_desert_02_co.paa"};

		class Armory {
			author = "$STR_AUTHOR_BIS";
		};
	};

	class M163A1_USMC: M163A1_Base {
		scope = 2;
		side = 1;
		faction = "USMC";
		crew = "USMC_Soldier_Crew";
		typicalCargo[] = {"USMC_Soldier_Crew", "USMC_Soldier_Crew"};

		class Armory {
			author = "$STR_AUTHOR_BIS";
		};
	};

	class M163_Machbet_Base: M163A1_Base {
		scope = 0;
		accuracy = 0.300000;
		displayName = "$STR_TGW_DN_MACHBET";
		model = "\M163_VADS\M163_Machbet";
		picture = "\M163_VADS\Data\ico\picture_machbet_ca.paa";
		Icon = "\M163_VADS\Data\ico\icomap_machbet_ca.paa";
		mapSize = 6;
		irScanRangeMax = 5000;
		threat[] = {1, 0.500000, 1};

		class Turrets: Turrets {

			class MainTurret: MainTurret {
				weapons[] = {"TGW_M168", "StingerLaucher_4x"};
				magazines[] = {"TGW_1100Rnd_20mm_M246", "4Rnd_Stinger", "4Rnd_Stinger", "4Rnd_Stinger"};
				turretInfoType = "TGW_RscUnitInfo_Machbet_gunner";
				gunnerOpticsModel = "\ca\weapons\2Dscope_RUAA8";
				gunnerOpticsEffect[] = {"TankGunnerOptics1", "OpticsBlur2", "OpticsCHAbera3"};
			};
		};

		class Library {
			libTextDesc = "$STR_TGW_LIB_MACHBET";
		};
		hiddenSelections[] = {"camo1", "camo2"};
		hiddenSelectionsTextures[] = {"\M163_VADS\data\m163_vulcan_01_co.paa", "\M163_VADS\data\m163_vulcan_02_co.paa"};
	};

	class M163_Machbet_US: M163_Machbet_Base {
		scope = 2;
		side = 1;
		faction = "BIS_US";
		crew = "US_Soldier_Crew_EP1";
		typicalCargo[] = {"US_Soldier_Crew_EP1", "US_Soldier_Crew_EP1"};
		hiddenSelectionsTextures[] = {"\M163_VADS\data\m163_vulcan_desert_01_co.paa", "\M163_VADS\data\m163_vulcan_desert_02_co.paa"};

		class Armory {
			author = "$STR_AUTHOR_BIS";
		};
	};

	class M163_Machbet_USMC: M163_Machbet_Base {
		scope = 2;
		side = 1;
		faction = "USMC";
		crew = "USMC_Soldier_Crew";
		typicalCargo[] = {"USMC_Soldier_Crew", "USMC_Soldier_Crew"};

		class Armory {
			author = "$STR_AUTHOR_BIS";
		};
	};
};

class CfgAmmo {
	/*extern*/ class rhsusf_M61A2;
	/*extern*/ class BulletBase;

	class TGW_M246_B_20mm_AA: rhsusf_M61A2 {
		hit = 74;
		indirectHit = 20;
		indirectHitRange = 0.500000;
		typicalspeed = 1030;
		cost = 50;
		visibleFire = 38;
		audibleFire = 38;
		tracerScale = 1.850000;
		airFriction = -0.000950;
		timeToLive = 8;
		caliber = 1.390000;
	};

	class TGW_M56_B_20mm_AA: rhsusf_M61A2 {
		typicalspeed = 1030;
		hit = 50;
		indirectHit = 25;
		indirectHitRange = 2;
		airFriction = -0.000770;
	};
};

class CfgMagazines {
	/*extern*/ class rhsusf_20mm_M61A2;

	class TGW_1100Rnd_20mm_M246: rhsusf_20mm_M61A2 {
		scope = 2;
		ammo = "TGW_M246_B_20mm_AA";
		displayName = "$STR_TGW_MN_M246";
		count = 1100;
		maxLeadSpeed = 500;
		tracersEvery = 3;
		lastRoundsTracer = 0;
	};

	class TGW_1100Rnd_20mm_M56: rhsusf_20mm_M61A2 {
		scope = 2;
		ammo = "TGW_M56_B_20mm_AA";
		count = 1100;
		displayName = "$STR_TGW_MN_M56";
		maxLeadSpeed = 500;
		tracersEvery = 0;
	};

	class TGW_1100Rnd_20mm_M242: TGW_1100Rnd_20mm_M56 {
		scope = 2;
		displayName = "$STR_TGW_MN_M242";
		tracersEvery = 3;
	};
};

class cfgWeapons {
	class rhsusf_M61A2;

	class TGW_M168: rhsusf_M61A2 {
		scope = 2;
		displayName = "$STR_TGW_DN_M168";
		magazines[] = {"TGW_1100Rnd_20mm_M246", "2100Rnd_20mm_M168", "TGW_1100Rnd_20mm_M56", "TGW_1100Rnd_20mm_M242"};
		magazineReloadTime = 120;
		WeaponEffects = "WarFXPE_GAU8";
	};
};

enum {
	destructengine = 2,
	destructdefault = 6,
	destructwreck = 7,
	destructtree = 3,
	destructtent = 4,
	stabilizedinaxisx = 1,
	stabilizedinaxisy = 2,
	stabilizedinaxesboth = 3,
	destructno = 0,
	stabilizedinaxesnone = 0,
	destructman = 5,
	destructbuilding = 1
}
