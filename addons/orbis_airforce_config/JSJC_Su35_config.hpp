	class JS_JC_SU35: Plane_Base_F {
		class UserActions {
			class ECM_ON {
				displayName = "ECM JAMMER ON";
				position = "pilotcontrol";
				radius = 15;
				shortcut = "User2";
				condition = "player in this and this getvariable ""ECMJAMMER"" == ""yes"";";
				statement = "[this] execVM ""\FIR_AirWeaponSystem_US\Script\ECM\ECM_ON.sqf"";";
				onlyforplayer = "False";
				hideOnUse = 1;
				showWindow = 0;
			};
		};
		class Components: Components {
			/* class SensorsManagerComponent {
				class Components {
					class ActiveRadarSensorComponent: SensorTemplateActiveRadar {
						class AirTarget {
							minRange = 30000;
							maxRange = 30000;
						};
						class GroundTarget {
							minRange = 8000;
							maxRange = 8000;
						};
					};
				};
			};
			class VehicleSystemsDisplayManagerComponentLeft: VehicleSystemsTemplateLeftSensorsPilot {
				class Components: components {
					class SensorDisplay {
						range[]={2000, 4000, 8000, 16000, 32000};
					};
				};
			};
			class VehicleSystemsDisplayManagerComponentRight: VehicleSystemsTemplateRightSensorsPilot {
				class Components: components {
					class SensorDisplay {
						range[]={2000, 4000, 8000, 16000, 32000};
					};
				};
			}; */
			#include "JSJC_FA18_Sensors.hpp"

			class TransportPylonsComponent {
				class Pylons {
					class pylon1 {
						hardpoints[] = {
							/* "O_KAB250_BOMB",
							"O_R73",
							"O_R77",
							"O_KH25",
							"O_BOMB_PYLON",
							"O_MISSILE_PYLON",
							"UNI_SCALPEL",
							"JS_JC_SU35_Pylon",
							"FIR_OPFOR_Combined_HP", */ // AA & AG
							"FIR_OPFOR_AA_HP" // AA Only
						};
					};
					class pylon2: pylon1 {
						hardpoints[] = {"FIR_OPFOR_AA_HP"};
					};
					class pylon3: pylon1 {
						hardpoints[] = {"FIR_OPFOR_AA_HP"};
					};
					class pylon4: pylon1 {
						hardpoints[] = {"FIR_OPFOR_AA_HP"};
					};
					class pylon5: pylon1 {
						hardpoints[] = {"FIR_OPFOR_Combined_HP"};
					};
					class pylon6: pylon1 {
						hardpoints[] = {"FIR_OPFOR_Combined_HP"};
					};
					class pylon7: pylon1 {
						hardpoints[] = {"FIR_OPFOR_Combined_HP"};
					};
					class pylon8: pylon1 {
						hardpoints[] = {"FIR_OPFOR_Combined_HP"};
					};
					class pylon9: pylon1 {
						hardpoints[] = {"FIR_OPFOR_Combined_HP"};
					};
					class pylon10: pylon1 {
						hardpoints[] = {"FIR_OPFOR_Combined_HP"};
					};
					class pylon11: pylon1 {
						hardpoints[] = {"FIR_OPFOR_Combined_HP"};
					};
					class pylon12: pylon1 {
						hardpoints[] = {"FIR_OPFOR_Combined_HP"};
					};
				};
			};
		};
	};