params ["_target", "_actor","_extraParams"];

_part = _extraParams select 0;

switch (_part) do {
	case "LARM": {
		_hasTourn = _target getVariable "SMS_LARM_TOURN";
		_target setVariable ["SMS_LARM_TOURN", !_hasTourn, true];
	};
	case "RARM": {
		_hasTourn = _target getVariable "SMS_RARM_TOURN";
		_target setVariable ["SMS_RARM_TOURN", !_hasTourn, true];
	};
	case "LLEG": {
		_hasTourn = _target getVariable "SMS_LLEG_TOURN";
		_target setVariable ["SMS_LLEG_TOURN", !_hasTourn, true];
	};
	case "RLEG": {
		_hasTourn = _target getVariable "SMS_RLEG_TOURN";
		_target setVariable ["SMS_RLEG_TOURN", !_hasTourn, true];
	};
	default {};
};