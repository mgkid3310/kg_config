class Medical {
    class ACE_ArmLeft {
        // Advanced medical
        class FieldDressing;
        class samSplint: fieldDressing {
            displayName = "$STR_kg_optic_medical_config_apply_samSplint";
            condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(canTreatCached));
            exceptions[] = {"isNotInside", "isNotSwimming"};
            statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(treatment));
            icon = QPATHTOF(UI\icons\tourniquet.paa);
        };
    };
    class ACE_ArmRight {
        // Advanced medical
        class FieldDressing;
        class samSplint: fieldDressing {
            displayName = "$STR_kg_optic_medical_config_apply_samSplint";
            condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(canTreatCached));
            exceptions[] = {"isNotInside", "isNotSwimming"};
            statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(treatment));
            icon = QPATHTOF(UI\icons\tourniquet.paa);
        };
    };
    class ACE_LegLeft {
        // Advanced medical
        class FieldDressing;
        class samSplint: fieldDressing {
            displayName = "$STR_kg_optic_medical_config_apply_samSplint";
            condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(canTreatCached));
            exceptions[] = {"isNotInside", "isNotSwimming"};
            statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(treatment));
            icon = QPATHTOF(UI\icons\tourniquet.paa);
        };
    };
    class ACE_LegRight {
        // Advanced medical
        class FieldDressing;
        class samSplint: fieldDressing {
            displayName = "$STR_kg_optic_medical_config_apply_samSplint";
            condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(canTreatCached));
            exceptions[] = {"isNotInside", "isNotSwimming"};
            statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(treatment));
            icon = QPATHTOF(UI\icons\tourniquet.paa);
        };
    };
};
