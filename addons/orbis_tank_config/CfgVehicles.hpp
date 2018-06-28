class ACE_Actions;
class ACE_MainActions;

class CfgVehicles {
	class LandVehicle;
	class Car: LandVehicle {};
	class Car_F: Car {};
	class MRAP_01_base_F: Car_F {
		class EventHandlers;
	};
	class Tank: LandVehicle {
		class NewTurret;
		class HitPoints;
	};
	class Tank_F: Tank {
		class Turrets {
			class MainTurret: NewTurret {};
		};
		class ViewOptics;
		class HitPoints: HitPoints {
			class HitHull;
			class HitEngine;
			class HitLTrack;
			class HitRTrack;
		};
		class EventHandlers;
	};
	class APC_Tracked_02_base_F: Tank_F {};
	class APC_Tracked_03_base_F: Tank_F {};
	class MBT_01_base_F: Tank_F {};
	class MBT_01_arty_base_F: MBT_01_base_F {};

	class rhsusf_hmmwe_base: MRAP_01_base_F {
		class EventHandlers: EventHandlers {
			class orbis_config {
				init = "[_this select 0, '', true, false] spawn orbis_tank_fnc_vehicleInit;"; // [_vehicle, _magazine(smoke), _hasFlag, _hasAlert]
			};
		};
	};

	class rhsusf_RG33L_base: MRAP_01_base_F {
		class EventHandlers: EventHandlers {
			class orbis_config {
				init = "[_this select 0, '', true, false] spawn orbis_tank_fnc_vehicleInit;";
			};
		};
	};

	class rhsusf_m113tank_base: APC_Tracked_02_base_F {
		armor = 600; // 200
		armorStructural = 1050; // 350
		class HitPoints: HitPoints {
			class HitHull: HitHull {
				armor = 5.900000;
				material = -1;
				name = "telo";
				visual = "zbytek";
				passThrough = 0;
				minimalHit = 0.140000;
				explosionShielding = 0.005000;
				radius = 0.010000;
			};
			class HitEngine: HitEngine {
				armor = 0.450000;
				material = -1;
				name = "motor";
				visual = "zbytek";
				passThrough = 0;
				minimalHit = 0.039000;
				explosionShielding = 0.009000;
				radius = 0.270000;
			};
			class HitLTrack: HitLTrack {
				armor = 0.500000;
				material = -1;
				name = "pas_L";
				passThrough = 0;
				minimalHit = 0.150000;
				explosionShielding = 0.150000;
				radius = 0.300000;
			};
			class HitRTrack: HitRTrack {
				armor = 0.500000;
				material = -1;
				name = "pas_P";
				passThrough = 0;
				minimalHit = 0.150000;
				explosionShielding = 0.150000;
				radius = 0.300000;
			};
			class HitFuel {
				armor = 0.250000;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.500000;
				explosionShielding = 0.500000;
				minimalHit = 0.700000;
				radius = 0.300000;
			};
		};
		class EventHandlers: EventHandlers {
			class orbis_config {
				init = "[_this select 0, 'rhsusf_mag_L8A3_8', true, true] spawn orbis_tank_fnc_vehicleInit;";
			};
		};
		class Exhausts {
			class Exhaust1 {
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = ""; // "ExhaustsEffectBig"
			};
		};
	};

	class RHS_M2A2_Base: APC_Tracked_03_base_F {
		armor = 870; // 290
		armorStructural = 840; // 280
		class HitPoints: HitPoints {
			class HitHull: HitHull {
				armor = 0.400000;
				material = -1;
				name = "telo";
				visual = "zbytek";
				passThrough = 0;
				minimalHit = 0.080000;
				explosionShielding = 0;
				radius = 0.100000;
			};
			class HitEngine: HitEngine {
				armor = 0.450000;
				material = -1;
				name = "motor";
				visual = "zbytek";
				passThrough = 0;
				minimalHit = 0.139000;
				explosionShielding = 0.009000;
				radius = 0.170000;
			};
			class HitLTrack: HitLTrack {
				armor = 0.500000;
				material = -1;
				name = "pas_L";
				passThrough = 0;
				minimalHit = 0.150000;
				explosionShielding = 0.350000;
				radius = 0.300000;
			};
			class HitRTrack: HitRTrack {
				armor = 0.500000;
				material = -1;
				name = "pas_P";
				passThrough = 0;
				minimalHit = 0.150000;
				explosionShielding = 0.350000;
				radius = 0.300000;
			};
		};
		class EventHandlers: EventHandlers {
			class orbis_config {
				init = "[_this select 0, 'rhsusf_mag_L8A3_8', true, true] spawn orbis_tank_fnc_vehicleInit;";
			};
		};
		class Exhausts {
			class Exhaust1 {
				position = "vyfuk start";
				direction= " vyfuk konec";
				effect = ""; // "ExhaustEffectTankSide"
			};
		};
	};

	class rhsusf_m1a1tank_base: MBT_01_base_F {
		armor = 1800; // 600
		armorStructural = 1800; // 600
		class HitPoints: HitPoints {
			class HitAmmo: HitHull {
				name = "ammo";
				armor = 0.480000;
				material = -1;
				passThrough = 0;
				minimalHit = 0.140000;
				explosionShielding = 0;
				radius = 0.150000;
			};
			class HitHull: HitHull {
				armor = 0.800000;
				material = -1;
				name = "telo";
				visual = "zbytek";
				passThrough = 0;
				minimalHit = 0.140000;
				explosionShielding = 0;
				radius = 0.210000;
				depends = "HitAmmo";
			};
			class HitEngine: HitEngine {
				armor = 0.450000;
				material = -1;
				name = "motor";
				passThrough = 0;
				visual = "zbytek";
				minimalHit = 0.039000;
				explosionShielding = 0.009000;
				radius = 0.270000;
			};
			class HitLTrack: HitLTrack {
				armor = 0.500000;
				material = -1;
				name = "pas_L";
				passThrough = 0;
				minimalHit = 0.150000;
				explosionShielding = 0.500000;
				radius = 0.300000;
			};
			class HitRTrack: HitRTrack {
				armor = 0.500000;
				material = -1;
				name = "pas_P";
				passThrough = 0;
				minimalHit = 0.150000;
				explosionShielding = 0.500000;
				radius = 0.300000;
			};
		};
		class EventHandlers: EventHandlers {
			class orbis_config {
				init = "[_this select 0, 'rhsusf_mag_L8A3_12', true, true] spawn orbis_tank_fnc_vehicleInit;";
			};
		};
		class Exhausts {
			class Exhaust1 {
				position = "exhaustL1";
				direction = "exhaustL_Dir";
				effect = ""; //"RHS_ExhaustEffectTankGasBack"
			};
			class Exhaust1L {
				position = "exhaustL2";
				direction = "exhaustL_Dir";
				effect = ""; //"RHS_ExhaustEffectTankGasBack"
			};
			class Exhaust2 {
				position = "exhaustR1";
				direction = "exhaustR_Dir";
				effect = ""; //"RHS_ExhaustEffectTankGasBack"
			};
			class Exhaust2R {
				position = "exhaustR2";
				direction = "exhaustR_Dir";
				effect = ""; //"RHS_ExhaustEffectTankGasBack"
			};
		};
		/* class ACE_Actions: ACE_Actions {
			class ACE_MainActions: ACE_MainActions {
				class flipTank {
					displayName = "Flip Tank";
					condition = "{alive _x} count (crew (_this select 0)) isEqualTo 0";
					statement = "(_this select 0) setPos ((getPos (_this select 0)) vectorAdd [0, 0, 1]); (_this select 0) setVectorUp [0, 0, 1]";
					icon = "";
				};
			};
		}; */
		/* class UserActions {
			class turnTurret {
				displayName = "Turn Turret";
				position = "trunk_action";
				radius = 4;
				onlyForplayer = 0;
				condition = "(ACE_player isEqualTo commander this) && (!isTurnedOut commander this)";
				statement = "[((eyePos this) vectorAdd ((getCameraViewDirection commander this) vectorMultiply 1000))] remoteExec ";
			};
		}; */
	};

	class rhsusf_m1a2tank_base: rhsusf_m1a1tank_base {
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				class OpticsIn {
					class Wide: ViewOptics {
						initFov = "0.7/3";
						minFov = "0.7/3";
						maxFov = "0.7/3";
						visionMode[] = {"Normal", "TI"};
						thermalMode[] = {2, 3};
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2";
					};
					class Medium: Wide {
						initFov = "0.7/6";
						minFov = "0.7/6";
						maxFov = "0.7/6";
					};
					class Wide_TI: Wide {
						initFov = "0.7/10";
						minFov = "0.7/10";
						maxFov = "0.7/10";
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A1_2";
					};
					class Wide2_TI: Wide_TI {
						initFov = "0.7/13";
						minFov = "0.7/13";
						maxFov = "0.7/13";
						visionMode[] = {"TI"};
					};
					class Medium_TI: Wide_TI {
						initFov = "0.7/18";
						minFov = "0.7/18";
						maxFov = "0.7/18";
					};
					class Medium2_TI: Wide_TI {
						initFov = "0.7/25";
						minFov = "0.7/25";
						maxFov = "0.7/25";
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_3";
					};
					class Narrow_TI: Wide_TI {
						initFov = "0.7/50";
						minFov = "0.7/50";
						maxFov = "0.7/50";
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_m1a1\gunnerOptics_M1A2_4";
					};
				};
			};
		};
	};

	class rhsusf_m109tank_base: MBT_01_arty_base_F {
		class EventHandlers: EventHandlers {
			class orbis_config {
				init = "[_this select 0, '', true, true] spawn orbis_tank_fnc_vehicleInit;";
			};
		};
	};
};
