params ["_target", "_actor","_extraParams"];

// Cure limp
[_target, 0] call SMS_fnc_setLimping;

// Pain reduction
_pain = _target getVariable "SMS_PAIN";
_pain = (_pain - 400) max 0;
_target setVariable ["SMS_PAIN", _pain, true];

// Minor blood increase
_blood = _target getVariable "SMS_BLOOD";
_blood = (_blood + 100) min 1200;
_target setVariable ["SMS_BLOOD", _blood, true];