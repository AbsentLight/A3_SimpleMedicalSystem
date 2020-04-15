if (isServer) then {
	missionNamespace setVariable ["SMS_friendlyFireEnabled", true, true];
	missionNamespace setVariable ["SMS_CONFIG_BANDAGETIME", 5, true];
	missionNamespace setVariable ["SMS_CONFIG_TOURNTIME", 3, true];
	missionNamespace setVariable ["SMS_CONFIG_INJECTTIME", 1, true];
	missionNamespace setVariable ["SMS_CONFIG_BASICAIDTIME", 15, true];
	missionNamespace setVariable ["SMS_CONFIG_ADVAIDTIME", 45, true];
};