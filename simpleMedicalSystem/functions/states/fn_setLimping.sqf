params ["_target", "_mode"];

// Modes
// 0 : Healthy, not limping
// 1 : Limping
// 2 : Medicated

switch (_mode) do {
    case 0: {
		_target setHit ["legs", 0];
		_target setVariable ["SMS_LIMPING", false, true];
		_target setVariable ["SMS_LIMPING_MODE", 0, true];
	};
	case 1: {
		_target setHit ["legs", 1];
		_target setVariable ["SMS_LIMPING", true, true];
		_target setVariable ["SMS_LIMPING_MODE", 1, true];
	};
	case 2: {
		_target setHit ["legs", 0];
		_target setVariable ["SMS_LIMPING", false, true];
		_target setVariable ["SMS_LIMPING_MODE", 2, true];	 
	};
    default {};
};