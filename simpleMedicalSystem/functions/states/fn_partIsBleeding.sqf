params ["_target", "_part"];

_return = false;

switch (_part) do {
    case "HEAD": {
		_return 		= _target getVariable "SMS_HEAD_BLEED";
	};
    case "BODY": {
		_return 		= _target getVariable "SMS_BODY_BLEED";
	};
    case "LARM": {
		_return 		= _target getVariable "SMS_LARM_BLEED";
	};
    case "RARM": {
		_return 		= _target getVariable "SMS_RARM_BLEED";
	};
	case "LLEG": {
		_return 		= _target getVariable "SMS_LLEG_BLEED";
	};
    case "RLEG": {
		_return 		= _target getVariable "SMS_RLEG_BLEED";
	};
    default {};
};
_return




