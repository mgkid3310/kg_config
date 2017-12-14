//***************************************************************
// BULLET PROOF CERTIFICATE CHART FROM RHS VER.0.4.1.1
//***************************************************************
// NIJ 0101.04
//
// I 		.380 ACP FMJ
// II-A 	9mm FMJ / .40 FMJ
// II 		9mm FMJ / .357 JSP
// III-A 	9mm FMJ / .44 SJHP
// III 	7.62mm FMJ (9,6g 148gr.)
// IV 		.30 M2 AP
//***************************************************************


//***************************************************************
// BULLET PROOF VALUE AS OF 2016.12.25
//***************************************************************

#define ARMOR_NIJ_1 9
#define ARMOR_NIJ_2 13
#define ARMOR_NIJ_3 23
#define ARMOR_NIJ_4 29

#define PASS_NIJ_1 0.5
#define PASS_NIJ_2 0.4
#define PASS_NIJ_3 0.2
#define PASS_NIJ_4 0.1

#define ARMOR_EQUIP 3
#define PASS_EQUIP 0.6

//***************************************************************

#define LEVEL_HELMET "Armor Level III-A"
#define LEVEL_BOONIE "Armor Level I"
#define LEVEL_BERET "Armor Level I"

#define ARMOR_HELMET 18
#define ARMOR_BOONIE ARMOR_NIJ_1
#define ARMOR_BERET PASS_NIJ_1

#define PASS_HELMET 0.3
#define PASS_BOONIE PASS_NIJ_1
#define PASS_BERET PASS_NIJ_1

#define CAPACITY_A 160
#define CAPACITY_B 320

//***************************************************************

class CfgWeapons {
	class ItemCore;
	class HeadgearItem;
	class ROKA_D_Helmet_IA: ItemCore {
		descriptionShort = LEVEL_HELMET;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_HELMET;
					PassThrough = PASS_HELMET;
				};
			};
		};
	};
	class ROKA_D_Digi_Helmet_IA: ItemCore {
		descriptionShort = LEVEL_HELMET;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_HELMET;
					PassThrough = PASS_HELMET;
				};
			};
		};
	};
	class ROKA_D_Spec_Helmet_IA: ItemCore {
		descriptionShort = LEVEL_HELMET;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_HELMET;
					PassThrough = PASS_HELMET;
				};
			};
		};
	};
	class ROKA_D_Desert_Helmet_IA: ItemCore {
		descriptionShort = LEVEL_HELMET;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_HELMET;
					PassThrough = PASS_HELMET;
				};
			};
		};
	};
	class ROKA_D_MC_Helmet_IA: ItemCore {
		descriptionShort = LEVEL_HELMET;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_HELMET;
					PassThrough = PASS_HELMET;
				};
			};
		};
	};
	class ROKA_D_Spec_Black_Helmet_IA: ItemCore {
		descriptionShort = LEVEL_HELMET;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_HELMET;
					PassThrough = PASS_HELMET;
				};
			};
		};
	};
	class ROKA_D_Boonie_B: ItemCore {
		descriptionShort = LEVEL_BOONIE;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_BOONIE;
					PassThrough = PASS_BOONIE;
				};
			};
		};
	};
	class ROKA_D_Boonie_Desert_B: ItemCore {
		descriptionShort = LEVEL_BOONIE;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_BOONIE;
					PassThrough = PASS_BOONIE;
				};
			};
		};
	};
	class ROKA_D_Boonie_Digi_B: ItemCore {
		descriptionShort = LEVEL_BOONIE;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_BOONIE;
					PassThrough = PASS_BOONIE;
				};
			};
		};
	};
	class ROKA_D_Boonie_Frog_B: ItemCore {
		descriptionShort = LEVEL_BOONIE;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_BOONIE;
					PassThrough = PASS_BOONIE;
				};
			};
		};
	};
	class ROKA_D_Boonie_MC_B: ItemCore {
		descriptionShort = LEVEL_BOONIE;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_BOONIE;
					PassThrough = PASS_BOONIE;
				};
			};
		};
	};
	class ROKA_D_Beret_Spec_B: ItemCore {
		descriptionShort = LEVEL_BERET;
		class ItemInfo: HeadgearItem {
			class HitpointsProtectionInfo {
				class head {
					hitpointName = "HitHead";
					armor = ARMOR_BERET;
					PassThrough = PASS_BERET;
				};
			};
		};
	};
};

class CfgVehicles {
	class Bag_Base;
	class ROKA_D_BackPack_Compact_Base: Bag_Base {
		maximumLoad = CAPACITY_A;
	};
	class ROKA_D_Spec_BackPack_Compact_Base: Bag_Base {
		maximumLoad = CAPACITY_A;
	};
	class ROKA_D_Desert_BackPack_Compact_Base: Bag_Base {
		maximumLoad = CAPACITY_A;
	};
	class ROKA_D_MC_BackPack_Compact_Base: Bag_Base {
		maximumLoad = CAPACITY_A;
	};
	class ROKA_D_BackPack_Compact_Medic_Base: Bag_Base {
		maximumLoad = CAPACITY_A;
	};
	class ROKA_D_Spec_BackPack_Compact_Medic_Base: Bag_Base {
		maximumLoad = CAPACITY_A;
	};
	class ROKA_D_Desert_BackPack_Compact_Medic_Base: Bag_Base {
		maximumLoad = CAPACITY_A;
	};
	class ROKA_D_MC_BackPack_Compact_Medic_Base: Bag_Base {
		maximumLoad = CAPACITY_A;
	};
	class ROKA_D_Frog_BackPack_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
	class ROKA_D_BackPack_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
	class ROKA_D_BackPack_Medic_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
	class ROKA_D_SPEC_BackPack_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
	class ROKA_D_SPEC_BackPack_Medic_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
	class ROKA_D_Desert_BackPack_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
	class ROKA_D_Desert_BackPack_Medic_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
	class ROKA_D_MC_BackPack_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
	class ROKA_D_MC_BackPack_Medic_Base: Bag_Base {
		maximumLoad = CAPACITY_B;
	};
};
