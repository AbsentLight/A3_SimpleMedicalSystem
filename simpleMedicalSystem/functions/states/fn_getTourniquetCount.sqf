params ["_target"];

_count = 0;

_inc = {
	params ["_var", "_count"];
	if (_target getVariable _var) then {
		_count = _count + 1;
	};
	_count
};

_count = ["SMS_RARM_TOURN", _count] call _inc;
_count = ["SMS_LARM_TOURN", _count] call _inc;
_count = ["SMS_RLEG_TOURN", _count] call _inc;
_count = ["SMS_LLEG_TOURN", _count] call _inc;
_count = ["SMS_RLEG_TOURN", _count] call _inc;
_count = ["SMS_LLEG_TOURN", _count] call _inc;
_count