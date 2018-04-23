	class FIR_F15E_Base: Plane_Fighter_03_base_F {
		receiveRemoteTargets = true;
		reportRemoteTargets = true;
		reportOwnPosition = true;

		class UserActions {
			class F15E_Gui_Open {
				condition = "player in this and (((this distance (nearestObject [this, ""FIR_Baseplate""]) < 25) and (damage (nearestObject [this, ""FIR_Baseplate""]) < 1) and (speed this < 1)) or ((this distance (nearestObject [this, ""B_Truck_01_ammo_F""]) < 25) and (damage (nearestObject [this, ""B_Truck_01_ammo_F""]) < 1) and (speed this < 1)) or ((this distance (nearestObject [this, ""Land_TentHangar_V1_F""]) < 25) and (damage (nearestObject [this, ""Land_TentHangar_V1_F""]) < 1) and (speed this < 1)) or ((this distance (nearestObject [this, ""Land_Hangar_F""]) < 25) and (damage (nearestObject [this, ""Land_Hangar_F""]) < 1) and (speed this < 1)) or ((this distance (nearestObject [this, ""B_Slingload_01_Ammo_F""]) < 25) and (damage (nearestObject [this, ""B_Slingload_01_Ammo_F""]) < 1) and (speed this < 1)))";
				showWindow = 0;
			};
		};

		class Turrets {
			class MainTurret: NewTurret {
				// isCopilot = 0;
				primaryGunner = 0;

				class Components: Components {
					class VehicleSystemsDisplayManagerComponentLeft: VehicleSystemsTemplateLeftSensorsPilot {
						class Components: components {
							class SensorDisplay {
								componentType = "SensorsDisplayComponent";
								resource = "RscCustomInfoSensors";
								range[] = {2000, 4000, 8000, 16000, 30000};
							};
						};
					};
					class VehicleSystemsDisplayManagerComponentRight: VehicleSystemsTemplateRightSensorsPilot {
						class Components: components {
							class SensorDisplay {
								componentType = "SensorsDisplayComponent";
								resource = "RscCustomInfoSensors";
								range[] = {2000, 4000, 8000, 16000, 30000};
							};
						};
					};
				};
			};
		};

		class EventHandlers {
			// init = "[_this select 0] execVM '\FIR_F16\sqs\init\init.sqf'";
			class orbis_config {
				init = "_this spawn orbis_airforce_fnc_F15EInit;";
			};
		};
	};
