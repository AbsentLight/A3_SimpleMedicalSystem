params ["_target"];

_pain 			= _target getVariable "SMS_PAIN";
_painMod 		= _target getVariable "SMS_PAIN_MOD";
_painModCap		= _target getVariable "SMS_PAIN_MOD_CAP";

_return = true;

if (_painModCap > 0) then {_return = false};
if (_painMod > 100) then {_return = false};
if (_pain < 400) then {_return = false};

_return