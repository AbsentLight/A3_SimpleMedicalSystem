params ["_target"];

_blood 			= _target getVariable "SMS_BLOOD";
_bloodMod 		= _target getVariable "SMS_BLOOD_MOD";
_bloodModCap	= _target getVariable "SMS_BLOOD_MOD_CAP";

_return = true;

if (_bloodModCap > 0) then {_return = false};
if (_bloodMod > 100) then {_return = false};
if (_blood > 800) then {_return = false};

_return