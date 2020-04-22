params ["_target", "_actor","_extraParams"];

// Cure limp
[_target, 0] call SMS_fnc_setLimping;

// Remove medication
_target setVariable ["SMS_PAIN_MOD", 0, true];
_target setVariable ["SMS_PAIN_MOD_CAP", 0, true];
_target setVariable ["SMS_BLOOD_MOD", 0, true];
_target setVariable ["SMS_BLOOD_MOD_CAP", 0, true];

// Pain reset
_target setVariable ["SMS_PAIN", 0, true];

// Blood reset
_target setVariable ["SMS_BLOOD", 1200, true];