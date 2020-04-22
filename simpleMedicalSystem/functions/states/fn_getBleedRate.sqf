params ["_target"];

_count = 0;

_inc = {
	params ["_varBleed", "_varTourn", "_count"] ;
	if (_target getVariable _varTourn) then {
		_count = _count + 1;
	} else {
		_count = _count + (_target getVariable _varBleed);
	};
	_count
};

// Max rate is 6*3 => 18

_count = ["SMS_HEAD_BLEED", "SMS_HEAD_TOURN", _count] call _inc;
_count = ["SMS_BODY_BLEED", "SMS_BODY_TOURN", _count] call _inc;
_count = ["SMS_RARM_BLEED", "SMS_RARM_TOURN", _count] call _inc;
_count = ["SMS_LARM_BLEED", "SMS_LARM_TOURN", _count] call _inc;
_count = ["SMS_RLEG_BLEED", "SMS_RLEG_TOURN", _count] call _inc;
_count = ["SMS_LLEG_BLEED", "SMS_LLEG_TOURN", _count] call _inc;
_count