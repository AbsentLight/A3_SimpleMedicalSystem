params ["_target", "_actor","_extraParams"];

_part = _extraParams select 0;

switch (_part) do {
	case "HEAD": {
		_bleed = _target getVariable "SMS_HEAD_BLEED";
		_bleed = (_bleed - 1) max 0;
		_target setVariable ["SMS_HEAD_BLEED", _bleed, true];
	};
	case "BODY": {
		_bleed = _target getVariable "SMS_BODY_BLEED";
		_bleed = (_bleed - 1) max 0;
		_target setVariable ["SMS_BODY_BLEED", _bleed, true];
	};
	case "LARM": {
		_bleed = _target getVariable "SMS_LARM_BLEED";
		_bleed = (_bleed - 1) max 0;
		_target setVariable ["SMS_LARM_BLEED", _bleed, true];
	};
	case "RARM": {
		_bleed = _target getVariable "SMS_RARM_BLEED";
		_bleed = (_bleed - 1) max 0;
		_target setVariable ["SMS_RARM_BLEED", _bleed, true];
	};
	case "LLEG": {
		_bleed = _target getVariable "SMS_LLEG_BLEED";
		_bleed = (_bleed - 1) max 0;
		_target setVariable ["SMS_LLEG_BLEED", _bleed, true];
	};
	case "RLEG": {
		_bleed = _target getVariable "SMS_RLEG_BLEED";
		_bleed = (_bleed - 1) max 0;
		_target setVariable ["SMS_RLEG_BLEED", _bleed, true];
	};
	default {};
};