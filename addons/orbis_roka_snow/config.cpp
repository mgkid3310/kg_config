class CfgPatches {
	class orbis_roka_snow {
		version = 2.000000;
		units[] = {"ROKA_D_Arctic_Soldier_R", "ROKA_D_Arctic_Medic_Soldier_R", "ROKA_D_Arctic_Nato_Soldier_R"};
		weapons[] = {};
		requiredVersion = 0.100000;
		requiredAddons[] = {"roka_d", "ROKA_D_ARMOR_FIX"};
	};
};

class CfgWeapons {
	class Uniform_Base;
	class UniformItem;
	class Vest_Camo_Base;
	class ItemCore;
	class HeadgearItem;
	class H_HelmetB;

	class ROKA_D_Spec_Uniform: Uniform_Base {
		class ItemInfo;
	};
	class ROKA_D_Spec_Uniform_s: Uniform_Base {
		class ItemInfo;
	};
	class ROKA_D_Spec_Uniform_Nato: Uniform_Base {
		class ItemInfo;
	};

	class ROKA_D_Spec_PlateCarrier_IA: Vest_Camo_Base {};
	class ROKA_D_Spec_PlateCarrier_Rig_IA: Vest_Camo_Base {};
	class ROKA_D_Spec_Nato_PlateCarrier_H_IA: Vest_Camo_Base {};
	class ROKA_D_Spec_Nato_PlateCarrier_IA: Vest_Camo_Base {};

	class ROKA_D_Spec_Helmet_IA: ItemCore {};
	class ROKA_D_Boonie_B: H_HelmetB {};

	class ROKA_D_Arctic_Uniform: ROKA_D_Spec_Uniform {
		author = "KG";
		scope = 2;
		displayName = "ROKA Uniform A [Arctic]";
		picture = "\roka_D\data\ui\icon_ROKASPEC_D_Clothing_IA.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		hiddenSelections[] = {"camo", "insignia"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Clothing_IA.paa"};
		class ItemInfo: ItemInfo {
			uniformModel = "-";
			uniformClass = "ROKA_D_Arctic_Soldier_R";
			containerClass = "Supply50";
			mass = 50;
			hiddenSelections[] = {"camo", "insignia"};
		};
	};
	class ROKA_D_Arctic_Uniform_s: ROKA_D_Spec_Uniform_s {
		author = "KG";
		scope = 2;
		displayName = "ROKA Uniform B [Arctic] (Rolled up)";
		picture = "\roka_D\data\ui\icon_ROKASPEC_D_Clothing_IA.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		hiddenSelections[] = {"camo", "insignia"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Clothing_IA.paa"};
		class ItemInfo: ItemInfo {
			uniformModel = "-";
			uniformClass = "ROKA_D_Arctic_Medic_Soldier_R";
			containerClass = "Supply50";
			mass = 50;
			hiddenSelections[] = {"camo", "insignia"};
		};
	};
	class ROKA_D_Arctic_Uniform_Nato: ROKA_D_Spec_Uniform_Nato {
		author = "KG";
		scope = 2;
		displayName = "ROKA Uniform C [Arctic]";
		picture = "\roka_D\data\ui\icon_ROKASPEC_D_Clothing_IA.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		hiddenSelections[] = {"camo", "insignia"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Clothing_Nato_IA.paa"};
		class ItemInfo: ItemInfo {
			uniformModel = "-";
			uniformClass = "ROKA_D_Arctic_Nato_Soldier_R";
			containerClass = "Supply50";
			mass = 50;
			hiddenSelections[] = {"camo", "insignia"};
		};
	};

	/* class ROKA_D_Arctic_PlateCarrier_IA: ROKA_D_Spec_PlateCarrier_IA {
		author = "KG";
		scope = 2;
		displayName = "ROKA Plate Carrier A [Arctic]";
		picture = "\roka_D\data\ui\icon_ROKADIGI_D_PlateCarrier_IA.paa";
		model = "\A3\Characters_F_Beta\INDEP\equip_ia_vest01";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_PlateCarrier_IA.paa"};
	};
	class ROKA_D_Arctic_PlateCarrier_Rig_IA: ROKA_D_Spec_PlateCarrier_Rig_IA {
		author = "KG";
		scope = 2;
		displayName = "ROKA Plate Carrier B [Arctic] (Rig)";
		picture = "\roka_D\data\ui\icon_ROKADIGI_D_PlateCarrier_IA.paa";
		model = "\A3\Characters_F_Beta\INDEP\equip_ia_vest02";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_PlateCarrier_IA.paa"};
	}; */
	class ROKA_D_Arctic_Nato_PlateCarrier_H_IA: ROKA_D_Spec_Nato_PlateCarrier_H_IA {
		author = "KG";
		scope = 2;
		displayName = "ROKA Plate Carrier D [Arctic] (Heavy)";
		picture = "a3\characters_f\data\ui\icon_v_plate_carrier_2_blk_ca.paa";
		model = "\A3\Characters_F\BLUFOR\equip_b_vest01.p3d";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Nato_PlateCarrier_IA.paa"};
	};
	class ROKA_D_Arctic_Nato_PlateCarrier_IA: ROKA_D_Spec_Nato_PlateCarrier_IA {
		author = "KG";
		scope = 2;
		displayName = "ROKA Plate Carrier C [Arctic]";
		picture = "a3\characters_f\data\ui\icon_v_plate_carrier_2_blk_ca.paa";
		model = "\A3\Characters_F\BLUFOR\equip_b_vest02.p3d";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Nato_PlateCarrier_IA.paa"};
	};

	class ROKA_D_Arctic_Helmet_IA: ROKA_D_Spec_Helmet_IA {
		author = "KG";
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "ROKA Helmet [Arctic]";
		picture = "\roka_D\data\ui\icon_ROKADIGI_D_Helmet_IA.paa";
		model = "\A3\Characters_F_Beta\INDEP\headgear_helmet_canvas.p3d";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Helmet_IA.paa"};
	};
	class ROKA_D_Arctic_Boonie_B: ROKA_D_Boonie_B {
		author = "KG";
		scope = 2;
		displayName = "ROKA Boonie [Arctic]";
		picture = "\A3\characters_f\Data\UI\icon_h_booniehat_ca.paa";
		model = "\A3\Characters_F\Common\booniehat";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Booniehat_IA.paa"};
	};
};

class CfgVehicles {
	class B_AssaultPack_rgr;
	class I_Soldier_base_F;
	class I_medic_F;
	class B_Soldier_F;

	class ROKA_D_Spec_BackPack_Compact_Base: B_AssaultPack_rgr {};
	class ROKA_D_Spec_BackPack_Compact_Medic_Base: B_AssaultPack_rgr {};
	class ROKA_D_Spec_BackPack_Base: B_AssaultPack_rgr {};
	class ROKA_D_Spec_BackPack_Medic_Base: B_AssaultPack_rgr {};

	class ROKA_D_Spec_Soldier_R: I_Soldier_base_F {};
	class ROKA_D_Spec_Medic_Soldier_R: I_medic_F {};
	class ROKA_D_Spec_Nato_Soldier_R: B_Soldier_F {};

	class ROKA_D_Arctic_BackPack_Compact_Base: ROKA_D_Spec_BackPack_Compact_Base {
		author = "KG";
		scope = 2;
		displayName = "ROKA Backpack A [Arctic]";
		model = "\A3\weapons_f\Ammoboxes\bags\Backpack_Compact";
		maximumLoad = 280;
		picture = "\A3\weapons_f\Ammoboxes\bags\data\ui\icon_b_c_compact_rgr_ca.paa";
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Backpack_Compact_IA.paa"};
	};
	class ROKA_D_Arctic_BackPack_Compact_Medic_Base: ROKA_D_Spec_BackPack_Compact_Medic_Base {
		author = "KG";
		scope = 2;
		displayName = "ROKA Backpack A [Arctic] (Medic)";
		model = "\A3\weapons_f\Ammoboxes\bags\Backpack_Compact";
		maximumLoad = 280;
		picture = "\A3\weapons_f\Ammoboxes\bags\data\ui\icon_b_c_compact_rgr_ca.paa";
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Backpack_Compact_Medic_IA.paa"};
	};
	class ROKA_D_Arctic_BackPack_Base: ROKA_D_Spec_BackPack_Base {
		author = "KG";
		scope = 2;
		displayName = "ROKA Backpack B [Arctic]";
		model = "\A3\weapons_f\Ammoboxes\bags\Backpack_Fast";
		maximumLoad = 320;
		picture = "\A3\weapons_f\Ammoboxes\bags\data\ui\icon_b_c_kitbag_mcamo.paa";
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Backpack_IA.paa"};
	};
	class ROKA_D_Arctic_BackPack_Medic_Base: ROKA_D_Spec_BackPack_Medic_Base {
		author = "KG";
		scope = 2;
		displayName = "ROKA Backpack B [Arctic] (Medic)";
		model = "\A3\weapons_f\Ammoboxes\bags\Backpack_Fast";
		maximumLoad = 320;
		picture = "\A3\weapons_f\Ammoboxes\bags\data\ui\icon_b_c_kitbag_mcamo.paa";
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Backpack_Medic_IA.paa"};
	};

	class ROKA_D_Arctic_Soldier_R: ROKA_D_Spec_Soldier_R {
		author = "KG";
		_generalMacro = "ROKA_D_Arctic_Soldier_R";
		scope = 2;
		side = 1;
		faction = "ROKA_D";
		vehicleClass = "ROKA_D_ARCTIC";
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_01";
		uniformClass = "ROKA_D_Arctic_Uniform";
		linkedItems[] = {"ROKA_D_Arctic_PlateCarrier_IA", "ROKA_D_Arctic_Boonie_B", "NVGoggles_INDEP", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
		respawnLinkedItems[] = {"ROKA_D_Arctic_PlateCarrier_IA", "ROKA_D_Arctic_Boonie_B", "NVGoggles_INDEP", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
		weapons[] = {"ROKA_D_WEAPON_MXB_DOT", "Throw", "Put"};
		respawnWeapons[] = {"ROKA_D_WEAPON_MXB_DOT", "Throw", "Put"};
		Items[] = {"FirstAidKit"};
		RespawnItems[] = {"FirstAidKit"};
		magazines[] = {"30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag_Tracer", "HandGrenade", "HandGrenade"};
		respawnMagazines[] = {"30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag_Tracer", "HandGrenade", "HandGrenade"};
		hiddenSelections[] = {"camo", "insignia"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Clothing_IA.paa"};
	};
	class ROKA_D_Arctic_Medic_Soldier_R: ROKA_D_Spec_Medic_Soldier_R {
		author = "KG";
		_generalMacro = "ROKA_D_Arctic_Medic_Soldier_R";
		scope = 2;
		side = 1;
		faction = "ROKA_D";
		vehicleClass = "ROKA_D_ARCTIC";
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02";
		uniformClass = "ROKA_D_Arctic_Uniform_s";
		backpack = "ROKA_D_Arctic_BackPack_Compact_Medic_Base";
		linkedItems[] = {"ROKA_D_Arctic_PlateCarrier_Rig_IA", "ROKA_D_Arctic_Boonie_B", "NVGoggles_INDEP", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
		respawnLinkedItems[] = {"ROKA_D_Arctic_PlateCarrier_Rig_IA", "ROKA_D_Arctic_Boonie_B", "NVGoggles_INDEP", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
		weapons[] = {"ROKA_D_WEAPON_MXB_MRCO", "Throw", "Put"};
		respawnWeapons[] = {"ROKA_D_WEAPON_MXB_MRCO", "Throw", "Put"};
		Items[] = {"FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "Medikit"};
		RespawnItems[] = {"FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "Medikit"};
		magazines[] = {"30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag_Tracer", "HandGrenade", "HandGrenade"};
		respawnMagazines[] = {"30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag_Tracer", "HandGrenade", "HandGrenade"};
		hiddenSelections[] = {"camo", "insignia"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Clothing_IA.paa"};
	};
	class ROKA_D_Arctic_Nato_Soldier_R: ROKA_D_Spec_Nato_Soldier_R {
		author = "KG";
		_generalMacro = "ROKA_D_Arctic_Nato_Soldier_R";
		displayName = "Rifleman (Nato)";
		scope = 2;
		side = 1;
		faction = "ROKA_D";
		vehicleClass = "ROKA_D_ARCTIC";
		model = "\A3\Characters_F\BLUFOR\b_soldier_01";
		uniformClass = "ROKA_D_Arctic_Uniform_Nato";
		backpack = "ROKA_D_Arctic_BackPack_Compact_Medic_Base";
		linkedItems[] = {"ROKA_D_Arctic_PlateCarrier_Rig_IA", "ROKA_D_Arctic_Boonie_B", "NVGoggles_INDEP", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
		respawnLinkedItems[] = {"ROKA_D_Arctic_PlateCarrier_Rig_IA", "ROKA_D_Arctic_Boonie_B", "NVGoggles_INDEP", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
		weapons[] = {"ROKA_D_WEAPON_MXB_MRCO", "Throw", "Put"};
		respawnWeapons[] = {"ROKA_D_WEAPON_MXB_MRCO", "Throw", "Put"};
		Items[] = {"FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "Medikit"};
		RespawnItems[] = {"FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "FirstAidKit", "Medikit"};
		magazines[] = {"30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag_Tracer", "HandGrenade", "HandGrenade"};
		respawnMagazines[] = {"30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag_Tracer", "HandGrenade", "HandGrenade"};
		hiddenSelections[] = {"camo", "insignia"};
		hiddenSelectionsTextures[] = {"\orbis_roka_snow\textures\ROKA_D_Arctic_Clothing_IA.paa"};
	};
};
