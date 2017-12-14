_array = _this;
_heli = _this select 0;
_position = _this select 1;
_unit = _this select 2;

if (local _unit) then {
	if (_position == "gunner" || _position == "driver") then {
		if (_unit == player) then {
			if (isNil "fza_ah64_cem") then {
				fza_ah64_cem = true;
			};
			if (fza_ah64_cem) then {
				fza_ah64_pl_mpd = "off";
				fza_ah64_pr_mpd = "off";
				fza_ah64_ihadssoff = 1;
				if (_position == "driver") then {
					sleep 0.1;
					if (isengineon _heli) then {
						_fuelsave = fuel _heli;
						_heli setfuel 0;
						fza_ah64_fuelsave = 0;
						player action ["EngineOff",_heli];
						sleep 0.5;
						player action ["EngineOff",_heli];
						fza_ah64_fuelsave = _fuelsave;
					};
				};
				2 cutrsc ["fza_ah64_click_helper", "PLAIN",0.1];
			} else {
				fza_ah64_pl_mpd = "fuel";
				fza_ah64_pr_mpd = "eng";
			};
			fza_ah64_guncontrol = 0;
			//fza_ah64_fuelsave = fuel _heli;
			fza_ah64_estarted = false;
			_heli removeweapon "fza_m230";
			_heli addweapon "fza_burstlimiter";
			sleep 0.1;
			_heli removeweapon "fza_burstlimiter";
			sleep 0.1;
			_heli addweapon "fza_m230";
			_heli selectweapon "fza_m230";
			fza_ah64_hfmode = _heli;
			fza_ah64_guncontrol = 0;
			if (_heli iskindof "fza_ah64a_l" || _heli iskindof "fza_ah64a_e" || _heli iskindof "fza_ah64d_b2e_nr" || _heli iskindof "fza_ah64d_b2exp_nr" || _heli iskindof "fza_ah64d_b3_nr") then {
				fza_ah64_agmode = 2;
			} else {
				fza_ah64_agmode = 0;
			};
		};
	};
};
