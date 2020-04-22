params ["_target"];

_pain = _target getVariable "SMS_PAIN";
_painMod = _target getVariable "SMS_PAIN_MOD";
_painTemp = _target getVariable "SMS_PAIN_TEMP";

_relPain = ((_pain + _painTemp) - _painMod) max 0;

_relPain