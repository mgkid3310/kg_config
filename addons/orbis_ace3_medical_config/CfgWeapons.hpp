class CfgWeapons {
	class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;

	// config existing items
	class ACE_bodyBag: ACE_ItemCore {
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 2.5;
		};
	};

	// add new items
	class orbis_samSplint: ACE_ItemCore {
		scope = 2;
		author = "Orbis2358";
		displayName = "$STR_kg_optic_medical_config_samSplint_display";
		picture = QPATHTOF(ui\items\tourniquet_x_ca.paa);
		model = QPATHTOF(data\tourniquet.p3d);
		descriptionShort = "$STR_kg_optic_medical_config_samSplint_short";
		descriptionUse = "$STR_kg_optic_medical_config_samSplint_use";
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 2;
		};
	};
	class orbis_orthopedicCast: ACE_ItemCore {
		scope = 2;
		author = "Orbis2358";
		displayName = "$STR_kg_optic_medical_config_orthopedicCast_display";
		picture = QPATHTOF(ui\items\tourniquet_x_ca.paa);
		model = QPATHTOF(data\tourniquet.p3d);
		descriptionShort = "$STR_kg_optic_medical_config_orthopedicCast_short";
		descriptionUse = "$STR_kg_optic_medical_config_orthopedicCast_use";
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 5;
		};
	};
};
