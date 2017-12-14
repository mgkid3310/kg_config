class CfgAmmo {
	class Missile_AGM_02_F;

	class rhs_ammo_Hellfire_AT: Missile_AGM_02_F {
		maverickWeaponIndexOffset = 80;
		airLock = 0;
		irLock = 0;
		laserLock = 0;
		nvLock = 0;
		maxControlRange = 10000;
		missileLockCone = 50;
		missileKeepLockedCone = 50;
		missileLockMaxDistance = 10000;
		missileLockMinDistance = 350;
		missileLockMaxSpeed = 55;
		weaponLockSystem = 8;
	};
	class RHS_ammo_AGM_114K: rhs_ammo_Hellfire_AT {
		maverickWeaponIndexOffset = 80;
		airLock = 0;
		irLock = 0;
		laserLock = 1;
		nvLock = 0;
		maxControlRange = 8000;
		missileLockCone = 50;
		missileKeepLockedCone = 50;
		missileLockMaxDistance = 8000;
		missileLockMinDistance = 350;
		missileLockMaxSpeed = 55;
		weaponLockSystem = 4;
	};
	class RHS_ammo_AGM_114M: RHS_ammo_AGM_114K {
		maverickWeaponIndexOffset = 80;
		airLock = 0;
		irLock = 0;
		laserLock = 1;
		nvLock = 0;
		maxControlRange = 8000;
		missileLockCone = 50;
		missileKeepLockedCone = 50;
		missileLockMaxDistance = 8000;
		missileLockMinDistance = 350;
		missileLockMaxSpeed = 55;
		weaponLockSystem = 4;
	};
	class RHS_ammo_AGM_114N: RHS_ammo_AGM_114M {
		maverickWeaponIndexOffset = 80;
		airLock = 0;
		irLock = 0;
		laserLock = 1;
		nvLock = 0;
		maxControlRange = 8000;
		missileLockCone = 50;
		missileKeepLockedCone = 50;
		missileLockMaxDistance = 8000;
		missileLockMinDistance = 350;
		missileLockMaxSpeed = 55;
		weaponLockSystem = 4;
	};
	class RHS_MELB_AGM_114K: RHS_ammo_AGM_114K {
		maverickWeaponIndexOffset = 80;
		airLock = 0;
		irLock = 0;
		laserLock = 1;
		nvLock = 0;
		maxControlRange = 8000;
		missileLockCone = 50;
		missileKeepLockedCone = 50;
		missileLockMaxDistance = 8000;
		missileLockMinDistance = 350;
		missileLockMaxSpeed = 55;
		weaponLockSystem = 4;
	};
};
/*
class CfgWeapons{
	class Missile_AGM_02_Plane_CAS_01_F;

	class rhs_weap_HellfireLauncher: Missile_AGM_02_Plane_CAS_01_F {
		cursorAim = "EmptyCursor";
		showAimCursorInternal = false;
		weaponLockDelay = 3.000000;
		weaponLockSystem = 8;
	};

	class RHS_weap_AGM114K_Launcher: rhs_weap_HellfireLauncher {
		cursorAim = "EmptyCursor";
		showAimCursorInternal = false;
		weaponLockDelay = 3.000000;
		weaponLockSystem = 4;
	};

	class RHS_weap_AGM114M_Launcher: rhs_weap_HellfireLauncher {
		cursorAim = "EmptyCursor";
		showAimCursorInternal = false;
		weaponLockDelay = 3.000000;
		weaponLockSystem = 4;
	};

	class RHS_weap_AGM114N_Launcher: rhs_weap_HellfireLauncher {
		cursorAim = "EmptyCursor";
		showAimCursorInternal = false;
		weaponLockDelay = 3.000000;
		weaponLockSystem = 4;
	};

	class RHS_MELB_Hellfire: rhs_weap_HellfireLauncher {
		cursorAim = "EmptyCursor";
		showAimCursorInternal = false;
		weaponLockDelay = 3.000000;
		weaponLockSystem = 4;
	};
};
*/
class SensorTemplateIR;

class CfgVehicles {
	class Air;
	class Helicopter: Air {};
	class Helicopter_Base_F: Helicopter {
		class components;
	};
	class Heli_Attack_01_base_F: Helicopter_Base_F {};

	class RHS_AH64_base: Heli_Attack_01_base_F {
		class components: components {
			class SensorManagerComponent {
				class Components {
					class IRSensorComponent: SensorTemplateIR {
						class AirTarget {
							minRange = 100;
							maxRange = 10000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
						class GroundTarget {
							minRange = 100;
							maxRange = 10000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
						maxTrackableSpeed = 35;
						angleRangeHorizontal = 90;
						angleRangeVertical = 70;
					};
				};
			};
		};
	};
};
