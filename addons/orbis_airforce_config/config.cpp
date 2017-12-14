class CfgPatches {
	class orbis_airforce_config {
		name = "Orbis Airforce Config";
		author = "Orbis2358";
		requiredVersion = 0.1;
		requiredAddons[] = {"FIR_AirWeaponSystem_US", "FIR_A10A_F", "FIR_A10C_F", "FIR_F16_F", "FIR_F16D_F"};
		units[] = {"F16C_ROKAF_Aerobatics", "F16D_ROKAF_Aerobatics"};
		weapons[] = {};
	};
};

#include "CfgEventHandlers.hpp"

class ace_missileguidance_AttackProfiles {
	class orbis_default {
		name = "DIR";
		nameLocked = "LOBL";
		functionName = "";
	};
};

class CfgAmmo {
	class MissileBase;
	class Bo_GBU12_LGB;

	class FIR_APKWS_Rocket: MissileBase {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU10: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU12: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_EGBU12: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU24A: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU24B: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU24C: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU31: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU32: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU38: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU39: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU53: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_GBU54: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
	class FIR_PAVEWAY_IV: Bo_GBU12_LGB {
		#include "ace_missileguidance_default.hpp"
	};
};

class CfgMagazines {
	class VehicleMagazine;

	class FIR_F16C_Fueltank_P_1rnd_M: VehicleMagazine {
		hardpoints[] = {"FIR_F16_AG_HP", "FIR_Aerobatics_Side"};
	};
	class FIR_F16C_center_Fueltank_P_1rnd_M: VehicleMagazine {
		hardpoints[] = {"FIR_F16_Under_HP", "FIR_Aerobatics_Center"};
	};
	class FIR_SUU25_P_8rnd_M: VehicleMagazine {
		hardpoints[] = {"FIR_F16_Combined_HP", "FIR_F16_AG_HP", "B_BOMB_PYLON", "FIR_A10_BOMB_HP", "FIR_SH_AG_HP", "FIR_Aerobatics_Side", "FIR_Aerobatics_Wing"};
	};
	class FIR_SniperXR_1_P_1rnd_M: VehicleMagazine {
		hardpoints[] = {"FIR_F16_Aux_HP", "FIR_Aerobatics_Aux"};
	};
};

class CfgWeapons {
	class RocketPods;
	class Mk82BombLauncher;

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

class CfgVehicles {
	class Plane;
	class Plane_Base_F: Plane {
		class Components;
	};
	class Plane_CAS_01_base_F: Plane_Base_F {};
	class Plane_Fighter_03_base_F: Plane_Base_F {};

	class FIR_A10A_Base: Plane_CAS_01_base_F {
		#include "A10_UserActions.hpp"
		
		class EventHandlers {
			// init = "[_this select 0] execVM '\FIR_A10A\sqs\init\init.sqf'; _this spawn orbis_fnc_commonInit;";
		};
	};
	class FIR_A10C_Base: Plane_CAS_01_base_F {
		#include "A10_UserActions.hpp"
		
		class EventHandlers {
			// init = "[_this select 0] execVM '\FIR_A10C\sqs\init\init.sqf'; _this spawn orbis_fnc_commonInit;";
		};
	};

	class FIR_F16_Base: Plane_Fighter_03_base_F {
		#include "F16_UserActions.hpp"

		class EventHandlers {
			// init = "[_this select 0] execVM '\FIR_F16\sqs\init\init.sqf'; _this spawn orbis_fnc_commonInit;";
		};
	};
	class FIR_F16D_Base: Plane_Fighter_03_base_F {
		#include "F16_UserActions.hpp"

		class EventHandlers {
			// init = "[_this select 0] execVM '\FIR_F16D\sqs\init\init.sqf'; _this spawn orbis_fnc_commonInit;";
		};
	};

	class FIR_F16C: FIR_F16_Base {};
	class FIR_F16C_ROKAF: FIR_F16C {};
	class F16C_ROKAF_Aerobatics: FIR_F16C_ROKAF {
		displayName = "F-16C Fighting Falcon (ROKAF Aerobatics)";
		fir_f16d_custom_skin = 1;
		fir_f16d_custom_name = "ROKAF Aerobatics";
		fir_f16d_custom_code = "FIR_F16C_ROKAF_Aerobatics";
		fir_f16_custom_preview_pic = "\FIR_F16\ui\preview\pic_rokaf.paa";
		hiddenselectionstextures[] = {"FIR_F16\skin\body_rokaf_co.paa","FIR_F16\skin\wing_rokaf_co.paa","",""};
		editorPreview = "\FIR_F16\ui\preview\pic_rokaf.paa";
		weapons[] = {"FIR_MasterArm", "FIR_CMLauncher"};
		magazines[] = {"FIR_240rnd_CMFlare_Chaff_Magazine", "FIR_240rnd_CMFlare_Chaff_Magazine", "FIR_240rnd_CMFlare_Chaff_Magazine", "FIR_240rnd_CMFlare_Chaff_Magazine"};

		#include "AerobaticF16_UserActions.hpp"
		#include "AerobaticF16_Components.hpp"
		
		class EventHandlers {
			init = "[_this select 0] execVM '\FIR_F16\sqs\init\init.sqf'; _this spawn orbis_fnc_aerobaticF16Init;";
			killed = "_this call BIS_Effects_EH_Killed; ['toggleSmoke', [this, [0, 0, 0, 0]]] call CBA_fnc_globalEvent";
		};
	};

	class FIR_F16D: FIR_F16D_Base {};
	class FIR_F16D_ROKAF: FIR_F16D {};
	class F16D_ROKAF_Aerobatics: FIR_F16D_ROKAF {
		displayName = "F-16D Fighting Falcon (ROKAF Aerobatics)";
		fir_f16d_custom_skin = 1;
		fir_f16d_custom_name = "ROKAF Aerobatics";
		fir_f16d_custom_code = "FIR_F16D_ROKAF_Aerobatics";
		fir_f16d_custom_preview_pic = "\FIR_F16D\ui\preview\pic_rokaf.paa";
		hiddenselectionstextures[] = {"FIR_F16D\skin\body_rokaf_d_co.paa", "FIR_F16D\skin\wing_rokaf_co.paa"};
		editorPreview = "\FIR_F16D\ui\preview\pic_rokaf.paa";
		weapons[] = {"FIR_MasterArm", "FIR_CMLauncher"};
		magazines[] = {"FIR_240rnd_CMFlare_Chaff_Magazine", "FIR_240rnd_CMFlare_Chaff_Magazine", "FIR_240rnd_CMFlare_Chaff_Magazine", "FIR_240rnd_CMFlare_Chaff_Magazine"};

		#include "AerobaticF16_UserActions.hpp"
		#include "AerobaticF16_Components.hpp"

		class EventHandlers {
			init = "[_this select 0] execVM '\FIR_F16D\sqs\init\init.sqf'; _this spawn orbis_fnc_aerobaticF16Init;";
			killed = "_this call BIS_Effects_EH_Killed; ['toggleSmoke', [this, [0, 0, 0, 0]]] call CBA_fnc_globalEvent";
		};
	};
};
