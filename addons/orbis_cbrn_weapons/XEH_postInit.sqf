if (hasInterface) then {
	[player] spawn orbis_cbrn_playerLoop;
};

if (isServer) then {
	spawn orbis_cbrn_serverLoop;
};
