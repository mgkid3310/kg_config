	class FIR_F15E_Base: Plane_Fighter_03_base_F {
		/* class Components: Components {
			class TransportPylonsComponent {
				class pylons {
					class pylons1 {
						hardpoints[] = {"FIR_F15E_AA_HP","FIR_MISC"};
						attachment = "FIR_AIM9X_P_1rnd_M";
						priority = 5;
						maxweight = 300;
                        turret[] = {}; 		
						UIposition[] = {0.35,0.0};
					};
					class pylons2: pylons1 {
						hardpoints[] = {"FIR_F15E_AA_HP","FIR_MISC"};
						priority = 4;
						attachment = "FIR_AIM120_P_1rnd_M";
						maxweight = 300;
                        turret[] = {}; 		
						UIposition[] = {0.35,0.1};
					};
					class pylons3: pylons2 {
						hardpoints[] = {"FIR_F15E_AA_HP","FIR_MISC"};
						attachment = "FIR_AIM120_P_1rnd_M";
						maxweight = 300;
                        turret[] = {}; 		
						UIposition[] = {0.35,0.4};
					};
					class pylons4: pylons1 {
						hardpoints[] = {"FIR_F15E_AA_HP","FIR_MISC"};
						attachment = "FIR_AIM9X_P_1rnd_M";
						maxweight = 300;
                        turret[] = {}; 		
						UIposition[] = {0.35,0.5};
					};
					
					class pylons5: pylons1 {
						hardpoints[] = {"FIR_F15E_AA_UNDER_HP","FIR_F15E_AGM_HP","FIR_F15E_SDB_HP","FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_GBU12_P_1rnd_M";
                        turret[] = {}; 						
						priority = 3;						
						maxweight = 1000;
						UIposition[] = {0.05,0.20};
					};	
					class pylons6: pylons5 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_F15E_AG2000_HP","FIR_MISC"};
						attachment = "FIR_Empty_P_1rnd_M";
                        turret[] = {}; 	
						priority = 3;						
						maxweight = 1000;
						UIposition[] = {0.25,0.20};
					};									
					class pylons7: pylons5 {
						hardpoints[] = {"FIR_F15E_AA_UNDER_HP","FIR_F15E_AGM_HP","FIR_F15E_SDB_HP","FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_GBU12_P_1rnd_M";
                        turret[] = {}; 	
						priority = 3;						
						maxweight = 1000;
						UIposition[] = {0.45,0.20};
					};		
					
					class pylons8: pylons5 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_GBU12_P_1rnd_M";
	                    turret[] = {}; 
						priority = 2;						
						maxweight = 500;
						UIposition[] = {0.05,0.15};
					};	
					class pylons9: pylons5 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_Empty_P_1rnd_M";
                        turret[] = {}; 
						priority = 2;						
						maxweight = 500;
						UIposition[] = {0.25,0.15};
					};									
					class pylons10: pylons5 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_GBU12_P_1rnd_M";
                        turret[] = {}; 
						priority = 2;						
						maxweight = 500;
						UIposition[] = {0.45,0.15};
					};								
					
					class pylons11: pylons5 {
						hardpoints[] = {"FIR_F15E_AA_UNDER_HP","FIR_F15E_AGM_HP","FIR_F15E_SDB_HP","FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_GBU12_P_1rnd_M";
                        turret[] = {}; 
						priority = 3;						
						maxweight = 1000;
						UIposition[] = {0.05,0.30};
					};		
					class pylons12: pylons5 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_F15E_AG2000_HP","FIR_MISC"};
						attachment = "FIR_Empty_P_1rnd_M";
                        turret[] = {}; 
						priority = 3;						
						maxweight = 1000;
						UIposition[] = {0.25,0.30};
					};				
					class pylons13: pylons5 {
						hardpoints[] = {"FIR_F15E_AA_UNDER_HP","FIR_F15E_AGM_HP","FIR_F15E_SDB_HP","FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_GBU12_P_1rnd_M";
                        turret[] = {}; 
						priority = 3;						
						maxweight = 1000;
						UIposition[] = {0.45,0.30};
					};				
					
					class pylons14: pylons5 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_GBU12_P_1rnd_M";
                        turret[] = {}; 
						priority = 2;						
						maxweight = 500;
						UIposition[] = {0.05,0.35};
					};		
					class pylons15: pylons5 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_Empty_P_1rnd_M";
                        turret[] = {}; 
						priority = 2;						
						maxweight = 500;
						UIposition[] = {0.25,0.35};
					};				
					class pylons16: pylons5 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_MISC"};
						attachment = "FIR_GBU12_P_1rnd_M";
                        turret[] = {}; 
						priority = 2;						
						maxweight = 500;
						UIposition[] = {0.45,0.35};
					};								
					
					class pylons17: pylons1 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_F15E_AG2000_HP","FIR_F15E_SDB_HP","FIR_F15E_AGM_HP","FIR_F15E_MISC_HP","FIR_MISC"};
						attachment = "FIR_F15E_Fueltank_P_1rnd_M";
                        turret[] = {}; 
						priority = 1;						
						maxweight = 1000;
						UIposition[] = {0.20,0.05};
					};							
					class pylons18: pylons1 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_F15E_AG2000_HP","FIR_F15E_SDB_HP","FIR_F15E_AGM_HP","FIR_F15E_MISC_HP","FIR_MISC"};
						attachment = "FIR_F15E_Fueltank_P_1rnd_M";
                        turret[] = {}; 
						priority = 1;						
						maxweight = 1000;
						UIposition[] = {0.20,0.45};
					};			
					class pylons19: pylons1 {
						hardpoints[] = {"FIR_F15E_AG_HP","FIR_F15E_AG2000_HP","FIR_F15E_SDB_HP","FIR_F15E_MISC_HP","FIR_MISC"};
						attachment = "FIR_F15E_Fueltank_P_1rnd_M";
                        turret[] = {}; 
						priority = 1;						
						maxweight = 1000;
						UIposition[] = {0.20,0.25};
					};								
				};
			};
		}; */

		class UserActions {
			class F15E_Gui_Open {
				condition = "player in this and (((this distance (nearestObject [this, ""FIR_Baseplate""]) < 25) and (damage (nearestObject [this, ""FIR_Baseplate""]) < 1) and (speed this < 1)) or ((this distance (nearestObject [this, ""B_Truck_01_ammo_F""]) < 25) and (damage (nearestObject [this, ""B_Truck_01_ammo_F""]) < 1) and (speed this < 1)) or ((this distance (nearestObject [this, ""Land_TentHangar_V1_F""]) < 25) and (damage (nearestObject [this, ""Land_TentHangar_V1_F""]) < 1) and (speed this < 1)) or ((this distance (nearestObject [this, ""Land_Hangar_F""]) < 25) and (damage (nearestObject [this, ""Land_Hangar_F""]) < 1) and (speed this < 1)) or ((this distance (nearestObject [this, ""B_Slingload_01_Ammo_F""]) < 25) and (damage (nearestObject [this, ""B_Slingload_01_Ammo_F""]) < 1) and (speed this < 1)))";
				showWindow = 0;
			};
		};

		class EventHandlers {
			init = "[_this select 0] execVM '\FIR_F16\sqs\init\init.sqf'; _this spawn orbis_airforce_fnc_F15Loop;";
		};
	};