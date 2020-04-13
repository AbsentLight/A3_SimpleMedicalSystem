params ["_target", "_part"];

_return = false;

switch (_part) do {
    case "LARM": {
		_return 		= _target getVariable "SMS_LARM_TOURN";
	};
    case "RARM": {
		_return 		= _target getVariable "SMS_RARM_TOURN";
	};
	case "LLEG": {
		_return 		= _target getVariable "SMS_LLEG_TOURN";
	};
    case "RLEG": {
		_return 		= _target getVariable "SMS_RLEG_TOURN";
	};
    default {};
};
_return
