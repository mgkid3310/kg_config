class CfgVehicles {
	class Plane_Base_F;
	class ffaa_ea_hercules_base: Plane_Base_F {
		armor = 70;
		armorStructural = 5;
		class Hitpoints
		{
			class HitHull 			{armor = 999;	explosionShielding = 0.00; passThrough = 0.01; minimalHit = 1.00; radius = 0.15; material = -1; name = "hit_hull";				visual = "";				depends = "Total";  							};
			class HitAvionics 		{armor = 1.00;	explosionShielding = 0.60; passThrough = 0.01; minimalHit = 0.10; radius = 0.08; material = -1; name = "hit_avionics";			visual = "vis_avionics";	depends = "0";  								};
			class HitEngine_L1 		{armor = 0.50;	explosionShielding = 1.25; passThrough = 0.01; minimalHit = 0.01; radius = 0.07; material = -1; name = "hit_engine_l1";			visual = "vis_engine_l";	depends = "0";  								};
			class HitEngine_L2 		{armor = 0.50;	explosionShielding = 1.25; passThrough = 0.01; minimalHit = 0.01; radius = 0.07; material = -1; name = "hit_engine_l2";			visual = "vis_engine_2";	depends = "0";  								};
			class HitEngine_R1 		{armor = 0.50;	explosionShielding = 1.25; passThrough = 0.01; minimalHit = 0.01; radius = 0.07; material = -1; name = "hit_engine_r1";			visual = "vis_engine_3";	depends = "0";  								};
			class HitEngine_R2 		{armor = 0.50;	explosionShielding = 1.25; passThrough = 0.01; minimalHit = 0.01; radius = 0.07; material = -1; name = "hit_engine_r2";			visual = "vis_engine_4";	depends = "0";  								};
			class HitEngine 		{armor = 999;	explosionShielding = 0.25; passThrough = 0.01; minimalHit = 0.01; radius = 0.01; material = -1; name = "hit_engine_l";			visual = "vis_engine_1";	depends = "(HitEngine_L1 + HitEngine_L1)*0.5";  };
			class HitEngine2 		{armor = 999;	explosionShielding = 0.25; passThrough = 0.01; minimalHit = 0.01; radius = 0.01; material = -1; name = "hit_engine_r";			visual = "vis_engine_3";	depends = "(HitEngine_R1 + HitEngine_R1)*0.5"; 	};
			class HitFuel 			{armor = 0.30;	explosionShielding = 0.20; passThrough = 0.01; minimalHit = 0.05; radius = 0.10; material = -1; name = "hit_fuel_l";			visual = "vis_wing_l";		depends = "0";  								};
			class HitFuel2 			{armor = 0.30;	explosionShielding = 0.20; passThrough = 0.01; minimalHit = 0.05; radius = 0.10; material = -1; name = "hit_fuel_r";			visual = "vis_wing_r";		depends = "0";  								};
			class HitLAileron_link 	{armor = 0.30;	explosionShielding = 0.90; passThrough = 0.01; minimalHit = 0.03; radius = 0.12; material = -1; name = "hit_aileron_link_l";	visual = "";				depends = "0";  								};
			class HitRAileron_link 	{armor = 0.30;	explosionShielding = 0.90; passThrough = 0.01; minimalHit = 0.03; radius = 0.12; material = -1; name = "hit_aileron_link_r";	visual = "";				depends = "0";  								};
			class HitLAileron 		{armor = 0.30;	explosionShielding = 1.60; passThrough = 0.01; minimalHit = 0.03; radius = 0.13; material = -1; name = "hit_aileron_l";			visual = "vis_wing_l";		depends = "HitLAileron_link*0.7";  				};
			class HitRAileron 		{armor = 0.30;	explosionShielding = 1.60; passThrough = 0.01; minimalHit = 0.03; radius = 0.13; material = -1; name = "hit_aileron_r";			visual = "vis_wing_r";		depends = "HitRAileron_link*0.7";				};
			class HitControlRear	{armor = 0.30;	explosionShielding = 0.10; passThrough = 0.01; minimalHit = 0.03; radius = 0.17; material = -1; name = "hit_control_rear";		visual = "";				depends = "0";  								};
			class HitLCElevator 	{armor = 0.30;	explosionShielding = 2.00; passThrough = 0.01; minimalHit = 0.03; radius = 0.12; material = -1; name = "hit_elevator_l";		visual = "vis_elevator_l";	depends = "HitControlRear";						};
			class HitRElevator 		{armor = 0.30;	explosionShielding = 2.00; passThrough = 0.01; minimalHit = 0.03; radius = 0.12; material = -1; name = "hit_elevator_r";		visual = "vis_elevator_r";	depends = "HitControlRear";						};
			class HitLCRudder 		{armor = 0.35;	explosionShielding = 2.00; passThrough = 0.01; minimalHit = 0.02; radius = 0.12; material = -1; name = "hit_rudder";			visual = "vis_rudder";		depends = "HitControlRear";						};

			class HitLFWheel 		{armor = 1.00;	explosionShielding = 1.00; passThrough = 0.01; minimalHit = 0.10; radius = 0.12; material = -1; name = "wheel_1_1";				visual = "wheel_1_1";		depends = "0";									};
			class HitLF2Wheel 		{armor = 1.00;	explosionShielding = 1.00; passThrough = 0.01; minimalHit = 0.10; radius = 0.12; material = -1; name = "wheel_2_1";				visual = "wheel_2_1";		depends = "0";									};
			class HitLRF2Wheel 		{armor = 1.00;	explosionShielding = 1.00; passThrough = 0.01; minimalHit = 0.10; radius = 0.12; material = -1; name = "wheel_2_2";				visual = "wheel_2_2";		depends = "0";									};
			class HitLBWheel 		{armor = 1.00;	explosionShielding = 1.00; passThrough = 0.01; minimalHit = 0.10; radius = 0.12; material = -1; name = "wheel_3_1";				visual = "wheel_3_1";		depends = "0";									};
			class HitRBWheel 		{armor = 1.00;	explosionShielding = 1.00; passThrough = 0.01; minimalHit = 0.10; radius = 0.12; material = -1; name = "wheel_3_2";				visual = "wheel_3_2";		depends = "0";									};
		};
	};
	/* class UserActions {
		class OpenRamp {
			displayName = "Open Ramp";
		};
		class CloseRamp: OpenRamp {
			displayName = "Close Ramp";
		};
		class OpenLdoor {
			displayName = "Open Pilot Door";
		};
		class Closeldoor: OpenLdoor {
			displayName = "close Pilot Door";
		};
	}; */
};
