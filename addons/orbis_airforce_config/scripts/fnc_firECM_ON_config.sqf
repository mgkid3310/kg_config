/* ECM ON System By Firewill */

private ["_ecm_type","_plane","_ecm","_mag","_jammer_c","_ex_time","_ex_cool"];

_plane = _this select 0;

_ecm = "";
_ecm_type = "internal";
_jammer_c = 0;
_ex_time = 120;
_ex_cool = 60;

_plane setVariable ["ECMJAMMER","no",true];

_pylon = GetPylonMagazines _plane;
_pylon_count = count _pylon;

	for "_i" from 0 to _pylon_count-1 do
	{
	_mag = _pylon select _i;
	_ecm = getNumber (configFile >> "CfgMagazines" >> _mag >> "AWS_ECMJAMMER");

		if (_ecm == 1) then
		{
			_ecm_type = "external";
			_jammer_c = _jammer_c + 1;
		};
	}; 
	
hintSilent "SYSTEM : ECM JAMMER ON";

_ecmhandle = _plane addEventHandler ["incomingMissile", {[_this] execVM "\FIR_AirWeaponSystem_US\script\ECM\ECM.sqf"}];

if (_ecm_type == "external") then
{
	hintSilent "SYSTEM : EXTERNAL ECM SYSTEM";
	_ex_time = _ex_time + (10 *_jammer_c);
	sleep _ex_time;
}
else
{	
	hintSilent "SYSTEM : INTERNAL ECM SYSTEM";
	sleep 60;
};

_plane removeEventHandler ["incomingMissile", _ecmhandle];

if (_ecm_type == "external") then
{
	_ex_cool = _ex_cool - (7 * _jammer_c);
	hintSilent  format ["SYSTEM : ECM IS OFF. STANDBY FOR RECHARGING in %1SEC",_ex_cool];
	sleep _ex_cool;
}
else
{	
	_plane vehiclechat "SYSTEM : ECM IS OFF. STANDBY FOR RECHARGING in 40SEC";
	sleep 40;
};

_plane setVariable ["ECMJAMMER","yes",true];
hintSilent "SYSTEM : ECM IS STANDBY.";
