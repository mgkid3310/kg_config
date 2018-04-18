class ACE_ArmLeft {
    // Advanced medical
    class FieldDressing;
    class samSplint: fieldDressing {
        displayName = "$STR_kg_optic_medical_config_apply_samSplint";
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'SAMSplint')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOF(UI\icons\tourniquet.paa);
    };
    class orthopedicCast: fieldDressing {
        displayName = "$STR_kg_optic_medical_config_apply_orthopedicCast";
        condition = QUOTE([ARR_4(_player, _target, 'hand_l', 'OrthopedicCast')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_l', 'OrthopedicCast')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOF(UI\icons\tourniquet.paa);
    };
};
class ACE_ArmRight {
    // Advanced medical
    class FieldDressing;
    class samSplint: fieldDressing {
        displayName = "$STR_kg_optic_medical_config_apply_samSplint";
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'SAMSplint')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'SAMSplint')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOF(UI\icons\tourniquet.paa);
    };
    class orthopedicCast: fieldDressing {
        displayName = "$STR_kg_optic_medical_config_apply_orthopedicCast";
        condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'OrthopedicCast')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'OrthopedicCast')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOF(UI\icons\tourniquet.paa);
    };
};
class ACE_LegLeft {
    // Advanced medical
    class FieldDressing;
    class samSplint: fieldDressing {
        displayName = "$STR_kg_optic_medical_config_apply_samSplint";
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'SAMSplint')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'SAMSplint')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOF(UI\icons\tourniquet.paa);
    };
    class orthopedicCast: fieldDressing {
        displayName = "$STR_kg_optic_medical_config_apply_orthopedicCast";
        condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'OrthopedicCast')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'OrthopedicCast')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOF(UI\icons\tourniquet.paa);
    };
};
class ACE_LegRight {
    // Advanced medical
    class FieldDressing;
    class samSplint: fieldDressing {
        displayName = "$STR_kg_optic_medical_config_apply_samSplint";
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'SAMSplint')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'SAMSplint')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOF(UI\icons\tourniquet.paa);
    };
    class orthopedicCast: fieldDressing {
        displayName = "$STR_kg_optic_medical_config_apply_orthopedicCast";
        condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'OrthopedicCast')] call DFUNC(canTreatCached));
        statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'OrthopedicCast')] call DFUNC(treatment));
        EXCEPTIONS
        icon = QPATHTOF(UI\icons\tourniquet.paa);
    };
};
